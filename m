Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629820;
	b=s6H+Hnufg2A6jzfdewKMmkAHlQBPWAKRqpsDqz4xjA2NIockiK4xDeF4CiObfxgqpRhn
	 3S8alBsKKSdKKJsucmBzpLvO6CwNITKVpq2SkZDDtGY5Ngzo/u1A8nxpHGaMSlhVB2cgp
	 f09CJcsYGfZkY5S3BzCEXWnkgXo2m5ISZ4gmVzllvE9B2XSCN/XoK8DKUJX0X5HCprU8L
	 q7/jf85PvjsrqQ+igpKecCKp5NIIW9ULLyOfn4ugeKIPCsojyv0SMIDg1lkYUjJzYVNgb
	 pa21XYcEPIBBGgBI50p/LQhoEfWh9wKA797jU46MLZuRnd/EsMHkBSwWvQwVufTezzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gts2WqsGwLc0uD/7GkoBlKKwzjNqrANh5XxTu7k3RAs=;
	b=evKs/IZfQssproekapRqAdsb0raKvrHT3r40e+AkRlZHCy/QY1HE8BHaP1qlua1hvvBZ
	 kZ7FKvMsfirqR/ClkTDI0Kqo+jT5H0KKMbH6mU+HU9GA5hm6/NwgjJddeqKKOgz2cTBvQ
	 F8mTE5ZVc8l5Jn9IyqO1xPz3DqnsindOZpon4veiTOJE83aK5T1VH17vjpOo9CFLHX/Y5
	 Qrz58IpJYuP5cwmhxwlsgY+6gMS+UH8rRF7RQZtxrrlX94JELKv87AU/QLZl4eHRghixD
	 e4nZVeou3bugOMN7WAsKXVmH5JiS26UZxgZGX7XWrWWs84jaW8elISDK5r3FgFPvZ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AhFrqsnC;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393DE60716D4
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 14:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 393DE60716D4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AhFrqsnC
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a05da1cc1fso1236706b3a.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 06:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793629819; x=1794234619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gts2WqsGwLc0uD/7GkoBlKKwzjNqrANh5XxTu7k3RAs=;
        b=AhFrqsnC3Ik6bM6eJ1D4rU8ykzPEqJVxX4+qAnGC4zFCpQiY7s2u5DjqiykTPZdl1e
         aK2gEa+6RL+uNAj8OPB5jOCsyFsbfzXmpkVK8QSeMIhVIvRG2OyGOrV5OIQJDVkWfRYb
         6flsQq7/3cm04SJf51HSMqfu9g89z7aRfaKIE5AssHjiUBr9URgi/yYXUhvcgyNDx80E
         uSBQh4szvw0fwr88zRHWGGBA5nfq4eIVoJVueSARMjyv589t0//dPKiByBx1M1EaUF+4
         Yi7Mi2pQSB+FAKrG5mdWZgJDEhQyi3uBiqDHNxo3NM0rrCWEYm2W52z8rRhSJnwRDs00
         lGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629819; x=1794234619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gts2WqsGwLc0uD/7GkoBlKKwzjNqrANh5XxTu7k3RAs=;
        b=I9qhJ6zHMIm0Sqv8rMaLhrhQHEbvLAicjXmlRwmGceGHo/+8Spm+mdeQAY2Ay9fyuD
         L6D0sbFVK7MZkizjhEWkfRwp2hi3oGGOh7/EeWs+DUr+B0hX9EmhX9XkK2yJL0JF0SpN
         Ri2k/HqaJUsFcJG/HFHoGqnhjM5HQmEWKLksgfv/X+NNvuKWFdrdVEow5gGLRsPp6wl2
         kBKzvSEecCF0bRdLXkSYgRVBagi6q7RX1SAt2eeo+jb/74fjzwBE8DFiMmcF/v/xz9ez
         tHlYA105nwZgze5gdAoQ92ysSBfzufH5gjfsfdmqKsYG/6/f0UP4jPCWfUYf2nDNTihO
         ypMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRv5Gzr1z8/onCr7ObmAy1Msrvtl8duGuljHkArYNwp7rlAwQ3o6O+usf7qMCQHL68togiMGBODo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cK0N35BjakBYWLEVimKo5vC2gs4awCwvSTYbAW6iCcZXeJAml
	1zYLNtyKKrmKv9140SkNagthJePXaFypZ0RmGwSs3dDGXpWbx+FiLEFh
X-Gm-Gg: AYBFou0JA56Ks+7liZQvTtCnM9X4JxCzfwSECWKlfC58T/fgkhutRVk7k6cZIXIp2t7
	L02ZefhN4jlOvBtKY8kzRpXpzR2TBDgeZxlLh8dUjg20ty+S+u2eJmIYMyahvFXT+sPpXFWSnX6
	AVl8HqhMkmZyN567bJQPOGM5fYS+KLFEvnVpt/dncy09fjbFjLqii0qqUUvqz9R5x6NjUKVFBpn
	aUpIVpjpUbW/WvOkktaUuSFCj14XsX6htHxMCzAnNMRavbcBox8dYDt3XyYpZVreG39yA2T300U
	ymYIZWXq5SLDKDxuomDte3ErvnFfmuBtYpMW72nnuC2WG5zrIIxNGxv/pRenSUMFC33AzXlDs+l
	jaigonnzCJGS/0b0HjIBnkhEIzCCtbEJCdXqfMtT7WUiHLgVLeoFIBipFFNLFZeB5g22/73G2SS
	sgP1mWBP67aBdJ9DeBdtaNGOjrbsmPgjwoPTWHrBaqKd9yOj0LPopNMNid8KmJF5fNfUtWQZYhJ
	F4FFLx1pNQIoOzlH6WiUKXJmTYgfkPNRkohBJNPTBD3ai1kpuKXpNGe5Dqkln9TmDHerEBedkBs
	p28OLYlTPDl5Ya5A2jubOMTaoBDtntenAqWf0bWfFdx3mzkXJVVY7yy2Ew==
X-Received: by 2002:a05:6a00:3908:b0:898:22b4:c8c8 with SMTP id d2e1a72fcca58-8a9ba9f783dmr7803008b3a.2.1793629818400;
        Mon, 02 Nov 2026 06:30:18 -0800 (PST)
Received: from localhost ([2.27.148.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad77fcb8dsm2219095b3a.1.2026.11.02.06.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:30:17 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	gaohan@iscas.ac.cn,
	Drew Fustini <fustini@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Radu Rendec <radu@rendec.net>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>
Subject: Re: [PATCH 13/18] riscv: dts: zhihe: add A210 core support
Date: Mon,  2 Nov 2026 22:30:09 +0800
Message-ID: <20261102143010.3785824-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022-radiation-ivory-c8f9f9c66b7f@spud>
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

On Thu, 22 Oct 2026 19:48:36 +0100 Conor Dooley <conor@kernel.org> wrote:

> On Thu, Oct 22, 2026 at 03:53:33AM +0800, Han Gao via B4 Relay wrote:
> > +	soc {
> > +		compatible = "simple-bus";
> > +		ranges;
> > +		#address-cells = <2>;
> > +		dma-noncoherent;
> > +		#size-cells = <2>;
> > +
> > +		clk: clock-controller@260000 {
> > +			compatible = "zhihe,a210-clk";
> > +			reg = <0x0 0x00260000 0x0 0x1000>,
> > +			      <0x0 0x00250000 0x0 0x1000>,
> > +			      <0x0 0x10141600 0x0 0x100>,
> > +			      <0x0 0x10141400 0x0 0x100>,
> > +			      <0x0 0x04810000 0x0 0x1000>,
> > +			      <0x0 0x05810000 0x0 0x1000>,
> > +			      <0x0 0x04900000 0x0 0x1000>,
> > +			      <0x0 0x20250000 0x0 0x1000>,
> > +			      <0x0 0x10140000 0x0 0xe00>;
> 
> This looks very much like an incorrect modelling of the device.
> Most of these should be individual devices, and those labeled "sysreg"
> probably should be syscons as they likely contain multiple functions,
> not just clocks?
> 
> > +			reg-names = "pll-wrap", "top-crg", "cpu-ss-clk-sysreg",
> > +				    "cpu-ss-cpu-pll", "ddr0-sysreg",
> > +				    "ddr1-sysreg", "slc-dual-sysreg",
> > +				    "top-crg-t", "cpu-ss-ccu";
> > +			#clock-cells = <1>;
> > +			clocks = <&osc_32k>, <&osc_24m>, <&rc_24m>;
> > +			clock-names = "osc-32k", "osc-24m", "rc-24m";
> > +		};
> > +
> > +		clk_peri: clock-controller@300200 {
> > +			compatible = "zhihe,a210-peri-clk";
> > +			reg = <0x0 0x00300200 0x0 0x4>,
> > +			      <0x0 0x02010200 0x0 0x8>,
> > +			      <0x0 0x08400200 0x0 0x8>,
> > +			      <0x0 0x00540200 0x0 0x4>,
> > +			      <0x0 0x27420200 0x0 0x200>;
> 
> Same here, particularly things that are only a single word wide...
> 
> > +			reg-names = "peri0-sysreg", "peri1-sysreg",
> > +				    "peri2-sysreg", "peri3-sysreg", "tee-crg";
> > +			#clock-cells = <1>;
> > +		};
> 
> > +		clk_aon: clock-controller@30844000 {
> > +			compatible = "zhihe,a210-aon-clk";
> > +			reg = <0 0x30844000 0 0x1c>;
> 
> 0x1c is also suspiciously narrow, but believable. Is there a register
> map for this device available somewhere (ideally in english, but I
> suppose machine translation will do a sufficient job) so that I can try
> to understand how this device should be modelled?

Thanks. There is no public register map, unfortunately. In the next
version the E902 firmware will take over these blocks, and Linux will
get clocks and resets through SCMI instead, so they will no longer be
described in the DT.

> 
> Thanks,
> Conor.
> 
> > +			#clock-cells = <1>;
> > +			clocks = <&aon_110m>, <&osc_24m>, <&aon_rc>, <&osc_32k>;
> > +			clock-names = "high", "osc", "rc", "rtc";
> > +		};
> 

Sent using hkml (https://github.com/sjp38/hackermail)
