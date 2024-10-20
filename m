Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5C41C6B8;
	Sun, 20 Oct 2024 10:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729421852; cv=none; b=KWgNRfts5MZ+/mekYGZeDk2gqM0J7adbodAXjiWpU8eRSyqcey3wlyOzEHOk9FCD4LvgSACoCfzMa9tnnt2A9V4AUtNsWMTL8/PrWZ7XeFedpagllcFDqrbqLPmCuUIkVwvfnQUAv5CNDCL19UU9OhDBSohG0H1s4OFdlq0uqFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729421852; c=relaxed/simple;
	bh=fVJQ59lCynYNgYz2upGYWbt0tkW888tA5I/nudfBiSg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oUi8MSgbKttdz8Pvg8pVNv7qrxPheOiVciORAXhmofPj1j0TIm8+VQkg6foLxRnkhyLyItpGbl9rsxM32akGXrMGWNPtDDEEeiQxVf2TeMw7Z2dFOhVXnKhceQCRxFEHzAAkxlufnbrnNn7o/LXp6JWKCbIqg8i1I+byJnfM2Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A88F7DA7;
	Sun, 20 Oct 2024 03:57:59 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DDFB3F58B;
	Sun, 20 Oct 2024 03:57:27 -0700 (PDT)
Date: Sun, 20 Oct 2024 11:56:33 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Chris Morgan <macroalpha82@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: allwinner: h616: Add audio codec
 node
Message-ID: <20241020115633.67582352@minigeek.lan>
In-Reply-To: <20241020083124.174724-7-ryan@testtoast.com>
References: <20241020083124.174724-1-ryan@testtoast.com>
	<20241020083124.174724-7-ryan@testtoast.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 20 Oct 2024 21:30:56 +1300
Ryan Walklin <ryan@testtoast.com> wrote:

Hi,

> Now that the sun4i codec driver supports the H616, add a node in the
> device tree for it (correcting the spdif block location at the same
> time).

I can confirm that the spdif block indeed just moved without any changes
(to preserve the MMIO base address ordering in the DT), and that the
values for the base address, the IRQ, the clocks, the reset gate and
the DMA channels of the new audio codec match the manual:

> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> 
> ---
> Changelog v1..v2:
> - Remove 4x clock from the codec block, this is not used in the driver and does not require a reference.
> - Move the codec (and spdif) blocks below the lradc block so that they are in address-order.
> ---
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 44 ++++++++++++-------
>  1 file changed, 29 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> index 0131f9b3132b8..3788f65a7d0eb 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -762,21 +762,6 @@ mdio0: mdio {
>  			};
>  		};
>  
> -		spdif: spdif@5093000 {
> -			compatible = "allwinner,sun50i-h616-spdif";
> -			reg = <0x05093000 0x400>;
> -			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&ccu CLK_BUS_SPDIF>, <&ccu CLK_SPDIF>;
> -			clock-names = "apb", "spdif";
> -			resets = <&ccu RST_BUS_SPDIF>;
> -			dmas = <&dma 2>;
> -			dma-names = "tx";
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&spdif_tx_pin>;
> -			#sound-dai-cells = <0>;
> -			status = "disabled";
> -		};
> -
>  		gpadc: adc@5070000 {
>  			compatible = "allwinner,sun50i-h616-gpadc",
>  				     "allwinner,sun20i-d1-gpadc";
> @@ -811,6 +796,35 @@ lradc: lradc@5070800 {
>  			status = "disabled";
>  		};
>  
> +		spdif: spdif@5093000 {
> +			compatible = "allwinner,sun50i-h616-spdif";
> +			reg = <0x05093000 0x400>;
> +			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_SPDIF>, <&ccu CLK_SPDIF>;
> +			clock-names = "apb", "spdif";
> +			resets = <&ccu RST_BUS_SPDIF>;
> +			dmas = <&dma 2>;
> +			dma-names = "tx";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&spdif_tx_pin>;
> +			#sound-dai-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		codec: codec@05096000 {
> +			#sound-dai-cells = <0>;
> +			compatible = "allwinner,sun50i-h616-codec";
> +			reg = <0x05096000 0x31c>;
> +			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_AUDIO_CODEC>,
> +				 <&ccu CLK_AUDIO_CODEC_1X>;
> +			clock-names = "apb", "codec";
> +			resets = <&ccu RST_BUS_AUDIO_CODEC>;
> +			dmas = <&dma 6>;
> +			dma-names = "tx";
> +			status = "disabled";
> +		};
> +
>  		usbotg: usb@5100000 {
>  			compatible = "allwinner,sun50i-h616-musb",
>  				     "allwinner,sun8i-h3-musb";

