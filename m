Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <2397934.0Hfvr3l64P@avalon>
References: <1514906503-8535-1-git-send-email-geert+renesas@glider.be> <2397934.0Hfvr3l64P@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jan 2018 11:38:36 +0100
Message-ID: <CAMuHMdXBFqiNLMAzDkyWZfdiJWt5WGEJJP0+5TE250az8u5Brg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a7796: Add FDP clock
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	ABE Hiroshige <hiroshige.abe.zc@renesas.com>,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jan 2, 2018 at 4:54 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tuesday, 2 January 2018 17:21:43 EET Geert Uytterhoeven wrote:
>> From: ABE Hiroshige <hiroshige.abe.zc@renesas.com>
>>
>> This patch adds FDP1-0 clock to the R8A7796 SoC.
>>
>> Signed-off-by: ABE Hiroshige <hiroshige.abe.zc@renesas.com>
>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> [geert: s/fdp0/fdp1-0/]
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I can't verify the parent clock, but apart from that,
>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied with Laurent's ack, and queued in clk-renesas-for-v4.16.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
