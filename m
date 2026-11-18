Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998399;
	b=VQGzN/W4bkKD37uin7WbvEZQ4l8sz7IW1OFggD552COAW6tin1amXiZ8joc9UPJmMhwf
	 9NmYDqUIU6GOHL3rSRNiCvl7wdG7tl2VY1HOr1c59xGmMihBwolc6E1h6iMQ4xubjJaVF
	 FlnfiTbU8Xsl/EaBXFrVPOmbDGvoxE6CHQ0r4DQcwNNfMRIwutfOsIn+/S1KkBRg+RbZR
	 tHQqYtecokyDoA7tV1HdX+gzR0jXMsUr0G7nWZc1MxHv6tTsMQ2Ih7uC2wItGQACI6Ppj
	 hCOV1f3Z0QYf3OPD4ZQsaT43QaiXU5pDRSvHUnouA/Sjfcex1FlGYgDB8kC91izbU6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998399;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=7qgV51lQfbPmoVLDYc4lh1LBLyAhLf4rlNQEJBmbUtM=;
	b=2olQ+NfM1AIMF+rLwiWdVE8yA5MdArXiZeZa2oJNpWLdQHv7WTl7vM6wn9/y/QsrBdvC
	 3K2XzCx6xmXFSSi+COWXJM1jzNxdmtlwjqbOhnhsbDJtZfV8s4rzFfhaNKagUzbtmshEO
	 Vk/IkO7XO//CxO2gxeYMjuzziBVC1U0+Oa9n63+bqeGli41VjXdzw4MHpHoB0SR7YT6+t
	 qvgSrOiN0bTN6Fp0SOa6LRUWcX9xz3qKl6WZQMuV0OIPyjFatgCDdXugWKDYxhWPKFPtD
	 7Viv71CyVgUiRKXAgy69jtvIR6W/kkYGBckmTD3MHFz8Bk1Y1cCROMw4n0UsDTVXG5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WDrD1H3O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639A3606A31C;
	Wed, 18 Nov 2026 10:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 639A3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WDrD1H3O
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 63A3E205ABD;
	Wed, 18 Nov 2026 11:39:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794998396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7qgV51lQfbPmoVLDYc4lh1LBLyAhLf4rlNQEJBmbUtM=;
	b=WDrD1H3OQdqxpzt2K+Os+PL/Xg13a6fAB2KM2rI78HVBmCvDV7X59bvb7klMVupGc8jlV2
	hyJ3wsS+RxnwsLqx0QN5gkxGpk3SRtbnikPS26RB3gGqo8IFHSuqhqV5XR3ZdwG3HccZ0V
	6X1fUhxJqmlpYF+6dK3zXTSUHQi7BEWsEX9RC409L9E0MVpcyypJBImfCEpQpONHu0EoXH
	NdxeyYR4sW37DBnWEcy2UnNdBoIF/rnNR6L55OOWLT+798ownl1EioLqUw8uBJWiCDeX7h
	Au1RmXa9n6bnfz99uxX8KNqeUAt2djvF/JITe9YWN/3CUZqUUDJRhiO4BaDHOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794998396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7qgV51lQfbPmoVLDYc4lh1LBLyAhLf4rlNQEJBmbUtM=;
	b=MqwAROTZEUWmG2eZXfFDHQYyRGUWRV4aVqlZUcU3juXhvzRoXkNzzqnOeQmoyg3SmVaIbk
	LdwPSamlQeDgGnW02aKASGo0bKFA8UDQ1W3xAlo6Af5uu1y3s9KAun/fAbZCkXDGmVtsW1
	2ylQiimICGuT6FVoBPFfUl34+zSolGMlVaoXz3zyR+TcUM1pKlxW9OrDfMRbRpY6G/zgKW
	T426xiwZaHlvyiBvAhMA2LGexbrQ+XgK0nWSgzw4cxUaiLAmTUhl/LEK0/d+vT8bGtNyHV
	HZKRsGiyaehpwgmfpJqtkXG3xSYUrjdR7vV3iffwkYpVXhFEOs8Ac02HRZiMlw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794998396; a=rsa-sha256;
	cv=none;
	b=RkDivegUVpLxKrgosKaPcaah43MmswUWXEqOJR+xRBejwd8C3ildc0Y9w6soFb1bX27feU
	tqeKSp/NFyIxGTb49GUy38y0AxLoMOFq5uCbATnmgs79k+U9CLLCJhkbMMGkVo1BwZHj0A
	9p+9JrFAfhAY98ClavIrK1fKnoBtGbUVfEEtuOJ71jwcV0xCFsXMAD9CaBKr/jOS/Z8fo/
	8Wv7cAwYIqKwPzezGVsfOGrWgIPu4xWB9uaBPy6l1nmZ2cPV2faeInCox1Ov13NFLTxPTW
	NaLG7Z16HLoSfeMmLrWA6YoPHZvIUZBFpEzxRlasDvJ3dB+z926Fc1oiPcUhGA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <0ee6bfcc5bb62fcb0c9128168e9367254393eca3.camel@pengutronix.de>
Subject: Re: [PATCH v2 5/6] reset: starfive: jh71x0: Support discontiguous
 reset IDs
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Brian Masney	
 <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen
 Boyd	 <sboyd@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org, Hal Feng
 <hal.feng@starfivetech.com>
Date: Wed, 18 Nov 2026 11:39:56 +0100
In-Reply-To: <20261118100523.11395-6-changhuang.liang@starfivetech.com>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
	 <20261118100523.11395-6-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mi, 2026-11-18 at 02:05 -0800, Changhuang Liang wrote:
> The reset IDs exposed to consumers of the StarFive JHB100 reset
> controllers do not map one-to-one to the hardware reset bits.
>=20
> Add struct jh71x0_reset_info, which describes the number of resets, the
> assert/status register offsets and, for such controllers, a table of
> hardware reset lines indexed by reset ID. Add
> reset_starfive_jh71x0_register_with_info() to register a controller
> described this way.
>=20
> If a map is provided, install a custom fwnode_xlate callback that
> translates the reset ID of the reset specifier to the hardware reset
> line. The translation is thus done once when a reset control is
> requested, and the reset operations are left untouched since they only
> ever see hardware reset lines.
>=20
> Existing users of reset_starfive_jh71x0_register() are unaffected.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../reset/starfive/reset-starfive-jh71x0.c    | 60 +++++++++++++++++++
>  .../reset/starfive/reset-starfive-jh71x0.h    | 24 ++++++++
>  2 files changed, 84 insertions(+)
>=20
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/res=
et/starfive/reset-starfive-jh71x0.c
> index d410a5a0ded4..5c64d47fb530 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.c
> +++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
[...]
> @@ -132,3 +152,43 @@ int reset_starfive_jh71x0_register(struct device *de=
v, struct device_node *of_no
>  	return devm_reset_controller_register(dev, &data->rcdev);
>  }
>  EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register);
> +
> +int reset_starfive_jh71x0_register_with_info(struct device *dev, struct =
device_node *of_node,
> +					     void __iomem *assert, void __iomem *status,
> +					     const u32 *asserted,
> +					     const struct jh71x0_reset_info *info,
> +					     struct module *owner)
> +{
> +	struct jh71x0_reset *data;
> +	int ret;
> +
> +	data =3D devm_kzalloc_obj(dev, *data);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->rcdev.ops =3D &jh71x0_reset_ops;
> +	data->rcdev.owner =3D owner;
> +	data->rcdev.nr_resets =3D info->nr_resets;
> +	data->rcdev.dev =3D dev;
> +	data->rcdev.of_node =3D of_node;
> +
> +	if (info->map) {
> +		data->map =3D info->map;
> +		data->rcdev.fwnode_xlate =3D jh71x0_reset_fwnode_xlate;
> +		data->rcdev.fwnode_reset_n_cells =3D 1;
> +	}
> +
> +	spin_lock_init(&data->lock);
> +	data->assert =3D assert;
> +	data->status =3D status;
> +	data->asserted =3D asserted;
> +
> +	ret =3D devm_reset_controller_register(dev, &data->rcdev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to register reset controller\n"=
);
> +
> +	dev_info(dev, "Registered %u resets\n", data->rcdev.nr_resets);

Does this really need to be this verbose? Otherwise,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
