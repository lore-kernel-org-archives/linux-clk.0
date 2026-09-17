Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154D34CDDC2;
	Thu, 17 Sep 2026 15:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659400; cv=none; b=VjqZszgAEKnE78sLaPriCtf7GlMPeyolC8hKtMVjrRpcivPVNpdljLvhLEO31laP32VzPzkmqCXzvleZKm2RKlofwDlDJO/tB5GeAp/TAuOyZM0ujuZBqaGiFE20eoyHhTtGbT3dJLQwaIdd036jYzhAITTsiCeBpkbMhUGANY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659400; c=relaxed/simple;
	bh=UPtXOsu7wqbJZV2urrNW7waoApGogK7ROGShv23l6n4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l+jFHAi/88DjLyHANE2Z93vLk8UOjJxjphb5ye42LTW8pFuvRjCUOPa/8scr+8Mqvm33yJbk0KKye74ODDiIC+5QB5P7PKPgwHaQ1Qjr5+2h0a1nTTIUWXQ7riq7U6G39ltVlHMyFA4KspRznGTohy85wyXWCiH1If19eiTEdpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9kefnNk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9kefnNk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E591F000FF;
	Thu, 17 Sep 2026 15:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789659390;
	bh=xTXW7uV7jJVL51Axx4zFbVYO+4vJeM7He4b78bXCOpY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K9kefnNka4+iVFRhfxCO+tL1ejBCr31qAIrlIX/Vs1mtSNyQ9dJVzRjrKu4jEQCy4
	 xQ/rJ1isqC/6kvniZ5fGefprgwumXEAUtHuIzsum5sXTbZ+c0bREUgfDB3NwMIlV8X
	 QuzqKwID6qPF1eHg2KTgQPAEawKDfEVvP4wOsS/MAxH1IPVcenMAgkZ1/DuV/M+xxl
	 o0G3FN7EvQ/tmlR2vEkHQfYEtO0idk2FCQX2LbfKcmLHjPVym6W80d9tbNDCoBsQzC
	 Ump2ffHzUdO7pETS9oOo2c8mPGt5DLoozTgtvmDJOO6tNwpsXzCa5dUI+sqcxDsyKL
	 K/uuR9WNjVe9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 2/5] phy: core: Add phy_get_by_of_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: olteanv@gmail.com, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, vkoul@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-2-21ad8a76e941@linaro.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
 <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-2-21ad8a76e941@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 15:36:29 +0000
Message-Id: <20260917153630.02E591F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] phy: core: missing #phy-cells validation in phy_get_by_of_node() c=
auses silent misbehavior
- [Medium] phy: core: missing usb-nop-xceiv compatibility check in phy_get_=
by_of_node()
--

commit da2f62e45c36c5bbb5ae2340d33b32c34093c095
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

phy: core: Add phy_get_by_of_node()

Add new function phy_get_by_of_node() allowing lookup of a phy by
device_node. Separates existing logic in _of_phy_get() into an internal
helper method _of_phy_get_with_args() to allow for reuse in new method.

> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 89addd732bff3..4a8e1d3cdfe75 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c

[ ... ]

> @@ -1001,6 +1017,41 @@ struct phy *devm_of_phy_get_by_index(struct device=
 *dev, struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
> =20
> +/**
> + * phy_get_by_of_node() - lookup and obtain a reference to a phy by devi=
ce_node
> + * @np: node containing the phy
> + *
> + * Returns the phy associated with the device node or ERR_PTR.
> + */
> +struct phy *phy_get_by_of_node(struct device_node *np)
> +{
> +	struct of_phandle_args args =3D { .np =3D np, .args_count =3D 0 };

[Severity: High]
Does this hardcoded args_count =3D 0 bypass the #phy-cells validation that
normally happens in of_parse_phandle_with_args()?

If called on a PHY provider node with #phy-cells > 0 (e.g. resolved via an =
OF
graph endpoint), the provider's of_xlate callback will receive args_count =
=3D 0.

Since many callbacks don't check args_count and directly access args->args[=
0]
(which is initialized to 0), could they silently return PHY 0 instead of
returning an error, causing the caller to operate on the wrong PHY instance?

> +	struct phy *phy;
> +
> +	if (!np)
> +		return ERR_PTR(-EINVAL);
> +
> +	mutex_lock(&phy_provider_mutex);
> +
> +	phy =3D _of_phy_get_with_args(&args);

[Severity: Medium]
Is this missing a compatibility check for "usb-nop-xceiv"?

In _of_phy_get(), legacy USB PHYs are explicitly checked and return -ENODEV
so they can gracefully fall back to the older usb-phy subsystem.

Because phy_get_by_of_node() directly calls _of_phy_get_with_args() without
this check, could a driver using this API on a legacy USB PHY node fail to
find a generic PHY provider and receive -EPROBE_DEFER, causing an infinite
probe deferral loop?

> +
> +	if (IS_ERR(phy))
> +		goto out_unlock;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org?part=3D2
