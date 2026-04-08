Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E85B3BADA2;
	Wed,  8 Apr 2026 10:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775645592; cv=none; b=qrE7Y5qbfBNLwUETaCMAF70ON0s2MnR19Xv/LV6osz4MHVKM13MsRW4jrByrn5HFQOTe7B1zqQLYOcDRO2fFmsbFVGW0c96c18BgBofNTdpf0YJnj+3Oa5qka6pDtUTZJ2IfNVpFVNOWMhAmUg5KdbEnUu2t+HdRFWsSyt4Ffd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775645592; c=relaxed/simple;
	bh=Rjn11KqJ94w5Tb07XxHG3O1GIwrQHeFSfrcL2oJFkFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNILUACme8r9OQwPoZDed/P0Sl8Z2YfUVpIRyhaUqW7RVsca1e90e87XdNTqX6Zbw2ZPc+7lu71A7k7/HEIR92up4CLFaGyUyL869f3gTCsrq05tUsUGF4t2qLKCk2aoyiIv0jxEX45ufTqFBo2lD7Tj5Pg7aaen5JoZg2aw6XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qN6GMFl8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qN6GMFl8"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AFE13593;
	Wed,  8 Apr 2026 12:51:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775645501;
	bh=Rjn11KqJ94w5Tb07XxHG3O1GIwrQHeFSfrcL2oJFkFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qN6GMFl8+gjuyjFpOAfDNN6eBaM258NATkrmnuaiBPnOK4XUxrZlMsfe25/m1/54t
	 1Mk9JRq/R934PpCFU01TQOINmlbxV6rZIy3ukEBTs7rQj5GupYS0Mv3nXJ1MTiUROs
	 qxQrf2/yYgzrle+cFygHUpKTbS57qyn7EJCrzC7I=
Date: Wed, 8 Apr 2026 13:53:08 +0300
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
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 17/21] media: dt-bindings: media: renesas,fcp:
 Document RZ/G3E SoC
Message-ID: <20260408105308.GC1928916@killaraus.ideasonboard.com>
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <5aaf561a66c24639477a99d3861ca969a81673f0.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5aaf561a66c24639477a99d3861ca969a81673f0.1775636898.git.tommaso.merciai.xr@bp.renesas.com>

On Wed, Apr 08, 2026 at 12:37:02PM +0200, Tommaso Merciai wrote:
> The FCPVD block on the RZ/G3E SoC is identical to the one found on the
> RZ/G2L SoC.
> 
> No driver changes are required, as `renesas,fcpv` will be used as a
> fallback compatible string on the RZ/G3E SoC.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

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
>  - Collected tags.
> 
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> index b5eff6fec8a9..f7e486e90e43 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -30,6 +30,7 @@ properties:
>                - renesas,r9a07g043u-fcpvd # RZ/G2UL
>                - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
>                - renesas,r9a07g054-fcpvd # RZ/V2L
> +              - renesas,r9a09g047-fcpvd # RZ/G3E
>                - renesas,r9a09g056-fcpvd # RZ/V2N
>                - renesas,r9a09g057-fcpvd # RZ/V2H(P)
>            - const: renesas,fcpv         # Generic FCP for VSP fallback
> @@ -77,6 +78,7 @@ allOf:
>                - renesas,r9a07g043u-fcpvd
>                - renesas,r9a07g044-fcpvd
>                - renesas,r9a07g054-fcpvd
> +              - renesas,r9a09g047-fcpvd
>                - renesas,r9a09g056-fcpvd
>                - renesas,r9a09g057-fcpvd
>      then:

-- 
Regards,

Laurent Pinchart
