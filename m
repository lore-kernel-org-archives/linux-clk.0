Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4BB42A82;
	Mon, 27 Jul 2026 07:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785137742; cv=none; b=r48BYI4QV3JmO1LATBp0CjAV8OQsw+dIRWK6VNZwgupyVYeZY37+FAroggW5BF7hVBib2aV7Qa5IhX6GueaUJaZylKYooCQIN1rMnibJjvl/huyPr4dDbaxPrIyqTTthelTmLdvVbVPrTnVjIE6PDxTSCvuZMFQl2y4Gum/jDaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785137742; c=relaxed/simple;
	bh=KpM88UNWtFhUZh+I87vyefx720qL9DegkTtGz+0lth0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iQkIl2WIjq5oYjFV8jD3dELAslrM2LpLVU9e4Vi0yflF/tn651iZbjajpCEB5NpD2xviB5/hik2ZoU2ULv8OzB2Sh/vh2KiEFXuXf2Tvebs+2q1/8R1RUU83eIyXDYHQzRJ0fVHL4Rnz9GmRaMNsed0Clk5VJ40d21ZTV+zvAjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E504A202053;
	Mon, 27 Jul 2026 09:35:35 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1woFs7-001VMT-2c;
	Mon, 27 Jul 2026 09:35:35 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1woFs7-000000006sn-2xjW;
	Mon, 27 Jul 2026 09:35:35 +0200
Message-ID: <3d4204dbd1c73d50193144d1944d8237c625f6e3.camel@pengutronix.de>
Subject: Re: [PATCH RESEND 08/17] drm/spacemit: add Saturn DPU core types,
 cmdlist and display MMU
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
Date: Mon, 27 Jul 2026 09:35:35 +0200
In-Reply-To: <20260725-k3-display-v1-8-6de34d80e86c@gmail.com>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
	 <20260725-k3-display-v1-8-6de34d80e86c@gmail.com>
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
> Register programming of the Saturn DPU is batched: the driver builds
> per-module register lists in memory and the hardware command-list
> engine replays them at frame boundaries, while scanout buffers are
> mapped through the DPU's private address translation unit (DMMU)
> rather than scanned out by physical address.
>=20
> Add the shared driver types, the MMIO field accessors, the trace
> events, the command-list builder and the DMMU table code. Some DPU
> configuration registers are write-only, so a read-modify-write would
> corrupt neighbouring fields; byte- and halfword-aligned fields are
> therefore written at their native width instead.
>=20
> Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> ---
>  drivers/gpu/drm/spacemit/dpu/dpu_saturn.h   |  35 +++
>  drivers/gpu/drm/spacemit/dpu/dpu_trace.h    | 350 ++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/spacemit/spacemit_cmdlist.c | 304 ++++++++++++++++++++++=
++
>  drivers/gpu/drm/spacemit/spacemit_cmdlist.h | 146 ++++++++++++
>  drivers/gpu/drm/spacemit/spacemit_crtc.h    | 259 ++++++++++++++++++++
>  drivers/gpu/drm/spacemit/spacemit_dmmu.c    | 103 ++++++++
>  drivers/gpu/drm/spacemit/spacemit_dmmu.h    |  40 ++++
>  drivers/gpu/drm/spacemit/spacemit_dpu_reg.h | 108 +++++++++
>  drivers/gpu/drm/spacemit/spacemit_drm.h     |  68 ++++++
>  9 files changed, 1413 insertions(+)
>=20
[...]
> diff --git a/drivers/gpu/drm/spacemit/spacemit_cmdlist.h b/drivers/gpu/dr=
m/spacemit/spacemit_cmdlist.h
> new file mode 100644
> index 000000000000..d5acdbeb3b0e
> --- /dev/null
> +++ b/drivers/gpu/drm/spacemit/spacemit_cmdlist.h
> @@ -0,0 +1,146 @@
[...]
> +struct spacemit_crtc {
> +	struct device *dev;
> +	struct drm_crtc crtc;
> +	const struct dpu_core_ops *core;
> +	struct dpu_mmu_tbl mmu_tbl;
> +	int dev_id;
> +	int irq_online;
> +	struct timer_list cfg_rdy_timer;
> +
> +	bool is_1st_f;
> +	bool first_modeset;
> +	struct dpu_clk_context clk_ctx;
> +	u32 aclk;
> +	u32 out_format;
> +
> +	struct reset_control *mclk_reset;
> +	struct reset_control *lcd_reset;
> +	struct reset_control *esc_reset;
> +	struct reset_control *aclk_reset;
> +	struct reset_control *dsc_reset;

Why are these duplicated from spacemit_drm_private?
dpu_pm_suspend/resume() in patch 10 have access to priv.

regards
Philipp
