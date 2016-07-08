Return-Path: <andi@etezian.org>
Date: Sat, 9 Jul 2016 01:35:09 +0900
From: Andi Shyti <andi@etezian.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Andi Shyti <andi.shyti@samsung.com>, Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Mark Brown <broonie@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org,
	Andi Shyti <andi@etezian.org>
Subject: Re: [PATCH v2 6/7] spi: s3c64xx: restore removed comments
Message-ID: <20160708163509.GE1256@jack.zhora.eu>
References: <1467989201-14661-1-git-send-email-andi.shyti@samsung.com>
 <1467989201-14661-7-git-send-email-andi.shyti@samsung.com>
 <146799464881.73491.7507792367941552864@resonance>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <146799464881.73491.7507792367941552864@resonance>
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,

> >         if (sdd->port_conf->clk_from_cmu) {
> > +               /* There is half-multiplier before the SPI */
> >                 clk_set_rate(sdd->src_clk, sdd->cur_speed * 2);
> 
> Just a small comment, but if the fixed-factor divide-by-two clock was
> modeled in Linux, then this driver could call clk_set_rate on that clock
> with the "correct" rate.
> 
> I guess that this driver would be the provider of that clock?

Makes sense, I will check it.

Thanks again,
Andi
