Return-Path: <ce3a@gmx.de>
Message-ID: <5560D711.8070700@gmx.de>
Date: Sat, 23 May 2015 21:37:53 +0200
From: Sergej Sawazki <ce3a@gmx.de>
MIME-Version: 1.0
To: Jyri Sarha <jsarha@ti.com>
CC: mturquette@linaro.org, sboyd@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RFC v1] clk: add gpio controlled clock multiplexer
References: <1431596413-20917-1-git-send-email-ce3a@gmx.de> <555EF34C.1090507@ti.com>
In-Reply-To: <555EF34C.1090507@ti.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Jyri, thanks for the review...

On 22.05.2015 at 11:13 Jyri Sarha wrote:
> On 05/14/15 12:40, Sergej Sawazki wrote:
>> +Optional properties:
>> +- enable-gpios : GPIO reference for enabling and disabling the clock.
>
> I guess in theory you should not need the enable functionality here. You
> could just stack gpio-mux-clock on top of gpio-gate-clock.
>

I agree, I will remove the enable functionality.

Best regards,
Sergej
