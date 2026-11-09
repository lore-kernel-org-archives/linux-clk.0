Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240439;
	b=q4tPsp5h5z/fAfwCDG3lIwew2pVE3BxMask5o7e/e32+Ww1HxN9G44tqAVDTkX+DqW4i
	 KTtYs79FL1QZzAtpYZK+45s/h94xZcJJz2YKACNn4MChHRWRE8R8ze6jNcEUirYKf+0iF
	 aRTfdA2wRyk2aTzKJ0bWZOVTArco9Gbf224bYlZrD8YySgL63CVvxvK3BpenO2jqqr4s9
	 MK7dj90DczDZOxmPPGe8fsa51QRX4N1V8QhgQIN6gdQlECSmkEz9jRjpSFZBC+0r1xsse
	 JulPWpGm6VE4ZJug3i7qaFIvwhUAvyhmq/QaR65n0HZWreyEAoemDi0RD5JvESW9qdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240439;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GFQPb65NT7RMSCppnWXFsuqs6MvLmEnYZdDh5XC4mjA=;
	b=l9BVuJFm35DcMFVTVQWGD2RMCdJ+aHam78wke4D0DaXtepi1lRqdW0C1FIoph7rlK37Z
	 JhDDRE8QIsM6lbkiXR+u5fG+45lGHZ/43nV56I8Rt8z+OZWaWAxTETd1mB2jr/gLwzcYz
	 sUIS8TC0CTLju5JekKZQLhNW8Mn8o6rMbk+0G0OU9j4uUGfkdNjwvrDGdk3AXS9NEgExr
	 EwGzlO3zSLKvBxBJ98QzmonY/dVXbqquQghODx+Icp7nWxyXepxgLo5uxUf6fXbt+U0SL
	 XcXjby3oIkhJWW+pOP0qiigSJ0XMsDq2df9UV1WLwSw5eBEMREvFpi6dEhjtkhKc6UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UPpFuF29;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9AE606EEB7
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 16:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UPpFuF29
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC151F00927
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 16:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794240437;
	bh=GFQPb65NT7RMSCppnWXFsuqs6MvLmEnYZdDh5XC4mjA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=UPpFuF292enNAk33j0lC+1PqdbjJadzioJZ9ju8EwW47zs88GH4LOgNx6EXsBeAVS
	 naQyLa5OJnp5SwqUX8i35edRwP+9AafAV+Zz8HdaTatC78INOzQLTZGY6xqBbAdv/w
	 IiBpDWoJ7kQqe+JNkrpVw+hcxH4K73HSm0ZwcQcAPxQTgH7kNV3MNpL2gTH1DzNyal
	 c2ohYafFn+0LycaXUe345gUZ3bkAugp/UYZE1nBzEES9VDKgulLZ94SrK0/f9E6ILx
	 D/nEratmZRTSCwdOkvM1jJUmOWwhPHp9t6xXNpRh+E/zY0IW2d3tLcFSer/hskkYgY
	 vTE3vP+uIGl7Q==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso950623e87.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 08:07:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEMZaIm3LV/ttp8p8P7Bq+oZ77VRQtV2GVNm9AgLaZCnthDSXeL0lGcoPZ16qNqx5CVNe3kaK9xg/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hgh6FezYogoKbcs4scG4QUPq/xfYik8//HwiTyLlhLQLCEP04
	nYTcEAuUjFpH99eOB5x7wYvL7S79d6Vle6n2AoSnwmw/2VYRKy4N7jABcmAePuQVChTLy9AsPgs
	nGc223/VCme1KRk9aSVFDO37+n6rZiKM=
X-Received: by 2002:a05:6512:1396:b0:5c1:4974:c15e with SMTP id
 2adb3069b0e04-5c14c0347cbmr1335285e87.52.1794240436213; Mon, 09 Nov 2026
 08:07:16 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech>
In-Reply-To: <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Nov 2026 01:07:03 +0900
X-Gmail-Original-Message-ID: <CAGb2v67M2bN6a4AsNL_Lv70QmHTvdSWUCbPQat6Po_7KbbqA-w@mail.gmail.com>
X-Gm-Features: AclHuK9agX6QEN1ILAcd18vE_t6MGmoL64ggMRVBKmQGQ0cwuc_S8X4_YIrWVls
Message-ID: <CAGb2v67M2bN6a4AsNL_Lv70QmHTvdSWUCbPQat6Po_7KbbqA-w@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] clk: sunxi-ng: a733: Add mod clocks support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, Norman Herms <dockseed@proton.me>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 12:54=E2=80=AFAM Junhui Liu <junhui.liu@pigmoral.te=
ch> wrote:
>
> Add the module clocks found in the Allwinner A733 SoC, including video,
> storage, interfaces and others. While most of these clocks are similar
> to those in the A523 SoC, this implementation accounts for changes in
> register offsets and introduces support for new modules.
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 1103 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 1103 insertions(+)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> index 371c4297c3ab..7847eec84313 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c

[...]

> +static const struct clk_parent_data dram_parents[] =3D {
> +       { .hw =3D &pll_ddr_clk.common.hw, },
> +       { .hw =3D &pll_periph0_800M_clk.common.hw, },
> +       { .hw =3D &pll_periph0_600M_clk.hw, },
> +       { .hw =3D &pll_de_clk.common.hw, },
> +       { .hw =3D &pll_npu_clk.common.hw, },
> +};
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(dram0_clk, "dram0", dram_pare=
nts, 0xc00,
> +                                          0, 4,        /* M */

My LLM agent flagged this: the divider is 5 bits wide, not 4.
Both the user manual (page 149 from start or 128 as numbered on the page)
and the BSP agree.


ChenYu
