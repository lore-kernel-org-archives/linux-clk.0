Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F563A1DB
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 05:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750224260; cv=none; b=T4xOoMMocBW3/PLuALT9uld2SVc08J5ZyDFrloVKzJBflHjqoULPtMOVZRF4G0REMs7UUfU1uOPCmiYKQZEFxqbC8bhaGJFcrDeRIXGRIJWW0IPB3GoIFtP2RilSPDHAXWUuKAEIdWVc3iWre3ezcnJsJOKNvzIjgVpSkjLsO+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750224260; c=relaxed/simple;
	bh=CjftUrHfuTNnLmkXf91akeBADK/18bO2WwdPuXaL3V8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4A+iZ2HJ8yBfSZJIQC95oWKRJBhoAaPTOxTQ7iiUeibTHUPNx0w8kZnqZMplQHwzHzpFYE/WvXSlWByx1vH6mycRKNKkjokFPKWYPbVWKOLaj9ZEU3q3QV4XTVUJ8Xdc/ONF8iJuEjXBjrOG/A9bZxtdMddvaiayYCE5I1eKis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=WJXMWXOH; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="WJXMWXOH"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553b544e7b4so5378108e87.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Jun 2025 22:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750224255; x=1750829055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Z4TSLN8JZPIMvLRhF9VLnkxWZBX3eFV9ERu7o6ArDg=;
        b=WJXMWXOHm/s4/nSrJXVlhkMhDNznxmdjWA2qdr59YKj5gsW8m96PrRbxTCnN/xH5qU
         r7BO5sl5xBYIwElh1Wjk6ABH0hKnP37PKJEqrTxLbFpXw6P3v9PCHCqWE7oo+Pj0de6V
         vPyIu0+zZllELc2w3aFHaxr2t3ddp0iYO0vXbfCWBI3gURRZv7QTbWFT9owlc7NrB368
         nggVODsa2loHMzLRrns72tsNiPzhkTxxwJIeXpQX0/CzqP+yJounHlOcAgIA0CdIe3AE
         hc3shf8r//Og+dI+yvlhpzbtQtd/Spzc078HjPTvi+mLe2zCeL1u2MyNx6tRLcsMbyGE
         iS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750224255; x=1750829055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Z4TSLN8JZPIMvLRhF9VLnkxWZBX3eFV9ERu7o6ArDg=;
        b=S8Q7DAKJo/0+du/+2r0ZoOqZ1u6eTSkcpnurN8d48hadqDQGwsblOBCmTe9+J2eaSU
         q0VooPqP/xVnBC2Nx1t3Ty9zo4Gcw9poSTN6i8Mcaa1V4o2Wimj+8DXFTP/fIXAhd9/K
         HkOyWHMHoTyp5RzUsLQ+/0ySMrkc9pJ9B3V/JhPlH6HdRL4hPCNJyCkAuAaqqYec2HWq
         EcaBfjqYWBb/1+cAzcYpYarE8/guUuzwhGdhaNldvS9JI9zFyaSNGlHRoz6TYUxvBpvR
         UvmT2TeWHqR/qv+nfk5zdOzK+scxlt4VpFbIVZpAJinVlvYTsLRQEpnzcBHKGU7JjJ9L
         0R4A==
X-Forwarded-Encrypted: i=1; AJvYcCVs4e9iwxqmhOzwu7s5jRh7BmTZL164cAe6R/r/nlWQrfBCj8jOJQb77EJhsIrHmPWSQ8i0fh/EPFo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk6t14/1sLaiQwTKz6/fAIpUSmNY/TBVv4qUOnnCGxbHYVzrvR
	sI/hh3ZuLM58gBBj51PERmw84g0f2pIyEfrFW3QBakL4okyXdfHbtZZvgIf2+1PSbtt09L9/HjS
	eyxcbgZI9o1gU3NNct0d7HyoTW6SOevVW/DTih2Rc2A==
X-Gm-Gg: ASbGncuN//92AVYdnHyPoYpRe5xLlZ0eYGGgeD81FpfJE+gMoGLIp1v39ik7eWIGmG1
	KhEygwCGHaj81uHQmgqEjiDpxUFCitFZ4prgaUgHSSEV69eCxrsrvnHXvo+z4nawsAicD0nZ9WZ
	tEYeGwtmtMYF4FjIZSU2sdvt1L1xVF3oQcEkndKAPK2A==
X-Google-Smtp-Source: AGHT+IFwL9G1DHBfI/lVr74bMBkL3ROv8/Gb0OUH3lB+sHfgk3+LXmQwxwY2JVd0OZNae9e8E+jgY8I9Gk7tR0VNm6E=
X-Received: by 2002:a05:6512:3b0f:b0:553:abbb:c530 with SMTP id
 2adb3069b0e04-553b6f49986mr4356712e87.56.1750224255114; Tue, 17 Jun 2025
 22:24:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-13-apatel@ventanamicro.com> <87ldpvirl2.ffs@tglx>
In-Reply-To: <87ldpvirl2.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 18 Jun 2025 10:54:02 +0530
X-Gm-Features: AX0GCFuqAwxb7NkJo6ROc36kRxrpGi8zqYIq4k-XKsi8PzPM1EcP4vkMM19V2qo
Message-ID: <CAK9=C2UCpth4GQ_q2OMwndBeZKf9e_bsoHXaKJW0cNzTWggNUg@mail.gmail.com>
Subject: Re: [PATCH v5 12/23] irqchip: Add driver for the RPMI system MSI
 service group
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 9:03=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Wed, Jun 11 2025 at 11:52, Anup Patel wrote:
> > +     ret =3D rpmi_sysmsi_set_msi_target(priv, hwirq, msg);
> > +     if (ret) {
> > +             dev_warn(priv->dev, "Failed to set target for hwirq %lu (=
error %d)\n",
> > +                      hwirq, ret);
>
> Just let stick it out. You have 100 characters ...

Okay, I will update.

>
> > +     }
> > +}
>
> Other than that:
>
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
>
> under the assumption that this goes all through either the RISC-V or the
> mailbox tree.
>

IMO, this series should go through the RISC-V tree but I am fine
with the mailbox tree as well.

Best Regards,
Anup
