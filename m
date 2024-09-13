Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088294A06;
	Fri, 13 Sep 2024 19:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726256765; cv=none; b=cUUJKwqPsfsUA43MAddyiBhv1aJj3eqq5bthVyxcqEKjwnYwRnN/WJGEU9yiXbkr50LnZbyxPEigrOybnMokM41gLqxQze9z7IuDuIYSrU1oQBY6W3oW79i0dn5voy01VhS6iehHndUIeINtJRmWhVF5peurk3RIVPSO1wFWM7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726256765; c=relaxed/simple;
	bh=irzfxl48davcfw8D4U+UFH+kFUss2avEidDpQCzdmW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UTTa6Fvfbul/qhceds6Mw4akyRDK/BcmcKXsILd1nNt5PT41P++TaGPeNHIsicPcGk968FiAmXLZaQWfLWZiCdve6MEtty9S3dKMBWfOmsUdVj9tjWXgpPNzPDcgEMkpPKE7QMgAVfXrFLWOq6Q+jYOYDDJQvUPQtD/a46jM1a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDm2wIMW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gDm2wIMW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923DEC4CED3;
	Fri, 13 Sep 2024 19:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726256764;
	bh=irzfxl48davcfw8D4U+UFH+kFUss2avEidDpQCzdmW4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gDm2wIMWzTyd7BFXJKoSaho5ZnNS6B8a/yEAnurFH7JZmpv7BCz77S6IIClDIfUZi
	 SOQ65O7r0w8lACeionWKDvlNIT01OGj6/mSsH3+jbCvcdPYyE7Objjrtk0cfVKtM5g
	 3hnsYxbB+J7HxoXCyu4ciHdbtYcqOzbqmDf2MCzUJ8fayZdlpQ4VQZHsiiaDgl6F+q
	 +YfzOtd/75gbZaWdCEFdvGGmucwKFB6keRv+rNEXUQxVxBj86amEDCG242oBsGk1WW
	 FnHvVorQVKHB/LNSxfCqPJnJNSI3Xr1uHy4+h/JMm1XzqRrlCDEFICnGMYd/FooezM
	 YyvRgkJJEyz3Q==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5356aa9a0afso2205249e87.2;
        Fri, 13 Sep 2024 12:46:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/3CcRqnBI0F15SqJnkctvcGsCfEERIYA008cjWQvee1Emd2xoHFavZ3RHHSutk7lwzMVwNIDBsQwn@vger.kernel.org, AJvYcCV5jLQMBIMqom68uAOxpuRVimBWWMQwwlsCo0/V3RAFU6AFx/qAfIMx9rWuMKpaX4jiC7/quDTqSnaH@vger.kernel.org, AJvYcCXYXUe6dmeXIF25OE0gZbY2fV1RvckcrotEzwS4PADmc47oNYQI8GOeSwwdMs9k2uyJqProm7MkRwzWfpmXU0d2qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6x+DRuXE5OP8glEbpocjnKXm/Ex9TV1k9G0AJewPMBXuDQscV
	ZsTeIIDkBsouyGzvFmCiQQy4of65vPf3XPeo33HOkXNCb4JurPB09ctLNNG/o3rnNMD5XW0QTXs
	9kmvOzRLL4omc+quLeiMHB45BJQ==
X-Google-Smtp-Source: AGHT+IF8ujH5G7IhHrAEJ1Q7WeKs8dPxgfyl9SMhJtytPlJ29u1zY89ILXutLa7Jid+UQ5+M+KGLOW/C/KhbD9qMLWU=
X-Received: by 2002:a05:6512:158e:b0:533:71f:3a3d with SMTP id
 2adb3069b0e04-5367fee454bmr3952584e87.24.1726256762744; Fri, 13 Sep 2024
 12:46:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <68037ad181991fe0b792f6d003e3e9e538d5ffd7.1673452118.git.geert+renesas@glider.be>
 <5da02a9b-3d42-a26f-0d18-29a6b5b181e5@seco.com> <20230124091236.1bf8c6da@booty>
 <CAMuHMdV8_+dF03VD6mST2zMDQ68cgsLLRQi6UeXK2jH-eWqWZg@mail.gmail.com>
 <232f59aa-704b-a374-6a78-469156ccdbea@seco.com> <83f4f33ebd3706ec7d35acd807b1e44b.sboyd@kernel.org>
 <20230322093918.33690db3@booty> <CAL_JsqKj6A=GvgaZCd9jiF71YPGuQSKJ9Ob6erHT45q8vRR13w@mail.gmail.com>
 <20240913170701.156d8e82@booty> <663b1735-5346-4fe7-b269-9d958b090a38@seco.com>
In-Reply-To: <663b1735-5346-4fe7-b269-9d958b090a38@seco.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 13 Sep 2024 14:45:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ5NNSgKxeCHhQ8ZsLm8ARsOHpgibjXLCkKb8cGEinJnA@mail.gmail.com>
Message-ID: <CAL_JsqJ5NNSgKxeCHhQ8ZsLm8ARsOHpgibjXLCkKb8cGEinJnA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clk: vc5: Make SD/OE pin configuration
 properties not required
To: Sean Anderson <sean.anderson@seco.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marek Vasut <marek.vasut@gmail.com>, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-reneas-soc@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Takeshi Kihara <takeshi.kihara.df@renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>, Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 11:41=E2=80=AFAM Sean Anderson <sean.anderson@seco.=
com> wrote:
>
> On 9/13/24 11:07, Luca Ceresoli wrote:
> > Hello Sean, Geert,
> >
> > On Tue, 10 Sep 2024 17:13:55 -0500
> > Rob Herring <robh+dt@kernel.org> wrote:
> >
> >> On Wed, Mar 22, 2023 at 3:39=E2=80=AFAM Luca Ceresoli <luca.ceresoli@b=
ootlin.com> wrote:
> >> >
> >> > Hello Stephen,
> >> >
> >> > On Mon, 20 Mar 2023 14:27:56 -0700
> >> > Stephen Boyd <sboyd@kernel.org> wrote:
> >> >
> >> > > Quoting Sean Anderson (2023-01-24 08:23:45)
> >> > > > On 1/24/23 03:28, Geert Uytterhoeven wrote:
> >> > > > > Hi Luca,
> >> > > > >
> >> > > > > On Tue, Jan 24, 2023 at 9:12 AM Luca Ceresoli <luca.ceresoli@b=
ootlin.com> wrote:
> >> > > > >> On Thu, 19 Jan 2023 14:27:43 -0500
> >> > > > >> Sean Anderson <sean.anderson@seco.com> wrote:
> >> > > > >> > On 1/11/23 10:55, Geert Uytterhoeven wrote:
> >> > > > >
> >> > > > >> I'm wondering whether Geert has a practical example of a situ=
ation
> >> > > > >> where it is better to have these properties optional.
> >> > > > >
> >> > > > > My issue was that these properties were introduced long after =
the
> >> > > > > initial bindings, hence pre-existing DTS does not have them.
> >> > > > > Yes, we can add them, but then we have to read out the OTP-pro=
grammed
> >> > > > > settings first. If that's the way to go, I can look into that,=
 though...
> >> > > >
> >> > > > FWIW I think there's no need to update existing bindings which d=
on't
> >> > > > have this property. The required aspect is mainly a reminder for=
 new
> >> > > > device trees.
> >> > > >
> >> > >
> >> > > Is there any resolution on this thread? I'm dropping this patch fr=
om my
> >> > > queue.
> >> >
> >> > IIRC Geert kind of accepted the idea that these properties should st=
ay
> >> > required. Which is a bit annoying but it's the safest option, so unl=
ess
> >> > there are new complaints with solid use cases for making them option=
alm,
> >> > I think it's OK to drop the patch.
> >>
> >> The warnings related to this are now at the top of the list (by number
> >> of occurrences):
> >>
> >>      50 clock-generator@6a: 'idt,shutdown' is a required property
> >>      50 clock-generator@6a: 'idt,output-enable-active' is a required p=
roperty
> >>
> >> IMO, if these properties haven't been needed for years, then they
> >> obviously aren't really required.
> >
> > I think Rob's point adds to Geert's observation that there are other
> > "idt,*" properties in the output nodes that may also be important to
> > have correctly set, and are optional.
> >
> > So, Sean, I understand when you state it's safer to have these set.
> > However this is valid for lots of other optional properties in any
> > binding. Optional properties _can_ be set if that's important, just
> > it's not mandatory to set them in all cases.
> >
> > As a matter of fact, we have been having for a long time some in-tree
> > device trees which don't set these properties, which I believe implies
> > it's OK for those cases to not set them, and to let them be set for the
> > device trees where it is important.
> >
> > Finally, there is a maintenance/legacy issue: if we wanted to keep thes=
e
> > properties optional, who would chase all the boards defined in existing
> > device trees to discover the correct values?
> >
> > Bottom line, my Reviewed-by tag is still valid.
> >
> > What is your opinion given these last few discussion point Sean?
>
> I am willing to send patches adding these properties for the appropriate
> boards. There are only 6 in tree (all Renesas):
>
> $ git grep -l idt,5p49 '**.dts*'
> arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> arch/arm64/boot/dts/renesas/hihope-common.dtsi
> arch/arm64/boot/dts/renesas/salvator-x.dtsi
> arch/arm64/boot/dts/renesas/salvator-xs.dtsi
> arch/arm64/boot/dts/renesas/ulcb.dtsi
>
> I was able to find schematics for ULCB. Salvator-X seems to be gone from
> Renesas's website (in favor of the -XS). I have requested access to the
> -XS schematics.  The HiHope board doesn't seem to have schematics
> anywhere I could find (which is pretty unusual for a reference
> design...). The Beacon schematics are behind a support portal (or so I
> assume).

That doesn't sound promising to me.

> That said, this info should be pretty easy to find for anyone with
> physical access to a board. Just boot it up and probe the voltage on the
> SD/OE pin. I've added some people who may have the hardware to CC.

By some definition of easy I guess...

I want the warning gone, so I'm going to apply this patch. When/if all
the cases have been fixed, I'll happily revert it.

Rob
