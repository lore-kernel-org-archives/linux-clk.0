Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <CANqRtoT86vwR=A5-T_a4LBJpgWT4Q0G7n9+Kso+V+uvfLufCyw@mail.gmail.com>
References: <20150907163252.475.18281.sendpatchset@little-apple>
	<20150907163346.475.69916.sendpatchset@little-apple>
	<CAMuHMdVQkWcftaYR+vd-LGQTTsj8waFms4aOMvZY_DF51kn0Vg@mail.gmail.com>
	<CANqRtoT86vwR=A5-T_a4LBJpgWT4Q0G7n9+Kso+V+uvfLufCyw@mail.gmail.com>
Date: Tue, 8 Sep 2015 10:20:03 +0200
Message-ID: <CAMuHMdVrd-TT54PAeiO-jgEFQ_uQDq9+8V-8j90D2WcvyAEs-w@mail.gmail.com>
Subject: Re: [PATCH v7 05/05] clk: shmobile: rcar-gen3: Add CPG/MSTP Clock
 Domain support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linux-sh list <linux-sh@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Gaku Inami <gaku.inami.xw@bp.renesas.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Simon Horman <horms@verge.net.au>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Magnus,

On Tue, Sep 8, 2015 at 10:18 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> On Tue, Sep 8, 2015 at 4:41 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> Hi Magnus,
>>
>> On Mon, Sep 7, 2015 at 6:33 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
>>> --- 0009/drivers/clk/shmobile/clk-rcar-gen3.c
>>> +++ work/drivers/clk/shmobile/clk-rcar-gen3.c   2015-09-02 14:39:35.912366518 +0900
>>> @@ -236,6 +236,8 @@ static void __init rcar_gen3_cpg_clocks_
>>>         }
>>
>> The above line causes fuzz when applying it.
>
> Sorry, I forgot to refresh the patch. Will update next time I resend.

Don't worry, I can handle it fine.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
