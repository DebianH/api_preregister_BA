import { Request, Response } from "express";

export const success = function (req: Request, res: Response, message: any, status: number) {
    let statusCode = status || 200
    let statusMessage = message || ''
    res.status(statusCode).send({
        error: false,
        status: status,
        body: statusMessage
    })
}

export const error = function (req: Request, res: Response, message: string, status: number, details: any) {
    let statusCode = status || 500
    let statusMessage = message || 'Internal Server Error'
    res.status(statusCode).send({
        error: true,
        status: statusCode,
        body: statusMessage,
    })
}