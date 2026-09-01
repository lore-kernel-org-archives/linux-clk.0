Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ED046D09A;
	Tue,  1 Sep 2026 07:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248508; cv=none; b=m07A/ITTgdDftjJ7+PE0IanlN6GCKruiRsu1F85oygsAGggqgQUWPZRMgf76TXWL60n8iiuxskuI15vs71U4d7TXo1F0EPPDdCymifXt3K1dsVnS9EU3u78yaiDzIcKBH3uq0uluDULTw7xeVb/YdJo2OObzbQOwiQQyimqy+jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248508; c=relaxed/simple;
	bh=df/4MTt97k+qsBWBTQ61mJThjh1c/52YmdChnxnwGyk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fzDFQo7LNI2WwyEoOIqYY+TA+BT7W6L1BvxPg+O7yn9bh1wo1oLQejs9zYn3iQFI/6t2WLodobMRQGzrjzBiRHttancQqUtx9xdASOq3GqR1UB8XwUsNULaKgqU5E4U8r3c3QRQHWlLckr29FjlzDYjC/4vlqrbbEz4IPS88K6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=czqNmL9m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czqNmL9m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94ABC1F000E9;
	Tue,  1 Sep 2026 07:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788248506;
	bh=Rd/t35fFP99ycpXAvCZrmHiEO0yQPbJOg/LHZhiP3B0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=czqNmL9myWIT/U9dd/YdkMSOAxVrwGdm8aeZndF3JTr7DfCblpgvqkuASrbDnPhXi
	 aqjYLjZRhDLnovKBleApLD2CFW776ZFR9s3MabDRcvp9GhlfPnePjQ3lqF9mYNh/o/
	 5pUaDyfcwAy3R8BnnSSGZomFHwZcu+vV86NBrk0nNuMOIj3vzBCd130/OABntOQpvw
	 DzbBBx+Old0NXMomMoMgWmnJGxufQcZ1iGVLhLHLgkqWFSH5C+Hbvkg5ThiUEqbjwU
	 ihQYC7hq602HKfMqe+mmWjxmXsKeEbaPRN94GwZCbM/dejHkvruimgRaiP0h5CkBaS
	 ZtFofJgbr0HNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 10/11] clk: realtek: Add RTD1625-ISO clock
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260901072446.2563145-11-eleanor.lin@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
 <20260901072446.2563145-11-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 07:41:46 +0000
Message-Id: <20260901074146.94ABC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but there is a Preex=
isting Use-After-Free race condition on probe failure due to incorrect regi=
stration order.
--

commit b5c9e12f17852a162c80193126ca4d9d2d466a7f
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Add RTD1625-ISO clock controller driver

This commit adds support for the ISO domain clock controller on the Realtek
RTD1625 SoC. This controller manages clocks in the always-on power domain,
ensuring essential services remain functional. The driver acts as the parent
device and registers the reset controller as an auxiliary device.

> diff --git a/drivers/clk/realtek/clk-rtd1625-iso.c b/drivers/clk/realtek/=
clk-rtd1625-iso.c
> new file mode 100644
> index 0000000000000..5c3e01f28730b
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtd1625-iso.c

[ ... ]

> +static int rtd1625_iso_probe(struct platform_device *pdev)
> +{
> +	const struct rtk_clk_desc *desc;
> +
> +	desc =3D device_get_match_data(&pdev->dev);
> +	if (!desc)
> +		return -EINVAL;
> +
> +	return rtk_clk_probe(pdev, desc);

[Severity: High]
This isn't a bug introduced by this patch, but does calling rtk_clk_probe
here expose a use-after-free race condition if probe fails later?

Looking at rtk_clk_probe in drivers/clk/realtek/clk-rtk-common.c, the clock
provider is registered before the final initialization step:

	ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
					  desc->clk_data);
	if (ret)
		return dev_err_probe(dev, ret, "failed to add clock provider\n");

	platform_set_drvdata(pdev, (void *)desc);

	return rtk_reset_controller_register(dev, desc->aux_name, regmap);

If rtk_reset_controller_register fails due to a memory allocation error, the
probe function returns an error and the devres framework automatically frees
the regmap allocated earlier via devm_regmap_init_mmio.

Because the clock provider was already exposed to consumers via
devm_of_clk_add_hw_provider, a concurrent probe on another CPU could acquire
the clock before the failure occurs. The static clk_hw structures retain the
pointer to the freed regmap.

If the consumer subsequently calls clk_prepare_enable, the CCF invokes the
clock operations, which could lead to a dereference of the freed regmap sin=
ce
operations on orphaned clocks are not blocked.

Could this be prevented by deferring the clock provider registration in
rtk_clk_probe until after the reset controller is successfully registered?

> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901072446.2563=
145-1-eleanor.lin@realtek.com?part=3D10
