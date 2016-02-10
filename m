Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:63033 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750993AbcBJOho (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 10 Feb 2016 09:37:44 -0500
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Lars Persson <lars.persson@axis.com>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, mark.rutland@arm.com,
	pawel.moll@arm.com, ijc+devicetree@hellion.org.uk,
	Lars Persson <larper@axis.com>, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, galak@codeaurora.org
Subject: Re: [PATCH 3/8] arm: add device-tree SoC bindings for Axis Artpec-6
Date: Wed, 10 Feb 2016 15:37:02 +0100
Message-ID: <7215228.dtgbJ3Moag@wuerfel>
In-Reply-To: <06f7e5ffdef7ba79b5702f063512010329c40cba.1455107681.git.larper@axis.com>
References: <cover.1455107681.git.larper@axis.com> <06f7e5ffdef7ba79b5702f063512010329c40cba.1455107681.git.larper@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wednesday 10 February 2016 13:41:52 Lars Persson wrote:
> Signed-off-by: Lars Persson <larper@axis.com>

Add a changelog

>  Documentation/devicetree/bindings/arm/axis.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/axis.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/axis.txt b/Documentation/devicetree/bindings/arm/axis.txt
> new file mode 100644
> index 0000000..4c98701
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/axis.txt
> @@ -0,0 +1,8 @@
> +Axis Communications AB
> +ARTPEC series SoC Device Tree Bindings
> +
> +
> +ARTPEC-6 ARM SoC
> +
> +Required root node properties:
> +    - compatible = "axis,artpec6-dev-board", "axis,artpec6";
> 

Requiring "axis,artpec6-dev-board" to be used for all boards somewhat
misses the point of board specific compatibility values.

	Arnd
