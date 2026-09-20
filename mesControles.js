function piedpage()
  {
        d=  new Date() ; //date systeme

        document.getElementById('pied').innerHTML=document.getElementById('pied').innerHTML+' '+d.getFullYear()

  }

  function moyenne()
  {
      let orig=document.getElementById('orig').value 
      let pres=document.getElementById('pres').value
      let gout=document.getElementById('gout').value

      moy=(Number(orig)+Number(pres)+Number(gout))/3

      document.getElementById('note').innerHTML=moy
  }

  function numerique(ch)
  {
      let i=0
      while(i<ch.length && ch[i]>='0' && ch[i]<='9')
      {i++}
      return i==ch.length
  }

  function validation()
  {
      let cin=document.getElementById('cin').value 

      if(cin.length!=8 || !numerique(cin))
      {
            alert('cin 8 chiffres')
            return false
      }
  }
