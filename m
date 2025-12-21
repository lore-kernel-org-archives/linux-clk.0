Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91938003D;
	Sun, 21 Dec 2025 15:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766329766; cv=pass; b=LXdbCqHcT7iI0QaUjq+lN8HZOwtc9NdHtRi0FiNMqBxTXIVU+xrt36wMf7l/wQEQsjMdJzlB/LjKF+z4JR/pXZc+1jvTOiJMX0gi4GUfw11kNvjRbMp3QfIotqb7whCWoB1ZW7uFdkIV0opHBcq3aYU9EJZP97FDjVi3AhXlkoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766329766; c=relaxed/simple;
	bh=CdMIlybao4EMye4wO7C68HcPhsVrb7qluhHpYQK5HjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A/AQPqRmt9JrVLM3LL/1AjeeSKLA2UPpiChrUtV0CelHzB/rOP8y6yjD7e7T/oSv76+HeFc9piLMlporej8g0nkWd0+AJyxk+TtcG2AnzJOIwW26oSKEN8IVUd44iDaRat6kJe+4MN/mVyKr5a2isgQWXpodPMqSByrqjFSiMr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=KbcmyuSG; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="KbcmyuSG"
ARC-Seal: i=1; a=rsa-sha256; t=1766329740; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GCdIr7q++CZ1rnJO2UDv1Hs/4sS3X7ostA7dPNs3XLRw0oghG6bfNU98/8kHZp6962p13b5pFX9DFR36BuUORATVMwzjJnpQwWjr67nclcUUP4GIfol9M56HN1EmRkdOAf2BOxeF+ST0kBFdAkkEG7nc08A1K96RLzcfMbbJRvE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766329740; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UX0Ujw2PD/K2tYYP3yHJDgWY39Znwpjg+z+cHhIZ01Q=; 
	b=F4zFLvkcCQJ4t9ORemcG9vbE5miBoqhO8TqUBS9vv4QwJmOm1E/2x4k5tEsZWizbXzDAbC8l4PNX7qMXd2yoE9VEvSSI7MY0fjYyzT+s0DTQ7KUFxHCLxYLrzKwzl3qEfUaq+WAMhPAjyNfkHiJKCa6iIk1pBLI/fVO4c1+EZV8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766329740;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=UX0Ujw2PD/K2tYYP3yHJDgWY39Znwpjg+z+cHhIZ01Q=;
	b=KbcmyuSGXiOQ9JwvDhm55JQDIvuuUmkDGc70KEXgTpf2YdsKrLKS7cbTIlDa1wON
	kGD6A01mpgpKSlwK1YvAEctcgrH92OlrVp+fYvFSyUIkV5yOhUap+85PYXVBbFVNYG/
	1wPebABxJ/6BwT9LVmPGNDR0KGfBhzJcP9nmk5R4=
Received: by mx.zohomail.com with SMTPS id 1766329732031723.5314899504488;
	Sun, 21 Dec 2025 07:08:52 -0800 (PST)
Message-ID: <159615d3-cc52-43be-bf6d-5fe717ef1cc4@zohomail.com>
Date: Sun, 21 Dec 2025 23:08:32 +0800
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
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
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
Content-Transfer-Encoding: 8bit
Feedback-ID: rr080112272dacd3307bc12eb9efc14afb000030c0ea914924bd42e65f6f8bd29054d56c70272add6ef00a72:zu08011227952f7c85760f0a0815f8be44000025411d7b5419e31de20d2757fa5e43bee102f9986953eac086:rf0801122c48b7d601294da21e6fedbda600008d0ec30cf86e9c4eb95b2e97d86358f1eed49f07556fd17cc812a72020dc:ZohoMail
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
...
> Incorrect register bit setting (bit1) and wrong parent
> clock reference (hs_hclk_high_src_rate) for hs_hclk_src_gate,
> which does not comply with K230 hardware specifications.
> Here is correcting advice:
> Register bit correction: `0x18, 1, 0, 0,` -> `0x18, 0, 0, 0,`
You're right, thanks for the correction. The bit index should be 0, not 1.
> Parent clock correction: `&hs_hclk_high_src_rate.clk.hw` ->
> `&hs_hclk_high_gate.clk.hw`

According to the vendor's code [1], the parent clock of hs_hclk_src is
hs_hclk_high_src.

>
>> +K230_CLK_RATE_FORMAT(hs_hclk_src_rate,
>> +		     K230_HS_HCLK_SRC_RATE,
> ...
>> +K230_CLK_RATE_FORMAT(hs_sd_card_src_rate,
>> +		     K230_HS_SD_CARD_SRC_RATE,
>> +		     1, 1, 0, 0,
>> +		     2, 8, 12, 0x7,
>> +		     0x1C, 31, div, 0x0,
>> +		     false, 0,
>> +		     &pll0_div4.hw);
>> +
> The parent clock of hs_sd_card_src_rate is incorrectly pointed
> to pll0_div4.
> Here is correcting advice:
> `&pll0_div4.hw` → `&hs_sd_card_src_gate.clk.hw`
You're right, that's my mistake. Thanks for pointing it out.
>
>> +K230_CLK_GATE_FORMAT(hs_sd0_card_gate,
>> +		     K230_HS_SD0_CARD_GATE,
>> +		     0x18, 15, 0, 0,
> ...
>> +	},
>> +	.probe = k230_clk_probe,
>> +};
>> +builtin_platform_driver(k230_clk_driver);
>>
>> -- 
>> 2.34.1
>>
Link:

[1]
https://github.com/kendryte/k230_sdk/blob/main/src/little/linux/arch/riscv/boot/dts/kendryte/clock_provider.dtsi#L578

