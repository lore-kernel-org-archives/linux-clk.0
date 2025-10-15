Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4841F1DF75A;
	Wed, 15 Oct 2025 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760534685; cv=none; b=s1AVmBofNKJdF95WDgPjPcteQ3N/YirAtFVp/b5XNbeFWzmMuxCHcB87ouGMNB/Vs6cr2s4St4EXR6nKFYDfSQXskR6tkO7A4p7LX2PwbKt8DEWwQRn6yecrWogdxvLAgAIPqHVNzpgReeQ+uEinUYfV25dYuDP8icLgfuK/9Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760534685; c=relaxed/simple;
	bh=+PQNqX6gMuYpsO5dyv6A77vO1jpZNDtI0y4dh0PlVsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqMN44MkMzcy2srBTSVJ+02LTwnJOljoDhIjz6opIsa9JqesgiDVxgjeFqTYCgE/IYI2FRTYBnfQK1DDJB8PDH1oBhTygebYFh13BnTKy0V4WpiGNDnX50BxR0tk/qubOxtBxsvuGyuZe1ldxQNshPMqTqGHM7pabJeemzXzSFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tNH2wHcG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tNH2wHcG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4B7C2BC87;
	Wed, 15 Oct 2025 13:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760534684;
	bh=+PQNqX6gMuYpsO5dyv6A77vO1jpZNDtI0y4dh0PlVsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tNH2wHcGLKEopWnn6dtv3Guntm2gDqa28wUfwL7veY1feRvROo/0HdYgMSYoieIYm
	 3rzdAECnSHKGJ/UXeqdJErE9r3dYGT7BhbpLW+FOXaVBfm/QK0qoOctjLWjZ0HqO9j
	 7GOT1sxoQ4tHehql3ulZjEYyeKJC2LZlwakqKYeHi8IK0CkWV8dW9iUYlLlTrHG19L
	 FCbMtJiUgOhcAN+m5h0b+4l+5PNFQYpmkAIGOF4xx8wynBMhRdc8gyde0XgIsLsejY
	 yyoFXyFQDN38p8XG6KKYnhZrcODRMQ1plSTEghFIteWZHGXdVgAvqlM6w5ov+J1Ww7
	 KTuthKBgE25Ug==
Date: Wed, 15 Oct 2025 08:24:42 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 01/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller DomainBlend
Message-ID: <20251015132442.GA3241958-robh@kernel.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-2-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-2-marek.vasut@mailbox.org>

On Sat, Oct 11, 2025 at 06:51:16PM +0200, Marek Vasut wrote:
> i.MX95 Display Controller display engine consists of all processing
> units that operate in a display clock domain. Document DomainBlend
> block which is specific to i.MX95 and required to get any display
> output on that SoC.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  .../display/imx/fsl,imx95-dc-domainblend.yaml | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml
> new file mode 100644
> index 0000000000000..703f98e3321e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx95-dc-domainblend.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX95 Display Controller Domain Blend Unit
> +
> +description: Combines two input frames to a single output frame.
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut@mailbox.org>
> +
> +properties:
> +  compatible:
> +    const: fsl,imx95-dc-domainblend
> +
> +  reg:
> +    maxItems: 1

No clocks or other resources?

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    domainblend@4b6a0000 {
> +        compatible = "fsl,imx95-dc-domainblend";
> +        reg = <0x4b6a0000 0x10>;
> +    };
> -- 
> 2.51.0
> 
