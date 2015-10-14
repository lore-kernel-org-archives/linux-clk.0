Return-Path: <mark.rutland@arm.com>
Date: Wed, 14 Oct 2015 13:43:53 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Zhiqiang Hou <B48286@freescale.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will.deacon@arm.com, linux-i2c@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-clk@vger.kernel.org, Mingkai.Hu@freescale.com,
	Shaohui.Xie@freescale.com, scottwood@freescale.com,
	bhupesh.sharma@freescale.com, leoli@freescale.com,
	wsa@the-dreams.de, wim@iguana.be, corbet@lwn.net,
	mturquette@baylibre.com, sboyd@codeaurora.org,
	Wenbin.Song@freescale.com
Subject: Re: [PATCH V3 4/6] arm64/ls1043a: add DTS for Freescale LS1043A SoC
Message-ID: <20151014124353.GC2150@leverpostej>
References: <1444822498-16477-1-git-send-email-B48286@freescale.com>
 <1444822498-16477-5-git-send-email-B48286@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1444822498-16477-5-git-send-email-B48286@freescale.com>
List-ID: <linux-clk.vger.kernel.org>

Hi,

> +	pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <0 106 0x4>,
> +			     <0 107 0x4>,
> +			     <0 95 0x4>,
> +			     <0 97 0x4>;
> +	};

You should have interrupt-affinity here. See
Documentation/devicetree/bindings/arm/pmu.txt

Otherwise this looks ok.

Thanks,
Mark.
