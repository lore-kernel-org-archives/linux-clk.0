Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7022931EE;
	Thu,  3 Sep 2026 23:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788477074; cv=none; b=PZwAh5y2yYWflg5LIdSMclkh2FHO+tu1atQNkoC3z26a7YLDeQKhMs4UNC5XGzlSpS/QHAmQS0mIqg6TfzRfc5aT18QI+eaFrIVZ9wctL8naMBA5udATsYBI1JBgZHiGt8YZCmhuwX8YQJtANoReLhV7fkHvkwN5u/I6OdN2CzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788477074; c=relaxed/simple;
	bh=BpAd8VcOGXx6jClww4/Uf37B2/r/LZf9zAMyjYTnas0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r1hse0XQN6wvmW0U8TB0v/mFlH3xKXKzBXi8E53QfYwSDfB0sj1ZE3zrN18BDamdzONBv4LQqabFGsOooZIfuNe+VdkejQFYmTysHWzElDP3AgHBnhKCdJpea0LjEuKcIqcuHLaRc6Uea0m55GEz6FzvbwMBJrYdjGwabXvMjt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLn+FdvH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLn+FdvH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651021F000E9;
	Thu,  3 Sep 2026 23:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788477072;
	bh=VpFd+OOzZkU6T7/ca7PRvbUYtzqVMhIfAUqsUoQ6D2c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nLn+FdvHEd3xnsVROqtq2G7xMSwoeSTk+rVsUhmKiU4nQhMwZ5U8dKc2TzEpB5hGa
	 N1CfmNjQT3Nju5sq26xv+bGUrpkNAf0+OdA8T9IoECMTvA9IY9UascI60HEag5CgX+
	 QRrGifa9LdU6FHoQgTquWCcOdCYoAX8iYYinhhO5+2RDCW6zWTaRN3btEr3wme8YSo
	 kvyHjX6Oe3Veshrw7Rnp2J7EANHHjfKMsmQu9620TM9xdlZWir5dX2xZv+gKsLMrZC
	 520X1trYtTwlZW1/M+5owRalZ6R2rq7yq2hD+f2WORfegCHdEeBjXs0s6VZ3k56JG5
	 BK2KjtyEL9xRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 2/4] phy: core: Add phy_get_by_of_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, linux-clk@vger.kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, olteanv@gmail.com
In-Reply-To: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-2-01ef1eced075@linaro.org>
References: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-0-01ef1eced075@linaro.org>
 <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-2-01ef1eced075@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 23:11:12 +0000
Message-Id: <20260903231112.651021F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly introduced `phy_get_by_of_node()` API misses the `usb-=
nop-xceiv` compatibility check, causing infinite probe deferrals instead of=
 returning `-ENODEV` when called on a legacy USB PHY node.
--

commit 2369b98c7c0d0a704a02ff8f33a033c9c232ea8e
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

phy: core: Add phy_get_by_of_node()
   =20
Add new function phy_get_by_of_node() allowing lookup of a phy by
device_node. Separates existing logic in _of_phy_get() into an internal
helper method _of_phy_get_with_args() to allow for reuse in new method.

> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index cd9ace125567a..1d060bc22d02c 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -604,22 +604,49 @@ int phy_validate(struct phy *phy, enum phy_mode mod=
e, int submode,
>  }
>  EXPORT_SYMBOL_GPL(phy_validate);
> =20
> +/**
> + * _of_phy_get_with_args() - lookup and obtain a reference to a phy by o=
f_phandle_args
> + * @args: of_phandle_args to the phy
> + *
> + * Returns the phy from the provider's of_xlate, -ENODEV if disabled,
> + * -EPROBE_DEFER if the provider is not yet registered.
> + */
> +static struct phy *_of_phy_get_with_args(struct of_phandle_args *args)
> +{
> +	struct phy *phy;
> +	struct phy_provider *phy_provider;
> +
> +	phy_provider =3D of_phy_provider_lookup(args->np);
> +	if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner))
> +		return ERR_PTR(-EPROBE_DEFER);

[Severity: Medium]
Will this lookup always fail for usb-nop-xceiv PHYs, incorrectly triggering
the -EPROBE_DEFER return?

[ ... ]

> @@ -997,6 +1009,41 @@ struct phy *devm_of_phy_get_by_index(struct device =
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
> +	struct phy *phy;
> +
> +	if (!np)
> +		return ERR_PTR(-EINVAL);
> +
> +	mutex_lock(&phy_provider_mutex);
> +
> +	phy =3D _of_phy_get_with_args(&args);

[Severity: Medium]
Does this call the helper without validating if the node represents a legacy
usb-nop-xceiv PHY?

In _of_phy_get(), there is a compatibility check for usb-nop-xceiv that
returns -ENODEV before calling the lookup logic. Because that check was
left in _of_phy_get() rather than being moved to the shared
_of_phy_get_with_args() helper, calling this new generic API on a legacy
USB PHY node will result in -EPROBE_DEFER instead of -ENODEV.

This might prevent drivers from falling back to the legacy USB PHY subsyste=
m,
potentially causing infinite probe deferrals.

> +
> +	if (IS_ERR(phy))
> +		goto out_unlock;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v14-0-01ef1eced075@linaro.org?part=3D2
