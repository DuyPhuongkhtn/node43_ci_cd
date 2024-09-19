import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Get("/health-check")
  healthCheck(): string {
    return "200"
  }

  @Get("/welcome")
  welcomeNode(): string {
    return "Welcome NODEJS47"
  }
}
