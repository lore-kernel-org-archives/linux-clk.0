Return-Path: <andi.shyti@samsung.com>
Date: Tue, 12 Jul 2016 17:25:46 +0900
From: Andi Shyti <andi.shyti@samsung.com>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org,
 Andi Shyti <andi@etezian.org>
Subject: Re: [PATCH v3 6/7] spi: s3c64xx: restore removed comments
Message-id: <20160712082545.GG18237@samsunx.samsung>
References: <57837606.8050906@samsung.com>
 <1468306444-18512-1-git-send-email-andi.shyti@samsung.com>
 <CGME20160712082324epcas1p483daf92a019d69f6e96d43e2c55d31cf@epcas1p4.samsung.com>
 <20160712082256.GD9976@sirena.org.uk>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
In-reply-to: <20160712082256.GD9976@sirena.org.uk>
List-ID: <linux-clk.vger.kernel.org>

> > Patch a9e93e8 has erroneously removed some comments which are
> > important to understand why the bus frequency is multiplied by
> > two during the spi transfer.
> 
> Please don't bury patches in the middle of old threads, it makes it very
> confusing trying to figure out what's going on especially when you do
> this one patch at a time in a series.  Submit new patches as a complete
> series, ideally not threaded in with anything else (at least for me).

OK, sorry, do you want me to send everything again?

Andi
