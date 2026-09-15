Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C4E4A3F03;
	Tue, 15 Sep 2026 15:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486985; cv=none; b=cqX2vOT2uiYufCV7pTp2oL8xwN/fufchPijfKwmUz5YkmXMLobWDW2Kt2vEg8adFSqa47JqUNR2on0su4FK1Y0jEWnatvzCNKtFg7JZKA3q090Gavm2dIHBgB64i38NgKsqDe7DYkrGnVdRbXGEhL9RVgcP4VgtPVrCiLCdBfBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486985; c=relaxed/simple;
	bh=cdf5+rGDxhzMWd72yjv0Z6iqlsVPPWfAuPjsQpChQaU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OxdvOfLWsFKJVu3SCAb/usegdF1AJMVubDp2zwb/bFpfLL5BeyGLvWIaIm8P6KTobY+fb03OfckrfgKsw8SBrD+IerCMPhB2xf949MtRpzPXvEwEPSJHTYRkZkMakHwdWbCiU/FmrM5eUB2HzkG+V0UN1SyaMANGU3YLhlEya28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWoFG9h8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWoFG9h8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07CD1F000FF;
	Tue, 15 Sep 2026 15:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789486983;
	bh=/Q+TKB0dTqPeN8L0VQL0IxsQ2XnGw89/lImhUA0TRIc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FWoFG9h81W+EkeK6xWljLNGhi+4q24AllFDgLT9ezExiwRZj9G8qbHkRePJo+7VL+
	 YTbDGrwWdrikTHq6JsHf9EAERMMq6nazGfDxgx9UPbk/OvyJ7qaNpwon+330J+G67h
	 UgU00QlM4ZwrbAjfZtwwpzsDAk3gSk+oS6dlx67YrMZDPLHs7eGby3nUIOhvtzsSmP
	 mRyQ9RVjZ3tKQwrMLOQGQXpRqJgCRIDnrdDCJwy3Mx/TMJI6WPvuROLSRrnkatSeVW
	 SEREuibAJD8pc607CF+dQ0o/8oPZJcpELssrY1oQYmI4/T/oeuCtmnpPRcsDRHl6Sq
	 PG8Z8Do4o3nwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/20] drm/bridge: inno-hdmi: Add .disable platform
 operation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: devicetree@vger.kernel.org, lee@kernel.org, dri-devel@lists.freedesktop.org, olteanv@gmail.com, robh@kernel.org, mfd@lists.linux.dev, linux-phy@lists.infradead.org, vkoul@kernel.org, linux-clk@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org
In-Reply-To: <20260915-jh7110-clean-send-v4-9-f0e4fd6f2cc8@samsung.com>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153229eucas1p2d1b02b6f3871d6b536f678b9ea293c1c@eucas1p2.samsung.com>
 <20260915-jh7110-clean-send-v4-9-f0e4fd6f2cc8@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 15:43:02 +0000
Message-Id: <20260915154302.F07CD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/bridge: inno-hdmi: sleep in atomic context via .disable hook
- [Medium] drm/bridge: inno-hdmi: hardware teardown LIFO ordering violation
--

commit f7201b9edd5364bfbb0fe7f6dfc6706a0f43adf3
Author: Michal Wilczynski <m.wilczynski@samsung.com>

drm/bridge: inno-hdmi: Add .disable platform operation

This commit introduces a new .disable platform operation to the Innosilicon
HDMI driver and invokes it in inno_hdmi_bridge_atomic_disable(). It allows
platform-specific drivers to implement power down sequences for PHYs and
clocks.

> diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/=
inno-hdmi.c
> index 1264152fb1434..06917e83c5e53 100644
> --- a/drivers/gpu/drm/bridge/inno-hdmi.c
> +++ b/drivers/gpu/drm/bridge/inno-hdmi.c
> @@ -886,6 +886,10 @@ static void inno_hdmi_bridge_atomic_disable(struct d=
rm_bridge *bridge,
>  					    struct drm_atomic_commit *state)
>  {
>  	struct inno_hdmi *hdmi =3D bridge_to_inno_hdmi(bridge);
> +	const struct inno_hdmi_plat_ops *plat_ops =3D hdmi->plat_data->ops;
> +
> +	if (plat_ops && plat_ops->disable)
> +		plat_ops->disable(hdmi->dev);

[Severity: High]
Does this code introduce a sleep in atomic context? The
inno_hdmi_bridge_atomic_disable() function runs from
drm_atomic_helper_commit_tail(), which is an atomic context where sleeping =
is
strictly forbidden. However, the commit message mentions this hook is meant
for calling phy_power_off() and clk_disable_unprepare(), which can sleep.

[Severity: Medium]
Will this break LIFO teardown ordering? Disabling the platform PHY and cloc=
ks
via plat_ops->disable() before calling inno_hdmi_standby() leaves the inter=
nal
HDMI controller configured while its underlying hardware is powered down. To
maintain proper LIFO ordering, shouldn't inno_hdmi_standby() be called first
to put the internal PHY registers in standby before disabling the platform
clocks and PHY?

> =20
>  	inno_hdmi_standby(hdmi);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-jh7110-cle=
an-send-v4-0-f0e4fd6f2cc8@samsung.com?part=3D9
