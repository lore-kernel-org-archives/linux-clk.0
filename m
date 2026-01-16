Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D49C1F63CD;
	Fri, 16 Jan 2026 13:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570088; cv=pass; b=LN0omAboXp08cRNtUO2xxD0zIxpb51pEViFKvVUH7B8a/NWnUR0HaMzPk+SaletEpMPEDVEJ4cU8aVRskmKMKG714F35nv1NKFxhxZbHIkhZKfCGO6AevWH7ZsDwvB8g7m+aUiIWwZK0BxaupbYAdkQx91LzpSXnrlETY7IlI+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570088; c=relaxed/simple;
	bh=+PiQDPUP0SdOHv2iNOrbB1q5WwlZxKbvHdqu3JEABbM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O3MG2eiySbJqGFBM41IvAiJg3UxNl4lnZRNiol7cyaaqqVZQx0KNL1cor58+tmFJI91tDjal9QsobR4PWq0Q8vaw897IvETe9EpjIKkMPeW9BJN78ZrEQoktC1l/PGCLdtoh7tJlymayezEH1vmKFexTt6JE8efSjRf617Pg/1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=X91oc/ot; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="X91oc/ot"
ARC-Seal: i=1; a=rsa-sha256; t=1768570046; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MW4TShP6D87B6mlJvYWRor7UJfzM/WZ9MOtTYWHc3iMhW2daHa3YNpLfbxCGqqS9JQ0FmdkBLA84Q9s0CuDWpwns98FmmuT58ilaD7ew74GpZL6itw/tYg5n1YieMldOX52Scome0O7mFIr74stSNCFF41qZv4tGawqlXW00C0c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768570046; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DLGG1fTG56kneP3ZvhpcTVXNWuTPcfoKprdvQhYRYb0=; 
	b=M3oUQHRmHw/RMNZP3gqi+LIt6vIxN34pakzUXmRQFWdQNvJ1ZGndNHp5mxB+T1H0TlJ6nfRkrYUHu9ae6S+6MlSo0cpqLhheItVLzldqKp+P4uIrb9u49NaaM8znJeGO3ChXinljWDYOYXq1cJef2KIwsLj/Nt0egYTRaKVWaA0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768570046;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=DLGG1fTG56kneP3ZvhpcTVXNWuTPcfoKprdvQhYRYb0=;
	b=X91oc/otvByUhGfgVwQWwm0gzmYkcomlB7uZ1oSuHOwxRa5YbS2935+6qe9fyLL1
	rZYvJr8IaPkcIJ9WLsNXI4ZhOCVe3EDrfk0Bgzlocw+8XQsbd2kozGtnIgur1hg9I1n
	AYGjCtdQTu61/4deOsVww+g3mKow5BdaG1MolAJ0=
Received: by mx.zohomail.com with SMTPS id 1768570039679419.2090071205788;
	Fri, 16 Jan 2026 05:27:19 -0800 (PST)
From: Xukai Wang <kingxukai@zohomail.com>
Subject: [PATCH v10 0/3] riscv: canaan: Add support for K230 clock
Date: Fri, 16 Jan 2026 21:26:18 +0800
Message-Id: <20260116-b4-k230-clk-v10-0-de59033c5d30@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHo8amkC/3XSwXLbIBAG4Ffx6Fx1YJdlwae+R6aH1QK1JnGUS
 o6nbcbvXuS0dSSrOglGH/8P4q2Z8tjnqdnv3poxn/upH57rwJpPu0YP8vwtt32qEw0YcBaMbzv
 XPgKaVp8e2whUEEtOXqGp4mXMpf9xXe7h6/t4zN9f66qn98mmkym3OhyP/Wm/Qwnem8AhYCwiq
 XPFik+JQdFyVJsKeQ58XVpOeqhd9ruUk6A6hmLqU0pyRlNFWnzCjjIkTsJJm7nBoZ9Ow/jzur8
 zXiv82QkvdnLGtr50NZVsCJn5y6/hMBylf/pc284FKiNjAe5ZVwoTiUYtus3A4D1DD8rRgiOGJ
 ZuLn92HstYtuavcqokqvkMX5D+plu8ZSSRBR8FHu5FqP6RCXHJbOYCVaDkHk9MGh7+8HpUJSw4
 z5w6NgArBFqcbx/WRUeXsQqqnAQEzbu8Zwdwzk2MyISq5EDZS/S3VWVpyP6eWFGJxwPWDDc43z
 rhK5/lWEdd72VHEhBs83Hg0q/RQefQqYiCRg63y8R+3Flb/O863rOKYLRcptOKXy+U3GpqnFAA
 EAAA=
X-Change-ID: 20241206-b4-k230-clk-925f33fed6c2
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xukai Wang <kingxukai@zohomail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Troy Mitchell <TroyMitchell988@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
Feedback-ID: rr080112270fd96f9d29ac845b275e41ca00009f830f776511f8ab3726c700ecc89220c40ab2598296a89876:zu08011227f18d624a5c736ce88c3c42a3000082b396b04e389bcde4d169d16dbcc95ae21d018734df5173a2:rf0801122d4d9111ca42d76863efaad8ea000028aa164f7e4144a78b8189821bd9ef66300b43cbce44227bdd9a2916f649c0:ZohoMail
X-ZohoMailClient: External

This patch series adds clock controller support for the Canaan Kendryte
K230 SoC. The K230 SoC includes an external 24MHz OSC, 4 internal
PLLs and an external pulse input, with the controller managing these
sources and their derived clocks.

The clock tree and hardware-specific definition can be found in the
vendor's DTS [1],
and this series is based on the K230 initial series [2].

Link: https://github.com/ruyisdk/linux-xuantie-kernel/blob/linux-6.6.36/arch/riscv/boot/dts/canaan/k230_clock_provider.dtsi [1]
Link: https://lore.kernel.org/linux-clk/tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com/ [2]

Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Xukai Wang <kingxukai@zohomail.com>

---
Changes in v10:
- Drop clock node: cpu1_apb_rate.
- Rename hs_ospi_src to hs_ssi0.
- Rename fixed clocks format in dts.
- Fix missing clk member registration in driver.
- Fix incorrect clk ID: k230_cpu1_src_rate → K230_CPU1_SRC_RATE.
- Fix bit index of hs_hclk_src_gate: 1 → 0.
- Add CLK_IS_CRITICAL to CPU-related gate clocks.
- Update parent clocks: display_clkext_rate, sec_apb_gate, ai_axi_gate,
cpu1_src_mux and hs_sd_card_src_rate.
- Link to v9: https://lore.kernel.org/r/20251127-b4-k230-clk-v9-0-3aa09e17faf5@zohomail.com

Changes in v9:
- Rebase base-commit to v6.18-rc1
- Simplified PLL field extraction with FIELD_GET() macro
- Drop MODULE_DEVICE_TABLE for k230_clk_ids
- Replace k230_clk_find_approximate_mul_div's step with
  Rational_best_approximation
- Reorder declaration and defination for clk_ops
- Link to v8: https://lore.kernel.org/r/20250905-b4-k230-clk-v8-0-96caa02d5428@zohomail.com

Changes in v8:
- Rename dts node name "timer_pulse_in" to "clock-50m"
- Drop redundant comment and 'minItems' of hardware in dt-binding.
- Link to v7: https://lore.kernel.org/r/20250730-b4-k230-clk-v7-0-c57d3bb593d3@zohomail.com

Changes in v7:
- Rename K230_PLL_STATUS_MASK to K230_PLL_LOCK_STATUS_MASK
- Add clkdev for PLLs to register lookup
- Add macros to generate repeat variables definition
- Refine the definitions of k230 clocks
- Split composite clks into rate, gate, mux, fixed_factor clk
- Replace k230_clk_hw_onecell_get with of_clk_hw_onecell_get for
  clock provider
- Drop k230_sysclk and use clk_mux, clk_gate and clk_fixed_factor
  as the data structures.
- Replace one loop registration with individual registration for
  each type.
- Link to v6: https://lore.kernel.org/r/20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com

Changes in v6:
- Remove some redundant comments in struct declaration.
- Replace the Vendor's code source link with a new one.
- Link to v5: https://lore.kernel.org/r/20250320-b4-k230-clk-v5-0-0e9d089c5488@zohomail.com

Changes in v5:
- Fix incorrect base-commit and add prerequisite-patch-id.
- Replace dummy apb_clk with real ones for UARTs.
- Add IDs of UARTs clock and DMA clocks in the binding header.
- Replace k230_clk_cfgs[] array with corresponding named variables.
- Remove some redundant checks in clk_ops.
- Drop the unnecessary parenthesis and type casts.
- Modify return value handling in probe path to avoid redundant print.
- Link to v4: https://lore.kernel.org/r/20250217-b4-k230-clk-v4-0-5a95a3458691@zohomail.com

Changes in v4:
- Remove redundant onecell_get callback and add_provider function
for pll_divs.
- Modify the base-commit in cover letter.
- Link to v3: https://lore.kernel.org/r/20250203-b4-k230-clk-v3-0-362c79124572@zohomail.com

Changes in v3:
- Reorder the defination and declaration in drivers code.
- Reorder the properties in dts node.
- Replace global variable `k230_sysclk` with dynamic memory allocation.
- Rename the macro K230_NUM_CLKS to K230_CLK_NUM.
- Use dev_err_probe for error handling.
- Remove unused includes.
- Link to v2: https://lore.kernel.org/r/20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com

Changes in v2:
- Add items and description.
- Rename k230-clk.h to canaan,k230-clk.h
- Link to v1: https://lore.kernel.org/r/20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com

---
Xukai Wang (3):
      dt-bindings: clock: Add bindings for Canaan K230 clock controller
      clk: canaan: Add clock driver for Canaan K230
      riscv: dts: canaan: Add clock definition for K230

 .../devicetree/bindings/clock/canaan,k230-clk.yaml |   59 +
 arch/riscv/boot/dts/canaan/k230-canmv.dts          |   11 +
 arch/riscv/boot/dts/canaan/k230-evb.dts            |   11 +
 arch/riscv/boot/dts/canaan/k230.dtsi               |   26 +-
 drivers/clk/Kconfig                                |    6 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-k230.c                             | 2434 ++++++++++++++++++++
 include/dt-bindings/clock/canaan,k230-clk.h        |  221 ++
 8 files changed, 2761 insertions(+), 8 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20241206-b4-k230-clk-925f33fed6c2
prerequisite-patch-id: deda3c472f0000ffd40cddd7cf6d3b5e2d7da7dc

Best regards,
-- 
Xukai Wang <kingxukai@zohomail.com>

