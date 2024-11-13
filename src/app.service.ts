import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Hemos finalizado con un deploy desde Argo cd!';
  }
}
