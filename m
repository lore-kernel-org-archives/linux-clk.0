Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B5312E1D2
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 08:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719219565; cv=none; b=qGA9Wf5T933J8fa0N/U/SHYAV9UcZZZo1LFjSLQ3Rpx4cYoh0tA2RXzPQGEpUgBppen2igypyIMIbQKHwHRlWSWKomSd3OIzAgjxBkM1+rMt4uDFch25RBnIoCQV1FRFwzvZi8KD+GYqn36QYDxicJTgGl3jkBEGFWLJrCjFP4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719219565; c=relaxed/simple;
	bh=hdsmDqmNgGZQgfRkYZ6dfoEvN0ahnTXGnc7hhzCQrmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9VPaHodaOp9chrPwp8Pq9vA10HsnQNSCvsunGWBin1STaviZtQP3Y9Stq7OP1J/QSQcIa3LTkSlxUQfBLEb21elqnHc7gQ8gj+o0YxIB5PveNegD/XZvjasGKl3ZsCP8c0qj9r+++qfacuAXY/F6tmZWd6kDrIhd9XhpBIPtPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=MzkgpNdA; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="MzkgpNdA"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-79a3f1d007fso380366385a.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 01:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719219563; x=1719824363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdsmDqmNgGZQgfRkYZ6dfoEvN0ahnTXGnc7hhzCQrmg=;
        b=MzkgpNdA+GFVqSzcGBdQV5+67hLPJQv//dxUXjRiCZwxk0Pbb6cUCEqgy4VTTNiygg
         HGPX4tQv3bEkRG4s0S7lzRevYKJJqlsUjgFUQ2kXYqGa3nS5FxwDcKzyO2P5IP7QiFyh
         hAxtVFyl4A11u3NhIa++NuzEn86CRqcT9K1Fbofl6/XvmFKQPityb2U0NEOr3pqr1Nay
         bbeRukitLOAAgtaHOMtkJahG1QwhzuzBY4FtUUqiv2yfhBr03ojzwz/GB1i7gzAdxtIN
         Xng3ZSw3PsyDedFYdaWwYsn1ASWr/KLdTRIxDOytqaOxM8K8rLBdvIE3YJuQVWWhVj2P
         dp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719219563; x=1719824363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdsmDqmNgGZQgfRkYZ6dfoEvN0ahnTXGnc7hhzCQrmg=;
        b=oG1whDzhJBqPVETRoMCR1Rl4DdfucqQmPduAzRR72sTYs8Z1Ynuc558FxB7nVAgzBh
         N/a9j/bsroOYCo7/CLec+7tLR9sNjcnPmEPryrIk+McfmYyXinQVxvX+HfXTbpvfBsTn
         Xg4+/7j0UpHGXaxU/54L4HvhHnhHqIfgRDt54ti7cRpvTuBAfIfTTghscsp41+J19V47
         YZWTiuUQmvkgpMPAODiv4v8A/AwkWNjrQDL/mIhq/EWybdvWqXxV8/aDQD/Z4pGC0JHU
         74bboQKb9IK+uVoDwhDhNDZTGQCEKr/r3mwf3HJ0aAvjVSzpz2qRuvLT0Iv52lCsl3cI
         Nelw==
X-Forwarded-Encrypted: i=1; AJvYcCWqjzhIwk8d5FbwxNo+Tf4bU1lWTAN/dzCLrVFsorW/PCdQW+z17qggR49t/PSCabAJENlhK2HSzmyRTlBS7NRUP5ZMnfp70XTz
X-Gm-Message-State: AOJu0YzqqXQVI3EtJgvIdxy2pgVsmFEcUMhtUYDfNzI2z08aoUZTqh4Q
	cRz4u20nlp60gjRzF3yJkwEyPNVjLxyIWq3mUdMzwd7MjCwe1vu0+OYYz0i+yfLTb0frkhXws4+
	3InZUmUzWDA+lv3O0mEasq0m3rWeL1iHoVXEl1g==
X-Google-Smtp-Source: AGHT+IHJdukmHTX31XZGqN8Ya5O7xqbZeOSn9ad1olNhKCpFsHEHdPHP6m4H5tAF93YKuWVFl5Mnqdf3Ba8kIeeVBLc=
X-Received: by 2002:a05:6214:4a45:b0:6b4:ff32:8287 with SMTP id
 6a1803df08f44-6b5409be0b9mr37950676d6.22.1719219562855; Mon, 24 Jun 2024
 01:59:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-7-piotr.wojtaszczyk@timesys.com> <ZnkGcwd8M1QFfmxl@matsya>
In-Reply-To: <ZnkGcwd8M1QFfmxl@matsya>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Mon, 24 Jun 2024 10:59:11 +0200
Message-ID: <CAG+cZ06R5P1g+1Pk3gbQ6Yod0mBM41dFTgvnBWg61HZFUtmx-w@mail.gmail.com>
Subject: Re: [Patch v4 06/10] dmaengine: Add dma router for pl08x in LPC32XX SoC
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "J.M.B. Downing" <jonathan.downing@nautel.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Yangtao Li <frank.li@vivo.com>, Arnd Bergmann <arnd@arndb.de>, Li Zetao <lizetao1@huawei.com>, 
	Chancel Liu <chancel.liu@nxp.com>, Michael Ellerman <mpe@ellerman.id.au>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mtd@lists.infradead.org, Markus Elfring <Markus.Elfring@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 7:39=E2=80=AFAM Vinod Koul <vkoul@kernel.org> wrote=
:
> Any reason why dmaengine parts cant be sent separately, why are they
> clubbed together, I dont see any obvious dependencies...

The I2S driver depends on the dmaengine parts

> On 20-06-24, 19:56, Piotr Wojtaszczyk wrote:
> > LPC32XX connects few of its peripherals to pl08x DMA thru a multiplexer=
,
> > this driver allows to route a signal request line thru the multiplexer =
for
> > given peripheral.
>
> What is the difference b/w this and lpc18xx driver, why not reuse that
> one?

The lpc18xx used the same dma peripheral (pl08x) but the request signal
multiplexer around pl08x is completely different - there are no common part=
s.

--=20
Piotr Wojtaszczyk
Timesys
