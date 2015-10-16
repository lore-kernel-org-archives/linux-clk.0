Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20151016125533.20687.23387@quantum>
References: <20151015215648.2024f611@free-electrons.com>
	<1444951178-18733-1-git-send-email-sboyd@codeaurora.org>
	<20151016125533.20687.23387@quantum>
Date: Fri, 16 Oct 2015 15:02:37 +0200
Message-ID: <CAMuHMdUtxQfkc=a3ObbDserFtSyAPAKvAbywzSFoQZXd7kh=HQ@mail.gmail.com>
Subject: Re: [PATCH] clk: Make of_clk_get_parent_name() robust with
 #clock-cells = 1
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	"Gregory CLEMENT <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,

On Fri, Oct 16, 2015 at 2:55 PM, Michael Turquette
<mturquette@baylibre.com> wrote:
> Quoting Stephen Boyd (2015-10-15 16:19:38)
>> If a clock provider has #clock-cells = 1 and we call
>> of_clk_get_parent_name() on it we may end up returning the name
>> of the provider node if the provider doesn't have a
>> clock-output-names property. This doesn't make sense, especially
>> when you consider that calling of_clk_get_parent_name() on such a
>> node with different indices will return the same name each time.
>>
>> Let's try getting the clock from the framework via of_clk_get()
>> instead, and only fallback to the node name if we have a provider
>> with #clock-cells = 0. This way, we can't hand out the same name
>> for different clocks when we don't actually know their names.
>>
>> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
>
> Geert,
>
> Does this approach fix the issues you had removing clock-output-names
> from your clock provider DTS?

I already saw this patch in clk-next, and I think it would fix that issue.
However, we're no longer seeing the issue, as we no longer have
fixed-factor-clocks in DT.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
