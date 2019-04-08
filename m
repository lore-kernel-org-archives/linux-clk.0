Return-Path: <SRS0=sViq=SK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA83C282CE
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 09:19:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D6E82146E
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 09:19:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="CtSL6cbI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfDHJTp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Apr 2019 05:19:45 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:1879 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbfDHJTp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Apr 2019 05:19:45 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cab12280009>; Mon, 08 Apr 2019 02:19:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 08 Apr 2019 02:19:32 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 08 Apr 2019 02:19:32 -0700
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 8 Apr
 2019 08:49:33 +0000
Subject: Re: [PATCH 1/8] dt-bindings: memory: tegra: Add Tegra210 EMC bindings
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20190325074523.26456-1-josephl@nvidia.com>
 <20190325074523.26456-2-josephl@nvidia.com>
 <6bd34a19-26e0-6bdd-ce89-4a30d35e9823@gmail.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <747a38f5-72f6-ff34-d2a1-4ba7ac7d8782@nvidia.com>
Date:   Mon, 8 Apr 2019 16:49:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6bd34a19-26e0-6bdd-ce89-4a30d35e9823@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1554715188; bh=1XoBnNH+perTvdC47iWonrwPZ2r9gdunstuUpGmkdpY=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=CtSL6cbIdSZIX2x+9BXi5xcuNJIJqUM3yq+kkHTkY9x04HZW0i7kmWrxVDnrP/pTa
         IfcQYrcG6fT0dC+MT7D8Ymx2zbOqY4bO0U1y0Manbte9QR+Jag8xqhu53p/qPPtrxJ
         q4AH8zXnpKRIAE7htUuSc60NwqE+ic2grHw9ud1d5YJGRErczaYT4a7ZJHTQcf6Sn/
         NsSY33msB+tWqT6J/xDppR4UgyUclgIGKt/2U1H4rOCuMPFuZymx1P0jkX4aQeXFCX
         U9KtB9GJVVb7kEq59ytWokZaA5kP3eWF7gn4gu/RGgMWRNtD0yewi+3Mo7Bssf+Oga
         bzfBrIflVG3yg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4/4/19 5:17 PM, Dmitry Osipenko wrote:
> 25.03.2019 10:45, Joseph Lo =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Add the binding document for the external memory controller (EMC) which
>> communicates with external LPDDR4 devices. It includes the bindings of
>> the EMC node and the EMC table of different rates.
>>
>> To support high rates for LPDDR4, the EMC table must be trained before
>> it can be used for runtime clock switching. It has been done by firmware
>> and merged to the table that Linux kernel uses. For backward
>> compatibility with the devices that had been launched on the market, lik=
e
>> Shield and Jetson platforms, the bindings in the EMC table should remain
>> the same. So the firmware can recognize them and merge the trained EMC
>> table for the kernel.
>>
>> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>>   .../nvidia,tegra210-emc.txt                   | 605 ++++++++++++++++++
>>   1 file changed, 605 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/memory-controller=
s/nvidia,tegra210-emc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia=
,tegra210-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nv=
idia,tegra210-emc.txt
>> new file mode 100644
>> index 000000000000..1f6b6df6d37b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra2=
10-emc.txt
>> @@ -0,0 +1,605 @@
>> +NVIDIA Tegra210 SoC EMC (external memory controller)
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>> +
>> +Required properties :
>> +- compatible : should be "nvidia,tegra21-emc", "nvidia,tegra210-emc".
>> +- reg : physical base address and length of the controller's registers.
>> +- clocks : phandles of the possible source clocks
>> +- clock-names : names of the possible source clocks
>> +- #address-cells : should be 1
>> +- #size-cells : should be 0
>> +- nvidia,memory-controller : phandle of the memory controller.
>> +- nvidia,use-ram-code : boolean, indicates whether we should use RAM_CO=
DE in
>> +		        the register to find matching emc-table nodes
>> +
>=20
> The "interrupts" property is missing. You could use the CLK handshake eve=
nt to wait for the clock rate change completion instead of polling the regi=
ster if you didn't rely on the downstream binding, see T20 driver for the e=
xample. BTW, I'm wondering if you're going to push other downstream binding=
s to upstream.. apparently EMC won't be the only binding that that could di=
verge from the upstream and then it's not obvious whether the locked-down v=
ariant of T210 is supportable by upstream at all.
>=20
Will add "interrupts" property. And yes by default, we don't use that=20
for Tegra210. Because it's in the middle of the scaling sequence for=20
checking the clock source change complete.

Thanks,
Joseph
