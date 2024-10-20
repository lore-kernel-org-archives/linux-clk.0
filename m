Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0638C31A89;
	Sun, 20 Oct 2024 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729415782; cv=none; b=FBFd2RQtPLwilhwUJzfFafwqShVefYh+igxx3wpSB8amiNBsefF2IQak1B8SLNZTPkR6EpLkpO5CxcoSiGd8tseNOFQqd+4tFqcM5ZSBDVCIoZV3V4WSLNT0a0S6wwjCuouqKcEUtn0WzTwilc7tmp7E4K9nYXEQH05cljl87EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729415782; c=relaxed/simple;
	bh=Da3OOila33unrzdWnfYpRoVlyzpPJyYMwvvY2vJCLV0=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=e7DNjTpIcMfYPSJjyCUH/5q+mw952NShy6GntWKk40PfU8BSFNeqODnH2pWGiF4hGQzD9ox7g3x+W8qlT4cmtyF03/AgVvZgYB75RA6YFel9pu85H36j2fRHY4RdUcIa0aeq1WZRYh0gtA20JBFpiRH65cw39YzFJOjiwmIeS+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHj6idcE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHj6idcE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF2CC4CEC6;
	Sun, 20 Oct 2024 09:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729415781;
	bh=Da3OOila33unrzdWnfYpRoVlyzpPJyYMwvvY2vJCLV0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=GHj6idcEZV//lfCJnz4p65zbbGiyOtSMt3dDTYsJPe/je1zh22NvFeqMaqPwkK/76
	 VEK68PXK6w5OKWaVUgSYZjZIP+jfFZjGllPNPx8WkUURDOmxNybR47HgTH7qcJEXKP
	 BuehGQiNdMIhBRWJabRVCBsbrn5s0QxyXUt0DiWp2ee3YPSX8H4Pg1zahruTH8Vog8
	 PR1pINS00e63mBlXLCqCvDL2e4RgDxNb2OG4c6PPwARtPr1C8+BBDT1m7AUFqlkHKc
	 mgoeJk2Qa8GcsccLH2zrND6NJqYbjmWv1tld/G7XoteGKR+ifUHsiWZZ+a77ZifYAO
	 zaTwGlcxm3NKA==
Date: Sun, 20 Oct 2024 04:16:19 -0500
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
Cc: linux-sound@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philippe Simons <simons.philippe@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-clk@vger.kernel.org, Chris Morgan <macroalpha82@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org
In-Reply-To: <20241020083124.174724-3-ryan@testtoast.com>
References: <20241020083124.174724-1-ryan@testtoast.com>
 <20241020083124.174724-3-ryan@testtoast.com>
Message-Id: <172941577928.1287094.1057140935389285555.robh@kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: allwinner: add H616 sun4i audio
 codec binding


On Sun, 20 Oct 2024 21:30:52 +1300, Ryan Walklin wrote:
> The H616 has an audio codec compatible with the sun4i-a10 driver.
> 
> The codec is relatively cut down compared to some of the other Allwinner
> SoCs and only has a single line-out route (relying on a separate digital
> microphone IP block for input). HDMI and SPDIF audio are handled
> separately by an audio hub IP block, which is not currently implemented
> in mainline kernels. This requires some additional flexibility in the
> DMA bindings.
> 
> Add compatible string and routing for the H616 audio codec, and update
> the required DMA descriptions.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> 
> ---
> Changelog v1..v2:
> - Remove PLL_AUDIO_4X clock from definition (defined internally but
>   not used by driver and so not required in DTSI)
> - Restrict TX-only DMA definition to H616
> ---
>  .../sound/allwinner,sun4i-a10-codec.yaml      | 53 ++++++++++++++++---
>  1 file changed, 47 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml:239:5: [error] duplication of key "if" in mapping (key-duplicates)
./Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml:245:5: [error] duplication of key "then" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml:239:5: found duplicate key "if" with value "{}" (original value: "{}")
make[2]: *** Deleting file 'Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.example.dts'
Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml:239:5: found duplicate key "if" with value "{}" (original value: "{}")
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241020083124.174724-3-ryan@testtoast.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

