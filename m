Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E6F2D0C6E
	for <linux-clk@vger.kernel.org>; Tue, 15 Jul 2025 04:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752555232; cv=none; b=cFU/dIQaGUgzVLkY+zWKI5nWVjKniCt83pMN2JYg2FwmVIj6l9qD2IJmWt8gTeXkDAZEZrokYG/h0qOCv4gUQU0hg6xnDbU6/FHRLP3yKIcz4Aj4r8NiM1PSA4sa7uNpHx45KuCEDsEOzho23qF5MZ3mJ6pR+CYlR9U96b42/SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752555232; c=relaxed/simple;
	bh=ATvi4aGPWZr7jsYVxGahNQIk0pvtoS1eIWZ4Pu0BH7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WE9Ug86yWLGf2wvAGo6Uz9vVWzdaRS9TtqhdEjEqeZ5lYdwu3L7PICgtRMesN029vf0KbSMX8EDwDmSHbA/+L6HbpapOwmSLZ/3uKp75r3kftn4RtO+mrmPoFANwAJEL7KSFAbqsaVFGN/OYLKYo8hYdfbISV8TtbB3c0H/H39A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L24YxBLT; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L24YxBLT"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b3aa2a0022cso5202577a12.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 21:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752555230; x=1753160030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xxzs0W/OWz7Yf0jqBLWNHPj02B/wiWEvkccSHlPTKps=;
        b=L24YxBLT+GxQFMGSG8FM/H990iO/donS2CplrP2rCVzLPK8dg7IMJEkmtU6PvC5/pX
         SXcu4sGJIjHTIlfSzrW6LfJkNMbbAT0LeghtFDZeywiPtDntJR5Md5U4Kuk75uIJKFJa
         AMYx/DnOuoAkafmdfaVdOz13oTDcVxi4JPpqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752555230; x=1753160030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xxzs0W/OWz7Yf0jqBLWNHPj02B/wiWEvkccSHlPTKps=;
        b=mGudkbjZS/QRyDdSBxJT16KU85+SvWOqlK4HiLzm0H+5NMA/WgYbm/Ww/WAMVStxv3
         rIO6fFpITr9kPZ3lO1xJLOQw6Shf0k0NCu4qojDb0Dm5GjV1rkF9bAXYZjZWZxLSCyhy
         uQzGrV5KgeKhTR+XxfH35PdnZCmcvHlA6LPvMpBmpYqocTN+h7ib/+qRMMZTQhi3/exg
         eDMao8GC/n0lg1S4+wcY0oIy5l6ZlRe9KGMjuFl26ePFNxNFGWZzA5F61Tha14ZfU4ju
         eHWWJQRm4vg+twSpaxAxhLUAc9cjCUHDthnbUCWj+a1BsAispiDxP2uk7EV/bSfs7mVW
         OBmA==
X-Forwarded-Encrypted: i=1; AJvYcCVJZuz/elWLroSXoQDqHGbdGiPa9hSyC/APyjWDMJMduOu5obKqFUAZjXi8eldn81PXWNYLJMOhsd0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQsQ96Qd2EayqHTHxVBx64mq1dHvx5Owq61p89+Pn3X+yjtDs5
	CrP81csgwGY0W9mc4qXu8boA7MWcRcZK8ETn10gTSN/vq3IRDgOZKM2YZD5jHuCpZ6QFFjdKFPj
	e0rpeq62m5egXx+rSAawVYveTCYYt3InWsz6YqmDF
X-Gm-Gg: ASbGncvJGodkpMKXEtXtzEcf+1M0CWt3x25MT2WjRQrquPK7eb9TQFgsgXVSgW6DlOk
	TAH91ija0lZOF+NTFlOii/G33PldGEMyu93YZQeiFvPw3N6398hwUTQWg2+MCRnx4pLF79E5Xjo
	6w/hEcGxZfWnDw+YZ3ebUsxBkULBu+HmB78wH26MMIoJVIWZmNyCq4t8Wl3cge0frJE6hp+KExG
	n/w8FquyMXhtd/CgT0rHXtWGRkD2xP4TwY=
X-Google-Smtp-Source: AGHT+IG13a6ecncroinU2vqvFQBBadmDPhYtdK1UZWoU/n9vA+3Pboa6z8WAwc0a6SnJwk68A3zzrOg0RmDHIaFkD7I=
X-Received: by 2002:a17:90b:5790:b0:311:b0ec:135b with SMTP id
 98e67ed59e1d1-31c4ccf06d1mr28107359a91.24.1752555230224; Mon, 14 Jul 2025
 21:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624143220.244549-1-laura.nao@collabora.com> <20250624143220.244549-13-laura.nao@collabora.com>
In-Reply-To: <20250624143220.244549-13-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Jul 2025 12:53:36 +0800
X-Gm-Features: Ac12FXwBpf4BInit_x1dzKLocGTtxcJOU9mSygx6AUuM__BSzt1RWFNKQnx5RpI
Message-ID: <CAGXv+5Fz4qBO-nPJu-bq0NEJK+md9XPJPPbd46TFCMS8=LQpAA@mail.gmail.com>
Subject: Re: [PATCH v2 12/29] clk: mediatek: Add MT8196 topckgen clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

There's a lot of duplication in the driver.

On Tue, Jun 24, 2025 at 10:33=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> Add support for the MT8196 topckgen clock controller, which provides
> muxes and dividers for clock selection in other IP blocks.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile              |    2 +-
>  drivers/clk/mediatek/clk-mt8196-topckgen.c | 1257 ++++++++++++++++++++
>  2 files changed, 1258 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8196-topckgen.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefil=
e
> index b1773d2bcb3d..bc0e86e20074 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -160,7 +160,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS) +=3D clk-mt819=
5-vdo0.o clk-mt8195-vdo1.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) +=3D clk-mt8195-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS) +=3D clk-mt8195-vpp0.o clk-mt8195=
-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) +=3D clk-mt8195-wpe.o
> -obj-$(CONFIG_COMMON_CLK_MT8196) +=3D clk-mt8196-apmixedsys.o
> +obj-$(CONFIG_COMMON_CLK_MT8196) +=3D clk-mt8196-apmixedsys.o clk-mt8196-=
topckgen.o
>  obj-$(CONFIG_COMMON_CLK_MT8365) +=3D clk-mt8365-apmixedsys.o clk-mt8365.=
o
>  obj-$(CONFIG_COMMON_CLK_MT8365_APU) +=3D clk-mt8365-apu.o
>  obj-$(CONFIG_COMMON_CLK_MT8365_CAM) +=3D clk-mt8365-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8196-topckgen.c b/drivers/clk/med=
iatek/clk-mt8196-topckgen.c
> new file mode 100644
> index 000000000000..fc0c1227dd8d
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8196-topckgen.c
> @@ -0,0 +1,1257 @@

[...]

> +static const char * const p_axi_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d7_d8",
> +       "mainpll_d5_d8",
> +       "osc_d8",
> +       "mainpll_d7_d4",
> +       "mainpll_d5_d4",
> +       "mainpll_d4_d4",
> +       "mainpll_d7_d2"
> +};

The next two lists are the same as the one above. Please merge them
together.

> +static const char * const ufs_pextp0_axi_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d7_d8",
> +       "mainpll_d5_d8",
> +       "osc_d8",
> +       "mainpll_d7_d4",
> +       "mainpll_d5_d4",
> +       "mainpll_d4_d4",
> +       "mainpll_d7_d2"
> +};
> +
> +static const char * const pextp1_usb_axi_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d7_d8",
> +       "mainpll_d5_d8",
> +       "osc_d8",
> +       "mainpll_d7_d4",
> +       "mainpll_d5_d4",
> +       "mainpll_d4_d4",
> +       "mainpll_d7_d2"
> +};
> +
> +static const char * const p_fmem_sub_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d5_d8",
> +       "mainpll_d5_d4",
> +       "osc_d4",
> +       "univpll_d4_d4",
> +       "mainpll_d5_d2",
> +       "mainpll_d4_d2",
> +       "mainpll_d6",
> +       "mainpll_d5",
> +       "univpll_d5",
> +       "mainpll_d4"
> +};
> +
> +static const char * const ufs_pexpt0_mem_sub_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d5_d8",
> +       "mainpll_d5_d4",
> +       "osc_d4",
> +       "univpll_d4_d4",
> +       "mainpll_d5_d2",
> +       "mainpll_d4_d2",
> +       "mainpll_d6",
> +       "mainpll_d5",
> +       "univpll_d5",
> +       "mainpll_d4"
> +};

The next one is the same as the previous one. Please merge together.

> +static const char * const pextp1_usb_mem_sub_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d5_d8",
> +       "mainpll_d5_d4",
> +       "osc_d4",
> +       "univpll_d4_d4",
> +       "mainpll_d5_d2",
> +       "mainpll_d4_d2",
> +       "mainpll_d6",
> +       "mainpll_d5",
> +       "univpll_d5",
> +       "mainpll_d4"
> +};
> +
> +static const char * const p_noc_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d5_d8",
> +       "mainpll_d5_d4",
> +       "osc_d4",
> +       "univpll_d4_d4",
> +       "mainpll_d5_d2",
> +       "mainpll_d4_d2",
> +       "mainpll_d6",
> +       "mainpll_d5",
> +       "univpll_d5",
> +       "mainpll_d4",
> +       "mainpll_d3"
> +};
> +
> +static const char * const emi_n_parents[] =3D {
> +       "clk26m",
> +       "osc_d4",
> +       "mainpll_d5_d8",
> +       "mainpll_d5_d4",
> +       "mainpll_d4_d4",
> +       "emipll1_ck"
> +};

The next one is the same as the previous one.

> +static const char * const emi_s_parents[] =3D {
> +       "clk26m",
> +       "osc_d4",
> +       "mainpll_d5_d8",
> +       "mainpll_d5_d4",
> +       "mainpll_d4_d4",
> +       "emipll1_ck"
> +};

[...]

> +static const char * const spi0_b_parents[] =3D {
> +       "clk26m",
> +       "univpll_d6_d4",
> +       "univpll_d5_d4",
> +       "mainpll_d4_d4",
> +       "univpll_d4_d4",
> +       "mainpll_d6_d2",
> +       "univpll_192m",
> +       "univpll_d6_d2"
> +};

All the SPI clocks have the same set of parents. Please just have
one list.

[...]

> +static const char * const msdc30_1_parents[] =3D {
> +       "clk26m",
> +       "univpll_d6_d4",
> +       "mainpll_d6_d2",
> +       "univpll_d6_d2",
> +       "msdcpll_d2"
> +};

Please merge the two msdc30 parent lists.

> +static const char * const msdc30_2_parents[] =3D {
> +       "clk26m",
> +       "univpll_d6_d4",
> +       "mainpll_d6_d2",
> +       "univpll_d6_d2",
> +       "msdcpll_d2"
> +};
> +
> +static const char * const disp_pwm_parents[] =3D {
> +       "clk26m",
> +       "osc_d32",
> +       "osc_d8",
> +       "univpll_d6_d4",
> +       "univpll_d5_d4",
> +       "osc_d4",
> +       "mainpll_d4_d4"
> +};
> +
> +static const char * const usb_1p_parents[] =3D {
> +       "clk26m",
> +       "univpll_d5_d4"
> +};

The next one is the same as the previous one. Please merge together.

> +static const char * const usb_xhci_1p_parents[] =3D {
> +       "clk26m",
> +       "univpll_d5_d4"
> +};
> +
> +static const char * const usb_fmcnt_p1_parents[] =3D {
> +       "clk26m",
> +       "univpll_192m_d4"
> +};
> +
> +static const char * const i2c_p_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d4_d8",
> +       "univpll_d5_d4",
> +       "mainpll_d4_d4",
> +       "univpll_d5_d2"
> +};

All the I2C clocks have the same set of parents. Please just have
one list.

[...]

> +static const char * const tl_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d7_d4",
> +       "mainpll_d4_d4",
> +       "mainpll_d5_d2"
> +};

The lists for the tl clocks are the same. Please merge.

[...]

> +static const char * const ssr_pka_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d4_d4",
> +       "mainpll_d4_d2",
> +       "mainpll_d7",
> +       "mainpll_d6",
> +       "mainpll_d5"
> +};

This one and the next could be merged.

> +static const char * const ssr_dma_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d4_d4",
> +       "mainpll_d4_d2",
> +       "mainpll_d7",
> +       "mainpll_d6",
> +       "mainpll_d5"
> +};
> +
> +static const char * const ssr_kdf_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d4_d4",
> +       "mainpll_d4_d2",
> +       "mainpll_d7"
> +};
> +
> +static const char * const ssr_rng_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d4_d4",
> +       "mainpll_d5_d2",
> +       "mainpll_d4_d2"
> +};
> +
> +static const char * const spu0_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d4_d4",
> +       "mainpll_d4_d2",
> +       "mainpll_d7",
> +       "mainpll_d6",
> +       "mainpll_d5"
> +};

This one and the next could be merged.

> +static const char * const spu1_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d4_d4",
> +       "mainpll_d4_d2",
> +       "mainpll_d7",
> +       "mainpll_d6",
> +       "mainpll_d5"
> +};
> +
> +static const char * const dxcc_parents[] =3D {
> +       "clk26m",
> +       "mainpll_d4_d8",
> +       "mainpll_d4_d4",
> +       "mainpll_d4_d2"
> +};
> +
> +static const char * const apll_i2sin0_m_parents[] =3D {
> +       "aud_1",
> +       "aud_2"
> +};

All the audio interface clocks have the same set of parents. Please
have just one list.

[...]


Thanks
ChenYu
