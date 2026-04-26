Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38C823ED6A;
	Sun, 26 Apr 2026 15:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777218535; cv=pass; b=Qv8aKj5fGaFmWEhNe+XjVcUhhLWSFDDOEWKW4s1AoBNA0H2bIgT83X0Nvb5zlHZnw6UmotABpkVoTH0jZr2yWaHv3lQCnw25hYX+v9B42CKi9Ft/KhXx+XW2Bz0GZiySwniobgHdtqVA9UtGg1W+s05BGuO7LELtJ8XEvBrKTv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777218535; c=relaxed/simple;
	bh=yoYfzf58sRjZKrl8mS8TnVn4FWNBE4yMA33oFOMS0Yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mv9HTfuV5+g+ym3zKcC4PiKH1EbRG78lPK9XPbJkNaUlclG01lserXQ3H6n+mQPLZpB4tXXzD1/JgJLDvwf7DaptA/hZUoj7Zs4E75O9wKJhi2G4wyIfRCT6HAfxC3ZSVcCs4tJf0wBXnagc3b93yIqd1KCMxf6y8hDwkK0Ir/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=SKIFxUuY; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="SKIFxUuY"
ARC-Seal: i=1; a=rsa-sha256; t=1777218519; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JjibXD4sygWMo+Df6YqQusPH4UQWQxa0cfZ92AWP2cOIrfJjzWNZSGck5GXrBPUVFL6kXaaMKaLBcs0RJ8yI3POyONVfeosKmuO1iyd4A3WjssyY7FJ/qCxsgpC1Scn63Cs9etCAmKoyJxihlnbnCQOW370m/bNgfM8LBlItfwM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777218519; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ijb+gmFHkCxXaaFAPSl6qTeoZPHOS1bdIoKGk2/fFEQ=; 
	b=PH7LUDD7OTn9IqspVS8DnuazrrhOmvpEtGeugbQUf3hl7+XQR+iKC2I67vc2cqB5JhWV9h8h5u50/2GraCrKCLEQVI3M7v5EyIwH9+uHRHHbBlUeZmqokbmuXqBcIfhm30iel2QcF8hkshY4OlVFil961B2zDk5/w+q8PYGA7zk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777218519;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=Ijb+gmFHkCxXaaFAPSl6qTeoZPHOS1bdIoKGk2/fFEQ=;
	b=SKIFxUuYoBnyuJv7aUzdbDmNu8IIssTdNx2WpfupC7FoxuR8le/p4OK4bt1mGej9
	YSTKbh7HvQ0CGLld8haJbTyNQ1YPFQnclM7XrvqdZhDAEdZ3rNlLi84f5m0KAc5snqF
	5RO9d234fj3mq7kMUzPgR0ZlacvhBYrvjPzoyZAw=
Received: by mx.zohomail.com with SMTPS id 1777218517046578.5353745649002;
	Sun, 26 Apr 2026 08:48:37 -0700 (PDT)
Message-ID: <6e17bfeb-8cc6-4eca-8a94-983444aaef35@zohomail.com>
Date: Sun, 26 Apr 2026 23:48:28 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/3] riscv: canaan: Add support for K230 clock
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260425-b4-k230-clk-v12-0-7d5ced1f5da8@zohomail.com>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <20260425-b4-k230-clk-v12-0-7d5ced1f5da8@zohomail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Feedback-ID: zu08011227633b5f713e3a517a8598a0a9000010364e0b41babe00eb9193364f041af476389543d9a6119019:ZohoMail
X-Zoho-CM-AccountID: 2ee5dd3c83366259b2ba1e9826250ffebed1ef2dd213857d649ad25aba73b429
X-ZohoMailClient: External


On 2026/4/25 17:29, Xukai Wang wrote:
> This patch series adds clock controller support for the Canaan Kendryte
> K230 SoC. The K230 SoC includes an external 24MHz OSC, 4 internal
> PLLs and an external pulse input, with the controller managing these
> sources and their derived clocks.
>
> The clock tree and hardware-specific definition can be found in the
> vendor's DTS [1],
> and this series is based on the K230 initial series [2].
>
> Link: https://github.com/ruyisdk/linux-xuantie-kernel/blob/linux-6.6.36/arch/riscv/boot/dts/canaan/k230_clock_provider.dtsi [1]
> Link: https://lore.kernel.org/linux-clk/tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com/ [2]
>
> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
>
> ---
> Changes in v12:
> - Rebase onto linux-next (next-20260421).
> - Migrate from deprecated round_rate() clk_ops to determine_rate() API.
> - dt-bindings: Drop redundant "bindings for" in commit subject.
> - Link to v11: https://lore.kernel.org/r/20260214-b4-k230-clk-v11-0-6de365489b89@zohomail.com
Hi Stephen,

I hope this email finds you well. I am writing to politely inquire about
the status of the Canaan K230 clock controller driver patch series.

It has been approximately one and a half years since I first submitted
this series, and it has now reached version 12. Most of the intermediate
versions contained only minor adjustments and rebases, and I have been
resending it periodically without receiving any review feedback.

I would greatly appreciate it if you could let me know whether this
series is ready for merging, or if there are any specific issues that
need to be addressed. I am ready to make any required changes immediately.

I apologize for the intrusion and thank you for your time and hard work
maintaining the clock subsystem.
>
> Changes in v11:
> - Rename hs_hclk_high_src to hs_hclk_high and hs_hclk_src to hs_hclk.
> - Rebase base-commit to linux-next.
> - Update prerequisite-patch-id.
> - Link to v10: https://lore.kernel.org/r/20260116-b4-k230-clk-v10-0-de59033c5d30@zohomail.com
>
> Changes in v10:
> - Drop clock node: cpu1_apb_rate.
> - Rename hs_ospi_src to hs_ssi0.
> - Rename fixed clocks format in dts.
> - Fix missing clk member registration in driver.
> - Fix incorrect clk ID: k230_cpu1_src_rate → K230_CPU1_SRC_RATE.
> - Fix bit index of hs_hclk_src_gate: 1 → 0.
> - Add CLK_IS_CRITICAL to CPU-related gate clocks.
> - Update parent clocks: display_clkext_rate, sec_apb_gate, ai_axi_gate,
> cpu1_src_mux and hs_sd_card_src_rate.
> - Link to v9: https://lore.kernel.org/r/20251127-b4-k230-clk-v9-0-3aa09e17faf5@zohomail.com
>
> Changes in v9:
> - Rebase base-commit to v6.18-rc1
> - Simplified PLL field extraction with FIELD_GET() macro
> - Drop MODULE_DEVICE_TABLE for k230_clk_ids
> - Replace k230_clk_find_approximate_mul_div's step with
>   Rational_best_approximation
> - Reorder declaration and defination for clk_ops
> - Link to v8: https://lore.kernel.org/r/20250905-b4-k230-clk-v8-0-96caa02d5428@zohomail.com
>
> Changes in v8:
> - Rename dts node name "timer_pulse_in" to "clock-50m"
> - Drop redundant comment and 'minItems' of hardware in dt-binding.
> - Link to v7: https://lore.kernel.org/r/20250730-b4-k230-clk-v7-0-c57d3bb593d3@zohomail.com
>
> Changes in v7:
> - Rename K230_PLL_STATUS_MASK to K230_PLL_LOCK_STATUS_MASK
> - Add clkdev for PLLs to register lookup
> - Add macros to generate repeat variables definition
> - Refine the definitions of k230 clocks
> - Split composite clks into rate, gate, mux, fixed_factor clk
> - Replace k230_clk_hw_onecell_get with of_clk_hw_onecell_get for
>   clock provider
> - Drop k230_sysclk and use clk_mux, clk_gate and clk_fixed_factor
>   as the data structures.
> - Replace one loop registration with individual registration for
>   each type.
> - Link to v6: https://lore.kernel.org/r/20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com
>
> Changes in v6:
> - Remove some redundant comments in struct declaration.
> - Replace the Vendor's code source link with a new one.
> - Link to v5: https://lore.kernel.org/r/20250320-b4-k230-clk-v5-0-0e9d089c5488@zohomail.com
>
> Changes in v5:
> - Fix incorrect base-commit and add prerequisite-patch-id.
> - Replace dummy apb_clk with real ones for UARTs.
> - Add IDs of UARTs clock and DMA clocks in the binding header.
> - Replace k230_clk_cfgs[] array with corresponding named variables.
> - Remove some redundant checks in clk_ops.
> - Drop the unnecessary parenthesis and type casts.
> - Modify return value handling in probe path to avoid redundant print.
> - Link to v4: https://lore.kernel.org/r/20250217-b4-k230-clk-v4-0-5a95a3458691@zohomail.com
>
> Changes in v4:
> - Remove redundant onecell_get callback and add_provider function
> for pll_divs.
> - Modify the base-commit in cover letter.
> - Link to v3: https://lore.kernel.org/r/20250203-b4-k230-clk-v3-0-362c79124572@zohomail.com
>
> Changes in v3:
> - Reorder the defination and declaration in drivers code.
> - Reorder the properties in dts node.
> - Replace global variable `k230_sysclk` with dynamic memory allocation.
> - Rename the macro K230_NUM_CLKS to K230_CLK_NUM.
> - Use dev_err_probe for error handling.
> - Remove unused includes.
> - Link to v2: https://lore.kernel.org/r/20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com
>
> Changes in v2:
> - Add items and description.
> - Rename k230-clk.h to canaan,k230-clk.h
> - Link to v1: https://lore.kernel.org/r/20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com
>
> ---
> Xukai Wang (3):
>       dt-bindings: clock: Add Canaan K230 clock controller
>       clk: canaan: Add clock driver for Canaan K230
>       riscv: dts: canaan: Add clock definition for K230
>
>  .../devicetree/bindings/clock/canaan,k230-clk.yaml |   59 +
>  arch/riscv/boot/dts/canaan/k230-canmv.dts          |   11 +
>  arch/riscv/boot/dts/canaan/k230-evb.dts            |   11 +
>  arch/riscv/boot/dts/canaan/k230.dtsi               |   26 +-
>  drivers/clk/Kconfig                                |    6 +
>  drivers/clk/Makefile                               |    1 +
>  drivers/clk/clk-k230.c                             | 2452 ++++++++++++++++++++
>  include/dt-bindings/clock/canaan,k230-clk.h        |  220 ++
>  8 files changed, 2778 insertions(+), 8 deletions(-)
> ---
> base-commit: af98e93c5c39e6d0b87b42f0a32dd3066f795718
> change-id: 20241206-b4-k230-clk-925f33fed6c2
> prerequisite-patch-id: 9a2d01f55574b538dad572e193f81c44661f0853
>
> Best regards,
> --  
> Xukai Wang <kingxukai@zohomail.com>
>
-- 
Best regards,
Xukai Wang

