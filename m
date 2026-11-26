Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795663257;
	b=vuRpElAC40dK8FAAKOEc3pFvgAIVvBTw1nU/6+E9cyvNlKjyLXk3uf/raI9GNwmPbj5g
	 eFOEuHbBDSjN25o+2z8qOrli5heOl8z5PEWTCtiEYmu0NrN+4XBmOlvqfpgPK+0p/YkRL
	 vSyu8YHMf6B3YKrnjGlO1uNA3Vqo2pZWmSylqdyw4wMV6GgLgVj8McPeyf1IKWU1gbwIh
	 gR5bhk7C+TcPNrYzzslfBAt5THGkTfD7lwgt2lQ7sVpVVnsiotngFWAMXV3qj00jrKacv
	 yD4mDQ/pt4egPo2UNbsL4xSITzbBwgo+e8JM6/wl2CCapk7ml8rOb5TTEug3YgE7tTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663257;
	h=DMARC-Filter:DKIM-Signature:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ZohoMailClient;
	bh=wl1zFrlH173HoV75rMT0wWjqW6vBAlxFdSbEFwWvJuI=;
	b=lIxn/RddZlHdxeRykGVRFCmBsjgCwgk1UD8YwXXoWwdyRKiS55ZJxA1JXNy1vlCw6tsc
	 +EAgjkibZUM5oxT3V/rfmChkatoGPC6eU2RWWTIVpWAQvLM4cPMwOqxkHS7jHYtrnDHob
	 QH/xXQKfqyiWnvBb6sewiS/5uOJ8fbArFtpJWSFsHKV4wAtemanXfIfAB9RDSvjl2sGxP
	 p9kRxNWKTKn2xfpaIU5TG0YZpPXXYo8hRniOW+2TU6bkHqZpGMKUXX+X30pjJgCvOe9sk
	 gr0MerXm6XohKV7BS2o6XvHtOexfe0f9OAd7JNh/Hwj/uUxmOsq9Q+oUyYyA3o9oxVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pigmoral.tech;
	spf=pass smtp.mailfrom=pigmoral.tech;
	dkim=pass header.d=pigmoral.tech header.i=@pigmoral.tech header.a=rsa-sha256 header.s=zmail header.b=FAvk0CBL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.12
Received: from sender6-op-o12.zoho.com (sender6-op-o12.zoho.com [165.173.180.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEC5606A31E;
	Thu, 26 Nov 2026 03:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CEC5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=@pigmoral.tech header.a=rsa-sha256 header.s=zmail header.b=FAvk0CBL
ARC-Seal: i=1; a=rsa-sha256; t=1795663192; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e4FII9bZdXIdBe8LYq4IGbMGRvCRAqDjcHw9c8PyTsCwtiVOHVX5/o5BFvRZq0JzdHw4je5tOQNaP8jVIjuVYUPUqGGHM2gbGyvBK9FyNT8Kycg4BOOHwfPE7RnxlVPqV/ZCxlxkMgRkxdSOsnV7mkREAb/knXDALPMCKk0t7ks=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795663192; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wl1zFrlH173HoV75rMT0wWjqW6vBAlxFdSbEFwWvJuI=; 
	b=UUDe5cwvt/PXWuIAvUf7gV10dD720xJ276dIrDwnydvX0vcdz39b+TOiVIzKwtv0rWTBNc/hcSoszBNxJ9fhCrI6J3p/WVjxBu6hbPq+8o10JwFbnn0+/tb2RocfO8quJzYOua2SEEyGmP2fsWdF29PJKqhh0Ky4UKSiB+zECkA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: a=rsa-sha256; b=FAvk0CBLjnz+CVdmsl7/q3o4Fp2VSiuJJI4sTMUqqnfWurQhA1S0J/y6uFnL1wO8PJypOYhxEbmZYB28yoWSeEefIUxMG+jv39r2SBJ8lcFiQVUpBH0wno0yeu97zQDXIRopUT3Fgb/Kqtzd5SFHi9F9OFc6dMwE2FASRbwLjHQ=; c=relaxed/relaxed; s=zmail; d=pigmoral.tech; v=1; bh=wl1zFrlH173HoV75rMT0wWjqW6vBAlxFdSbEFwWvJuI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795663189418348.39520229037566;
	Wed, 25 Nov 2026 19:19:49 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 11:19:39 +0800
Message-Id: <DN4TH0CNAM11.2OA7W5L11W78S@pigmoral.tech>
Cc: <linux-clk@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Andre Przywara" <andre.przywara@arm.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Enzo Adriano"
 <enzo.adriano.code@gmail.com>, "Norman Herms" <dockseed@proton.me>,
 "Vinicius Pedrosa" <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v7 4/8] clk: sunxi-ng: a733: Add PLL clocks support
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Alastair D'Silva" <alastair@d-silva.org>, "Junhui Liu"
 <junhui.liu@pigmoral.tech>, "Stephen Boyd" <sboyd@kernel.org>, "Brian
 Masney" <bmasney+clk@redhat.com>, "Jerome Brunet"
 <jbrunet+clk@baylibre.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Samuel Holland"
 <samuel@sholland.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Richard Cochran"
 <richardcochran@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261112-a733-clk-v7-4-db7c5451ffa2@pigmoral.tech>
 <20261125122452.3966873-1-alastair@d-silva.org>
In-Reply-To: <20261125122452.3966873-1-alastair@d-silva.org>
X-ZohoMailClient: External

Hi Alastair,

On Wed Nov 25, 2026 at 8:24 PM CST, Alastair D'Silva wrote:
> Hi Junhui,
>
> On Thu, 12 Nov 2026, Junhui Liu wrote:
>> static struct ccu_nkmp pll_ref_clk =3D {
>> ...
>> };
>> ...
>> static CLK_FIXED_FACTOR_HWS(sys_24M_clk, "sys-24M", pll_ref_hws, 1, 1, 0=
);
>
> While testing this v7 series on the OrangePi 4 Pro (24 MHz HOSC), ttyS0
> switches from earlycon to garbled output with:
>
>   2500000.serial: ttyS0 MMIO32:0x0000000002500000 (irq =3D 414, base_baud=
 =3D 1384615) is a 16550A
>
> Because the hardware bypasses pll-ref (0x02002000) when HOSC is 24 MHz,
> sys-24M physically runs at 24 MHz from HOSC, while pll-ref remains
> disabled with reset/unprogrammed N=3D12, M=3D13 fields. Since
> ccu_nkmp_ops.recalc_rate() computes parent_rate * N / M regardless of
> the enable bit, pll-ref reports 24000000 * 12 / 13 =3D 22153846 Hz.
>
> sys-24M, apb-uart, and bus-uart0 inherit 22153846 Hz instead of
> 24000000 Hz, so 8250_dw calculates base_baud =3D 1384615 (instead of
> 1500000) and programs divisor 12 instead of 13 (+8.3% baud error).

Thanks for testing and reporting this. This is indeed a problem. I had
assumed that PLL_REF would be used on all boards.

I also tried manually disabling or bypassing PLL_REF on my Radxa Cubie
A7A, but have not yet managed to establish a working bypass
configuration... I currently suspect that the selection is handled
automatically by the hardware, but this needs further confirm.

>
> If pll-ref is disabled/bypassed (or if sys-24M is physically fixed at
> 24 MHz as the comment describes), either pll_ref_clk needs a recalc_rate
> that returns 24 MHz when disabled/bypassed, or sys_24M_clk should not
> inherit an unenabled pll-ref N/M ratio.

The issue may affect not just sys-24M, but also the downstream PLLs.
According to the vendor SDK, their control registers have a PLL_FREF_SEL
mux at bit 24, selecting between HOSC and REFPLL. The driver currently
models these PLLs as having PLL_REF as their only parent, so their rates
could also be calculated incorrectly when they actually use HOSC. We
should model those muxes as well.

However, my A7A, A7S and A7Z boards all use 26 MHz crystals, so I cannot
properly validate the 24 MHz case until I get a board with a 24 MHz
crystal. In the meantime, if you have a fix in mind, please feel
free to send a separate patch.

>
> Tested on OrangePi 4 Pro (Allwinner A733).
>
> Thanks,
> Alastair

--=20
Best regards,
Junhui Liu

