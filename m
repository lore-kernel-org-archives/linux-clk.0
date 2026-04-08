Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583913B9DA3;
	Wed,  8 Apr 2026 10:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775645574; cv=none; b=OlGUV+LuZqvDa+tElVyMphqUpmGZntCJXXFrrKi+kJZX7K//8mKNKVN4MjAaLsnL5ihevKhHaPwI/Q8XBa3pY4iUKQqx2/qD45gy4frPJCdTvxyVBD6RefN6m7aQKZQr68aX7lqWpQyuf70Od4xfpenguSJo23Oznu+KEvyfqgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775645574; c=relaxed/simple;
	bh=eOf7WaILLGdFbtza4ISZNW1ylaaLT25hB73ERulW5YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZ2p3kvTGUg07AXCEK0XWNDx0v+eBrYMaV9fvU8ifHHkj9bBcmAL5ZqMZQYEPDQsHVg/6gB0QvHJPBs2orcSAf4zJ8uQ/gTy2sPtRbiRIyIvZRAqavQQOT0PAqYC8z59TZu+rlrcEUOndMCWV6Fjecs7RF6aywDrR6idIyaqDH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t+iy0P9e; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t+iy0P9e"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8BE482D5;
	Wed,  8 Apr 2026 12:51:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775645480;
	bh=eOf7WaILLGdFbtza4ISZNW1ylaaLT25hB73ERulW5YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t+iy0P9eg/dvPO+Q8xI/f+tycBOM1I3CqaodI9n6Of3CdDQthjnhepI79Hi2wZtqv
	 KX6caWnwKfk9sR42ULyPksqsKTFjwLpLNIZBkzo3IH090F/eAHceDnoryUhGdaB8Ui
	 v5EcEQXtDDnfrWSEXCProkaFqu51x1XFU0+LTBEc=
Date: Wed, 8 Apr 2026 13:52:47 +0300
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
Subject: Re: [PATCH v6 16/21] media: dt-bindings: media: renesas,vsp1:
 Document RZ/G3E
Message-ID: <20260408105247.GB1928916@killaraus.ideasonboard.com>
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <c1e2eb36af01e0cddd8050ba70847c3a0821c91e.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c1e2eb36af01e0cddd8050ba70847c3a0821c91e.1775636898.git.tommaso.merciai.xr@bp.renesas.com>

On Wed, Apr 08, 2026 at 12:37:01PM +0200, Tommaso Merciai wrote:
> The VSPD block on the RZ/G3E SoC is identical to the one found on the
> RZ/G2L SoC.
> 
> No driver changes are required, as `renesas,r9a07g044-vsp2` will be used
> as a fallback compatible string on the RZ/G3E SoC.
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
>  Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> index 07a97dd87a5b..62bff3ce3eaa 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> @@ -25,6 +25,7 @@ properties:
>            - enum:
>                - renesas,r9a07g043u-vsp2   # RZ/G2UL
>                - renesas,r9a07g054-vsp2    # RZ/V2L
> +              - renesas,r9a09g047-vsp2    # RZ/G3E
>                - renesas,r9a09g056-vsp2    # RZ/V2N
>                - renesas,r9a09g057-vsp2    # RZ/V2H(P)
>            - const: renesas,r9a07g044-vsp2 # RZ/G2L fallback

-- 
Regards,

Laurent Pinchart
