Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706412;
	b=fUN217kvJQT9NpaQW19prxx3n1yGQXocPrjJS84d7k5Pc6neTKkHxRdPJImDYITSCFcy
	 0LQ1Mzkh2R02w7rZcnPY31OGbTYq3XBGPT1dPheT0NMV1Pxo4pO/pKLy84LlA+C9V/5Hc
	 oc9TxhfqQfULwPgICCjGBr5oFHo8bU9PaOREw5u/NBwsKbOXlBVf65NSndiY/s9jG+8Kb
	 6zZFJ0rL4Ql+1PN+WGip5GC2wqy85ds+70xs4iPxjIC297UYj5oFTJGG1L1GpV59vm1YM
	 LXJ/UoZywVtducdm0hNCh8Ft0lWu6FxpANt6VSemueNauCKWbhqXRotoCHcYtZelBFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706412;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8sOgvh4yLZPtERkvJnLyKpUnin0Qq6L08scw/NTm3fY=;
	b=ysIyLIdlgYqeWj+0+VJ/+Y3u3yLtC7ufvxwjJfgRBowP9hvmSGg6XHFyusjKBeoBtW1h
	 eAXXsTbMayDaixfWEnl3MY288A+ZOBJ5Q2XHZM/dBm5VWlzmWtwQneMkYyXnUJaGUHudM
	 dez0ePhKRnpRKbtq6ZhIBQTCAw+zLxrebN7EYs+0hRa/RwVlhwZEwRtGPo2bKpjeIpJOW
	 nNikN5S0c+uw5O8+w6I+OAfaSb55affynX3qJ3jdibGEMxQiKIx1CoOBeqGU4TQKP4fga
	 UWpwoJLkJSI/ZEG50N4H5159Ilq1/5rWs0PHuESk21fg9SsWQHD2dLN7+1RGxpulsUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=htOSli12;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F05606A319
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 22:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=htOSli12
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7E61F01825;
	Thu, 22 Oct 2026 22:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792706411;
	bh=8sOgvh4yLZPtERkvJnLyKpUnin0Qq6L08scw/NTm3fY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=htOSli1215KYpG5FM61DDaMEIRDy8GOeLIolELaVBtUDP7eToIG5FzS0koX/cElLs
	 XZjenwAplNt9WKZ2l92XbTCpgfVzKO4C1Owk2B5zl781R7u8U+VQ5K0ICsaH5b/khe
	 2+8m5gIce3H8Ovy8zga+RwE6QycKrGrYbqlWFq/2oNONZZ8DZBT/odlqM7zluIyUXs
	 oQgJigwLRQwd7RDZL4K3dYFTxgtRDx5JfMMll3qjyKSPv091PAEV9MConxPHGy7lMm
	 Pi327pdl++dqwKgtM5VueIoXYZQqiCvBPpJnfidQyVe7q0rypzX/p22Z/o+LEzdjKq
	 zeIuUYUrv/EtQ==
Message-ID: <sashiko-outbox-182086@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] clk: meson: g12a: fix fclk_div2p5 multiplier
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261022-fix-g12a-clk-v1-1-e2bd8f3f1afa@aliel.fr>
References: <20261022-fix-g12a-clk-v1-0-e2bd8f3f1afa@aliel.fr>
 <20261022-fix-g12a-clk-v1-1-e2bd8f3f1afa@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 22:00:11 +0000
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
- [High] clk: meson: g12a: incorrect rate for g12a_fclk_div2p5_div due to 4=
 GHz parent
--

commit 63eec9c39f2ccd77037a929408928c357e150075
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

clk: meson: g12a: fix fclk_div2p5 multiplier

This commit changes the multiplier of g12a_fclk_div2p5_div in
drivers/clk/meson/g12a.c from 1 to 2 so that its fixed factor ratio becomes
2/5 instead of 1/5.

> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index d0d4c7b6dc827..4ec5f15daf980 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -995,7 +995,7 @@ static struct clk_regmap g12a_fclk_div7 =3D {
>  };
> =20
>  static struct clk_fixed_factor g12a_fclk_div2p5_div =3D {
> -	.mult =3D 1,
> +	.mult =3D 2,
>  	.div =3D 5,
>  	.hw.init =3D &(struct clk_init_data){
>  		.name =3D "fclk_div2p5_div",

[Severity: High]
Won't setting .mult =3D 2 here cause g12a_fclk_div2p5_div and g12a_fclk_div=
2p5
to report 1.6 GHz instead of the expected 800 MHz when clk_fixed_factor_ops
calculates the clock rate?

Unlike the other g12a_fclk_div*_div clocks in drivers/clk/meson/g12a.c, whi=
ch
use g12a_fixed_pll (~2 GHz) as their parent:

drivers/clk/meson/g12a.c:
static struct clk_fixed_factor g12a_fclk_div5_div =3D {
	.mult =3D 1,
	.div =3D 5,
	.hw.init =3D &(struct clk_init_data){
		.name =3D "fclk_div5_div",
		.ops =3D &clk_fixed_factor_ops,
		.parent_hws =3D (const struct clk_hw *[]) { &g12a_fixed_pll.hw },
		.num_parents =3D 1,
	},
};

g12a_fclk_div2p5_div is parented directly to g12a_fixed_pll_dco (~4 GHz),
before the g12a_fixed_pll post-divider divides the DCO by 2:

drivers/clk/meson/g12a.c:
static struct clk_fixed_factor g12a_fclk_div2p5_div =3D {
	.mult =3D 2,
	.div =3D 5,
	.hw.init =3D &(struct clk_init_data){
		.name =3D "fclk_div2p5_div",
		.ops =3D &clk_fixed_factor_ops,
		.parent_hws =3D (const struct clk_hw *[]) {
			&g12a_fixed_pll_dco.hw
		},
		.num_parents =3D 1,
	},
};

Because g12a_fixed_pll_dco runs at ~4 GHz (3,999,999,938 Hz, as also seen in
g12a_mpll_50m_div which divides g12a_fixed_pll_dco by 80 to get 50 MHz),
dividing g12a_fixed_pll_dco by 5 with .mult =3D 1 already produces the 800 =
MHz
rate (799,999,987 Hz, or g12a_fixed_pll / 2.5) expected by consumers such as
gpu_opp_table in arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:

arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:
		opp-799999987 {
			opp-hz =3D /bits/ 64 <799999987>;
			opp-microvolt =3D <800000>;
		};

With .mult =3D 2 and .div =3D 5 on g12a_fixed_pll_dco, wouldn't fclk_div2p5
report ~1.6 GHz (1,599,999,975 Hz) and cause downstream dividers such as the
Mali GPU, NNA, VDEC, VAPB, and MIPI ISP clocks to program a /2 divider and
run at half their requested frequency?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-fix-g12a-c=
lk-v1-0-e2bd8f3f1afa@aliel.fr?part=3D1
