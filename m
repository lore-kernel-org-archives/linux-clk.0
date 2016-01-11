Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Mon, 11 Jan 2016 07:56:49 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Sangbeom Kim <sbkim73@samsung.com>,
	Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: regulator/mfd: Reorganize S2MPA01
 bindings
Message-ID: <20160111075649.GO3331@x1>
References: <1449191405-3344-1-git-send-email-k.kozlowski@samsung.com>
 <1449191405-3344-4-git-send-email-k.kozlowski@samsung.com>
 <20151204121153.GZ26072@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20151204121153.GZ26072@sirena.org.uk>
List-ID: <linux-clk.vger.kernel.org>

On Fri, 04 Dec 2015, Mark Brown wrote:

> On Fri, Dec 04, 2015 at 10:10:05AM +0900, Krzysztof Kozlowski wrote:
> > The mfd/s2mpa01.txt duplicates some of the information about bindings
> > with old mfd/s2mps11.txt. Now common part exists entirely in
> > mfd/samsung,sec-core.txt so:
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> 
> >  - add company prefix to file name (regulator/samsung,s2mpa01.txt),
> 
> I'm not 100% convinced about these prefixes BTW, the duplication isn't
> usually an issue within a subsystem.  They don't do any harm either
> though.

I think they're ugly and would prefer not to accept them, but lots of
people are submitting them now and I can't be bothered to fight it, so
meh!

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
