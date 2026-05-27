Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA6E3D25CD;
	Wed, 27 May 2026 08:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779870918; cv=none; b=JCCFhK0Vvm3Q6qcYG0YIcWMP/v2EbnWFK7P4BN/GD2M8e2WRxF0D90O7+KkC9/wWTSapf9fsNqdLH0kWIvMys9TgX5RqYPxt8yYbZH8P7ziVHhRGpHcT+Ar2zV7qrVMPcUBIohi1h+Fc2s1RfcJiLTLTViihscy7HePFSAx20Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779870918; c=relaxed/simple;
	bh=Vx8cnE7qi8aFnqifDne0YAAqBpcVn3CaVw9INMTnLpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQbjAiSl+t9Stzbwwq+qtRY9YR6nZGHEHE0pSGNT8gbitROt7DX+6hCGEtgD3j9uGPz9fHarANwQZnWv8jQUVhpkOsJjwdLrZfwdtdTXkKOf+Cx9kFm3vu6uohhNBVgcFemyuNnhR2vf+rdv6saZT5fe7Ya3Wnrtd0tDQU0Jv9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgQaaD4T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dgQaaD4T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5EC1F000E9;
	Wed, 27 May 2026 08:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779870916;
	bh=M06HIPdd2IUezENrjzGwyWPgmEB4K4h1Br8XdiToDDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dgQaaD4TJmo17ETVT65PojO6wY0EUG/abrhQ4Xvi9TA5ZVx/NSC2gr5iSuhMsGm9q
	 vW6tQHRnkTYGJHNeQe7A4iJNzr6rQQnA94UTMequsmN8qsPzTupHX5wbM/naO81/w6
	 gh8uDAA2V7Luz4Y9mpjhPr5YJLOtRC0aIaOVpf5xdIZamc7av7JeEZta6SZyZymx/n
	 MHXnkAfbEB46domYvF2B4pW3uM30q4mel4wk6UHjmFzvjEvOdM1NMIEeXP+TFB7l7Q
	 dXWFoTEdjD+wJXFow0Pi8qqjf8MP1X2U3HJk3hAxDeiEzqJd8PwhiX1bA17ql93bFx
	 11Z6RSE9SGHZA==
Date: Wed, 27 May 2026 10:35:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v9 1/3] dt-bindings: clock: imx95-blk-ctl: Allow child
 nodes
Message-ID: <20260527-simple-nice-mole-99c909@quoll>
References: <20260526-csi_formatter-v9-0-ca3d8c334c39@oss.nxp.com>
 <20260526-csi_formatter-v9-1-ca3d8c334c39@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526-csi_formatter-v9-1-ca3d8c334c39@oss.nxp.com>

On Tue, May 26, 2026 at 04:57:20PM +0800, Guoniu Zhou wrote:
> Add support for child nodes in the imx95-blk-ctl binding to match
> the driver implementation which calls devm_of_platform_populate().

This is a new device, not a legacy, so you do not have exception to
document things post factum.

> 
> Add #address-cells, #size-cells properties and patternProperties
> to allow child device nodes with their own bindings.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v9:
> - New patch to address the issue of formatter acting as a child node of syscon
> ---
>  .../devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml          | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index 27403b4c52d6..33ad1c15cc9c 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -39,6 +39,17 @@ properties:
>        ID in its "clocks" phandle cell. See
>        include/dt-bindings/clock/nxp,imx95-clock.h
>  
> +  '#address-cells':

Use consistent quotes, either ' or "

> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    type: object
> +    description: Child nodes with their own bindings

No, you need SPECIFIC children listed here.

Also, description is completely redundant. You did not say anything
useful here.

Best regards,
Krzysztof

