Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8E23B5E10;
	Mon, 17 Aug 2026 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964696; cv=none; b=B6zjY2kmbsPiIkKQP3We8oLZujHZdG2rZ4NNbI5ff2yk/+60sWYzuRNmkuiZaGjYcBpuaTKTzdJ2dUHavzfYpjqhSzF04po05tQNn1BM3qpU/XRiz7l6dGv04WaT5jbAKSllNnfdlegyviaelPi0mnAjWP1GBk9CfEVBouvi5nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964696; c=relaxed/simple;
	bh=x5Vc/65XluMcy176OiRpHBt1ibmYRPVHynXinNNIi0Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xnfh1vQKhDPpZqoX5buT9G3mCH0bsByXGQJhqrhA8jQcaTINP7TJW41Zdm+C4DicWgIpE5dUpu+U+WtrqvikQTBo9RE8MFoHRn85PzXHkjeC/Y9HIgD7F0+VY7B/rk7I52DmkoJO5CEXCfpxPCb+fyf/xZ2KTI3INn51RDVScmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YThC6QkH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YThC6QkH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB231F000E9;
	Mon, 17 Aug 2026 11:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786964695;
	bh=SY+Yvyaj/8lKQlAb4+1UQiZ+9T4Yy7OtmJfGvDxBB1w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YThC6QkHMh23bSC7nwBNU7HqyXTM7a0Mq/mQ3ISKLrvh8/zzZODLDDG/6xL+MAFM2
	 mqpVXUeDNatHlION42GBnYG4YiopuobWEerSXCzMeH3GhO7yv4MbZXOxqklZDp/dBm
	 PMvuSY72OPuklc2pHpg403LROymfK5lUgJ/k59g2IySYo2RzR/zieCM2OSuPml8AJl
	 c+UKYXkvME9PJ9gJP+IZ9eB6MwwfuoGM6vtr5eGSe1GHHpajQ3keQHDUXHbhrkxFdp
	 Cw+OFaf8tkx3dRp9UHRKqr08ESvcs4M+fkWg1B/MUvGwYGp0nRZ15WcMVAao0HcgSP
	 w0T3ntus5Uc/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/6] clk: conf: Support assigned-clock-sscs
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260817-clk-v11-v11-3-36e9bc701b11@nxp.com>
References: <20260817-clk-v11-v11-0-36e9bc701b11@nxp.com>
 <20260817-clk-v11-v11-3-36e9bc701b11@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 11:04:54 +0000
Message-Id: <20260817110454.9EB231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Directly casting an array of `struct clk_spread_spectrum` to `(u=
32 *)` to read device tree properties tightly couples the compiler's memory=
 layout to the DT array format, risking silent failures or memory corruptio=
n if the struct changes.
--

--- Patch [3]: [PATCH v11 3/6] clk: conf: Support assigned-clock-sscs ---
commit 9d153d59c6542e9110cebb9af6e487275c2559ca
Author: Peng Fan <peng.fan@nxp.com>

clk: conf: Support assigned-clock-sscs

Parse the Spread Spectrum Configuration (SSC) from the device tree and
configure them before using the clock. Each SSC configuration consists
of three u32 elements.

> diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
> index 303a0bb26e54a..550b8ae375a2c 100644
> --- a/drivers/clk/clk-conf.c
> +++ b/drivers/clk/clk-conf.c
> @@ -155,6 +155,78 @@ static int __set_clk_rates(struct device_node *node,=
 bool clk_supplier)
>  	return 0;
>  }
> =20
> +static int __set_clk_spread_spectrum(struct device_node *node, bool clk_=
supplier)
> +{
> +	u32 elem_size =3D sizeof(struct clk_spread_spectrum);
> +	struct clk_spread_spectrum *sscs;
> +	struct of_phandle_args clkspec;
> +	int rc, count, index;
> +	struct clk *clk;
> +
> +	/* modfreq, spreadPercent, modmethod */
> +	count =3D of_property_count_elems_of_size(node, "assigned-clock-sscs", =
elem_size);
> +	if (count <=3D 0)
> +		return 0;
> +
> +	sscs =3D kcalloc(count, elem_size, GFP_KERNEL);
> +	if (!sscs)
> +		return -ENOMEM;
> +
> +	rc =3D of_property_read_u32_array(node, "assigned-clock-sscs", (u32 *)s=
scs,
> +					count * 3);

[Severity: Medium]
Could this direct cast to (u32 *) be problematic if the memory layout of
struct clk_spread_spectrum changes in the future?

Directly casting the array of structs to a primitive type array tightly
couples the device tree reading logic to the compiler's memory layout.

If a new field is added or padding is introduced to the structure,
of_property_count_elems_of_size() would miscalculate the count, and the
sequential read would cause misaligned struct access across the entire arra=
y.

> +	if (rc)
> +		goto free_sscs;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-clk-v11-v1=
1-0-36e9bc701b11@nxp.com?part=3D3
