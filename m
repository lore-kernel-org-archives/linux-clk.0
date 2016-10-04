Return-Path: <k.kozlowski.k@gmail.com>
Return-Path: <k.kozlowski.k@gmail.com>
Date: Tue, 4 Oct 2016 11:30:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Lee Jones <lee.jones@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	rtc-linux@googlegroups.com
Subject: Re: [PATCH 2/4] regulator: Enable compile testing for Maxim and
 Samsung PMIC drivers
Message-ID: <20161004093056.GA8832@kozik-book>
References: <1475441897-15730-1-git-send-email-krzk@kernel.org>
 <1475441897-15730-3-git-send-email-krzk@kernel.org>
 <20161004024055.4kdjvoiig4fwxi54@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20161004024055.4kdjvoiig4fwxi54@sirena.org.uk>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Oct 04, 2016 at 04:40:55AM +0200, Mark Brown wrote:
> On Sun, Oct 02, 2016 at 10:58:15PM +0200, Krzysztof Kozlowski wrote:
> > Most of Maxim and Samsung PMIC/MUIC regulator drivers can be compile
> > tested to increase build coverage.
> 
> All these drivers already just depend on the MFDs which don't have any
> weird architecture dependencies - the main goal with COMPILE_TEST is
> usually to eliminate dependencies which just can't be selected so they
> can be built at all.  Given that there's no easy way to select
> everything in a subsystem otherwise does this buy us a lot?

Initially I thought similar - if parent MFD driver can be
compile-tested, then these children do not need that flag...

However the MFD drivers depend on I2C which (currently) cannot be
removed for compile testing. On the other hand, regulator drivers do not
need that dependency so you can compile-test them with I2C=n. That is
the main benefit. If you wish, I can add this information to the commit
msg.

Best regards,
Krzysztof
