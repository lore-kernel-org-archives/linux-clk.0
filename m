Return-Path: <khilman@baylibre.com>
Return-Path: <khilman@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,  narmstrong@baylibre.com,  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,  mturquette@baylibre.com,  sboyd@codeaurora.org,  robh+dt@kernel.org,  mark.rutland@arm.com,  carlo@caione.org,  linux@armlinux.org.uk,  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] ARM: dts: meson8: add and use the real clock controller
References: <20170604183341.21417-1-martin.blumenstingl@googlemail.com>
	<20170604183341.21417-4-martin.blumenstingl@googlemail.com>
	<1496607638.3552.20.camel@baylibre.com>
Date: Fri, 09 Jun 2017 11:22:03 -0700
In-Reply-To: <1496607638.3552.20.camel@baylibre.com> (Jerome Brunet's message
	of "Sun, 04 Jun 2017 22:20:38 +0200")
Message-ID: <m2d1ad9g38.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Sun, 2017-06-04 at 20:33 +0200, Martin Blumenstingl wrote:
>> This removes the dummy clk81 gate and replaces it with the actual clock
>> controller's CLKID_CLK81. This will also allow us to pass the real clock
>> IDs to all devices where the clock is controlled by clkc in the future.
>> 
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> This is going in the right direction and at least align meson8 and meson8b.
>
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
>

Applied to v4.13/dt with Jerome's ack.

Kevin
