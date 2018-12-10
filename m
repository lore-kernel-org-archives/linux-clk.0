Return-Path: <SRS0=Ck/k=OT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388C1C65BAF
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 08:59:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA37020855
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 08:59:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="HinvS8Ml"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA37020855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbeLJI7Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 03:59:16 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:11775 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbeLJI7P (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Dec 2018 03:59:15 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0e2ae00002>; Mon, 10 Dec 2018 00:59:12 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 10 Dec 2018 00:59:14 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 10 Dec 2018 00:59:14 -0800
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Mon, 10 Dec
 2018 08:59:12 +0000
Subject: Re: [PATCH 01/19] dt-bindings: clock: tegra124-dfll: Update DFLL
 binding for PWM regulator
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-2-josephl@nvidia.com>
 <af1211f0-dda0-bdde-f320-03e54f82d7e1@nvidia.com>
 <46b5eafa-00a0-1d91-1f4d-97ab119fcf21@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <e61b1da8-78cd-c3d4-9878-c25fd9c89ba3@nvidia.com>
Date:   Mon, 10 Dec 2018 08:59:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <46b5eafa-00a0-1d91-1f4d-97ab119fcf21@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544432352; bh=5yAzpD8l7HUY63K5eJLdZc5G6VTUM2U5k9OxSRtIbBQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=HinvS8MldIvsvVP/k6adWpf7VwRrtiw/u3RKpI7h8t4W6BQXIqZiaHVQM/4atTy3k
         e3On5MpVB2M/CdklRBct1kXuYDskqjWt5TLw1ON1BPB0rYjIrBqmk9N9XpAe+TdkZZ
         1PkaEuvYFVFxgWuyY8IpDlOEWyKlb9vN6tZ9Wjml4vASQgAs/bFjCXhlhCrD5VdWx9
         JqZStRVAo+SdddkHUxzCArJByvt97QHI4+PLNnp8NiVkXNQgQGSIYt6FrHqPLGszhw
         Wktd5vkOKrjsy1eru7kKMEy0WhfXMkWM1/uLFhyxSBa2iUPEZaahORPVeulYpzP8PK
         5XWwZ7MvZOxlQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 10/12/2018 08:49, Joseph Lo wrote:
> Hi Jon,
>=20
> Thanks for reviewing this series.
>=20
> On 12/7/18 9:41 PM, Jon Hunter wrote:
>>
>> On 04/12/2018 09:25, Joseph Lo wrote:
>>> From: Peter De Schrijver <pdeschrijver@nvidia.com>
>>>
>>> Add new properties to configure the DFLL PWM regulator support. Also
>>> add an example and make the I2C clock only required when I2C support is
>>> used.
>>>
>>> Cc: devicetree@vger.kernel.org
>>> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>> ---
>>> =C2=A0 .../bindings/clock/nvidia,tegra124-dfll.txt=C2=A0=C2=A0 | 73 +++=
+++++++++++++++-
>>> =C2=A0 1 file changed, 71 insertions(+), 2 deletions(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>>> b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>>> index dff236f524a7..8c97600d2bad 100644
>>> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>>> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>>> @@ -8,7 +8,6 @@ the fast CPU cluster. It consists of a free-running
>>> voltage controlled
>>> =C2=A0 oscillator connected to the CPU voltage rail (VDD_CPU), and a
>>> closed loop
>>> =C2=A0 control module that will automatically adjust the VDD_CPU voltag=
e by
>>> =C2=A0 communicating with an off-chip PMIC either via an I2C bus or via
>>> PWM signals.
>>> -Currently only the I2C mode is supported by these bindings.
>>> =C2=A0 =C2=A0 Required properties:
>>> =C2=A0 - compatible : should be "nvidia,tegra124-dfll"
>>> @@ -45,10 +44,28 @@ Required properties for the control loop parameters=
:
>>> =C2=A0 Optional properties for the control loop parameters:
>>> =C2=A0 - nvidia,cg-scale: Boolean value, see the field
>>> DFLL_PARAMS_CG_SCALE in the TRM.
>>> =C2=A0 +Optional properties for mode selection:
>>> +- nvidia,pwm-to-pmic: Use PWM to control regulator rather then I2C.
>>> +
>>> =C2=A0 Required properties for I2C mode:
>>> =C2=A0 - nvidia,i2c-fs-rate: I2C transfer rate, if using full speed mod=
e.
>>> =C2=A0 -Example:
>>> +Required properties for PWM mode:
>>> +- nvidia,pwm-period: period of PWM square wave in microseconds.
>>> +- nvidia,init-uv: Regulator voltage in micro volts when PWM control
>>> is disabled.
>>
>> Maybe consider 'pwm-inactive-voltage-microvolt'.
> Ah, I think I need to refine the description here. It should be
> something like below.
> =C2=A0- nvidia,pwm-init-microvolt : Regulator voltage in micro volts when=
 PWM
> control is initialized
>=20
> This is the initial voltage that when we just initialize the DFLL
> hardware for PWM output. And before we switch the CPU clock from PLLX to
> DFLL, we will enable DFLL hardware in closed loop mode which will aplly
> the DVFS table that was calculated from CVB table.
>=20
> The original description maybe make you think that it's the working
> voltage when it's under open-loop mode. But it's not. Sorry.
>=20
> When we working on open-loop mode which will switch to low voltage range
> which also follows the DVFS table. Not this one.

OK, but I am still not sure what this voltage is. I mean that I
understand it is the initial voltage, but how exactly do we define this
number? Where does it come from, how is this determined?

>>
>>> +- nvidia,align-offset-uv: Regulator voltage in micro volts when PWM
>>> control is
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 enabled and PWM output is low.
>>
>> Would this be considered the minimum pwm active voltage?
> This would be used for minimum voltage for LUT table, which is the table
> that PMIC can output. The real minimum voltage in PWM mode still depends
> on the CVB table.
>=20
> So maybe change this one to 'nvidia,pwm-offset-uv'.

So is this the min supported by the PMIC? Maybe the name should reflect
that because the above name does not reflect this. Furthermore, if this
is a min then maybe the name should use 'min' as opposed to 'offset'.
for example, 'nvidia,pwm-pmic-min-microvolts'.

Does this need to be described in DT, can it not be queried from the PMIC?

Cheers
Jon

--=20
nvpublic
