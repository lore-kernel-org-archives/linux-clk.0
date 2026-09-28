Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0984E73CC;
	Mon, 28 Sep 2026 16:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611692; cv=none; b=Uc8948EO6v/TqRaoMIsZnCZnown+DDldov/h6tTVXoRy0OHxvIqI0GEIyflg6LKzed14xiwvapSeoaXIs1Iv/14U6YhU3EhSRbsXCfYgFLGGUXd4FZoruk5PFHL/i9yt0B60SjqWZLSDq2Iw2aQYjek+LBFuxXkPp1dr0UKdFEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611692; c=relaxed/simple;
	bh=rX0MhgDzzUdYui8FmbB0QuH8WA8G+r+OE4owN0NLct8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WVw6h+CRtvAZIfWkiktkIzSCcWFlxSNyezLQVVQgQIxbsOFWqhA5PhIm+udPpTiSQD26oQx0X//1hBiZyZYWz7R0nxCTtsVWRzcAahPJw/WKneebUDqhTGP935ZSkGh6En7eelLaN/PG5uZroXr4jqlwTf5XKh011OmznjqgfDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaO8VoBv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oaO8VoBv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553C81F00893;
	Mon, 28 Sep 2026 16:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790611691;
	bh=0IOEhq1oe5cgC+bdijfFohcVAnrKN+R5QbTa6x3Azhg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oaO8VoBvaoyxJAAXTbc+TsVT/aVwUMk/ebQr18Wth3vXIVKY2QL9KKqI8ccGfY0Vk
	 JCg41/gnEIOfqa4QnwGYlimQs/Pe4GnXYkRVgSdTukSbOtj9h52g7EpGUk7xUtxmIe
	 5Y8DuSl4kKWli0amp5IIkyK5l70M3ihVLH+hwd9cpb67t7TEs4xAxd6BFTV+rJ8Gmr
	 JUPEZwwVZ6Z6ipzNqvSEKm3Gsh796b71KI9e/6mrjkTgtn9NbXL6b0gzR27NTUvVOS
	 oS0ttI5IF/ojy6E5hUBayRwVBpLNjahmiCFBE5QjzmigKlUEAsDo+EU1BHvxdsdXi3
	 5N8+0yntzV1iQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse
 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sarath Ganapathiraju" <sarath.ganapathiraju@oss.qualcomm.com>
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260928-master-v9-2-2277f09f9a09@oss.qualcomm.com>
References: <20260928-master-v9-0-2277f09f9a09@oss.qualcomm.com>
 <20260928-master-v9-2-2277f09f9a09@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 16:08:10 +0000
Message-Id: <20260928160811.553C81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: qcom: missing .is_enabled in gate clock ops causes power le=
ak
--

commit cd2f6ce18faa02e554ea7e8ca64e0b68dfbbbc9a
Author: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

clk: qcom: Add LPASS VA CSR heartbeat pulse clock

This commit adds the LPASS VA CSR driver to model the rate generator as
a clock provider. It allows consumers to enable and disable it through
the common clock framework and attaches the DT vote clocks to runtime PM.

> diff --git a/drivers/clk/qcom/lpass-va-csr.c b/drivers/clk/qcom/lpass-va-=
csr.c
> new file mode 100644
> index 0000000000000..93eafb2e043ab
> --- /dev/null
> +++ b/drivers/clk/qcom/lpass-va-csr.c
[ ... ]
> +static const struct clk_ops lpass_va_csr_hb_ops =3D {
> +	.prepare =3D lpass_va_csr_hb_prepare,
> +	.unprepare =3D lpass_va_csr_hb_unprepare,
> +	.enable =3D clk_enable_regmap,
> +	.disable =3D clk_disable_regmap,
> +};

[Severity: Medium]
Is the .is_enabled callback missing from lpass_va_csr_hb_ops?

The Common Clock Framework explicitly requires the .is_enabled callback for
gate clocks to accurately read the initial hardware state (as documented in
clk_core_is_enabled()). Without this callback, CCF falls back to the softwa=
re
enable_count, which is 0 at boot.

If the bootloader or previous firmware left the LPASS rate generator enable=
d,
clk_disable_unused() will assume it is already disabled and skip it, leading
to a persistent power leak.

Could .is_enabled =3D clk_is_enabled_regmap be added here to ensure the unu=
sed
clock can be properly evaluated and disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-master-v9-=
0-2277f09f9a09@oss.qualcomm.com?part=3D2
