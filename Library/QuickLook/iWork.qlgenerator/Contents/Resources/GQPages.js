function moveAttachment(id)
{
    var attId = "attPlaceholder-" + id;
    var tableId = "tableAtt-" + id;
    
	var table = document.getElementById(tableId);
	var att = document.getElementById(attId);
	if (table && att)
	{
		att.parentNode.replaceChild(table, att);
	}
}
