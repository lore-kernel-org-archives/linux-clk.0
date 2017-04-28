Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170428123837.GF1532@bigcity.dyn.berto.se>
References: <1493139200-27396-1-git-send-email-geert+renesas@glider.be>
 <1493139200-27396-3-git-send-email-geert+renesas@glider.be> <20170428123837.GF1532@bigcity.dyn.berto.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Apr 2017 14:45:43 +0200
Message-ID: <CAMuHMdVHJhJ46DSF_vw+jedDJZab1+FbtzuQgopqumSAwoGUEA@mail.gmail.com>
Subject: Re: [PATCH 02/10] clk: renesas: Add r8a7790 CPG Core Clock Definitions
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Niklas,

On Fri, Apr 28, 2017 at 2:38 PM, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
>
> On 2017-04-25 18:53:12 +0200, Geert Uytterhoeven wrote:
>> Add all R-Car H2 Clock Pulse Generator Core Clock Outputs, as listed in
>> Table 7.2a ("List of Clocks [R-Car H2]") of the R-Car Gen2 Hardware
>> User's Manual rev. 2.00.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

>> --- /dev/null
>> +++ b/include/dt-bindings/clock/r8a7790-cpg-mssr.h

>> +#define R8A7790_CLK_R                        33
>> +#define R8A7790_CLK_OSC                      34
>
> The last two are called RCLR and OSCCLK in the Table 7.2a ("List of
> Clocks [R-Car H2]"). I'm sure this is intentional on your side, and if
> so:

It's a bit silly to have two clocks with "clk" in their name, while
all others don't.
We did the same on R-Car Gen3.

> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
