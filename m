Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9157DBE5E;
	Mon, 23 Feb 2026 17:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771868832; cv=none; b=fgImF9vMVd0Arb0gM7AuWJ8PW72351t+NOvF0chKjwNQPYJMD/iUTzFp8M3KED30wtvFrLOm/ojKrDB3LsRndumD3IOHf4msPHsYP6AuSftedLZOnYAZFQSoEx93iDppKFbagsK5YN1jXR/zNWju8V+BPhT2DSuC0GkEEqYNv4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771868832; c=relaxed/simple;
	bh=+Aw2Xh+r8FCGTL8bgRXwkwp9379G+pxf9QvZvi4Ov9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITzM2tEhcxkRrFAs5hVx10MylR4lbh+yvyuv0+MA7hlpK+3DygV4ulE3WKx43fP7HqohXrq2Zg3HBPW0zxcodtyQyrr6fSKIKeO4Um7vpPJDxVWAQ1lICh6YR7Ph4MjPM34E6v0YbMpiey+4Oy5CskmvATBOPqzftututss4GIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfjzRdcq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfjzRdcq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A10C116C6;
	Mon, 23 Feb 2026 17:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771868832;
	bh=+Aw2Xh+r8FCGTL8bgRXwkwp9379G+pxf9QvZvi4Ov9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UfjzRdcqugVEwJySaQoF8Tg2JbVpRGQjoltXaAY6vOcR0/CKJVAA0U8AVGGHmr7Df
	 3TO1QDS/Ubrep1HG+Tyghh8ct97AEcM/JDi0IPu+Du5TGrBKQVwC5pCie7ggRQfl2V
	 01jvn6qgzoqVgFTWqzKQ+v386ZKAS+3/EI8jFqzUJMIoL9bNiaBx9LYAC72GRDDzDk
	 bBgsjKEIrvcng4kzxxti+FOo2mGfS0nZDs4nONvgkjIKd6v9TWksdkzIsISOzCp3oN
	 C64jsq6YJXtIiKGGKO+8S/H0sLUzQZXjDqoInubpeDtWPVhgrYYhXs9HUj158z27zj
	 2E0walVpXVuLQ==
Date: Mon, 23 Feb 2026 11:47:11 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: David Airlie <airlied@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-renesas-soc@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>, geert@linux-m68k.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Magnus Damm <magnus.damm@gmail.com>, tomm.merciai@gmail.com,
	linux-kernel@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Maxime Ripard <mripard@kernel.org>,
	laurent.pinchart@ideasonboard.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 09/20] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Message-ID: <177186883089.4167672.1887646442668136506.robh@kernel.org>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <ca022fdbba5236c36e0cb3095db4c31e8e0cb1b8.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca022fdbba5236c36e0cb3095db4c31e8e0cb1b8.1770996493.git.tommaso.merciai.xr@bp.renesas.com>


On Fri, 13 Feb 2026 17:27:35 +0100, Tommaso Merciai wrote:
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
> v4->v5:
>  - Dropped renesas,id property and updated bindings
>    accordingly.
> 
> v2->v3:
>  - No changes.
> 
> v2->v3:
>  - No changes.
> 
> v1->v2:
>  - Use single compatible string instead of multiple compatible strings
>    for the two DU instances, leveraging a 'renesas,id' property to
>    differentiate between DU0 and DU1.
>  - Updated commit message accordingly.
> 
>  .../bindings/display/renesas,rzg2l-du.yaml    | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

