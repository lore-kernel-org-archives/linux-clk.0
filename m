Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C33C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Dec 2021 23:53:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235225AbhLNXxo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Dec 2021 18:53:44 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:55790 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235218AbhLNXxo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Dec 2021 18:53:44 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 9919CCE19FE;
        Tue, 14 Dec 2021 23:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 950F4C34606;
        Tue, 14 Dec 2021 23:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639526020;
        bh=PvZMo/gj0nYljGM06LBmSCA4QR02E7C/XoKsqA/9ARM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=c2d6BbNmvFdZiDHdABT92aAf6OEkYVx22Co/nuhvM7QnuFMm11OaGheonLr55TAvY
         DzYV+PZ0/SBiXtO9kB7RfhWmXj+i1UjzT+ARSSW40sUhS4s+h2MEQA9Pk44QGxgNqD
         WnQQAsOiFqNY9StJLhzGJCA/0g6fiiAQVimc32yxrxv531blbHQBHpNqBZsfmzyrIC
         wmb5r1r4tDGcN7X0NWHMyZqeKIVDS/tX+/EazGr2i9TWviIW/SVIVSe09wvp2zoohQ
         7uTffCu1yvqBiJV9WBOpa6wsifX3qNO8ktuNWXCpNZtZgO2hpfqM6NcciMwbbfU+SN
         Oix1It5XrSa7A==
Received: by mail-ed1-f44.google.com with SMTP id z5so69277917edd.3;
        Tue, 14 Dec 2021 15:53:40 -0800 (PST)
X-Gm-Message-State: AOAM5317tcXpMa6GsOsWMHewcw4XafqKnzt6sIlWIiY8641+FZyqRPMh
        wy9e0iDqxobHZgO3MyPgT004NTpdYrF1JSxiPw==
X-Google-Smtp-Source: ABdhPJwZTLqb7EhBpI3gfOOkg0o3mBknMM3223fDkEXOuW0bRcjsRNNG9nIMm+fbqnKdl+8DcTDsDM23zLUH6+1T0Vs=
X-Received: by 2002:a05:6402:4251:: with SMTP id g17mr11723087edb.89.1639526018906;
 Tue, 14 Dec 2021 15:53:38 -0800 (PST)
MIME-Version: 1.0
References: <20211214120213.15649-1-povik@protonmail.com> <20211214120213.15649-2-povik@protonmail.com>
 <Ybi61fzpOV7CumtR@robh.at.kernel.org> <3F145763-2774-4569-B9B7-A03CFE002E94@protonmail.com>
In-Reply-To: <3F145763-2774-4569-B9B7-A03CFE002E94@protonmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 14 Dec 2021 17:53:26 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+STG7=H_B3VwNp1V4OSCvKat2FUJhtzi_1t_UbMnOUfw@mail.gmail.com>
Message-ID: <CAL_Jsq+STG7=H_B3VwNp1V4OSCvKat2FUJhtzi_1t_UbMnOUfw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add Apple NCO
To:     =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Dec 14, 2021 at 2:08 PM Martin Povi=C5=A1er <povik@protonmail.com> =
wrote:
>
> Hi Rob,
>
> > On 14. 12. 2021, at 16:40, Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Dec 14, 2021 at 12:02:48PM +0000, Martin Povi=C5=A1er wrote:
> >> The NCO block found on Apple SoCs is a programmable clock generator
> >> performing fractional division of a high frequency input clock.
> >>
> >> Signed-off-by: Martin Povi=C5=A1er <povik@protonmail.com>
> >> ---
> >> .../devicetree/bindings/clock/apple,nco.yaml  | 70 +++++++++++++++++++
> >> 1 file changed, 70 insertions(+)
> >> create mode 100644 Documentation/devicetree/bindings/clock/apple,nco.y=
aml
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/apple,nco.yaml b/=
Documentation/devicetree/bindings/clock/apple,nco.yaml
> >> new file mode 100644
> >> index 000000000000..5029824ab179
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/clock/apple,nco.yaml
> >> @@ -0,0 +1,70 @@
>
> >> +
> >> +  apple,nchannels:
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >> +    description:
> >> +      The number of output channels the NCO block has been
> >> +      synthesized for.
> >
> > I'd assume there is some max number?
>
> There might be some limit to the underlying IP but we wouldn=E2=80=99t kn=
ow.
> What we know about the hardware comes from blackbox reversing, and that
> doesn't suggest a particular limit to the number of channels we might
> see on the SoC block in future.

All the more reason to not put the size in the DT, but imply from the
compatible. Unless it varies by instance...

Though I guess you would need DT updates anyways to use the new clock.

> > Do you really need to know this? If this is just to validate the clock
> > cell values are less than this, then just drop that and the property.
> > It's not the kernel's job to validate the DT.
>
> Well strictly speaking the driver could do clock registration on-demand
> at the cost of additional book-keeping, in which case we could drop
> the property, but I would prefer we don=E2=80=99t do that. Rather than pr=
oviding
> validation the property simplifies drivers.
>
> Another option is calculating the no. of channels from size of the reg
> range, but I assume that=E2=80=99s worse than having the nchannels proper=
ty.
>
> >> +
> >> +    nco: clock-generator@23b044000 {
> >
> > clock-controller@...
>
> Okay, will change.
>
> >
> >> +      compatible =3D "apple,t8103-nco", "apple,nco";
> >> +      reg =3D <0x3b044000 0x14000>;
> >
> > You really have 0x14000 worth of registers here because all of that
> > will be mapped into virtual memory? Doesn't matter so much on 64-bit,
> > but it did for 32-bit.
>
> There is about 5 registers per channel with 0x4000 stride between them,
> blame Apple (or Samsung? I don=E2=80=99t know...).

I would think you could walk the 0x4000 until you hit registers that
behave differently.

The register size / 0x4000 gives you the number of channels, too.

Another question, how do you know this is 1 block with N channels vs.
N blocks just happening to be next to each other in the memory map?

Rob
