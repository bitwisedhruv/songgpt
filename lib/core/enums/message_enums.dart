enum MessageEnum {
  text('text'),
  image('image'),
  video('video'),
  audio('audio'),
  document('document'),
  spreadsheet('spreadsheet'),
  powerpoint('powerpoint'),
  link('link');

  const MessageEnum(this.type);
  final String type;
}

extension ConvertMessage on String {
  MessageEnum toEnum() {
    switch (this) {
      case 'audio':
        return MessageEnum.audio;

      case 'document':
        return MessageEnum.document;

      case 'image':
        return MessageEnum.image;

      case 'link':
        return MessageEnum.link;

      case 'powerpoint':
        return MessageEnum.powerpoint;

      case 'spreadsheet':
        return MessageEnum.spreadsheet;

      case 'text':
        return MessageEnum.text;

      case 'video':
        return MessageEnum.video;

      default:
        return MessageEnum.text;
    }
  }
}
