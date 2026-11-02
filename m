Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629496;
	b=VFy8Ukb27uUWhPMWwt9brDqZ9LEjIo6McuQEuAaFO7TLeKxWC5f+UDkA8MNXNcu+H5oS
	 cICzuyWhdjC+dsfQR66A8Sy2nyuB3MGMMPuiZhNF4kf2++QaJOUBqQY5BiU/dNxCoQk97
	 1EjkV1aZnXL7iD88quXs6qGgIcZAXQZxxwZ10PwRcsID30ajOHTMZitGkdy6xSSGuqMZb
	 9YTKeZa4LtgBbHaHK0/xFHsuVf7bQEOa0AgjKV69+bv96yCUZycxwRzr3gwYqRNf+Lm8b
	 bAm0yMs0r4Yv1zwZoMhxxQbgZPF0jVdHH/gCV8PPZSk6OBJi0XABlOMg7eREB1A77Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e+OZmX8JIf6s1L/six0W6PN/I70GBs5nxLKcsSZPbfs=;
	b=3kH8rlgEaqq4dhuZ1ayS5p44jHscHBIIs+F2BknGVutpexblhynkNXFoP1yzjUhxbZGI
	 fmH18TQukieVkWEjuKsaAU79m2eei+SDeeQIBa/7E3pWQxt8LDH8B8rfAjMUQxFM1tqRf
	 p/Nd3ZqbTeCSbbnevfsz8Fn3M+IrnZCxqV5QjohUp1ZkLBVNi4k6rgamNbcOh7VPZrSoV
	 YiPGDl1Y93Fpl/F7xYWf9m3/Bsl0Fz1dU3t8Nsdkt4ofTVQzWHPTqzM8lZbZ3RL+GHDXu
	 EdSdHRyMNo84VJWkK71MBGqmsk6EmflsbqWn41JE1hri0kCqCwQldas8mqp+5decMdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CGf/6wG6";
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CBE60A6F6F
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 14:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50CBE60A6F6F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CGf/6wG6
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9ae391a05so21187555ad.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 06:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793629496; x=1794234296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+OZmX8JIf6s1L/six0W6PN/I70GBs5nxLKcsSZPbfs=;
        b=CGf/6wG6HrD1nXTDASXQnD+Py+nvrQdLruMml935MtSVqpMqRekdAtsa7uvlpxZ+1Y
         8PHql+xyG69D71HRpkBzDGG5fWIdtyh83VaBKeRDHQqDRbIMw1W6jETA+ycr+1N50SaE
         sV6L1+suxdiHPijgn/jedn0+KcMZKBsSrZ86BrY6kT+IL3OZMVjQG51injm1sd5TWBD3
         DG6ig865RrIhZVMIrBJaF0ezJoOIHwFPWp+a7JT0kIheHXHPYBl7feIs/uW/PvSoqtoH
         Dm1xZLNWah8+S11qO3EaH7JKiUMea+mDtohV+IcGLvEsYitZ42oM+jZLos4QqKFhOs34
         heJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629496; x=1794234296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e+OZmX8JIf6s1L/six0W6PN/I70GBs5nxLKcsSZPbfs=;
        b=2LmAhMSBjT7RipAV4lhVHBviuJikXRwaIpJjJ9X8GFontMZggmLhvP38IgH6Lgu4pq
         Hmf23W9/FoCBL+f4xgbH3Qi9PA1BTQSvXP2uL7tcoJHTEDt+cAlHV9hXgSkjBFVmTMRD
         mq3WqT7T8AIXHrEr+oOxDMheb7jkRV1En/lp3ezSVDGjaNs5wK0/sC1g9gD+mATzyC7b
         FmnNyClaMozugc4FHgg/8qKhM8UXoimrpI00BxTE9c21MUnVtmLot46ZkaRS5KK6AJyO
         iBz6rsOigm1FpueQl5YHJoD+W5Q8a3Sh/18Eub8lGqeE1+6qS6QbYuSRFNlqsHaIAVry
         3AIg==
X-Forwarded-Encrypted: i=1; AKwUvBw0xsvgoWZmcmUMq+CpXVKbJA61jTT+MjGRJ5YKJWjE1uvBeRygTOiwtHxw2MJB0AWLFnPlkMVMJ0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z83g3LqQnicljn5nAVaOoYyEBZD7Gv2q2sN5FanBjon6rpijIOZ
	2jL+RFiVYlOuKraLGW3blrCodASqNJuItFq6+R1ME08rS3d2qPdehuDT
X-Gm-Gg: AYBFou38TJpx8TYZwP9pLVeAlYO2k6Rrg0Ca/WAQrhNuA+3q97HSKaFaG0BBvGN+i84
	icozdKtPjN4Xaao0lLgMVXPNXq6g7Wwa2VVPbdASpeAMZThxwIhm3aAldUZ4reN6lwm5aUZo7Qy
	QZ/NQ/6WymNjdj+Lb0//qCJPgX/MZBm+yzcQNOZ2B3fuV2xjbKUpjZx+QKjUJY/E/RsPEzqxPVo
	RcabyxlBA8wAmyqtzJkwYJ3cvDMh0FIA50vdde+PQIbDU5zVTRH56q0W2Dg0fIYcm17paiPPfhS
	3KDjNCidH+ACfeC+30aDWG6zMC4YMOMAUqvnKduMhMHn3TC7zsyAD1GtU5YUTkgsru5fAacrtrP
	qU14baxE9yoqesJAYw0kMxIQCHySdPvNPbvMMIw0+Fzz391R3JMem8Np6HY44Gau5DQgJRpAlDX
	q+WB/F9U7wZlUFx3ptA6OuBN3drho2i8DcDjKxgMwhPtWnlhuYrLmAHh9n4axrBLItipei3vn9o
	JhagMslHrh1m+xnCQATm8Lsfa+OJGFrYTnkvG+qzeL0b/1duG5PeoO95jxCKgmJqEL3Hb71LrAh
	Hq98o4c4nN5oSon5aNFOYXb9eKEjOf80aNaJEopxLy5rHD8Pyh0eSuDvlA==
X-Received: by 2002:a17:903:1a4e:b0:2df:9e44:32f1 with SMTP id d9443c01a7336-2eb364e1741mr69092915ad.29.1793629495462;
        Mon, 02 Nov 2026 06:24:55 -0800 (PST)
Received: from localhost ([2.27.148.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39298543sm28720445ad.60.2026.11.02.06.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:24:54 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Han Gao <rabenda.cn@gmail.com>,
	gaohan@iscas.ac.cn,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	Drew Fustini <fustini@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 14/18] riscv: dts: zhihe: add A210 UARTs
Date: Mon,  2 Nov 2026 22:24:46 +0800
Message-ID: <20261102142448.3784989-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ef0957a4ceaf754989f8a7132cb6276686244d24.camel@pengutronix.de>
References: 
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 22 Oct 2026 11:22:51 +0200 Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Do, 2026-10-22 at 03:53 +0800, Han Gao via B4 Relay wrote:
> > From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> > 
> > Add the ten A210 UARTs with their clocks, resets and interrupts, using
> > the snps,dw-apb-uart compatible.
> > 
> > Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> > Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  arch/riscv/boot/dts/zhihe/a210.dtsi | 150 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 150 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/zhihe/a210.dtsi b/arch/riscv/boot/dts/zhihe/a210.dtsi
> > index bbad51a3edb0..a07b67d10633 100644
> > --- a/arch/riscv/boot/dts/zhihe/a210.dtsi
> > +++ b/arch/riscv/boot/dts/zhihe/a210.dtsi
> > @@ -405,6 +405,66 @@ rst_peri1: reset-controller@2010400 {
> >  			#reset-cells = <1>;
> >  		};
> >  
> > +		uart0: serial@2014000 {
> > +			compatible = "snps,dw-apb-uart";
> 
> Prepend a vendor compatible if you need two resets, similar to
> "starfive,jh7100-uart"?

Thanks, agreed. The RFC that replaced this series adds a
"zhihe,a210-uart" compatible and lists both resets.

> 
> > +			reg = <0x0 0x02014000 0x0 0x400>;
> > +			clocks = <&clk_peri PERI1_UART0_SCLK_EN>,
> > +				 <&clk_peri PERI1_UART0_PCLK_EN>;
> > +			clock-names = "baudclk", "apb_pclk";
> > +			interrupt-parent = <&intc>;
> > +			interrupts = <321 IRQ_TYPE_LEVEL_HIGH>;
> > +			reg-io-width = <4>;
> > +			reg-shift = <2>;
> > +			resets = <&rst_peri1 PERI1_UART0_PRST>;
> 
> This looks to me like it should be
> 
> 			resets = <&rst_peri1 PERI1_UART0_PRST>,
> 				 <&rst_peri1 PERI1_UART0_S_RST>;
> 
> instead.
> 
> regards
> Philipp
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Sent using hkml (https://github.com/sjp38/hackermail)
