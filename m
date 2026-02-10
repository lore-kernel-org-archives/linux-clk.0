Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062CB28E0F;
	Tue, 10 Feb 2026 00:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770682270; cv=none; b=fbGKBsgR7gzhj93vonsDZ4xvotAiu678YWxIyjdlLrq/vGHPizG8fCL/PWr+20YsLxGKCwLTkjU+f1APbF8oHSLs9zhzBJTZbbeLuGJ1ysWfeRVXbQZtzPQnMKqrjAjawk5AZKyXfYBGKEmRTpU3HxeI/z5YaqVGpnv3HStajd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770682270; c=relaxed/simple;
	bh=Ud0YoukFs51Dqf524eez2dDStKuRERP9yGNZoTV1W3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wi/ZFQKKfrTTG0w+AItTekeN/5AZe1u6ixkhBWdep1S05/A7MBOMy3WXtmv1om/wRq+5BT16kqziJliOufWsm1fReNdZUQdN0Gm+RA5En0K0ZnxgWDg1m24k6pOMjIbAESRI1b6t3VZQcx1GuAw581shqCNjtGNCrBpl5DC1YAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u8581pYL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u8581pYL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7990CC116C6;
	Tue, 10 Feb 2026 00:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770682269;
	bh=Ud0YoukFs51Dqf524eez2dDStKuRERP9yGNZoTV1W3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u8581pYLgfVeRMBr6/0SOwZyEfARAQvfpkx8/PMXLTNe8Iyg34QeDYhQQ/+eKLXrX
	 YyxTLXBd7NmTqalf81D2KDpIIiR1YwD/xpm7OWATh7qRGUBMvuHSu742VwinOG9S61
	 oXTiHXHTJKP/G2Y898ZydLfNVqxhC6CDpk1b/vQVgzxCBDLkTdee15dnTgz1eoB7W7
	 TJ3bW1XMJyFic1z2MBXkK3rG2vbvEyEusmI0L0Oz3wt2WoORrlBDDqhDgADzMg9noX
	 HpJnCVqWymMhiXtdOG7Xcov3gZPra0TGwxOo7I8K7kiG1s5xTpf0pkSig9/jOVfh/P
	 NqZO4dzUYFAbA==
Date: Mon, 9 Feb 2026 18:11:08 -0600
From: Rob Herring <robh@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 09/20] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Message-ID: <20260210001108.GA2165386-robh@kernel.org>
References: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
 <4986c5a3c5cda9e754ed1f9f7121b32e9bf4499f.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4986c5a3c5cda9e754ed1f9f7121b32e9bf4499f.1770030493.git.tommaso.merciai.xr@bp.renesas.com>

On Mon, Feb 02, 2026 at 12:57:40PM +0100, Tommaso Merciai wrote:
> The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
> Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> Processor (VSPD), and Display Unit (DU).
> 
>  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
>  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> 
> Add new SoC-specific compatible string 'renesas,r9a09g047-du'.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v1->v2:
>  - Use single compatible string instead of multiple compatible strings
>    for the two DU instances, leveraging a 'renesas,id' property to
>    differentiate between DU0 and DU1.
>  - Updated commit message accordingly.
> 
> v2->v3:
>  - No changes.
> 
> v3->v4:
>  - No changes.
> 
>  .../bindings/display/renesas,rzg2l-du.yaml    | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> index 2cc66dcef870..55e3fcff7030 100644
> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -20,6 +20,7 @@ properties:
>        - enum:
>            - renesas,r9a07g043u-du # RZ/G2UL
>            - renesas,r9a07g044-du # RZ/G2{L,LC}
> +          - renesas,r9a09g047-du # RZ/G3E
>            - renesas,r9a09g057-du # RZ/V2H(P)
>        - items:
>            - enum:
> @@ -53,6 +54,12 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  renesas,id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    description: |
> +      DU instance number.

If we wanted instance numbers, there would be a common property. So why 
is this needed? What's the difference between instances besides the 
ports?

Rob
