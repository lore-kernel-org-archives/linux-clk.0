Return-Path: <moinejf@free.fr>
Date: Tue, 21 Jun 2016 11:40:44 +0200
From: Jean-Francois Moine <moinejf@free.fr>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Andre
 Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Vishnu
 Patekar <vishnupatekar0510@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Boris Brezillon
 <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 00/15] clk: sunxi: introduce "modern" clock support
Message-Id: <20160621114044.811e2136eca5c1d863d79ac6@free.fr>
In-Reply-To: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

On Tue,  7 Jun 2016 22:41:39 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> The current code has been tested on the H3 and an Orange Pi PC,
> including making sure that MMC still works, so the general approach
> seems ok.
>=20
> Let me know what you think,

Hi Maxime,

I used your code in both the H3 and A83T, and it worked fine for the
current clocks.

But I had some problems with some features as the 'mode select' in the
A83T MMC2 clock.
Also, I think that you did not go far enough in the changes.
For example, most clock gates as well as most resets could be removed
from the DT and automatically set/de-asserted on clock prepare or clock
enable.

So, I am rewriting a generic sunxi clock driver into one file (about
1000 lines) and I have the full (simpler and clearer) description of
the H3 and the A863T clocks.

Coding is not finished yet. I will submit a RFC as soon as I will have
something working.

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
