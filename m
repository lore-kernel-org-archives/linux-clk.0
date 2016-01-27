Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio.lopez@collabora.co.uk>, mturquette@baylibre.com, sboyd@codeaurora.org, wens@csie.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] clk: sunxi: delay protected clocks until arch initcall
Date: Wed, 27 Jan 2016 17:14:17 +0100
Message-ID: <7334994.mKnQpNNMP2@diego>
In-Reply-To: <20160127153722.GC4317@lukather>
References: <1453385439-10154-1-git-send-email-emilio.lopez@collabora.co.uk> <1453385439-10154-2-git-send-email-emilio.lopez@collabora.co.uk> <20160127153722.GC4317@lukather>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi,

Am Mittwoch, 27. Januar 2016, 16:37:22 schrieb Maxime Ripard:
> I thought the patches were simply dropped and the
> rockchip people just took another approach.

nope still on track ... especially as it was Stephen's believe that orphans 
shouldn't even be usable to general clock users :-).

I just remember that the proposed general solution was based on Mike's 
upcoming generic critical clock handling (the handoff thingy), which would 
move critical clock handling out of architecture-specific code, so I've been 
prodding Mike mainly.

Another option might be to allow clock-controllers to handle orphans and only 
deny orphan usage to outside clock users, maybe expanding on what I did with 
the clock-conf part in patch2.


Heiko
