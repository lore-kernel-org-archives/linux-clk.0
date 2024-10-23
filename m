Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F3F1D0E13
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 14:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729695523; cv=none; b=GZEaw0BtxKSCixXOVXSmVS9iZEgbkUpC0lGEoNR8oPUsmSZoqGfiHazqt5j+md4R8k+n7vENwZwBuufoffHDXvxuEkT+tGvU7B8CDIpNW2q7mMMWrcu/vJISutmE1bXwnxx9enMznU2216uTDZzKxzDTntYY62NxWpcVhIiwTs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729695523; c=relaxed/simple;
	bh=ijSNBy8WFLMHsM6Tz0SAZQFPKdhIuybeQf2QKLmNK3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZPLTPEXhE8RVmGgLU3kyWB/Ovn2uHXdHOA6mojSZFHPrT6nigophDjxg6QWXAI6sgTaaVySJ/KP/hqsd8himOnmYoa7V5yKSkR3Gs3pXGJEtW5Ph4QnMRhsAQcOy3ziDBg5yWcrJ5NMtPielD3USWJwyFNlrqIROvGpPYknIEsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=iAa8tFt8; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iAa8tFt8"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e290200a560so6665453276.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 07:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1729695520; x=1730300320; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08wzDr73SmncP7hOpusXSf0JUEnKVaq7T6cx/CuFfXg=;
        b=iAa8tFt8IKUKcHsFf2TMju2oXovRyXgP9C5PgivPwrtVpT2MOiS7JzInKoOjc9J0tF
         rIifyZf+tG4WGXaYc/0K9bUdQZ1mYGN62NJn/9DaTPBELPqrrTqgBps4GO4ELKUWX3vH
         v8fKmv9i0CWLnst+IdxL2Kad6iY+OQuxjWXTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729695520; x=1730300320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08wzDr73SmncP7hOpusXSf0JUEnKVaq7T6cx/CuFfXg=;
        b=fHX20kFskMGeTjBVuNfxBGUXkHkAdM3jSZD7LcQeTvVq445Ed1gQGODqdZbQQZJ/Rk
         LQVB5psRwPWymqqXRY2QYoeta+p2hgtJuvHeZo0YJNqFeUgF7kWI/2oVorIzc32iHfjy
         VpBVcbdkeM9PGBqZWNuBq1sdmyrVdjlMhzZdaNZtA+tdLqZ+29RxUF56qSdiMNE6y9Yz
         juD66htzmacAUHOw8Xf8PZO1aYoiGPt41IByt0YHT5xegYCCLFjshj/zMVF3UALAUoGQ
         RrBPiK+To7y6PHejhasvaU7z0ofohoMoA56rqFanN9PZiLOkqBfezkPQP3T3odAneWiR
         9I4w==
X-Forwarded-Encrypted: i=1; AJvYcCXB3PNJVwMHvDRk/jCxheNP4dV0OI64NfQBiky4enJ+5eTgPQokE8uo/VqzUzCM1rA9BQ9qhcSQH3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv+Us4vT1KJubdL/8Qo7GrxPcFMGl2KqlfpBPlqd3IQycfgwg+
	WjZvZd3v53nk0bCzadctFtlUTqUrvKosXLVkMQ+gHTofoaKpYoLPGBU2GeQMoKKmzfrL1Fu9O0+
	MPLRNMumbRU7NinsQ9Uk7I/awWWXOTfr/+XVoNg==
X-Google-Smtp-Source: AGHT+IGAkJXmTLbjp4p/kmr/kI6fPHFgvzbKjk4VittFrzzA3ftmZhOciZg168F1BuNwZNJVQtt2aHwv41AM/edj+1w=
X-Received: by 2002:a05:6902:260a:b0:e28:e9bf:797c with SMTP id
 3f1490d57ef6-e2e3a609744mr2609445276.3.1729695520116; Wed, 23 Oct 2024
 07:58:40 -0700 (PDT)
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
 <7bce31c0-8c74-4d65-812f-01951a0d75d1@kernel.org> <CABGWkvqFi_y8OzKbi=K7ucW4RuY_zh6Z4a=uO2oqQRoVE8LaCQ@mail.gmail.com>
In-Reply-To: <CABGWkvqFi_y8OzKbi=K7ucW4RuY_zh6Z4a=uO2oqQRoVE8LaCQ@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 23 Oct 2024 16:58:28 +0200
Message-ID: <CABGWkvrR-vVTpNSBD_etjn4SteO8cpUed+dTvYguHR67UUSsYA@mail.gmail.com>
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

On Tue, Oct 8, 2024 at 11:16=E2=80=AFAM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> On Tue, Oct 8, 2024 at 10:20=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On 07/10/2024 17:02, Dario Binacchi wrote:
> > > On Sun, Oct 6, 2024 at 3:13=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > >>
> > >> On 05/10/2024 10:57, Dario Binacchi wrote:
> > >>> On Thu, Oct 3, 2024 at 12:46=E2=80=AFPM Krzysztof Kozlowski <krzk@k=
ernel.org> wrote:
> > >>>>
> > >>>> On 01/10/2024 08:29, Dario Binacchi wrote:
> > >>>>> On Mon, Sep 30, 2024 at 8:45=E2=80=AFAM Krzysztof Kozlowski <krzk=
@kernel.org> wrote:
> > >>>>>>
> > >>>>>> On 29/09/2024 22:00, Dario Binacchi wrote:
> > >>>>>>>>
> > >>>>>>>>
> > >>>>>>>>> +  properties:
> > >>>>>>>>> +    compatible:
> > >>>>>>>>> +      contains:
> > >>>>>>>>> +        enum:
> > >>>>>>>>> +          - fsl,imx8mm-anatop
> > >>>>>>>>> +
> > >>>>>>>>> +then:
> > >>>>>>>>> +  properties:
> > >>>>>>>>> +    fsl,ssc-clocks:
> > >>>>>>>>
> > >>>>>>>> Nope. Properties must be defined in top-level.
> > >>>>>>>>
> > >>>>>>>>> +      $ref: /schemas/types.yaml#/definitions/phandle-array
> > >>>>>>>>> +      description:
> > >>>>>>>>> +        The phandles to the PLLs with spread spectrum clock =
generation
> > >>>>>>>>> +        hardware capability.
> > >>>>>>>>
> > >>>>>>>> These should be clocks.
> > >>>>>>>
> > >>>>>>> Sorry, but I can't understand what you're asking me.
> > >>>>>>> Could you kindly explain it to me in more detail?
> > >>>>>>
> > >>>>>> You added new property instead of using existing one for this pu=
rpose:
> > >>>>>> 'clocks'.
> > >>>>>
> > >>>>>>
> > >>>>>>
> > >>>>>>
> > >>>>>> Best regards,
> > >>>>>> Krzysztof
> > >>>>>>
> > >>>>>
> > >>>>> I added this new property specifically for managing spread-spectr=
um.
> > >>>>> Indeed, not all clocks/PLLs
> > >>>>> managed by the node/peripheral support spread-spectrum, and the a=
dded
> > >>>>> properties specify
> > >>>>> parameters for enabling and tuning SSC for each individual PLL ba=
sed
> > >>>>> on the index of each list.
> > >>>>> If I were to use the 'clocks' property and add a clock to this li=
st
> > >>>>> that does not support SSC, IMHO
> > >>>>> the pairings would be less clear.
> > >>>>
> > >>>> You duplicate property with argument "pairings shall match". Well,=
 I am
> > >>>> not happy with the duplication. Clocks have specific order, thus i=
t is
> > >>>> explicit which one needs tuning. Your other properties can match t=
hem as
> > >>>> well, just index from clocks is offset...
> > >>>
> > >>> Just to check if I understood correctly what you are suggesting bef=
ore
> > >>> submitting version 3 of the patch.
> > >>> Something, for example, like:
> > >>>
> > >>> clocks =3D <&clk, IMX8MP_AUDIO_PLL1>,  <&clk, IMX8MP_AUDIO_PLL2>, <=
&clk
> > >>> IMX8MP_VIDEO_PLL1>;
> > >>> fsl,ssc-modfreq-hz =3D <0, 3517>, <2, 6818>;
> > >>
> > >> Hm, what is 0? If clock index, then no, it's redundant. The first it=
em
> > >> in cannot point to other clock.
> > >>
> > >> Also, what exactly are you setting here
> > >
> > > I am enabling and configuring the spread spectrum.
> > >
> > > Normal clock: Without spread spectrum, the clock signal has a fixed a=
nd
> > > repetitive frequency (e.g., 100 MHz). This frequency generates an
> > > electromagnetic
> > > signal concentrated on a single frequency, and if strong enough, it c=
an disturb
> > > other devices.
> > >
> > > Spread spectrum:  With spread spectrum, the clock frequency is
> > > slightly "modulated,"
> > > meaning it oscillates around a central value. For example, if the bas=
e
> > > frequency is 100 MHz,
> > > the clock might vary between 99.5 MHz and 100.5 MHz in a cyclic manne=
r. This
> > > small variation spreads the energy over a wider range of frequencies
> > > (from 99.5 to 100.5 MHz),
> > > reducing the intensity of the signal at any one frequency.
> >
> > Sure, so each board will come with its own, different values and you
> > will not put into the SoC DTSI?
>
> Yes, exactly.
>
> >
> > Where is the DTS? I received only this patch.
>
> I haven't had time to push the board I'm working on upstream yet.
> Locally, I apply this patch:
>
> --- a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-of10.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-of10.dts
> @@ -113,6 +113,13 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>         };
>  };
>
> +&anatop {
> +       fsl,ssc-clocks =3D <&clk IMX8MP_VIDEO_PLL1>;
> +       fsl,ssc-modfreq-hz =3D <6818>;
> +       fsl,ssc-modrate-percent =3D <3>;
> +       fsl,ssc-modmethod =3D "down-spread";
> +};
> +
>  /* Ethernet */
>  &eqos {
>         pinctrl-names =3D "default";
>
> >
> > >
> > >> and why assigned-clock-rates are
> > >> not working?
> > >
> > > The traditional clock properties, such as clocks,
> > > assigned-clocks-rates, etc retain their usual
> > > meaning even when spread spectrum is applied. However, to implement
> > > the spread spectrum
> > > mechanism in a circuit with a PLL (Phase-Locked Loop), additional
> > > specific parameters are
> > > introduced to properly configure the frequency modulation:
> > >
> > >  - Modulation frequency: i. e. fsl,ssc-modfreq-hz
> > >  - Modulation rate: i.e.  fsl,ssc-modrate-percent
> > >  - Modulation type:  i. e. fsl,ssc-modmethod (center-spread, down-spr=
ead)
> > >
> > > Additionally, it should be noted that not all anatop PLLs are equippe=
d
> > > with circuitry for spread
> > > spectrum, but only a small subset of them. This is the reason why I
> > > introduced the property
> > > "fsl, ssc-clocks".
> > >
> > > This is another commit [1] on enabling spread spectrum that I
> > > implemented some time ago for
> > > the am335x. The most evident difference is that in that case the node
> > > was a clock node and not
> > > a clock controller, as in the case of anatop. The parameters are also
> > > not exactly the same, but
> > > that depends on the platform.
> > >
> > > [1] 4a8bc2644ef0cbf8e ("dt-bindings: ti: dpll: add spread spectrum su=
pport")
> >
> >
> > OK, I still do not know what "0" was, but the items are fixed, so you
> > know exactly which clock you are configuring here.
>
> So, after delving deeper into the topic, is it now acceptable to use
> the property
> "fsl,ssc-clocks" instead of "clocks"?  As in the patch I applied locally?

A gentle ping.
Sorry, but I haven't yet received your response to the previous email,
and I'm not sure how to proceed.

Thanks and regards,
Dario

>
> Thanks and regards,
> Dario
>
> >
> > Best regards,
> > Krzysztof
> >
>
>
> --
>
> Dario Binacchi
>
> Senior Embedded Linux Developer
>
> dario.binacchi@amarulasolutions.com
>
> __________________________________
>
>
> Amarula Solutions SRL
>
> Via Le Canevare 30, 31100 Treviso, Veneto, IT
>
> T. +39 042 243 5310
> info@amarulasolutions.com
>
> www.amarulasolutions.com



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
