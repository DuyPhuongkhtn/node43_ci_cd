import { ExtractJwt, Strategy } from 'passport-jwt';
import { PassportStrategy } from '@nestjs/passport';
import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
    constructor(config: ConfigService) {
        super({
            jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
            ignoreExpiration: false,
            secretOrKey: config.get('SECRET_KEY'),
        });
    }
    prisma = new PrismaClient();

    async validate(tokenDecode: any) {
        const { id, email, full_name } = tokenDecode.data;

        const checkEmail = await this.prisma.nguoi_dung.findFirst({
            where: {
                email,
            },
        });
        if (checkEmail) {
            // console.log(tokenDecode)
            return tokenDecode;
        } else {
            return false;
        }
    }
}
