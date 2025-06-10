Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5947F25771
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 06:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749535791; cv=none; b=sI8L5H8NOoOTbUdsUgje8b3Nf03JKCFfPQ8RQyIj8neKE33jbBPPpPtVBMT0z7tRUQ1LH0+CO5FvLxME+vksMjHCJbwcDnC6YxsOa7/gPTRMFjr4gYTiMCSayt/fBxNRZwlIjtDtSq9rIAyF1W1PbQ6ndLaYp8sobS++mMXQUCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749535791; c=relaxed/simple;
	bh=deL0AORLTTGY5BQlHNdX7DRyFTNvXJD5bCgwvsWjOdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxJWwAwPKM6EgTyIChMerasTr0dypIsTXKh0/WfNcoS3zvXqHOVkxe1M9kcrwrsQe8jzlnMqRdSXMntJcBh23135CPES+b51NQe4yMpHVeUYfk4tTrn1uXpOn3c65aK/blqOLLEPtrNxrMmY1LumtumrkTRXq1arIRnnkGIlRM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=asStmQI+; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="asStmQI+"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5533303070cso5293624e87.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Jun 2025 23:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749535787; x=1750140587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INX7+gU0Hnih0cIeBLJvT7vRQcQo+5vRos0OigVcuPk=;
        b=asStmQI+gWGAHT6yjv5ieGkbDd/Z3pWnsiNvGwdGPxz2Snt1RJEWmMUpk0nbjcU3Yl
         t5ZIul5ov8rVh2T6ew+trJc8WG5rBckLQlI44dU1k9JZgE2Ihn3bW3AwnDCRInONnl0A
         +SLiLlbZlTzXKdrJGAqtXU4PNT5ymKYJaDkLqRoUNbQy428fcjdmg9rGQ1XXDBBEC7NB
         f615GW4jYOkyjVFclgZwYxoqFQDxD/As7mw5GvMiNryi8zSN9QwbGmR4YCyDo+aIVkrB
         sWwVNOBWGOAjJ7oH8W1f/LiLCr1xmbC5DvZdXjccovXPwWyRP6FyVqtLyj01d2IV/q5x
         oB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749535787; x=1750140587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INX7+gU0Hnih0cIeBLJvT7vRQcQo+5vRos0OigVcuPk=;
        b=iRwJF3ICZY9GF5Xx0h21hdRlYeTavSYcf7hA3dwMqa4O3e0UkDOJpuTx2cjsBtQpIM
         OxldXYpGztDXyIxq17TlWB9SvbI8aae+0/V/vkXSUgGB8g4twH/ptpl8yeztwvUskQs3
         NXtVu9GXpBuAsvSieMSoO13t+RP8i8I2WygnIeTF4tP06eFsO2MrZcXX2vkZi0nsUEfa
         z+YnUkU+SOaJHNyTKbfFNDecW/evNgMR1PnLlWUiux9I4c3Jk3ByYffH2AS79XJ4GVq3
         6+Ukj6nkEO+3ukmC8wtdLr/4zoKpNFxvRtJNsVGzpeG4wD/YZoinnjJdvY3K20ltauBP
         uARA==
X-Forwarded-Encrypted: i=1; AJvYcCUUXmBv8XWV6sBrQxLgN02hLQ1t3KmNi5lo5i2EoHuW9zkTDY+FMog7CZ13Sv8tfji/vSKoXQuNxug=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAf//9H/NRORhSrjMycc6XVWF9TmMKe09noOAyt5GhWaygdv3a
	awuXwlNr7BCYZPdob1HKGdT7gp3EcssjzQFM2KbArfo2d2f4B63I22Fk7ZJ1gHcBUi56+NyxxeP
	CsQPT84w9yK88bSfH70MXRbdpy9ahWgnbnDhrQ6elPQ==
X-Gm-Gg: ASbGnctZrUBbig8gw83U9ZQFvJ4pawmsTUQSU68TjBLso1Z1fXiUsSH58Oj/zGl/9/v
	9vK0b95eMGz/5u4ERkeUh9A6x0eMPmGr518xLdNlZb9BGZix4w+0LNEBU1+V+SWuFG2fcxvPhcN
	yjH3+vaC+h5+/0i/QSMcOreyqV7Wyn11AfpWE6/YI6Ibo0
X-Google-Smtp-Source: AGHT+IGkcoUE3xlnQMYl1o7j1hnkz7cT7TnZBE2tt+E9xu1wPE99h1iWmlxxu85+hyVu269VB3sueRiisqT0j70UOq8=
X-Received: by 2002:a05:6512:1387:b0:553:2bf2:e30b with SMTP id
 2adb3069b0e04-55366be6735mr3903750e87.18.1749535787322; Mon, 09 Jun 2025
 23:09:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-12-apatel@ventanamicro.com> <b355406d-c79f-4d81-bc36-a8889b54aa03@linux.dev>
In-Reply-To: <b355406d-c79f-4d81-bc36-a8889b54aa03@linux.dev>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 10 Jun 2025 11:39:35 +0530
X-Gm-Features: AX0GCFt-V6DR7WSCvS_15t_rjYO_PCMDY_MmyOZ2P-IZ0Vijw-NrT_XPrxpCJ90
Message-ID: <CAK9=C2V7E5dmJdMffadXOo839945XNRT_mMKcVfT7bTDz5fBZA@mail.gmail.com>
Subject: Re: [PATCH v4 11/23] dt-bindings: Add RPMI system MSI message proxy bindings
To: Atish Patra <atish.patra@linux.dev>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 7, 2025 at 4:29=E2=80=AFAM Atish Patra <atish.patra@linux.dev> =
wrote:
>
>
> On 5/25/25 1:46 AM, Anup Patel wrote:
> > Add device tree bindings for the RPMI system MSI service group
> > based message proxy implemented by the SBI implementation (machine
> > mode firmware or hypervisor).
> >
> > The RPMI system MSI service group is defined by the RISC-V
> > platform management interface (RPMI) specification.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >   .../riscv,rpmi-mpxy-system-msi.yaml           | 67 ++++++++++++++++++=
+
> >   1 file changed, 67 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/interrupt-contro=
ller/riscv,rpmi-mpxy-system-msi.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/ris=
cv,rpmi-mpxy-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-=
controller/riscv,rpmi-mpxy-system-msi.yaml
> > new file mode 100644
> > index 000000000000..26dd13731350
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi=
-mpxy-system-msi.yaml
> > @@ -0,0 +1,67 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/riscv,rpmi-mpx=
y-system-msi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RISC-V RPMI system MSI service group based message proxy
> > +
> > +maintainers:
> > +  - Anup Patel <anup@brainfault.org>
> > +
> > +description: |
> > +  The RISC-V Platform Management Interface (RPMI) [1] defines a
> > +  messaging protocol which is modular and extensible. The supervisor
> > +  software can send/receive RPMI messages via SBI MPXY extension [2]
> > +  or some dedicated supervisor-mode RPMI transport.
> > +
> > +  The RPMI specification [1] defines system MSI service group which
> > +  allow application processors to receive MSIs upon system events
> > +  such as P2A doorbell, graceful shutdown/reboot request, CPU hotplug
> > +  event, memory hotplug event, etc from the platform microcontroller.
> > +  The SBI implementation machine mode firmware or hypervisor) can
> nit:
> The SBI implementation in machine mode

Actually there should be a "(" just before "machine mode ...". I will
update in the next revision.

> > +  implement an SBI MPXY channel to allow RPMI system MSI service
> > +  group access to the supervisor software.
> > +
> > +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +  References
> > +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +  [1] RISC-V Platform Management Interface (RPMI)
> > +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> > +
> > +  [2] RISC-V Supervisor Binary Interface (SBI)
> > +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> > +
> nit: Refer the latest frozen version of the spec ?

Actually, we should specify the spec version number in the text
and avoid a specific link because the link of the final ratified version
will be different.

> > +properties:
> > +  compatible:
> > +    description:
> > +      Intended for use by the SBI implementation.
> > +    const: riscv,rpmi-mpxy-system-msi
> > +
> > +  mboxes:
> > +    maxItems: 1
> > +    description:
> > +      Mailbox channel of the underlying RPMI transport.
> > +
> > +  riscv,sbi-mpxy-channel-id:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The SBI MPXY channel id to be used for providing RPMI access to
> > +      the supervisor software.
> > +
> > +required:
> > +  - compatible
> > +  - mboxes
> > +  - riscv,sbi-mpxy-channel-id
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    interrupt-controller {
> > +        compatible =3D "riscv,rpmi-mpxy-system-msi";
> > +        mboxes =3D <&rpmi_shmem_mbox 0x2>;
> > +        riscv,sbi-mpxy-channel-id =3D <0x2000>;
> > +    };
> > +...
>
> Otherwise, lgtm.
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
>

Regards,
Anup
