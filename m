Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E371A340A6A
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 19:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846467; cv=pass; b=N45mWIwQj8GW3XkO3/d77mhAepDJc4Eu+HIqBSCm9Ludue+R/+SkK0axhHCKd95xAetAvCCCIf0yePDQ56y1zJ5DSJ320pmP10/Epd7wR0MGc0heLMODO6tpNJCbcBalEZ7uGdMzy7gPiBvMi1jzIbr/pg/Wl4OsCiHXcEaAVhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846467; c=relaxed/simple;
	bh=4qfKdcPNbMd+fmxdOg3E5zb3rcSZDsE229cL1BNUGrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WkQCd+1ZbeZa18NdsoJtYgPePedZligTwGkKBjO6uKC8TZyNeDqNm5Hxr8df3CklFI8jN5S6pPnXw3bO/SRoYiKrqv62jkqGCovUItxXqd43wnuGG7lKj9pusA0It7izB5OJTNlaMtaST2BtvcTWSOWaW2o4M9vY6+TpiJL/lyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVAhE8G3; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVAhE8G3"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6983ed43ca1so679098a12.2
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 12:07:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782846464; cv=none;
        d=google.com; s=arc-20260327;
        b=Fl3cvk8WjT6oU31vTIolY++8XLoc7AWRYnOrUxFl0cEZJMv6P82u5fXU6LejcdxR1f
         dejXZSzPLyqa1B0QXu+nwGYKlTGOO2Xl/BIRWPJlVncuDnvnm5n/2QjJZiF+1WIk/GAH
         raUegoE9gObjgO4ljNGsnN4a07apkUQGJ4dxH62uBs/8OAz97pzL/P7y2FhFegRlwNlk
         gbT5DxX+/NL/HzuG3PWFuAFkCGg8C5N9Iksc2N/giIYMsNLNLtUaqWeo6kWwQs+oBQOG
         Tu1XXKIElqoMGIABxP2hwdZ1YO9PISMpadw6tyByVkokGaaluivRcLwMkpN4OZTZbz6I
         iLeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O1yeGWaj69jHRqNcBAjK19En1bt9Op8e8Yvz5aRmb5k=;
        fh=0GhqFoJp2sSTj71f55ydaSzd0qPGgcnLqlIiLH35Fb4=;
        b=d0MjKqNHjx1pAb/AQKLOF+LjJR44dJ1CAIt2W7eVXLhEaGaKiHnyQ0SdvRCsuVIf8v
         f1E7fPtfXOD/nE34xdIrNSizg3JdyNG/sdJ6+ETWyGWuwWwqiF6rm9uWBMpvlJlilfY4
         uEQpEYMMaw3wqOlDVG4rwE3AUg4OUQx8KmSpN+XyypDLQV9FJHPJn4v18WF+vGg84zSE
         SWDxmZzuIlLr02GOgCaUrvbwXTsVkAAKkv63U8wxPPhOsqV6kpEiayrK65oaQ+z9zFJf
         qMRQO5hoqA8cUL6RM1bOXqFiF9uxp7GzxZexLFcPlwGyRE37dkdmM/NvsvVWsoXKCpPG
         NqNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782846464; x=1783451264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O1yeGWaj69jHRqNcBAjK19En1bt9Op8e8Yvz5aRmb5k=;
        b=PVAhE8G3qBTx+DRh6YXDNu50LwZxUM/ae7En9qaWKjy/XIHfWmnYHvPPQmv8b61jl0
         F7Dy3eEqKERVj72zjIW/zv0YNYNv+dlA8cFpyioZv95QPgQX1Ti1Vjw0SczKGkfnds3a
         CYzi0+L34Ahcx48NRPQ8nr1tQX3vlmFDg1GyJDhraqkm1Z2l3a45euYrxugjzGBoJBgi
         t6Hexz8uMgqsykOLva73GPQ3hfK4hybhv5YVO513uPgm1Wd33lT4UwC0O6w1cvQrSJ7/
         64vK38bNXPEfJKVWdGuMm6pYwCprCYxSEPGJ1hqrPYF12PIMsoos8hGscSmRCZSmiVE5
         StJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782846464; x=1783451264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O1yeGWaj69jHRqNcBAjK19En1bt9Op8e8Yvz5aRmb5k=;
        b=rsVLCEtTnbt7JP2he6FMav4Eu27/W7eo1zLuYfpJTRoPICAtlf7kN2bSwl/FOGjCks
         sMuEXA4pAkcj/YXNymv4soQsO7av8PE5lc2ChzvjKTY9cPI8pBC/3Mf1tAwrX+3SjMqi
         tSGNsuWd9zhuwM+NIrhuIIFLbBBzXHUTGLhAA2q4CoNCQw54MTbW5NPYnfD/1jIU1BBC
         L0wUU2QaGJhQ+UU9WCoe3AJAy0Ib4vgGzihhYp3CYumWBcLqg1yDxw2Nkksqre7a8FTe
         sJf8/vdrJd5zZyLNUwLuibC0JCwsmO6g51g4e/BcSFdEvvcGxK77yZnXryCPjbzXvIO7
         kCpg==
X-Forwarded-Encrypted: i=1; AHgh+RpY5nbS8O5t7/XsFihL15f3Oi6Hjtd8xODth7f/VucC9jZauT/SvWzjSMyGpghuV649NORy49mMiX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwBgjO6gusEYny3Rii96+sOn3KMPDsCOP/6GfoBDddN4Bthl51
	SiJKq5YXjXBiRx/DwyPs8/jBORmq1Mh9dNwso/xd/D2v0/nTtyAgyWTe8+AcrT6e8CoYy/aaS8/
	tKUEaNseRUllhXcCZbA2ZUk0+D4TCI3s=
X-Gm-Gg: AfdE7cnU1OQXKR7Yqg5tyy3mtEsI/A9TNKV8q0x1VfWjyw5f+w1lpOMu4i1Ntnk22zu
	gCxR/jPjeeC7OfUd+hIYvyqmjHwafMQljSnNgSuNvChOJyFvl4oV3CiC4y0tZ+HEwatBT0H8d51
	MYxqFl3n7L6F+M0BL3PmNPsLBlFhcniJ8e5JMVzNxgtM7doipFnbkL3RDhf7C4RxEhK/dEgJSx3
	2SJJvaPQEo+z9T0OZHS4V2kFe383MbuT+mVidDVNq0wduAxXODucCa1CNrjhXFsK8oM1wTgmAwI
	mFkUWS3vPrZvxbDupKVdHPGkXNTegQ==
X-Received: by 2002:a17:907:1c10:b0:c12:2aef:af2b with SMTP id
 a640c23a62f3a-c12872fd5e2mr135482866b.4.1782846464204; Tue, 30 Jun 2026
 12:07:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622-ti-clockdomain-v2-1-434dbe0789e2@gmail.com> <20260630154723.GA3691228-robh@kernel.org>
In-Reply-To: <20260630154723.GA3691228-robh@kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 1 Jul 2026 00:37:32 +0530
X-Gm-Features: AVVi8Cfo-JqWOlg_d7zh2AaoYqBQAA2D-Cv71ouh_g1J5aYwyhQ5cFnNCC6tm8Y
Message-ID: <CAOWyW_7oSr_T0qU9aWZeU2-_p6Hrwi-9byKvVGq8Df2z0k0TTA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: clock: ti,clockdomain: Convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
	simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 9:17=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Jun 22, 2026 at 11:21:33PM +0530, Bhargav Joshi wrote:
> > Convert TI clockdomain to yaml DT schema. Drop '#clock-cells' from the
> > required list as this binding doesn't define a new clock binding type,
> > it is used to group existing clock nodes under hardware hierarchy. Most
> > existing dts omit '#clock-cells'.
> >
> > Update the reference to the old legacy text binding in the description
> > of bindings/clock/ti/ti,gate-clock.yaml to point to the new YAML file.
> >
> > Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> > ---
> > Changes in v2:
> > - updating the stale reference to the legacy .txt file inside
> >   bindings/clock/ti/ti,gate-clock.yaml to fix make refcheckdocs error
> > - Link to v1: https://lore.kernel.org/r/20260621-ti-clockdomain-v1-1-e9=
9a56af98ea@gmail.com
> > ---
> >  .../devicetree/bindings/clock/ti/clockdomain.txt   | 25 -------------
> >  .../bindings/clock/ti/ti,clockdomain.yaml          | 41 ++++++++++++++=
++++++++
> >  .../bindings/clock/ti/ti,gate-clock.yaml           |  2 +-
> >  3 files changed, 42 insertions(+), 26 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/ti/clockdomain.txt=
 b/Documentation/devicetree/bindings/clock/ti/clockdomain.txt
> > deleted file mode 100644
> > index edf0b5d42768..000000000000
> > --- a/Documentation/devicetree/bindings/clock/ti/clockdomain.txt
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> > -Binding for Texas Instruments clockdomain.
> > -
> > -This binding uses the common clock binding[1] in consumer role.
> > -Every clock on TI SoC belongs to one clockdomain, but software
> > -only needs this information for specific clocks which require
> > -their parent clockdomain to be controlled when the clock is
> > -enabled/disabled. This binding doesn't define a new clock
> > -binding type, it is used to group existing clock nodes under
> > -hardware hierarchy.
> > -
> > -[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> > -
> > -Required properties:
> > -- compatible : shall be "ti,clockdomain"
> > -- #clock-cells : from common clock binding; shall be set to 0.
> > -- clocks : link phandles of clocks within this domain
> > -
> > -Optional properties:
> > -- clock-output-names : from common clock binding.
> > -
> > -Examples:
> > -     dss_clkdm: dss_clkdm {
> > -             compatible =3D "ti,clockdomain";
> > -             clocks =3D <&dss1_alwon_fck_3430es2>, <&dss_ick_3430es2>;
> > -     };
> > diff --git a/Documentation/devicetree/bindings/clock/ti/ti,clockdomain.=
yaml b/Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
> > new file mode 100644
> > index 000000000000..9494cbb1a942
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
> > @@ -0,0 +1,41 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/ti/ti,clockdomain.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Texas Instruments clockdomain
> > +
> > +maintainers:
> > +  - Tero Kristo <kristo@kernel.org>
> > +
> > +description:
> > +  This binding uses the common clock binding in consumer role. Every c=
lock on TI
> > +  SoC belongs to one clockdomain, but software only needs this informa=
tion for
> > +  specific clocks which require their parent clockdomain to be control=
led when
> > +  the clock is enabled/disabled. This binding doesn't define a new clo=
ck binding
> > +  type, it is used to group existing clock nodes under hardware hierar=
chy.
> > +
> > +properties:
> > +  compatible:
> > +    const: ti,clockdomain
> > +
> > +  "#clock-cells":
> > +    const: 0
> > +
> > +  clocks: true
>
> At least put some range of number of clocks.

There is no specific bound for the number of clocks per domain nor does
the driver enforce it so I left it as 'true'. In existing DTS files, the
largest is am35xx's core_l3_clkdm with 39 clocks. No fixed bound
otherwise. So should I keep it as 'true' or you'd prefer a specific cap?
>
> > +
> > +  clock-output-names: true
>
> If #clock-cells is 0, then this can only have 1 entry (maxItems: 1).
sure I will fix this.
>
> > +
> > +required:
> > +  - compatible
> > +  - clocks
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    dss_clkdm {
> > +        compatible =3D "ti,clockdomain";
> > +        clocks =3D <&dss1_alwon_fck_3430es2>, <&dss_ick_3430es2>;
> > +    };
> > diff --git a/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.y=
aml b/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml
> > index eaa727ab0d7f..438e190d1067 100644
> > --- a/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml
> > +++ b/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml
> > @@ -19,7 +19,7 @@ description: |
> >    that is used.
> >
> >    [1] Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> > -  [2] Documentation/devicetree/bindings/clock/ti/clockdomain.txt
> > +  [2] Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
> >
> >  properties:
> >    compatible:
> >
> > ---
> > base-commit: acb7500801e98639f6d8c2d796ed9f64cba83d3a
> > change-id: 20260610-ti-clockdomain-a27dd0fa1ad5
> >
> > Best regards,
> > --
> > Bhargav
> >
> >

Best regards,
Bhargav
