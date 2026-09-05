Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7256F380FC1
	for <linux-clk@vger.kernel.org>; Sat,  5 Sep 2026 13:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615894; cv=none; b=Q/yc7/gOxGy1A4sTTo1kO6mx66nUQihkOekIzrkEZUIH+BSNn1u2lE7T1QTKAxAaNf2ho9u1d4qIFYrEvvyW0ucvTI4XfufmQPOToFngxaj8Gx0kxMZW9xIfiYrW0n/G34XhFPRRp8e1NNa0KiJPr94LJ0cKDUml9e9rmXkFT6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615894; c=relaxed/simple;
	bh=BBJ5frkdOwxfZlpEBYp8EwVQUqInmWoFj/rFGUmWbj8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cdVNDeB48TlSpM7FFiLMeLQ4dC5gDDMYdKlJ1NmzevNEk3+oFaoCUW7CpIOLpmvX2n1ZJdagMhJYKpPU6FvCBybwi8PDgbubAmGbHU9Yx1dTdCkEAy3VHPy7niaL1JI2TN3DFlIoj9bA8F82barVWRUe7cd7rn5ZAwfdsXGzKfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNpAuLLM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNpAuLLM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28C71F00A3D;
	Sat,  5 Sep 2026 13:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788615893;
	bh=LHOKh/VRwhybcjVs/7iZ8e3Rv1V/lVVIMMqu2NXe1EQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lNpAuLLMCzo9s/ZvSKmrVTT4qKYWPx6hCu4N+r3PziTT9Sz96PVhFaPmTfJbR+u7y
	 C+YKVI5iPcjYGzfBnzHULD30JO6kJCkCMrH83joGYyKpExgrQf2DtZyoq9O06tp6Lv
	 8X0xStJ4P0iEYaHqnk+FwS4pfoondx/842YsyU+9dgVLM70xJYB8nuvFsku81gwR8q
	 EKF5wc3B82tCZnWm2k8Xzby6d17J+0LmS7D2SwSY7/6z2CJga79qvYr/hk/dJ49c1Y
	 tk1ns1xJ03hEirUNKfyjAEMjcnTWtEQ6Gy80V+9UkpqvJQqa2mcTRBw5K1+mOS0pru
	 VdKrShR1wN94w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: mediatek: mt6735-imgsys: Publish the OF module
 alias
Reply-To: sashiko-reviews@lists.linux.dev
To: hpp.iscas <hppiscas@163.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260905133250.63975-1-hppiscas@163.com>
References: <20260905133250.63975-1-hppiscas@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 13:44:52 +0000
Message-Id: <20260905134452.D28C71F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch adds MODULE_DEVICE_TABLE to the MT6735 imgsys driver to =
enable module autoloading, but fails to fix the identical missing module al=
ias issue in the MT6735 mfgcfg driver introduced in the same commit.
--

commit 313e810d99540550a408b36b94980a65e251935e
Author: hpp.iscas <hppiscas@163.com>

clk: mediatek: mt6735-imgsys: Publish the OF module alias

This commit adds the MODULE_DEVICE_TABLE macro to the MT6735 imgsys
driver to publish the OF match table. This enables module autoloading
when the driver is built as a separately selectable tristate driver.

> diff --git a/drivers/clk/mediatek/clk-mt6735-imgsys.c b/drivers/clk/media=
tek/clk-mt6735-imgsys.c
> index c564f8f724324..813241d526cf4 100644
> --- a/drivers/clk/mediatek/clk-mt6735-imgsys.c
> +++ b/drivers/clk/mediatek/clk-mt6735-imgsys.c
> @@ -41,6 +41,7 @@ static const struct of_device_id of_match_mt6735_imgsys=
[] =3D {
>  	{ .compatible =3D "mediatek,mt6735-imgsys", .data =3D &imgsys_clks },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, of_match_mt6735_imgsys);

[Severity: High]
This is a pre-existing issue, but since this patch fixes the missing module
autoloading introduced in commit 0bd9b1211f74, should it also fix the
identical issue in the MT6735 mfgcfg driver that was added in the same comm=
it?

Without a similar MODULE_DEVICE_TABLE(of, of_match_mt6735_mfgcfg) declarati=
on,
the clk-mt6735-mfgcfg driver will fail to automatically load when built as a
module, which can break dependent subsystems like the GPU and media blocks
that rely on these clocks:

drivers/clk/mediatek/clk-mt6735-mfgcfg.c:
static const struct of_device_id of_match_mt6735_mfgcfg[] =3D {
	{ .compatible =3D "mediatek,mt6735-mfgcfg", .data =3D &mfgcfg_clks },
	{ /* sentinel */ }
};
/* Missing MODULE_DEVICE_TABLE(of, of_match_mt6735_mfgcfg); */

static struct platform_driver clk_mt6735_mfgcfg =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905133250.6397=
5-1-hppiscas@163.com?part=3D1
