Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:50397 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932228AbbLGRk1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 7 Dec 2015 12:40:27 -0500
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ARM: dts: dove: add Dove divider clocks
References: <E1a5ijN-0007pq-3t@rmk-PC.arm.linux.org.uk>
Date: Mon, 07 Dec 2015 18:40:15 +0100
In-Reply-To: <E1a5ijN-0007pq-3t@rmk-PC.arm.linux.org.uk> (Russell King's
	message of "Sun, 06 Dec 2015 23:28:37 +0000")
Message-ID: <87k2oqb1j4.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Russell,
 
 On lun., déc. 07 2015, Russell King <rmk+kernel@arm.linux.org.uk> wrote:

> Add the Dove divider clocks to the Dove dtsi file.
>
> Acked-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

Applied on mvebu/dt

Thanks,

Gregory

> ---
>  arch/arm/boot/dts/dove.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
> index 179121630ad7..ea36a262d056 100644
> --- a/arch/arm/boot/dts/dove.dtsi
> +++ b/arch/arm/boot/dts/dove.dtsi
> @@ -459,6 +459,12 @@
>  					#clock-cells = <1>;
>  				};
>  
> +				divider_clk: core-clock@0064 {
> +					compatible = "marvell,dove-divider-clock";
> +					reg = <0x0064 0x8>;
> +					#clock-cells = <1>;
> +				};
> +
>  				pinctrl: pin-ctrl@0200 {
>  					compatible = "marvell,dove-pinctrl";
>  					reg = <0x0200 0x14>,
> -- 
> 2.1.0
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
