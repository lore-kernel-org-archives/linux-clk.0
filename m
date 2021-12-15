Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0ADFC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 08:43:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236223AbhLOIna (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 03:43:30 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:43611 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231561AbhLOIna (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 03:43:30 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 32E045C04F6;
        Wed, 15 Dec 2021 03:43:29 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute3.internal (MEProxy); Wed, 15 Dec 2021 03:43:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type:content-transfer-encoding; s=fm3; bh=VK
        cSYvg/PB6dN8bWvJX/h8MFSQkUCELoS7Ib9QTCvKk=; b=KqVCJbKzB+U1qui5eA
        jmCV6UX/Kiz2Ad70NpKjvHLewwjOmtIfp2iFoQjeRJZHcjiDUvJ1VvqwxhMfC4Qk
        6OVATFra7yRIprCXHsXAajVSCaTS287lfGrhCvJ3Twag2UXJxjIBqTFuPaStl663
        0seHZqHvewwf7nP2S8OF1/sejel1vKNDA5zGTdQrWd6x0q1dwfJtYNiPocI2XIej
        HJQ44cBV8TGh9vAfjzzKRiUNdrMcGsErsv4NiUZl1ONyDIZlJkjOHj15wMFnWSup
        8jZ3W1s/gw0Rie5GVwJdcTzMf9e63Zpbg6JqoJko6JPv13ehhzEJj2lS+khD9atC
        qCpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=VKcSYvg/PB6dN8bWvJX/h8MFSQkUCELoS7Ib9QTCv
        Kk=; b=kBfMIp/Dhf8ImV1iKs8PIsZGyJHE4btRHql0Lc6eZAJydREWSy9w95LOS
        nLuL9cDmTtpfjrnIICyP9BhDERFdaqB7SFe9xpc16XIkdYAtSktZiqqk5J3JMcZC
        ujAIDFNm+pvyRwPPCapzC2lY3vohd5NCauYLyr12bbNRU2zAWJftTWS8THst7KuB
        kPAy8QDZEKa7FvOI12bApwXFy9H+mb7J3CSsOjP8/NUUlNo5DG5Se8lJxFZzM/sp
        wVuDbnW5HburRlFx0uA1nTq0JPSWx3kV4oCfzQBknuXZJU64/59ypnmIbfRUvbeb
        NGro08yLm4K45St8RWnvQoYyQQksA==
X-ME-Sender: <xms:r6q5YfTbD5YlmZF9ftaLWZ2Og8ad001ukFq2oNHD3d3i1h6uQj8iKg>
    <xme:r6q5YQz7Q8lgHrYSBRLUpBPRuOtKHepJFXqACzKzjn_b5kqihaNhUEds3tYQ_xE9S
    Rdg2KRnLSSTggGqTXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledugdduudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedfufhv
    vghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrf
    grthhtvghrnhepteeuudelteefueelvdelheehieevvdfhkeehjeejudfhieelffffudfh
    keeileegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshhvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:sKq5YU0E75M5I2OQkPLDXV6yBc09EZt_YUSciRJvecO_apfZT6I9Jw>
    <xmx:sKq5YfBugby_iSn_trlYP7laj8tAGxl3mKKR0UG9k4unsXIIhf210g>
    <xmx:sKq5YYigSy7R842jDCsC1Loc1CWz1S-o_ZEQ5Ov1GcdT-CmEuN2UvQ>
    <xmx:saq5YSatAP0b8ilZLUc3yQ_2oKNb0ATZEzooHmCDRnoKrLEfswEhsA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id E71C9274042E; Wed, 15 Dec 2021 03:43:27 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4524-g5e5d2efdba-fm-20211214.001-g5e5d2efd
Mime-Version: 1.0
Message-Id: <0be8517e-a488-4203-9941-b43eac3d8f24@www.fastmail.com>
In-Reply-To: <F62225F0-C9C6-4E39-9163-B125A7253733@protonmail.com>
References: <20211214120213.15649-1-povik@protonmail.com>
 <20211214120213.15649-2-povik@protonmail.com>
 <Ybi61fzpOV7CumtR@robh.at.kernel.org>
 <3F145763-2774-4569-B9B7-A03CFE002E94@protonmail.com>
 <CAL_Jsq+STG7=H_B3VwNp1V4OSCvKat2FUJhtzi_1t_UbMnOUfw@mail.gmail.com>
 <F62225F0-C9C6-4E39-9163-B125A7253733@protonmail.com>
Date:   Wed, 15 Dec 2021 09:43:07 +0100
From:   "Sven Peter" <sven@svenpeter.dev>
To:     =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>,
        "Rob Herring" <robh@kernel.org>
Cc:     "Michael Turquette" <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        "Mark Kettenis" <kettenis@openbsd.org>,
        "Hector Martin" <marcan@marcan.st>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add Apple NCO
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On Wed, Dec 15, 2021, at 09:28, Martin Povi=C5=A1er wrote:
>> On 15. 12. 2021, at 0:53, Rob Herring <robh@kernel.org> wrote:
>>
>> On Tue, Dec 14, 2021 at 2:08 PM Martin Povi=C5=A1er <povik@protonmail=
.com> wrote:
>>>
>>> Hi Rob,
>>>
>>>> On 14. 12. 2021, at 16:40, Rob Herring <robh@kernel.org> wrote:
>>>>
>>>> On Tue, Dec 14, 2021 at 12:02:48PM +0000, Martin Povi=C5=A1er wrote:
>>>>> The NCO block found on Apple SoCs is a programmable clock generator
>>>>> performing fractional division of a high frequency input clock.
>>>>>
>>>>> Signed-off-by: Martin Povi=C5=A1er <povik@protonmail.com>
>>>>> ---
>>>>> .../devicetree/bindings/clock/apple,nco.yaml  | 70 +++++++++++++++=
++++
>>>>> 1 file changed, 70 insertions(+)
>>>>> create mode 100644 Documentation/devicetree/bindings/clock/apple,n=
co.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/clock/apple,nco.yam=
l b/Documentation/devicetree/bindings/clock/apple,nco.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..5029824ab179
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/clock/apple,nco.yaml
>>>>> @@ -0,0 +1,70 @@
>>>
>>>>> +
>>>>> +  apple,nchannels:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +    description:
>>>>> +      The number of output channels the NCO block has been
>>>>> +      synthesized for.
>>>>
>>>> I'd assume there is some max number?
>>>
>>> There might be some limit to the underlying IP but we wouldn=E2=80=99=
t know.
>>> What we know about the hardware comes from blackbox reversing, and t=
hat
>>> doesn't suggest a particular limit to the number of channels we might
>>> see on the SoC block in future.
>>
>> All the more reason to not put the size in the DT, but imply from the
>> compatible. Unless it varies by instance...
>>
>> Though I guess you would need DT updates anyways to use the new clock.
>>
>>>> Do you really need to know this? If this is just to validate the cl=
ock
>>>> cell values are less than this, then just drop that and the propert=
y.
>>>> It's not the kernel's job to validate the DT.
>>>
>>> Well strictly speaking the driver could do clock registration on-dem=
and
>>> at the cost of additional book-keeping, in which case we could drop
>>> the property, but I would prefer we don=E2=80=99t do that. Rather th=
an providing
>>> validation the property simplifies drivers.
>>>
>>> Another option is calculating the no. of channels from size of the r=
eg
>>> range, but I assume that=E2=80=99s worse than having the nchannels p=
roperty.
>>>
>>>>> +
>>>>> +    nco: clock-generator@23b044000 {
>>>>
>>>> clock-controller@...
>>>
>>> Okay, will change.
>>>
>>>>
>>>>> +      compatible =3D "apple,t8103-nco", "apple,nco";
>>>>> +      reg =3D <0x3b044000 0x14000>;
>>>>
>>>> You really have 0x14000 worth of registers here because all of that
>>>> will be mapped into virtual memory? Doesn't matter so much on 64-bi=
t,
>>>> but it did for 32-bit.
>>>
>>> There is about 5 registers per channel with 0x4000 stride between th=
em,
>>> blame Apple (or Samsung? I don=E2=80=99t know...).
>>
>> I would think you could walk the 0x4000 until you hit registers that
>> behave differently.
>>
>> The register size / 0x4000 gives you the number of channels, too.
>
> Right now that=E2=80=99s what I am inclined to use in v2.
>
>> Another question, how do you know this is 1 block with N channels vs.
>> N blocks just happening to be next to each other in the memory map?
>
> We don=E2=80=99t. We only see Apple describe it as such in their devic=
etree, and
> so far for all practical purposes it could be one block.

Fwiw, the Apple device tree cannot be trusted in general. It also preten=
ds
that two IOMMUs that need to programmed identically are a single dive,
sometimes includes MMIO ranges that are much too large and also contains
at least a single "virtual" device that only exists for what I assume
to be a workaround for some XNU quirk(s). (the GPU IOMMU has a separate =
node
with no MMIO or anything which only attaches a small shim driver that th=
en
calls back into the main GPU driver. That device is also only used from =
within
that GPU driver.).

Are there any dependencies between these individual channels?
Is there some common initialization required for all of them?

From a quick glance and my uninformed opinion it looks like these are
separate to me. They only all need this LSFR table which could still be
shared.


Sven
