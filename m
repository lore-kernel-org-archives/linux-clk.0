Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C73D32E151;
	Thu, 13 Aug 2026 23:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786662189; cv=none; b=QAYYQYLOIDGGLLHrgpLliNrDIUSEnqsQp9UQI6Jd8MddDth43YoC0k3DmxstFg/vSIyuOFc1V2egLc84nBL1GOFU1cAXD5WAAsUmoRHwVuLx6pXL8MzwWwStnAANTVVKHljxX0Wc0zk+IbuLYLg4D6HoAV9qxJbT7hBF0jhu46Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786662189; c=relaxed/simple;
	bh=oWQz1Q5EfMTSqZUf27WhDgkNNSWJNFCiBPz85pllPtg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lgd0d07i3TLKQca9NbTMtBWtA/XHxydu3ysTMNivOLLpHmQxkFx8+SsWfb7b3tjJ0+JEbCCEygDvVgL0ps8/d0ehBnzqll/pVGiYkw5Yeq2II4A0btG3IOvdjuJqmuowOXERs8XwDSt/y4xt/KFPcptlLjxTWQv5tz6s/t64boU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=laali12m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="laali12m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C321F000E9;
	Thu, 13 Aug 2026 23:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786662188;
	bh=BCHnFOoN3knw3+OrutQrKHdqNWjRCW6IR2cXg9s1q7U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=laali12m3BHQt80zna5+7Vjsqj2hUGPyoJ0yHONLP3SKvoBIyU+iAYdH8VbODInWD
	 5DsVrNmB9MBoJxdDuGQ8NNHcS46ocBvIkaQEPsFhxX15b4boCOcKN9Lfw32gdiRazM
	 +9b9fzQAMSghii5FvYvcFY9FjQE9MQLVYkOLg8TVPYNOgkaMEhOFu5jtR1YpsOZZX0
	 JvOyMAR1UjDMx89mZfD+kdQgxA+tp3uThYx/raVMXmaHwlPRcrhDnj+OGt764BCyrO
	 vvvknP7zCQrIwO5E9DJ/TSIQ0KKeRC33gk6Cf3L38UrPT7XMG2JmVO2q8AwDumkTIs
	 Ba5VO8hRcQd2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/11] mfd: rz-mtu3: use device-managed reset deassert
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmin Tanislav" <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260327192425.438263-3-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260327192425.438263-3-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 23:03:03 +0000
Message-Id: <20260813230304.38C321F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] The commit message description is not capitalized, violating MFD su=
bsystem guidelines.
- [Low] Open-coding of `devm_mfd_add_devices()`.
- [Low] The newly renamed callback function 'rz_mtu3_mfd_remove' includes t=
he string 'mfd' and the driver's name.
--

--- Patch [2]: [PATCH 02/11] mfd: rz-mtu3: use device-managed reset deasser=
t ---
commit f1182ddc967373a6fde2ebff19ae553068ff4988
Author: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

mfd: rz-mtu3: use device-managed reset deassert

This commit replaces manual reset control handling with
devm_reset_control_get_exclusive_deasserted(). It also removes the manual
reset assert in the remove callback and renames it.

> mfd: rz-mtu3: use device-managed reset deassert

[Severity: Low]
This isn't a bug, but the MFD subsystem guidelines request that the
description after the subsystem prefix be capitalized. Could this be
updated to "mfd: rz-mtu3: Use device-managed reset deassert"?

> diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
> index 9cdfef610398f..6b9c6831dffa9 100644
> --- a/drivers/mfd/rz-mtu3.c
> +++ b/drivers/mfd/rz-mtu3.c

[ ... ]

> @@ -301,13 +300,9 @@ void rz_mtu3_disable(struct rz_mtu3_channel *ch)
>  }
>  EXPORT_SYMBOL_GPL(rz_mtu3_disable);
> =20
> -static void rz_mtu3_reset_assert(void *data)
> +static void rz_mtu3_mfd_remove(void *data)

[Severity: Low]
This isn't a bug, but the MFD subsystem guidelines state we should avoid
including the string "mfd" or the driver's own filename in names. Does it
make sense to rename this callback to avoid these strings?

>  {
> -	struct rz_mtu3 *mtu =3D dev_get_drvdata(data);
> -	struct rz_mtu3_priv *priv =3D mtu->priv_data;
> -
>  	mfd_remove_devices(data);
> -	reset_control_assert(priv->rstc);
>  }

[ ... ]

> @@ -361,14 +356,10 @@ static int rz_mtu3_probe(struct platform_device *pd=
ev)
>  	ret =3D mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
>  			      ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
>  	if (ret < 0)
> -		goto err_assert;
> +		return ret;
> =20
> -	return devm_add_action_or_reset(&pdev->dev, rz_mtu3_reset_assert,
> +	return devm_add_action_or_reset(&pdev->dev, rz_mtu3_mfd_remove,
>  					&pdev->dev);

[Severity: Low]
Since the custom reset assertion has been removed and this callback now only
calls mfd_remove_devices(), this essentially open-codes devm_mfd_add_device=
s().

Could this code be simplified by calling devm_mfd_add_devices() directly and
deleting the custom removal callback altogether?

> -
> -err_assert:
> -	reset_control_assert(priv->rstc);
> -	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260327192425.4382=
63-1-cosmin-gabriel.tanislav.xa@renesas.com?part=3D2
