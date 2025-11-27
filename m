Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB8E322740;
	Thu, 27 Nov 2025 12:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764247586; cv=pass; b=O4FmXb1VQ+9NVQIV9Cde3vyroF7ODShyOKyWHd2c0Iex1Yb4EJF4TPQ6z0OF0JfvPJyEKB8Zkp50J7e9YR7pJCRT7JlYByLFTTYLRzRHSpx5UiS+1UuJPJvaWlo0PDPWyv7uQSECChOvw4vBMlsFKCoOUY1t07/t2asHifuRZ/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764247586; c=relaxed/simple;
	bh=18Dhal977Xmwknb3xBdip/dbrRrTGk098g/AdOl5gls=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rO5rWK7E7Z6slbYs+6QjuTt8OsPqRqXKf73NIrcEUHYFHdne9UMIO/Q/DIzlstshpsrbVW+ZvheBr9QYnwJx1V1DHWKGPWmG3sa+bN2lF3wvqaNb1iktI7nPNVrzK2+3YBL4LNUvPXqaSzGncTqCCn275ggw7iBtoa3JHKUr6R8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=e66g7TbH; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="e66g7TbH"
ARC-Seal: i=1; a=rsa-sha256; t=1764247565; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JESzzDfGOZy6aZqd4bURzpua+9ymDdAqzzfWWlTh+TQcfD87SOrve9cVdzQk6HI/90m0yJ9RQdo5+80bFa9PbnZC0M8SFDsgdQjvMQHNOmVatSkuAg54slABxDMyQa/tHx5wmgs6PzBOza5uZjidg6TROY3sOZK2QQ8rB0KuS6s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764247565; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nxDBEEqL4g4VirocVWRXAnnxRsvrtk7ndIXWLF93kSQ=; 
	b=R70nNi3b86pw3P84txLh3ZjR/iZyao3at4n97OfURlC8ov7ezh+PCEqR46lPiiCNbnX5AKWFcIJCz4M0DP0AtZ2PzsU++79TfYwOXQxO+3gJ0Qt/O/jBCkVwaL/8ClVwo8TmAWg5wTdXamU+r0zGYoVh2bgXP17PVmfFyO36mqU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764247565;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=nxDBEEqL4g4VirocVWRXAnnxRsvrtk7ndIXWLF93kSQ=;
	b=e66g7TbHqg9LD/NNhzeDYC57Y3QSbozYWy7pOKzls09mgk2G5/iislKEeJqlkw1Z
	DIbUSSj8r9Z4azPk6NZeeVDRKJZF3KR90tCocES/YQFY2V6GZxfxkuARyl8WfUNJxHS
	7UVLkNNTunlMv2LbGJg4pRi5LZp8f8d1jWyP5Y1w=
Received: by mx.zohomail.com with SMTPS id 1764247558426698.0114947283038;
	Thu, 27 Nov 2025 04:45:58 -0800 (PST)
From: Xukai Wang <kingxukai@zohomail.com>
Subject: [PATCH v9 0/3] riscv: canaan: Add support for K230 clock
Date: Thu, 27 Nov 2025 20:45:11 +0800
Message-Id: <20251127-b4-k230-clk-v9-0-3aa09e17faf5@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANdHKGkC/3XSwY7TMBAG4FepcibInrE9dk+8B+IwnrFptNsNJ
 KUCVn13nC6omzbkFEf5/P9j+bWbyzSUudvvXrupnId5GF/aIn3YdXLgl6+lH7StOzDgLJjQZ9c
 /AZpenp/6BL4i1qJBoGvi21Tq8PO62+cvb+upfP/RNj29fewyz6WX8XgcTvsdcgzBRIoRU2XW7
 KrloEogaCmJ1eoDRbpuzSc5tC77nRZlFEdQTXtqVWdEG5IaFLMvoKRMKt3S4DDMp3H6dR3vjNc
 Kfyeh1SRn7NtLbqnexliIPv0eD+ORh+ePre1SoDFvLMAjy7WS9yxJqmwzMPjIMIBQsuA8wZotx
 c/uXVnr1tw1bsUk4ZDRRf5PqqVH5jl5RudjSHYj1b5LhbTmtnEAy8lSiaboBod/vB2ViWsOC6e
 MhkHYwxb3N473R+YbJxe1nQZELLg9M4J5ZKYkNTGJdzFupIZbqrN+zcOSWjWm6oDaDxucbpzwL
 p2WW+Wp3cvsEypu8Hjjydylx8ZTEGYD6h3cl79cLn8A+YabncADAAA=
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
Feedback-ID: rr080112275137b47f9fe87b720e69e43d0000ac17810c5ca7f3589f5df4d255e6a5b63649fd3806ee8255e4:zu080112275cfac5b82118babda42883340000feb6cbaeeb6aefb5b33c46c4787000cdae37d2a68a728da2fc:rf0801122df1bde403032e47e4f376316c0000858aceec9cc1984ed006ed57e37d2162c22e2639bde8a850db6dc396023f2e:ZohoMail
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
 drivers/clk/clk-k230.c                             | 2443 ++++++++++++++++++++
 include/dt-bindings/clock/canaan,k230-clk.h        |  222 ++
 8 files changed, 2771 insertions(+), 8 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20241206-b4-k230-clk-925f33fed6c2
prerequisite-patch-id: deda3c472f0000ffd40cddd7cf6d3b5e2d7da7dc

Best regards,
-- 
Xukai Wang <kingxukai@zohomail.com>

