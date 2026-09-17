Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7113738F638;
	Thu, 17 Sep 2026 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643931; cv=none; b=lfylzh2LEAkqwEsna7tT5tqYFn3DZ8d4YG9drLw37ppJhgKM1nc0/yU9GgqKzsbd8+F7F1/m2GM71uwMbzJ+sPV20A1W8mFDuuUWCptQ8e5LHhEXFWd3ZjywgCqUf1V/ICqD6B9ccqUik0Ub7hxp6LFqNqQBzlmYFXmA6RrEfyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643931; c=relaxed/simple;
	bh=k2pwOkntbHRQI05svHzzo1+H+U0UZ7egh3JDM2SNQJ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B3tRi0QhHihi8yrNZFVIOSVJVF+HuA4dXhFeabzEal8qPmXe9ByPj6uv0PimaPBSRJnRrtNjUZjfECvA8JmqYw7XHjqnVbEzxCe/jWCEdgRFezXa0MbJ7eVLWkJ6NeBAhusUMoObgHRU+11RViWvFKUfpQv6bDmQMaMliW43KSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ExPVB7Hj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ExPVB7Hj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08AC41F00893;
	Thu, 17 Sep 2026 11:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789643926;
	bh=vbjDlrlxul0EwqBY2orq98dvVFNkLNMQVl0zB8HHMHY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ExPVB7HjFTpKvM5AaSEjAGftUmtpGbmISMJRca5r9QX1yslMfJ3N9E5y9MU/b7Mt1
	 84hNBSirDHXmCSjD1uhDbkMFmck4sJ707/Fi/hCHjhmB4IDmh+jVPwgDgKXa82q/Uj
	 OnI3ERrD/0lyhpjgN3tZCpqz8biwTbkb80PxCMZx0VJngYYH9EEL1r1jvC32wMnn1R
	 44PxBwSWinM+XaKyoXrpmLyBDimrFRYE0FRnuq9sK0Bw+3OWoQznXHjXe7YxUuOBhn
	 F4TJNDOEDUNOkX2knRTv81c9W26fMegvr6M4/weSg8/P7QWa7vRBnHmWxmIGFZgu2r
	 W2VN/FkdYRqAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 3/5] phy: core: Add devm_phy_get_by_of_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-3-f85c9103177e@linaro.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
 <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-3-f85c9103177e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 11:18:45 +0000
Message-Id: <20260917111846.08AC41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] phy: inconsistent log severity for device link failure
--

commit dbacb9631ec7d71b290bf2c4c3bb57ed433e17f3
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

phy: core: Add devm_phy_get_by_of_node()

This commit adds a devm variant of phy_get_by_of_node() to allow for
automatic resource release on the driver's exit path.

> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 490a7cde6d40a..10e9323566803 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -833,7 +833,7 @@ struct phy *phy_get(struct device *dev, const char *s=
tring)
> =20
>  	link =3D device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
>  	if (!link)
> -		dev_dbg(dev, "failed to create device link to %s\n",
> +		dev_err(dev, "failed to create device link to %s\n",

[Severity: Low]
Is this change in logging severity from dev_dbg to dev_err intentional?
If so, should it be documented in the commit message?

>  			dev_name(phy->dev.parent));
> =20
>  out_unlock:

[ ... ]

> @@ -1050,6 +1050,40 @@ struct phy *phy_get_by_of_node(struct device_node =
*np)
>  }
>  EXPORT_SYMBOL_GPL(phy_get_by_of_node);
> =20
> +/**
> + * devm_phy_get_by_of_node() - devm managed lookup and obtain phy refere=
nce by device node
> + * @dev: device requesting the PHY
> + * @np: device_node of the PHY provider
> + *
> + * Returns phy associated with the device_node or ERR_PTR. devres manages
> + * releasing resources.
> + */
> +struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_no=
de *np)
> +{
> +	struct phy **ptr, *phy;
> +	struct device_link *link;
> +
> +	ptr =3D devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	phy =3D phy_get_by_of_node(np);
> +	if (IS_ERR(phy)) {
> +		devres_free(ptr);
> +		return phy;
> +	}
> +
> +	*ptr =3D phy;
> +	devres_add(dev, ptr);
> +	link =3D device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
> +	if (!link)
> +		dev_dbg(dev, "failed to create device link to %s\n",

[Severity: Low]
Since phy_get() was updated to use dev_err() for device_link_add() failures
above, should devm_phy_get_by_of_node() also use dev_err() here for
consistency?

> +			dev_name(phy->dev.parent));
> +
> +	return phy;
> +}
> +EXPORT_SYMBOL_GPL(devm_phy_get_by_of_node);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org?part=3D3
