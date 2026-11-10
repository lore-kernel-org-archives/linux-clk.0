Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326237;
	b=gPqtRzsltoJ7Qht4aCmb0/5Tbh+jI9EkaDM8eNSVlNL2GVG6x7T1XcY2GmCk/8LxvJr1
	 pQLZ7A7FEqzOpJZffiOg0bcqC8MZi4DEjUIdYPf/LZbtvKnDSPN5yC3JezpTV/mJ1oPdq
	 Rhj+MWRGj2kqLreve7cI7woSkN0GLgnh8lhRDbe9QljrSw+G+o5FzamxyN9623BtBIiX2
	 x+JHg0rVBJD1IikCSRG/xpEZVGQ7Adao1F1oFeoRGE1CQ84hOAmiOTknMJsBVZvMsie7T
	 sM1PCZnZWJL3z8QBhXeX/T3KyPv2LlJn5b8t1BsGW0PCyrk+VJawGbY3RJnOpLCAXYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=RWEG02ii2Bekn4jxdEeI8vIwOKDAIYsvyu7g0S6lfUI=;
	b=XbAWfCKJfWfzSiyCriII3OZvpyWStfkE8HecMD+rmlOdJWZ5kDLojn1r7x9pzbZ18gQM
	 d4Co+flHCwyuKolpHI+VOTHD5QNlOelk3vvAiT7SC92qZpH0HZx0RXuWzA8HxdBHLi1nj
	 T08vz5tCy9GN59iB89wjR1FZEwNG0dYofJOXHEpeKcjkeaSevEaWebxnwV4W8245tyf4x
	 vefJZmVwzvF1SXP7gK69W/uTHeoxp8fC1vlbsYtLDDDa7v6oRcrEKgFoeJD4ZcJ8p1DiC
	 D9X4AJtpn0pvlIAuvY7kLsJRm0wEMuikRBP4294cPbseYf7JnZbwKedI2gZjwG22u/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VZExvN5k;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5D1606A31C
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 15:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D5D1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VZExvN5k
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so21774745e9.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 07:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326235; x=1794931035; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RWEG02ii2Bekn4jxdEeI8vIwOKDAIYsvyu7g0S6lfUI=;
        b=VZExvN5kuJ0d2/dlZ/+SumROpUETm4YWleyxygMe/Xsa5GJkPCIOEwp7jHoqHEpktk
         xW7wEUn71VE5RedIc6b7+xHys21fWni86TM7h3AxRjwwcaKhloiicxQr/IZAsh/w3W5R
         qju69PjrjvEtOJ5uZZka2jpVTBjCWBX+nDb6Mm3xSAAiTvF5Tu8MzGar39Byx7ToJwyl
         gmQxdvskNcBG4D9jNGJ+NRxsZdNTwVg/C18aau0bm+BsEtePDBQN6m89s5BQC6tez7p9
         BAcObCc+z6h34sxpqjvZSn3w+NTQTcNQBWP2dd/x8J3GsR6WreFLk4oDjeu/NOhTrTAu
         DVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326235; x=1794931035;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWEG02ii2Bekn4jxdEeI8vIwOKDAIYsvyu7g0S6lfUI=;
        b=2UQ+2shm7KQUr47IR81xijfunqgtx6lgZiXTR2tuEbSZDuvr8p1LnAVnH46H7F/EBg
         FtRHv9D9aZskGW2wJUnp1Spvr9O5mLhCNQSrRtV6Jo6+JzxR61IFBRbjelYapKm+iBv6
         UP0/yUcqAExKNnOdo0Gk5o53AtyQ7wtck0tWHiqXRsSpnSntnGb76jqSpaiQVadjk6ka
         ObbJS9Y/KB5opUprUFI404RzItlWdayTxS7iYBlY9Tj+4gj6bxmiTDqv+sPQU2wYwHHr
         ft1Im46a6JzcEXXoSyy+q+FANFv/rCoxORhIvF6hhxpMchfEqBnKeQn2NaxJZoyJPQAA
         ccAQ==
X-Gm-Message-State: APuU4Z9lHxDx0W5IqJ8iQN15V5DjZbwmPNiy87ZRZ14AmIxWA5ugFqnO
	4K254rUGtHMWZZQy2rQTNZgM8zjdjKA9xjF7+GT445nct/uTOqj2iLl3
X-Gm-Gg: AYBFou3wuQ88GbRzcwfCFEUNLdxjXzOq4x3IRbKJAfJzkx57OMamNpD+2EmwAiZapBe
	VNsMmlp1XEjCjGz9f3BSlgXxkLv6PmCRrm13MEzzurGcedwU47eJJvT4WYLZmcMvhFwJ0QSYYxA
	PvxoWFybh+zwrKumjv4tQqeDr3rNjKC3+W7jSnxMCcWJgRQlga8xTQDi8QmyRA0tAkmXQoT544y
	9djg9IhTkZDiuAwTvYCWmgfuY7QsWM4HwK25eCbT6bSR5ORvQ6w9F938A/7PRyVhj8CxGes1jub
	1WTNTCHO2h03sQdSfsEs7SJtTGnfFiwKas6WwCUnIpKwTtBKlIu958JkZQXUe7P0lMbXe120LJB
	pcPrrXJi3+tcILJPxXqinCTxlcxCo6CDOnSqyuF+eWCM8y286T2i8GTosFjsCn7wXh4inqZlOx6
	QuSnCRqYxhjpFjm9zgT1ACvzCJtEQKc+aoLtRGbDJBXEs8Hqf4YIqVwyL1klGg2HB0ru7OC7RDT
	43ZuC0vpwOy6nSO1WhONdeatiNTpTibEh/DP4IXzZHqSsxfgBuX7OuIP0nSn/wLn3tAbMSDWCUW
	tR9b0SXKsHcXXNxryLVA/wjsM2wQ9B3ZKdyRLYuAJ7xU1l86tbYQ905W3iQNRTyvqLeQYc9daAt
	N3XJFu5DUvg+lDmCHGb3FORHgkui6so0Xeyq6z+9B+x8/Hybt2l4qD+cPHRzVit4vTNVKMMeMET
	d/sctwzXmq9CAA2JnwU6fHS12DufZYpFpAE7o6+rKQgTXfT+A1GRkxUXtWGE5cZu/ujnc5zcO3L
	64ZEsNiT8RSF23j4/oMzwhmgDQILOBU9Hr2CGIoa28NQ9puMTB4pQVr/NDOGWE=
X-Received: by 2002:a05:600c:46d0:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4ba023052c9mr57287525e9.4.1794326235267;
        Tue, 10 Nov 2026 07:57:15 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0236f03esm56975655e9.3.2026.11.10.07.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:57:14 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, aiyengar1990@gmail.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/2] clk: sunxi-ng: h616: Fix the EMAC 25 MHz clock parent and
 divider
Date: Tue, 10 Nov 2026 16:57:13 +0100
Message-ID: <jHidiYvvSNm_NWg1iHXN0A@gmail.com>
In-Reply-To: <20261110-h616-clk-emac-spdif-v1-1-e5e36e8963e4@gmail.com>
References:
 <20261110-h616-clk-emac-spdif-v1-0-e5e36e8963e4@gmail.com>
 <20261110-h616-clk-emac-spdif-v1-1-e5e36e8963e4@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 10. november 2026 ob 07:03:00 Srednjeevropski standardni =C4=8Da=
s je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> The H616 user manual (v1.0, 3.3.5.86 EPHY_25M_CLK_REG, 0x0970) gives the
> EPHY 25 MHz clock as PLL_PERI0(1X) / 24, with bit 31 gating the output
> and bit 30 gating the PLL_PERI0 input. The driver models it as a plain
> gate below ahb3, so the clock framework reports the AHB3 rate (200 MHz)
> for a clock that runs at 25 MHz, and the clock tree does not show that
> the PHY clock depends on pll-periph0 rather than on the AHB3 bus.
>=20
> Model it like the D1 driver does: a gate with a fixed /24 pre-divider
> below pll-periph0. The register writes do not change, only the parent
> and the reported rate do. On an Orange Pi Zero2, emac-25m now reads
> 25000000 with pll-periph0 (600 MHz) as its parent.
>=20
> Fixes: 88dde5e23da1 ("clk: sunxi-ng: Add support for the Allwinner H616 C=
CU")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-h616.c
> index 955c614830fa..d2625fec651a 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -489,8 +489,17 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(spi1_clk, "spi1", =
nand_spi_parents, 0x944,
>  static SUNXI_CCU_GATE(bus_spi0_clk, "bus-spi0", "ahb3", 0x96c, BIT(0), 0=
);
>  static SUNXI_CCU_GATE(bus_spi1_clk, "bus-spi1", "ahb3", 0x96c, BIT(1), 0=
);
> =20
> -static SUNXI_CCU_GATE(emac_25m_clk, "emac-25m", "ahb3", 0x970,
> -		      BIT(31) | BIT(30), 0);
> +/*
> + * The EPHY 25 MHz clock is PLL_PERI0(1X) / 24, gated by both the special
> + * clock gate (bit 31) and the PLL_PERI0 input gate (bit 30).
> + */
> +static const struct clk_hw *emac_25m_parents[] =3D {
> +	&pll_periph0_clk.common.hw
> +};
> +
> +static SUNXI_CCU_GATE_HWS_WITH_PREDIV(emac_25m_clk, "emac-25m",
> +				      emac_25m_parents, 0x970,
> +				      BIT(31) | BIT(30), 24, 0);
> =20
>  static SUNXI_CCU_GATE(bus_emac0_clk, "bus-emac0", "ahb3", 0x97c, BIT(0),=
 0);
>  static SUNXI_CCU_GATE(bus_emac1_clk, "bus-emac1", "ahb3", 0x97c, BIT(1),=
 0);
>=20
>=20




