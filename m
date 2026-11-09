Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239999;
	b=Ios4r3fwf64EtBEmv5E4NwZWSujZkjRUxdcThIJaGMzbHYW/GkjC0XaoK2fGjT9niwcJ
	 0iFT6C0zk1wFHMaG4YQaAcv29uGpmLhjsC5aRRZEH9VDbBYj8uPOMSTKUel/b31InE9ZA
	 tEphrQKndyxkMMYto6NFPx3qgCnJyibiU8bl2zJmjMvmsTILR15wmSKzV35j94U2D3C/V
	 nYc67797AvWhfgWjyU0C6cHoQ5+zENynqJFu13LIsGvlTrkCYKT0wT18+ZhWfoPw1/ctq
	 B1inqZfI9a+10lD4wgi0lfIMNFVNx7jXjXLYNGcX6BaD1TSz8US+QHAm+V03lVyGMtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239999;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x8+hwW/5zTCinXQlt6chk8M/+naLfTi9oCAtj9giEx8=;
	b=eGPrNjcU2Z+S2vSeNLDdWZerZpFhONCdhmARMvkUBF4lQUGoScZYn1w1YWuBdOL+EXOM
	 wkKGj5ntjHCuBqyF3DlO1uiG5Bxs3+98GsHhwJ8iSwk2GF3/dxQd0DR5nSti5bvzUJRhT
	 zgQhJRmLKiTvu5eDaEpfQmgwSPTLEaHi0o45MoX2rQ/1rYqc0Z7HHdqaGa1LV6eDq4b4C
	 Avq/WkAEI4LLbzm9elXFKLG8qTydA9DCZLaR7N6YBXP2H0HCP+x4ywUpYyZ85uiCvs4mg
	 Td9enFB+46PxxjbNjEuFPu5zxthf+ZPN85/Xpai0Y5cPYgTVzKq+pD/HQwgFJavEJ/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KD5dyefz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F55606A32A
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 15:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KD5dyefz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDCFF1F008A1
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 15:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794239998;
	bh=x8+hwW/5zTCinXQlt6chk8M/+naLfTi9oCAtj9giEx8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=KD5dyefz39IkPX3UpaTum/KOpvhWYH/QEA84LmJrf9FC2cuEL9j27K7ebX+wB04bn
	 oz+hE/n+itAL2Mlh2FfHeaaui09M0oTGZnVfo4S/iV30QmPH1l28Cqht4sdZLHteOX
	 +9teyevkdSyq5Owz2qgKH+u8e+A7cyy+ZCdE87MC0ReVVAaIcK3bCLzvF4EH43+fwK
	 Pw4+dTJjHeRvRnhGfhhojYkKJAanwC6ZR73d8gyrgUX4ZlZGoulWzKVi31L/2QMksM
	 IPDqOR6IbAF39fOdp2z09X4iZG5tveGk3+H6S1WLFQfR+Ni1To7yGvYDhSsy1bgSk2
	 ZTHjWY7vAc0lA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3adfc004920so8985351fa.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 07:59:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGIKwis9ejT2uGsRAMHfr7GHen7azCF6PR1Gt6hgaNydsZOJLRX+RioG18MoV0lRdpwUi09raNgC08=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G47oZDEc2eCsubPABCmZXMSBx+1/Gaxr0Z6TrWrNPZuFhDwuK
	aynjAXgjCU8SVxuhPA/eXz+lp4O4A6x1vo36ncG2SgGUnsdhd8qLhkMU4gG8kyRCK/CPVZ2tpIa
	/mYDY4pS9PhvYdxy0ORF+ocjbEJO1EWk=
X-Received: by 2002:a05:651c:e17:b0:3a8:7b84:be96 with SMTP id
 38308e7fff4ca-3adfa482a5cmr11743561fa.27.1794239997190; Mon, 09 Nov 2026
 07:59:57 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-5-ae8178fce7e8@pigmoral.tech>
In-Reply-To: <20261009-a733-clk-v6-5-ae8178fce7e8@pigmoral.tech>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Nov 2026 00:59:44 +0900
X-Gmail-Original-Message-ID: <CAGb2v66PV8nKSoU+4qA6Z6AS62V0xkuPBjKSy=jUf7Oh0=bv6w@mail.gmail.com>
X-Gm-Features: AclHuK9QXxwYcsEJa5-pvHGGLGfB5fBZTAKpVeZDXOjgDPABVDtQI4CTaoQK7OI
Message-ID: <CAGb2v66PV8nKSoU+4qA6Z6AS62V0xkuPBjKSy=jUf7Oh0=bv6w@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] clk: sunxi-ng: a733: Add bus clocks support
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
> Add the essential bus clocks in the Allwinner A733 CCU, including AHB,
> APB0, APB1, APB_UART, and MBUS. These buses are necessary for many other
> functional modules. Additional clocks such as trace and gic are also
> added as they fall within the register address range of the bus clocks,
> even though they are not strictly bus clocks.
>
> The MBUS clock is marked as critical to ensure the memory bus remains
> operational at all times. And the hardware requires an update bit
> (bit 27) to be set so that the configuration takes effect and the
> updated parameters can be correctly read back for the MBUS clock.
>
> The GIC clock is also marked as critical. The bootloader may leave the
> GIC running on a PLL parent, and disabling that PLL during
> clk_disable_unused would hang the interrupt controller and the system.
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 108 +++++++++++++++++++++++++++=
++++++
>  1 file changed, 108 insertions(+)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> index 3368801053ec..371c4297c3ab 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c

[...]

> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(gic_clk, "gic", gic_parents, 0x560=
,
> +                                     0, 5,     /* M */
> +                                     24, 3,    /* mux */
> +                                     BIT(31),  /* gate */
> +                                     CLK_IS_CRITICAL);
> +
> +static const struct clk_parent_data mbus_parents[] =3D {
> +       { .hw =3D &sys_24M_clk.hw },
> +       { .hw =3D &pll_periph1_600M_clk.hw },
> +       { .hw =3D &pll_ddr_clk.common.hw },
> +       { .hw =3D &pll_periph1_480M_clk.common.hw },
> +       { .hw =3D &pll_periph1_400M_clk.hw },
> +       { .hw =3D &pll_npu_clk.common.hw },
> +};

Don't know why I didn't see this earlier, but my LLM agent flagged this.

Based on the manual (1.0) and BSP sources, the periph PLL sources are
from periph0, not periph1.

Once fixed, my review stands.
