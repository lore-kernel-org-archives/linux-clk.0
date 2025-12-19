Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C30424290D;
	Fri, 19 Dec 2025 06:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766127489; cv=none; b=Y1b+sCkHNsnGpaML/ts0hhRbDiJA/6vAwTuW9Wam59kGOR+6fh4U6jS0BXb6rQpBlEgoq+SoQ+/0hPy/Y/X9SiLPRvB0bvDRDXhBVKBh2FklE8Oc5uS0xKR0rBwf7qxyef+T5QVr3zcgm0SaIhAVEvXNwvpRMZdJZW3uVOh+z4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766127489; c=relaxed/simple;
	bh=jQ7aAEVhuaVvlkf3K/L3WD5qp9CJsXHd3Ak+Xkxr1kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UP2K5eoeswi1sTmSKXZuhNZsIUu7MEp2PVTvzqJoqXVLLhBhgT7vwfYaaLq6/rI7HzE13Bx/tUH4L1WQsMTNZ29eEe18smEu+JIKo636GRFyAEWCn1tS421jrFw8rv9HDeHLPKbNpqKzXxqmrcFHF0+MfN7R6+nEAk2InSShRCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [223.160.207.22])
	by APP-05 (Coremail) with SMTP id zQCowAA3yQxe90RphiUoAQ--.14517S2;
	Fri, 19 Dec 2025 14:57:36 +0800 (CST)
Date: Fri, 19 Dec 2025 14:57:33 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Xukai Wang <kingxukai@zohomail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v9 0/3] riscv: canaan: Add support for K230 clock
Message-ID: <aUT3XYQmn51tLItg@duge-virtual-machine>
References: <20251127-b4-k230-clk-v9-0-3aa09e17faf5@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127-b4-k230-clk-v9-0-3aa09e17faf5@zohomail.com>
X-CM-TRANSID:zQCowAA3yQxe90RphiUoAQ--.14517S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtryUCrykAw4kCFyfZrWkJFb_yoW7WrWkpr
	Wa9w1xtF1jqw4fXanFq348Aan5Ga1xKan8Wa4Iv3s3AF43GFWjqFnagr1xtF47tryI93yj
	qrWUJrW3Za4UCFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUvwvKDUUUU
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

I'm writing to share test results and the corresponding patch for 
K230 clock configuration issues, covering critical clock flag 
settings and HS/SD subsystem clock adjustments.

1.  Critical Clock Protection for CPU Subsystems
I found that cpu0/cpu1 core-related clocks (src/plic/apb/noc_ddrcp4 
etc.) had no protection, risking accidental disabling and subsystem 
malfunctions. I added the `CLK_IS_CRITICAL` flag to these clock 
nodes to block unintended disable operations.

2.  HS/SD Clock Setting Fixes
Two hardware-spec mismatches were fixed:
- Adjusted `hs_hclk_src_gate` from register bit1 to bit0, and 
  updated its parent clock from `hs_hclk_high_src_rate` to 
  `hs_hclk_high_gate`.
- Corrected `hs_sd_card_src_rate` parent clock from `pll0_div4` to 
  `hs_sd_card_src_gate`, fixing SD controller clock source 
  misconfiguration.

3.  Test Verification
Post-fix on-board testing confirmed all modified clock nodes align 
with K230 hardware specs and the clock tree relationships are 
correct.
The CPU core and HS/SD subsystems run stably without any clock-
related errors or anomalies.

The patch modifies `drivers/clk/clk-k230.c` (19 insertions, 19 
deletions), with the full diff attached below for your review.

Best regards,
Jiayu Du

---
 drivers/clk/clk-k230.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/clk-k230.c b/drivers/clk/clk-k230.c
index 8750e9cbac..43a4e61a0c 100644
--- a/drivers/clk/clk-k230.c
+++ b/drivers/clk/clk-k230.c
@@ -317,7 +317,7 @@ struct clk_fixed_factor *k230_pll_divs[] = {
 
 K230_CLK_GATE_FORMAT(cpu0_src_gate,
 		     K230_CPU0_SRC_GATE,
-		     0, 0, 0, 0,
+		     0, 0, CLK_IS_CRITICAL, 0,
 		     &pll0_div2.hw);
 
 K230_CLK_RATE_FORMAT(cpu0_src_rate,
@@ -325,7 +325,7 @@ K230_CLK_RATE_FORMAT(cpu0_src_rate,
 		     1, 16, 1, 0xF,
 		     16, 16, 0, 0x0,
 		     0x0, 31, mul, 0x0,
-		     false, 0,
+		     false, CLK_IS_CRITICAL,
 		     &cpu0_src_gate.clk.hw);
 
 K230_CLK_RATE_FORMAT(cpu0_axi_rate,
@@ -333,12 +333,12 @@ K230_CLK_RATE_FORMAT(cpu0_axi_rate,
 		     1, 1, 0, 0,
 		     1, 8, 6, 0x7,
 		     0x0, 31, div, 0x0,
-		     0, 0,
+		     0, CLK_IS_CRITICAL,
 		     &cpu0_src_rate.clk.hw);
 
 K230_CLK_GATE_FORMAT(cpu0_plic_gate,
 		     K230_CPU0_PLIC_GATE,
-		     0x0, 9, 0, 0,
+		     0x0, 9, CLK_IS_CRITICAL, 0,
 		     &cpu0_src_rate.clk.hw);
 
 K230_CLK_RATE_FORMAT(cpu0_plic_rate,
@@ -346,17 +346,17 @@ K230_CLK_RATE_FORMAT(cpu0_plic_rate,
 		     1, 1, 0, 0,
 		     1, 8, 10, 0x7,
 		     0x0, 31, div, 0x0,
-		     false, 0,
+		     false, CLK_IS_CRITICAL,
 		     &cpu0_plic_gate.clk.hw);
 
 K230_CLK_GATE_FORMAT(cpu0_noc_ddrcp4_gate,
 		     K230_CPU0_NOC_DDRCP4_GATE,
-		     0x60, 7, 0, 0,
+		     0x60, 7, CLK_IS_CRITICAL, 0,
 		     &cpu0_src_rate.clk.hw);
 
 K230_CLK_GATE_FORMAT(cpu0_apb_gate,
 		     K230_CPU0_APB_GATE,
-		     0x0, 13, 0, 0,
+		     0x0, 13, CLK_IS_CRITICAL, 0,
 		     &pll0_div4.hw);
 
 K230_CLK_RATE_FORMAT(cpu0_apb_rate,
@@ -364,7 +364,7 @@ K230_CLK_RATE_FORMAT(cpu0_apb_rate,
 		     1, 1, 0, 0,
 		     1, 8, 15, 0x7,
 		     0x0, 31, div, 0x0,
-		     false, 0,
+		     false, CLK_IS_CRITICAL,
 		     &cpu0_apb_gate.clk.hw);
 
 static const struct clk_parent_data k230_cpu1_src_mux_pdata[] = {
@@ -376,12 +376,12 @@ static const struct clk_parent_data k230_cpu1_src_mux_pdata[] = {
 K230_CLK_MUX_FORMAT(cpu1_src_mux,
 		    K230_CPU1_SRC_MUX,
 		    0x4, 1, 0x3,
-		    0, 0,
+		    CLK_IS_CRITICAL, 0,
 		    k230_cpu1_src_mux_pdata);
 
 K230_CLK_GATE_FORMAT(cpu1_src_gate,
 		     K230_CPU1_SRC_GATE,
-		     0x4, 0, CLK_IGNORE_UNUSED, 0,
+		     0x4, 0, CLK_IS_CRITICAL, 0,
 		     &cpu1_src_mux.clk.hw);
 
 K230_CLK_RATE_FORMAT(cpu1_src_rate,
@@ -389,7 +389,7 @@ K230_CLK_RATE_FORMAT(cpu1_src_rate,
 		     1, 1, 0, 0,
 		     1, 8, 3, 0x7,
 		     0x4, 31, div, 0x0,
-		     false, 0,
+		     false, CLK_IS_CRITICAL,
 		     &cpu1_src_gate.clk.hw);
 
 K230_CLK_RATE_FORMAT(cpu1_axi_rate,
@@ -397,12 +397,12 @@ K230_CLK_RATE_FORMAT(cpu1_axi_rate,
 		     1, 1, 0, 0,
 		     1, 8, 12, 0x7,
 		     0x4, 31, div, 0x0,
-		     false, 0,
+		     false, CLK_IS_CRITICAL,
 		     &cpu1_src_rate.clk.hw);
 
 K230_CLK_GATE_FORMAT(cpu1_plic_gate,
 		     K230_CPU1_PLIC_GATE,
-		     0x4, 15, CLK_IGNORE_UNUSED, 0,
+		     0x4, 15, CLK_IS_CRITICAL, 0,
 		     &cpu1_src_rate.clk.hw);
 
 K230_CLK_RATE_FORMAT(cpu1_plic_rate,
@@ -410,12 +410,12 @@ K230_CLK_RATE_FORMAT(cpu1_plic_rate,
 		     1, 1, 0, 0,
 		     1, 8, 16, 0x7,
 		     0x4, 31, div, 0x0,
-		     false, 0,
+		     false, CLK_IS_CRITICAL,
 		     &cpu1_plic_gate.clk.hw);
 
 K230_CLK_GATE_FORMAT(cpu1_apb_gate,
 		     K230_CPU1_APB_GATE,
-		     0x4, 19, 0, 0,
+		     0x4, 19, CLK_IS_CRITICAL, 0,
 		     &pll0_div4.hw);
 
 K230_CLK_RATE_FORMAT(cpu1_apb_rate,
@@ -423,7 +423,7 @@ K230_CLK_RATE_FORMAT(cpu1_apb_rate,
 		     1, 1, 0, 0,
 		     1, 8, 15, 0x7,
 		     0x0, 31, div, 0x0,
-		     false, 0,
+		     false, CLK_IS_CRITICAL,
 		     &cpu1_apb_gate.clk.hw);
 
 K230_CLK_GATE_FORMAT_PNAME(pmu_apb_gate,
@@ -446,8 +446,8 @@ K230_CLK_GATE_FORMAT(hs_hclk_high_gate,
 
 K230_CLK_GATE_FORMAT(hs_hclk_src_gate,
 		     K230_HS_HCLK_SRC_GATE,
-		     0x18, 1, 0, 0,
-		     &hs_hclk_high_src_rate.clk.hw);
+		     0x18, 0, 0, 0,
+		     &hs_hclk_high_gate.clk.hw);
 
 K230_CLK_RATE_FORMAT(hs_hclk_src_rate,
 		     K230_HS_HCLK_SRC_RATE,
@@ -560,7 +560,7 @@ K230_CLK_RATE_FORMAT(hs_sd_card_src_rate,
 		     2, 8, 12, 0x7,
 		     0x1C, 31, div, 0x0,
 		     false, 0,
-		     &pll0_div4.hw);
+		     &hs_sd_card_src_gate.clk.hw);
 
 K230_CLK_GATE_FORMAT(hs_sd0_card_gate,
 		     K230_HS_SD0_CARD_GATE,

