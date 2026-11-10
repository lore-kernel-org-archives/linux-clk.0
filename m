Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794275691;
	b=Gpn2+FxJuZrDhaudmwFc3koQqWDyVGiCJW8yP/0zeUwa7ZN70ZuDRBgKrYd4Tz3Y0gXE
	 qhTfvOV8BIRV4yi/O0YSyy/cz0qUIFlSLGdPgLItRzdM3+2tNY+vw5WsZHXvIHA+ieUrb
	 lyDxm1dfSU0nwMvvbZnJAtY4L8zIX4wNU4f/5SZvlGIlCBxIrLyWa1tmGybRsn5CYRyXL
	 d1NhXAe6ZuG/kDoa87Q6wwM+h7ME+dLOq/n2p9LGHNglXkq9ip+VirEY/yYqylyN9r6WF
	 L15KWbAIB7AOEKWKAo+aaEuXWsmLZTNGC88lZVdgxPWTRRcsWnP6mls7+FtKkPsRmDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794275691;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=O0bSKZsrizNHDJCyHgjYf8iecUY8JQEZjB3jKDHxQ0o=;
	b=ce6FHtV8jaC0zZKrTjDxzlYirG1N8z3gNm6SvicrIRvNIRwVm2ZoiMpL/+Oh/BBTbJFJ
	 8C2YDtYoMEsGf9T/S3/v/JfTGHOedWxYgoHmyI0RbVGLU3EhnkWyxR7QkGkEzYJGVcTMg
	 CM0INFkCaCfIRz4/NLtHbb3zzdNf9KdxqnurxOl6WDbgRlnbHre+U7cfi35FoCKNL6z2X
	 Y2AdY3gmk828LNIZvTiD5OLOjJPfLCcl7esBi7ghsypC4TINhylmKP9n7AU/5gwdTc6+T
	 le1AJ/Vo56w/fcW0w+R4OtdjrcZF1tCAYsDrPMExqOwW8reqXQGOg3kMveguFjTp01A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ApdJWYcb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DE5606A31C;
	Tue, 10 Nov 2026 01:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ApdJWYcb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82FB1F008A1;
	Tue, 10 Nov 2026 01:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794275691;
	bh=O0bSKZsrizNHDJCyHgjYf8iecUY8JQEZjB3jKDHxQ0o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ApdJWYcblgf+NpT6USh/GtE+Isw2tIZnQmTEMdAq1sINuj/x4fCnlWqNZaYlB8iZX
	 78nhou07MIvsB7t23i7nCjZKwjnWUmYWvmB3lPMXblnVOcySRC56Kc1SfyA9HeDNeC
	 wqHT7WgGsSqTOlTUQGkAaoaUibTtF6aUQgkztthDQdkhvpnZFIKE/zuykcMYhz3HLY
	 6GySvdFv9TuNVht+8yVl2Z1yU2RLnYFuur/g1cl+j9RXo4N/RJ/5iPa3FoIs5PgxKt
	 cRZOHfzB07mNf0T9zADF2r7LwBb5ZjG1j+7Y7TEOJ8dyR+wxwfi/+Fbsn2+LJ0QaNK
	 3FzD6q7MIpS/Q==
Message-ID: <sashiko-outbox-206004@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] MIPS: ath79: move the bootstrap reference clock
 to setup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110013646.1582970-3-rosenp@gmail.com>
References: <20261110013646.1582970-1-rosenp@gmail.com>
 <20261110013646.1582970-3-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 01:54:50 +0000
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
- [Medium] MIPS: ath79: missing OF clock provider on ref_np in
  ath79_setup_ref_clk()
--

commit ba6521274f3bdc958b3f63de9327877ef55638bc
Author: Rosen Penev <rosenp@gmail.com>

MIPS: ath79: move the bootstrap reference clock to setup

This commit moves the bootstrap reference clock detection to plat_time_init=
(),
registering a fixed-rate clock when the device tree omits clock-frequency a=
nd
warning on mismatches with the bootstrap pins.

> diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
> index d9e1cc77ad04d..dff0fbe07b047 100644
> --- a/arch/mips/ath79/setup.c
> +++ b/arch/mips/ath79/setup.c
[ ... ]
> +static void __init ath79_setup_ref_clk(void)
> +{
> +	struct device_node *np, *ref_np;
> +	unsigned long rate, strap_rate;
> +	struct clk *clk;
> +	bool strapped;
> +	u32 dt_rate;
> +
> +	strap_rate =3D ath79_bootstrap_ref_rate(&strapped);
> +
> +	np =3D of_find_matching_node(NULL, ath79_pll_ids);
> +	ref_np =3D np ? of_parse_phandle(np, "clocks", 0) : NULL;
> +	of_node_put(np);
> +
> +	if (ref_np && !of_property_read_u32(ref_np, "clock-frequency", &dt_rate=
)) {
> +		of_node_put(ref_np);
> +		rate =3D dt_rate;
> +		if (strapped && rate !=3D strap_rate)
> +			pr_warn("ath79: reference clock is %lu Hz in the device tree, but the=
 bootstrap pins select %lu Hz\n",
> +				rate, strap_rate);
> +		return;
> +	}
> +	of_node_put(ref_np);
> +
> +	clk =3D clk_register_fixed_rate(NULL, "ref", NULL, 0, strap_rate);
> +	if (IS_ERR(clk)) {
> +		pr_err("ath79: failed to register the reference clock\n");
> +		return;
> +	}
> +
> +	clk_register_clkdev(clk, "ref", NULL);
> +}

[Severity: Medium]
When ref_np exists in the device tree without a clock-frequency property, d=
oes
skipping of_clk_add_provider() for ref_np break DT consumers that reference
<&ref> by phandle?

In of_clk_init(), _of_fixed_clk_setup() fails when clock-frequency is absen=
t,
leaving ref_np without an OF clock provider.  ath79_clocks_init_dt() works
around this by falling back to clk_get_sys(NULL, "ref"), but
arch/mips/boot/dts/qca/ar9331.dtsi also wires the UART to <&ref>:

arch/mips/boot/dts/qca/ar9331.dtsi:
	uart: serial@18020000 {
		compatible =3D "qca,ar9330-uart";
		...
		clocks =3D <&ref>;
		clock-names =3D "uart";

When ar933x_uart_probe() calls devm_clk_get(&pdev->dev, "uart"),
of_clk_get_hw() sees that ref_np is an available DT node with no registered=
 OF
provider and returns -EPROBE_DEFER without falling back to clkdev, causing =
the
UART probe to fail permanently.

Registering clk as an OF clock provider on ref_np via of_clk_add_provider()
when ref_np is non-NULL would allow phandle lookups to succeed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110013646.1582=
970-1-rosenp@gmail.com?part=3D2
