Return-Path: <SRS0=I40h=SR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B616C10F13
	for <linux-clk@archiver.kernel.org>; Mon, 15 Apr 2019 03:38:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB75A2084E
	for <linux-clk@archiver.kernel.org>; Mon, 15 Apr 2019 03:38:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="XB4ok9Fx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbfDODiV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 Apr 2019 23:38:21 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:2106 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbfDODiV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 14 Apr 2019 23:38:21 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cb3fcaf0001>; Sun, 14 Apr 2019 20:38:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 14 Apr 2019 20:38:18 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 14 Apr 2019 20:38:18 -0700
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 15 Apr
 2019 03:38:16 +0000
Subject: Re: [PATCH v2] dt-bindings: memory: tegra: Add external memory
 controller binding for Tegra210
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20190412080855.387-1-josephl@nvidia.com>
 <f2a98e09-07a6-c46d-0dee-b95995b58eae@gmail.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <025d807f-6f16-b8ec-2c9b-0c070a10743f@nvidia.com>
Date:   Mon, 15 Apr 2019 11:38:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f2a98e09-07a6-c46d-0dee-b95995b58eae@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1555299504; bh=6bSMpDiN41j+l+mZwCAd8nCM/vwnvuqw/8Z0BCPxcsQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=XB4ok9FxHsIiRMlnnlzMtXGvy4aRTIQRVc0d5Tw3PQCBFtGKS1mBrrsE9V+FJvodq
         4GhBUs07fiVq1LHXUcAG8Ixd9AtHCb1t+UiU39JQkVBFXuErLuLUgNP8UJaG6NT22X
         oNftIIjz6icggCX1Lz9ieGKFEyXxL7i2rQ5ND7l+IzqibR3bM2rGa1Ux2i8AC5QjlZ
         Q0x0WqdHR8jHfAdLhHWkt6CVYw9o6VVXchTWMnKmQChUAc/FGaCEJFmCGpmA1d5yjI
         pde5MZdRuSQ1w91pN9/R3erO+A1FAhIgnI9Vwxj+f5e+/vyMvNfxtcDRTvxsmQRbMd
         Gj0CGEmBlsO5Q==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4/14/19 10:11 PM, Dmitry Osipenko wrote:
> 12.04.2019 11:08, Joseph Lo =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Add the binding document for the external memory controller (EMC) which
>> communicates with external LPDDR4 devices. It includes the bindings of
>> the EMC node and the EMC table of different rates.
>>
>> To support high rates for LPDDR4, the EMC table must be trained before
>> it can be used for runtime clock switching. It has been done by firmware
>> and merged the training data to the table that the kernel can share the
>> result. So the bindings are used for both kernel and firmware.
>>
>> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>> This patch splits from the original patch set that supports EMC scaling
>> with binding document and drivers. Because the binding would be shared
>> by both firmware and kernel. We want to settle this first. Then we can
>> fix the kernel and firmware to support the same.
>=20
> Hello Joseph,
>=20
> Very nice to see that T210 will be able to get a non-alienated binding! I=
 have some comments, please see them below.

Thanks for your review.

>=20
>> Changes in v2:
>> * only use "tegra210" string in compatible string and remove the legacy
>>    "tegra21" string.
>> * clock-frequency -> fix the unit from kilohertz to hertz
>> * add "interrupts" property
>> * s/nvidia,emc-min-mv/nvidia,emc-min-millivolt/
>> * s/nvidia,gk20a-min-mv/nvidia,gk20a-min-millivolt/
>> * s/nvidia,source/clock-names/
>> * fix lots of properties that use underline to hyphen
>> * s/nvidia,emc-clock-latency-change/nvidia,emc-clock-latency-microsecond=
/
>> * add more information in the property descriptions
>> ---
>>   .../nvidia,tegra210-emc.txt                   | 614 ++++++++++++++++++
>>   1 file changed, 614 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/memory-controller=
s/nvidia,tegra210-emc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia=
,tegra210-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nv=
idia,tegra210-emc.txt
>> new file mode 100644
>> index 000000000000..318239c3c295
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra2=
10-emc.txt
>> @@ -0,0 +1,614 @@
>> +NVIDIA Tegra210 SoC EMC (external memory controller)
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>> +
>> +Required properties :
>> +- compatible : should be "nvidia,tegra210-emc".
>> +- reg : physical base address and length of the controller's registers.
>> +- clocks : phandles of the possible source clocks
>> +- clock-names : names of the possible source clocks
>> +- interrupts : Should contain the EMC general interrupt
>> +- #address-cells : should be 1
>> +- #size-cells : should be 0
>> +- nvidia,memory-controller : phandle of the memory controller.
>> +- nvidia,use-ram-code : boolean, indicates whether we should use RAM_CO=
DE in
>> +		        the register to find matching emc-table nodes
>> +
>> +The node should contain a "emc-table" subnode for each supported RAM ty=
pe
>> +(see field RAM_CODE in register APB_MISC_PP_STRAPPING_OPT_A), with its =
unit
>> +address being its RAM_CODE.
>> +
>> +Required properties for "emc-tables" nodes :
>> +- nvidia,ram-code : Should contain the value of RAM_CODE this timing se=
t is
>> +		    used for.
>> +
>> +Each "emc-tables" node should contain a "emc-table" subnode for every s=
upported
>> +EMC clock rate. The "emc-table" subnodes should have the clock rate in =
hertz as
>> +their unit address.
>> +
>> +Required properties for "emc-table" nodes :
>> +- compatible :  "nvidia,tegra210-emc-table"
>> +- nvidia,revision : revision of the parameter set used for this node. A=
ll
>> +                    nodes in the same "emc-table" should have the same =
revision
>> +- nvidia,dvfs-version : string for the DVFS version of this table
>=20
> What's the "DVFS version"? Sounds like some kind of software description =
to me. This is probably irrelevant for upstream.
Yes, you are right. Will remove this.

>=20
>> +- clock-frequency : frequency in hertz
>> +- clock-names : name of clock source to be used for this rate
>=20
> Please follow the T124 and move out everything clock-related to the clock=
-and-reset binding.
Will remove this property.

>=20
>> +- nvidia,emc-min-millivolt : minimum voltage in millivolt for this rate
>=20
> What about to move out the voltages description into OPP table?
>=20
>> +- nvidia,gk20a-min-millivolt : minimum GPU voltage in millivolt for thi=
s rate
>=20
Originally, the two properties above were designed for DVFS, which can=20
evaluate if the rate is available for the minimal voltage supplied.

Because we haven't support DVFS in upstream kernel yet, I will remove=20
both of the properties.

> Could you please explain why memory voltage depends on the GPU's? Is ther=
e any kind of electrical coupling in this case and thus this is a voltage r=
egulators coupling? >
> Is GPU-memory voltage dependency really could vary from board to board? I=
t looks to me that at maximum the dependency could vary between SoC SKU var=
iations and then this probably should be internal to the kernel.
>=20

For the GPU DVFS on Tegra210, it's controlled itself in the GPU driver,=20
like the DFLL support for the CPU. So fine to remove that.

>> +- nvidia,src-sel-reg : value of EMC CAR register to be used for this ra=
te
>> +- nvidia,needs-training : 1 if needs training at boot, 0 otherwise
>> +- nvidia,trained : 1 if initial training has been done by firmware, 0 o=
therwise
>> +- nvidia,periodic-training : 1 if needs periodic training, 0 otherwise
>> +- nvidia,trained-dram-clktree-c0d0u0 : training data word
>> +- nvidia,trained-dram-clktree-c0d0u1 : training data word
>> +- nvidia,trained-dram-clktree-c0d1u0 : training data word
>> +- nvidia,trained-dram-clktree-c0d1u1 : training data word
>> +- nvidia,trained-dram-clktree-c1d0u0 : training data word
>> +- nvidia,trained-dram-clktree-c1d0u1 : training data word
>> +- nvidia,trained-dram-clktree-c1d1u0 : training data word
>> +- nvidia,trained-dram-clktree-c1d1u1 : training data word
>> +- nvidia,current-dram-clktree-c0d0u0 : training data word
>> +- nvidia,current-dram-clktree-c0d0u1 : training data word
>> +- nvidia,current-dram-clktree-c0d1u0 : training data word
>> +- nvidia,current-dram-clktree-c0d1u1 : training data word
>> +- nvidia,current-dram-clktree-c1d0u0 : training data word
>> +- nvidia,current-dram-clktree-c1d0u1 : training data word
>> +- nvidia,current-dram-clktree-c1d1u0 : training data word
>> +- nvidia,current-dram-clktree-c1d1u1 : training data word
>=20
> So the "clktree" properties describe the clock properties, hence should b=
e in the clock-and-reset binding (clock's emc-timings table, see T124 for t=
he example). Same for the rest of clk-related properties below.

It's not really about the clock-and-reset. This is the timing data of=20
the DDR4 DRAM characteristic data after training. I think the=20
current-dram-clktree-* can be removed, only need to keep the trained=20
one. Will check.

>=20
>> +- nvidia,emc-burst-mc-regs : a 33 word array of the following registers
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
>> +- nvidia,emc-la-scale-regs : a 24 word array of the following registers
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
> Please move out everything MC-related to the MC binding.
>=20
Okay, will do.

Thanks,
Joseph
