Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170721201631.GB19878@codeaurora.org>
References: <1492624001-3758-10-git-send-email-ykaneko0929@gmail.com> <20170721201631.GB19878@codeaurora.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Aug 2017 09:56:32 +0200
Message-ID: <CAMuHMdXOfH=u+6nQnHrEW95+HcNCh_5h_Mi9wTg7JXAgr2w0OA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Fix SD divider setting
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>, linux-clk <linux-clk@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Fri, Jul 21, 2017 at 10:16 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 04/20, Yoshihiro Kaneko wrote:
>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>
>> This patch fixed the SD divider settiing for corresponding to the change
>> in the HS200/HS400 mode.
>>
>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>> ---
>> This patch is based on the clk-next branch of linux-clk tree.
>
> Geert?

This patch was superseded by Wolfram's series "[PATCH 0/3] clk: renesas:
rcar-gen3-cpg: updates to SD divider table", which he retracted after noticing
issues on some SoCs.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
