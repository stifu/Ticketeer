<?php $SQLmanager = new SQLmanager(); ?>
<div id="companytable">
    
    <br />
    
    <form method="post" action="?pageid=maketicketdone">
        
        Typ av enhet: 
        <select id="field">
            <option name="type" value="desktop">Stationär</option>
            <option name="type" value="notepad">Bärbar</option>
            <option name="type" value="netbook">Netbook</option>
            <option name="type" value="server">Server</option>
            <option name="type" value="other">Annat</option>
        </select>
        
        Serienummer:
        <input id="field" type="text" size="30" name="serial">
        
        Garanti:
        <select id="field">
            <option value="yes">NEJ</option>
            <option value="yes">JA</option>
        </select>
        
        Antal inlämnade delar:
        <input id="field" type="text" size="1" name="parts">
           
        <br /><br />
            
        Kontaktperson:
        <input id="field" type="text" size="20" name="contact">
            
        Företag:
        <select id="field">
            <?php
                $con = $SQLmanager->initDB();
                $sql = "SELECT namn FROM foretag";
                $handler = mysql_query($sql, $con);
                
                while ($filed = mysql_fetch_assoc($handler))
                {
                    echo '<option name="company" value="'. $filed['namn'] .'">'. $filed['namn'] .'</option>';
                }
            ?>
            <option name="company" value="Privatperson">Privatperson</option>
        </select>
        
        Mottagen Datum:
        <input id="field" type="text" size="8" name="date_arrived" value="<?php echo date('Y-m-d');?>">
        
        Operativsystem:
        <select id="field">
            <option name="os" value="xppro">XP Pro</option>
            <option name="os" value="xphome">XP Home</option>
            <option name="os" value="xpother">XP Annan Version</option>
            <option name="os" value="vistapro">Vista Pro</option>
            <option name="os" value="vistahome">Vista Home</option>
            <option name="os" value="vistaother">Vista Annan</option>
            <option name="os" value="sevenpro">Windows 7 Pro</option>
            <option name="os" value="sevenhome">Windows 7 Home</option>
            <option name="os" value="sevenhome">Windows 7 Annan</option>
            <option name="os" value="other">Annat OS</option>
        </select>
        
        <br /><br />
        
        Inloggning och lösenord:
        <input id="field" type="text" size="25" name="login">
            
        Felbeskrivning:
        <textarea id="field" style="vertical-align: top;" cols="20" rows="5" name="error"></textarea>
        
        <br /><br />
        
        <input id="sendbutt" type="submit" name="sendbutt" value="Lägg in"/> <input id="sendbutt" type="submit" name="sendbutt" value="Återgå"/>
    </form>
    <br />
</div>