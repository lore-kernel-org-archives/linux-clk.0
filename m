Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9790970823
	for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 07:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758870624; cv=none; b=JBEOUXS2t4t5mvGjYa50RNLHadflBhTUsNHXciY0sREF3go0Z0FmO1haMOs20odEWi+Ujcm+0S1hH9fySTIuk4ZTO3n8VXqC0ocZAe6TGO4RBShkgFP1PE4KMoSoFwfDBNLr0HRJFTBBYuFyx7rYWXEWwrFebFJGyrTR14tJaaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758870624; c=relaxed/simple;
	bh=D+j2midnj5XhlRaG/sZPBMFQQa8uf6pQf07CI3bna/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gYgYJJZUSmzoNXgHmhUJeZicu3Re36bluE6n2BdXmxbmHrMu6njD6okxVsuA6rna+vqNDT9zT4fR9MtOoRtJWU6AeY8rWi5VBjR+byZPHIG5og60doA/+jzHsh+p5bz+imhLnbGFjrpMaiQvel4xFGAuaOk1q/HFoEmYxqInQs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=afqjk0LF; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="afqjk0LF"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-329e1c8e079so1691319a91.2
        for <linux-clk@vger.kernel.org>; Fri, 26 Sep 2025 00:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758870622; x=1759475422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s13NkV03DI482hdQXj9L0MMsFVndYTlMMN96sJroDYc=;
        b=afqjk0LFuqW2u2tagwb8PMvH6vfmx049Te5b3zYl1o1PmgXKGVuFsON706/KS1vJku
         Dvj3nHRn7XTy9zpYAEDV26u3Kqs3LqRNMQfB/UzfuWi8IwJnhcH6w5gcQprf66sbKeyh
         Tn36u0u+d88RCZeVvIfWpciGPZowORerV3IMv3Bfz9h5fN3Wmb8g/uUJpVkDORb90ziv
         dkktWvKcfmiH10uIuTSyTVMj7MaMlMcsDttJK4alTo+jiW7+CxNi8ivMF1nKGZ6uq6xM
         ktP27ZyknShfpx/aHC6lwR43am9BoYtUetPBRxnUlXTICUzG9Frs7sfBbJagBIhRpqC5
         N7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758870622; x=1759475422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s13NkV03DI482hdQXj9L0MMsFVndYTlMMN96sJroDYc=;
        b=MXfmQbeCkxLodSHiPrqeqABHBjIoFgy2w3cs4O+y9mzws8yB6Xpm4mXWekKX01iqe/
         0xzKbTkBegG5ljXZdVEQyUztmBfIm6MNP8M760NNHt3eZnAE72TwQ43qQSCPnKuYP3V8
         CiC0NiEWacm08oQVFSIsqs/MPUrPPbis2f17ygksGCg9ugtwKR6xnRvsS3f5RXjbQLAY
         awpQw+LchOZeH2GYLQBd4tWTuSmBwUNkK4zwVzFzuK2kualtpbMvMABqZyukK3T4lB/7
         HCE6Psn6f3JoKHERZO8pUrPA+8ggF4vRaRE23MvrFY04SOs8dvnVDjVcUd2ReLU1UZFC
         f82A==
X-Forwarded-Encrypted: i=1; AJvYcCVbacfkT/aJu7cRccP2ev4es88y19fXAwOnevAeK2F+9HCi0Ljvon5iL6OA0rd+ETET7BmFNKc26nk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSfPm+kJ8j5abg9O/TLKcjd/G42G19A+mIv4mDryU8zROQUbcT
	8lLvczbwb9YFB6/3/L5IAzqLUfGO8i/fHR2ZWosWf3smz4ntmtl8O7abkhC2hibmCyXnAorXUru
	rauKk2/m050lmbouZwrgpv8MrO1CBqBvqGnFZG6gVtQ==
X-Gm-Gg: ASbGncsmBXJ2LM28vFQ7PZKmUOrf0VuK85MG41mczd8MDohyG0ikAac6C4hr2QERIp7
	nGbiAa37kMAmlWJ2rSoF3rKCPQT+7HLnoqru85hpZmcx1HG5l/TUKU/d3Ke+PBR+sPqs/n306w3
	uDduzlHc3QimYbTEbYmshdfd929HQhsjpeMsIYmMjnFuYBT8fBYXDmC8A5EIgmDJfET2KbhnJRq
	ByS+X0Xs1tc8wUQc+++Z/aGYfn5ZR9A1ZcnBGH+HOUQ9ng5Rog+ztOlGGXDoVNp7Ec+kj4kLiZ0
	l1RsaG/nu59ytDqofxeYOQ6DbVi4dtGdlv5x3rL6I7ZBHhaPSRewk9SUqTybS2O3Dl7EVZ5XPGV
	nZSTWA5apUpc=
X-Google-Smtp-Source: AGHT+IHdhWdKIldo725yaRcV2e2TLmZiar6ZsNJtmau9dPpPlg1CcGz3EfIZ8rNp7OmbymTgF9AsP6YdfPARBysWd9Y=
X-Received: by 2002:a17:90b:4b84:b0:32e:528c:60ee with SMTP id
 98e67ed59e1d1-3342a2c9fdemr6991714a91.24.1758870621944; Fri, 26 Sep 2025
 00:10:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818040920.272664-1-apatel@ventanamicro.com>
 <20250818040920.272664-11-apatel@ventanamicro.com> <823e11f3-ba2b-f0ec-8bb9-0785c89e8234@kernel.org>
In-Reply-To: <823e11f3-ba2b-f0ec-8bb9-0785c89e8234@kernel.org>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Fri, 26 Sep 2025 12:39:45 +0530
X-Gm-Features: AS18NWApnm5B16UUErYVg9jHjWgczHP7q0_6OfFV3wst3Z5Hkpf8DICkPiw9CaE
Message-ID: <CA+Oz1=aXDTvC+qnL5zA-Lhcy1X=okbHCYtfDMzQ=7k6GufCJHw@mail.gmail.com>
Subject: Re: [PATCH v10 10/24] clk: Add clock driver for the RISC-V RPMI clock
 service group
To: Paul Walmsley <pjw@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, 
	Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, 
	linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, 
	linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
	Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 7:37=E2=80=AFAM Paul Walmsley <pjw@kernel.org> wrot=
e:
>
> a few minor comments:
>
> > +
> > +#define rpmi_clkrate_u64(__hi, __lo) (((u64)(__hi) << 32) | (u32)(__lo=
))
>
> I'd prefer to see code like this implemented as static inline functions,
> rather than macros.
>
> > +static int rpmi_clk_get_attrs(u32 clkid, struct rpmi_clk *rpmi_clk)
> > +{
>
> [ ... ]
> > +
> > +     format =3D le32_to_cpu(resp->flags) & 3U;
>
> And similarly, it's best to pull these kinds of magic numbers up into
> appropriately-named macros, to help reviewers understand your intention.
>
> Since we're pretty close to the merge window opening, and the changes are
> minor, I've gone ahead and just made these two changes in the patch, and
> queued it for v6.18 (hopefully).  But maybe you can keep them in mind for
> next time.
>

Hi Paul, sure, thanks for handling this.

Thanks
Rahul
