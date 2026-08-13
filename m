Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBDE34FF74
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635935; cv=none; b=MdFcoHYNGFTQNpK2qvNYPFWVlxvA+18TMKbrwy9V3Qrh1vyzG9AlmDxup7KF/n4DRZSum5EkbXTJobR3IkvWnF/Za9orrncMeigCGw2P0Jwbo9hMuC4VjpOXyx83aFit1qXKwdeSPnR2yumf8wQ33HFT/Vbpv3jIeJ9nnNC5FXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635935; c=relaxed/simple;
	bh=ay4KyZfR7JY+REZ8ZJrSjAJ1B7WKbxaxwsVGg7slkLE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dOqEHYSRlKRtH4r4MXgaHcg5kmrxPF/Q8DeTqfLjNO4MINrTnqvu6e31tYP/K7IgPNBo0fo5bWJhU/McF0M7z3I/hG0QGLusZ7GuuTgQSPKaMYsBBhAdGXmdNtmslqoCd0SVPKyFiftrmCEgogvehsnXQ85FHUKdNIi6qMFwC68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLNqeVc1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VLNqeVc1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374F01F000E9;
	Thu, 13 Aug 2026 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786635931;
	bh=FmiwHFQFi9FZMHBuP3YFQ0YVaeFsPzZedncT78rKv+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VLNqeVc1Am1lYj0zexsiCQBYffNs6EpcSFRLGgFVdD3paE5HtP0RmQcueNEWsqpTp
	 FSzzJb41KpBKk383q8g41pqfOyht5ZEcfw8iyu/xVQrSd7TG7n23deScER9yDNMTCr
	 9FqnEzps1X78uWiMvORdrmxY4LnrS08JAADVt3BztO0EbaaGLic1SvFT9RKC+HYBDD
	 lPANbjiu3uBL6B3o3OfwpYp+OFNz5b3yYCIguYPahIrHmBFCePbDIagO4ODM1sWlKW
	 tYz89Q7r7TOzZJp+b/sJ/hvZ2khAwqCaTdmmZ5IqBy8pI5RqAR919taNbJeFrbvKBy
	 eOdxbtMc8n/xg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] clk: si521xx: correct the SI52147 OF output enable
 map
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260813153650.44793-1-pengpeng@iscas.ac.cn>
References: <20260813153650.44793-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 15:45:30 +0000
Message-Id: <20260813154531.374F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds array access in si521xx_of_clk_get() when parsing de=
vice tree clock indices.
- [High] `regcache_sync()` during resume overwrites the direct I2C initiali=
zation of the Byte Count register, breaking subsequent I2C reads.
--

--- Patch [1]: [PATCH v2] clk: si521xx: correct the SI52147 OF output enabl=
e map ---
commit 415da2f3277cfd67c9fa71b04185cd6d8978b923
Author: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: clk: si521xx: correct the SI52147 OF output enable map

This patch corrects the SI52147 OF match data to use 0x17 for output-enable
bits in control register 1. This aligns the OF map with the data sheet and
I2C ID table, exposing the documented outputs.

> diff --git a/drivers/clk/clk-si521xx.c b/drivers/clk/clk-si521xx.c
> index ceadc07bcb6df..d5be08e126858 100644
> --- a/drivers/clk/clk-si521xx.c
> +++ b/drivers/clk/clk-si521xx.c
> @@ -374,7 +374,7 @@ MODULE_DEVICE_TABLE(i2c, si521xx_id);
>  static const struct of_device_id clk_si521xx_of_match[] =3D {
>  	{ .compatible =3D "skyworks,si52144", .data =3D (void *)SI521XX_OE_MAP(=
0x5, 0xc0) },
>  	{ .compatible =3D "skyworks,si52146", .data =3D (void *)SI521XX_OE_MAP(=
0x15, 0xe0) },
> -	{ .compatible =3D "skyworks,si52147", .data =3D (void *)SI521XX_OE_MAP(=
0x15, 0xf8) },
> +	{ .compatible =3D "skyworks,si52147", .data =3D (void *)SI521XX_OE_MAP(=
0x17, 0xf8) },

[Severity: High]
This isn't a bug introduced by this patch, but could this lead to an
out-of-bounds array access in si521xx_of_clk_get()?

When parsing device tree clock indices, the user-provided index from the
device tree is directly used as an array index without bounds checking:

drivers/clk/clk-si521xx.c:si521xx_of_clk_get() {
	...
	unsigned int idx =3D clkspec->args[0];

	return &si->clk_dif[idx].hw;
}

If a device tree specifies a clock index beyond the initialized clocks for
the specific chip, this returns an arbitrary pointer or an uninitialized
struct, causing memory corruption or a NULL pointer dereference in the
clock core.

Should the index be validated against a maximum value (like the number of
outputs for the chip) before accessing si->clk_dif[]?

[Severity: High]
This is a pre-existing issue, but does the resume path overwrite the Byte
Count register and break subsequent I2C reads?

In si521xx_probe(), the Byte Count register (SI521XX_REG_BC) is directly
written to 1 via i2c_master_send(), bypassing the regmap:

drivers/clk/clk-si521xx.c:si521xx_probe() {
	...
	const u8 data[3] =3D { SI521XX_REG_BC, 1, 1 };
	...
	ret =3D i2c_master_send(client, data, ARRAY_SIZE(data));
	...
}

Because this register is never updated via the regmap and no reg_defaults
are provided, its cached value remains uninitialized (0).

During si521xx_resume(), regcache_sync() writes all cached values for
writable registers back to the hardware:

drivers/clk/clk-si521xx.c:si521xx_resume() {
	...
	ret =3D regcache_sync(si->regmap);
	...
}

This overwrites SI521XX_REG_BC with 0. The custom read function
si521xx_regmap_i2c_read() relies on the hardware BC being 1 to correctly
receive 1 byte of data.

Does this cause I2C reads to fail or return corrupt data after a suspend
and resume cycle?

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, clk_si521xx_of_match);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813153650.4479=
3-1-pengpeng@iscas.ac.cn?part=3D1
