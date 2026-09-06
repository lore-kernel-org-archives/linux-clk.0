Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2B623A99F;
	Sun,  6 Sep 2026 14:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788705089; cv=none; b=RK3G8o+oB/ilCNX+MjoIhU3mfteR2g34W0c53pN7mke3A8ms1B1epPMnJrgVgNVKNc+ED0XVsbz42sgeIU4f/SWyo1FTGzyElLz61LYHhWrOqZ8qJEWpyNEHKPfJ8VySGE92KbrKcv9hs3dOrAaaMVHxd02ghXQae/vw26mRLqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788705089; c=relaxed/simple;
	bh=bHjdm52xvbJPqvRDHvH7r1oB9BPfytjhRN24GpSDrfg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=amnxqw1fE8ujfMK/2m0mbPy18609gLlq9Tp/6HCDhlvJPZSjBzkNIreanBApkRZYLW31Pp2f4BM90nRh4PyzTEKbwJhKXC7uKzj6Fa7A+UMLBq9JktQ9VmNZOZE1RFnPGaF6x6+xmsPfgyt/N1fiYHFHesGOj8HGWVzNnqU0IHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aevSzcuk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aevSzcuk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5691F00A3A;
	Sun,  6 Sep 2026 14:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788705087;
	bh=4CuptVjxTn6Uqv5hvCmSefNWgwoSxTcJ8cbsetKdOUA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aevSzcukg1NL4O+Qyaqprgs7t5ZURRjIHnn8MTlFMVd3rYOBgbXf62nz4aEtFJsMZ
	 5FtR/mNyVdULMAbBXUfkmaRkHo1F88leIWNH8JSduJiWkaYzUMupWuJXXMM5Nxc35q
	 CmWZ18vMO1sfE4MJX7845QvXeDS0y0nxYHcIGGVMmA6YdJywsiu2vRKMCSJjOoRiCz
	 DySHh5h2heYO/gw1Xcx/PpMyYSesqE+x0gkxc5nVPgES3Aw8cPxn7WnsWhwvkeb7gN
	 TXxkE+EP4P/eIZTCJf3shqUr/uyRAgYF0PzahB3yHNpWh3jj8BKh2tWhl7XYGmcHti
	 HV0IK2RlNwtXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 2/5] phy: core: Add phy_get_by_of_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, media-ci@linuxtv.org, robh@kernel.org, linux-clk@vger.kernel.org, olteanv@gmail.com
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-2-e2197a3e2551@linaro.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-2-e2197a3e2551@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 14:31:26 +0000
Message-Id: <20260906143127.2B5691F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] phy_get_by_of_node() misses the legacy usb-nop-xceiv workaround,=
 causing infinite -EPROBE_DEFER loops.
--

commit a021b561c8a9bfb36addca720d49ea935b34a131
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

phy: core: Add phy_get_by_of_node()

This commit introduces phy_get_by_of_node() to allow looking up a phy=20
directly by its device node. It refactors the existing lookup logic in=20
_of_phy_get() into a new shared helper function called=20
_of_phy_get_with_args().

> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 89addd732bff3..490a7cde6d40a 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
[ ... ]
> @@ -1001,6 +1015,41 @@ struct phy *devm_of_phy_get_by_index(struct device=
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
Does this new API miss the legacy compatibility check for usb-nop-xceiv?

In _of_phy_get(), there is a workaround that returns -ENODEV if the
device is compatible with "usb-nop-xceiv". Because this workaround was
left in _of_phy_get() rather than being relocated into the shared
_of_phy_get_with_args() helper, phy_get_by_of_node() bypasses it
completely.

Could this cause drivers looking up a "usb-nop-xceiv" node via this new
API to receive -EPROBE_DEFER instead of -ENODEV, leading to infinite
probe deferrals and breaking fallback to the usb-phy subsystem?

> +
> +	if (IS_ERR(phy))
> +		goto out_unlock;
> +
> +	if (!try_module_get(phy->ops->owner)) {
> +		phy =3D ERR_PTR(-EPROBE_DEFER);
> +		goto out_unlock;
> +	}
> +
> +	get_device(&phy->dev);
> +
> +out_unlock:
> +	mutex_unlock(&phy_provider_mutex);
> +
> +	return phy;
> +}
> +EXPORT_SYMBOL_GPL(phy_get_by_of_node);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org?part=3D2
