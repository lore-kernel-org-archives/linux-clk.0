Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F59372662;
	Thu, 17 Sep 2026 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643931; cv=none; b=jotqP6Xakg3ZSWqSrIZJkQ/0Dmi4gyaKecxVM2DhHvGmC8b2t16FhRR4qdmi5402mb6yRvK+q6sGVp5XOOrWwvICPk26sWLYjE8lK5q03pguxXVPeI+vsH7ew9I0qk/KkIIySbbtKUTlv9zgbOKJab51zjSknPZPTPJWIQHOge0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643931; c=relaxed/simple;
	bh=6geB9unujGO04rp1fXCf6Tjxeqg+nqKmqElue5xoP0Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=miWxMHz+LK2Bu1JfilqSNgEIx5yjEDmT4ja8h4Al7dteI+vxf9H5HGwQ55iV2gUIAjhWRN5McwxEJ9uOT7KPvyTmp30uxLT3LuXb7fytXE00m1fWEDVWueYoTg7prapBSbf0YVsGsqGcvWBVKaAJ0ke9tHDhHZBDnWtYq9fsVkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=inCUYLJe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="inCUYLJe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B28E31F000FF;
	Thu, 17 Sep 2026 11:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789643925;
	bh=+DyLswLX2Y42eiWuvsMgtzrRBjaK8b4kmwZ8IlfxW0c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=inCUYLJe30um5vnB5LMyRbXRCYS573Z2hCASyaI2oYQpNDtu8lucxVUQHVXogmj5h
	 eNKo/Aa58kLyGMjimPMM1mwzjK2LpC/ruOZUfu2UrFbRkWNWMBfNvRrK/Jkw0AdxBt
	 wsqwQ9OpJHatkxK6TbTDMhF2KUfrpVIGlFj64PWkvm6GEcAWwEkp6gE/CNCIOr9I/V
	 YeLn9qPXyTCVuw7ekGmQGAKdng7OcJw0O3/oqu/o/qzHoJeQ0RawxcMUZngzWD53ey
	 9Xn6bLZtLnJOO+fLDqyQ4ZsKowep7nfLuc/RcnQAyXhxIA6p3WeSYLJIvz2GP7uRCZ
	 SCg781dQN6A7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 2/5] phy: core: Add phy_get_by_of_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, olteanv@gmail.com, robh@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-2-f85c9103177e@linaro.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org>
 <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v18-2-f85c9103177e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 11:18:44 +0000
Message-Id: <20260917111844.B28E31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] phy: phy_get_by_of_node() bypasses usb-nop-xceiv legacy check
--

commit d8c1cc00496d43b5d8e3b5f03853e461912120c9
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
phy: core: Add phy_get_by_of_node()

This commit introduces phy_get_by_of_node() to allow PHY lookups by device
node. It splits the lookup logic from _of_phy_get() into a new internal
_of_phy_get_with_args() helper.

> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
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
Does this bypass the legacy compatibility check for usb-nop-xceiv PHYs?

Looking at the newly introduced helper _of_phy_get_with_args(), it does
not contain the check for usb-nop-xceiv that remains in _of_phy_get():

drivers/phy/phy-core.c:_of_phy_get() {
        ...
        /* This phy type handled by the usb-phy subsystem for now */
        if (of_device_is_compatible(args.np, "usb-nop-xceiv")) {
                phy =3D ERR_PTR(-ENODEV);
                ...
        }
        ...
}

Because phy_get_by_of_node() calls _of_phy_get_with_args() directly,
if it is called on a device node with the usb-nop-xceiv compatible string,
it will fail to find the legacy PHY provider and return -EPROBE_DEFER
instead of -ENODEV.

Could this cause caller drivers to enter infinite probe deferral loops
since the legacy PHY will never register with this generic framework?

> +
> +	if (IS_ERR(phy))
> +		goto out_unlock;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v18-0-f85c9103177e@linaro.org?part=3D2
