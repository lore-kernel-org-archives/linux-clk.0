Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB0A37C106;
	Wed,  8 Apr 2026 12:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775650924; cv=none; b=QKFNc9TWNJ7BHkl33bGyUDbxf+hjfEnQy9PmhaffrtMWtFUY8baiyXID/aXVktBOeYdLiBRwsmTGgbw7gSzjc0MpHa1YhSqrH64MeLZYcEDpNAC1u8DA5s8JL0VdhgsGAj11y6w7e8Ym36S9LaztKHApz0b7kiia7dcTccI8bwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775650924; c=relaxed/simple;
	bh=UmNRg11PF0Fk38Fl9fzaSSs8F52o028idmqGDQ668bM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l83XOYVW/bwgqol1zSMjNdk/pL9PI4j4A4b0tpeRR9502Picfc8PUh5h1kbeuI/RPNPCsDC2O0m5PsyfKm/yBfNstTp+TND+yvQp+Ic6ZPer/BmzVSF6C8bJg6G7N+rnHKuB4ExcI0Ny7yil7W2EGbB+DPyjCy7dalFtGX3nOc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WilDT0sI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WilDT0sI"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 78FAC1121;
	Wed,  8 Apr 2026 14:20:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775650832;
	bh=UmNRg11PF0Fk38Fl9fzaSSs8F52o028idmqGDQ668bM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WilDT0sIZm9ZPk7/0da35SY9I+LyUAkhV0PdXgYmUf5M2Q7qHaYPYVfZZc4WVMgvX
	 vuqu7zFPh4uHaI5lkCp8j7RgCancL8/4+dn8hWg4nZRv6H2bjW8tetuVYU9zGnGWSw
	 6BlN+fhjlCmww1BjXf5xbL4u37WCegemX+AAYKbI=
Date: Wed, 8 Apr 2026 15:21:59 +0300
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
	stable@vger.kernel.org
Subject: Re: [PATCH v6 09/21] dt-bindings: display: renesas,rzg2l-du: Refuse
 port@1 for RZ/G2UL
Message-ID: <20260408122159.GG1928916@killaraus.ideasonboard.com>
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <8a3dd4df30a6d950e5f38d46f4d9f396da67aa71.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8a3dd4df30a6d950e5f38d46f4d9f396da67aa71.1775636898.git.tommaso.merciai.xr@bp.renesas.com>

On Wed, Apr 08, 2026 at 12:36:54PM +0200, Tommaso Merciai wrote:
> The RZ/G2UL DU supports only a single port@0 DPI. Explicitly refuse
> port@1 in the ports node.
> 
> Fixes: 2ef7cb1cea7d ("dt-bindings: display: renesas,rzg2l-du: Document RZ/G2UL DU bindings")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v5->v6:
>  - New patch.
> 
>  Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> index 2cc66dcef870..5add3b832eab 100644
> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -102,6 +102,7 @@ allOf:
>            properties:
>              port@0:
>                description: DPI
> +            port@1: false
>  
>            required:
>              - port@0

-- 
Regards,

Laurent Pinchart
