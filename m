Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1517824279.3153.42.camel@baylibre.com>
Subject: Re: [PATCH 08/19] clk: meson: add regmap to the clock controllers
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Carlo
 Caione <carlo@caione.org>,  linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
Date: Mon, 05 Feb 2018 10:51:19 +0100
In-Reply-To: <CAFBinCD2TRRraJ7hGoLy2Y42-LAK1ZXyvOLbPCsf1Aip_ELJHQ@mail.gmail.com>
References: <20180131180945.18025-1-jbrunet@baylibre.com>
	 <20180131180945.18025-9-jbrunet@baylibre.com>
	 <CAFBinCD2TRRraJ7hGoLy2Y42-LAK1ZXyvOLbPCsf1Aip_ELJHQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Sat, 2018-02-03 at 19:53 +0100, Martin Blumenstingl wrote:
> On Wed, Jan 31, 2018 at 7:09 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> > This change register a regmap in meson8b, gxbb and axg controllers.
> > The clock are still accessing their registers directly through iomem.
> > Once all clocks handled by these controllers have been move to regmap,
> > the regmap register will be removed and replaced with a syscon request.
> 
> maybe you can add a comment that some of the registers from this area
> need to be accessed outside the clock driver (by the HDMI driver for
> example - which is the case on GX and Meson8/8b IIRC) if you have to
> re-spin this series

I think it was mentioned in the cover letter, but you are right, I should
mention it here as well.

> 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> 
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
