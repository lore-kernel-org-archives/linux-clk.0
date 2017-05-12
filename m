Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170511144534.GB21895@verge.net.au>
References: <1494496275-2433-1-git-send-email-geert+renesas@glider.be> <20170511144534.GB21895@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 May 2017 14:13:35 +0200
Message-ID: <CAMuHMdV4HFCG37U7ZYnM9Dq4Sfj-EfHPMTR=GAUxH8mhZ4zutQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a7795: Correct pwm, gpio, and i2c parent
 clocks on ES2.0
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Thu, May 11, 2017 at 4:45 PM, Simon Horman <horms@verge.net.au> wrote:
> On Thu, May 11, 2017 at 11:51:15AM +0200, Geert Uytterhoeven wrote:
>> Cfr. the errata of April 14, 2017, for the R-Car Gen3 Hardware Manual
>> Rev. 0.53E.
>>
>> These have no user-visible effect, as the clock frequencies stay the
>> same.
>>
>> Fixes: 5573d194128b4733 ("clk: renesas: r8a7795: Add support for R-Car H3 ES2.0")
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> To be queued in clk-renesas-for-v4.13.
>
> This matches the documentation I have.
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, queued in clk-renesas-for-v4.13.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
