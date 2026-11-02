Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629394;
	b=4tAIDQByJwlvK2/2yvkYVOhIMHbVdEdAuQ2/U+diArvcjvZcgpRNznhSn9+Ov4QrfiWx
	 Uz7J5mBi8q6mtFslUvSu3tm8LS8t2xLDj/bGjkg6k5Vn5QaWORzw2dFvYBjD9RbMqEfKY
	 jZnSWUBbmvYzgXAUX+iGfww9Zvzb3Q0rmXV1esyXkSJWmt8WQtn3wWhNzpDBLc+jC3S41
	 Nx8uazqYwHjvvb0HHUXqBEvDCP96tJByNY0NmTFUUwUmHsSq8zA31wgiG5zOb8oa9pjVG
	 tsFpPrBsYTHNQmkpBjRYNbFUbChqyaiYNR1gFojvvzg7a3VTO/NAswQsbYcuO0HtH1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3gGF/z34qzW/NHH0K5bqzl6N3TvYgzHsW7PQwuk+Eb8=;
	b=vxkC8Na5WkJAsUF31HRWBTNuufvGQn/oSfGqCQnAR5BQnxx+whj19m1OvRYdHKSTVc8l
	 bfGaQzRFCUOdZ8v/B7K9G927YOtz6xa0UmPBK3uUN6IysZ4sNB295PoiQ4qpJIM85XGZC
	 dobAQwlGwkX+/xHcjgvbEVDmDz5j7YYV/Q7U9LYhwP0+sp3J9Nq/C31b1Avay1bdPtdDd
	 DKi4hwemozr7PsIXbM6G9gs1QDhesmrFQSql9aFs3GQ4iHcTvXpeF+luZcCPZ901StNR7
	 yiQgBXEsDhKk7DEC3QKLl/bu1CaOcBXWUyE4mmsuiU5I5xOIL0f4BPsiwPD4ZmLA1tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0FsI8JKf;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D372760A3808
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 14:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D372760A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0FsI8JKf
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9d7791b00so24156695ad.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 06:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793629393; x=1794234193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gGF/z34qzW/NHH0K5bqzl6N3TvYgzHsW7PQwuk+Eb8=;
        b=0FsI8JKfdwQmudyzyfmTQVlPByzYNYayujLicTy5q2pnwA3kjZGMJapOQ6MTLzgTey
         sv2u3Pk+lLXkuI+OC+/J3DjbHekDnHy+c5G087tA2Le9rNkjzfaYr2cQe7PNC7prgD4v
         F+9K4c2P73XReb2VxRYXhhQhkKpKws04CBX4cZ5d0fhkSlP4nDszMoFcdsGkg0xPddpj
         FAEJZ6ff2ipqfgiKbYhKpnZI7et2OEME8aCu3hutxuVw+Fj2dc2lwsCvNoRtZpmnwGCh
         LwR0fZsw6bzXxE1UxIDLU2FvH7e6K5z679/E5PBYLQgS3k3Zkp0liWioZKsz4vJIC5wd
         FcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629393; x=1794234193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gGF/z34qzW/NHH0K5bqzl6N3TvYgzHsW7PQwuk+Eb8=;
        b=gaP8FkwqD2Ps0W33ccxuJQDddk0V37Hbw9xn5Lz1z0rtRviHeAHsvBsV16zUQ7T4aU
         MkZiL7m2ZDcKs7hvhnq6hxAT6BeWv56QfbafUWD/v7zmCgFINnIczdZlKU9ycTh8YkGQ
         9jX39ZgEggiOfa10y/StvN8sXUZq0vSxRwixDggkaTHrfwPPDZEvK6bNSLY5kxDdkHUf
         lzjGvI0tnbLGucsp7hBIb21WbVfNO7T5eM2pJFYC5mH1nYDnSascu2bOiPbSbnobQTsx
         v6fy/sPQrGQgnEQwMOvABfhCkMHiCVsg2Axt4Vzk/Awsxjr3DDtTpkGkCvkL2DbVlpYL
         QdQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxG6QH0scCodkwPcosMiasywcrRAWYpCeag72b+VBLulIj07Ea5iBlth5SnBprXtnjFZGIpqfMoBIA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tWKy17qwEmj/bGFOwUizDhgeyOtZvq2SzRGIINey0zySlTHHk
	DMiZ6bsCom/b9zUjr/5ihqUi9pMf7kupQhm2AHyyMBT8I1ouM53TQT/g
X-Gm-Gg: AYBFou3KfeSPHTQrPdqbrzWnhp7BXfEp+gg13nWjYZEsmmhquQid7S9S3GpJI8EudhL
	vqDj7RYUhoU8YretU4FhRtIo12iM/c/il0JgaZ0rGoUlUeYlKVVWLek5rjDlFhJED9HWv9Yv83G
	YMF4Eg1bKpjjQxnngCLXJSbtbdTcqyD1Zu+dbPN9gk2m03E4pRy9DsR/mElW5LEr5OfhTso5S1N
	fj1CO6Db7nbMvPdc5LF/ofFvWPDjKTIcXOVZO6rWVU6UwjNzvKxm6mucEWak+iQqxH0ldLh4Twl
	Cul4xR2M7dUyeay7PAX4AkRw0qa18TsbDjiRKiuocbB0ngsEKyhQ7T7qhHPwsBT/aGFa1d4dnDb
	S9mLL7rFbUivD7eV5CEZm4JkcG1QjvDKnRvMhzDIBUbEfq0yGvhSi1j1V5dattPymGuVLZkb85y
	XoJVjnJrIpausnGN79sgEvk54+AHTobLSgIfpjWiO7cLxqWhvWIFIIS5rnVx2mr1+9s4G8hsBqI
	u9c1kX31Uv55PSFxH7BjDGdB8VPsNbLbKMIdpGLgXzCxZiX1+RiqrlVOZisyYYb5NEaBvrOT/qf
	dcqAAhwgMc3wkHIxpNgIXaNex2z8T6ZehC0ylNY8Lz8TNqoSBmK2jetdqw==
X-Received: by 2002:a17:902:f70c:b0:2e9:5829:9b3b with SMTP id d9443c01a7336-2eb364b55b9mr86204895ad.35.1793629392936;
        Mon, 02 Nov 2026 06:23:12 -0800 (PST)
Received: from localhost ([2.27.148.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392486d5sm29700245ad.29.2026.11.02.06.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:23:10 -0800 (PST)
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
Subject: Re: [PATCH 17/18] riscv: defconfig: enable A210 support
Date: Mon,  2 Nov 2026 22:22:53 +0800
Message-ID: <20261102142300.3784622-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022-concrete-rebound-593001f1ac18@spud>
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

On Thu, 22 Oct 2026 19:50:51 +0100 Conor Dooley <conor@kernel.org> wrote:

> On Thu, Oct 22, 2026 at 03:53:37AM +0800, Han Gao via B4 Relay wrote:
> > From: Han Gao <gaohan@iscas.ac.cn>
> > 
> > Enable A210 platform drivers and reserve ten 8250 UART ports.
> > 
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  arch/riscv/configs/defconfig | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 04ae305d5511..b9b3bca12089 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=y
> >  CONFIG_ARCH_SUNXI=y
> >  CONFIG_ARCH_TENSTORRENT=y
> >  CONFIG_ARCH_THEAD=y
> > +CONFIG_ARCH_ZHIHE=y
> >  CONFIG_ARCH_ULTRARISC=y
> >  CONFIG_ARCH_VIRT=y
> >  CONFIG_ARCH_CANAAN=y
> > @@ -149,6 +150,8 @@ CONFIG_KEYBOARD_GPIO=y
> >  CONFIG_KEYBOARD_SUN4I_LRADC=m
> >  CONFIG_SERIAL_8250=y
> >  CONFIG_SERIAL_8250_CONSOLE=y
> > +CONFIG_SERIAL_8250_NR_UARTS=10
> > +CONFIG_SERIAL_8250_RUNTIME_UARTS=10
> 
> Why are these options needed?

The A210 has 10 UARTs and the TH1520 has 6. With the default of 4,
UARTs beyond the 4th don't get a fixed ttyS index and end up in
whatever slot is free. Raising both to 10 keeps the index stable.

> 
> >  CONFIG_SERIAL_8250_DW=y
> >  CONFIG_SERIAL_OF_PLATFORM=y
> >  CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
> > @@ -167,6 +170,7 @@ CONFIG_SPI_PL022=m
> >  CONFIG_SPI_SIFIVE=y
> >  CONFIG_SPI_SUN6I=y
> >  # CONFIG_PTP_1588_CLOCK is not set
> > +CONFIG_PINCTRL_A210=y
> >  CONFIG_PINCTRL_TH1520=y
> >  CONFIG_PINCTRL_SOPHGO_CV1800B=y
> >  CONFIG_PINCTRL_SOPHGO_CV1812H=y
> > 
> > -- 
> > 2.55.0
> > 
> > 
> 

Sent using hkml (https://github.com/sjp38/hackermail)
