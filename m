Return-Path: <SRS0=qU15=SE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9061DC43381
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 02:27:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F1992070D
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 02:27:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="DSEbYY15"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728761AbfDBC1B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 Apr 2019 22:27:01 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14422 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727527AbfDBC1A (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 Apr 2019 22:27:00 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ca2c8760001>; Mon, 01 Apr 2019 19:27:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 01 Apr 2019 19:26:59 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 01 Apr 2019 19:26:59 -0700
Received: from [10.19.108.132] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Apr
 2019 02:26:56 +0000
Subject: Re: [PATCH 1/8] dt-bindings: memory: tegra: Add Tegra210 EMC bindings
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20190325074523.26456-1-josephl@nvidia.com>
 <20190325074523.26456-2-josephl@nvidia.com>
 <dab337a7-195c-d03f-8b3a-bccf08b23d70@gmail.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <d77f1605-a499-81af-bb14-aeaa0e083cff@nvidia.com>
Date:   Tue, 2 Apr 2019 10:26:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <dab337a7-195c-d03f-8b3a-bccf08b23d70@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1554172022; bh=LUfaYzYsmpraUdDq85IwrWfAcZk4ZWVfKtXn0gDs958=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=DSEbYY15D0jOKdtysS2BSYwvyfAU7TlP76onXqmGIYM6wUV1GO1tbaCFysCaZBDjR
         G22IODs8CwN5UsNDyGkkX+4x7gJAciWIGzBayM9yqb/paXeqJoysPHLRk0EW0TyTz5
         3R0vJ3grdZlD/y3QkUHxkGfrPOzMsD0+ht6t2wXI+wW/kEcxN4AsV3WEDrkmwgUOA0
         KGNK8vQW8ukpVmU2TiuEbHAu9XJCr2wuFWaoIowCE/X9/o0jhn6QW7IrNnzSBlatxp
         3tdPxNiWJ/61BTr/OVqNdvPh6zGLvsvPSwsTN/E6i9x5a2ZlD2Of+C16XEAGaj/lYN
         brrSn0XsAgOXw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4/1/19 8:12 PM, Dmitry Osipenko wrote:
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
snip
>> +- nvidia,emc-training-mod-regs :
>> +- nvidia,emc-save-restore-mod-regs :
>> +	deprecated, keep for for backward compatibility
>=20
> This is a new binding, so.. backward compatibility with what? Some old ve=
rsion of downstream bootloader? Do you really need it?
>=20
Yes, backward compatibility for the firmware that helps to do the=20
initial DDR4 training before we can use that. Although the kernel=20
doesn't use that for EMC scaling, the firmware still uses these bindings=20
and updates them.

>> +- nvidia,emc-burst-mc-regs : values for the following registers
>> +			     (See TRM 18.10.1 for register descriptions)
>> +	MC_EMEM_ARB_CFG
>> +	MC_EMEM_ARB_OUTSTANDING_REQ
>> +	MC_EMEM_ARB_REFPB_HP_CTRL
>> +	MC_EMEM_ARB_REFPB_BANK_CTRL
>> +	MC_EMEM_ARB_TIMING_RCD
>> +	MC_EMEM_ARB_TIMING_RP
>> +	MC_EMEM_ARB_TIMING_RC
>> +	MC_EMEM_ARB_TIMING_RAS
>> +	MC_EMEM_ARB_TIMING_FAW
>> +	MC_EMEM_ARB_TIMING_RRD
>> +	MC_EMEM_ARB_TIMING_RAP2PRE
>> +	MC_EMEM_ARB_TIMING_WAP2PRE
>> +	MC_EMEM_ARB_TIMING_R2R
>> +	MC_EMEM_ARB_TIMING_W2W
>> +	MC_EMEM_ARB_TIMING_R2W
>> +	MC_EMEM_ARB_TIMING_CCDMW
>> +	MC_EMEM_ARB_TIMING_W2R
>> +	MC_EMEM_ARB_TIMING_RFCPB
>> +	MC_EMEM_ARB_DA_TURNS
>> +	MC_EMEM_ARB_DA_COVERS
>> +	MC_EMEM_ARB_MISC0
>> +	MC_EMEM_ARB_MISC1
>> +	MC_EMEM_ARB_MISC2
>> +	MC_EMEM_ARB_RING1_THROTTLE
>> +	MC_EMEM_ARB_DHYST_CTRL
>> +	MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_0
>> +	MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_1
>> +	MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_2
>> +	MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_3
>> +	MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_4
>> +	MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_5
>> +	MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_6
>> +	MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_7
>> +- nvidia,emc-la-scale-regs : values for the following registers
>> +			     (See TRM 18.10.1 for register descriptions)
>> +	MC_MLL_MPCORER_PTSA_RATE
>> +	MC_FTOP_PTSA_RATE
>> +	MC_PTSA_GRANT_DECREMENT
>> +	MC_LATENCY_ALLOWANCE_XUSB_0
>> +	MC_LATENCY_ALLOWANCE_XUSB_1
>> +	MC_LATENCY_ALLOWANCE_TSEC_0
>> +	MC_LATENCY_ALLOWANCE_SDMMCA_0
>> +	MC_LATENCY_ALLOWANCE_SDMMCAA_0
>> +	MC_LATENCY_ALLOWANCE_SDMMC_0
>> +	MC_LATENCY_ALLOWANCE_SDMMCAB_0
>> +	MC_LATENCY_ALLOWANCE_PPCS_0
>> +	MC_LATENCY_ALLOWANCE_PPCS_1
>> +	MC_LATENCY_ALLOWANCE_MPCORE_0
>> +	MC_LATENCY_ALLOWANCE_HC_0
>> +	MC_LATENCY_ALLOWANCE_HC_1
>> +	MC_LATENCY_ALLOWANCE_AVPC_0
>> +	MC_LATENCY_ALLOWANCE_GPU_0
>> +	MC_LATENCY_ALLOWANCE_GPU2_0
>> +	MC_LATENCY_ALLOWANCE_NVENC_0
>> +	MC_LATENCY_ALLOWANCE_NVDEC_0
>> +	MC_LATENCY_ALLOWANCE_VIC_0
>> +	MC_LATENCY_ALLOWANCE_VI2_0
>> +	MC_LATENCY_ALLOWANCE_ISP2_0
>> +	MC_LATENCY_ALLOWANCE_ISP2_1
>=20
> Shouldn't this be a part of a "Memory Controller" binding like it is done=
 for T124?
>=20

The Tegra SoCs before Tegra132 only supports DDR3 or DDR2. The EMC table=20
doesn't include the settings of latency allowance registers. For the=20
DDR4 support on Tegra210, we will dynamically scale these latency=20
allowance registers as well to support faster clock rate. So the=20
arbitration can be adapted according to the rate switching.

And the EMC scaling sequence for DDR3 and DDR4 is quite different. So=20
the EMC scaling sequence for Tegra124 cannot be used for Tegra210. Same=20
as the EMC table bindings.

Thanks,
Joseph
