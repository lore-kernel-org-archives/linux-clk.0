Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495966;
	b=jkFFu6IRFrfJDQhqAvyGeFpK2shcjAc7aJGR9SqQ2SwK0yFByrh8b1Ne0QWtVkbwR52P
	 5VqAm38OpWHf399QvIxZAQSIDWeW+ynaKOJDPc97GYfx+6D7K1sRKWOE1OmhsGtKgA5Xb
	 xadw+0RZ6l6rAFNGRgNX9hIpaX3+I9a+ObeI/i+Gf+u36vnEZc3M0u1izR3TuzjgHx/Z+
	 Klo2gGs+qp43r/TX18eM7N0uZds7kNJ3hDflFBWt+P7031nUmyEuP7xDLthUQm7cycVaj
	 8NPbHOexo9YApsKFJ0I8P36LEKOaiJ+/d9KFFeQ5Q3msibECJXkeqC2IliXj7neDlnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495966;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nOtKGWVdVPb6ADfMhKIMeuga4NjXJyHAm4MRWKDed1Q=;
	b=UFYZTw0zSVhExuWas5vV/SeJpiyaCie2jvXUksg8JQEZsBVnCwMDikUx0KDD9tdIhwr3
	 pX9FasNLCSTMnV1kwFXgG2coVIctvOnxiHZE/TL5X2ChPoxD7Xj8i2BlvD0Jaz96g/szk
	 y0/TzzbXtsnGVaH9H2r3jWAt6evxfMRnyn2WRpNXGASCo55lEanYX1qD9d5Yc2z0DOIBT
	 ovXQPiqBu/xaUAam/sv9BTBGLu/kDP1miQrNRluLtL2irrciHP9CBoi4m7MDkJWmjTe3m
	 0q/xHPzPcWTHOHG3X1OEEpTiBjJg88qSBoHatrnRSTNNEf9yUNwf9byH96nOSuwCOTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Nlc/Oftt";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCE5606A322;
	Tue, 24 Nov 2026 04:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nlc/Oftt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5601F000C4;
	Tue, 24 Nov 2026 04:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795495965;
	bh=nOtKGWVdVPb6ADfMhKIMeuga4NjXJyHAm4MRWKDed1Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nlc/Oftt4gw0/6eW7sxNPebaaRFq40YNQhInckQIUXhFlG8tpItRc6tepxcYOg3tN
	 KXe6t832zE8eLld1+kyumnMKdsbzJ/c3I2PZoUX7yRvRf5ev2Z+DvmjAFRnuetF+bS
	 hrkpxFOVqrcFw4qwJa8r9FLxZrMHiNKKVHXp7SpBnoqUVfeQ/mWDTplmjbSwxI9tVs
	 OTNn4mYorckINZsiJRSxp3yooS5ZJFzIF3m1lNJCckqBpwSgVOg7NE5NbHfyRP5mZl
	 /CgCN6GdxRW+RHKKvpiTpqS2xd9LPzGg3SB8Sdu7OsQyLf/qgffUcxn/O7kOpEpplH
	 c6VknPODTkQjQ==
Message-ID: <sashiko-outbox-230526@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/6] reset: Add Siflower SF19A2890 peripheral reset
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-sf19a2890-sysm-v5-6-4ba44a0db17d@telaak.dev>
References: <20261123-sf19a2890-sysm-v5-0-4ba44a0db17d@telaak.dev>
 <20261123-sf19a2890-sysm-v5-6-4ba44a0db17d@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 04:52:44 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] reset: sf19a2890: unused sf19a2890_periphrst_ids when CONFIG_OF
  is disabled
--

commit eb59c76c1f50a7fd2445c0b31eb22084d7fc905e
Author: Joseph Telaak <joseph@telaak.dev>

reset: Add Siflower SF19A2890 peripheral reset driver

This commit adds an auxiliary-bus reset controller driver for the Siflower
SF19A2890 peripheral clock and reset managers.

Link: https://github.com/981213/linux/commit/37c81bebaf54

> diff --git a/drivers/reset/reset-sf19a2890-periphcrm.c b/drivers/reset/re=
set-sf19a2890-periphcrm.c
> new file mode 100644
> index 0000000000000..54b476237bd48
> --- /dev/null
> +++ b/drivers/reset/reset-sf19a2890-periphcrm.c

[ ... ]

> +static const struct of_device_id sf19a2890_periphrst_ids[] =3D {
> +	{ .compatible =3D "siflower,sf19a2890-gmac-crm", .data =3D &sf19a2890_g=
mac_rst },
> +	{ .compatible =3D "siflower,sf19a2890-gpio-crm", .data =3D &sf19a2890_s=
ingle_rst },
> +	{ .compatible =3D "siflower,sf19a2890-i2c-crm", .data =3D &sf19a2890_si=
ngle_rst },
> +	{ .compatible =3D "siflower,sf19a2890-pwm-crm", .data =3D &sf19a2890_si=
ngle_rst },
> +	{ .compatible =3D "siflower,sf19a2890-rf-crm", .data =3D &sf19a2890_wla=
n_rst },
> +	{ .compatible =3D "siflower,sf19a2890-spi-crm", .data =3D &sf19a2890_sp=
i_rst },
> +	{ .compatible =3D "siflower,sf19a2890-timer-crm", .data =3D &sf19a2890_=
single_rst },
> +	{ .compatible =3D "siflower,sf19a2890-uart-crm", .data =3D &sf19a2890_u=
art_rst },
> +	{ .compatible =3D "siflower,sf19a2890-usb-crm", .data =3D &sf19a2890_us=
b_rst },
> +	{ .compatible =3D "siflower,sf19a2890-wdt-crm", .data =3D &sf19a2890_si=
ngle_rst },
> +	{ .compatible =3D "siflower,sf19a2890-wlan24-crm", .data =3D &sf19a2890=
_wlan_rst },
> +	{ .compatible =3D "siflower,sf19a2890-wlan5-crm", .data =3D &sf19a2890_=
wlan_rst },
> +	{ /* sentinel */ }
> +};
> +
> +static int sf19a2890_periphrst_probe(struct auxiliary_device *adev,
> +				     const struct auxiliary_device_id *id)
> +{
> +	const struct sf19a2890_periphrst_data *data;
> +	struct device *dev =3D &adev->dev;
> +	const struct of_device_id *match;
> +	struct sf19a2890_periphrst *rst;
> +
> +	/* The OF node is the parent's, so device_get_match_data() cannot be us=
ed */
> +	match =3D of_match_node(sf19a2890_periphrst_ids, dev->of_node);

[Severity: Low]
Will sf19a2890_periphrst_ids trigger a -Wunused-const-variable warning when
built with CONFIG_COMPILE_TEST=3Dy and CONFIG_OF=3Dn?  When CONFIG_OF is
disabled, of_match_node() expands to NULL without evaluating its first
argument, and sf19a2890_periphrst_ids is not referenced anywhere else.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-sf19a2890-=
sysm-v5-0-4ba44a0db17d@telaak.dev?part=3D6
