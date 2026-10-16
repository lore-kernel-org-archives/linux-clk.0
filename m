Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AB7296BB5;
	Fri, 16 Oct 2026 04:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792125648; cv=none; b=acXav1cir9dInJxfyuruhJhwVwfO5IXbuwch2vRmO5vipRovNR/C4dz2WF8y5DzaUMxFK2+06yYTD0WH+ep5uoZfVOKTOephlsIuOFeQvxtyAy3rIQhqq7SvGM5GxThWFloSig6T0Ti0IKc00NwNiGqYN0EJfSh73x13uKI7aLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792125648; c=relaxed/simple;
	bh=64BSI40xEnmsDhKAnP7V4Kxo8OL3Vn732k9KiE7He1U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=qiMkB8IjnYJmSLxAdy98TyEE/VeWScKjo1HMocpJM2z6cpDz5s5n2Cy9QiHJRfI8CjTyrwKBrI8XFAHWyGb5luwD5DWe459vSznI88QfF8rJtn8HYjVVRAigJ48MRKqIe6vOZeipddwBRK9wT2LJbk1qDO7yL2db5qYyj1n8c/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LFIdbcp0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LFIdbcp0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16F21F000C4;
	Fri, 16 Oct 2026 04:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792125647;
	bh=TvgfhPyK+2yTAVPMvvCqnIECY/Z2J5oQpMVcw/+cWKQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LFIdbcp0Tgx9jxaFVWG6Uzcl+oj/MQ0GypslWVUWSIU7h8NZsTYPJCENsM3NGBWYN
	 WjTNtqGHj0O8VG7o8ucYxCw0X1hKvcTBPyKEDJWxis1XwPz7mS8Qh72Sok3K3ADxlJ
	 Iz2YAPJwEHAHVRNTU4zFPUMvWjrfKz8Iiv68Q1qGiRNwL/hvCIaPPMC/TprRO0N6wO
	 1kqBo6EKcL9jElKM46pDFPHG4bl4a2Sx8V8ACaXNh3d+jsXO1TPggwPyHY3PYjzVPJ
	 pMGfEVeG+E4Dtqw0ocS7Z0mrSOzph65vQVbyRHpU1cvOKnXzkhTIx1eJ5GEo3CXw0u
	 3Uv6PagmXT/nw==
Message-ID: <sashiko-outbox-173795@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/5] clk: qcom: Add Global Clock Controller (GCC)
 driver for SM7250
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeshankar K" <sreeshankar0910@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016042432.824-3-sreeshankar0910@gmail.com>
References: <20261016042432.824-1-sreeshankar0910@gmail.com>
 <20261016042432.824-3-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 04:40:46 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: qcom: Incorrect source enum in freq_tbl causes cpuss_ahb_clk_=
src rate setting failure
--

commit 457d324324dea631af01284e949d55a40199a579
Author: Sreeshankar K <sreeshankar0910@gmail.com>

clk: qcom: Add Global Clock Controller (GCC) driver for SM7250

Add support for the global clock controller found on SM7250
based devices.

> diff --git a/drivers/clk/qcom/gcc-sm7250.c b/drivers/clk/qcom/gcc-sm7250.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sm7250.c
[ ... ]
> +static const struct freq_tbl ftbl_gcc_cpuss_ahb_clk_src[] =3D {
> +	F(19200000, DT_BI_TCXO_AO, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 gcc_cpuss_ahb_clk_src =3D {
> +	.cmd_rcgr =3D 0x48010,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,
> +	.parent_map =3D gcc_parent_map_0,
> +	.freq_tbl =3D ftbl_gcc_cpuss_ahb_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data){
> +		.name =3D "gcc_cpuss_ahb_clk_src",
> +		.parent_data =3D gcc_parent_data_0_ao,
> +		.num_parents =3D ARRAY_SIZE(gcc_parent_data_0_ao),
> +		.flags =3D CLK_SET_RATE_PARENT,
> +		.ops =3D &clk_rcg2_ops,
> +	},
> +};

[Severity: High]
Will this cause a rate setting failure for gcc_cpuss_ahb_clk_src?

The frequency table ftbl_gcc_cpuss_ahb_clk_src uses the device tree index=20
DT_BI_TCXO_AO (which evaluates to 1) instead of the internal hardware paren=
t=20
macro P_BI_TCXO (which evaluates to 0).

The associated clock gcc_cpuss_ahb_clk_src restricts its num_parents to 1=20
via gcc_parent_data_0_ao, and uses gcc_parent_map_0 as its parent map.=20
During a rate change, the common clock framework invokes qcom_find_src_inde=
x()=20
which iterates up to num_parents (1) and checks if the requested source=20
matches map[0].src (P_BI_TCXO =3D 0).

Since 1 !=3D 0, the lookup fails and returns -ENOENT, preventing rate=20
configuration on the CPUSS AHB clock. Should the frequency table use=20
P_BI_TCXO instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016042432.824-=
1-sreeshankar0910@gmail.com?part=3D2
