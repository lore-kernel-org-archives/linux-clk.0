Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7DC1C5F2A;
	Tue, 14 Jan 2025 07:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736840649; cv=none; b=Vq9TiO98ZRjriy4lnYyFe71XYq0/PYRXvjj5pQm3lkCwkNQFOwxPC0eiMRHfhoBHtF/3RGMtH65TSYFr9JrxFcndYG1AwQOcq4ZEFLSIF8Xr7vmYmyKkbwkTFIAptHL7l7MmYYj3PAcTyw0+wQIQrKyBq6mcJwbmVXUZqPizEVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736840649; c=relaxed/simple;
	bh=mGnR3HJMZBqUhCDL7bgqtn34QevNjR2UgOCyWG3PL5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S0EA6K5n/eKprg1IAW2RooRTcalUhXeSd2efMEHYRELTJ4EZ0GP1i3u06r/o6d/XqswvkLHnb5VuLNLMuU9bzR2flKBujj2WFEhWpV36isE46PX+iATW+RdCSwsj0I98zG9AHHoUJuamDsL23ENZ5/kPUZsCZpPQrOy1N2jVjTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEMWjmVc; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEMWjmVc"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so9442562a91.0;
        Mon, 13 Jan 2025 23:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736840647; x=1737445447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljJsNB0F+mWDattrBQ5KtzYfFx2JFfuGtpPgrZXo3vA=;
        b=hEMWjmVcoIQDuM/8f6xnGX9Q34DoSKK14aPwRnuP/WkBpVSyCinbyHatEudXc1H1HT
         IUYipku/nmPGzv5WXV2E9kzwSUI7wBktIaER/3BEFIhNOZuBh/I0UZvX0ZB0KBokwxdr
         14tgcjjrQvO+AGpkYTYvOzr8CeSgBxhDQIpviU8CH/PTdnFSXjjdhufMpCwzkpWKt0bt
         x1afurl9d+X5QSYHHEQHYAzD7IKEnzChLKGb7kgwU6CVgh2fmz6k4xSXLDNpas+0mGIj
         4x9RD5/79bWfy9sKhmbe3sDmq04WEv5hHi2aVBS//QGm3/ivS2a4RIKBbLLs1lLd04dL
         Orog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736840647; x=1737445447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljJsNB0F+mWDattrBQ5KtzYfFx2JFfuGtpPgrZXo3vA=;
        b=LRuIJA083xY/ORDQ+jgIL5TYIFQWGgUq9NzZQTBRflXq4O73zNjTv1GyHKSCU59Yck
         SYTQtGoMP1f0Y51cG9EPbj/etEtmdbEMehQs66wmbzM0eC5AqawN6jzoZewsVmwjSJlD
         fOIi4aPkWDIDep1pNbe4gBF8rS3BJ5aqNDiDsMgeaF969wt5u2SwX24Sf1fy3aGD45n4
         Cb4zcwTxRedKUTXIbBdDprhw67V565p88/TcEsqHnJBTxnKgrug3jD5FaBHQBNEI+7AC
         uDQrz6ACVpQQXlreMXQjbo0aWriuQLiJsvS/+/laLhj2PQOduYQq/f8/ac/+3slzezMK
         ie9A==
X-Forwarded-Encrypted: i=1; AJvYcCX/qoj/6kjpwrkdUwmxYMCxFQ+1H7ISwknpHCWaaUesDmviZ4F5OVXjgSJUC10fFD8IcIepZEZ/kbY5qCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO1Eecpig7mPdg6V6/D+muaTpLtUUssEky6jOkHH1PvN4iZXzf
	ZXeXdFJFz15xRtrSSFTF9OcT3iDEn7Sg4+mzjQZUJO+uwbcGiLX+srtBusdE313qZ03v2y+rtzb
	7PcDar494kp6zGzC5cR+ny7SKD4Z3Mg==
X-Gm-Gg: ASbGncuCOUf73hmRCQEXNdJxDFINRwWp5in8ZV1ZENAqT3F2ZtGeNUQwMTPjzDg20+k
	ubAItw7Cgtngl+SEGR1zKkicYTuHmWKR8YFKp
X-Google-Smtp-Source: AGHT+IGBfTifQPAnOqd5ijhI5AdljBFuutHA8ZLm0DNsZwWu+A2LFBxBnTuLo3HotkxIoMSbZSyuw1oqvronUkk73U4=
X-Received: by 2002:a17:90b:4d10:b0:2ef:2980:4411 with SMTP id
 98e67ed59e1d1-2f55443a040mr27803752a91.9.1736840646901; Mon, 13 Jan 2025
 23:44:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113082818.345939-1-sergio.paracuellos@gmail.com>
 <ebb32bec-3fd4-4129-ab5d-d519b10c4405@kernel.org> <CAMhs-H9ysdJ9nUuStWJpRqTzm-09ZS5TMdhWgKMZx+JZdo6teQ@mail.gmail.com>
 <ec255edc-adcd-4c18-8f9c-209298f2bbff@kernel.org> <CAMhs-H9Osx__jBoxqAW1zWO4Q+nMymVfiWe_-ZSzp92Jht+JTg@mail.gmail.com>
 <cf9732b1-fd09-454e-bfd7-bef55b234175@kernel.org> <CAMhs-H_6QTptfFsSEh7PKy8Fnoem1ph4j=mwT_23=J=adDDT8w@mail.gmail.com>
 <a4796db2-e354-48e0-bd5f-da774f154473@kernel.org>
In-Reply-To: <a4796db2-e354-48e0-bd5f-da774f154473@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 14 Jan 2025 08:43:55 +0100
X-Gm-Features: AbW1kvaHSA2E7A6k96EgV43mBRC5AyoYl2qi9gGLrhlTyPhQ5aqpDx-KQDk54do
Message-ID: <CAMhs-H9+hHnQQ3PSs2fCNvwdoJhrteARXQutFiziGN9+TFAgrw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: add clock definitions for Ralink SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	yangshiji66@outlook.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 8:09=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 13/01/2025 13:58, Sergio Paracuellos wrote:
> > On Mon, Jan 13, 2025 at 1:37=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 13/01/2025 13:29, Sergio Paracuellos wrote:
> >>>>>
> >>>>>> 2. What is the point of this? We do not add constants when there a=
re no
> >>>>>> users. Commit msg explains here nothing.
> >>>>>
> >>>>> All of the old ralink SoCs' dts files which are in the tree are not
> >>>>> properly updated. I expect to have them updated somewhere in time
> >>>>> merging real base stuff from openwrt dts [0] files. Not having this
> >>>>> header with definitions makes very hard to update dts and then
> >>>>> checking the driver code becomes a need to see the indexes for the
> >>>>> clocks to properly setup a consumer node. Because of this, this fil=
e
> >>>>> is added here.
> >>>>
> >>>> Still there is no point without the users. I do not see any reason w=
hy
> >>>> this cannot be combined with fixing driver to use the header. Not
> >>>> combining is an indication this is not a binding in the first place.
> >>>
> >>> Driver uses a bunch of arrays for the clocks (base, fixed, factor and
> >>> peripheral) and they are registered consecutively in order just using
> >>> the ARRAY_SIZE macro for any of them. Thus, the direct application of
> >>> these definitions would be for dts consumer nodes, not the driver
> >>> itself.
> >>
> >> So what do you constants here fix? Driver can still reorganize arrays
> >> breaking everything. If defining headers for proper ABI, then use that
> >> ABI to make everything build-time testable and visible. That's why thi=
s
> >> is not supposed to be a separate patch from users.
> >
> > I understand your point and agree that the driver can do that, but the
> > idea as this driver maintainer is not to do that :).
> > Is adding something like the following in the binding itself with the
> > header addition a possible way to go?
> >
> > --- a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
> > +++ b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
> > @@ -18,6 +18,12 @@ description: |
> >    These SoCs have an XTAL from where the cpu clock is
> >    provided as well as derived clocks for the bus and the peripherals.
> >
> > +  Each clock is assigned an identifier and client nodes use this ident=
ifier
> > +  to specify the clock which they consume.
> > +
> > +  All these identifiers could be found in:
> > +  [1]: <include/dt-bindings/clock/mediatek,mtmips-sysc.h>.
> > +
> >  properties:
> >    compatible:
> >      items:
> > @@ -38,7 +44,8 @@ properties:
> >
> >    '#clock-cells':
> >      description:
> > -      The first cell indicates the clock number.
> > +      The first cell indicates the clock number, see [1] for available
> > +      clocks.
> >      const: 1
> >
> > @@ -56,6 +63,8 @@ additionalProperties: false
> >
> >  examples:
> >    - |
> > +    #include <dt-bindings/clock/mediatek,mtmips-sysc.h>
> > +
> >      syscon@0 {
> >        compatible =3D "ralink,rt5350-sysc", "syscon";
> >        reg =3D <0x0 0x100>;
>
> This changes nothing.

Understood. Thanks for making it clear.

>
> >
> > I don't like the idea of changing the driver code for using these
> > constants since I do believe that it would make code uglier and less
> > maintainable. I just wanted to make things easier for the device tree
>
> Then why having constants in the first place?

Because I was expecting to have DTS as the only user and make things
easier for it.

>
> > consumer nodes. So if adding this header is not a possibility with the
> > changes in the yaml file I will forget about this addition and this
> > patch.
>
> Header without user is pointless. Driver and the DTS are the expected use=
rs.

Understood. So having only DTSs as users is not a possible way to go.
It is clear now. Forget about this patch then.

>
>
> Best regards,
> Krzysztof

Thanks,
    Sergio Paracuellos
