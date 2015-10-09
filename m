Return-Path: <sjoerd.simons@collabora.co.uk>
Message-ID: <1444390555.9895.271.camel@collabora.co.uk>
Subject: Re: [PATCH v4 5/8] clk: rockchip: Allow the RK3288 SPDIF clocks to
 change their parent
From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown
 <broonie@kernel.org>, linux-kernel@vger.kernel.org, Kumar Gala
 <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Pawel
 Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
 linux-clk@vger.kernel.org
Date: Fri, 09 Oct 2015 13:35:55 +0200
In-Reply-To: <11755202.f1LLWMlYi0@phil>
References: <1444311079-2892-1-git-send-email-sjoerd.simons@collabora.co.uk>
	 <1444311079-2892-6-git-send-email-sjoerd.simons@collabora.co.uk>
	 <11755202.f1LLWMlYi0@phil>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hey Heiko,

On Thu, 2015-10-08 at 17:10 +0200, Heiko Stuebner wrote:
> Am Donnerstag, 8. Oktober 2015, 15:31:16 schrieb Sjoerd Simons:
> > The clock branches leading to sclk_spdif and sclk_spdif_8ch on
> > RK3288
> > SoCs only feed those clocks, allow those clocks to change their
> > parents
> > all the way up the hierarchy.
> >=20
> > Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
>=20
> Just as comment, if I'm seeing that right, this patch needs "clk:
> rockchip:=20
> handle mux dependency of fractional dividers" and friends [0] to
> apply and=20
> also actually handle the fractional dividers correctly.
>=20
> For the clock change itself:
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Oh sorry yes, i completely forgot to at that as note on this patch
(series). These are on top of your series as those are required to make
things actually work as expected.=20

Which reminds me, i was wondering how to best move that forward. Could
you pick this one up to include it in the next round of your series?
(Otherwise i'm happy to rebase it once you do a v2)

>=20
> Heiko
>=20
> [0] http://lists.infradead.org/pipermail/linux-rockchip/2015-August/0
> 03930.html


--=20
Sjoerd Simons
Collabora Ltd.
