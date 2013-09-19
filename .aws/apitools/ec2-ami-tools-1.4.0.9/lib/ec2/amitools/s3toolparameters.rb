# Copyright 2008-2009 Amazon.com, Inc. or its affiliates.  All Rights
# Reserved.  Licensed under the Amazon Software License (the
# "License").  You may not use this file except in compliance with the
# License. A copy of the License is located at
# http://aws.amazon.com/asl or in the "license" file accompanying this
# file.  This file is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See
# the License for the specific language governing permissions and
# limitations under the License.

require 'ec2/amitools/parameters_base'

#------------------------------------------------------------------------------#

class S3ToolParameters < ParametersBase

  BUCKET_DESCRIPTION = ["The bucket to use. This is an S3 bucket,",
                        "followed by an optional S3 key prefix using '/' as a delimiter."]
  MANIFEST_DESCRIPTION = "The path to the manifest file."
  DELEGATION_TOKEN_DESCRIPTION = "The delegation token pass along to the AWS request."
  URL_DESCRIPTION = "The S3 service URL. Defaults to https://s3.amazonaws.com."
  PROFILE_PATH = '/latest/meta-data/iam/security-credentials/'
  PROFILE_HOST = '169.254.169.254'

  attr_accessor :bucket,
                :keyprefix,
                :user,      # This now contains all the creds.
                :pass,      # pass is just kept for backwards compatibility.
                :url

  #------------------------------------------------------------------------------#

  def split_container(container)
    splitbits = container.sub(%r{^/*},'').sub(%r{/*$},'').split("/")
    bucket = splitbits.shift
    keyprefix = splitbits.join("/")
    keyprefix += "/" unless keyprefix.empty?
    @keyprefix = keyprefix
    @bucket = bucket
  end
  
  #----------------------------------------------------------------------------#

  def mandatory_params()
    on('-b', '--bucket BUCKET', String, *BUCKET_DESCRIPTION) do |container|
      @container = container
      split_container(@container)
    end
    
    on('-a', '--access-key USER', String, USER_DESCRIPTION) do |user|
      @user = {} if @user.nil?
      @user['aws_access_key_id'] = user
    end
    
    on('-s', '--secret-key PASSWORD', String, PASS_DESCRIPTION) do |pass|
      @user = {} if @user.nil?
      @user['aws_secret_access_key'] = pass
      @pass = pass
    end
    
    on('-t', '--delegation-token TOKEN', String, DELEGATION_TOKEN_DESCRIPTION) do |token|
      @user = {} if @user.nil?
      @user['aws_delegation_token'] = token
    end
  end

  #----------------------------------------------------------------------------#

  def optional_params()
    on('--url URL', String, URL_DESCRIPTION) do |url|
      @url = url
    end
  end

  #----------------------------------------------------------------------------#

  def get_creds_from_instance_profile
  end

  def get_creds_from_instance_profile
    begin
      require 'json'
      require 'net/http'
      profile_name = Net::HTTP.get(PROFILE_HOST, PROFILE_PATH)
      unless (profile_name.nil? || profile_name.strip.empty?)
        creds_blob = Net::HTTP.get(PROFILE_HOST, PROFILE_PATH + profile_name.strip)
        creds = JSON.parse(creds_blob)
        @user = {
          'aws_access_key_id' => creds['AccessKeyId'],
          'aws_secret_access_key' => creds['SecretAccessKey'],
          'aws_delegation_token' => creds['Token'],
        }
        @pass = creds['SecretAccessKey']
      end
    rescue Exception => e
      @user = nil
    end
  end

  def validate_params()
    unless @user
        get_creds_from_instance_profile
    end
    raise MissingMandatory.new('--access-key') unless @user && @user['aws_access_key_id']
    raise MissingMandatory.new('--secret-key') unless @pass
    raise MissingMandatory.new('--bucket') unless @container
  end

  #----------------------------------------------------------------------------#

  def set_defaults()
    @url ||= 'https://s3.amazonaws.com'
  end

end
