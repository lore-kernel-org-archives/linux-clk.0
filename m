Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24863D3486;
	Mon, 27 Jul 2026 07:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785137743; cv=none; b=kgk9Qkj8A7HWHlYjLKTVdZhKSa5NK6pmjxI9Il3Ory1f3O2FEFBiBWEOu06WZnJGPZX4ud4e5Z2iTExq6xCUyXYooaICKT3eJdCgch4so7OG7g5Ne3rmhuTqsg7woOMOig0fiouVX6m1+0TZoybUExUHBufrDHJDhAEmVxeJAcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785137743; c=relaxed/simple;
	bh=24VEV6QOH6SHtA+zoAPjnOtQJdLtst7s6tNZS8wCggY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jU5n1Q0vgCexlVQVKIwslgmexlBB74Jlhehlp8Tq4i0QaXJXkB5s6fLsL4fDLDXecy2dSkcNbOL/BedJloGcVxi7lsc6zzYQpEw+IjoECv7PxSvWTCSxm2+ZsM2cMbEeQpSCyPmMx/HvcQwTCL/iseJ/tKs5mUjsHlEdylex/nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 1D66B202054;
	Mon, 27 Jul 2026 09:35:39 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1woFsB-001VMX-07;
	Mon, 27 Jul 2026 09:35:39 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1woFsA-000000006t9-3uCi;
	Mon, 27 Jul 2026 09:35:38 +0200
Message-ID: <084a860a77f18aaafcda4b223eec4fdcd96e75c9.camel@pengutronix.de>
Subject: Re: [PATCH RESEND 10/17] drm/spacemit: add Saturn DPU KMS pipeline
From: Philipp Zabel <p.zabel@pengutronix.de>
To: codykang.hk@gmail.com, David Airlie <airlied@gmail.com>, Simona Vetter	
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan	
 <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>, Michael
 Turquette	 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney	 <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti	 <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-clk@vger.kernel.org
Date: Mon, 27 Jul 2026 09:35:38 +0200
In-Reply-To: <20260725-k3-display-v1-10-6de34d80e86c@gmail.com>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
	 <20260725-k3-display-v1-10-6de34d80e86c@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sa, 2026-07-25 at 00:51 -0400, Cody Kang via B4 Relay wrote:
> From: Cody Kang <codykang.hk@gmail.com>
>=20
> Add the atomic KMS implementation on top of the hardware backend: one
> CRTC and one primary plane per DPU instance. atomic_check validates
> the plane rectangle 1:1 against the mode and sizes the per-channel FBC
> line buffer; atomic commit builds the cmdlist batches, maps the
> framebuffer through the DMMU and arms the cfg-ready handshake, with
> vblank events driven from the DPU interrupt.
>=20
> Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> ---
>  drivers/gpu/drm/spacemit/spacemit_crtc.c   | 815 +++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/spacemit/spacemit_planes.c | 376 +++++++++++++
>  2 files changed, 1191 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/spacemit/spacemit_crtc.c b/drivers/gpu/drm/s=
pacemit/spacemit_crtc.c
> new file mode 100644
> index 000000000000..b75ff6320501
> --- /dev/null
> +++ b/drivers/gpu/drm/spacemit/spacemit_crtc.c
> @@ -0,0 +1,815 @@
[...]
> +/*
> + * The assert and deassert orders are not mirror images: the hardware wa=
nts
> + * these.
> + */
> +static void dpu_reset_assert(struct device *dev, const char *name,
> +			     struct reset_control *rstc)
> +{
> +	int ret =3D reset_control_assert(rstc);
> +
> +	if (ret)
> +		dev_warn(dev, "failed to assert %s reset: %d\n", name, ret);
> +}
> +
> +static void dpu_reset_deassert(struct device *dev, const char *name,
> +			       struct reset_control *rstc)
> +{
> +	int ret =3D reset_control_deassert(rstc);
> +
> +	if (ret)
> +		dev_warn(dev, "failed to deassert %s reset: %d\n", name, ret);
> +}
> +
> +static int dpu_pm_suspend(struct device *dev)
> +{
> +	struct spacemit_drm_private *priv =3D dev_get_drvdata(dev);
> +	struct spacemit_crtc *a_crtc =3D priv->a_crtc;
> +
> +	/*
> +	 * Assert before gating: a reset asserted into an already-gated block
> +	 * has no clock edges to propagate on and leaves the register file
> +	 * untouched.
> +	 */
> +	dpu_reset_assert(dev, "lcd", a_crtc->lcd_reset);
> +	dpu_reset_assert(dev, "esc", a_crtc->esc_reset);
> +	dpu_reset_assert(dev, "mclk", a_crtc->mclk_reset);

It looks like these three are mirrored, and could be handled by
reset_control_bulk_assert/deassert().

> +	dpu_reset_assert(dev, "aclk", a_crtc->aclk_reset);
> +	dpu_reset_assert(dev, "dsc", a_crtc->dsc_reset);
> +	usleep_range(10000, 20000);
> +
> +	if (a_crtc->core && a_crtc->core->disable_clk)
> +		a_crtc->core->disable_clk(a_crtc);
> +
> +	return 0;
> +}
> +
> +static int dpu_pm_resume(struct device *dev)
> +{
> +	struct spacemit_drm_private *priv =3D dev_get_drvdata(dev);
> +	struct spacemit_crtc *a_crtc =3D priv->a_crtc;
> +
> +	dpu_reset_deassert(dev, "mclk", a_crtc->mclk_reset);
> +	dpu_reset_deassert(dev, "esc", a_crtc->esc_reset);
> +	dpu_reset_deassert(dev, "lcd", a_crtc->lcd_reset);
> +	dpu_reset_deassert(dev, "aclk", a_crtc->aclk_reset);
> +	dpu_reset_deassert(dev, "dsc", a_crtc->dsc_reset);
> +
> +	if (a_crtc->core && a_crtc->core->enable_clk)
> +		a_crtc->core->enable_clk(a_crtc);
> +
> +	return 0;
> +}

regards
Philipp
