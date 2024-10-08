Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2678616D30B
	for <linux-clk@vger.kernel.org>; Tue,  8 Oct 2024 09:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728379016; cv=none; b=PI5k5MNf+yc0j+6XyhoxZTkpNCQcL5F4dqqv7KI97QbIKsaBPU3E357Ok+AmEFtPfsOzE8mBVVngi8ffVd5rRltCvxr2/ddN/EhpOLKRB+ZgMY9pBYxtqbaM9X+DB04E76YUoCCcBwwJh3KlwBJsjm14JqXJzJ9xK2o6PMy2ptc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728379016; c=relaxed/simple;
	bh=MW17kDyy2RnyjqsEcZDZ6AZwAg0+HY8ji7RKaY8/sAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l3eUBL8OFcpnjQrZyCI/OJbP4j1m7RHKlAcGrVxME1hWYr6h8oAKB2Jq9A3T/JCkosv2Lc6mTUSDr9MIYy5sXcTzm1hWK++mT83mel4NBOWAKI8yCzmNV2/iyIa7AjcngtgYN6pRwELxzFfAKAP0umrUQQU6M0pncB+BZCuAHYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=aCqCGaUI; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="aCqCGaUI"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e28f41e5dd8so149908276.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Oct 2024 02:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1728379012; x=1728983812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJD7AGkV74h+F3tXcRUA3F3uSwK5782MiTIfyLcIIQs=;
        b=aCqCGaUIqpNOIMy6bvnS5ZnefpRlROD0E+SBZGklTX2bf29Agvvza/BZLL9Z7qI9N/
         BcsacbzyCm5ynPvWN5lAefL3teW3FjiPlIQi6BWnTRPXgdBLr5xdfhIu0+iZR1Fxbdoa
         wsA0ipZClBwAMmv+D3Yazn6fkYBZBUvz7Pp0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728379012; x=1728983812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJD7AGkV74h+F3tXcRUA3F3uSwK5782MiTIfyLcIIQs=;
        b=tbmkVlaiU1Cv81AKnh5rIaSmSaDNj++OmVFe3m154HrWeDx1fJM4wpfX31D7qtZPN5
         opOYNE/UTPvW7Wy7YlHw+Wfyn9v3a3KtSdEw55GO0bjIGHLLvFnqnl7QnWeXqAOmZsEk
         8sr8XO0AUSEsN/aHzgZSqcdE/cPsArh3OQzEWrOwHJsguOShU2Kp+RpaFsear483oSpc
         +cPo1SKL1OX0I6beJjozvYFAM+tyjLU63Sg90eN/g7L3u1SL0s4ol7QzxtwwyYyLfz92
         PvCRXQEkpoLoDEKonoRxJEA6C8ndOUG+mmLro2+g85OEGQlNb7yKxn1+zFVYxrOAG8lY
         0e0g==
X-Forwarded-Encrypted: i=1; AJvYcCWtPnra63yblgDdSXeQeX9vypO4HaYnk6ynuT1i8sx0/OTlByOVnuu8aAhWc+2asz7ezHunqMvJXOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKoavi2AuIxrIaHqR2TGDLioWU900BeWmh7bz30u1XzJ4ngemA
	bee3bKqGCCXDa3aopStkO1Oi5o/BDJJ7Udev4sa2xLxnWO+mmNaN5k5oUP346UdHccyDBlryOwm
	ggTzu5Jml2dnOc0PBKiZjBbUTNI/EDj5vFvSPcw==
X-Google-Smtp-Source: AGHT+IGLQwdHScbjWxfMvETv8YRwhKPvlLlMWg8vidilOTvLrlL8nszdgcYwb8KTABG5wzUpKrIkar7K5YchVS7JMO0=
X-Received: by 2002:a05:6902:18d5:b0:e25:bc9e:74ba with SMTP id
 3f1490d57ef6-e289394f44cmr11831403276.50.1728379012068; Tue, 08 Oct 2024
 02:16:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240928083804.1073942-1-dario.binacchi@amarulasolutions.com>
 <20240928083804.1073942-2-dario.binacchi@amarulasolutions.com>
 <566859c1-a397-4465-987e-0682b07a703e@kernel.org> <CABGWkvqqg-PGAZTCz=MMLRx5F93jaN_=z8zJt1sDd3PHXd80PQ@mail.gmail.com>
 <6c3e6071-822f-4230-b76b-276330de07ef@kernel.org> <CABGWkvrU507BHoP94Y7fEyFr=chuuy3o=oBHtuWRvwTw3GnxXw@mail.gmail.com>
 <82db5037-bbd3-4005-bde9-02df1bf4c475@kernel.org> <CABGWkvqXZ+YAvo-AtUy+Ftdu0xxXKuhOwcSTwO5Fv6D3yzttNg@mail.gmail.com>
 <b847ccb1-1eb8-4119-8612-212804cb50d8@kernel.org> <CABGWkvqkmo9O-O1taR651W4xo=yqar=p71e0LKqRte2CGZ2Z8w@mail.gmail.com>
 <7bce31c0-8c74-4d65-812f-01951a0d75d1@kernel.org>
In-Reply-To: <7bce31c0-8c74-4d65-812f-01951a0d75d1@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 8 Oct 2024 11:16:41 +0200
Message-ID: <CABGWkvqFi_y8OzKbi=K7ucW4RuY_zh6Z4a=uO2oqQRoVE8LaCQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clock: imx8m-anatop: support spread
 spectrum clocking
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 10:20=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 07/10/2024 17:02, Dario Binacchi wrote:
> > On Sun, Oct 6, 2024 at 3:13=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 05/10/2024 10:57, Dario Binacchi wrote:
> >>> On Thu, Oct 3, 2024 at 12:46=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> >>>>
> >>>> On 01/10/2024 08:29, Dario Binacchi wrote:
> >>>>> On Mon, Sep 30, 2024 at 8:45=E2=80=AFAM Krzysztof Kozlowski <krzk@k=
ernel.org> wrote:
> >>>>>>
> >>>>>> On 29/09/2024 22:00, Dario Binacchi wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>> +  properties:
> >>>>>>>>> +    compatible:
> >>>>>>>>> +      contains:
> >>>>>>>>> +        enum:
> >>>>>>>>> +          - fsl,imx8mm-anatop
> >>>>>>>>> +
> >>>>>>>>> +then:
> >>>>>>>>> +  properties:
> >>>>>>>>> +    fsl,ssc-clocks:
> >>>>>>>>
> >>>>>>>> Nope. Properties must be defined in top-level.
> >>>>>>>>
> >>>>>>>>> +      $ref: /schemas/types.yaml#/definitions/phandle-array
> >>>>>>>>> +      description:
> >>>>>>>>> +        The phandles to the PLLs with spread spectrum clock ge=
neration
> >>>>>>>>> +        hardware capability.
> >>>>>>>>
> >>>>>>>> These should be clocks.
> >>>>>>>
> >>>>>>> Sorry, but I can't understand what you're asking me.
> >>>>>>> Could you kindly explain it to me in more detail?
> >>>>>>
> >>>>>> You added new property instead of using existing one for this purp=
ose:
> >>>>>> 'clocks'.
> >>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> Best regards,
> >>>>>> Krzysztof
> >>>>>>
> >>>>>
> >>>>> I added this new property specifically for managing spread-spectrum=
.
> >>>>> Indeed, not all clocks/PLLs
> >>>>> managed by the node/peripheral support spread-spectrum, and the add=
ed
> >>>>> properties specify
> >>>>> parameters for enabling and tuning SSC for each individual PLL base=
d
> >>>>> on the index of each list.
> >>>>> If I were to use the 'clocks' property and add a clock to this list
> >>>>> that does not support SSC, IMHO
> >>>>> the pairings would be less clear.
> >>>>
> >>>> You duplicate property with argument "pairings shall match". Well, I=
 am
> >>>> not happy with the duplication. Clocks have specific order, thus it =
is
> >>>> explicit which one needs tuning. Your other properties can match the=
m as
> >>>> well, just index from clocks is offset...
> >>>
> >>> Just to check if I understood correctly what you are suggesting befor=
e
> >>> submitting version 3 of the patch.
> >>> Something, for example, like:
> >>>
> >>> clocks =3D <&clk, IMX8MP_AUDIO_PLL1>,  <&clk, IMX8MP_AUDIO_PLL2>, <&c=
lk
> >>> IMX8MP_VIDEO_PLL1>;
> >>> fsl,ssc-modfreq-hz =3D <0, 3517>, <2, 6818>;
> >>
> >> Hm, what is 0? If clock index, then no, it's redundant. The first item
> >> in cannot point to other clock.
> >>
> >> Also, what exactly are you setting here
> >
> > I am enabling and configuring the spread spectrum.
> >
> > Normal clock: Without spread spectrum, the clock signal has a fixed and
> > repetitive frequency (e.g., 100 MHz). This frequency generates an
> > electromagnetic
> > signal concentrated on a single frequency, and if strong enough, it can=
 disturb
> > other devices.
> >
> > Spread spectrum:  With spread spectrum, the clock frequency is
> > slightly "modulated,"
> > meaning it oscillates around a central value. For example, if the base
> > frequency is 100 MHz,
> > the clock might vary between 99.5 MHz and 100.5 MHz in a cyclic manner.=
 This
> > small variation spreads the energy over a wider range of frequencies
> > (from 99.5 to 100.5 MHz),
> > reducing the intensity of the signal at any one frequency.
>
> Sure, so each board will come with its own, different values and you
> will not put into the SoC DTSI?

Yes, exactly.

>
> Where is the DTS? I received only this patch.

I haven't had time to push the board I'm working on upstream yet.
Locally, I apply this patch:

--- a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-of10.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-of10.dts
@@ -113,6 +113,13 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
        };
 };

+&anatop {
+       fsl,ssc-clocks =3D <&clk IMX8MP_VIDEO_PLL1>;
+       fsl,ssc-modfreq-hz =3D <6818>;
+       fsl,ssc-modrate-percent =3D <3>;
+       fsl,ssc-modmethod =3D "down-spread";
+};
+
 /* Ethernet */
 &eqos {
        pinctrl-names =3D "default";

>
> >
> >> and why assigned-clock-rates are
> >> not working?
> >
> > The traditional clock properties, such as clocks,
> > assigned-clocks-rates, etc retain their usual
> > meaning even when spread spectrum is applied. However, to implement
> > the spread spectrum
> > mechanism in a circuit with a PLL (Phase-Locked Loop), additional
> > specific parameters are
> > introduced to properly configure the frequency modulation:
> >
> >  - Modulation frequency: i. e. fsl,ssc-modfreq-hz
> >  - Modulation rate: i.e.  fsl,ssc-modrate-percent
> >  - Modulation type:  i. e. fsl,ssc-modmethod (center-spread, down-sprea=
d)
> >
> > Additionally, it should be noted that not all anatop PLLs are equipped
> > with circuitry for spread
> > spectrum, but only a small subset of them. This is the reason why I
> > introduced the property
> > "fsl, ssc-clocks".
> >
> > This is another commit [1] on enabling spread spectrum that I
> > implemented some time ago for
> > the am335x. The most evident difference is that in that case the node
> > was a clock node and not
> > a clock controller, as in the case of anatop. The parameters are also
> > not exactly the same, but
> > that depends on the platform.
> >
> > [1] 4a8bc2644ef0cbf8e ("dt-bindings: ti: dpll: add spread spectrum supp=
ort")
>
>
> OK, I still do not know what "0" was, but the items are fixed, so you
> know exactly which clock you are configuring here.

So, after delving deeper into the topic, is it now acceptable to use
the property
"fsl,ssc-clocks" instead of "clocks"?  As in the patch I applied locally?

Thanks and regards,
Dario

>
> Best regards,
> Krzysztof
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
