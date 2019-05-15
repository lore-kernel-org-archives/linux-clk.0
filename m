Return-Path: <SRS0=g5s0=TP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4AD3C04E53
	for <linux-clk@archiver.kernel.org>; Wed, 15 May 2019 07:17:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CECF20862
	for <linux-clk@archiver.kernel.org>; Wed, 15 May 2019 07:17:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="a2qSGk4g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbfEOHR0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 May 2019 03:17:26 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:2339 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfEOHR0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 May 2019 03:17:26 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cdbbcd60000>; Wed, 15 May 2019 00:16:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 15 May 2019 00:17:19 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 15 May 2019 00:17:19 -0700
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 May
 2019 07:17:16 +0000
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
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <63360b18-6a17-ab3f-6c54-6e11e24885d0@nvidia.com>
Date:   Wed, 15 May 2019 15:17:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fd68f906-79b4-6eda-b1fa-abaf3b4c6a12@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557904599; bh=rvmmtMaDz2XaVLEijpVuOgwxP0IUeQ7iihHR6HcMzMU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=a2qSGk4gKxUaZ3GAI9557ok/St7di3j7E+S/1xLLPItkQWok5/yNI9bIcGgy1oPWt
         flKon0UEMX/TARGfN54tRSRDgwsEIbXiM9nCsZxipiYytw7oG0OX58Q4q4NMsofplv
         ygRbceZlgrjJl1A65JLdfdMgTOlyYGgSubSOCLiHxLsHIqLmh4ZNBbYuDXMVmC30k4
         p/XtllqlZ4GwIWGalS/ZYWgrwk+2FJUa0joB37Tr91SjdhcFTv3Nqlxl1HNq3+SKdd
         sKeE/tsAbvBRst/mOT0Gir54nk+rgr5ylnuIqFOgMwwGm69E+ZfpFcOezckDHatz2s
         U2jnfk4YYjXKw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 5/15/19 12:28 AM, Dmitry Osipenko wrote:
> 10.05.2019 11:47, Joseph Lo =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Add the binding document for the external memory controller (EMC) which
>> communicates with external LPDDR4 devices. It includes the bindings of
>> the EMC node and a sub-node of EMC table which under the reserved memory
>> node. The EMC table contains the data of the rates that EMC supported.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>> v3:
>> - drop the bindings of EMC table
>> - add memory-region and reserved-memory node for EMC table
>> ---
>>   .../nvidia,tegra210-emc.txt                   | 55 +++++++++++++++++++
>>   1 file changed, 55 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/memory-controller=
s/nvidia,tegra210-emc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia=
,tegra210-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nv=
idia,tegra210-emc.txt
>> new file mode 100644
>> index 000000000000..d65aeef2329c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra2=
10-emc.txt
>> @@ -0,0 +1,55 @@
>> +NVIDIA Tegra210 SoC EMC (external memory controller)
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>> +
>> +Device node
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +Required properties :
>> +- compatible : should be "nvidia,tegra210-emc".
>> +- reg : physical base address and length of the controller's registers.
>> +- clocks : phandles of the possible source clocks.
>> +- clock-names : names of the possible source clocks.
>> +- interrupts : Should contain the EMC general interrupt.
>> +- memory-region : phandle to the reserved memory (see
>> +  Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt=
) which
>> +  contains a sub-node of EMC table.
>> +- nvidia,memory-controller : phandle of the memory controller.
>> +
>> +Reserved memory node
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +Should contain a sub-node of EMC table with required properties:
>> +- compatible : should be "nvidia,tegra210-emc-table".
>> +- reg : physical address and length of the location of EMC table.
>> +
>> +Example:
>> +	reserved-memory {
>> +		#address-cells =3D <2>;
>> +		#size-cells =3D <2>;
>> +		ranges;
>> +
>> +		emc_table: emc-table@8be00000 {
>> +			compatible =3D "nvidia,tegra210-emc-table";
>> +			reg =3D <0x0 0x8be00000 0x0 0x10000>;
>> +			status =3D "okay";
>> +		};
>=20
> You essentially moved the v1 binding into obscure and undocumented blob,
> ignoring previous review comments. This is a very odd move... please
> explain what is going on.
>=20

Discussed with Thierry offline which way we prefer to pass the EMC table=20
to the kernel. Some reasons below we decide to chose this one (via=20
binary blob).

- The EMC table is much bigger than the previous Tegra generations=20
(LPDDR4 v.s. LPDDR2/3). It's harder to settle in the review process. And=20
if there is a new fix of the table in the future, we'll need to go=20
through that again.
- Because it's LPDDR4 we want to support here, to support higher rates,=20
the devices have must be gone through the training process, which is=20
done in the firmware. Which means We already have the table somewhere in=20
the memory and kernel can just re-use that. No need to convert them back=20
to DT and pass to the kernel. This is much easier to maintain in the=20
future if there is something needs to fix.
- With the mechanism above, we don't need to maintain the huge EMC table=20
in the DT file like below.
http://patchwork.ozlabs.org/patch/1063886/
http://patchwork.ozlabs.org/patch/1063889/

And sorry, maybe it's not clear at that moment, but I did mention that=20
we want to go with the new method (via binary blob) in the previous review.
Please see http://patchwork.ozlabs.org/patch/1084467/

Thanks,
Joseph
