Return-Path: <SRS0=OKLv=SD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597B3C43381
	for <linux-clk@archiver.kernel.org>; Mon,  1 Apr 2019 07:58:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2AF1420896
	for <linux-clk@archiver.kernel.org>; Mon,  1 Apr 2019 07:58:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="n4gxFkqC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732153AbfDAH6S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 Apr 2019 03:58:18 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:17346 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732023AbfDAH6S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 Apr 2019 03:58:18 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ca1c4900000>; Mon, 01 Apr 2019 00:58:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 01 Apr 2019 00:58:17 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 01 Apr 2019 00:58:17 -0700
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 1 Apr
 2019 07:58:15 +0000
Subject: Re: [PATCH 1/8] dt-bindings: memory: tegra: Add Tegra210 EMC bindings
To:     Rob Herring <robh@kernel.org>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20190325074523.26456-1-josephl@nvidia.com>
 <20190325074523.26456-2-josephl@nvidia.com>
 <5ca06133.1c69fb81.11ebf.91ce@mx.google.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <7d680700-d2f2-7b6c-a8bf-dca6d54dbf2c@nvidia.com>
Date:   Mon, 1 Apr 2019 15:57:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5ca06133.1c69fb81.11ebf.91ce@mx.google.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1554105488; bh=Ne3W1nC6+ARuBwjm/aw2rX3wxGd3JmSrSzxXwVkz5vY=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=n4gxFkqCVnBRLJxRuVSb/TIwhRiDEvs83Qkxnob252+/xCNkaqDe2UUFKyXGorOnF
         EPybmz6krO4jEpiEfh8QT1wMbvDiVzdpb/4u9pxBd3F3B1ZmZ1ZDUcSUDBGZRp5anP
         v84QOh5a8lBUf3x9NLDOzxdsZOQjZJxnxCh6o/TCtmuVAbWA9EPmwATEuL/Wbj1dR8
         73C9ilAsgojvX0oni4oYGLJHGrjqlZ+Q/7Ai6J4WpdmOeR+d3dQVWAhaVrhZUKOPzS
         k3ptdZInCpcfqiBd7wKa2PkVgY0deDpAntuzuMZTuLvagUj9XCwbWWan463ZJMmeCj
         oOO4Em34xgALw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 3/31/19 2:41 PM, Rob Herring wrote:
> On Mon, Mar 25, 2019 at 03:45:16PM +0800, Joseph Lo wrote:
>> Add the binding document for the external memory controller (EMC) which
>> communicates with external LPDDR4 devices. It includes the bindings of
>> the EMC node and the EMC table of different rates.
>>
>> To support high rates for LPDDR4, the EMC table must be trained before
>> it can be used for runtime clock switching. It has been done by firmware
>> and merged to the table that Linux kernel uses. For backward
>> compatibility with the devices that had been launched on the market, like
>> Shield and Jetson platforms, the bindings in the EMC table should remain
>> the same. So the firmware can recognize them and merge the trained EMC
>> table for the kernel.

Hi Rob,

Thanks for reviewing.

> 
> Overall seems pretty bloated. How much of this really varies by board
> vs. just being a dump of all the register values to stuff?

Most of them are register values. And by different SDRAM devices that 
could be used on the same platform (use ram code to identify them), the 
value could be different.

> 
> Primarily, I'm leary of getting a similar binding for every vendor's DDR
> setup.
> 
> Some mostly trivial comments follow.

Really sorry about that. I understand these basic rules for DT bindings, 
but the case here is that these un-reviewed bindings have been used in 
the firmware on the shipped products. To support the same with the 
upstream kernel and consider the firmware blob may not be updated, we 
have no choice to just use the same bindings in the upstream kernel.

How can we deal with this case?

> 
snip.
>> +Example:
>> +	external-memory-controller@7001b000 {
>> +		compatible = "nvidia,tegra21-emc", "nvidia,tegra210-emc";
>> +		reg = <0x0 0x7001b000 0x0 0x1000>,
>> +		      <0x0 0x7001e000 0x0 0x1000>,
>> +		      <0x0 0x7001f000 0x0 0x1000>;
>> +		clocks = <&tegra_car TEGRA210_CLK_EMC>,
>> +		         <&tegra_car TEGRA210_CLK_PLL_M>,
>> +			 <&tegra_car TEGRA210_CLK_PLL_C>,
>> +			 <&tegra_car TEGRA210_CLK_PLL_P>,
>> +			 <&tegra_car TEGRA210_CLK_CLK_M>,
>> +			 <&tegra_car TEGRA210_CLK_PLL_M_UD>,
>> +			 <&tegra_car TEGRA210_CLK_PLL_MB_UD>,
>> +			 <&tegra_car TEGRA210_CLK_PLL_MB>,
>> +			 <&tegra_car TEGRA210_CLK_PLL_P_UD>;
>> +		clock-names = "emc", "pll_m", "pll_c", "pll_p", "clk_m",
>> +			      "pll_m_ud", "pll_mb_ud", "pll_mb", "pll_p_ud";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		nvidia,memory-controller = <&mc>;
>> +		nvidia,use-ram-code;
>> +
>> +		emc-table@0 {
> 
> Unit address without reg is not valid.
> 
>> +			nvidia,ram-code = <0>;
>> +			emc-table@40800 {
> 
> And here.
> 

Will fix this.
Thanks,
Joseph

>> +				compatible = "nvidia,tegra21-emc-table";
>> +				...
>> +			};
>> +			emc-table@204000 {
>> +				...
>> +			};
>> +			...
>> +		};
>> +
>> +		emc-table@1 {
>> +			nvidia,ram-code = <1>;
>> +			emc-table@40800 {
>> +				compatible = "nvidia,tegra21-emc-table";
>> +				...
>> +			};
>> +			emc-table@204000 {
>> +				...
>> +			};
>> +			...
>> +		};
>> +	};
>> -- 
>> 2.21.0
>>
> 
