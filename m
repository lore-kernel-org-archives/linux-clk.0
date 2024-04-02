Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD26B5820E;
	Tue,  2 Apr 2024 09:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712050491; cv=none; b=I4iT99D4U8eOFw8Q1rwzQTNidTgk5NtVPODPcWVfuLbcq4XkcfOqNLvxagvi1T+QSmwRHskThkuvdlhCRZKGjGblNbURpjeg3VbcvmBBnPWgr/XRiedH5mTTx4IdyL1vmyzi84f9R5Npc5JIspKKBpO40YwFlQ1wrynDcyEZ0rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712050491; c=relaxed/simple;
	bh=4XL2bE/ZBItBnM0McLZwLtl3bXKFRvUBQsDJxc7sOV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lBGqeX3rF/2sLjIan2ocK+bZaXk9gRAUlNinCOtr1yv4zx4FN8bVg6ZTD4be0g+7d58nFog3kwWtzO6wKaXBAe+7vehKs2g+uXBFtyzOV8ygccRdoHK+IAd2SjYBxwp1YDqDLQROYcKfpi08r2/ru8f8EsxtmIEZCvlY0NCUvpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpwjqSQo; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpwjqSQo"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-61518d33293so7321897b3.2;
        Tue, 02 Apr 2024 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712050489; x=1712655289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zd3wwsxTYAdMtHPaY6ukdB/o/fdbIv+daSWf1vfb1pU=;
        b=gpwjqSQoOnUtL7IiucbZI79qbnL0wrEIp69bB35ZObozwlJZpi+oVZCQ7PGlMIYcTM
         i9oZaOJrvXx4akO4Nl+DZIRXQ/2rgdsDJLC6LF3Q7TDg/VDw4Es/lWrtX2pqISs8sEo4
         FqCQhibwfDfoxxa6QrZXou/jIyueazH9D04DMkZw3c+eTexFWgdcTHqvvWhK7aMME+0/
         7bU5y3+2AZLGDIGmSIrPkdVG0SdiDKNy3UGR4lk6aD4s5ZiOJXpjhZgc9PV/DgRwko7i
         aeQA8FD7A52EwCGPONnuIEq30SNdGuXeHXYpAVi3eA7Rqorv3pW4Ha/puNakaVLmmg41
         zjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712050489; x=1712655289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zd3wwsxTYAdMtHPaY6ukdB/o/fdbIv+daSWf1vfb1pU=;
        b=Y0mFCe8o/4TQFZ4UoZEcDZtIJpJv1CAIb1WYNOeLrXTuVcjs2a/SLrKD2xeCOguNvY
         OD6/r2AAVNFEVH7G0RYcLjlYmt+/FQWEfSlLj87C8oHEKD9aA/lozyQ4pxmuwfPqu65o
         XPh2or1LEhkwVBcVhFL7NFoj0kJmXPahy7/v4smzeQItuGw5Mqa9PxIaDh6FvqiDJjDF
         kKHLrKkM/PgB+z+RRn6P0KecdVP0S01PSUPxDO8k3987NfWH32h3zsYagLwdbWXCtZP1
         tcWQSTHL45Xy/pm5fwq5JH91iK2rlCV8Q2qwhYLbZqjAWeC7CaB1pXBTE6mgezX5aJuP
         Th4w==
X-Forwarded-Encrypted: i=1; AJvYcCVOraVv/gCNlNZwF5nYNvRMkR8K2e/4h4tw4YCaHUqd3z861XzG3M2HANP1GBLaaTamf57TCScitjz+aJeyrGdzMIdylKajKIdeaB0fBGtapH5LBfCLpEsVzV/M7SUPoAP/JBVXLw==
X-Gm-Message-State: AOJu0YxVBTHqVqtykPRc8+Ph4XX++VT2YuqP+9gep2N+6mVL/KUS1KsW
	0INPvWiGOk4j8gWQ3RhNMBWsKPMZNNf6oN1ZVyAgsMropzPloorvdIhZpzKEPYt7Z7lUVRW8mna
	mVsJUFYRvcuOKVqPWHhn1X2AEgdo=
X-Google-Smtp-Source: AGHT+IE3mcw3w/VAtRJReMwDR5zazV1WA2M7j2g292EI7+c58Tu68X6RwZ8jrt1YmWFEZ1LjY9B9qQyGfTb2Q1Nsq2g=
X-Received: by 2002:a0d:dd93:0:b0:60c:d24d:f962 with SMTP id
 g141-20020a0ddd93000000b0060cd24df962mr11637593ywe.42.1712050488913; Tue, 02
 Apr 2024 02:34:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1711504700.git.zhoubinbin@loongson.cn> <6c4eb239cbde62e7e1a8c647c945e128a0b78b2b.1711504700.git.zhoubinbin@loongson.cn>
 <CAAhV-H5L=ff8k4a5PA7vaD5W8QRu3zWQa=-99bq4MsjUz3UQJQ@mail.gmail.com>
In-Reply-To: <CAAhV-H5L=ff8k4a5PA7vaD5W8QRu3zWQa=-99bq4MsjUz3UQJQ@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 2 Apr 2024 15:34:37 +0600
Message-ID: <CAMpQs4LDhE0=jWHGf9H+pvm+MVQPgX=UCJvvEb=hexc_tSWA0A@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: add Loongson-2K expand clock index
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, loongson-kernel@lists.loongnix.cn, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 2, 2024 at 2:58=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org> =
wrote:
>
> Hi, Binbin,
>
> On Mon, Apr 1, 2024 at 4:24=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.c=
n> wrote:
> >
> > In the new Loongson-2K family of SoCs, more clock indexes are needed,
> > such as clock gates.
> > The patch adds these clock indexes
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  include/dt-bindings/clock/loongson,ls2k-clk.h | 56 ++++++++++++-------
> >  1 file changed, 37 insertions(+), 19 deletions(-)
> >
> > diff --git a/include/dt-bindings/clock/loongson,ls2k-clk.h b/include/dt=
-bindings/clock/loongson,ls2k-clk.h
> > index 3bc4dfc193c2..4e6811eca8c6 100644
> > --- a/include/dt-bindings/clock/loongson,ls2k-clk.h
> > +++ b/include/dt-bindings/clock/loongson,ls2k-clk.h
> > @@ -7,24 +7,42 @@
> >  #ifndef __DT_BINDINGS_CLOCK_LOONGSON2_H
> >  #define __DT_BINDINGS_CLOCK_LOONGSON2_H
> >
> > -#define LOONGSON2_REF_100M                             0
> > -#define LOONGSON2_NODE_PLL                             1
> > -#define LOONGSON2_DDR_PLL                              2
> > -#define LOONGSON2_DC_PLL                               3
> > -#define LOONGSON2_PIX0_PLL                             4
> > -#define LOONGSON2_PIX1_PLL                             5
> > -#define LOONGSON2_NODE_CLK                             6
> > -#define LOONGSON2_HDA_CLK                              7
> > -#define LOONGSON2_GPU_CLK                              8
> > -#define LOONGSON2_DDR_CLK                              9
> > -#define LOONGSON2_GMAC_CLK                             10
> > -#define LOONGSON2_DC_CLK                               11
> > -#define LOONGSON2_APB_CLK                              12
> > -#define LOONGSON2_USB_CLK                              13
> > -#define LOONGSON2_SATA_CLK                             14
> > -#define LOONGSON2_PIX0_CLK                             15
> > -#define LOONGSON2_PIX1_CLK                             16
> > -#define LOONGSON2_BOOT_CLK                             17
> > -#define LOONGSON2_CLK_END                              18
> > +#define LOONGSON2_REF_100M     0
> > +#define LOONGSON2_NODE_PLL     1
> > +#define LOONGSON2_DDR_PLL      2
> > +#define LOONGSON2_DC_PLL       3
> > +#define LOONGSON2_PIX0_PLL     4
> > +#define LOONGSON2_PIX1_PLL     5
> > +#define LOONGSON2_NODE_CLK     6
> > +#define LOONGSON2_HDA_CLK      7
> > +#define LOONGSON2_GPU_CLK      8
> > +#define LOONGSON2_DDR_CLK      9
> > +#define LOONGSON2_GMAC_CLK     10
> > +#define LOONGSON2_DC_CLK       11
> > +#define LOONGSON2_APB_CLK      12
> > +#define LOONGSON2_USB_CLK      13
> > +#define LOONGSON2_SATA_CLK     14
> > +#define LOONGSON2_PIX0_CLK     15
> > +#define LOONGSON2_PIX1_CLK     16
> > +#define LOONGSON2_BOOT_CLK     17
> > +
> > +/* Loongson-2K2000 */
> This line should be removed, because the below definition is not
> specific to Loongson-2K2000.

Yes, it was my mistake, I forgot to drop it.
I will fix it in the next version.

Thanks.
Binbin
>
> Huacai
>
> > +#define LOONGSON2_OUT0_GATE    18
> > +#define LOONGSON2_GMAC_GATE    19
> > +#define LOONGSON2_RIO_GATE     20
> > +#define LOONGSON2_DC_GATE      21
> > +#define LOONGSON2_GPU_GATE     22
> > +#define LOONGSON2_DDR_GATE     23
> > +#define LOONGSON2_HDA_GATE     24
> > +#define LOONGSON2_NODE_GATE    25
> > +#define LOONGSON2_EMMC_GATE    26
> > +#define LOONGSON2_PIX0_GATE    27
> > +#define LOONGSON2_PIX1_GATE    28
> > +#define LOONGSON2_OUT0_CLK     29
> > +#define LOONGSON2_RIO_CLK      30
> > +#define LOONGSON2_EMMC_CLK     31
> > +#define LOONGSON2_DES_CLK      32
> > +#define LOONGSON2_I2S_CLK      33
> > +#define LOONGSON2_MISC_CLK     34
> >
> >  #endif
> > --
> > 2.43.0
> >
