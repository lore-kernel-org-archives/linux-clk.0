Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601E826CE2C;
	Wed,  8 Apr 2026 11:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775647943; cv=none; b=XjTwhRAiqdBIlTKY/Yc6ImmBlz+x5R6Uz+6hseDLCUsYtpLKJWOrKIJoq2VOHONJq48BtWn6oxTueYmS+AlpHY8KC3M3cA849lqtXQjDvq3yEdnjKrAv5rmDQGN/00XwmMLmGT6bKJbtNR53Q+SZm9MLgowYpGYS2wBXEiTF4XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775647943; c=relaxed/simple;
	bh=0z9xQ2bkMxCbehPYP0RxKCIo51HJ9ykabJPDevaX8zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZiHhdkDkYHk8sEU9LHqw0lsyHIyjDOP3FTTdYwMfgQBSl246s7Q+VZbxrU28nVMl/4eVv4RgsKRoFScZ1Cbn9TvcKORWQtQbUgvjSTO6b6PseQC/w7JCnVlO/dOi77UmVPz29l4TskJi80VxWU3NsyoisJhJCpKKeTvVRKpBkIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DuuJODqd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DuuJODqd"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 23EBD593;
	Wed,  8 Apr 2026 13:30:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775647851;
	bh=0z9xQ2bkMxCbehPYP0RxKCIo51HJ9ykabJPDevaX8zI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DuuJODqd45EmM8IZgQ24zMJTFDviat/fGzoWxFmdfFb06eXHxfch/amdyCxOpy9jg
	 x6jfJMFGhnAUi5ys2p48PTm2XDGciOA7XAXExVSYUZqv5COxTOaIvj8LSa9NN5h0w+
	 MpDOEC1GP69B6Zm3EUtHc4KQESh3O4SphF636ayc=
Date: Wed, 8 Apr 2026 14:32:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, geert@linux-m68k.org,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 18/21] arm64: dts: renesas: r9a09g047: Add fcpvd{0,1}
 nodes
Message-ID: <20260408113217.GD1928916@killaraus.ideasonboard.com>
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <1ba6a98ace4ad9525d054cbaa308d3aeeecfa22a.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1ba6a98ace4ad9525d054cbaa308d3aeeecfa22a.1775636898.git.tommaso.merciai.xr@bp.renesas.com>

On Wed, Apr 08, 2026 at 12:37:03PM +0200, Tommaso Merciai wrote:
> Add fcpvd{0,1} nodes to RZ/G3E SoC DTSI.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v5->v6:
>  - No changes.
> 
> v4->v5:
>  - No changes.
> 
> v3->v4:
>  - No changes.
> 
> v2->v3:
>  - No changes.
> 
> v1->v2:
>  - Squashed fcpvd0 and fcpvd1 patches into a single patch.
>  - Collected tags.
> 
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> index 95a4e30a064d..3115ab4b050f 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -1584,6 +1584,30 @@ csi2cru: endpoint@0 {
>  				};
>  			};
>  		};
> +
> +		fcpvd0: fcp@16470000 {
> +			compatible = "renesas,r9a09g047-fcpvd",
> +				     "renesas,fcpv";
> +			reg = <0 0x16470000 0 0x10000>;
> +			clocks = <&cpg CPG_MOD 0xed>,
> +				 <&cpg CPG_MOD 0xee>,
> +				 <&cpg CPG_MOD 0xef>;
> +			clock-names = "aclk", "pclk", "vclk";
> +			resets = <&cpg 0xdc>;
> +			power-domains = <&cpg>;
> +		};
> +
> +		fcpvd1: fcp@164a0000 {
> +			compatible = "renesas,r9a09g047-fcpvd",
> +				     "renesas,fcpv";
> +			reg = <0 0x164a0000 0 0x10000>;
> +			clocks = <&cpg CPG_MOD 0x1a8>,
> +				 <&cpg CPG_MOD 0x1a9>,
> +				 <&cpg CPG_MOD 0x1aa>;
> +			clock-names = "aclk", "pclk", "vclk";
> +			resets = <&cpg 0x11e>;
> +			power-domains = <&cpg>;
> +		};

This matches the documentation.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	};
>  
>  	stmmac_axi_setup: stmmac-axi-config {

-- 
Regards,

Laurent Pinchart
