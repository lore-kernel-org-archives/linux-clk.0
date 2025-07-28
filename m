Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A547186284
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 09:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753694381; cv=none; b=hqPWSd7e57u5lohhSBOqwdCVJhY2PcPAGT8bIQEaQLDPGSIpplMkBV2vc716TIKkyDOlWnyVDkk/Pj2S4dAB/1Ncdip3lj9nAPcDUnAXUe6OWNRzDQ1u5lH15ghG/zIYJ3/AEmYUWCRJSXBw2lpijJ/uihtj2V/oWRtNsqhJOfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753694381; c=relaxed/simple;
	bh=EM/dwFq1yZlzHICX5jZbmxa1S4pmrfRrhSn472Stlgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iCBFM5jsP5LXqo1IfV8rT0P71GWkaI4M5gaXXTzzGLHKYjppCbsf8viohZ45ek+f0RL5vroF4mZG8jomKuyQoHuXn9SgQYWkjKTMyKfjMKFMxWNx7Q6wIM6GoPl+w9n1nFhfWVCgW2TtZKa+A4GBiKnhNkhkAn6abS053y0Vbnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=HRfloTkh; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="HRfloTkh"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55b72633aaeso89951e87.1
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 02:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753694376; x=1754299176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5Wfr6IDv5PxwXwO5SalQp0PsuBKS/k9qem5YR1Q0PY=;
        b=HRfloTkh4g3PC0IRR5nBPYEUCItNL97qQtAbO7ZLMpifPsMfWvlcHWaBHyaatTfRsj
         jSBjf84GF3pi31/f+Ujyj8nAHjF1GX+ZAA4iNPVC5p3SkXXONA9NS46ka/rLAJAuvbDg
         xOkhj4ZNBmrv3MRTs8Oq3IX8sCz3NrEKeasECeEWoIzeZ0er0zHpZeq1D9eAlPRhU6AN
         PiCwuvw8Eqt61T9lM3CmnB0v1OqMQhDHeQj/ft1HRwFa7JElpcuNoqV+M5LLD1QRuXb1
         gPTiUQddv/yIIsonilbvKZ+K/6TgNc0eKyil/S7SRVaIUTFNJcZ/+DrpqnQau5WZWovy
         W5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753694376; x=1754299176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5Wfr6IDv5PxwXwO5SalQp0PsuBKS/k9qem5YR1Q0PY=;
        b=imY2WVYhng6GR8eedMiEVgvBQHLoaK5SnfM5tsEdGjfpQKcaY4KJUzu/xuV3Z2g1Q3
         wWMebsb7jZ9MpEB3h0uQgvIptOVEPPYwSjKn6XXGYRY8xBHyINTRAiYRASOnYwvrLzSU
         7xAVEml317F1gXjcevzZVBV8zl9GugYOH0HlG+XniYO3TKWedv+3OUV++MOGwrd1033i
         5mpnyzCsDXM8J2Fst8Cy6RcXivbrkPwTjFRpW6QYsCS8H0PurhKLsoDLbI7HWITcNeTl
         UZZUUc+RGSYrvoNI+sGaAZkSs5asEs9kLP4VdmccPYRLCF45Bbr5PEgrkSRg0K6XlIgg
         jEnA==
X-Forwarded-Encrypted: i=1; AJvYcCU/vKK5M7c5DaY0WNrDGX263SyQL1GR/71acl/GDz9c8ibMv2KcZte0xP/MD6ou6/+PaQTZX9qg1gs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsM2ceC+oHDzjzPFNc/BvE3byO4t5Zs3ATLtlmSKqVN5QRuOJp
	ZhQyg7cPSdsTirIQkzzyFY61LRyMlua9/nzzoCcSLseulMTspemqN9OPwHXS6PnjmaaCH/CLayV
	odIDnS2PMCIgYReYeZBumisO2/1lrnswcQBAYmsQcog==
X-Gm-Gg: ASbGncv2Xan0x8Bt5IbVGkRi5AyOcKFCZjcmtH0TzoJSqIlRQcAEZKpUjSN/xN4OB9u
	Nvg4y01EOHYB2qSGA4UreArD35cKG98IG6BqunmBuueHvpl70HzmIXZy8VA85XNGp7mpw1DgobG
	G3zZdjdQ9EKJVv/Xi0F9RA2AnFoWVnAz/l6EieisYrLIq+I3UtGTRtFx82dfzMSi0huT/pbnVAN
	MdQGXA=
X-Google-Smtp-Source: AGHT+IE+L8kojs9dsw3C6rCUb7FSCgckOs2Jkf9bqhFZnlMh8FPpWpEIQvGXcm9tMwdZmOjR+SBZh5eXeLrR0pntl+w=
X-Received: by 2002:ac2:51d2:0:b0:55b:5ad8:186d with SMTP id
 2adb3069b0e04-55b5f4bbd79mr2861674e87.37.1753694376329; Mon, 28 Jul 2025
 02:19:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
 <20250704070356.1683992-9-apatel@ventanamicro.com> <175341132347.3513.7184287611040628050@lazor>
 <CAK9=C2UDV3xCpKxZmT4NsRvN=hCcQrcx0fr-QFD2fuOrqmXmHA@mail.gmail.com> <175359739515.3513.8664828076215459722@lazor>
In-Reply-To: <175359739515.3513.8664828076215459722@lazor>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 28 Jul 2025 14:49:23 +0530
X-Gm-Features: Ac12FXzCp3IP9jRK5qLB49tEzZkZnvv77-g8d-wAPrlIzxfNVRivXQcgZVb8d84
Message-ID: <CAK9=C2WRVHZ4FdoW0fKRRFg6qAC5asn03dHj_NXkMKfBXKkXdA@mail.gmail.com>
Subject: Re: [PATCH v8 08/24] dt-bindings: clock: Add RPMI clock service
 message proxy bindings
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-acp <i@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 27, 2025 at 11:53=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wr=
ote:
>
> Quoting Anup Patel (2025-07-25 09:16:12)
> > On Fri, Jul 25, 2025 at 8:12=E2=80=AFAM Stephen Boyd <sboyd@kernel.org>=
 wrote:
> > >
> > > Quoting Anup Patel (2025-07-04 00:03:40)
> > > > Add device tree bindings for the RPMI clock service group based
> > > > message proxy implemented by the SBI implementation (machine mode
> > > > firmware or hypervisor).
> > > >
> > > > The RPMI clock service group is defined by the RISC-V platform
> > > > management interface (RPMI) specification.
> > > >
> > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > [...]
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    clock-controller {
> > >
> > > Maybe the name should be 'clock-service' then? I don't understand SBI=
 so
> > > not sure why this is in DT to begin with. Is something consuming this
> > > node? Or a driver is binding to it?
> >
> > SBI is a syscall style interface between SBI implementation (aka
> > M-mode firmware or hypervisor) and supervisor software (aka
> > Linux kernel).
> >
> > We have DT based drivers in OpenSBI (M-mode firmware). This
> > binding allows Clock message proxy driver to be probed on the
> > OpenSBI side. The clock message proxy driver allows Linux
> > RPMI clock driver to send RPMI messages via OpenSBI as
> > proxy thereby sharing the RPMI transport between OpenSBI
> > and Linux kernel.
>
> Let me try to clarify my confusion. A 'clock-controller' node without a
> '#clock-cells' property is confusing.

Ahh, I see your point. The node name need not be 'clock-controller'
since the node is for a firmware driver which provides MPXY channel
to supervisor software (aka Linux kernel).

>
> It's not providing clks? The SBI firmware is not discoverable? Do you
> have a pointer to the DTS for this node and the clock controller node in
> the next patch? I'd like to understand why this is named a clock
> controller when it doesn't provide clks.

The firmware driver is not providing clks. Also, the SBI firmware and
various SBI extensions are indeed discoverable from supervisor software.

On the Linux side, we have two DT nodes:
1) One DT node for the SBI MPXY based mailbox-controller
    (Refer, https://lore.kernel.org/all/20250704070356.1683992-3-apatel@ven=
tanamicro.com/)
2) Second DT node for the clock-controller based on the
    RPMI clock service group.
    (Refer, https://lore.kernel.org/all/20250704070356.1683992-10-apatel@ve=
ntanamicro.com/)

Regards,
Anup
