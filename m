Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2590E374E6F;
	Wed, 12 Aug 2026 02:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786500633; cv=none; b=rf01V2dPxWfP1jYwCWn2pKGBEUDgpBTg49b0OOJ6NL4N28r0FBXnSyx8J6JwZemI9dl//CKShN64Zi9HdGSV7vnNcfm0S+y0daX2L76jcqIQEB7WhIy0MAf1ernfu9f98eZ6g3rx46GgI19fEZUkjWgG8QFUmAmtjphj654Clqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786500633; c=relaxed/simple;
	bh=QkDLnRgsLRCquLKe4QaoNaUQYkAy+Lx7zcgIMOaU/MM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R6MeqesTy8T4IGfQ/A1g45fwRS+zGxQahAa9qsV8BX6+SEsYGvf+8X8Hy0GokLIPk5GTgzHdKedd/Aq4bTOcPMfhwOLX0ujdN4MO5U7StRQUmr26K/N218HJF0l8weLX6CkbLAFFhzp2JLR5h0BgEHsqAtaVrAN796Fl8woUNXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwJidioN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwJidioN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3938B1F000E9;
	Wed, 12 Aug 2026 02:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786500629;
	bh=9XJnyGJ4HQVKO9XJH2HMEL5s85BNPIjN2Bkizao3rDk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZwJidioNc3yxCdsSANz9LqQ3yqmariiWZP6r0y+Vw9ylurL6P+1BVbElWx+D1l4Lu
	 JUz53R+OUmqtuaFLgUdJZoIZ/20HOWS+59YjQCcqczO1qy9fUXPoGHKkNtkybITfWd
	 +nwFeAxW8CbS1D2Ah/wFI2/UDTy0xMoqzuS2+I0bA80eNG7f2vXYskVeBKrcSNzwCk
	 1T5fuX6fhykCZJJPWGi7FsWH4PfEsDxr6GDIgCH6vx5Tg/Zl/u7qEl9v9Lj3BTqpyo
	 VoWYsH3/7VW/1uytq8KBdTerRDVSNENNWPcpVxNiMX8/TJA52TEys82U6qzO9Bbtmb
	 9wpFZLRDA1FDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 03/11] reset: realtek: Add RTD1625 reset controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260812020009.3480538-4-eleanor.lin@realtek.com>
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-4-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 02:10:28 +0000
Message-Id: <20260812021029.3938B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing validation of `dev_get_platdata()` return value, leading=
 to a potential NULL pointer dereference in reset operations.
--

--- Patch [3]: [PATCH v13 03/11] reset: realtek: Add RTD1625 reset controll=
er driver ---
commit 789f70d6384140bb43211f942b168ac28816b10c
Author: Cheng-Yu Lee <cylee12@realtek.com>

reset: realtek: Add RTD1625 reset controller driver

This commit adds support for the CRT and ISO domain reset controller on
the Realtek RTD1625 SoC. The reset driver is implemented as an auxiliary
driver to handle shared register space with the clock controller.

> diff --git a/drivers/reset/realtek/reset-rtd1625.c b/drivers/reset/realte=
k/reset-rtd1625.c
> new file mode 100644
> index 0000000000000..479b3a94d2b5a
> --- /dev/null
> +++ b/drivers/reset/realtek/reset-rtd1625.c

[ ... ]

> +static int rtd1625_reset_probe(struct auxiliary_device *adev,
> +			       const struct auxiliary_device_id *id)
> +{
> +	const struct rtd1625_reset_info *info;
> +	struct device *dev =3D &adev->dev;
> +	struct rtk_reset_data *data;
> +
> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	info =3D (const struct rtd1625_reset_info *)id->driver_data;
> +
> +	data->descs           =3D info->descs;
> +	data->regmap          =3D dev_get_platdata(dev);

[Severity: Medium]
Should there be a check to ensure dev_get_platdata() does not return NULL?

If the parent clock controller driver fails to populate the platform data
for the auxiliary device before adding it to the auxiliary bus, this could
lead to a NULL pointer being assigned to data->regmap. This might result
in a kernel panic during later reset operations (such as assert or deassert)
when the regmap is dereferenced by rtk_reset_ops.

> +	data->rcdev.owner     =3D THIS_MODULE;
> +	data->rcdev.nr_resets =3D info->nr_resets;
> +	data->rcdev.ops       =3D &rtk_reset_ops;
> +	data->rcdev.dev       =3D dev;
> +	data->rcdev.of_node   =3D dev->of_node;
> +
> +	return devm_reset_controller_register(dev, &data->rcdev);
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812020009.3480=
538-1-eleanor.lin@realtek.com?part=3D3
