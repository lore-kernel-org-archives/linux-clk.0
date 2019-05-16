Return-Path: <SRS0=duwI=TQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90222C04AB4
	for <linux-clk@archiver.kernel.org>; Thu, 16 May 2019 09:01:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5709D20862
	for <linux-clk@archiver.kernel.org>; Thu, 16 May 2019 09:01:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Bsi2IhER"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbfEPJBc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 May 2019 05:01:32 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:7878 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbfEPJBb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 May 2019 05:01:31 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cdd26e50000>; Thu, 16 May 2019 02:01:25 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 16 May 2019 02:01:29 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 16 May 2019 02:01:29 -0700
Received: from [10.19.108.132] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 May
 2019 09:01:26 +0000
Subject: Re: [PATCH V3 1/8] dt-bindings: memory: tegra: Add external memory
 controller binding for Tegra210
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20190510084719.18902-1-josephl@nvidia.com>
 <20190510084719.18902-2-josephl@nvidia.com>
 <fd68f906-79b4-6eda-b1fa-abaf3b4c6a12@gmail.com>
 <63360b18-6a17-ab3f-6c54-6e11e24885d0@nvidia.com>
 <c3909c66-5aa4-161b-98d4-02ad20e02c88@gmail.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <f1e4ab1e-11b9-ba65-20b8-35c6459d2410@nvidia.com>
Date:   Thu, 16 May 2019 17:01:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c3909c66-5aa4-161b-98d4-02ad20e02c88@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557997285; bh=Y2N0TfbKD02hhOmQQ7rvVEpY9Sslkmcqd1sYqbZs/kQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Bsi2IhEROXO3MZTG+Q3FfZjly3adYJk/H74ruWLUXt+SnQpa+G+ayZPF3rU4upVcP
         Putpy7xGYpD7aBWdGpRLQkabXBVlk2bFcvFi5EdTinlex9qZKxmw9OpiZISCdZPyhs
         nf/6r7k9xpyaI5tcqZCcFp994CNiSc3zzLDf3PV8p8rBrJGRM/P2eYZ5k/AbcXiPhu
         d60niaLHKxS14f6acYltEry/yUBc5Kuu2vlgTMei5noxODo59n3kZkfOE7jhLSobGV
         Ha+m8l8EXZEymEvcBhPE8HdQuVm59jfzeDhMPvkAFpJos/YDJon3As36APxHQwc20L
         1ftXiqzWjpmBg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 5/15/19 9:50 PM, Dmitry Osipenko wrote:
> 15.05.2019 10:17, Joseph Lo =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 5/15/19 12:28 AM, Dmitry Osipenko wrote:
>>> 10.05.2019 11:47, Joseph Lo =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> Add the binding document for the external memory controller (EMC) whic=
h
>>>> communicates with external LPDDR4 devices. It includes the bindings of
>>>> the EMC node and a sub-node of EMC table which under the reserved memo=
ry
>>>> node. The EMC table contains the data of the rates that EMC supported.
>>>>
>>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>>> ---
>>>> v3:
>>>> - drop the bindings of EMC table
>>>> - add memory-region and reserved-memory node for EMC table
>>>> ---
>>>>  =C2=A0 .../nvidia,tegra210-emc.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 55 +++++++++++++++++++
>>>>  =C2=A0 1 file changed, 55 insertions(+)
>>>>  =C2=A0 create mode 100644
>>>> Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-e=
mc.txt
>>>>
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210=
-emc.txt
>>>> b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210=
-emc.txt
>>>>
>>>> new file mode 100644
>>>> index 000000000000..d65aeef2329c
>>>> --- /dev/null
>>>> +++
>>>> b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210=
-emc.txt
>>>>
>>>> @@ -0,0 +1,55 @@
>>>> +NVIDIA Tegra210 SoC EMC (external memory controller)
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>>>> +
>>>> +Device node
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +Required properties :
>>>> +- compatible : should be "nvidia,tegra210-emc".
>>>> +- reg : physical base address and length of the controller's register=
s.
>>>> +- clocks : phandles of the possible source clocks.
>>>> +- clock-names : names of the possible source clocks.
>>>> +- interrupts : Should contain the EMC general interrupt.
>>>> +- memory-region : phandle to the reserved memory (see
>>>> +
>>>> Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt)=
 which
>>>>
>>>> +=C2=A0 contains a sub-node of EMC table.
>>>> +- nvidia,memory-controller : phandle of the memory controller.
>>>> +
>>>> +Reserved memory node
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +Should contain a sub-node of EMC table with required properties:
>>>> +- compatible : should be "nvidia,tegra210-emc-table".
>>>> +- reg : physical address and length of the location of EMC table.
>>>> +
>>>> +Example:
>>>> +=C2=A0=C2=A0=C2=A0 reserved-memory {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <2>;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <2>;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ranges;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 emc_table: emc-table@8be00=
000 {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 co=
mpatible =3D "nvidia,tegra210-emc-table";
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
g =3D <0x0 0x8be00000 0x0 0x10000>;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
atus =3D "okay";
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>>
>>> You essentially moved the v1 binding into obscure and undocumented blob=
,
>>> ignoring previous review comments. This is a very odd move... please
>>> explain what is going on.
>>>
>>
>> Discussed with Thierry offline which way we prefer to pass the EMC table
>> to the kernel. Some reasons below we decide to chose this one (via
>> binary blob).
>>
>> - The EMC table is much bigger than the previous Tegra generations
>> (LPDDR4 v.s. LPDDR2/3). It's harder to settle in the review process. And
>> if there is a new fix of the table in the future, we'll need to go
>> through that again.
>=20
> I don't think that this a very good excuse for not documenting the
> blob's structure.

The blob's structure is in patch 4 now that we originally wanted to=20
describe below. Basically, the content is the same.
http://patchwork.ozlabs.org/patch/1084467/
http://patchwork.ozlabs.org/patch/1063879/

>=20
>> - Because it's LPDDR4 we want to support here, to support higher rates,
>> the devices have must be gone through the training process, which is
>> done in the firmware. Which means We already have the table somewhere in
>> the memory and kernel can just re-use that. No need to convert them back
>> to DT and pass to the kernel. This is much easier to maintain in the
>> future if there is something needs to fix.
>> - With the mechanism above, we don't need to maintain the huge EMC table
>> in the DT file like below.
>> http://patchwork.ozlabs.org/patch/1063886/
>> http://patchwork.ozlabs.org/patch/1063889/
>=20
> The blob's EMC table contains stuff specific to downstream kernel, hence
> it's a not very re-usable downstream software ABI mixed with HW
> description that you're bringing into upstream. This is not very
> welcomed, although I don't see it as a big problem if you'll state that
> all clearly in the commit message with a solid explanation why it is the
> best possible option.
>=20
>> And sorry, maybe it's not clear at that moment, but I did mention that
>> we want to go with the new method (via binary blob) in the previous revi=
ew.
>> Please see http://patchwork.ozlabs.org/patch/1084467/
>=20
> Okay. It will be better if the discussion happened publicly, at least I
> hope that Rob is involved in it.
>=20
