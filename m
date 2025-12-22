Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE265477E;
	Mon, 22 Dec 2025 04:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766376098; cv=pass; b=NiKt8rlE1eXZYHviQAyrRBky0Iz+2Z4MJ+qgp9lbf5b27pcyt0sEqsF7e9uDj8DWBveBTYuHNili3cmZti+SugfVzVP8STGWtfXgNRR19CwBcoHsw7wVugi9KqZ7+1e8fDoL5BHFWBjIKP1+jbthRWvAILDPLgTbNphc7UAgqGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766376098; c=relaxed/simple;
	bh=NPgPMuiYKDXuB0iGuLyQTO8dWLMcvG4uWs2/KeMN6ho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RmKPMwnP/0d1uGK01XYrRhP1+tWBNzi9DDFKfTPZlZyzWWe9ZJOajJAAnKSKzAcBjoQl7eI4qbSFfdE0SG4QzKuSCYMnXmf559Lh4HqXy3BMaxIvQ+BWuHwqc0ypwACm6ljQ3yEksT2toHFXfmqewGdFLzDNIMS46Vwe8ObvfAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=XrLqBu3G; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="XrLqBu3G"
ARC-Seal: i=1; a=rsa-sha256; t=1766376071; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jJTQzpISHipMt3HLUpoJRYGm/IKIVJaBVnxnj6e3DoDi0oj64OvULk5kXub9IJDC1MvZGH2GkyomLe3KTKjGhftmv9sA8uagKf4qEMoewurIaOJwfHCPg02Sy6JDB8EOkCnWZ91akI80I+9Aj/6JkWLXApOeV2QZIEtoAacFfJk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766376071; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oBEFJoFmTU+vEOGTCKO2z7+KnNU8YcaoRn4bK/FMXBA=; 
	b=PM24BrMntV095i2mdbSWntFpBirgJ+WNLRytUnPc6i+WNHoAnUlRHQxuh7GNR81ZEgy+7Xte+LW6zyPW3abYOU4eTO/R3FI8Tvzab/K+IOwW33LyjP5Ar/H0aZvFODMlaMq/AwFh7tYnR5gVh+EzV19Xko3FYZgeyBuX6tjBRGs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766376071;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=oBEFJoFmTU+vEOGTCKO2z7+KnNU8YcaoRn4bK/FMXBA=;
	b=XrLqBu3GKd7xwRUNBXGIgRrVx9VyGq3ZdnSbfyUzbsn8Yv04FT9eIYQ5U7b3VHhj
	ef+innxJTCFYfqmcN+L7cGlAYWxtXOrsrOLpl02PpH4bHPr/TTMSKfTnYCwai+AhI49
	DVRuEW2vv61xxYT5JyNbrbk7/etKuN0v2H/CwZHg=
Received: by mx.zohomail.com with SMTPS id 176637606573635.396960694368545;
	Sun, 21 Dec 2025 20:01:05 -0800 (PST)
Message-ID: <6e03598a-e64b-4967-8f89-f50bde9b830d@zohomail.com>
Date: Mon, 22 Dec 2025 12:00:51 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] clk: canaan: Add clock driver for Canaan K230
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20251127-b4-k230-clk-v9-0-3aa09e17faf5@zohomail.com>
 <20251127-b4-k230-clk-v9-2-3aa09e17faf5@zohomail.com>
 <aUUGeGnYR+joVR8c@duge-virtual-machine>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <aUUGeGnYR+joVR8c@duge-virtual-machine>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Feedback-ID: rr080112273b93726cead76ead8813bb2200003d9a5c6b4d17009bff3a7becc08ab060c66a7138e180c948a9:zu0801122720c840063080d6e6cf514a4d0000b0bee724e5468a7038436aafd3691ee76d6ad180dd2795d4b6:rf0801122c96364ed9249f1d3ec01a3c4c00000e250bc758d4aea3154b9aed0c14b3444959420cab0c2037f289276a2cfc:ZohoMail
X-ZohoMailClient: External


On 2025/12/19 16:02, Jiayu Du wrote:
> On Thu, Nov 27, 2025 at 08:45:13PM +0800, Xukai Wang wrote:
>> This patch provides basic support for the K230 clock, which covers
>> all clocks in K230 SoC.
>>
>> The clock tree of the K230 SoC consists of a 24MHZ external crystal
>> oscillator, PLLs and an external pulse input for timerX, and their
>> derived clocks.
>>
>> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
>> ---
>>  drivers/clk/Kconfig    |    6 +
>>  drivers/clk/Makefile   |    1 +
>>  drivers/clk/clk-k230.c | 2443 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 2450 insertions(+)
> ...
>> diff --git a/drivers/clk/clk-k230.c b/drivers/clk/clk-k230.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..8750e9cbac04f30e31d8f2eb395c9b49027ca278
>> --- /dev/null
>> +++ b/drivers/clk/clk-k230.c
>> @@ -0,0 +1,2443 @@
> ...
>> +
>> +K230_CLK_GATE_FORMAT(cpu0_src_gate,
>> +		     K230_CPU0_SRC_GATE,
>> +		     0, 0, 0, 0,
>> +		     &pll0_div2.hw);
> Core-related clocks of cpu0/cpu1 (src/plic/apb/noc_ddrcp4, etc.)
> lack protection flags, which risks accidental disabling.
>
> Recommend to replace the flag bits for all CPU0/CPU1 core clock
> nodes with `CLK_IS_CRITICAL`,like this:
> `0, 0, 0, 0,` -> `0, 0, CLK_IS_CRITICAL, 0,`
>
>> +
>> +K230_CLK_RATE_FORMAT(cpu0_src_rate,
>> +		     K230_CPU0_SRC_RATE,
>> +		     1, 16, 1, 0xF,
>> +		     16, 16, 0, 0x0,
>> +		     0x0, 31, mul, 0x0,
>> +		     false, 0,
>> +		     &cpu0_src_gate.clk.hw);
>> +
> same as above,`false, 0,` ->`false, CLK_IS_CRITICAL,`
>> +K230_CLK_RATE_FORMAT(cpu0_axi_rate,
>> +		     K230_CPU0_AXI_RATE,
>> +		     1, 1, 0, 0,
>> +		     1, 8, 6, 0x7,
>> +		     0x0, 31, div, 0x0,
>> +		     0, 0,
>> +		     &cpu0_src_rate.clk.hw);
>> +
> same as above,`0, 0,` ->`0, CLK_IS_CRITICAL,`
>> +K230_CLK_GATE_FORMAT(cpu0_plic_gate,
>> +		     K230_CPU0_PLIC_GATE,
>> +		     0x0, 9, 0, 0,
>> +		     &cpu0_src_rate.clk.hw);
>> +
> same as above,`0x0, 9, 0, 0,` -> `0x0, 9, CLK_IS_CRITICAL, 0,`
>> +K230_CLK_RATE_FORMAT(cpu0_plic_rate,
>> +		     K230_CPU0_PLIC_RATE,
>> +		     1, 1, 0, 0,
>> +		     1, 8, 10, 0x7,
>> +		     0x0, 31, div, 0x0,
>> +		     false, 0,
>> +		     &cpu0_plic_gate.clk.hw);
>> +
> same as above,`false, 0,` -> `false, CLK_IS_CRITICAL,`
>> +K230_CLK_GATE_FORMAT(cpu0_noc_ddrcp4_gate,
>> +		     K230_CPU0_NOC_DDRCP4_GATE,
>> +		     0x60, 7, 0, 0,
>> +		     &cpu0_src_rate.clk.hw);
>> +
> same as above,`0x60, 7, 0, 0,` -> `0x60, 7, CLK_IS_CRITICAL, 0,`
>> +K230_CLK_GATE_FORMAT(cpu0_apb_gate,
>> +		     K230_CPU0_APB_GATE,
>> +		     0x0, 13, 0, 0,
>> +		     &pll0_div4.hw);
>> +
> same as above,`0x0, 13, 0, 0,` -> `0x0, 13, CLK_IS_CRITICAL, 0,`
>> +K230_CLK_RATE_FORMAT(cpu0_apb_rate,
>> +		     K230_CPU0_APB_RATE,
>> +		     1, 1, 0, 0,
>> +		     1, 8, 15, 0x7,
>> +		     0x0, 31, div, 0x0,
>> +		     false, 0,
>> +		     &cpu0_apb_gate.clk.hw);
>> +
> same as above,`false, 0,` -> `false, CLK_IS_CRITICAL,`
>> +static const struct clk_parent_data k230_cpu1_src_mux_pdata[] = {
>> +	{ .hw = &pll0_div2.hw, },
>> +	{ .hw = &pll3.hw, },
>> +	{ .hw = &pll0.hw, },
>> +};
>> +
>> +K230_CLK_MUX_FORMAT(cpu1_src_mux,
>> +		    K230_CPU1_SRC_MUX,
>> +		    0x4, 1, 0x3,
>> +		    0, 0,
>> +		    k230_cpu1_src_mux_pdata);
>> +
> same as above,`0, 0,` -> `CLK_IS_CRITICAL, 0,`
>> +K230_CLK_GATE_FORMAT(cpu1_src_gate,
>> +		     K230_CPU1_SRC_GATE,
>> +		     0x4, 0, CLK_IGNORE_UNUSED, 0,
>> +		     &cpu1_src_mux.clk.hw);
>> +
> same as above,`0x4, 0, CLK_IGNORE_UNUSED, 0,` -> `0x4, 0, CLK_IS_CRITICAL, 0,`
>> +K230_CLK_RATE_FORMAT(cpu1_src_rate,
>> +		     K230_CPU1_SRC_GATE,
>> +		     1, 1, 0, 0,
>> +		     1, 8, 3, 0x7,
>> +		     0x4, 31, div, 0x0,
>> +		     false, 0,
>> +		     &cpu1_src_gate.clk.hw);
>> +
> same as above,`false, 0,` -> `false, CLK_IS_CRITICAL,`
>> +K230_CLK_RATE_FORMAT(cpu1_axi_rate,
>> +		     K230_CPU1_AXI_RATE,
>> +		     1, 1, 0, 0,
>> +		     1, 8, 12, 0x7,
>> +		     0x4, 31, div, 0x0,
>> +		     false, 0,
>> +		     &cpu1_src_rate.clk.hw);
>> +
> same as above,`false, 0,` -> `false, CLK_IS_CRITICAL,`
>> +K230_CLK_GATE_FORMAT(cpu1_plic_gate,
>> +		     K230_CPU1_PLIC_GATE,
>> +		     0x4, 15, CLK_IGNORE_UNUSED, 0,
>> +		     &cpu1_src_rate.clk.hw);
>> +
> same as above,`0x4, 15, CLK_IGNORE_UNUSED, 0,` -> `0x4, 15, CLK_IS_CRITICAL, 0,`
>> +K230_CLK_RATE_FORMAT(cpu1_plic_rate,
>> +		     K230_CPU1_PLIC_RATE,
>> +		     1, 1, 0, 0,
>> +		     1, 8, 16, 0x7,
>> +		     0x4, 31, div, 0x0,
>> +		     false, 0,
>> +		     &cpu1_plic_gate.clk.hw);
>> +
> same as above,`false, 0,` -> `false, CLK_IS_CRITICAL,`
>> +K230_CLK_GATE_FORMAT(cpu1_apb_gate,
>> +		     K230_CPU1_APB_GATE,
>> +		     0x4, 19, 0, 0,
>> +		     &pll0_div4.hw);
>> +
> same as above,`0x4, 19, 0, 0,` -> `0x4, 19, CLK_IS_CRITICAL, 0,`
>> +K230_CLK_RATE_FORMAT(cpu1_apb_rate,
>> +		     K230_CPU1_APB_RATE,
>> +		     1, 1, 0, 0,
>> +		     1, 8, 15, 0x7,
>> +		     0x0, 31, div, 0x0,
>> +		     false, 0,
>> +		     &cpu1_apb_gate.clk.hw);
>> +
> same as above,`false, 0,` -> `false, CLK_IS_CRITICAL,`
Thanks for the recommendation. I'll add the CLK_IS_CRITICAL flag to all
clk_gate clocks for CPU-related clocks, but not to the rate clocks, as
they don't need this flag.
