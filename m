Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B371BD9FF;
	Mon, 13 Jan 2025 12:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736770796; cv=pass; b=VjiD0YK2xfDv5jTL2IVCgYRTvy+v+7ZejBeebt3Ji28F7DaciCgmsjUvXCafE9FspOtyLWFf3t7CYC9i11nTj4JXXqSKUTwNFeZesVt3fX3Z3uwrpMRsNJWd345ERq+JQrb6Zt6VHidt8A3wEiSJnXpcPNJixBmgvcJfe7Ojhio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736770796; c=relaxed/simple;
	bh=Xl74J1MalzuceQrzY2ktCKG1QU8F4qFiY3UBLZmJjFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iZh4y18snQS+/IcZCFLwMm3nTonVCsnBuCCZt1IcDXwpA0fB+tW5ro/DSQA0at9kVaLK1z40N172lzEVqHh7EACSZleiqO3rn00IBK/xfiLlKSdWC6aoIhXkv/sHkF0jXQCr3NYxjBhQYVd5WMiHiscG63SJyJWUBIb1uhFCZYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=C/xhGw3G; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="C/xhGw3G"
ARC-Seal: i=1; a=rsa-sha256; t=1736770782; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GlmJnh0wJyDrDeO54WDVZREmrXSWXpTgiT2QRaS1g0lgjA7PKBt67+60Ksj4Sb7clUHCXmqdOao8SkEmMdI1dbfl6VQQOa6QJFN6SXxi8XstHhfhmw3UgNbmkbQxhbQYeJXLeBOR2tvWqpHzE2y4US9jZgGVpTXdtJmlXWhPecs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736770782; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yg980IXsItT1ob0TGMGNg+N1u7n0tXM7s7EHT8ZvaOE=; 
	b=EvW23UyJyUUYf2T87/6FrFBZkDk4HrTsi8CGOaBdUFmf+egYHU2aub0buO7ovDMo5D0A03xn0nzfr96YBmGzHNrymi+xJnyfbsLMzX0VftGaQIgyJlf49uI7A1kfmFpkTA21Z9DKxpIrQ1WxTLMHLZQfGwQslTT4v5t9hl0rS54=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736770782;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=yg980IXsItT1ob0TGMGNg+N1u7n0tXM7s7EHT8ZvaOE=;
	b=C/xhGw3Gdf0JU2WhUT6ycBFraS0/yQWo9mYI9JUP1Ap7bRSjybjmxF3RKMpzdZpK
	iKD0H6a25NJ4ACR6ouyx4gKMELMrnK4ax6Vf1jJup31GdQsIgKT+4A/Fq4NVQfC0RL2
	kDRoyGMli7GY0OGIKKEXLBGr9qXbmMzNT60XJmFk=
Received: by mx.zohomail.com with SMTPS id 173677077432099.51494040975774;
	Mon, 13 Jan 2025 04:19:34 -0800 (PST)
Message-ID: <a1386cfb-7698-43f6-acff-628d9626da47@zohomail.com>
Date: Mon, 13 Jan 2025 20:19:19 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] riscv: dts: canaan: Add clock initial support for
 K230
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com>
 <20250108-b4-k230-clk-v2-3-27b30a2ca52d@zohomail.com>
 <ebj26gfkaypgtvi7o2ab3mfvcgc7yk4scdoxroftlp7lnx3xix@p3nnfiva3hdm>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <ebj26gfkaypgtvi7o2ab3mfvcgc7yk4scdoxroftlp7lnx3xix@p3nnfiva3hdm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Feedback-ID: rr08011227102e394c4ece469786f9a63f0000268b6dc8886a4bdfe9cfcc1d7509dc8a729330385f8b10a251:zu08011227060641b058f7bd561e629be2000014ba64026e331fba48e2cc9e36c581def167ce43f42c3ee11c:rf0801122c06663dad68cb3878c535246800002ee0df51d8bf8a147c9dbba85400de34851e84c7c0c613b553fb57f1c3a7:ZohoMail
X-ZohoMailClient: External


On 2025/1/9 17:09, Krzysztof Kozlowski wrote:
> On Wed, Jan 08, 2025 at 07:53:09PM +0800, Xukai Wang wrote:
>> This patch provides basic support for the K230 clock, which does not
>> cover all clocks.
>>
>> The clock tree of the K230 SoC consists of OSC24M,
>> PLLs and sysclk.
>>
>> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
>> ---
>>  arch/riscv/boot/dts/canaan/k230.dtsi | 27 +++++++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
>> index 95c1a3d8fb1192e30113d96d3e96329545bc6ae7..c407471af3daac154e0fbdd377d57ea3ff4698e1 100644
>> --- a/arch/riscv/boot/dts/canaan/k230.dtsi
>> +++ b/arch/riscv/boot/dts/canaan/k230.dtsi
>> @@ -3,6 +3,7 @@
>>   * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
>>   */
>>  
>> +#include <dt-bindings/clock/k230-clk.h>
>>  #include <dt-bindings/interrupt-controller/irq.h>
>>  
>>  /dts-v1/;
>> @@ -65,6 +66,13 @@ apb_clk: apb-clk-clock {
>>  		#clock-cells = <0>;
>>  	};
>>  
>> +	osc24m: clock-24m {
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +		clock-frequency = <24000000>;
>> +		clock-output-names = "osc24m";
>> +	};
>> +
>>  	soc {
>>  		compatible = "simple-bus";
>>  		interrupt-parent = <&plic>;
>> @@ -138,5 +146,24 @@ uart4: serial@91404000 {
>>  			reg-shift = <2>;
>>  			status = "disabled";
>>  		};
>> +
>> +		sysclk: clock-controller@91100000 {
> Does not look like placed in correct order.
>
>> +			compatible = "canaan,k230-clk";
>> +			reg = <0x0 0x91102000 0x0 0x1000>, <0x0 0x91100000 0x0 0x1000>;
>> +			clocks = <&osc24m>;
>> +			#clock-cells = <1>;
>> +			clock-output-names =
> Unnecessary blank line
>
>> +			"CPU0_ACLK", "CPU0_PLIC", "CPU0_NOC_DDRCP4", "CPU0_PCLK",
> Messed indentation/alignment. See DTS coding style.

I've reorder the properties and changed the indentation:

osc24m: clock-24m {
        compatible = "fixed-clock";
        clock-frequency = <24000000>;
        clock-output-names = "osc24m";
        #clock-cells = <0>;
};

sysclk: clock-controller@91102000 {

        compatible = "canaan,k230-clk";
        reg = <0x0 0x91102000 0x0 0x1000>,
              <0x0 0x91100000 0x0 0x1000>;
        clocks = <&osc24m>;
        clock-output-names = "CPU0_ACLK", "CPU0_PLIC", "CPU0_NOC_DDRCP4",
                             "CPU0_PCLK", "PMU_PCLK", "HS_HCLK_HIGH_SRC",
                             "HS_HCLK_HIGH_GATE", "HS_HCLK_SRC",
                             "HS_SD0_HS_AHB_GAT", "HS_SD1_HS_AHB_GAT",
                             "HS_SSI1_HS_AHB_GA", "HS_SSI2_HS_AHB_GA",
                             "HS_USB0_HS_AHB_GA", "HS_USB1_HS_AHB_GA",
                             "HS_SSI0_AXI", "HS_SSI1", "HS_SSI2",
                             "HS_QSPI_AXI_SRC", "HS_SSI1_ACLK_GATE",
                             "HS_SSI2_ACLK_GATE", "HS_SD_CARD_SRC",
                             "HS_SD0_CARD_TX", "HS_SD1_CARD_TX",
                             "HS_SD_AXI_SRC", "HS_SD0_AXI_GATE",
                             "HS_SD1_AXI_GATE", "HS_SD0_BASE_GATE",
                             "HS_SD1_BASE_GATE", "HS_OSPI_SRC",
                             "HS_USB_REF_51M", "HS_SD_TIMER_SRC",
                             "HS_SD0_TIMER_GATE", "HS_SD1_TIMER_GATE",
                             "HS_USB0_REFERENCE", "HS_USB1_REFERENCE";
        #clock-cells = <1>;
};

Does this updated version looks appropriate？

>
> Best regards,
> Krzysztof
>
