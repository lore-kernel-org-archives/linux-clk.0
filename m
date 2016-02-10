Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:49433 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750904AbcBJOjZ (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 10 Feb 2016 09:39:25 -0500
From: Arnd Bergmann <arnd@arndb.de>
To: Lars Persson <lars.persson@axis.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com,
	mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org, linux-kernel@vger.kernel.org,
	Lars Persson <larper@axis.com>
Subject: Re: [PATCH 4/8] arm: dts: add Artpec-6 soc dtsi file
Date: Wed, 10 Feb 2016 15:38:48 +0100
Message-ID: <2518578.qKxQQXPlfn@wuerfel>
In-Reply-To: <733065957e9ec67d698870cf832b4641d0da30cb.1455107681.git.larper@axis.com>
References: <cover.1455107681.git.larper@axis.com> <733065957e9ec67d698870cf832b4641d0da30cb.1455107681.git.larper@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wednesday 10 February 2016 13:41:53 Lars Persson wrote:
> Signed-off-by: Lars Persson <larper@axis.com>
> ---

Missing changelog

>  arch/arm/boot/dts/artpec6.dtsi | 238 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 238 insertions(+)
>  create mode 100644 arch/arm/boot/dts/artpec6.dtsi
> 
> diff --git a/arch/arm/boot/dts/artpec6.dtsi b/arch/arm/boot/dts/artpec6.dtsi
> new file mode 100644
> index 0000000..c1790d8
> --- /dev/null
> +++ b/arch/arm/boot/dts/artpec6.dtsi
> @@ -0,0 +1,238 @@
> +/*
> + * Device Tree Source for the Axis ARTPEC-6 SoC
> + *
> + * This file is licensed under the terms of the GNU General Public License
> + * version 2.  This program is licensed "as is" without any warranty of any
> + * kind, whether express or implied.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include "skeleton.dtsi"
> +
> +/ {
> +	compatible = "axis,artpec6";
> +	interrupt-parent = <&intc>;
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +	};

Move the aliases into the board, not all boards might use all four
uarts, or some board might assign different numbers.

> +		uart0: uart@f8036000 {

make this "serial@f8036000"

	Arnd

