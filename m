Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 20 Sep 2016 09:27:44 -0500
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
	johnyoun@synopsys.com, kishon@ti.com, khilman@baylibre.com,
	carlo@caione.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, sboyd@codeaurora.org,
	mturquette@baylibre.com, will.deacon@arm.com,
	catalin.marinas@arm.com, gregkh@linuxfoundation.org,
	mark.rutland@arm.com
Subject: Re: [PATCH v2 1/6] usb: dwc2: add support for Meson8b and GXBB SoCs
Message-ID: <20160920142744.GA7675@rob-hp-laptop>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20160911134111.31141-1-martin.blumenstingl@googlemail.com>
 <20160911134111.31141-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160911134111.31141-2-martin.blumenstingl@googlemail.com>
List-ID: <linux-clk.vger.kernel.org>

On Sun, Sep 11, 2016 at 03:41:06PM +0200, Martin Blumenstingl wrote:
> From: Jerome Brunet <jbrunet@baylibre.com>
> 
> Add compatible strings for amlogic Meson8b and GXBB SoCs with the
> corresponding configuration parameters.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt |  2 ++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/usb/dwc2/platform.c                    | 34 ++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
