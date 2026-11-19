Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099977;
	b=RCw8rkC4xowZS9EN+wB93xBnd3LYclmqqSZey3Xa2NWulgImBhf1dNoQ8dSv6EGYKRTp
	 z9ywUgu67Dc6T8FJhhDf/g2tfd0JSZ/qkyf8v9spOsIWybOjE2BIgId6G0ZPi9Mqpk6wh
	 PosrzeWCrq6Bc7CW3PFRCQMxnSXepi1IYpZhXVSmKX7+yvKpWQc84UyVLGK5mRus/X4Pq
	 46umj1aZKic8qC+YMMucRB9lA3A4sV9u0KPoToPbv/VIoaAASozr6I1l43t5m87syM3Ih
	 /ZHvT/W/y2NlqEUhH2a+157SsCc2/QgcZ6JkLDue+zwQCVvdWPPIFySi2dZyv3L/PhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099977;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9HvdgseMfTKpHE8dS7B3pYeHdBQRYZw5ymckPY9PWeA=;
	b=SFq6exl5Bki67EdClSbJx/bMkiTSxXlFB7btXqqlAzpopjsxkkclulnH/VrGLzjI1pMg
	 rgNtVstZ48l8SkB62qT1dNWpMw7Ls2YVAFowTQ+MRTCcC4NOJ/ewmMmoyA/H8NkAvfyf9
	 o49uDkRbMSiadUGitu+uQJXnQAdRnI8HMCe0CNeOjP0pCc4ZItLI+s+fib89LqWCn1GHo
	 dnRArXYaKadEknzFctSyGvOm5IYe0lBFw+HoWLqA4GuvsNMsFAcxvwIVelJ8EG+7405Oy
	 xfq+VSIdzQhBY2QRjsv8WH3LEo1aYcAZAVd6oE0yorYso2loM9OjNRHVKXXvFlZnFcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OSTdCAqG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037B1606A320;
	Thu, 19 Nov 2026 14:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OSTdCAqG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E661F000C5;
	Thu, 19 Nov 2026 14:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795099976;
	bh=9HvdgseMfTKpHE8dS7B3pYeHdBQRYZw5ymckPY9PWeA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=OSTdCAqGwAjilRcTlg4QnCf4oEeBAfqTv/gDQYUG2FpPEPB/n8EunHLn/ONPaXpOu
	 SveUU66MKBns7yz2FK4OhCBjxYp1PDtv1le5N1J++22XgFxvAKocSTYouN8buMMtOc
	 q8nU6wmgmzv0fx7asYyJsuYH8mlXiUmRrtDC9etNXqNBfNRxc9qDmbE99UFyUyYn8W
	 OP3tIju7rPcyzu+qRKdetAwV5lNB58iA+mtwpfLteNmvIyKpcTryoxRGXnPbBlF9Ho
	 Spe1tuIdFhF+e4DgQTsv9g8ynhmtkuDo7VL+SvcGktdWX7sDpW0CEkq/nCJLidF9N7
	 m6NVjjBWc24vw==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] clk: versatile-icst: release regmap on registration
 failure
From: Brian Masney <masneyb@kernel.org>
To: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Cc: linusw@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
 jbrunet+clk@baylibre.com, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <1795076093787-3-ba1f065a@mail.zgclab.edu.cn>
References: <1795076093787-3-ba1f065a@mail.zgclab.edu.cn>
Date: Thu, 19 Nov 2026 09:52:51 -0500
Message-Id: <179509997129.279270.1694900680492734463.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=B3WrOR4IcxJX+5GntM1nT2+WMxCDlN3APdPaTM4MK4I=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL+87oYxPGlPtwbYn+L9dRvmymhj7jua76KFkpv0OPeM
 P2FzUb5jlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZSc4/hF3Ot+UztXB4OA3GX
 xeeyp+7p2T7Xas50j0qF/Xt/OvDYn2L4H5u/5uhGe8lDG5oN9z54FcvnkSsl98Ht59pWeZ+vt9V
 TeAA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Wang,

> icst_clk_register() creates a non-devm regmap with regmap_init_mmio() and
> hands it to icst_clk_setup(), which on clk_register() failure only frees
> its own structs and drops the regmap pointer, so the regmap and its
> debugfs entry leak permanently. A name clash is a natural trigger: a DT
> with N same-named auxosc children registers "osc" once and then fails
> -EEXIST on every subsequent registration, leaking N-1 regmaps per boot.
> 
> Release the regmap with regmap_exit() when icst_clk_setup() fails.
> 
> Signed-off-by: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
> Fixes: 179c8fb3c2a6 ("clk: versatile-icst: convert to use regmap")
>
> diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
> index 37334afee040..e9c7353aa5d5 100644
> --- a/drivers/clk/versatile/clk-icst.c
> +++ b/drivers/clk/versatile/clk-icst.c
> @@ -407,14 +407,18 @@ struct clk *icst_clk_register(struct device *dev,
>  		.reg_stride = 4,
>  	};
>  	struct regmap *map;
> +	struct clk *clk;
>  
>  	map = regmap_init_mmio(dev, base, &icst_regmap_conf);
>  	if (IS_ERR(map)) {
>  		pr_err("could not initialize ICST regmap\n");
>  		return ERR_CAST(map);
>  	}
> -	return icst_clk_setup(dev, desc, name, parent_name, map,
> -			      ICST_VERSATILE);
> +	clk = icst_clk_setup(dev, desc, name, parent_name, map, ICST_VERSATILE);
> +	if (IS_ERR(clk))
> +		regmap_exit(map);

There is a struct dev here, so devm_regmap_init_mmio() should fix this
in a cleaner way.

Brian

-- 
Brian Masney <masneyb@kernel.org>
