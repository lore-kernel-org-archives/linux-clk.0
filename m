Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8840D883F;
	Fri, 17 Jul 2026 00:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784246730; cv=none; b=bWX1fCOiR+79A7n3MGmvBJGKB4DhliJXlW3NuYnezctoiC4ZauR7N5gTawXXwIa1KtbIkpBaHCq+7bWgCLYzb/Z3Nusl469ZziYOdfLV4BKa+GnUjwXz3/Uiqy4PXwgCbFdKRtusGBjiDX4lF6UIumR/OYCjlRG0xbGCCl7+INE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784246730; c=relaxed/simple;
	bh=FV+hVasAkzFPlDOqcm9xcCIaNi/XkzKCDR8+KOsLttE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=CZJVa534ek9gJnrAIOOSKAR5YY86GPV/4ut4tTj9TfgnCUSplrclAZmk0AhmqrEMLivW0s3807ExU7YYe2/LsKw+kj1agG/DCooq2MAf+qmW6yI93FxgSK3G4cgR0lJYXi8P5am9sII03BSiF81Ib1Sf4U64LcGW7aW6ZwiKp2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qj9VpqiE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qj9VpqiE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2AF1F000E9;
	Fri, 17 Jul 2026 00:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784246729;
	bh=sEoNHc30Ygmr289YdjGDZczw1IEztTdjdBUILej6wz4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=Qj9VpqiE7Ehhepu7zWi+9PbZsbi59beWQkYoECAliq5e4+wWKH2n0iPvrXYpZRi/K
	 rzeEaq5gzlAHbtjO7LbfnCd9G8YF7KuOpuQ+dz2MJe9DA7gG6IAvzU2K3D7di4HVVX
	 PQ3HTDjfX4Gcmzzx03a55aJ5sArxua82yjuRTNNX4dDG1pHBLjgtMKpWMxqxehvG94
	 +JAS2xjtyWfvhzV2BoH23Z2Sjqtc1x2PT4XNH10XvgIZYVEABSKlN+hcQpKn7YddnD
	 sB3HWd7E4ot5mlPuvDpDWNsBF7lm6v2Kh3Ea76/xut4i0zQkf+lwIUvPL6JiW/FTHq
	 GgTK9QCF5tuOg==
Date: Thu, 16 Jul 2026 19:05:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Russell King <linux@armlinux.org.uk>, linux-phy@lists.infradead.org, 
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org
To: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <20260717-zx29clk-v7-1-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
 <20260717-zx29clk-v7-1-408411cfcf36@gmail.com>
Message-Id: <178424672694.2081810.9844688000925078533.robh@kernel.org>
Subject: Re: [PATCH v7 01/13] dt-bindings: phy: Add zx297520v3 USB phy
 documentation


On Fri, 17 Jul 2026 00:35:37 +0300, Stefan Dösinger wrote:
> This binding will be used as a subnode of topcrm, which will be added in
> the next patch.
> 
> Why is this a child node and not #phy-cells added to topcrm itself,
> like clocks and resets as writing-bindings.rst suggests? Because
> of_phy_provider_register checks if the of_node the PHY provider is added
> to belongs to the device or is a child of the device, so I can't put the
> PHY driver into an MFD (or AUX) child without its own node.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
> 
> ---
> 
> How do I handle examples? It would be identical to the example in
> topcrm. The example needs the reset defines from the next patch in
> either case.
> ---
>  .../bindings/phy/zte,zx297520v3-usb-phy.yaml       | 96 ++++++++++++++++++++++
>  MAINTAINERS                                        |  2 +
>  include/dt-bindings/phy/phy-zte-zx297520v3-usb.h   | 12 +++
>  3 files changed, 110 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.example.dtb: /example-0/clock-controller: failed to match any schema with compatible: ['zte,zx297520v3-topcrm', 'syscon']
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.example.dtb: clock-controller (zte,zx297520v3-topcrm): 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260717-zx29clk-v7-1-408411cfcf36@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

