Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792567720;
	b=r7d47PA2fz78bT6BtRwRzxQQ/cgMtvfo+T/2TgBCeyaJMbiN3fjYvInVa+KNr5Po+Zgq
	 d8rm8flGXctYQanhyhxSSQMhDpUrm9mD8W9QH2j9FKzsH8YWkVWdU0TB+LT4/bM0hqG1H
	 Soq7XuuKpJ9QTNUNR6RYgH/vrImi5D9HGMPVG1tHvBD4TbImZBvVzSepPE1LqZi19VBgR
	 j4h8uFOLh1plDoyq2x6yjTDmiKNcBl+2pyh70WicxAcSBRAr8j2pT2TfcxR4MtmKjaXtS
	 Walk3UDduRwUx7rM1JOWVWKDHqy8bMXaq97JrXT0vbnrjpdzp4IR8QzpdC8zKOk1J7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792567720;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fGLZu5bEdrlOiox76i4MIJ+BnMi35Yr6c+WUvX+zPD0=;
	b=KgVtAq31aRsl2usluOtidlptoRi2aJe9Oh/xG7jkDrryRGnJR3tnmQXA8OC+RIavrEaZ
	 srlI0j/m4YJmOPLuNJeKcCQzmz3ZMnyjAkOilXMX6AyiKVbLBnZ2uW6gtFJkJkQSmAvXa
	 BJnIEGwMfHoMenMx4mSrqlkbPG1VrX6qvS5t1AbO6jvW7GGKx8iAGu4p/VR8Znt///nR7
	 TG9NcNw7JwqA4MPipa469NTNUz+4lyPQ5MoVNYdLSZMds2IwVlZPkHhvm1XfRrfgoWCuF
	 n45as5m054DlfNOZYr0Aqd2Npei0IrL88cX9zFHbOIUjCIJtuVNFJlfZKOfCKmgzoSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="b6cSqI/4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839F2606A319;
	Wed, 21 Oct 2026 07:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6cSqI/4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14BC1F000CB;
	Wed, 21 Oct 2026 07:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792567720;
	bh=fGLZu5bEdrlOiox76i4MIJ+BnMi35Yr6c+WUvX+zPD0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b6cSqI/4W2uhFKVbrW8n5e2MwNmPTvgBY161gepcBNOVflLre3VqDiMO6hpp5NZb6
	 vTZUjvaqbWFWKd9TO8cXsHr5ct9mXqw3fJX4I+rY49O8j2D0pdag+kJDKXLQydt+72
	 nTsN3qlVyIl/kAoEpQDcJqjEdL51hGdVRXxreBjXoWWYf4kTQ8gHXSlwnqwewllQDa
	 +uMLkQtXo/Qc9PYpZbXqMsigZ5+ASltx+AAW+9ocTedyKbJLR08S5q7jjllxbfD7F3
	 YZ02eYwOjD0LgwK8v+yq9XHddkwc2DEtClIyi5FOL4xf7yHnmDin2OOQkgmNOrJPSq
	 XrnuOugD9hPkA==
Message-ID: <sashiko-outbox-179905@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/5] ASoC: meson: g12a-toacodec: Add S4 tocodec
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiebing Chen" <jiebing.chen@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261021-audio_drvier-v7-3-2b9aeae9cb8a@amlogic.com>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-3-2b9aeae9cb8a@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 07:28:39 +0000
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
- [Medium] ASoC: meson: g12a-toacodec: wrong mux shift in s4_toacodec_widge=
ts
--

commit 3fd35e52fdcaaa2efffaba05b21f58404303e9de
Author: Jiebing Chen <jiebing.chen@amlogic.com>

ASoC: meson: g12a-toacodec: Add S4 tocodec driver

This patch adds Amlogic S4 SoC support to the g12a-toacodec driver,
including DAPM supply widgets for the BCLK and MCLK gates, an 8-lane
Lane Select control, and the S4 register field layout.

> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toaco=
dec.c
> index a95375b53f0a3..10f26b4bc8b0d 100644
> --- a/sound/soc/meson/g12a-toacodec.c
> +++ b/sound/soc/meson/g12a-toacodec.c

[ ... ]

> @@ -141,6 +144,16 @@ static const struct snd_soc_dapm_widget sm1_toacodec=
_widgets[] =3D {
>  			    &g12a_toacodec_out_enable),
>  };
> =20
> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] =3D {
> +	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
> +			 &sm1_toacodec_mux),

[Severity: Medium]
Should s4_toacodec_widgets use a dedicated mux control with shift 19 instead
of sm1_toacodec_mux?

On S4, s4_toacodec_controls defines "Lane Select" at bit 16
(CTRL0_LANE_SEL_SM1) with max 7, occupying bits 18:16 of TOACODEC_CTRL0, and
s4_toacodec_match_data moves field_dat_sel to bits 20:19:

	.field_dat_sel	=3D REG_FIELD(TOACODEC_CTRL0, 19, 20),

While g12a_toacodec_mux_put_enum() writes to priv->field_dat_sel,
sm1_toacodec_mux uses sm1_toacodec_mux_enum, which hardcodes the shift to
CTRL0_DAT_SEL_SM1_LSB (bit 18):

static SOC_ENUM_SINGLE_DECL(sm1_toacodec_mux_enum, TOACODEC_CTRL0,
			    CTRL0_DAT_SEL_SM1_LSB,
			    g12a_toacodec_mux_texts);

When snd_soc_dapm_get_enum_double() or dapm_connect_mux() reads the "Source"
mux state on S4, won't it extract bits 19:18 (overlapping the MSB of "Lane
Select") instead of bits 20:19, returning the wrong enum selection or an
unmapped value of 3 when "I2S B" and lanes 4..7 are active?

> +	SND_SOC_DAPM_SWITCH("OUT EN", SND_SOC_NOPM, 0, 0,
> +			    &g12a_toacodec_out_enable),
> +	SND_SOC_DAPM_SUPPLY("I2S BCLK Gate", TOACODEC_CTRL0, CTRL0_BCLK_ENABLE_=
SHIFT, 0, NULL, 0),
> +	SND_SOC_DAPM_SUPPLY("I2S MCLK Gate", TOACODEC_CTRL0, CTRL0_MCLK_ENABLE_=
SHIFT, 0, NULL, 0),
> +
> +};

[ ... ]

> @@ -234,6 +257,10 @@ static const struct snd_kcontrol_new sm1_toacodec_co=
ntrols[] =3D {
>  	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
>  };
> =20
> +static const struct snd_kcontrol_new s4_toacodec_controls[] =3D {
> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 7, 0),
> +};

[ ... ]

> @@ -276,6 +314,13 @@ static const struct g12a_toacodec_match_data sm1_toa=
codec_match_data =3D {
>  	.field_bclk_sel	=3D REG_FIELD(TOACODEC_CTRL0, 4, 6),
>  };
> =20
> +static const struct g12a_toacodec_match_data s4_toacodec_match_data =3D {
> +	.component_drv	=3D &s4_toacodec_component_drv,
> +	.field_dat_sel	=3D REG_FIELD(TOACODEC_CTRL0, 19, 20),
> +	.field_lrclk_sel =3D REG_FIELD(TOACODEC_CTRL0, 12, 14),
> +	.field_bclk_sel	=3D REG_FIELD(TOACODEC_CTRL0, 4, 6),
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-audio_drvi=
er-v7-0-2b9aeae9cb8a@amlogic.com?part=3D3
