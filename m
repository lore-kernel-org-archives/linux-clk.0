Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFCE57C9F;
	Fri, 28 Aug 2026 13:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925469; cv=none; b=srhkH6aboqAhaC5g5z44uJ+Y2jGELh8+uxFf6OwpmOBlobqRMq9M3yi46kb1y0yIfacGqOnYP4gKcN63+8ao0ZfO+PMsLrx0sh83ejqWG91Msd8zWFdcam8mBsDrjULHn3civaSxxZQaTJlNJd0dudb0etsSaA1/SBnGN1DcsKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925469; c=relaxed/simple;
	bh=hGkyxM1Dv8ZgoDXvVf2Y0czneNwCGy1bTIZBrH1aYLY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iZgmk2SpyKw07qVD236+U9QB3YgGGctAGAHIGNNBE6L1rql2J5PKnUchfLnQBO1Y+K+c60aNBjE9atIqwcl7Rez2Btg/lR0KF7g3XWeRBjeFK7UbQAUx2wMhZG9ZMjm9byIXhU6ZTP6KCY409/2BV2Ol82PsUGLVqDsXRNe0c0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yk1jsQKu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yk1jsQKu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC4391F000E9;
	Fri, 28 Aug 2026 13:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787925467;
	bh=fpe3NSpeBLDRShf4FPTt2aG0rL+0U/WTIihQRdJqMQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yk1jsQKutnYAbOXqF6wtjJb89aCR6N3ga497xieeCsBLi1CAlBMFFvcZYHVrmSnk+
	 vet+Ckkrim/nGRWGDW+229ymJ2VlsjFTCXDPeAGtA/VGq4YOtrNR4XA6FG7ThrWoXS
	 CKkxeX+6aXpwCR+q5aYZqXVnh1Rzp7UqQi3jepD5HoDVriiAxQYmGgenk1E4fqeqsf
	 lBTsTfYqD0c26kCG5I9CifylBLsjMwd/OJVo1UmxP7e9mjAeVy1I8iFO6eyxtS9ciJ
	 E/s7x4B7ZLkpNg8jY4oRL0FSw2iuZFwybaJztkkyJVVhSdi+evPH+g6z0VP7ou6gA5
	 6CpXiHks3fjgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/15] drm/bridge: inno-hdmi: Add .disable platform
 operation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, olteanv@gmail.com, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260828-jh7110-clean-send-v2-6-331680c8b9d1@samsung.com>
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
 <CGME20260828134824eucas1p12730831aa4d01856e0c0e6b678c82bdb@eucas1p1.samsung.com>
 <20260828-jh7110-clean-send-v2-6-331680c8b9d1@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 13:57:46 +0000
Message-Id: <20260828135746.EC4391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Atomic Context Violation: Invoking sleeping functions from atomic =
context
--

commit 2003c6678c3684f19742ce18515a5d05db18fc6c
Author: Michal Wilczynski <m.wilczynski@samsung.com>

drm/bridge: inno-hdmi: Add .disable platform operation

This commit adds a new .disable platform operation to the inno_hdmi_plat_ops
struct. It invokes this hook at the beginning of
inno_hdmi_bridge_atomic_disable() to allow platform-specific drivers to
implement their own power down sequences.

> diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/=
inno-hdmi.c
> index ebc5093f13ac4..952cc55c10f7d 100644
> --- a/drivers/gpu/drm/bridge/inno-hdmi.c
> +++ b/drivers/gpu/drm/bridge/inno-hdmi.c
> @@ -884,6 +884,10 @@ static void inno_hdmi_bridge_atomic_disable(struct d=
rm_bridge *bridge,
>  					    struct drm_atomic_commit *state)
>  {
>  	struct inno_hdmi *hdmi =3D bridge_to_inno_hdmi(bridge);
> +	const struct inno_hdmi_plat_ops *plat_ops =3D hdmi->plat_data->ops;
> +
> +	if (plat_ops && plat_ops->disable)
> +		plat_ops->disable(hdmi->dev);

[Severity: High]
The commit message mentions this hook allows platform drivers to implement
power down sequences by calling clk_disable_unprepare(). Since
inno_hdmi_bridge_atomic_disable() is called from the atomic commit pipeline
(drm_atomic_helper_commit_tail()), where sleeping is strictly forbidden,
can this lead to an atomic context violation?

Because clk_disable_unprepare() acquires a mutex internally, it is a
sleeping function. Calling it from this path could cause system instability,
kernel warnings, or deadlocks during a display modeset, DPMS state change,
or system suspend.

> =20
>  	inno_hdmi_standby(hdmi);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-jh7110-cle=
an-send-v2-0-331680c8b9d1@samsung.com?part=3D6
