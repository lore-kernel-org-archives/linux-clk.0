Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F3181724;
	Sat, 14 Feb 2026 12:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771073884; cv=pass; b=pmwyHv0mlNsuTJyyADCAShZYpEEM+bd8621Gc/yIYfLwvhJh1cRdo8kJOQDLsr10dOVCoHfJPENqvhxBCFzUaDGh0YEiVe13w3JWdnVlLpI3sES79aaRG/xzaWpqmAxTCvGKGgEO6qrkkIpVmj351zCeniQvgCM6vKZ9m8YsWYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771073884; c=relaxed/simple;
	bh=09qSwdZv7M8ydKB+BUFSflVpP6ayFPW1jpPgXR1H+sY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fNx7TGgq5OAtB9eZONy6nJHDjxOgO3BcECiRqq97Yvy29QP73Mq6IPfRExvv/Xn9N+drYKzSHoFiZ0WVReW2eoap3SEvzTod6902HQCGYGACGmFagQhdinVSb+IoGp/LfnAAsXnIarDEFafX0B2OwP2LHipJTMPkFxRM68ZqD1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=LbEBv34Z; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="LbEBv34Z"
ARC-Seal: i=1; a=rsa-sha256; t=1771073864; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RHqJAJyudGegDLV5YrRQB85/w492KxND3o4qkTVAix9vyelEHrg0TTrK7f51wJGX2qmPsJYQCbqf9566tCmKEQLS26IvRrLbHTypEj7OnVed9QekmlGv+3n+OEsKNuVuOqhuKV+3zT+QPHpuKOEwZm4BYFz21GGzzKwJmM3fb+8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771073864; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lpeWPKqRpQV/xmX4eZMoBvWe/E7ueNwOgVoLy11tkgw=; 
	b=DJSHI8Nif+PPKcwofvNjpMEkvBjAGFcn4Jfwh7XYJP2CJ6Wwb7fNMh7UhXpzbhIU2UJRn3wh9IsUl7fL38WlF5YxIDfnKqpE4++1ZBu7+n/MgiDj0UAgdLOLCwjcgXJumCLXka0XKJlJGBQ6SWSAy3kFn9lL8vd0IefMu7GBvXw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771073864;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=lpeWPKqRpQV/xmX4eZMoBvWe/E7ueNwOgVoLy11tkgw=;
	b=LbEBv34ZizrwM4eBvGrzwDf5L/uxDoGsJKPoM/NFSBuw+bukDJQcFVrUGCM0lEH/
	2SmzUcZGR7KFA3QOyZfSpJLhhxnln9hMCE2yLktpR8EHz9zxx4FusIGndv60RdL5gyY
	gE5BOVE/S8mZvBinETtEhaevx9AJBIKF4mYKC7xo=
Received: by mx.zohomail.com with SMTPS id 1771073856662283.92237410388316;
	Sat, 14 Feb 2026 04:57:36 -0800 (PST)
From: Xukai Wang <kingxukai@zohomail.com>
Subject: [PATCH v11 0/3] riscv: canaan: Add support for K230 clock
Date: Sat, 14 Feb 2026 20:54:36 +0800
Message-Id: <20260214-b4-k230-clk-v11-0-6de365489b89@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIxwkGkC/3XTy3LTMBQG4FfJeI2Zc9GRdLLiPZgudCWeNjUka
 Qbo5N2RU0pqx+xsjT/9vyTrtTuWw1CO3Xbz2h3KeTgO43N7Qfy06dIuPH8r/ZDbQEdABglsH03
 /SAx9enrslaQy15Jtoq6J74dSh5/X6b4+vL0fyo+XNuvpbbCL4Vj6NO73w2m7CVV9UU6SWIvNE
 L2LhioEppwZrK1OxaG/Th1Oade6bDcaKANWEXEmCvscsjgqqFw9JmOsxQpeuJsa7IbjaTz8uq7
 vzNcKf1fiZis5c98eIrZA9L449+X3uBv3YXj63NpOBRoTQKJ7Fmt1IiFpqmmdEfA9Y0vJKZJp7
 edsKn42H8qimXPTOCbQFGxk48N/UtHdMwkqgY14q7iSih9SSeccGyfCoOiKh5JXOL3ztlXg55w
 m7iJDoBSE1rjcOC+3TBp3xue2G+S58PqameCeQdEMXpMY71dS7S3VoMy5nVJr9loNufbBCnc37
 niR7qa/SlzmGEU58wr3N66wSPeNq00hAGUxtFZe/3FEWpy3Tn9Zw1rQ1VBl7bzh3VtAtIsDb1v
 X5yIK3C5pu5GLCS6Xyx/iTnWKQQQAAA==
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
 Troy Mitchell <TroyMitchell988@gmail.com>, jiayu.riscv@isrc.iscas.ac.cn, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
Feedback-ID: rr080112277d3a54f449ef6c5aa78d1649000072434364ad7d78950e8c763f1f35d011831498257a84fa042e:zu08011227b13547cc4ad379d54a9065600000915bf1123d74a7055a906a287b27efc840e34e996182021847:rf0801122d9139ba3fd08dc76e4e44c0d90000a02fc4c28f4b2d6995daaf767406fc33728b8b47c2211ae0e4a550e9c4e71d:ZohoMail
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
Changes in v11:
- Rename hs_hclk_high_src to hs_hclk_high and hs_hclk_src to hs_hclk.
- Rebase base-commit to linux-next.
- Update prerequisite-patch-id.
- Link to v10: https://lore.kernel.org/r/20260116-b4-k230-clk-v10-0-de59033c5d30@zohomail.com

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
 include/dt-bindings/clock/canaan,k230-clk.h        |  220 ++
 8 files changed, 2760 insertions(+), 8 deletions(-)
---
base-commit: af98e93c5c39e6d0b87b42f0a32dd3066f795718
change-id: 20241206-b4-k230-clk-925f33fed6c2
prerequisite-patch-id: 9a2d01f55574b538dad572e193f81c44661f0853

Best regards,
-- 
Xukai Wang <kingxukai@zohomail.com>

