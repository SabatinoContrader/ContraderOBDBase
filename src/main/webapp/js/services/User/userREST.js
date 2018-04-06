app.factory('userREST',['$resource',
function($resource){
  var baseUrl = '/'

  return $resource(baseUrl, {},{
    signup: {
        method: 'GET',
        url: baseUrl+'registrazione',
        headers: {'Content-Type':'application/json;charset=UTF-8'}
    },
    login: {
      method: 'POST',
      url: baseUrl+'login',
      headers: {'Content-Type': 'application/json; charset=UTF-8' },
	  params:{
		  email:'@email',
		  pwd:'@pwd'
	  }
    },
    update: {
      method: 'POST',
      url: baseUrl+'update',
      headers:{'Content-Type': 'application/json; charset=UTF-8' },
      params: {
        username: '@username'
      }
    },
	 preventivi: {
      method: 'POST',
      url: baseUrl+'preventiviCliente',
      headers:{'Content-Type': 'application/json; charset=UTF-8' },
	  params: {
        id: '@id'
      }
    },
	 preventiviofficina: {
      method: 'POST',
      url: baseUrl+'preventiviOfficina',
      headers:{'Content-Type': 'application/json; charset=UTF-8' },
	  params: {
        id: '@id'
      }
    },
	 appuntamenti: {
      method: 'POST',
      url: baseUrl+'appuntamentiCliente',
      headers:{'Content-Type': 'application/json; charset=UTF-8' },
	  params: {
        id: '@id'
      }
    }
	,
	 scadenze: {
      method: 'POST',
      url: baseUrl+'autoInScadenza',
      headers:{'Content-Type': 'application/json; charset=UTF-8' },
	  params: {
        id: '@id'
      }
    }
  });
}

]);
