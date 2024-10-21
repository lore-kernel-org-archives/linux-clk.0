Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7DB1FA271;
	Mon, 21 Oct 2024 17:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729533516; cv=none; b=C/lKp1JJngQAOMHRC2WqOblvA0kcbxSodkUTXg0g9uaDXdLQZwdb7N+W/hWaWxK7uq/XRWmun3ZNEIc6r/dCoaDk4fto8/55sTzOKkzF4RuzcxpWVt62qSrW1TOsJ+XsQDWhLbdEUC9havfV/HDbBZEkkscaOyWBHgUm82X2T3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729533516; c=relaxed/simple;
	bh=diX1bSWoYN/CNDGT27MeXMFVqGpzL6nJoe9VWrYDQc0=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=QEHm6TrT251yH5k9VvGb1+R9hWVJiVidG0NC4KXLmX99DKF29rjnYuwf5GM3otm22PtJaztK80ItvXqlcWcj0TSyAthebXVHtL2WESHtOa05Mz/vWFK82zsf/kEZTnxqzF0qVQuDYw6OY9WTsG1vvn2H5aloZcpNDSvRP03KoJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQfSuUOA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQfSuUOA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34A3C4CEF0;
	Mon, 21 Oct 2024 17:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729533515;
	bh=diX1bSWoYN/CNDGT27MeXMFVqGpzL6nJoe9VWrYDQc0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=MQfSuUOA1CiaiUMfWu93gemho9ByrdMMIcdYzfss5nv5KMCzhqM2CSmHQ0+srrBu/
	 fTVRO4FnrGLPUlW+yHPGGTmkPSiDhqiAd+BmOT4En2xYOudCVyIzT8u2C7xRL4TZTT
	 HfvPc5lirCar7PE/mWSRS5JAA8LSkZTTtagat07ZTh8UV3Slh2jsm0W4nBkQ+LVk4v
	 RVbRIlQ7gxHTuw471nIjR8F87/WJskOSQ/y0NJfCqQfZC3+lMBwt39lOgBaeQukhw6
	 d0tq7jbEpsBOMKAvHQDdFYa9+SOxDrEURkYu+O2BksK/4WiVk3PFQSGW803XLiJ5Vt
	 S7mstuUNSMZUQ==
Date: Mon, 21 Oct 2024 12:58:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Liam Girdwood <lgirdwood@gmail.com>, Samuel Holland <samuel@sholland.org>, 
 Jaroslav Kysela <perex@perex.cz>, 
 Philippe Simons <simons.philippe@gmail.com>, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, 
 Chris Morgan <macroalpha82@gmail.com>, Mark Brown <broonie@kernel.org>
In-Reply-To: <20241020083124.174724-1-ryan@testtoast.com>
References: <20241020083124.174724-1-ryan@testtoast.com>
Message-Id: <172953337677.748365.5628550544800550601.robh@kernel.org>
Subject: Re: [PATCH v2 0/7] ASoC: add Allwinner H616 audio codec support


On Sun, 20 Oct 2024 21:30:50 +1300, Ryan Walklin wrote:
> Hi,
> 
> V2 of this patch adding support for the Allwinner H616 (and variants) audio codec. Some rework to improve clock correctness, and DTS changes to enable the codec on boards added.
> 
> Changelog v1..v2:
> - Reordered patches to group ASoC changes
> - Corrected PLL_AUDIO clock dividers to match values from manual and vendor SDK.
> - Remove PLL_AUDIO_4X clock from the device tree binding (not used in the driver).
> - Restrict TX-only DMA changes to the H616.
> - Change the codec name to fit into the 16 char limit.
> - Move the codec (and spdif) blocks in the H616 DTSI to restore address-order.
> - Add board enablement (and power/GPIO changes for RG35XX to support speaker amp).
> 
> 
> Original blurb below:
> 
> Hi,
> 
> The Allwinner H616 has a playback-only audio codec, with a single stereo or differential-mono line output.
> 
> This patch adds support for the H616 (and H313/H618/H700/T507) SoC. Based on the  Allwinner kernel SDK driver, and tested on the H700.
> 
> Regards,
> 
> Ryan
> 
> Marcus Cooper (2):
>   ASoC: sun4i-codec: Add support for different DAC FIFOC addresses to
>     quirks
>   ASoC: sun4i-codec: Add playback only flag to quirks
> 
> Ryan Walklin (5):
>   clk: sunxi-ng: h616: Add sigma-delta modulation settings for audio PLL
>   dt-bindings: allwinner: add H616 sun4i audio codec binding
>   ASoC: sun4i-codec: support allwinner H616 codec
>   arm64: dts: allwinner: h616: Add audio codec node
>   arm64: dts: allwinner: h313/h616/h618/h700: Enable audio codec for all
>     supported boards
> 
>  .../sound/allwinner,sun4i-a10-codec.yaml      |  53 +++-
>  .../dts/allwinner/sun50i-h313-tanix-tx1.dts   |   5 +
>  .../allwinner/sun50i-h616-orangepi-zero.dtsi  |   5 +
>  .../dts/allwinner/sun50i-h616-x96-mate.dts    |   5 +
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  44 ++-
>  .../allwinner/sun50i-h618-orangepi-zero2w.dts |   5 +
>  .../sun50i-h618-transpeed-8k618-t.dts         |   5 +
>  .../sun50i-h700-anbernic-rg35xx-2024.dts      |  13 +-
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c        |  44 ++-
>  sound/soc/sunxi/sun4i-codec.c                 | 297 +++++++++++++++---
>  10 files changed, 401 insertions(+), 75 deletions(-)
> 
> --
> 2.47.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y allwinner/sun50i-h313-tanix-tx1.dtb allwinner/sun50i-h616-x96-mate.dtb allwinner/sun50i-h618-orangepi-zero2w.dtb allwinner/sun50i-h618-transpeed-8k618-t.dtb allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb' for 20241020083124.174724-1-ryan@testtoast.com:

arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: soc: codec@05096000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: soc: codec@05096000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: soc: codec@05096000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: soc: codec@05096000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: soc: codec@05096000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: codec@05096000: allwinner,audio-routing: b'Line Out\x00LINEOUT\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: /soc/codec@05096000: failed to match any schema with compatible: ['allwinner,sun50i-h616-codec']
arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: codec@05096000: allwinner,audio-routing: b'Line Out\x00LINEOUT\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: /soc/codec@05096000: failed to match any schema with compatible: ['allwinner,sun50i-h616-codec']
arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: codec@05096000: allwinner,audio-routing: b'Line Out\x00LINEOUT\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: /soc/codec@05096000: failed to match any schema with compatible: ['allwinner,sun50i-h616-codec']
arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: codec@05096000: allwinner,audio-routing: b'Line Out\x00LINEOUT\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: /soc/codec@05096000: failed to match any schema with compatible: ['allwinner,sun50i-h616-codec']
arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: codec@05096000: allwinner,audio-routing: b'Line Out\x00LINEOUT\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: /soc/codec@05096000: failed to match any schema with compatible: ['allwinner,sun50i-h616-codec']





