Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5FE411FBB
	for <linux-clk@vger.kernel.org>; Tue,  4 Aug 2026 18:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785868207; cv=pass; b=Ym57ZOKBzdYOdPZKaoem5hE0zgAalOVGn6cBrapNf6iG2b0ovKHeGjtRWRW3TXIaJu92ZVwcrgvQ4DkKg5wDABtHdsN17dkoFDTFiqaERR9DR3Eydm18hcZknA0oY6BTPE/JtxrLhHjqVgL7CTnXipzreJpMXjnmMrg3qKjpWjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785868207; c=relaxed/simple;
	bh=YR/o/LTpemAGDYJOLfPVkvZYIaS6LupInQCMHbfOBQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DjyMgUukL1f9A7nAx2PUo5SPWBRCVp9zsnNiEqaFDGHS/N/pnthKDKSz5p6/pTqhS1JLmQkMCuKhFqCGyhmpsFgvoUjqb0oGRNrE8cCkHWs2tvtkeF8Hm7esfLOKLF8UdTKgHED4m1HaPG158f0bYdKfPGobiioZC4aOpc73FGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVEUrt8h; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVEUrt8h"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15df0c154dso3091366b.1
        for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 11:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785868204; cv=none;
        d=google.com; s=arc-20260327;
        b=MYZMzpGjp2YZ+vrMg0GVAJnz+vkFB9sSXog+j4pD1SsfThiFuMjE4QWYjtODU/WdXI
         PU3rRkHV51S8qi5SSPuiUNvjecpib6twHXPNN/JCGGqy6OufRX8HjPxKhlxQnhPxhjyI
         gt6pmbFy4FbxIl7MSTShp255g9c+RYbDRrAjHFRLLiIJsl8nSFXgIAto5mEdEPxj6KXc
         BdJDnY2BBm4HWaIrAFqdedzD/W8f6JzjeQGiDOUaSNQWZMsTwQ5wZ6v3hRlJ7Qf01UnN
         iXfmbBDaTFwqV7dFpaFADuNxN8HhN2DFd6cLYrEAD5lna6714VMk7XHLG7tnVeA/tlqo
         XCnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XGjeFPew3WY1hoWUdVOxW+gqoEqKrPAbmGn8EETaFp0=;
        fh=K1purB982sADvk048ipt0XNxdYKKbD0VHmoyiAl04VY=;
        b=WrNJQujnYtHW676CL0KsptDC9xgwtyP+qOd9s5F4xbopxQ9tsQiIkMI1uZH4UWG/Jk
         lXDx9HxUEtZdAw5U8iQPMwR6YzARLvhbziu5wqJKTzuLMkWmZ15s3OaKt4Dzk+WrQCCJ
         rrIzbaPBLkYS0KTw67L8TOtwdQQUnkuqJPZjJc5LwFIMSW8Lqd0ugR1yI1X74LFUC244
         CW6Wi214Rl/BQvrKsQqYqeFEG0CUtHef5MLfr2gGNFJ5u2EwZmv/Jvr37z4m0tHIt9ML
         4eGqWhCVDPE03hqxlqbnyxw1ynSD+A3ij3uf2rgARTj1C/3JGOyIsFT3ex9JWOz/bApg
         lrEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785868204; x=1786473004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XGjeFPew3WY1hoWUdVOxW+gqoEqKrPAbmGn8EETaFp0=;
        b=nVEUrt8hJHpt1stGHoiAYCUbZwPi9u5XSS5haDxHedZSAu/S0wbf8T1cQZag4UYeyz
         f4mJ3gU1Tgg8jBtgq7SUsoBHjCFDZtXGvmAZz+Bw+LRTTGvCHOiFIILiqN7qsqds7V+p
         PBpxADjYoDKBwnlAli6/SjR5//Ig/qt/4eDMbK135rXnTv96+faT+GD8HO4UnbEuJXP/
         AaaBbeohpt2xF4/iriteDON64asfErcmISPkbeWKH5qtNqA3A6Sednt4EPABhYVGiD6f
         1SgEcTkuKtpPY0RqV0T5EzbYk5zRr321ox7vSe067brmcaNXxn6F8tXM8ZNfhtRUhJWj
         ic/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785868204; x=1786473004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XGjeFPew3WY1hoWUdVOxW+gqoEqKrPAbmGn8EETaFp0=;
        b=rRmcfKBEs4mvuiIosPXEIlxFUMEmeoci6OQ/PxZwMXmjV6K6Rurmu2cQQ0CcDb+tJC
         NTvZ6XjWdN6dpYZC9z78jPjgDpJvc07BFgU+Ls5dpQ9tmkLgohJwalINh425WFj30JwR
         GD8TWJlMuE66xw0S64m1Zn1pvZ8z0vDCMr6ywkxJQ0XcP+bEbVVcP4gYNfBDuTXVTlcX
         AAJLbrMVbT1cZ52APVmdOZOWchnCnXiI1hNs0N6Wb3ljNVo+wbw5rS5EbZGYZB2Jnq+C
         NE2Ynxyj+rVtWdfgpPgaJEWy7ZlRGwoXZT3jEosSwQRl7/HYARJ6Vcu0HtMGUwaBoans
         7YWw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7zrN5jHyPuwgSP6T7hYQAMe7JbfrzwI/AyxYupJ7t9qwifUHBA31ITohz+YHesFu6DWJIf+Ow0Go=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys64WZOFXTFHQ/NOQJQmCoIYAkjEXzieFo25y59SdsFeo7EnZE
	EgU7vDKviCPKA/cvzcHwKeAzf3obRGbEcno5SGfKjDAKa89TK2k3R68b4v5sIY6dVwJ6wXwHeuP
	YR3EXi2iFCJu4kKec0hrGw8n8Dx91UCg=
X-Gm-Gg: AR+sD13cCYI5Ty5RZ6HsRPwS4Vi+Qb9Gy2xK/OGxfx5IRVVTPK74p6z9bm/g0NcOEVm
	7FJea8rb9vXFjjbTrZW/BYfn1ygqrdA4kEGSgl9ZcZoQtw2XdLpoqrB9zLSJTygQzkevi35WfQi
	codY1a5Ym1n2y4Gho6+mxsTOWHN6v7BkmLze12Dcs/p/MedVwVtDYtxmZKs7hNtbERa/9a6eUxF
	aQLMngLSnc5gzbMOAUTaX1b5RktHzRJr9IrX7TcW0VspHhZa41A046rMWfAP8IA0MEJo0ParbNh
	pSwqG6GKEEL8FrjIA0gB/zpS5inhlM1apU2INtfj8YHeJIFPdV4/5CmyQty6+O77wQe+0QA3g4T
	huGI=
X-Received: by 2002:a17:907:a0cf:b0:c12:2aef:af2b with SMTP id
 a640c23a62f3a-c2039d63cb3mr13321866b.4.1785868203728; Tue, 04 Aug 2026
 11:30:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726-ti-adpll-v1-1-86f6fc936507@gmail.com> <20260803215059.GA638187-robh@kernel.org>
In-Reply-To: <20260803215059.GA638187-robh@kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 4 Aug 2026 23:59:51 +0530
X-Gm-Features: AUfX_mxwSCENiGM3gLSFs_OrQ5dfHB7ft3kTamvikK_i48EKp9jKQ4sMVne1v5s
Message-ID: <CAOWyW_68A9xKd9nrTM4dZxgdNEypT60WHnwOYow-i99eqcUbvQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: ti,DM814x-ADPLL: Convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
	simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 3:21=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Jul 26, 2026 at 12:17:47AM +0530, Bhargav Joshi wrote:
> > Convert the Texas Instruments DM814x ADPLL clock binding to DT schema
> > format. Add 'clock-output-names' as required which was missing in
> > legacy binding, as the driver (clk-adpll.c) mandates it and fails
> > probing if it is missing.
> >
> > Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> > ---
> >  .../devicetree/bindings/clock/ti/adpll.txt         |  39 --------
> >  .../bindings/clock/ti/ti,dm814-adpll-clock.yaml    | 108 +++++++++++++=
++++++++
> >  2 files changed, 108 insertions(+), 39 deletions(-)
>
> > diff --git a/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-=
clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-cloc=
k.yaml
> > new file mode 100644
> > index 000000000000..7f551dfca030
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/ti/ti,dm814-adpll-clock.y=
aml
> > @@ -0,0 +1,108 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/ti/ti,dm814-adpll-clock.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Texas Instruments DM814x ADPLL Clock
> > +
> > +maintainers:
> > +  - Tony Lindgren <tony@atomide.com>
> > +
> > +description:
> > +  The ADPLL is a register-mapped clock generator found on TI DM814x So=
Cs. It
> > +  provides multiple output clocks from two or three selectable input c=
locks and
> > +  three to four children.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,dm814-adpll-s-clock
> > +      - ti,dm814-adpll-lj-clock
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +  clocks:
> > +    minItems: 2
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    minItems: 2
> > +    maxItems: 3
> > +
> > +  clock-output-names:
> > +    minItems: 3
> > +    maxItems: 4
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#clock-cells'
> > +  - clocks
> > +  - clock-output-names
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: ti,dm814-adpll-s-clock
> > +then:
> > +  properties:
> > +    clocks:
> > +      minItems: 3
> > +    clock-names:
> > +      items:
> > +        - const: clkinp
> > +        - const: clkinpulow
> > +        - const: clkinphif
>
> This can move to the top level and just 'minItems: 3' here.
yes sure
>
> > +    clock-output-names:
> > +      items:
> > +        - description: dcoclkldo
> > +        - description: clkout
> > +        - description: clkoutx2
> > +        - description: clkouthif
>
> You don't have to document the clock-output-names.
>
Got it. I will drop the item descriptions for clock-output-names.
> > +else:
> > +  properties:
> > +    clocks:
> > +      maxItems: 2
> > +    clock-names:
> > +      items:
> > +        - const: clkinp
> > +        - const: clkinpulow
>
> And just 'maxItems: 2' here.
>
> > +    clock-output-names:
> > +      items:
> > +        - description: dcoclkldo
> > +        - description: clkout
> > +        - description: clkoutldo
>
> And drop. Or maybe just 'maxItems: 3'
>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    adpll@40 {
> > +        compatible =3D "ti,dm814-adpll-s-clock";
> > +        reg =3D <0x40 0x40>;
> > +        #clock-cells =3D <1>;
> > +        clocks =3D <&devosc_ck &devosc_ck &devosc_ck>;
> > +        clock-names =3D "clkinp", "clkinpulow", "clkinphif";
> > +        clock-output-names =3D "481c5040.adpll.dcoclkldo",
> > +                             "481c5040.adpll.clkout",
> > +                             "481c5040.adpll.clkoutx2",
> > +                             "481c5040.adpll.clkouthif";
> > +    };
> > +
> > +  - |
> > +    adpll@80 {
> > +        compatible =3D "ti,dm814-adpll-lj-clock";
> > +        reg =3D <0x80 0x30>;
> > +        #clock-cells =3D <1>;
> > +        clocks =3D <&devosc_ck &devosc_ck>;
> > +        clock-names =3D "clkinp", "clkinpulow";
> > +        clock-output-names =3D "481c5080.adpll.dcoclkldo",
> > +                             "481c5080.adpll.clkout",
> > +                             "481c5080.adpll.clkoutldo";
> > +    };
>
> One example is enough.
