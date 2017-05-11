Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170426070925.GA25517@verge.net.au>
References: <1493141161-28069-1-git-send-email-geert+renesas@glider.be> <20170426070925.GA25517@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 May 2017 10:57:57 +0200
Message-ID: <CAMuHMdUnVXfUTok=cA7-eE-fFJsJYfRkpXqzLchJXPnvFYT=Vw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: Do not build clk-div6 for R8A7792
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Apr 26, 2017 at 9:09 AM, Simon Horman <horms@verge.net.au> wrote:
> On Tue, Apr 25, 2017 at 07:26:01PM +0200, Geert Uytterhoeven wrote:
>> R-Car V2H does not have "DIV6" programmable clocks, hence there is no
>> need to build clk-div6.o.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> To be queued up in clk-renesas-for-v4.13.
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, queued.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
