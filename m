Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224BC36BCE8;
	Thu, 13 Aug 2026 23:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786664826; cv=none; b=FoZ2UtGDVy8jCt81iP336D8+LUZbf1rQqCDCZyaUISnfBKEvyi4evMn/re0HZBS3RI6l803dD+kbX3L81xNoaSkStqolQYpRk1J4cm1gi2ezQXWYlXZOuk33QuhDqTJQroEMCCRjHvhrQbSIO+2+arnC1p1KQutdBDBnArb8Dj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786664826; c=relaxed/simple;
	bh=GBI8BLMNL3iDCPeKE/QXJ7fWUBqYDsIjpNw99cjh1iE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g4g/d+9NVgo4Z2hYN+Tw3vzIwNuN2Kvag6qwvy8d8J3eGp8hwBTDwZUX7gcqAJ7+mNeFmkOfUntD3cmBOJHjtTMgbMD2svkddqop4gWYDsDHwfSro2VZ0ixqK28WYrA6oZb78EG/ESHqo4M4Tv/drufh4mPR3ooBKXpqaZ3AMFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jbduvpIl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbduvpIl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186AD1F000E9;
	Thu, 13 Aug 2026 23:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786664824;
	bh=QEzQV2S+Tfz4esfkkryx5cKNEx+qezwKDLILEi+swwM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jbduvpIl7APYt4DmHi+ICcLZ+/mnQ+mzV52E/eFWIdAnRMZQ+M+7oKjCUEln4IsR2
	 +VVcklWNn7E8SG/d1V4t2dKYQJM95UhxG4WlwqHH2KeQvnXoHaTjb55YdSS/j96wSM
	 eD6KtM9/RVuPgvcshQEKNE2xWBnO4Co5/UiVIsavnK9SxV8h9ceRkB0oaKVbynQAmV
	 Y8NlEG/m0krve8qph9IjLJqYx84G7MJFiQx3ESspOru/KwnqAl1KVUn80/bSxc9uyR
	 hWwUYF6ls2sSmXi8ZCxwkw024XIHJxg12uzBmD0+NV4WbxiDJZABUGURP/vNOuAyQh
	 C4hD9rkRY3NLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 15/21] drm: renesas: rz-du: Add RZ/G3E support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tommaso Merciai" <tommaso.merciai.xr@bp.renesas.com>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org
In-Reply-To: <11313371ef0b31cb5f014e171ba0d9868eb0710d.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
References: <11313371ef0b31cb5f014e171ba0d9868eb0710d.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 23:47:00 +0000
Message-Id: <20260813234701.186AD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Strict equality check for `rstate->outputs` fails for dual-link or=
 cloned configurations, causing incorrect clock duty cycle.
--

--- Patch [15]: [PATCH v6 15/21] drm: renesas: rz-du: Add RZ/G3E support ---
commit 93ac2aa593af29d345db6eb285c2df970c9009bd
Author: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

drm: renesas: rz-du: Add RZ/G3E support

This commit adds support for the RZ/G3E SoC to the RZ/G2L DU driver. It
introduces the RZG2L_DU_FEATURE_SMUX2_DSI_CLK feature flag to set the corre=
ct
clock duty cycle based on the selected output (LVDS vs DSI/RGB).

> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/=
drm/renesas/rz-du/rzg2l_du_crtc.c
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
[ ... ]
> @@ -64,11 +64,32 @@
>  static void rzg2l_du_crtc_set_display_timing(struct rzg2l_du_crtc *rcrtc)
>  {
[ ... ]
> +	if (rzg2l_du_has(rcdu, RZG2L_DU_FEATURE_SMUX2_DSI_CLK)) {
> +		struct clk *clk_parent;
> +
> +		clk_parent =3D clk_get_parent(rcrtc->rzg2l_clocks.dclk);
> +
> +		/*
> +		 * Request appropriate duty cycle to let clock driver select
> +		 * the correct parent:
> +		 * - CDIV7_DSIx_CLK (LVDS path) has DUTY H/L=3D4/3, 4/7 duty cycle.
> +		 * - CSDIV_2to16_PLLDSIx (DSI/RGB path) has symmetric 50% duty cycle.
> +		 */
> +		if (rstate->outputs =3D=3D BIT(RZG2L_DU_OUTPUT_LVDS0) ||
> +		    rstate->outputs =3D=3D BIT(RZG2L_DU_OUTPUT_LVDS1))

[Severity: High]
Will this strict equality check fail for dual-link LVDS configurations?

If a dual-channel LVDS panel is configured, the DRM encoder mask may contain
two encoders to drive both links. In that case, rzg2l_du_crtc_atomic_check()
would accumulate both bits, meaning rstate->outputs would have both LVDS0
and LVDS1 bits set.

Because this relies on strict equality rather than a bitwise mask check, do=
es
this condition evaluate to false and incorrectly fall back to the 50% duty
cycle intended for DSI/RGB paths?

> +			clk_set_duty_cycle(clk_parent, 4, 7);
> +		else
> +			clk_set_duty_cycle(clk_parent, 1, 2);
> +	}
> +
>  	clk_set_rate(rcrtc->rzg2l_clocks.dclk, mode_clock);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1775636898.gi=
t.tommaso.merciai.xr@bp.renesas.com?part=3D15
