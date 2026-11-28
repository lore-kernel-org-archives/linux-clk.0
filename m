Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859271;
	b=lGxHL8Drqc4569oW8jbxcAsFxKIt9COcoJnR65yGyVA1HmYsutGciBGQS3gZJd4vmjOj
	 4PeSAs9umxvAK61UGcYPyNhwJPjH2zf3WuZBsbOkTrL4JaRYsLkTUhvnUr+zgbd3hlcr9
	 7MqelLcrMhZNK5sBLl2UOKJZhGSKDoCImiEzdmQg1rWx/jtxYoSFNFsBuYx+TPmM44HAv
	 hNDGuwQALHSHYaoluRw08hQ2o14iX84uy/2v61MGQlDu9gELlB0huVOSg0yk+y1L+P+W9
	 0s5nett/bz2Cp06jYmOgFTw3qrd+zGpvPnkltOlFWjhjeT5fJ489MUg0C4YiryA4zlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859271;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=q7m1BrGqcVsyqEMkHgTOA6NvKiiV3L3rDthAqaoJKKs=;
	b=1eN6xAAI165j+sawxpL4faWrghjtkWeP89Bh33dCBB6SrZNrMMpqSiP+Ruf+7sytmgD9
	 wAElbvhM/U+MMpX38QGrsCsOIvLjl/Vcs4gRzLFXrMCmZwoEjZRLosw173p9RWWFzzLpC
	 r9q2xuU+/vQbs0Lw4Ivao7p4G94MyPJX268MUVjretz0DZ05VMseK+WBBoMnH1jSWC89Y
	 t+xpS1U+v5KeSzg9XIGnM6ccpgjyxoDO1EUHZxRmajThcK8aM4E3mhCSwF7bD5te49SJ5
	 aj7Y2xJIgBRzFGaN3rl/M92grEDh7WlT0/N4mvkSZrIoyLminzzQr3farCJDi0NeMqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UT9JSWp6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E137B606A31F;
	Sat, 28 Nov 2026 09:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UT9JSWp6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB201F00898;
	Sat, 28 Nov 2026 09:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795859270;
	bh=q7m1BrGqcVsyqEMkHgTOA6NvKiiV3L3rDthAqaoJKKs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UT9JSWp6k/U9D9DvMm/WHxU29Sa8BuUCaIPnEjCKPVH4GpUfBdvLJ7T2jvKnYIDtG
	 68Sudn5nRdM/qzT0XCWyqAkHG2Q1gUcbivePnXtjhSueLkNKUzJqrS216fpyyv/4Si
	 8Iad3q8GA+JZSLqtuZBZflPcRNtAnXXVAFDURymBQQX+Cs4A1VBQZKyvSNOXHAsevH
	 2B6OyOCmImf0/K/Aalde9PQ/y70uQvGs5Z7xw/4afNK48JF2BoyY1sxGOOI2N5mXnL
	 hYEuOIPY6eaETlDcVrqBdrNs+pLUMsyKpv1/1i3oT4SdGX4QElNvFD3yNks+VTpTb+
	 Kyk/SJsDn5JdA==
Message-ID: <sashiko-outbox-238604@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] clk: sunxi: Fix potential use-after-free of APB0
 provider data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20261128-f81b700d6c-u17-3@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u17-0@mail.sdu.edu.cn>
 <20261128-f81b700d6c-u17-3@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 09:47:49 +0000
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
- [High] clk: sunxi: unmapped MMIO use-after-free in
  sun6i_a31_apb0_gates_clk_remove()
--

commit dc78e25adc6746add0b39ad7479959e1a2f6206a
Author: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

clk: sunxi: Fix potential use-after-free of APB0 provider data

This commit adds a remove callback to sun6i_a31_apb0_gates_clk_driver to
delete the OF clock provider before devres frees the managed onecell data.

> diff --git a/drivers/clk/sunxi/clk-sun6i-apb0-gates.c b/drivers/clk/sunxi=
/clk-sun6i-apb0-gates.c
> index a10ebd1998fbf..9d1fef8c520e9 100644
> --- a/drivers/clk/sunxi/clk-sun6i-apb0-gates.c
> +++ b/drivers/clk/sunxi/clk-sun6i-apb0-gates.c
> @@ -87,11 +87,17 @@ static int sun6i_a31_apb0_gates_clk_probe(struct plat=
form_device *pdev)
>  	return of_clk_add_provider(np, of_clk_src_onecell_get, clk_data);
>  }
> =20
> +static void sun6i_a31_apb0_gates_clk_remove(struct platform_device *pdev)
> +{
> +	of_clk_del_provider(pdev->dev.of_node);
> +}
> +
>  static struct platform_driver sun6i_a31_apb0_gates_clk_driver =3D {
>  	.driver =3D {
>  		.name =3D "sun6i-a31-apb0-gates-clk",
>  		.of_match_table =3D sun6i_a31_apb0_gates_clk_dt_ids,
>  	},
>  	.probe =3D sun6i_a31_apb0_gates_clk_probe,
> +	.remove =3D sun6i_a31_apb0_gates_clk_remove,
>  };
>  builtin_platform_driver(sun6i_a31_apb0_gates_clk_driver);

[Severity: High]
Does sun6i_a31_apb0_gates_clk_remove() leave the gate clocks registered
after reg is unmapped?

sun6i_a31_apb0_gates_clk_probe() maps reg with
devm_platform_ioremap_resource() and registers each gate clock with the
unmanaged clk_register_gate().  When the driver is unbound, devres unmaps
reg right after sun6i_a31_apb0_gates_clk_remove() returns, leaving the
registered struct clk_gate objects pointing at an unmapped MMIO address.
Any later access to those clocks (such as clk_enable() or reading
/sys/kernel/debug/clk/clk_summary) will fault on gate->reg, and rebinding
the driver will fail with -EEXIST.

Registering the gates with devm_clk_hw_register_gate() (or unregistering
them in remove) would release them before reg is unmapped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128-f81b700d6c=
-u17-0@mail.sdu.edu.cn?part=3D3
