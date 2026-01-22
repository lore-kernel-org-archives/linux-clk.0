Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3570B34F466;
	Thu, 22 Jan 2026 17:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769102142; cv=none; b=KyWsmdXW78Va3kF6Dm5HtkKsUwR3vhWfrEbH1qZWK0eihc5k2w+N2TRgWi3f2rhwhO3DhAm9ttnJiF+qqlUS4CUNMYbfTTd8BcJXR6yiqD69tZtG5nAiRufVnmt+NUuUoRBMMQmnHhIyQLnzWVTTX0UJdcVeNmmIYOnGlzqrJ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769102142; c=relaxed/simple;
	bh=N9oFGV1anFSCqAhvjOLt+RZdXVcBw3i84bo9rshL1SQ=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=MCWJFwyyiSmpi6nyRmqkpAbKrjkNSdGvXAue/OX+VLN9VHsPiPoFzpZ5AndDkQRpY3B59QAHN5VCKopwzGuz8dmciYijN/aLU58yzGpoh5UKzmLQSmZ+JsliulwdGGtbjttDBCssy8jbL6Af7BZE95ZPy47h6d2H9zEGmLGaXqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1j5uwa2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1j5uwa2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D8EC116D0;
	Thu, 22 Jan 2026 17:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769102141;
	bh=N9oFGV1anFSCqAhvjOLt+RZdXVcBw3i84bo9rshL1SQ=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=e1j5uwa2Jh9xvShduArkxH2jrqY6+wIqNScwE+maPU9o59yceVhFbRw4jX9+wjK7B
	 o4+19Sp1fdtWOBbFRSEGz24FD3nO7xWYEQe46nK8Zx05wkMSjsUrTmf/5Tz6KpZmPg
	 cXuT/UaUKp2KZel1MiUvgv3DQLtf/Ou0IGoWDhfKzWIXN7aAldcfT5t01rCAZ8vpPl
	 2S3WSfGsJwQEtYzFlQcAhXYYL0q7fOpk1empJ7AMYAY5Owu5q7BtZLschxquM36vLi
	 igq1QdZ96Y4in3jUpzHUqDPo39nDnATSA4rqkLJSH1SiiXO+W8i+ew9FN01rFy+Zve
	 XGTjQDah2U6Zg==
From: Rob Herring <robh@kernel.org>
Date: Thu, 22 Jan 2026 11:15:40 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: Michael Turquette <mturquette@baylibre.com>, imx@lists.linux.dev, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Peng Fan <peng.fan@nxp.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, 
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
 linux-kernel@vger.kernel.org, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Abel Vesa <abelvesa@kernel.org>, David Airlie <airlied@gmail.com>, 
 linux-clk@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, 
 Francesco Valla <francesco@valla.it>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
In-Reply-To: <20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com>
References: <20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com>
Message-Id: <176910209242.2703312.10656685930266629109.robh@kernel.org>
Subject: Re: [PATCH v7 0/9] Add support for i.MX94 DCIF


On Thu, 22 Jan 2026 09:01:38 +0000, Laurentiu Palcu wrote:
> Hi,
> 
> This patch-set adds support for the i.MX94 Display Control Interface.
> It depends on Peng Fan's DTS patch [1] that was not yet merged.
> 
> Also, included in the patch-set are a few extra patches that the DCIF
> driver depends on for functioning properly:
>  * 1/9 - 3/9 : add support for i.MX94 to fsl-ldb driver. It also
>                contains a patch (2/9) from Liu Ying that was already reviewed
>                and was part of another patch-set ([2]), but was never merged;
> 
> Thanks,
> Laurentiu
> 
> [1] https://lkml.org/lkml/2025/7/7/84
> [2] https://lkml.org/lkml/2024/11/14/262
> 
> ---
> Changes in v7:
> - Rebased to latest linux-next;
> - Addressed some new checkpatch warnings: kzalloc -> kzalloc_obj;
> - Fixed a couple of static check warnings in probe();
> - Added Luca's r-b tag for bridge refcounting;
> - Link to v6: https://lore.kernel.org/r/20251103-dcif-upstreaming-v6-0-76fcecfda919@oss.nxp.com
> 
> Changes in v6:
> - 2/9: Collected r-b tag from Francesco;
> - 3/9: Removed ch_max_clk_khz variable as suggested by Luca and added
>   his r-b tag;
> - 4/9: Collected r-b tag;
> - 5/9: Call drm_bridge_put() automatically in
>   dcif_crtc_query_output_bus_format() by using a cleanup action (Luca);
> - 6/9: Moved allOf: block after required: block (Krzysztof). Collected
>   r-b tag;
> - Link to v5: https://lore.kernel.org/r/20250911-dcif-upstreaming-v5-0-a1e8dab8ae40@oss.nxp.com
> 
> Changes in v5:
> - 4/9: Removed "bindings for" from the title, changed the port
>   definition and simplified the example;
> - 6/9: Fixed the way 'ldb' child node is declared: declare the
>   'ldb' child node out of if:then: block and set the property
>   to false for compatibles other than nxp,imx94-lvds-csr;
> - Link to v4: https://lore.kernel.org/r/20250903123332.2569241-1-laurentiu.palcu@oss.nxp.com
> 
> Changes in v4:
> - Addressed remaining DCIF driver comments from Frank;
> - Limit the 'ldb' child node only to CSRs compatible with 'nxp,imx94-lvds-csr'
>   in the binding file. Since LVDS CSRs are a minority, I chose to
>   use the if:then: construct instead of if:not:then:;
> - Remove the '#address-cells' and '#size-cells' from the ldb node, in
>   imx94.dtsi, as they're not needed;
> - Link to v3: https://lore.kernel.org/r/20250806150521.2174797-1-laurentiu.palcu@oss.nxp.com
> 
> Changes in v3:
> - Removed the BLK CTL patches and created a separate patch set [2] for them;
> - Collected r-b tags for 1/9, 2/9, 3/9 and 9/9;
> - Removed the DCIF QoS functionality until I find a better way to
>   implement it through syscon. QoS functionality will be added in
>   subsequent patches. Also, used devm_clk_bulk_get_all() and used
>   dev_err_probe() as suggested;
> - Addressed Frank's and Krzysztof's comments on the DCIF bindings;
> - Addressed Frank's comments on dtsi and dts files;
> - Added a new binding patch, 6/9, for adding 'ldb' optional property to
>   nxp,imx95-blk-ctl.yaml;
> - Link to v2: https://lore.kernel.org/r/20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com
> 
> Changes in v2:
> - reworked the BLK_CTL patch and split in 2 to make it easier for
>   review;
> - split the dts and dtsi patch in 2 separate ones;
> - addressed Frank's comments in DCIF driver;
> - addressed Rob's comments for the bindings files;
> - addressed a couple of checkpatch issues;
> - Link to v1: https://lore.kernel.org/r/20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com
> 
> ---
> Laurentiu Palcu (7):
>       dt-bindings: display: fsl,ldb: Add i.MX94 LDB
>       drm/bridge: fsl-ldb: Add support for i.MX94
>       dt-bindings: display: imx: Add i.MX94 DCIF
>       dt-bindings: clock: nxp,imx95-blk-ctl: Add ldb child node
>       arm64: dts: imx943: Add display pipeline nodes
>       arm64: dts: imx943-evk: Add display support using IT6263
>       MAINTAINERS: Add entry for i.MX94 DCIF driver
> 
> Liu Ying (1):
>       drm/bridge: fsl-ldb: Get the next non-panel bridge
> 
> Sandor Yu (1):
>       drm/imx: Add support for i.MX94 DCIF
> 
>  .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  26 +
>  .../bindings/display/bridge/fsl,ldb.yaml           |   2 +
>  .../bindings/display/imx/nxp,imx94-dcif.yaml       |  82 +++
>  MAINTAINERS                                        |   9 +
>  arch/arm64/boot/dts/freescale/imx943-evk.dts       |  59 ++
>  arch/arm64/boot/dts/freescale/imx943.dtsi          |  53 +-
>  drivers/gpu/drm/bridge/fsl-ldb.c                   |  46 +-
>  drivers/gpu/drm/imx/Kconfig                        |   1 +
>  drivers/gpu/drm/imx/Makefile                       |   1 +
>  drivers/gpu/drm/imx/dcif/Kconfig                   |  15 +
>  drivers/gpu/drm/imx/dcif/Makefile                  |   5 +
>  drivers/gpu/drm/imx/dcif/dcif-crc.c                | 211 +++++++
>  drivers/gpu/drm/imx/dcif/dcif-crc.h                |  52 ++
>  drivers/gpu/drm/imx/dcif/dcif-crtc.c               | 695 +++++++++++++++++++++
>  drivers/gpu/drm/imx/dcif/dcif-drv.c                | 228 +++++++
>  drivers/gpu/drm/imx/dcif/dcif-drv.h                |  86 +++
>  drivers/gpu/drm/imx/dcif/dcif-kms.c                | 100 +++
>  drivers/gpu/drm/imx/dcif/dcif-plane.c              | 269 ++++++++
>  drivers/gpu/drm/imx/dcif/dcif-reg.h                | 267 ++++++++
>  19 files changed, 2185 insertions(+), 22 deletions(-)
> ---
> base-commit: cd8eb1cf3dad15dad65060f5d18a59ab99485d01
> change-id: 20250911-dcif-upstreaming-3e16d89c3385
> prerequisite-patch-id: b2acaaf7e92a5c8e377e6b56f3a9ee7409f64b00
> 
> Best regards,
> --
> Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
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


This patch series was applied (using b4) to base:
 Deps: looking for dependencies matching 1 patch-ids
 Deps: Applying prerequisite patch: [PATCH v3 6/6] arm64: dts: imx943: Add LVDS/DISPLAY CSR nodes
 Base: base-commit cd8eb1cf3dad15dad65060f5d18a59ab99485d01 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/next-20260121 (best guess, 6/8 blobs matched)
 Base: tags/next-20260121 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20260122-dcif-upstreaming-v7-0-19ea17eb046f@oss.nxp.com:

arch/arm64/boot/dts/freescale/imx943-evk.dtb: lvds-to-hdmi-bridge@4c (ite,it6263): 'ivdd-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml
arch/arm64/boot/dts/freescale/imx943-evk.dtb: lvds-to-hdmi-bridge@4c (ite,it6263): 'ovdd-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml
arch/arm64/boot/dts/freescale/imx943-evk.dtb: lvds-to-hdmi-bridge@4c (ite,it6263): 'txavcc18-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml
arch/arm64/boot/dts/freescale/imx943-evk.dtb: lvds-to-hdmi-bridge@4c (ite,it6263): 'txavcc33-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml
arch/arm64/boot/dts/freescale/imx943-evk.dtb: lvds-to-hdmi-bridge@4c (ite,it6263): 'pvcc1-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml
arch/arm64/boot/dts/freescale/imx943-evk.dtb: lvds-to-hdmi-bridge@4c (ite,it6263): 'pvcc2-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml
arch/arm64/boot/dts/freescale/imx943-evk.dtb: lvds-to-hdmi-bridge@4c (ite,it6263): 'avcc-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml
arch/arm64/boot/dts/freescale/imx943-evk.dtb: lvds-to-hdmi-bridge@4c (ite,it6263): 'anvdd-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml
arch/arm64/boot/dts/freescale/imx943-evk.dtb: lvds-to-hdmi-bridge@4c (ite,it6263): 'apvdd-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml





