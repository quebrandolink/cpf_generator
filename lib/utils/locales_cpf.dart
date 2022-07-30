class LocaleCpf {
  String getLocale(int number) {
    switch (number) {
      case 0:
        return 'Rio Grande do Sul';
      case 1:
        return 'Distrito Federal, Goiás, Mato Grosso, Mato Grosso do Sul e Tocantins';
      case 2:
        return 'Amazonas, Pará, Roraima, Amapá, Acre e Rondônia';
      case 3:
        return 'Ceará, Maranhão e Piauí';
      case 4:
        return 'Paraíba, Pernambuco, Alagoas e Rio Grande do Norte';
      case 5:
        return 'Bahia e Sergipe';
      case 6:
        return 'Minas Gerais';
      case 7:
        return 'Rio de Janeiro e Espírito Santo';
      case 8:
        return 'São Paulo';
      case 9:
        return 'Paraná e Santa Catarina';
      default:
        return "";
    }
  }
}
