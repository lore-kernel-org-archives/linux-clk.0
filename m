Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794310434;
	b=GE66fM8WhnfcR/zKZqVKGFM/N/19N64SgMqhK0v8/dZRiGfKInt00A82VyZrUsZtCn6t
	 yg5ZUminwhIqES15Vkn5/zpC7qDHsCFANNBYYd7kvawZ+8so0r4uE8RYnbouw9+Pk6+B8
	 Am1Niwt0Asl6oEeDmj08EUZKgYVRj5cEHhX99ioYYnHoFZ2ana1ZHa48kSDrsd/rtIwOs
	 wNTg7BlxVlCYTZG2mLeOrvsuKPineIukvVn3YRDX/ZjVBr/pHUucHcEWwtYbgm9vz8AhG
	 KW7Mnw702jfof9MEblzymW1Q6QF7UQyUJfVZYor9WUUtUlYaJY45lfn6itx7e7JX9mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310434;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=0To9DC9rztZ8FMKyG8qWYuj2srq++9RMNSGuJ2uxDIw=;
	b=RpPUGT+ZBHfte8SZDp2u7dlbK4ilE9aSPNDUoAHguzpmDLf0DB5socUPW83EyyCBGcdV
	 2g9KhG3MDpDHAAWocWLRaJyHG51LOyke2hcAxvEsIcSn2aVslhk47lQjy2PywU8qlqdPp
	 WAh2EaMdiApdzXqicDfWxoSqsRZTZ2Xj6+8Z50LSeKcUaHWUgn3L9xobrllRTBxvz+Gfa
	 K5G4I6oSiXcbJVzSCfp+xTP9LhtBc/IBs5jcj1JDumMnHT8DMtwxM9caMA1D5mfzcDBsE
	 yJcGngztLtNHhi3i5fhuscTucQFvQCIqxUddYtNJU7aifCKthSlBRWylJXQcyVUUziQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WCxE48Mr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D191606A321;
	Tue, 10 Nov 2026 11:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D191606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WCxE48Mr
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 1D8F5200668;
	Tue, 10 Nov 2026 12:33:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794310430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0To9DC9rztZ8FMKyG8qWYuj2srq++9RMNSGuJ2uxDIw=;
	b=WCxE48MrI6xqXZnVlFUcJ9Xp3heIMFPrDZPNyxd9CHE1iouYOj+p75XRvBZrtXSvOVJY3b
	ZbYYHyyqhMF28ogRCwei9qyp57tXe0KFPr65f2J4O4OXVeUR3yIjAHY8mQDfRL/swIvS0R
	so2e3H/721RYvcKYGikD2iIYCd6/CF+NNaCO93G4KTbAZRcUfID9eNgCluA9xvD9EZG8Lk
	ey6CuggaG3mTprxFGh2fbCf/mir5uTxM/tHz0gWcbwvlVHBoCZA/tIyh8lbPXDREj+GgHE
	Afo0SLW4CXnPvwFiNs3D7YOKtDpvBvFU1jk0k4Bf67yCyLEdanHcrfdXQvpIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794310430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0To9DC9rztZ8FMKyG8qWYuj2srq++9RMNSGuJ2uxDIw=;
	b=UrkgkWLUYCEiLCqbf7g89O/CnPShFBBWKLdpG4l4FJwlFb3jQpZ+MSlZ8WBU4f3uzxtiLs
	pVlYRCgbkvC1s41MkMv5NooLDebdK/UqxaDSf3pmiLgqf3XEBZCwiYKKxQsX29sKnbCuOp
	gUPeJ+A3x5QAF9gEk+60T3ct31yJM2zfCefny1lc6cyeuQlN6gbLWNxWA3F+h9CkPFIi20
	5jXHhXePVq22pIB4Kg9oXCD5OkCnD87/gJdwYMqT4U3JqXOuJgXRELgsOkYs7ypdUjtrAl
	xRS6vlXDRWrF5mOLUO7hdPwr4ibLS05Hu9IUWZiO92ldY1S3A7xC79UGPSWZ+g==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794310430; a=rsa-sha256;
	cv=none;
	b=TeTNHYkrXvgQyaNSdF0ATU2QS0qEUei87U2/h60Du+1AEUiOn5ZiLjndulYcTLuMC5R3tN
	VhmNXDSxPDKyfuxUNmDcLDbxfdjEDP29+sNcEhojVL+lHZxjl7dIVftTCCuXsncUGlN3qD
	9FplJli1SUGLjLDYfBZahD6o6gMQr9KdqT2z85bGkpWvxVwUk9B4ggsGzLtjfwdQ2WEar7
	9GGIJZWK0VFiQf+1Y30wPF/tt1t+Pag2cPQMKjr4vKp2kvthHPulT21/4lGWMS4QuNpXzb
	3K37yLDiH78aOrgO6vcrx98u5Tslf5hciTwYW+NioJxNNC+V5mZy559cKjZaHw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <0fb93159c97d446eb26ca18c75ff74c2bc8ceecc.camel@pengutronix.de>
Subject: Re: [PATCH v12 3/5] clk: en7523: protect concurrent access to reset
 and PCI register
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Christian Marangi <ansuelsmth@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>,  Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Felix
 Fietkau	 <nbd@nbd.name>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 12:33:50 +0100
In-Reply-To: <20261110000753.508-4-ansuelsmth@gmail.com>
References: <20261110000753.508-1-ansuelsmth@gmail.com>
	 <20261110000753.508-4-ansuelsmth@gmail.com>
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

On Di, 2026-11-10 at 01:07 +0100, Christian Marangi wrote:
> Use spinlock for concurrent access to reset and PCI register to catch cas=
e
> when clock is enabled/disabled while a reset is also operated at the same
> time.

Why do reset accesses need to be serialized against clock accesses?

>=20
> Some minor rework was needed for PCI unprepare case to permit calling it
> before clk_hw_register and reference the global spinlock.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/clk/clk-en7523.c | 101 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 95 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 2baec734df9f..fbe10e4c3693 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
[...]
> @@ -788,21 +866,25 @@ static int en7523_reset_update(struct reset_control=
ler_dev *rcdev,
>  			       unsigned long id, bool assert)
>  {
>  	struct en_rst_data *rst_data =3D container_of(rcdev, struct en_rst_data=
, rcdev);
> +	struct en_clk_priv *priv =3D dev_get_drvdata(rcdev->dev);
>  	u32 offset =3D rst_data->bank_ofs[id / RST_NR_PER_BANK];
>  	void __iomem *addr =3D rst_data->base + offset;
>  	bool inverted =3D false;
> +	unsigned long flags;
>  	u32 val;
> =20
>  	/* For PCIC reset logic is inverted, 0:assert 1:deassert */
>  	if (offset =3D=3D REG_NP_SCU_PCIC)
>  		inverted =3D true;
> =20
> +	spin_lock_irqsave(&priv->lock, flags);

Consider using guard(spinlock)(&priv->lock) to simplify this.

>  	val =3D readl(addr);
>  	if (assert ^ inverted)
>  		val |=3D BIT(id % RST_NR_PER_BANK);
>  	else
>  		val &=3D ~BIT(id % RST_NR_PER_BANK);
>  	writel(val, addr);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> =20
>  	return 0;
>  }
> @@ -823,16 +905,21 @@ static int en7523_reset_status(struct reset_control=
ler_dev *rcdev,
>  			       unsigned long id)
>  {
>  	struct en_rst_data *rst_data =3D container_of(rcdev, struct en_rst_data=
, rcdev);
> +	struct en_clk_priv *priv =3D dev_get_drvdata(rcdev->dev);
>  	u32 offset =3D rst_data->bank_ofs[id / RST_NR_PER_BANK];
>  	void __iomem *addr =3D rst_data->base + offset;
>  	bool inverted =3D false;
> +	unsigned long flags;
>  	u32 val;
> =20
>  	/* For PCIC reset logic is inverted, 0:assert 1:deassert */
>  	if (offset =3D=3D REG_NP_SCU_PCIC)
>  		inverted =3D true;
> =20
> +	spin_lock_irqsave(&priv->lock, flags);
>  	val =3D readl(addr) & BIT(id % RST_NR_PER_BANK);
> +	spin_unlock_irqrestore(&priv->lock, flags);

Why is this read() under a lock? The commit message doesn't tell.

regards
Philipp
