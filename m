Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6025822576E
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 22:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784239233; cv=none; b=XvnKmj1sI6EB1gmxB2xxNb4n6nl/kZC2KISt8J1eem3tkbjE/eAODDmmtYYFaxsaj5NWzQxQSIj0E5cZBuXl72wuvlWTJbC+ItWpCxOCxkZqMFTlwZq5ip7cpzshk6DKAKFyaMAyUtgib2LLpDHK3TG7ifsKPLBZ+eJtPoWhIxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784239233; c=relaxed/simple;
	bh=NrjuaqXWi8y8citUw1tax6e65h8FgEnDAE3lfix/TMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p3l3UBJBGZXZgn0OE4ZLOT7ozhl9vU7OxgAodOtqXXX2WREOlzj9V9Zd0TJVvziEufcNaan7MM1Paw6smXNiTnCdDdPcOu1z1xrcgTC8pB06MmnN8MRgCqs0JYE/Yu8nxFBEi6XGlPkSHg2lptnY0QZSeudWlyjEO3Bwb2+m7Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbyUnCLN; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbyUnCLN"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so6304747f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 15:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784239230; x=1784844030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k0QhVcSPxl5ktUEKFBVIie73Dy9M8toajCnkBUU1vsE=;
        b=AbyUnCLNEemdnA4e+9q3GRrPFKEU7x7DvuHB1JkLnCtLMLSZ5rL9azPUSTf0VnwzGL
         5OMF0wx5F5ehCoMNuWoS3RaIBraJGmPWmgfLSUDszVhn2ERaQTYEPbKeGN8jt+0ivsX8
         0W5ppT/jsyaLmgBe80oMeMFw7BTNboPSrqejHuzUi3NR6nx0/5/r8EYO2xSbHkoe/Uip
         na0vZXoOs/0aMIc+GDQ89tbw+KNc+WYUbafxVTsbkMDYf6k8qPZJSHyvRv6W3nwtKozx
         1grcEZtyilztDfevwy3ikKRX8rv8D6PexOjrikuip3Xj/UrP58O7oQO8BDRr2H0stBs1
         ZlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784239230; x=1784844030;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k0QhVcSPxl5ktUEKFBVIie73Dy9M8toajCnkBUU1vsE=;
        b=RstHKp9n5ksZw9tC8F139K/sr13x2uCH5/2n26Q5Lr8jETemFnmcIGPP8y4wTVknvK
         lo1vvYgEloI8XbmO8twUc2/Or5Z9pE9PXonwIi+sJESTCHbvA0uO+ZKhpVHNAMAi8m0a
         77S6WY1pWEzCtccxIOfdObga//v5ZMHbt/4c0FBjRuwqhVbDA+67aEE95EojU/GCxeMK
         Yr7ZgyQI5BtTSP3A7PpGkMSZMMTdKdC4/HzG+I+kfuNipR+UBFPZj5lOP056VA7smREW
         WWx64kW5VSBdDcq564dqseUPA+pgONfBttPJtDGRwByTiM48CRIhjo9PD8y6XEz+zTGi
         lwjw==
X-Forwarded-Encrypted: i=1; AHgh+RqID093NM9L5xenI7t50PWK8qy/Ly3P77lHMd8kHNUklAUs4aZMtn6S9Uy1LiFzAjZEB2bfHV6sAEo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb9RZHl1qygnhcDhosWmnBm1KJgzXy8cnGgHCHLMZpiHhIOUr/
	DwVAsVK950bGe3pwwdGX8HwaRlWdVl1uv922D8XMnGuAGcJLTasXlM8J
X-Gm-Gg: AfdE7cnN+vXaIZVacwR2nP/m4+FEbiXkAYG3UUjjd7OwM80iWHfNGkmMcf3ApUIjv1h
	ZacQ8vuA0iY71hl0z8ToiC0nWCdy0vZ4z+B9xnWunox0jWFYx7T58JMfAyL/hD1Stj4zXsCSgj1
	nHE2jDBuZ074fj5G9mJ3uz+J8VwjZIjoZFCNQDSGUoj5nc2MaTJx3F5/oZIW6J1T/Xr8byxJ5jI
	IGy5Q8wJpDZWgVYsFv6ZFYYA4p7gkY19SDN69/ezC00f71j74li1Z+uwz/UMgbB3XdpqcwZfXHc
	39RNHvsAclKeAMrK5i+INfzhrVPKFdgD/JvkjQPuhK6OPCsbX5UG2N0mU1MRsBlGb+T5lT+cDuJ
	7fFZrfcInJR/fM9FlN72RFqYIJKyLFyxBFthXxcYUc7dopAXXJ06108Ny7z6AJcgE60uZ9nFiM6
	kaWgmvuDRw3yN2xg==
X-Received: by 2002:a05:6000:4a15:b0:477:b22:488d with SMTP id ffacd0b85a97d-47f622fcdccmr16159f8f.10.1784239229229;
        Thu, 16 Jul 2026 15:00:29 -0700 (PDT)
Received: from strix.doe.home ([197.250.51.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a974csm29949056f8f.18.2026.07.16.15.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 15:00:28 -0700 (PDT)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 10/13] clk: zte: Introduce a driver for zx297520v3 matrix clocks
Date: Fri, 17 Jul 2026 01:00:08 +0300
Message-ID: <20260717-zx29clk-v7-10-50abfa8dd594@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

This clock controller controls high speed devices: CPU, DMA, RAM, SDIO,
Ethernet. The only non-clock, non-reset registers I have spotted here
are hardware spinlocks.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 7:
Reduced the input clocks a lot. Most MPLL subdivisons are children of
the same gate in top, so put the fixed factor clocks here.

Added a few more clocks: DDR_CTRL, AXI bus, arm architectured timer.
They are needed to tell CCF to keep the top gates enabled and marked
critical because they aren't consumed by a DT node.

The AXI bus is determined by a voting system. I've set up the driver to
write to the ballot register ZTE's kernel uses and enable voting. This
should make life easier with the LTE rproc blob later.

Version 5:
Make it an MFD child device, remove aux device
Fix zx297529 -> zx297520 typos
Fix AHB_wclk -> ahb_wclk. That was a leftover of my old composite structs
Add SRAM0 and GSM_CFG clocks
---
 drivers/clk/zte/clk-zx297520v3.c | 312 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 312 insertions(+)

diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
index 20ff00ba5f67..e08ba9623345 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -510,6 +510,314 @@ static const struct zx_clk_data zx297520v3_topclk_data = {
 	.num_gates = ARRAY_SIZE(zx297520v3_top_gates),
 };
 
+/* For devices which have a working driver the work clock can be figured out by gating off registers
+ * in top+0x140. This is used for devices where I can't interpret the register contents yet.
+ */
+static const char matrix_unk[] = "matrix-osc26m";
+
+static const char * const cpu_sel[] = {
+	"matrix-osc26m",
+	"matrix-mpll",		/* 624 MHz */
+	"matrix-mpll-d2",	/* 312 MHz */
+	"matrix-mpll-d4",	/* 156 MHz */
+};
+
+/* Low confidence on the actual value, but at least I know it is bit 13 in top+0x140 */
+static const char * const zsp_sel[] = {
+	"matrix-osc26m",
+	"matrix-dpll",		/* 491.52 MHz */
+};
+
+/* We can't realistically change DDR speed while running an OS out of DDR (it reads garbage for a
+ * short while on transition), but we need to know if we have to keep gpll alive. 32 MB devices use
+ * 200MHz, while 64/128 MB ones use 156.
+ */
+static const char * const ddr_ctrl_sel[] = {
+	"matrix-mpll-d4",	/* 156 MHz */
+	"matrix-gpll",		/* 200 MHz */
+	"matrix-mpll-d6",	/* 104 MHz */
+	"matrix-mpll-d8",	/* 78 MHz */
+};
+
+static const char * const sd0_sel[] = {
+	"matrix-osc26m",
+	"matrix-mpll-d4",	/* 156 MHz */
+	"matrix-gpll-d2",	/* 100 MHz */
+	"matrix-mpll-d8",	/* 78 MHz */
+	"matrix-gpll-d2-d2",	/* 50 MHz */
+	"matrix-gpll-d2-d4",	/* 25 MHz */
+};
+
+static const char * const sd1_sel[] = {
+	"matrix-osc26m",
+	"matrix-gpll-d2",	/* 100 MHz */
+	"matrix-mpll-d8",	/* 78 MHz */
+	"matrix-gpll-d2-d2",	/* 50 MHz */
+	"matrix-mpll-d16",	/* 39 MHz */
+	"matrix-gpll-d2-d4",	/* 25 MHz */
+};
+
+/* ZTE's kernel puts the high frequency first, but this is against the usual convention on this
+ * SoC. I don't have any device that has a raw NAND controller though.
+ */
+static const char * const nand_sel[] = {
+	"matrix-osc26m",
+	"matrix-mpll-d4",	/* 156 MHz */
+};
+
+static const char * const edcp_sel[] = {
+	"matrix-osc26m",
+	"matrix-mpll-d4",	/* 156 MHz */
+	"matrix-mpll-d5",	/* 124.8 MHz */
+	"matrix-mpll-d6",	/* 104 MHz */
+};
+
+static const char * const tdm_sel[] = {
+	"matrix-osc26m",
+	"matrix-dpll-d4",	/* 122.88 MHz */
+	"matrix-mpll-d6",	/* 104 MHz */
+};
+
+/* AXI speed is either determined by a fixed selection in 0x0, bits 0:2 or by a voting system with
+ * ballots in 0x120, 0x124, 0x128. The voting system is enabled by setting 0x12c to 1. Otherwise the
+ * selection in 0x0 applies.
+ *
+ * ZTE's firmware uses 0x128 as the PHY's vote and names 0x120 as "PS" and 0x124 as "AP" vote.
+ * However, their cpufreq driver ultimately uses the "PS" define and thus writes to 0x120, which can
+ * be observed in the running system.
+ *
+ * The fastest selected speed wins. This holds true for values 0 (26 MHz) and 7 (6.5 MHz) too, so it
+ * isn't a case of lowest selector wins. I haven't tested what happens if mpll is changed to output
+ * 5x the normal clock, so 7 beats 0. Presumably value 0 would still win the election.
+ *
+ * AXI speed 6.5 is an mpll child, not a division of [matrix-]osc26m by 4. It depends on top+0x140
+ * bit 9, like other mpll (other than d5) choices.
+ *
+ * The system initializes with voting disabled and all preferences set to the lowest setting, 7.
+ * The zx297520v3_matrix_init function transfers the global mux to our vote and enables voting.
+ */
+#define ZX297520V3_AXI_AP_VOTE 0x120
+static const char * const axi_sel[] = {
+	"matrix-osc26m",
+	"matrix-mpll-d4",	/* 156 MHz */
+	"matrix-mpll-d5",	/* 124.88 MHz */
+	"matrix-mpll-d6",	/* 104 MHz */
+	"matrix-mpll-d8",	/* 78 MHz */
+	"matrix-mpll-d12",	/* 52 MHz */
+	"matrix-mpll-d16",	/* 39 MHz */
+	"matrix-mpll-d96",	/* 6.5 MHz */
+};
+
+static const struct zx_mux_desc zx297520v3_matrix_muxes[] = {
+	MUX(0,                             "cpu-mux",        cpu_sel,          0x20,  0, 2),
+	MUX(0,                             "zsp-mux",        zsp_sel,          0x30,  0, 2),
+	MUX(0,                             "ddr-ctrl-mux",   ddr_ctrl_sel,     0x50,  0, 2),
+	MUX(0,                             "sd0-mux",        sd0_sel,          0x50,  4, 3),
+	MUX(0,                             "sd1-mux",        sd1_sel,          0x50,  8, 3),
+	MUX(0,                             "nand-mux",       nand_sel,         0x50, 12, 2),
+	MUX(0,                             "edcp-mux",       edcp_sel,         0x50, 16, 2),
+	MUX(0,                             "tdm-mux",        tdm_sel,          0x50, 24, 2),
+	MUX(0,                             "axi-mux", axi_sel, ZX297520V3_AXI_AP_VOTE, 0, 3),
+};
+
+static const struct zx_gate_desc zx297520v3_matrix_gates[] = {
+	/* This bit cuts off the clock signal to the ARM architected timer, which the kernel uses
+	 * as its main timer. It isn't critical per se - there are plenty of proprietary timers
+	 * available that could be used - but the arm arch timer binding does not accept a clock, so
+	 * this CCF driver won't know if the timer is in use.
+	 *
+	 * This clock is fed by the mux in topclk+0x140 - this critical clock here protects its
+	 * parent.
+	 */
+	GATE(ZX297520V3_SYS_TIMER_WCLK,    "sys-timer-wclk", "matrix-osc26m", 0x144,  1,
+		CLK_IS_CRITICAL),
+
+	/* Both 0x24 and 0x28 bits 1 and 2 stop the CPU. There is also a bit in topclk+0x138, which
+	 * ZTE's uboot calls "A53 reset", which also stops the CPU. I can't really tell the
+	 * difference between matrix+28 and top+138. The clock (maxtrix+0x24) can be disabled and
+	 * enabled from the Cortex M0 and it will nicely stop and restart the A53, retaining all
+	 * state.
+	 */
+	GATE(ZX297520V3_CPU_WCLK,          "cpu-wclk",       "cpu-mux",        0x24,  1,
+		CLK_IS_CRITICAL),
+	GATE(ZX297520V3_CPU_PCLK,          "cpu-pclk",       clk_main[0],      0x24,  2,
+		CLK_IS_CRITICAL),
+
+	/* There are a lot more controls in matrix+0x100. 13-16 appear to be 4 different AXI
+	 * channels for different priorities. Bit 19 appears to be the DDR PHY wclk.
+	 *
+	 * The important task is to keep gpll powered if the bootloader selected a gpll-based rate
+	 * for RAM.
+	 */
+	GATE(ZX297520V3_DDR_CTRL_PCLK,     "ddr-ctrl-pclk",  clk_main[0],     0x100, 17,
+		CLK_IS_CRITICAL),
+	GATE(ZX297520V3_DDR_CTRL_WCLK,     "ddr-ctrl-wclk",  "ddr-ctrl-mux",  0x100, 18,
+		CLK_IS_CRITICAL),
+
+	GATE(ZX297520V3_ZSP_WCLK,          "zsp-wclk",       "zsp-mux",        0x3c,  0, 0),
+
+	GATE(ZX297520V3_SD0_WCLK,          "sd0-wclk",       "sd0-mux",        0x54, 12, 0),
+	GATE(ZX297520V3_SD0_PCLK,          "sd0-pclk",       clk_main[0],      0x54, 13, 0),
+	GATE(ZX297520V3_SD0_CDET,          "sd0-cdet",       "clock-32k",      0x54, 14, 0),
+	GATE(ZX297520V3_SD1_WCLK,          "sd1-wclk",       "sd1-mux",        0x54,  4, 0),
+	GATE(ZX297520V3_SD1_PCLK,          "sd1-pclk",       clk_main[0],      0x54,  5, 0),
+	/* I don't know how the cdet clock works. Card detection in the way the dwc,mmc driver uses
+	 * it appears broken no matter this clock's setting.
+	 */
+	GATE(ZX297520V3_SD1_CDET,          "sd1-cdet",       "clock-32k",      0x54,  6, 0),
+
+	/* This is some "denali" NAND, not the qspi connected one */
+	GATE(ZX297520V3_NAND_WCLK,         "nand-wclk",      "nand-mux",       0x54, 20, 0),
+	GATE(ZX297520V3_NAND_PCLK,         "nand-pclk",      clk_main[0],      0x54, 21, 0),
+
+	/* There is a set of gates for an unknown device at matrix+0x60. This device sends 50 HZ
+	 * interrupts to SPI+68. From testing it seems to be ZSP/LTE PHY related. Closing the gates
+	 * stops the IRQs but breaks LTE and access to ZSP's TCM MMIO regions on ZTE's kernel.
+	 * Interestingly the IRQs arrive when the ZSP clocks themselves are disabled or ZSP is in
+	 * reset.
+	 */
+
+	/* Yes, WCLK bit > PCLK bit for EDCP */
+	GATE(ZX297520V3_EDCP_WCLK,         "edcp-wclk",      "edcp-mux",       0x64,  2, 0),
+	GATE(ZX297520V3_EDCP_PCLK,         "edcp-pclk",      clk_main[0],      0x64,  1, 0),
+
+	/* This seems to be another SPI-Like device. ZTE's firmware operates it and from testing
+	 * it looks like the matrix_osc26m gate in top+0x140 stops this device. This would be
+	 * consistent with the other SPI controllers too.
+	 */
+	GATE(ZX297520V3_SSC_WCLK,          "ssc-wclk",       "matrix-osc26m",  0x84,  1, 0),
+	GATE(ZX297520V3_SSC_PCLK,          "ssc-pclk",       clk_main[0],      0x84,  2, 0),
+
+	/* PDCFG. Like PMM, either clock bit will allow the device to function. Probably there is
+	 * no wclk line at all and the two bits are just an artifact of generally having two bits
+	 * per device.
+	 */
+	GATE(ZX297520V3_PDCFG_WCLK,        "pdcfg-wclk",     matrix_unk,       0x88,  0,
+		CLK_IS_CRITICAL),
+	GATE(ZX297520V3_PDCFG_PCLK,        "pdcfg-pclk",     clk_main[0],      0x88,  1,
+		CLK_IS_CRITICAL),
+	GATE(ZX297520V3_MBOX_PCLK,         "mbox-pclk",      clk_main[0],      0x88,  2, 0),
+	GATE(ZX297520V3_SRAM0_PCLK,        "sram0-pclk",     clk_main[0],      0x88,  4, 0),
+	GATE(ZX297520V3_GSM_CFG_PCLK,      "gsm-cfg-pclk",   clk_main[0],      0x88,  8, 0),
+
+	/* ZTE's driver has a statemt to the effect of *(top->base+0x11c) = 5, with a comment
+	 * suggesting that this sets a 50 mhz clock. The clock code itself lists GMAC clocks in
+	 * matrix+110 and lists the parents of these clock as 50mhz gpll output, but the downstream
+	 * ZTE GMAC driver never enables the clocks. It turns out ZTE's code is highly misleading.
+	 *
+	 * The GMAC's work clock is definitly not any gpll output because it keeps working fine with
+	 * gpll disabled. Gating off matrix_osc26m breaks GMAC, so it must be its parent.
+	 *
+	 * The GMAC Gates are left enabled by the boot loader and are required for the GMAC to work.
+	 *
+	 * As for the 50 MHz comment: See rmiiphy-wclk.
+	 */
+	GATE(ZX297520V3_GMAC_WCLK,         "gmac-wclk",      "matrix-osc26m", 0x110,  0, 0),
+	GATE(ZX297520V3_GMAC_PCLK,         "gmac-pclk",      clk_main[0],     0x110,  1, 0),
+	GATE(ZX297520V3_GMAC_AHB,          "gmac-ahb",       "ahb-wclk",      0x110,  2, 0),
+
+	/* Is there an AXI bus gate? The symptom of cutting off the AXI mux selection in top+0x140
+	 * is that matrixcrm becomes unreadable from m0 and A53 hangs. Inside matrix itself only 3
+	 * bits fit that bill: 0x8c bits 5, 6, 7. It seems a bit self-defeating to have a clock
+	 * gate that shuts off access to itself though. I expect a clock gate for the bus
+	 * somewhere, and the mux exists, so exposing one AXI clock in the bindings is the correct
+	 * thing to do. It also serves to tell the kernel to keep the mux's parent enabled.
+	 *
+	 * Register 0x8c has 12 settable bits (0xfff). Ultimately it doesn't matter much which
+	 * do-not-remove bit we don't remove. Other bits in this register behave like gates (e.g
+	 * bits 12:9 cut off USB temporarily), so I think we are looking in the right place.
+	 *
+	 * If an explanation for the remaining bits surfaces and they are further gates and/or
+	 * resets, add them to the bindings.
+	 */
+	GATE(ZX297520V3_AXI_WCLK,          "axi-wclk",       "axi-mux",        0x8c,  5,
+		CLK_IS_CRITICAL),
+
+	GATE(ZX297520V3_DMA_PCLK,          "dma-pclk",       clk_main[0],      0x94,  3, 0),
+
+	/* There are a lot more VOU related controls in these registers, but turning off the main
+	 * clock seems to shut off the entire VOU MMIO range.
+	 */
+	GATE(ZX297520V3_VOU_WCLK,          "vou-wclk",       matrix_unk,      0x168,  0, 0),
+	GATE(ZX297520V3_VOU_PCLK,          "vou-pclk",       clk_main[0],     0x168,  1, 0),
+
+	/* LSP uplink clocks. The PCLK is fairly obvious (disabling it shuts off the entire LSP
+	 * register area). The WCLK speeds were deduced by setting timers and qspi muxes to a
+	 * specific speed and seeing which bit in matrix+0x7c needs to be enabled for the device
+	 * to work.
+	 *
+	 * Due to the timers I am certain about the 26mhz and 32khz clocks. I cannot directly
+	 * observe the qspi mux frequency, so the clock rates depend on ZTE's qspi mux selection
+	 * being correct.
+	 *
+	 * Two additional bits are specific to sound components - the mux for the LSP's TDM IP is
+	 * in matrixclk and gets passed down. I2S has a mux in LSP, which can select the dpll-d4
+	 * clock.
+	 */
+	GATE(ZX297520V3_LSP_MPLL_D5_WCLK,  "lsp-mpll-d5",   "matrix-mpll-d5",  0x7c,  0, 0),
+	GATE(ZX297520V3_LSP_MPLL_D4_WCLK,  "lsp-mpll-d4",   "matrix-mpll-d4",  0x7c,  1, 0),
+	GATE(ZX297520V3_LSP_MPLL_D6_WCLK,  "lsp-mpll-d6",   "matrix-mpll-d6",  0x7c,  2, 0),
+	GATE(ZX297520V3_LSP_MPLL_D8_WCLK,  "lsp-mpll-d8",   "matrix-mpll-d8",  0x7c,  3, 0),
+	GATE(ZX297520V3_LSP_MPLL_D12_WCLK, "lsp-mpll-d12",  "matrix-mpll-d12", 0x7c,  4, 0),
+	GATE(ZX297520V3_LSP_OSC26M_WCLK,   "lsp-osc26m",    "matrix-osc26m",   0x7c,  5, 0),
+	GATE(ZX297520V3_LSP_OSC32K_WCLK,   "lsp-osc32k",    "clock-32k",       0x7c,  6, 0),
+	GATE(ZX297520V3_LSP_PCLK,          "lsp-pclk",      clk_main[0],       0x7c,  7, 0),
+	GATE(ZX297520V3_LSP_TDM_WCLK,      "lsp-tdm-wclk",  "tdm-mux",         0x7c,  8, 0),
+	GATE(ZX297520V3_LSP_DPLL_D4_WCLK,  "lsp-dpll-d4",   "matrix-dpll-d4",  0x7c,  9, 0),
+};
+
+static const char * const zx297520v3_matrix_inputs[] = {
+	"osc26m", "osc32k",
+	"mpll", "mpll-d5", "dpll", "gpll", "gpll-d2", "wclk-osc26m",
+};
+
+static const struct zx_fixed_divider_desc zx297520v3_matrix_fixed_divs[] = {
+	{"matrix-mpll-d2",		"matrix-mpll",		 2},
+	{"matrix-mpll-d4",		"matrix-mpll",		 4},
+	/* div 5: provided as a separate line from topcrm */
+	{"matrix-mpll-d6",		"matrix-mpll",		 6},
+	{"matrix-mpll-d8",		"matrix-mpll",		 8},
+	{"matrix-mpll-d12",		"matrix-mpll",		12},
+	{"matrix-mpll-d16",		"matrix-mpll",		16},
+	{"matrix-mpll-d96",		"matrix-mpll",		96},
+
+	{"matrix-gpll-d2-d2",		"matrix-gpll-d2",	 2},
+	{"matrix-gpll-d2-d4",		"matrix-gpll-d2",	 4},
+
+	{"matrix-dpll-d4",		"matrix-dpll",		 4},
+};
+
+static int zx297520v3_matrix_init(struct regmap *map)
+{
+	u32 axi_val;
+	int res;
+	/* Read the global AXI speed selection, insert it into our ballot and enable voting */
+
+	res = regmap_read(map, 0x0, &axi_val);
+	if (res)
+		return res;
+
+	axi_val &= 0x7;
+	res = regmap_write(map, ZX297520V3_AXI_AP_VOTE, axi_val);
+	if (res)
+		return res;
+
+	/* If this fails for some reason our vote will simply be ignored */
+	return regmap_write(map, 0x12c, 1);
+}
+
+static const struct zx_clk_data zx297520v3_matrixclk_data = {
+	.init = zx297520v3_matrix_init,
+	.inputs = zx297520v3_matrix_inputs,
+	.num_inputs = ARRAY_SIZE(zx297520v3_matrix_inputs),
+	.fixed_divs = zx297520v3_matrix_fixed_divs,
+	.num_fixed_divs = ARRAY_SIZE(zx297520v3_matrix_fixed_divs),
+	.muxes = zx297520v3_matrix_muxes,
+	.num_muxes = ARRAY_SIZE(zx297520v3_matrix_muxes),
+	.gates = zx297520v3_matrix_gates,
+	.num_gates = ARRAY_SIZE(zx297520v3_matrix_gates),
+};
+
 static int clk_zx297520v3_probe(struct platform_device *pdev)
 {
 	const struct platform_device_id *id = platform_get_device_id(pdev);
@@ -526,6 +834,10 @@ static const struct platform_device_id clk_zx297520v3_ids[] = {
 		.name = "zx297520v3-topclk",
 		.driver_data = (kernel_ulong_t)&zx297520v3_topclk_data,
 	},
+	{
+		.name = "zx297520v3-matrixclk",
+		.driver_data = (kernel_ulong_t)&zx297520v3_matrixclk_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, clk_zx297520v3_ids);

-- 
2.54.0
