Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1715E47606D;
	Wed,  2 Sep 2026 11:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349137; cv=none; b=rwD74whdr6d1oyoRtDRnHnDjP5EqFyiZo+hWZLOXfeizwAO4E0+aeP43X/2u3SJEqjG/UU1tWFNoSBjepOb+AeDD1LyrlFg6peIfmi4aO6XdwN/h2N7lkydK7H+bnn32XFtDW5hC32q/66Tney49ASZ8xUtLyECDR5lkQP5rIKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349137; c=relaxed/simple;
	bh=d2+AWnU6uUo5V5AW/6m2Dh1KbJzRFbrLmBF0S8Rk4R4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OYFxoZ/cjnOqdn1f+Q0nsicrKRKmmk3zJWKOKPpTNXPCdM/QCU/LQWVuYXmy634WT+dT5xEZ8d5Xt60AmxXqR6+/qUV4YcxiO9y/4+/2lCzWENFD07QzNUwwOIIIfw0BDHHynjpzAY+Jq4KWig4F/SmAQBiwpMZidO1Wj886//M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pe6J1kcW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pe6J1kcW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75981F000E9;
	Wed,  2 Sep 2026 11:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788349133;
	bh=rtXYPn8hr7thIL6cnopmTaP04Ex4p3gPCRzYCt+hVu8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pe6J1kcWXUiciPDWuhlRtC5+9p+jThfkWN/ikCd+QVUscLHfyFH4QKMrqCh2ZKblh
	 S2hO1azG38uYb0FcDE9w4pHciQBxpo8FgVluVUB5CZ6tDKYauJrtL76A0hAViIFsFp
	 WtIWnY6yk4ccxqGE6rHtTfezw6aDScgn5CSD2Wkei07MUNIrZHFypB4dkOw3ElZCO3
	 NOscsXVdtv7lLU3ERoHGqtBavsxhjHbTH3OLkksyVtDTrspV2JY9VyzbbHljRDNwm0
	 mrSzQtvVUp83mTWE56Wk9eyvXqN7M42HYousVtshN2cAe68eZjEDmZEwUJqnHr8Reg
	 CTyuxu0nSuuDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/12] reset: Add
 reset_control_get_from_provider_exclusive()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <619a6e41495adfdae3e2e6c0fee97e0550a5c404.1788338320.git.geert+renesas@glider.be>
References: <cover.1788338320.git.geert+renesas@glider.be>
 <619a6e41495adfdae3e2e6c0fee97e0550a5c404.1788338320.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 11:38:52 +0000
Message-Id: <20260902113852.E75981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The dummy stub for `reset_control_get_from_provider_exclusive()`=
 incorrectly returns `NULL` instead of `ERR_PTR(-ENOTSUPP)` when `CONFIG_RE=
SET_CONTROLLER` is disabled.
--

commit b2e455f4dc1ad499526bd8cbd50a8edaddca9cff
Author: Geert Uytterhoeven <geert+renesas@glider.be>

reset: Add reset_control_get_from_provider_exclusive()

This commit adds a public helper reset_control_get_from_provider_exclusive()
to lookup and obtain an exclusive reference to a reset controller. The
implementation is based on the recently introduced
__reset_control_get_from_provider() helper.

> diff --git a/include/linux/reset.h b/include/linux/reset.h
> index 9c391cf0c8229..09ee47b27f88d 100644
> --- a/include/linux/reset.h
> +++ b/include/linux/reset.h
[ ... ]
> @@ -173,6 +175,12 @@ static inline struct reset_control *__reset_control_=
get(
>  	return optional ? NULL : ERR_PTR(-ENOTSUPP);
>  }
> =20
> +static inline struct reset_control *reset_control_get_from_provider_excl=
usive(
> +				const struct fwnode_reference_args *args)
> +{
> +	return NULL;
> +}
> +

[Severity: Medium]
When CONFIG_RESET_CONTROLLER is disabled, should this stub return
ERR_PTR(-ENOTSUPP) instead of NULL?

In the reset framework, a NULL reset control is treated as a valid but
optional no-op. If a driver calls reset_control_get_from_provider_exclusive=
()
during probing on a kernel compiled without the reset framework, and the st=
ub
returns NULL, IS_ERR() will evaluate to false.=20

This would mislead the caller into believing it successfully acquired the
mandatory exclusive reset control. The driver would skip error handling and
proceed without actually performing the required hardware resets, potential=
ly
causing hardware malfunctions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788338320.gi=
t.geert+renesas@glider.be?part=3D7
