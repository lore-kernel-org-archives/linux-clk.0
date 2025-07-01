Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58214158DAC
	for <linux-clk@vger.kernel.org>; Tue,  1 Jul 2025 07:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751353394; cv=none; b=F01hNAO6M+7EZALl7ZHM7KRw+dcMSeUJeePvm32k4m1laf2gELx/gEc/kj4n/c9g2EbyORxF2c2aDY2nnWfVKOTKiE+Q5VM2kLss5DhUDigtFpVlPxTpbYpmDpaVEYSIKSWgeqbzTdkYOK5V7P8xUDzSxyZud/puqBXt00qMAhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751353394; c=relaxed/simple;
	bh=+EC0oMLVpnRfdUFzMGpfa0FgwGNFEt+oba3/joF/fnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pwsqd5ov5ikPAgB03SInHbRnlqSoYbhJNW5K9qnIV6cQMmm7QznGva2a64YC4qS1acdnbSl7mvG3ZIhmm4LQe2aCZnmQhZv8aSXZfE6B270rzwHJrgfvQn31NMzb+Z0OoCfAZgozFE6bsRy4gMi4pKZdfncgVbeJWS6Ye0FiKR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=HyIOv9Zg; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="HyIOv9Zg"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso6205769e87.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 00:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751353390; x=1751958190; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIU5NNrDBXiK6ci+KkmpULxlihLtb8DLKHWe5DIQOM0=;
        b=HyIOv9ZgCkwfijbz65r3487WW3wYSVV04iIhdLBXzt3HFvb/78AeXw2UAXTf0iDVUs
         IL/UBt10BtgGHAN0znmWoQuKBnLbr0d1oevRyil9rMw3Iu50MfpkPpnhnOewETmJsK/0
         3DbULhAPhhFJcrKBZeo4b7j/yThflbjHmDox5PMUzx1mAdbo1+ouW1NXfNkDusqlcyXw
         xFtn4Z4Vi7ZwRgK2LY1igd+5t7H5SHCGI2gCOb+wqwQMJY1KQ9Z42rjzEocygsrjUL+m
         Mk8ZXX1KjeCjZ84BZBOZhFEtPNgDQKaPwTyXh8b4Ap+bL9jsAxKIz1M4UuhsAY9v2XKM
         Oh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751353390; x=1751958190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIU5NNrDBXiK6ci+KkmpULxlihLtb8DLKHWe5DIQOM0=;
        b=pWme0fgwbfGholKMztCBIsAe50xUTeGb12qBCrfLQ4lQFwJyL9Gxn6226d/zuMcas+
         28tw17exN9LQ0EKWaihKNi2lmdXkSYzuN9JeFfoNMHVpnQjNZhoFiFxSLyJHN4T94blO
         GR6W41KagoAShNuU3Wc6vPqyQDAUDRHjOqeafbwlnxIUrJhjZcsX6An9r0lDhIsIjvnm
         pRf9gJIC8uCpgsuncFhGk0JyDSxcHepIazNanSAKul+Ng0/adggo4oftsMunbEDfc3fC
         YvISAo4SKAnS9eiav+jRzp0Jlj2BCVzPHywC6XGMh7lBWneaVfR25JTCHHXTbm7POuro
         LiNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLQMSCTRiOufKPUaqF2MOb8x8YWf8Z3mHc6mDcjCjyLq9MwhDSqic5DFy1riSNrig7L1NblefnPcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBAxmr9c16HjgsNKA9UzP/fkvi8yfVTAzPYAhNe5/K1PQELRux
	44d46czMnvD+Pp5FWWqzv64u2j59FhPjtlqlA7JvHzxRvHJoaAwENObkpS5y2fmpHIPFNi2PpYc
	tCFZMWUdOwAmyw723aN6cmZIs0bHqRBy+XQ/oHHsqsg==
X-Gm-Gg: ASbGncsMw4OSwFDBs07YSOkRRnXce2oXCP24xJoTCrQuWxK+x0f3m/zjOEOYl89E3mI
	VlOKEFlbd+ahjcgO3Ez3MUEGWEKavQWLrh3ZkngoAUzrJork2dEojyHLmVlTTEN0zqtW6KFkWYV
	CMpUnx0oGkJ9iluwQ/f8nxkrRdGwIJQDx68g5sStmknxlimDebDOYQeZs=
X-Google-Smtp-Source: AGHT+IG2hO6nzI2GLaUpV//IQuh9V9bSS/bokBUiGKqfApG5Zg7ceEjqZCY0yleadUsPuqLCZd4pLgQndJnpi85hp6w=
X-Received: by 2002:a05:6512:220d:b0:554:f76a:baaf with SMTP id
 2adb3069b0e04-5550b9ee1c0mr5526546e87.56.1751353390315; Tue, 01 Jul 2025
 00:03:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-7-apatel@ventanamicro.com> <aFkVQTSCSkvBhzgC@smile.fi.intel.com>
In-Reply-To: <aFkVQTSCSkvBhzgC@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 1 Jul 2025 12:32:57 +0530
X-Gm-Features: Ac12FXyj6dh_QMGxazJoimu3YO2qWqoVT9ukdJkMwkLRVDb7ZkWPIfUsIhiEvxA
Message-ID: <CAK9=C2Wh3ha9bV_JhGqJRhBSWheXqRMmBN-M0x2-ffZyFni_cw@mail.gmail.com>
Subject: Re: [PATCH v6 06/23] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
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

On Mon, Jun 23, 2025 at 2:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 18, 2025 at 05:43:41PM +0530, Anup Patel wrote:
> > Add a mailbox controller driver for the new SBI message proxy extension
> > which is part of the SBI v3.0 specification.
>
> ...
>
> > +static void mpxy_mbox_remove(struct platform_device *pdev)
> > +{
> > +     struct mpxy_mbox *mbox =3D platform_get_drvdata(pdev);
>
> > +     if (mbox->msi_count)
>
> I'm still not convinced we need this check _here_.
> Can it be rather a separate patch to add it inside
> the below call?

IMHO, improving platform_device_msi_free_irqs_all() and its
users should be a separate series.

>
> > +             platform_device_msi_free_irqs_all(mbox->dev);
> > +}
>
> ...
>
> > +static const struct of_device_id mpxy_mbox_of_match[] =3D {
> > +     {.compatible =3D "riscv,sbi-mpxy-mbox", },
>
> Missing space and unneeded inner comma.

Okay, I will update.

>
> > +     {}
> > +};
>
> ...
>
> > --- a/include/linux/byteorder/generic.h
> > +++ b/include/linux/byteorder/generic.h
>
> This is good change, but deserves to be in a separate patch.
> I will Ack/Review it as soon as it appears to be so.
>

I generally prefer introduction and usage of a new API in the
same patch since it provides better context. I don't mind creating
separate patch so I will update in the next revision.

Regards,
Anup
