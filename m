Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792589545;
	b=dkXF1NsTGbQ8MRhEhANGrTb2g3Evblj/d7tObrUedcM6k0KIGoisUy6SKyCZQ/L5S4wj
	 SUVJjsJK/rKdEC0Pv4VoC2Vm4EMKMuD5GtEn4tx8Pnbx6uj/DWbVenWMWtSuA42L33GBz
	 MitrwBhogJ/nr5DKFTSgAo1z9t+Snzg4VO4EdKdbwXA1Fs+wyCEEznUNfFgVK+DP6iHmp
	 OF0jUu5Q+J5uQ5NPaRUd3uBNzsFrg/tZOtRUTx+Acbxxy5gx+/WwP8Vk7/iS3YOyQZkno
	 stGoDc36qrPUwn53G43sIKyiD0HgLuhGHO3lFABkdoUXSPumRaasieokWvvByBdZNDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589545;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nkCVEX498q5doKwO4jXKTlZE0yPa4CJnNDHG1G24Xpc=;
	b=JEIVuG+1gkx9pnIQi3eooiihGRQdW2P6TkS2EIrx7FpilFo+AWiHTg/E2cOUfuHX0h87
	 h1kaJgWPu5MrW3WTqqyNSUNsfMr9pl/ZB0wQWS04W9YaH1wnSp74ZayxnK0NjnaAxQh78
	 DCZMTr6XJD+lFB17bfmTkjKKr2k7G9xaWw71oZZv5LWEUSjgOAoGthXhDoXvjeKamtpJ7
	 fY/NONa0AFchfC7IchFHxhZ8qrWXx8ez0e1/KpwGHkHTN+il1pPeCHcDIgjGRANXWQvyu
	 04croo3MYg/9C7dqIcyAEqySXMQC62NGiQMRkuEbjqqJw5OtYtS9Qu3Ul2lXwFXIPfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mk42l/ej";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCBB606A31A;
	Wed, 21 Oct 2026 13:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mk42l/ej
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 938E61F000C4;
	Wed, 21 Oct 2026 13:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792589544;
	bh=nkCVEX498q5doKwO4jXKTlZE0yPa4CJnNDHG1G24Xpc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mk42l/ejngg/OGmJIFtOludEcT5A6LxrDM8rI5d85T5gZqki4USMgKkPF355ijiCN
	 1w7K+izU3cHj8PVBDMDKgsXBNRJrKA5XuA0WHFEJuXLT4EHBkX5lyTTKC2Gwq829SO
	 UIRkvRTFscKEyKkHBpNs15NS4BO4447Ev33gs4Tb4JYGPL/aWzRtWGEjPIg9Z0zzIy
	 h31NDQSXad1LyKKJ8Fq1vAJPIwA0gPr4AsqPnY+NDl+z9snrIGgK+sHl1p61CgPntJ
	 OuHjAeFwtcCopcuRotb8Mc0skiqh2QiPvgmV1K6P43VgWZ5YBUbQOC/WFHsn2jYun+
	 G7/sukh4OKe1g==
Message-ID: <sashiko-outbox-180310@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] clk: imx8mp: Allow adjusting the video PLL rates
 for the LDB clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261021-ge-clk-lcm-v1-3-246cc35b5ffb@bootlin.com>
References: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
 <20261021-ge-clk-lcm-v1-3-246cc35b5ffb@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 13:32:24 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: imx8mp: media_ldb registered with imx8m_clk_hw_composite_bu=
s_flags()
--

commit 0eadafd0202ef3a4c96dd126be3ffec604e5e8eb
Author: Miquel Raynal <miquel.raynal@bootlin.com>

clk: imx8mp: Allow adjusting the video PLL rates for the LDB clock

This commit adds the CLK_SET_RATE_PARENT flag to the IMX8MP_CLK_MEDIA_LDB
clock so that rate changes can propagate to the parent video PLLs.

> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index fe6dac70f1a15..3540992b89409 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -753,7 +753,7 @@ static int imx8mp_clocks_probe(struct platform_device=
 *pdev)
>  	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] =3D imx8m_clk_hw_composite("media_m=
ipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
>  	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] =3D imx8m_clk_hw_composite_bus_flags("m=
edia_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RAT=
E_PARENT);
>  	hws[IMX8MP_CLK_MEDIA_CAM2_PIX] =3D imx8m_clk_hw_composite("media_cam2_p=
ix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
> -	hws[IMX8MP_CLK_MEDIA_LDB] =3D imx8m_clk_hw_composite("media_ldb", imx8m=
p_media_ldb_sels, ccm_base + 0xbf00);
> +	hws[IMX8MP_CLK_MEDIA_LDB] =3D imx8m_clk_hw_composite_bus_flags("media_l=
db", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT);

[Severity: Medium]
Should IMX8MP_CLK_MEDIA_LDB in imx8mp_clocks_probe() be registered with
imx8m_clk_hw_composite_flags() instead of
imx8m_clk_hw_composite_bus_flags()?

In the i.MX8MP CCM register map, offsets 0xa000..0xc300 (including
media_ldb at ccm_base + 0xbf00) are IP peripheral clock slices rather than
bus clock slices (0x8800..0x9300).

Using imx8m_clk_hw_composite_bus_flags() passes IMX_COMPOSITE_BUS to
__imx8m_clk_hw_composite() in drivers/clk/imx/clk-composite-8m.c:

	} else if (composite_flags & IMX_COMPOSITE_BUS) {
		div->shift =3D PCG_PREDIV_SHIFT;
		div->width =3D PCG_PREDIV_WIDTH;
		divider_ops =3D &imx8m_clk_composite_divider_ops;
		mux_ops =3D &imx8m_clk_composite_mux_ops;
	} else {
		div->shift =3D PCG_PREDIV_SHIFT;
		div->width =3D PCG_PREDIV_WIDTH;
		divider_ops =3D &imx8m_clk_composite_divider_ops;
		mux_ops =3D &clk_mux_ops;
		if (!(composite_flags & IMX_COMPOSITE_FW_MANAGED))
			flags |=3D CLK_SET_PARENT_GATE;
	}

Passing IMX_COMPOSITE_BUS selects imx8m_clk_composite_mux_ops (intended for
the dual SEL_A/SEL_B glitchless mux on core and bus slices) instead of
clk_mux_ops, and drops CLK_SET_PARENT_GATE (added in commit 936c383673b9 to
gate IP peripheral clock slices during reparenting and avoid clock
glitches).

In drivers/clk/imx/clk.h, imx8m_clk_hw_composite_flags() is available for IP
peripheral clock slices that need extra clock flags while keeping
composite_flags set to 0:

#define imx8m_clk_hw_composite_flags(name, parent_names, reg, flags) \
	_imx8m_clk_hw_composite(name, parent_names, reg, \
			0, IMX_COMPOSITE_CLK_FLAGS_DEFAULT |  flags)

>  	hws[IMX8MP_CLK_MEMREPAIR] =3D imx8m_clk_hw_composite_critical("mem_repa=
ir", imx8mp_memrepair_sels, ccm_base + 0xbf80);
>  	hws[IMX8MP_CLK_MEDIA_MIPI_TEST_BYTE] =3D imx8m_clk_hw_composite("media_=
mipi_test_byte", imx8mp_media_mipi_test_byte_sels, ccm_base + 0xc100);
>  	hws[IMX8MP_CLK_ECSPI3] =3D imx8m_clk_hw_composite("ecspi3", imx8mp_ecsp=
i3_sels, ccm_base + 0xc180);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-ge-clk-lcm=
-v1-0-246cc35b5ffb@bootlin.com?part=3D3
