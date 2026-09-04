Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB751EFF93;
	Fri,  4 Sep 2026 13:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529757; cv=none; b=hNedG842fOfXFPDkZne2Uj9ALz8BpxtfNgH+SeCdn3P1SRKtuIV+PAkaJnP/QBs0RXwVjXAgSCax0sM6U23ik3WObKZx7pSHMOXyb6VImV20Y56JxgLutrLLtlBI0rJL//ZdFm8hR1uYY8bUthfxIfg6YM7GjriLSFmk/GCFy6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529757; c=relaxed/simple;
	bh=z9CgBpz4nRqmjxa+GUDa+CNQc6T9g1IawNE+NP7l1ZI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bXHf/A8USQuS52LV5LWr+2WfsIycPi2y9C0aV/2Ggof8irb9jJOvGiCOf98dKEiZ63PfdihCIOZUvpcU9itYu+2MCB4qgAQrLPOFXME0nkJzUbUfehZyoEpiVVri0+SImNpgojjMgNxfGlwkDuDLPFMLu87wy5pP3p5uRoUVBE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hsuPaBNl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hsuPaBNl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5944F1F00A3D;
	Fri,  4 Sep 2026 13:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529756;
	bh=Kc0jjiNx6Kq8ngc29fQqe8dP+shw+RZ+vD1GVe3R4AQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hsuPaBNlbrjz5g+9i85O5q/yR8Q6LkFhDoPvRU2JHxuTyXryLdg+Wd6WG4I6CLlXI
	 7VA07bBwh/q46u5NBjqN6Mz/SLBdKbrp3UdPvNA1afKyUF9jWSA0bgOkO9/9Le1OJ4
	 YIFLGnm/0HliUrpBrOWGoqxj00AV5lDTAfPKTLA783scNa0kCstiF6YGUVah6ufWj/
	 zwxY5XeE+DByIQctFnwEp5Jf6xCbEwXFpn/ZbpLSDtglDEj39lg0NIYD8XL0Ie0iub
	 9YbIzkmAfe5vXKlZEWvnCedeVAIgKgnCCpTkBQQ9Al6rG2uG7/nLmaU+UYL9VGNUW6
	 sG2PyVdzFU1Uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/19] drm/bridge: inno-hdmi: Add .disable platform
 operation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: vkoul@kernel.org, dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, olteanv@gmail.com, lee@kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-phy@lists.infradead.org, robh@kernel.org
In-Reply-To: <20260904-jh7110-clean-send-v3-9-484f9ae72715@samsung.com>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132725eucas1p19c8f66b7844108641dec1d2c39989dd5@eucas1p1.samsung.com>
 <20260904-jh7110-clean-send-v3-9-484f9ae72715@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 13:49:14 +0000
Message-Id: <20260904134915.5944F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardware Teardown Order Inversion Risking MMIO Aborts
--

commit 3edb8b3d87e91fedec7589ce07bc351965b21765
Author: Michal Wilczynski <m.wilczynski@samsung.com>

drm/bridge: inno-hdmi: Add .disable platform operation

This commit adds a new .disable platform operation to the Innosilicon HDMI
driver to support platform-specific power down sequences. The new callback
is executed during the bridge's atomic disable phase.

> diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/=
inno-hdmi.c
> --- a/drivers/gpu/drm/bridge/inno-hdmi.c
> +++ b/drivers/gpu/drm/bridge/inno-hdmi.c
[ ... ]
> @@ -886,6 +886,10 @@ static void inno_hdmi_bridge_atomic_disable(struct d=
rm_bridge *bridge,
>  					    struct drm_atomic_commit *state)
>  {
>  	struct inno_hdmi *hdmi =3D bridge_to_inno_hdmi(bridge);
> +	const struct inno_hdmi_plat_ops *plat_ops =3D hdmi->plat_data->ops;
> +
> +	if (plat_ops && plat_ops->disable)
> +		plat_ops->disable(hdmi->dev);
> =20
>  	inno_hdmi_standby(hdmi);

[Severity: High]
Does calling the platform disable callback before inno_hdmi_standby() risk
MMIO aborts?

The platform disable hook (such as the JH7110 implementation mentioned in t=
he
commit message) typically powers off the PHY and disables clocks. However,
inno_hdmi_standby() attempts to perform MMIO writes to PHY registers like
HDMI_PHY_DRIVER and HDMI_PHY_PRE_EMPHASIS.

Accessing hardware registers after the PHY has been powered off and clocks
disabled can cause a synchronous external abort (bus hang) or silent
failures on many SoC architectures.

Since plat_ops->enable() is called prior to configuring the PHY registers
during setup, should the teardown follow a strict LIFO order where
inno_hdmi_standby() is called before plat_ops->disable()?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-jh7110-cle=
an-send-v3-0-484f9ae72715@samsung.com?part=3D9
