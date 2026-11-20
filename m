Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216050;
	b=mqhFiHjfRhThOs4uj/cA8SdSFV+JD1+PQNrwVVhy35BOKVhcpQREOYYJ66UZNwGmQxSS
	 cgKDm5EiIIThx1kLjH57JkUupSFqrOmNyepayARqxzF6H4uwCsuudn82XSN9A76bxt94S
	 5srj5l29KU5xEVeJKHacbm3oDXy6QS3/1GtKdUob3ETPSvAbyWOuBGDGGRlFzR6YSURtY
	 +xPTMb3Rq9A3BTwR20B48oeHzyDvwIp3dWbBbENiCyuDSNG5Q41vmNasitiq8s+Ey/5H6
	 x5UaIBJq09DQw4T5LKrqxcAVvn//88wQ1CTL0kol6KsVUFzBJ0Rrzbiv5mz+R9m3ksQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216050;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=momKsdg2sSB07Y3lV/5odKXJ79/xwDkpzA9EjI09pvw=;
	b=t1O1FhfRtwHyIrMd4Ngm0fNSgFILlPh6DKw1OreGyt4hbWa4JeiFY4IN2Vh2OZZIkGJc
	 fj5Cfz6e52vWzNo811D322cATvBSNJEJMgR+VW5gu1Ykd9wlGhgcChZ9Pd5V7y0G3LJiO
	 qBxiw3+XRPrsQv4DKBAQaDDgAR0OEq+MeCpjmwVL75swcYk0a1I1u5IxgohymfjUIpNau
	 7kiYhNeKe5sipLSaWYc1Re3Abb/gupRJZCbq7kzFQvNjDlbbySwp2DohjU2lMWau84nFZ
	 ng0HPcg8s+TGZgZGnQL6852D7+UZd5OGBYyMd1Kp2WKLVKGm+0NWczISskD/QIQpRwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CyNutJwI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00582606A69E
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 23:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CyNutJwI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A9F1F000CA;
	Fri, 20 Nov 2026 23:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795216049;
	bh=momKsdg2sSB07Y3lV/5odKXJ79/xwDkpzA9EjI09pvw=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=CyNutJwIpzvxW2jbc4e98okbs/lK0NJHkAwmUAOWY/0/j799Zh6z65dyyyGyjBDGq
	 q/v1D/u7/eet98psx/nKJlCYMthsvhcgDLbFFevoUhrcblyMapdgWvNZZc3Ar5yNl8
	 kirmtIOYZbzzou5Lxq1zXq7E/03Lro9GxznBElHsT8LSJ4wnKBAuGUGu54vqzRWz8U
	 XCKbzh/kojsj/iGb+9nMFxNuGxeo3uBzspx6gFtNn2ndis/+805spDzvbFU2yTcLU7
	 dB3RbgI2wDKppPAdWFLEvb/RZjvFx0WTt1mPKtucTjCSLE2eQB3bsLZtWR5h8wS7Fv
	 IqltR0jug6wEQ==
Message-ID: <sashiko-outbox-226333@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] clk: en7523: convert to full clk_hw
 implementation for en7581
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-clk@vger.kernel.org
In-Reply-To: <20261120225916.158641-2-ansuelsmth@gmail.com>
References: <20261120225916.158641-1-ansuelsmth@gmail.com>
 <20261120225916.158641-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 23:07:29 +0000
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
- [Medium] clk: en7523: unchecked en7523_register_pcie_clk() in
  en7581_register_clocks()
--

commit ac94f30014f62a41145dc175cf9bba75f5f392bc
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: convert to full clk_hw implementation for en7581

This commit converts the EN7581 base clocks from fixed-rate clocks to a
clk_hw implementation with dedicated clk_ops, and updates
en7581_register_clocks() to propagate allocation and registration errors.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index b38d7b5dc0ac0..8c00646ecdc6a 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
[ ... ]
> @@ -741,46 +747,76 @@ static int en7523_clk_hw_init(struct platform_devic=
e *pdev,
[ ... ]
> +static int en7581_register_clocks(struct device *dev, struct clk_hw_onec=
ell_data *clk_data,
> +				  struct regmap *map, void __iomem *base)
>  {
>  	struct clk_hw *hw;
> -	u32 rate;
>  	int i;
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
[ ... ]
> -		clk_data->hws[desc->id] =3D hw;
> +		clk_data->hws[desc->id] =3D &en_clk->hw;
>  	}
> =20
>  	hw =3D en7523_register_pcie_clk(dev, base);
>  	clk_data->hws[EN7523_CLK_PCIE] =3D hw;
> +
> +	return 0;
>  }

[Severity: Medium]
Should en7581_register_clocks() also check the return value of
en7523_register_pcie_clk()?

en7523_register_pcie_clk() returns NULL if devm_kzalloc_obj() or
clk_hw_register() fails.  Without a check here, en7581_register_clocks()
stores NULL in clk_data->hws[EN7523_CLK_PCIE] and returns 0, allowing
probe to succeed with a dummy NULL clock entry instead of propagating the
registration failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120225916.1586=
41-1-ansuelsmth@gmail.com?part=3D1
