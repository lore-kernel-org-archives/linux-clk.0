Return-Path: <khilman@baylibre.com>
Return-Path: <khilman@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org,  linux-usb@vger.kernel.org,  linux-amlogic@lists.infradead.org,  jbrunet@baylibre.com,  johnyoun@synopsys.com,  kishon@ti.com,  carlo@caione.org,  linux-arm-kernel@lists.infradead.org,  devicetree@vger.kernel.org,  sboyd@codeaurora.org,  mturquette@baylibre.com,  will.deacon@arm.com,  catalin.marinas@arm.com,  gregkh@linuxfoundation.org,  mark.rutland@arm.com,  robh+dt@kernel.org
Subject: Re: [PATCH v2 4/6] ARM64: meson-gxbb: add USB Nodes
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
	<20160911134111.31141-1-martin.blumenstingl@googlemail.com>
	<20160911134111.31141-5-martin.blumenstingl@googlemail.com>
Date: Thu, 15 Sep 2016 15:10:23 -0700
In-Reply-To: <20160911134111.31141-5-martin.blumenstingl@googlemail.com>
	(Martin Blumenstingl's message of "Sun, 11 Sep 2016 15:41:09 +0200")
Message-ID: <7hintwke5s.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Add the nodes for the dwc2 USB controller and the related USB PHYs.
> Currently we force usb0 to host mode because OTG is currently not
> working in our PHY driver.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied (after adding a "dts: " to the subject.

Kevin
