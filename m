Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0389316F8E5
	for <linux-clk@vger.kernel.org>; Sun,  4 May 2025 10:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746355458; cv=none; b=jmGglDH2RotZSuUnw3P5byqSMAug7iMxiasQB4vS23w4zqkz/5ZDnUhcNd7bCO7sqOa/2haZmClxZEmmt4QU+DqdxiG6cqx0pb/Sxyd+h5XFqjlGpgzp5Jl3vaDxDdEZ9W594d3HVp2D1SiPUSxw5wsd1svDks69J5NhJnD1PkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746355458; c=relaxed/simple;
	bh=1GN+Micp4zpCGLBwbkaEjWxQVmou+C+HrKvxY1i/GTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UHxZMzn7ZnjOTUD0pLrRSkNXmLL+FAOuWWdZcPBF4OkBdzPE7ZRG2C2DCGqR32t6lKb1g8Nd2liCkvGsF+kw4UqOPKusbUIm7eAM7HW1mdApvMP1/a1MUTt0PjtuhBKDfl2U5rkQbblpY1bT4OmSAIMLmAuBwYzvhNsf/qZIDNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=NnzGCEqW; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="NnzGCEqW"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30eef9ce7feso33373201fa.0
        for <linux-clk@vger.kernel.org>; Sun, 04 May 2025 03:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746355454; x=1746960254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwsnsoUoKOvxrLI+SxTbGd5obMmAtQRgaYtvdq+wb5Q=;
        b=NnzGCEqWMmpIg6ctn03ucodKQESF1BjMdMgLgbk2+5yHhh0EV5E2628FfPe6NvYIaM
         cSpAmuZYyetpAcBXQRiKzjXbgNGQ6hs4yDtV3JOyvGb36teZcxp2SmZYbSX2sAVra7Du
         QAvcpQmIjOVVhyZQSRqN20dnrn+I9gN44oTjEvm+rpuOhy27Fgde0lN/HceFIkQPgh56
         DOMoVXioX8IXIqHIVaKwbC88XSXoT/slS328+FVLc+m6VsHL6QNNslc9Ambuhey05EVz
         70IsyKYbwvSCjMtfCsOg2IHY3iZ6XG+jUaXyGPrgPc20WCGBrKeZRDdCCynFU6xE5jXx
         XmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746355454; x=1746960254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwsnsoUoKOvxrLI+SxTbGd5obMmAtQRgaYtvdq+wb5Q=;
        b=I7pUsmGnxinGyv6Yc33G2UcDxcTZmeeBnw9qWVD4JjGus669ZeWhLJYgBIJHF2H57m
         ScaGbapXbAKoQugDl2jZBZHN49QcvQaLF2nxWMW/NKGW0NDtuAX8mOzDjuautMfPJyRf
         mAQzx6+5l12h3/I0NfC6V/rqTfDJaB5eCKUDkBCjD8qQZ7T2AOmO8tZZz9SEngN23shD
         9Fp4kImRejTZ6ekjvp/Z9tdrTw5XZJQtT3vT917NKUZKUiqCFqpE9Wq+qoZ0EEd91Rvs
         ThXGvZEtCBO9zS9IlTfvM1RW288xFYFMXyuHFi82sMwWkCqG/so7PHZUK4Tz1WNGX7n5
         MmVw==
X-Forwarded-Encrypted: i=1; AJvYcCX58RdvCIAAY7xHi4ZiTXrS826epEqiXqIpUyTwfp3+PHE3P38oVG423cU3z6l1Lco+bVUkVfmlk3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjh5K6cKFzYASiIWm8/ABlPVEMNJL2IDN7uvTLDtU3FpgMI286
	tFe8doBWJG6UoIbPL6eL/TumuSn4pSCDp5FW0DNBYA/W2fw7x7AZin/zrowXn7FOlVNLOnsweSr
	sznR9S+/7CBgsb4kDLXxlPe9QF6qMOg03XDmPVg==
X-Gm-Gg: ASbGncu16mSNqJLl4N5IaD4q6iVxyeNIJmS7RDC8sWh2fPe9qyT30xNbYO63xV6ecwS
	o91hbM7+c3ic5FKOSvNjp96kdO2yx4Yp2magNsusUvhKwrhMa/YXEv2xuqGsrwaJD+p51eFkuRH
	asJOKI83RiG3S2OcRXzNKXgQ==
X-Google-Smtp-Source: AGHT+IGcooOCnVN5pzKNF1A9ON/1qYZLWzKuVEjjylbaG5z5KbZS9AS/VS720bi46Pav1DDgusyzVmWZm2pEJGH/Wao=
X-Received: by 2002:a05:651c:3135:b0:30b:9813:b00e with SMTP id
 38308e7fff4ca-3234915242amr9554471fa.24.1746355454057; Sun, 04 May 2025
 03:44:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-11-apatel@ventanamicro.com> <20250203225845.GA491419-robh@kernel.org>
In-Reply-To: <20250203225845.GA491419-robh@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 4 May 2025 16:14:03 +0530
X-Gm-Features: ATxdqUEj4EoSt1TXrYN3OTXAe8ouV7qB3CXPomkjYXo0aLAplIgzf1OaiaQGfSk
Message-ID: <CAK9=C2Xm0yJVwDW-+xp0WK1zB0VUFzktCevFrCicGkWQtKc_-Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 10/17] dt-bindings: interrupt-controller: Add
 bindings for RISC-V RPMI system MSI
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 4:28=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Feb 03, 2025 at 02:18:59PM +0530, Anup Patel wrote:
> > Add device tree bindings for the system MSI service group based interru=
pt
> > controller defined by the RISC-V platform management interface (RPMI)
> > specification.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  .../riscv,rpmi-system-msi.yaml                | 89 +++++++++++++++++++
> >  1 file changed, 89 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-control=
ler/riscv,rpmi-system-msi.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/ris=
cv,rpmi-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-contr=
oller/riscv,rpmi-system-msi.yaml
> > new file mode 100644
> > index 000000000000..e6c297e66c99
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi=
-system-msi.yaml
> > @@ -0,0 +1,89 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/riscv,rpmi-sys=
tem-msi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RISC-V RPMI system MSI service group based interrupt controller
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
>
> I'm confused by this description and what the binding has. This "device"
> is receiving interrupts and generating MSIs based on those interrupts?

The platform microcontroller receives/monitors system events and
sends MSI to application processors (RISC-V CPUs).

>
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
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - description:
> > +          Intended for use by the SBI implementation in machine mode o=
r
> > +          software in supervisor mode.
> > +        const: riscv,rpmi-system-msi
> > +
> > +      - description:
> > +          Intended for use by the SBI implementation in machine mode.
> > +        const: riscv,rpmi-mpxy-system-msi
> > +
> > +  mboxes:
> > +    maxItems: 1
> > +    description:
> > +      Mailbox channel of the underlying RPMI transport or SBI message =
proxy.
> > +
> > +  riscv,sbi-mpxy-channel-id:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The SBI MPXY channel id to be used for providing RPMI access to
> > +      the supervisor software. This property is mandatory when using
> > +      riscv,rpmi-mpxy-system-msi compatible string.
> > +
> > +  msi-parent: true
> > +
> > +  interrupt-controller: true
> > +
> > +  "#interrupt-cells":
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - mboxes
> > +  - msi-parent
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    mpxy_mbox: sbi-mpxy-mbox {
>
> mailbox {
>
> Though generally we don't show providers for a consumer schema.

Okay, I will drop the producer schema.

>
> > +          compatible =3D "riscv,sbi-mpxy-mbox";
> > +          #mbox-cells =3D <2>;
> > +    };
> > +    rpmi_sysmsi_intc: interrupt-controller {
> > +        compatible =3D "riscv,rpmi-system-msi";
> > +        mboxes =3D <&mpxy_mbox 0x2000 0x0>;
> > +        msi-parent =3D <&imsic_slevel>;
> > +        interrupt-controller;
> > +        #interrupt-cells =3D <1>;
> > +    };
> > +...
> > --
> > 2.43.0
> >

Regards,
Anup
