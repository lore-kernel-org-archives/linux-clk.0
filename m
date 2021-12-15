Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7C3C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 08:28:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240810AbhLOI2z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 03:28:55 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:64122 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235926AbhLOI2y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 03:28:54 -0500
Date:   Wed, 15 Dec 2021 08:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail2; t=1639556928;
        bh=5N280dBocJg74e5F/vSISE7EffqnCBdn+052s+S8NFo=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:From:To:Cc;
        b=VEQIE20/F9fTnC8R/++pVnhcDtgwv6VWLHjoeyu0TchlkBwJNFulPKRjkul7yxCj/
         OTUbHC3cJvB+SvWWPzknkOocNIgh0ZxNxxNyiJJNNvzK65JJm7kWWluCwxou0f1Ffc
         wa2SgiQItoi9E40pVlzyP4dpfqZL8/rqTD3KDBFl5BQhlVI8CzPK3OlovAHPmKQTGP
         WLDysfaZMkosAdvROuZTvitmkEG4wem8xaCiSxaUpLYTfisV8G5PlDkYya6lkvX0tf
         ptBFcKQWupLOJEZY4Czv+Md7DEP9ENCOBEDSEAmYXmxE1iRwdfi6vdi2VPhGFvChn3
         FQry6UgYBvCiw==
To:     Rob Herring <robh@kernel.org>
From:   =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>
Reply-To: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add Apple NCO
Message-ID: <F62225F0-C9C6-4E39-9163-B125A7253733@protonmail.com>
In-Reply-To: <CAL_Jsq+STG7=H_B3VwNp1V4OSCvKat2FUJhtzi_1t_UbMnOUfw@mail.gmail.com>
References: <20211214120213.15649-1-povik@protonmail.com> <20211214120213.15649-2-povik@protonmail.com> <Ybi61fzpOV7CumtR@robh.at.kernel.org> <3F145763-2774-4569-B9B7-A03CFE002E94@protonmail.com> <CAL_Jsq+STG7=H_B3VwNp1V4OSCvKat2FUJhtzi_1t_UbMnOUfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


> On 15. 12. 2021, at 0:53, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Dec 14, 2021 at 2:08 PM Martin Povi=C5=A1er <povik@protonmail.com=
> wrote:
>>
>> Hi Rob,
>>
>>> On 14. 12. 2021, at 16:40, Rob Herring <robh@kernel.org> wrote:
>>>
>>> On Tue, Dec 14, 2021 at 12:02:48PM +0000, Martin Povi=C5=A1er wrote:
>>>> The NCO block found on Apple SoCs is a programmable clock generator
>>>> performing fractional division of a high frequency input clock.
>>>>
>>>> Signed-off-by: Martin Povi=C5=A1er <povik@protonmail.com>
>>>> ---
>>>> .../devicetree/bindings/clock/apple,nco.yaml  | 70 +++++++++++++++++++
>>>> 1 file changed, 70 insertions(+)
>>>> create mode 100644 Documentation/devicetree/bindings/clock/apple,nco.y=
aml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/apple,nco.yaml b/=
Documentation/devicetree/bindings/clock/apple,nco.yaml
>>>> new file mode 100644
>>>> index 000000000000..5029824ab179
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/clock/apple,nco.yaml
>>>> @@ -0,0 +1,70 @@
>>
>>>> +
>>>> +  apple,nchannels:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description:
>>>> +      The number of output channels the NCO block has been
>>>> +      synthesized for.
>>>
>>> I'd assume there is some max number?
>>
>> There might be some limit to the underlying IP but we wouldn=E2=80=99t k=
now.
>> What we know about the hardware comes from blackbox reversing, and that
>> doesn't suggest a particular limit to the number of channels we might
>> see on the SoC block in future.
>
> All the more reason to not put the size in the DT, but imply from the
> compatible. Unless it varies by instance...
>
> Though I guess you would need DT updates anyways to use the new clock.
>
>>> Do you really need to know this? If this is just to validate the clock
>>> cell values are less than this, then just drop that and the property.
>>> It's not the kernel's job to validate the DT.
>>
>> Well strictly speaking the driver could do clock registration on-demand
>> at the cost of additional book-keeping, in which case we could drop
>> the property, but I would prefer we don=E2=80=99t do that. Rather than p=
roviding
>> validation the property simplifies drivers.
>>
>> Another option is calculating the no. of channels from size of the reg
>> range, but I assume that=E2=80=99s worse than having the nchannels prope=
rty.
>>
>>>> +
>>>> +    nco: clock-generator@23b044000 {
>>>
>>> clock-controller@...
>>
>> Okay, will change.
>>
>>>
>>>> +      compatible =3D "apple,t8103-nco", "apple,nco";
>>>> +      reg =3D <0x3b044000 0x14000>;
>>>
>>> You really have 0x14000 worth of registers here because all of that
>>> will be mapped into virtual memory? Doesn't matter so much on 64-bit,
>>> but it did for 32-bit.
>>
>> There is about 5 registers per channel with 0x4000 stride between them,
>> blame Apple (or Samsung? I don=E2=80=99t know...).
>
> I would think you could walk the 0x4000 until you hit registers that
> behave differently.
>
> The register size / 0x4000 gives you the number of channels, too.

Right now that=E2=80=99s what I am inclined to use in v2.

> Another question, how do you know this is 1 block with N channels vs.
> N blocks just happening to be next to each other in the memory map?

We don=E2=80=99t. We only see Apple describe it as such in their devicetree=
, and
so far for all practical purposes it could be one block.

I guess if we derive the number of channels from register size, there=
=E2=80=99s
the fallback of breaking up the nodes per channel in future.

Martin


