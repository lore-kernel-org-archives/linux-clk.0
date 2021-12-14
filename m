Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35260C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Dec 2021 20:08:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232158AbhLNUIF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Dec 2021 15:08:05 -0500
Received: from mail-4322.protonmail.ch ([185.70.43.22]:40649 "EHLO
        mail-4322.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbhLNUIE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Dec 2021 15:08:04 -0500
Date:   Tue, 14 Dec 2021 20:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail2; t=1639512483;
        bh=NjFaV2R1dhpIehk6OXr3CNJpYtdzyY4IVTG8J/PjtSQ=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:From:To:Cc;
        b=U/o1GC9azt8HhsSelre0/4SlBPCx3PiLrC/o3B3DkuRED7mg2ondxxrZ7XrGj/hff
         sSNn7I/COEtWWL7a+GibtNazluEDNiiO7hnGDy+oza6JP3F+3ebXWmOOy5hLfQBQVs
         Lf3yHkE2B9P1s8pABvI622tL0Sqq05cSANTDJarp9U0uqpViCUX6ZYt1LVrGY0n22z
         3me19X7OKlTkdbDpAI7PEjuH2WHa0+wza6zoSl69vBungxyXh9tLhz8GoS4aFkGzQq
         wcXbh74FbW6JwSVSABOaXxXPVIFznMS1OMp34nS4BjMIR0goywfQBc0XK8QyLP80IX
         VioWMimA8sZeg==
To:     Rob Herring <robh@kernel.org>
From:   =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        kettenis@openbsd.org, marcan@marcan.st, sven@svenpeter.dev
Reply-To: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add Apple NCO
Message-ID: <3F145763-2774-4569-B9B7-A03CFE002E94@protonmail.com>
In-Reply-To: <Ybi61fzpOV7CumtR@robh.at.kernel.org>
References: <20211214120213.15649-1-povik@protonmail.com> <20211214120213.15649-2-povik@protonmail.com> <Ybi61fzpOV7CumtR@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Rob,

> On 14. 12. 2021, at 16:40, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Dec 14, 2021 at 12:02:48PM +0000, Martin Povi=C5=A1er wrote:
>> The NCO block found on Apple SoCs is a programmable clock generator
>> performing fractional division of a high frequency input clock.
>>
>> Signed-off-by: Martin Povi=C5=A1er <povik@protonmail.com>
>> ---
>> .../devicetree/bindings/clock/apple,nco.yaml  | 70 +++++++++++++++++++
>> 1 file changed, 70 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/clock/apple,nco.yam=
l
>>
>> diff --git a/Documentation/devicetree/bindings/clock/apple,nco.yaml b/Do=
cumentation/devicetree/bindings/clock/apple,nco.yaml
>> new file mode 100644
>> index 000000000000..5029824ab179
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/apple,nco.yaml
>> @@ -0,0 +1,70 @@

>> +
>> +  apple,nchannels:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      The number of output channels the NCO block has been
>> +      synthesized for.
>
> I'd assume there is some max number?

There might be some limit to the underlying IP but we wouldn=E2=80=99t know=
.
What we know about the hardware comes from blackbox reversing, and that
doesn't suggest a particular limit to the number of channels we might
see on the SoC block in future.

> Do you really need to know this? If this is just to validate the clock
> cell values are less than this, then just drop that and the property.
> It's not the kernel's job to validate the DT.

Well strictly speaking the driver could do clock registration on-demand
at the cost of additional book-keeping, in which case we could drop
the property, but I would prefer we don=E2=80=99t do that. Rather than prov=
iding
validation the property simplifies drivers.

Another option is calculating the no. of channels from size of the reg
range, but I assume that=E2=80=99s worse than having the nchannels property=
.

>> +
>> +    nco: clock-generator@23b044000 {
>
> clock-controller@...

Okay, will change.

>
>> +      compatible =3D "apple,t8103-nco", "apple,nco";
>> +      reg =3D <0x3b044000 0x14000>;
>
> You really have 0x14000 worth of registers here because all of that
> will be mapped into virtual memory? Doesn't matter so much on 64-bit,
> but it did for 32-bit.

There is about 5 registers per channel with 0x4000 stride between them,
blame Apple (or Samsung? I don=E2=80=99t know...).

--
Martin


