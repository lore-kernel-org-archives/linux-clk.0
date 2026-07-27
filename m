Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52783A1DB;
	Mon, 27 Jul 2026 07:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138604; cv=none; b=iRvdBcQ/FKnjKfrBcFWl0S4oGOaXdnBQJcZS4qICPMtJNYyKwd+M2qMx2amBRzyvm69nkxNMdko8icYqiNrsjOUWw7etaQA5p5k6Nlss8Ifve0c2OEWhncS8/EM2+5paGfwvAm0hrd/6nFitnLwpZYG+tjKQ/MffQaM0KLuc3lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138604; c=relaxed/simple;
	bh=rF7ylGka2420CCUp/GAdxsqz1RmUyL1R/XclBfC+WnM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W8ql/i65W2ja2qL6h4TLw/rV9N7ZXcBPxv4YjKY069/CNqZazmIpKeQvVag59Yvendbh9rbYxw/FYXVMVUSQBTobpHobg7qg0M+40CG+ZGvuQLs6GDs4KFwYuyeQ8oxMQ14WVWQBqjoAxV0J89h4hmrUnGDM9fVfoSylUdiHDOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E93CF20203C;
	Mon, 27 Jul 2026 09:49:58 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1woG62-001VNt-2h;
	Mon, 27 Jul 2026 09:49:58 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1woG62-000000007Mr-32Va;
	Mon, 27 Jul 2026 09:49:58 +0200
Message-ID: <5537a40f12e80b89e330f37032016de6f3b9f4c7.camel@pengutronix.de>
Subject: Re: [PATCH RESEND 12/17] drm/spacemit: add Innosilicon DP/eDP
 controller bridge driver
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
Date: Mon, 27 Jul 2026 09:49:58 +0200
In-Reply-To: <20260725-k3-display-v1-12-6de34d80e86c@gmail.com>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
	 <20260725-k3-display-v1-12-6de34d80e86c@gmail.com>
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
> Add the DP/eDP controller that sits downstream of the Saturn DPU. Two
> identical instances share one compatible; the eDP-vs-DP role is board
> wiring, so it is taken from the devicetree: an eDP panel always sits
> under an aux-bus child node, an external DP connector never does.
>=20
> The link is driven through the generic PHY framework, so the controller
> never touches a PLL register. The controller's HPD interrupt is gated by
> the DP pixel clock, which can be off exactly when a plug has to be
> caught, so the connector is also polled and the interrupt path re-reads
> the live level when it does fire.
>=20
> Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> ---
>  drivers/gpu/drm/spacemit/Kconfig            |   19 +
>  drivers/gpu/drm/spacemit/Makefile           |    3 +
>  drivers/gpu/drm/spacemit/spacemit_inno_dp.c | 2443 +++++++++++++++++++++=
++++++
>  drivers/gpu/drm/spacemit/spacemit_inno_dp.h |  328 ++++
>  4 files changed, 2793 insertions(+)
>=20
[...]
> diff --git a/drivers/gpu/drm/spacemit/spacemit_inno_dp.c b/drivers/gpu/dr=
m/spacemit/spacemit_inno_dp.c
> new file mode 100644
> index 000000000000..e88731d9b18b
> --- /dev/null
> +++ b/drivers/gpu/drm/spacemit/spacemit_inno_dp.c
> @@ -0,0 +1,2443 @@
[...]
> +static int inno_dp_probe(struct platform_device *pdev)
> +{
[...]
> +	dp->reset =3D devm_reset_control_get_optional_exclusive(&pdev->dev, NUL=
L);

Since this is only asserted in probe and deasserted in remove, you
could use devm_reset_control_get_optional_exclusive_deasserted() [1].

[1] https://docs.kernel.org/driver-api/reset.html#c.devm_reset_control_get_=
optional_exclusive_deasserted

> +	if (IS_ERR(dp->reset)) {
> +		ret =3D dev_err_probe(dev, PTR_ERR(dp->reset),
> +				    "failed to get reset\n");
> +		return ret;
> +	}
> +
> +	dp->pxclk =3D devm_clk_get(dev, "pxclk");
> +	if (IS_ERR(dp->pxclk)) {
> +		ret =3D dev_err_probe(dev, PTR_ERR(dp->pxclk),
> +				    "failed to get pxclk\n");
> +		return ret;
> +	}
> +
> +	if (dp->edp_mode) {
> +		dp->bridge.type =3D DRM_MODE_CONNECTOR_eDP;
> +		/*
> +		 * OP_DETECT is required: without it
> +		 * drm_bridge_connector_detect() hard-codes CONNECTED for any
> +		 * eDP connector and fbdev wedges at bind.
> +		 */
> +		dp->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> +				 DRM_BRIDGE_OP_HPD;
> +	} else {
> +		dp->bridge.type =3D DRM_MODE_CONNECTOR_DisplayPort;
> +		/*
> +		 * No OP_HPD: the HPD interrupt is gated by the DP pixel clock.
> +		 * Leaving it out marks the connector POLL_CONNECT |
> +		 * POLL_DISCONNECT instead.
> +		 */
> +		dp->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> +				 DRM_BRIDGE_OP_MODES;
> +	}
> +
> +	if (dp->reset) {

This check is not necessary, reset_control_deassert() handles NULL
pointers.

> +		ret =3D reset_control_deassert(dp->reset);

If the _deasserted() variant is used above, this can be removed and the
reset control doesn't need to be stored in dp.

> +		if (ret) {
> +			dev_err(dev, "failed to deassert reset: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
[...]
> +	return 0;
> +
> +err_clk:
> +	clk_disable_unprepare(dp->pxclk);
> +err_reset:
> +	if (dp->reset)
> +		reset_control_assert(dp->reset);

Same as above. Remove the unnecessary check or manual assertion
entirely.

> +
> +	return ret;
> +}
> +
> +static void inno_dp_remove(struct platform_device *pdev)
> +{
> +	struct spacemit_dp_dev *dp =3D platform_get_drvdata(pdev);
> +
> +	component_del(&pdev->dev, &spacemit_dp_ops);
> +
> +	if (dp) {
> +		clk_disable_unprepare(dp->pxclk);
> +		if (dp->reset)
> +			reset_control_assert(dp->reset);

Same as above.

> +	}
> +}

regards
Philipp
