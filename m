Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A5A3BB9E1
	for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2026 20:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790540089; cv=none; b=LUmhGtJo1B5OYhOB1bTkNvx3c8vyVFwvGFKjs6HBnNyai1qjWrvtc20yQcmQT2q0AuLwz7dQuidRIcEQl/1Pi/qADeptB38nSarxCdjeQPZbodbcauiYKgBw6mAD64HOCE8h8RB2kM2LhD9xF3LMCaF9npYKybCXMwJhUtPG3Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790540089; c=relaxed/simple;
	bh=iCfndwLBIv8fTED0QyCjlr2F6ulQSthyYRD7lTreug0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PqPgteNyRTG2z0SnUcl/y8zhycQTroB7pGxBFraB+bf/EF2DWOiDrDAxk/wf9t314wFMmr4rl4hY68zouakH/5j3uIANEe8tjxExchpqpJt9MZvHNl0afiHNzD88gM3vSOOqhCsbqmDUvikOUOJXbfsLxiy7LS0pjpKE0f52CKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2tChclm; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2tChclm"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-482f635552aso1869620f8f.2
        for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2026 13:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540083; x=1791144883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QNif68vBweclNkbVJu08PNYirXK6LBRMMEpOMCQuVXg=;
        b=O2tChclmpyz1wEJlSXPvqFziDDsiiCR2sjcObsUEo6aNMtwS+mgMlHcORLFOBAJoIB
         jHo0Vi/CPrIoUVmDbkJf6zXy4Qq+ahuzv7XsU7Vn4KFDmBLZ7jmWNTYUaYLxESpYz6Pm
         bPbH9xnD/yq1lPnaWfZSTbfx7HfyJp1+jBPmuuftwCsL4FhyvNuQZm5yD1tuNCUQCzme
         oRdvQ+MXC9byb60IeCrvd20F8P5qOTSPmuwWEOzANomHvSobqD/CIaEgA5TSlcrNqDEU
         8xdJ/4k/D6e4R63qDnSsAc35k7ZrjzfnvEnFmy7TBE9JdheRN5v608EQyBuxw02uG92E
         lpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540083; x=1791144883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QNif68vBweclNkbVJu08PNYirXK6LBRMMEpOMCQuVXg=;
        b=xk+XOnqCGRi35h2BuNGNvkvKYUowGXPevXPBXVOT1IFq7M8P6aJ3hv0YeXD8Cq4vcZ
         1le8t1pvSeOjWgZf54NTEWe2nA6TiwN9m+DImMnRnizUkbZn7Gb/FfoltsW3RMbhSnIN
         qAL4U4lwNqFwh6vrdMJ7yEc1G6XA6O5KHWSsGbQFbvIwaDbcYdQ4zyD+1PB8KjakovdU
         TXF6dqH1Q+UUMgjcEfF1kPSvJcKdH0BiDGNmYaNm5Ldt0uVpHa+layXGr/+04GX5pV26
         MpQjBRqHIGkXhZrIuDnxig9ndjnL43kOLbN3dI4uLGo7PnWlOTd/d67HkMj02GJzK46P
         fCbg==
X-Gm-Message-State: AFq9FYLx++mnrJWyUC8f4YJiZ6wmyENRxDQyIdiHIs5fbq8In4POxeEM
	tKPzamAK9p0PG9WXJtUvuXi2Qanoni9JzGFItg0VZrV9MB8BDnjiN4/M
X-Gm-Gg: AYBFou3J+EaTJNaV0KvRcfMerTOTbF3QyQ0xHl6Kf9MU9ojx5nNbFgu0PZzuKN9u5zk
	bJ3s7zuGel7omU/6vw+MLXc8h069HCdhgb/u9szwwcHa7FQQ8ikbKKf4enEj3WzE/pbDXjiNskE
	SfYMgb5dgSAWrWCq33UKQCG1JBCRWnfWxy+HmbbKMsnL4atWzuf6JmeA7B8s2+Cn+v6wbxKuPJ9
	ankpRYUmwycHEJuPvfcwvw5UVTRWz674gM/mwcEivjL2jXqqfFyo8kDCxFzVQz64gGB1ZAUjqe1
	4k9lHsvnxB/IacJEYExMl9IbpxVeAnNDjyrkc31RkED9Wdu4FWCxSzCeejn7cHTbcuWFRadfL2s
	Q+T/DkgKWWoTbUpia9SfqUiBTg7TK3nTxbEOHu4jchSC0Ocn3YC4/n6EvRUZcIDYsW0UpBg5ONw
	kmyw4nvn1swQYE/w7cty2sWJaV+hmq0LyIycAEAPFh0cSDjXQMLyv+l6cHVBhevGvQ9Gr5pwiM5
	EYrNj1F
X-Received: by 2002:a5d:64ee:0:b0:488:8c99:fbc3 with SMTP id ffacd0b85a97d-4888c99fd87mr3943532f8f.5.1790540083230;
        Sun, 27 Sep 2026 13:14:43 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.96.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm21781514f8f.13.2026.09.27.13.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:14:42 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 27 Sep 2026 23:13:38 +0300
Subject: [PATCH v13 10/13] clk: zte: Introduce a driver for zx297520v3
 matrix clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260927-zx29clk-v13-10-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
In-Reply-To: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=27882;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=iCfndwLBIv8fTED0QyCjlr2F6ulQSthyYRD7lTreug0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBquXj1pD28ajK7uJzYGhJvHAGjD7e5OxHh7X5Ux
 l7naXq07yuJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarl49RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKMww//enWWAPEdMAkkrqlct+G37rureZOQ9io
 kN/rRfS5urImr9re6LmdmFiccEaMh6SwvevUWdHrysQStNo8LuCGBbiS3mY31UbUghKuwTKUO4v
 +gZsW2+fy0noT2ZhUChckWiIMkbfd0FPMfRzPE+MxEbJKBO9KE9fMNvElM3zmqD+D2psyBx+2CV
 c6xRUJYijO4cr70hqf+iAVhwB1d3Jb/yLG2uSoAj+YCNON8Nna39YQFYGqkQxCAGEY5EB1My+BD
 ssmqionA31D75H61XJz6G/eB8QNbWsnLrq0fupUplPjcLsGq/cy+5+lRBkh461szuk7RrnJrL3o
 ITMtw3D0nasYIczVhzIQD1//MFS1HoxRMgLDFSEk6E7XetcmVkyWIW9klD+f0DLGMrzsh/LnSDE
 yIwndGMqe4qw38eZGL6VRWrXTohWaITmW9s2UVUE15bYm2qEpppqxeAO4qqPjXBNuaNEO3e7fN+
 cPfaAQPC147RYo2rsswMcldk8e+5sTB023/TY6+MELnTm5u38Zx0WXQ02byaFwsiHdOhXC05y2L
 KhGpIUKTujYyVkcwTWlzKFU30w1ariQjTskpErPYqCrFZUZ9JxDqSUKHi+hLgOQ+d0gie730ThN
 TWr60WDc4AWLxV9AirrIeF+1atHqxpowWSo5cE1KrFlp2IjB8u3A=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This clock controller controls high speed devices: CPU, DMA, RAM, SDIO,
Ethernet. The only non-clock, non-reset registers I have spotted here
are hardware spinlocks.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Version 13: Export the accidentally forgotten ZX297520V3_RFFE_WCLK
(Sashiko)

Version 12: Add RFFE clock. Is part of the SSC device, which looks like
an SPI-like controller that provides a control channel to the LTE radio
devices.

Export LTE_MODEM clocks. The LTE firmware needs it enabled, but otherwise
manages the LTE_MODEM device autonomously, so I have no idea how the
device works or what it is composed of.

Version 10:
Add ZSP PCLK. ZSP clock gates are in 0x34. 0x3c is another reset register.
Improve ZSP WCLK mux.

Version 9:
Link internal parents by an (internal) clock ID rather than names.

There are 3 intentional changes vs version 8 in the clock tree:
"gmac-ahb" depends on the ahb clock imported from topcrm. This was
already the case before, but it was missing from the bindings and the
global name matching obscured it.

When re-testing other devices for potential topcrm->ahb dependencies I
noticed that the two SDIO devices take their pclk from topcrm->ahb as
well.

@Sashiko: Any possible other clock tree change compared to version 8 is
unintentional and a likely bug.

Version 8:
Add another distribution gate register: 0x118 gates off matrix-generated
divisions of mpll, dpll and gpll. It nicely fits the top->matrix forward
picture.

AXI 6.5 MHz is not an mpll child. I must have done something wrong when
originally testing this

Add explanations about additional ARM architected timer controls.

Add gates for unknown LTE hardware at offset 0x60. They are not exported
in the bindings because the actual name of the consumer isn't clear -
but if dpll is unprepared and feeds a bypass 26 MHz signal, this device
starts spamming IRQs (although the 0x118 and top+0x140 gates also
prevent this usually)

Double-check pclk and wclk of all devices. The SDIO and EDCP clocks were
flipped in previous submissions.

Version 7:
Reduced the input clocks a lot. Most MPLL subdivisions are children of
the same gate in top, so put the fixed factor clocks here.

Added a few more clocks: DDR_CTRL, AXI bus, ARM architected timer.
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
 drivers/clk/zte/clk-zx297520v3.c | 526 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 526 insertions(+)

diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
index 68bfeab84d74..d5f8bc4064bd 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -812,6 +812,528 @@ static const struct zx_clk_data zx297520v3_topclk_data = {
 	.num_exports = ARRAY_SIZE(zx297520v3_top_exports),
 };
 
+enum matrix_clock_ids {
+	ZX_CLK_MATRIX_OSC26M_D4,
+	ZX_CLK_MATRIX_MPLL_D2_PREGATE,
+	ZX_CLK_MATRIX_MPLL_D4_PREGATE,
+	ZX_CLK_MATRIX_MPLL_D6_PREGATE,
+	ZX_CLK_MATRIX_MPLL_D8_PREGATE,
+	ZX_CLK_MATRIX_MPLL_D12_PREGATE,
+	ZX_CLK_MATRIX_MPLL_D16_PREGATE,
+	ZX_CLK_MATRIX_GPLL_D2_D2_PREGATE,
+	ZX_CLK_MATRIX_GPLL_D2_D4_PREGATE,
+	ZX_CLK_MATRIX_DPLL_D2_PREGATE,
+	ZX_CLK_MATRIX_DPLL_D4_PREGATE,
+
+	ZX_CLK_MATRIX_MPLL_D16,
+	ZX_CLK_MATRIX_MPLL_D12,
+	ZX_CLK_MATRIX_MPLL_D8,
+	ZX_CLK_MATRIX_MPLL_D6,
+	ZX_CLK_MATRIX_MPLL_D4,
+	ZX_CLK_MATRIX_MPLL_D2,
+	ZX_CLK_MATRIX_DPLL_D4,
+	ZX_CLK_MATRIX_DPLL_D2,
+	ZX_CLK_MATRIX_GPLL_D2_D4,
+	ZX_CLK_MATRIX_GPLL_D2_D2,
+
+	ZX_CLK_CPU_MUX,
+	ZX_CLK_ZSP_MUX,
+	ZX_CLK_DDR_CTRL_MUX,
+	ZX_CLK_SD0_MUX,
+	ZX_CLK_SD1_MUX,
+	ZX_CLK_NAND_MUX,
+	ZX_CLK_EDCP_MUX,
+	ZX_CLK_TDM_MUX,
+	ZX_CLK_AXI_MUX,
+
+	ZX_CLK_SYS_TIMER_WCLK,
+	ZX_CLK_CPU_WCLK,
+	ZX_CLK_CPU_PCLK,
+	ZX_CLK_ZSP_WCLK,
+	ZX_CLK_ZSP_PCLK,
+	ZX_CLK_DDR_CTRL_PCLK,
+	ZX_CLK_DDR_CTRL_WCLK,
+	ZX_CLK_SD0_PCLK,
+	ZX_CLK_SD0_WCLK,
+	ZX_CLK_SD0_CDET,
+	ZX_CLK_SD1_PCLK,
+	ZX_CLK_SD1_WCLK,
+	ZX_CLK_SD1_CDET,
+	ZX_CLK_NAND_WCLK,
+	ZX_CLK_NAND_PCLK,
+	ZX_CLK_LTE_MODEM_WCLK,
+	ZX_CLK_LTE_MODEM_PCLK,
+	ZX_CLK_EDCP_PCLK,
+	ZX_CLK_EDCP_WCLK,
+	ZX_CLK_RFFE_WCLK,
+	ZX_CLK_SSC_WCLK,
+	ZX_CLK_SSC_PCLK,
+	ZX_CLK_PDCFG_WCLK,
+	ZX_CLK_PDCFG_PCLK,
+	ZX_CLK_MBOX_PCLK,
+	ZX_CLK_SRAM0_PCLK,
+	ZX_CLK_GSM_CFG_PCLK,
+	ZX_CLK_GMAC_WCLK,
+	ZX_CLK_GMAC_PCLK,
+	ZX_CLK_GMAC_AHB,
+	ZX_CLK_AXI_WCLK,
+	ZX_CLK_DMA_PCLK,
+	ZX_CLK_VOU_WCLK,
+	ZX_CLK_VOU_PCLK,
+	ZX_CLK_TOLSP_MPLL_D5_WCLK,
+	ZX_CLK_TOLSP_MPLL_D4_WCLK,
+	ZX_CLK_TOLSP_MPLL_D6_WCLK,
+	ZX_CLK_TOLSP_MPLL_D8_WCLK,
+	ZX_CLK_TOLSP_MPLL_D12_WCLK,
+	ZX_CLK_TOLSP_OSC26M_WCLK,
+	ZX_CLK_TOLSP_OSC32K_WCLK,
+	ZX_CLK_TOLSP_PCLK,
+	ZX_CLK_TOLSP_TDM_WCLK,
+	ZX_CLK_TOLSP_DPLL_D4_WCLK,
+};
+
+/*
+ * For devices which have a working driver the work clock can be figured out by gating off registers
+ * in topcrm+0x140. This is used for devices where I can't interpret the register contents yet.
+ */
+static const struct zx_parent_desc matrix_unk = PARENT_FW("wclk-osc26m");
+
+static const struct zx_parent_desc cpu_sel[] = {
+	PARENT_FW("wclk-osc26m"),
+	PARENT_FW("mpll"),			/* 624 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D2),	/* 312 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D4),	/* 156 MHz */
+};
+
+/*
+ * Figuring these values out is a bit tricky. The best liveness check of the ZSP is reading its TCM
+ * at 0x81000000. If it is clocked up and out of reset reading it will succeed. Otherwise, reading
+ * will stall. Value 1 depends on topcrm+0x140, bit 13, but not any matrixcrm+0x118 gate, so it is
+ * likely dpll without a div. Mux value 2 depends on 0x118 bit 5, so mpll-d2. Mux value 3 depends on
+ * 0x118 bit 4, so mpll-d4. Mux value 0 in turn depends on topcrm+0x140, bit 24 (osc26m), so it
+ * follows the usual pattern that mux 0 is osc26m.
+ *
+ * If the firmware is running and fed with initialization data it will start writing status messages
+ * on UART1. An interruption of these messages or a failure to respond to rpmsg is not proof that
+ * the ZSP's clock has been disabled. The firmware's workings depend on regular timer and LTE device
+ * IRQs, so one of these devices might have been stopped instead.
+ */
+static const struct zx_parent_desc zsp_sel[] = {
+	PARENT_FW("wclk-osc26m"),
+	PARENT_FW("dpll"),			/* 491.52 MHz, boot default */
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D2),	/* 312 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D4),	/* 156 MHz */
+};
+
+/*
+ * We can't realistically change DDR speed while running an OS out of DDR (it reads garbage for a
+ * short while on transition), but we need to know if we have to keep gpll alive. 32 MB devices use
+ * 200 MHz, while 64/128 MB ones use 156 MHz.
+ */
+static const struct zx_parent_desc ddr_ctrl_sel[] = {
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D4),	/* 156 MHz */
+	PARENT_FW("gpll"),			/* 200 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D6),	/* 104 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D8),	/* 78 MHz */
+};
+
+static const struct zx_parent_desc sd0_sel[] = {
+	PARENT_FW("wclk-osc26m"),
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D4),	/* 156 MHz */
+	PARENT_FW("gpll-d2"),			/* 100 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D8),	/* 78 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_GPLL_D2_D2),	/* 50 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_GPLL_D2_D4),	/* 25 MHz */
+};
+
+static const struct zx_parent_desc sd1_sel[] = {
+	PARENT_FW("wclk-osc26m"),
+	PARENT_FW("gpll-d2"),			/* 100 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D8),	/* 78 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_GPLL_D2_D2),	/* 50 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D16),	/* 39 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_GPLL_D2_D4),	/* 25 MHz */
+};
+
+/*
+ * ZTE's kernel puts the high frequency first, but this is against the usual convention on this SoC.
+ * I don't have any device that has a raw NAND controller though.
+ */
+static const struct zx_parent_desc nand_sel[] = {
+	PARENT_FW("wclk-osc26m"),
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D4),	/* 156 MHz */
+};
+
+static const struct zx_parent_desc edcp_sel[] = {
+	PARENT_FW("wclk-osc26m"),
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D4),	/* 156 MHz */
+	PARENT_FW("mpll-d5"),			/* 124.8 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D6),	/* 104 MHz */
+};
+
+/*
+ * The 122.88 MHz selection of value 1 is given in ZTE's kernel and matches up to observation: Print
+ * the TDM counter at regular intervals and look at its increase at values 0/1/2. It increases by
+ * about 310*26 for value 0, 310*122.88 for value 1 and 310*104 for value 2.
+ *
+ * Mux value 1 is gated off by matrix+0x118 bit 8. Values 2 and 3 are both gated off by 0x118 bit 3,
+ * suggesting that they select the same parent.
+ */
+static const struct zx_parent_desc tdm_sel[] = {
+	PARENT_FW("wclk-osc26m"),
+	PARENT_ID(ZX_CLK_MATRIX_DPLL_D4),	/* 122.88 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D6),	/* 104 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D6),
+};
+
+/*
+ * ZTE's firmware uses 0x128 as the PHY's vote and names 0x120 as "PS" and 0x124 as "AP" vote.
+ * However, their cpufreq driver ultimately uses the "PS" define and thus writes to 0x120, which can
+ * be observed in the running system.
+ */
+#define ZX297520V3_AXI_AP_VOTE 0x120
+static const struct zx_parent_desc axi_sel[] = {
+	PARENT_FW("wclk-osc26m"),
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D4),	/* 156 MHz */
+	PARENT_FW("mpll-d5"),			/* 124.8 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D6),	/* 104 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D8),	/* 78 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D12),	/* 52 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D16),	/* 39 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_OSC26M_D4),	/* 6.5 MHz */
+};
+
+static const struct zx_clock zx297520v3_matrix_clocks[] = {
+	[ZX_CLK_MATRIX_OSC26M_D4] = FIXED_DIV("matrix-osc26m-d4", PARENT_FW("wclk-osc26m"), 4),
+	[ZX_CLK_MATRIX_MPLL_D2_PREGATE] = FIXED_DIV("matrix-mpll-d2-pregate", PARENT_FW("mpll"), 2),
+	[ZX_CLK_MATRIX_MPLL_D4_PREGATE] = FIXED_DIV("matrix-mpll-d4-pregate", PARENT_FW("mpll"), 4),
+	/* div 5: provided as a separate line from topcrm */
+	[ZX_CLK_MATRIX_MPLL_D6_PREGATE] = FIXED_DIV("matrix-mpll-d6-pregate", PARENT_FW("mpll"), 6),
+	[ZX_CLK_MATRIX_MPLL_D8_PREGATE] = FIXED_DIV("matrix-mpll-d8-pregate", PARENT_FW("mpll"), 8),
+	[ZX_CLK_MATRIX_MPLL_D12_PREGATE] = FIXED_DIV("matrix-mpll-d12-pregate", PARENT_FW("mpll"),
+						     12),
+	[ZX_CLK_MATRIX_MPLL_D16_PREGATE] = FIXED_DIV("matrix-mpll-d16-pregate", PARENT_FW("mpll"),
+						     16),
+
+	[ZX_CLK_MATRIX_GPLL_D2_D2_PREGATE] = FIXED_DIV("matrix-gpll-d2-d2-pregate",
+						       PARENT_FW("gpll-d2"), 2),
+	[ZX_CLK_MATRIX_GPLL_D2_D4_PREGATE] = FIXED_DIV("matrix-gpll-d2-d4-pregate",
+						       PARENT_FW("gpll-d2"), 4),
+
+	[ZX_CLK_MATRIX_DPLL_D2_PREGATE] = FIXED_DIV("matrix-dpll-d2-pregate", PARENT_FW("dpll"), 2),
+	[ZX_CLK_MATRIX_DPLL_D4_PREGATE] = FIXED_DIV("matrix-dpll-d4-pregate", PARENT_FW("dpll"), 4),
+
+	/*
+	 * Matrix distribution gates: Every matrix-generated subdivision of the input PLLs
+	 * has a gate in 0x118. The original inputs from topcrm (mpll 624, mpll 124.8, gpll 200,
+	 * gpll 100, dpll 491.52) do not.
+	 *
+	 * Bit 8 is consumed by TDM and the frequency dpll/4 holds up to observation. Bit 9 is
+	 * consumed by an unknown device and the frequency is guessed from the pattern that lower
+	 * bits gate lower frequencies.
+	 */
+	[ZX_CLK_MATRIX_MPLL_D16] = GATE("matrix-mpll-d16",
+					PARENT_ID(ZX_CLK_MATRIX_MPLL_D16_PREGATE), 0x118, 0,
+					ZX297520V3_AXI_CANDIDATE),
+	[ZX_CLK_MATRIX_MPLL_D12] = GATE("matrix-mpll-d12",
+					PARENT_ID(ZX_CLK_MATRIX_MPLL_D12_PREGATE), 0x118, 1,
+					ZX297520V3_AXI_CANDIDATE),
+	[ZX_CLK_MATRIX_MPLL_D8] = GATE("matrix-mpll-d8",
+				       PARENT_ID(ZX_CLK_MATRIX_MPLL_D8_PREGATE), 0x118, 2,
+				       ZX297520V3_AXI_CANDIDATE),
+	[ZX_CLK_MATRIX_MPLL_D6] = GATE("matrix-mpll-d6",
+				       PARENT_ID(ZX_CLK_MATRIX_MPLL_D6_PREGATE), 0x118, 3,
+				       ZX297520V3_AXI_CANDIDATE),
+	[ZX_CLK_MATRIX_MPLL_D4] = GATE("matrix-mpll-d4",
+				       PARENT_ID(ZX_CLK_MATRIX_MPLL_D4_PREGATE), 0x118, 4,
+				       ZX297520V3_AXI_CANDIDATE),
+	[ZX_CLK_MATRIX_MPLL_D2] = GATE("matrix-mpll-d2",
+					PARENT_ID(ZX_CLK_MATRIX_MPLL_D2_PREGATE), 0x118, 5, 0),
+
+	[ZX_CLK_MATRIX_DPLL_D4] = GATE("matrix-dpll-d4",
+				       PARENT_ID(ZX_CLK_MATRIX_DPLL_D4_PREGATE), 0x118, 8, 0),
+	[ZX_CLK_MATRIX_DPLL_D2] = GATE("matrix-dpll-d2",
+				       PARENT_ID(ZX_CLK_MATRIX_DPLL_D2_PREGATE), 0x118, 9, 0),
+
+	[ZX_CLK_MATRIX_GPLL_D2_D4] = GATE("matrix-gpll-d2-d4",
+					  PARENT_ID(ZX_CLK_MATRIX_GPLL_D2_D4_PREGATE),
+					  0x118, 12, 0),
+	[ZX_CLK_MATRIX_GPLL_D2_D2] = GATE("matrix-gpll-d2-d2",
+					  PARENT_ID(ZX_CLK_MATRIX_GPLL_D2_D2_PREGATE),
+					  0x118, 13, 0),
+
+	[ZX_CLK_CPU_MUX]          = MUX("cpu-mux", cpu_sel, 0x20, 0, 2),
+	[ZX_CLK_ZSP_MUX]          = MUX("zsp-mux", zsp_sel, 0x30, 0, 2),
+	[ZX_CLK_DDR_CTRL_MUX]     = MUX("ddr-ctrl-mux", ddr_ctrl_sel, 0x50, 0, 2),
+	[ZX_CLK_SD0_MUX]          = MUX("sd0-mux", sd0_sel, 0x50, 4, 3),
+	[ZX_CLK_SD1_MUX]          = MUX("sd1-mux", sd1_sel, 0x50, 8, 3),
+	[ZX_CLK_NAND_MUX]         = MUX("nand-mux", nand_sel, 0x50, 12, 2),
+	[ZX_CLK_EDCP_MUX]         = MUX("edcp-mux", edcp_sel, 0x50, 16, 2),
+	[ZX_CLK_TDM_MUX]          = MUX("tdm-mux", tdm_sel, 0x50, 24, 2),
+	[ZX_CLK_AXI_MUX]          = MUX("axi-mux", axi_sel, ZX297520V3_AXI_AP_VOTE, 0, 3),
+
+	/*
+	 * This bit cuts off the clock signal to the ARM architected timer, which the kernel uses
+	 * as its main timer. It isn't critical per se - there are plenty of proprietary timers
+	 * available that could be used - but the arm arch timer binding does not accept a clock, so
+	 * this CCF driver won't know if the timer is in use.
+	 *
+	 * This clock is fed by the osc26m gate in topcrm+0x140 - this critical clock here protects
+	 * its parent.
+	 *
+	 * Registers 0x148, 0x14c, 0x150, 0x154 allow setting and clearing the timer counter. To
+	 * set the timer, load a value into 0x148 (high 32 bits) and 0x14c (low 32 bits), then
+	 * toggle 0x150 to 1. 0x150 will automatically reset to 0. 0x154 sets the timer to some
+	 * "clear" value, but this value isn't 0.
+	 */
+	[ZX_CLK_SYS_TIMER_WCLK]   = GATE("sys-timer-wclk", PARENT_FW("wclk-osc26m"), 0x144, 1,
+					 CLK_IS_CRITICAL),
+
+	/*
+	 * Both 0x24 and 0x28 bits 1 and 2 stop the CPU. There is also a bit in topcrm+0x138, which
+	 * ZTE's uboot calls "A53 reset", which also stops the CPU. I can't really tell the
+	 * difference between matrix+0x28 and top+0x138. The clock (matrix+0x24) can be disabled
+	 * and enabled from the Cortex M0 and it will nicely stop and restart the A53, retaining
+	 * all state.
+	 */
+	[ZX_CLK_CPU_WCLK]         = GATE("cpu-wclk", PARENT_ID(ZX_CLK_CPU_MUX), 0x24, 1,
+					 CLK_IS_CRITICAL),
+	[ZX_CLK_CPU_PCLK]         = GATE("cpu-pclk", clk_main[0], 0x24, 2, CLK_IS_CRITICAL),
+
+	/*
+	 * There are a lot more controls in matrix+0x100. 13-16 appear to be 4 different AXI
+	 * channels for different priorities. Bit 19 appears to be the DDR PHY wclk.
+	 *
+	 * The important task is to keep gpll enabled if the bootloader selected a gpll-based rate
+	 * for RAM.
+	 */
+	[ZX_CLK_DDR_CTRL_PCLK]    = GATE("ddr-ctrl-pclk", clk_main[0], 0x100, 17, CLK_IS_CRITICAL),
+	[ZX_CLK_DDR_CTRL_WCLK]    = GATE("ddr-ctrl-wclk", PARENT_ID(ZX_CLK_DDR_CTRL_MUX), 0x100, 18,
+					 CLK_IS_CRITICAL),
+
+	[ZX_CLK_ZSP_PCLK]         = GATE("zsp-pclk", clk_main[0], 0x34, 0, 0),
+	[ZX_CLK_ZSP_WCLK]         = GATE("zsp-wclk", PARENT_ID(ZX_CLK_ZSP_MUX), 0x34, 1, 0),
+
+	/* Both SDIO controllers depend on the ahb-pclk for register access. */
+	[ZX_CLK_SD0_PCLK]         = GATE("sd0-pclk", PARENT_FW("ahb"), 0x54, 12, 0),
+	[ZX_CLK_SD0_WCLK]         = GATE("sd0-wclk", PARENT_ID(ZX_CLK_SD0_MUX), 0x54, 13, 0),
+	[ZX_CLK_SD0_CDET]         = GATE("sd0-cdet", PARENT_FW("osc32k"), 0x54, 14, 0),
+	[ZX_CLK_SD1_PCLK]         = GATE("sd1-pclk", PARENT_FW("ahb"), 0x54, 4, 0),
+	[ZX_CLK_SD1_WCLK]         = GATE("sd1-wclk", PARENT_ID(ZX_CLK_SD1_MUX), 0x54, 5, 0),
+	/*
+	 * I don't know how the cdet clock works. Card detection in the way the dwc,mmc driver uses
+	 * it appears broken no matter this clock's setting.
+	 */
+	[ZX_CLK_SD1_CDET]         = GATE("sd1-cdet", PARENT_FW("osc32k"), 0x54, 6, 0),
+
+	/* This is some "denali" NAND, not the qspi connected one */
+	[ZX_CLK_NAND_WCLK]        = GATE("nand-wclk", PARENT_ID(ZX_CLK_NAND_MUX), 0x54, 20, 0),
+	[ZX_CLK_NAND_PCLK]        = GATE("nand-pclk", clk_main[0], 0x54, 21, 0),
+
+	/*
+	 * There is a set of gates for an unknown device at matrix+0x60. It is some LTE related
+	 * device and the pclk gates off mmio areas 0xf8000000 and 0xfc000000. These areas are only
+	 * accessible to M0 and ZSP, not the AP.
+	 *
+	 * If it is fed an incorrect clock, e.g. because dpll is not locked and outputs 26 MHz, it
+	 * will spam IRQs at SPI 68. This is likely a distress notification that some
+	 * internal PLL did not lock or similar. ZTE's kernel has two defines for SPI 68:
+	 * "LTE_TPU_INT_PS_INT" and "VOU_OSD_INT". The latter is unlikely because VOU related clocks
+	 * sit in matrix+0x168.
+	 *
+	 * The address space in 0xfc000000 appears to contain a number of different devices, so I
+	 * have named the clock LTE_MODEM_{W/P}CLK. It is not known how this mmio area and clock
+	 * relates to SPI 68 or the ABB clock in topcrm+0x144. Because it is not accessible to the
+	 * AP at all, I don't think we need to care beyond turning on the clocks before booting the
+	 * ZSP.
+	 *
+	 * Bit 9 in register 0x118 turns the IRQs off, so it is the immediate wclk parent. It isn't
+	 * clear what divisor of dpll it is using though. Following the pattern that lower
+	 * frequencies are gated by lower bits, it would indicate dpll/2 or dpll/3.
+	 */
+	[ZX_CLK_LTE_MODEM_WCLK]   = GATE("lte-modem-wclk", PARENT_ID(ZX_CLK_MATRIX_DPLL_D2),
+					 0x60, 0, 0),
+	[ZX_CLK_LTE_MODEM_PCLK]   = GATE("lte-modem-pclk", clk_main[0],
+					 0x60, 2, 0),
+
+	[ZX_CLK_EDCP_PCLK]        = GATE("edcp-pclk", clk_main[0], 0x64, 1, 0),
+	[ZX_CLK_EDCP_WCLK]        = GATE("edcp-wclk", PARENT_ID(ZX_CLK_EDCP_MUX), 0x64, 2, 0),
+
+	/*
+	 * This seems to be another SPI-Like device. cpko.ko uses it to send calibration blobs to
+	 * the LTE radio hardware. After initialization the ZSP firmware takes over control of this
+	 * device.
+	 *
+	 * Testing reveals the parent as matrix's 104 MHz mpll fraction.
+	 */
+	[ZX_CLK_RFFE_WCLK]        = GATE("rffe-wclk", PARENT_ID(ZX_CLK_MATRIX_MPLL_D6), 0x84, 0, 0),
+	[ZX_CLK_SSC_WCLK]         = GATE("ssc-wclk", PARENT_ID(ZX_CLK_MATRIX_MPLL_D6), 0x84, 1, 0),
+	[ZX_CLK_SSC_PCLK]         = GATE("ssc-pclk", clk_main[0], 0x84, 2, 0),
+
+	/*
+	 * PDCFG. Like PMM, either clock bit will allow the device to function. Probably there is
+	 * no wclk line at all and the two bits are just an artifact of generally having two bits
+	 * per device.
+	 */
+	[ZX_CLK_PDCFG_WCLK]       = GATE("pdcfg-wclk", matrix_unk, 0x88, 0, CLK_IS_CRITICAL),
+	[ZX_CLK_PDCFG_PCLK]       = GATE("pdcfg-pclk", clk_main[0], 0x88, 1, CLK_IS_CRITICAL),
+	[ZX_CLK_MBOX_PCLK]        = GATE("mbox-pclk", clk_main[0], 0x88, 2, 0),
+	[ZX_CLK_SRAM0_PCLK]       = GATE("sram0-pclk", clk_main[0], 0x88, 4, 0),
+	[ZX_CLK_GSM_CFG_PCLK]     = GATE("gsm-cfg-pclk", clk_main[0], 0x88, 8, 0),
+
+	/*
+	 * ZTE's driver has a statement to the effect of *(top->base+0x11c) = 5, with a comment
+	 * suggesting that this sets a 50 MHz clock. The clock code itself lists GMAC clocks in
+	 * matrix+0x110 and lists the parents of these clocks as 50 MHz gpll output, but
+	 * the downstream ZTE GMAC driver never enables the clocks. It turns out ZTE's code is
+	 * highly misleading.
+	 *
+	 * The GMAC's work clock is definitely not any gpll output because it keeps working fine
+	 * with gpll disabled. Gating off matrix-osc26m breaks GMAC, so it must be its parent.
+	 *
+	 * The GMAC Gates are left enabled by the boot loader and are required for the GMAC to work.
+	 *
+	 * As for the 50 MHz comment: See rmiiphy-wclk.
+	 *
+	 * The gmac-ahb clock is a child of topcrm's ahb-pclk and is required for DMA transfers in
+	 * and out of GMAC. Without it, GMAC still receives ethernet frames, but can't drain them
+	 * to memory and will eventually set the RX FIFO overflow flag.
+	 */
+	[ZX_CLK_GMAC_WCLK]        = GATE("gmac-wclk", PARENT_FW("wclk-osc26m"), 0x110, 0, 0),
+	[ZX_CLK_GMAC_PCLK]        = GATE("gmac-pclk", clk_main[0], 0x110, 1, 0),
+	[ZX_CLK_GMAC_AHB]         = GATE("gmac-ahb", PARENT_FW("ahb"), 0x110, 2, 0),
+
+	/*
+	 * Is there an AXI bus gate? The symptom of cutting off the AXI mux selection in top+0x140
+	 * is that matrixcrm becomes unreadable from m0 and A53 hangs. Inside matrix itself only 3
+	 * bits fit that bill: 0x8c bits 5, 6, 7. It seems a bit self-defeating to have a clock
+	 * gate that shuts off access to itself though. I expect a clock gate for the bus
+	 * somewhere, and the mux exists, so exposing one AXI clock in the bindings is the correct
+	 * thing to do. It also serves to tell the kernel to keep the mux's parent enabled.
+	 *
+	 * Register 0x8c has 12 settable bits (0xfff). Ultimately it doesn't matter much which
+	 * do-not-remove bit we don't remove. Other bits in this register behave like gates (e.g
+	 * bits 11:8 cut off USB temporarily), so I think we are looking in the right place.
+	 *
+	 * If an explanation for the remaining bits surfaces and they are further gates and/or
+	 * resets, add them to the bindings.
+	 */
+	[ZX_CLK_AXI_WCLK]         = GATE("axi-wclk", PARENT_ID(ZX_CLK_AXI_MUX), 0x8c, 5,
+					 CLK_IS_CRITICAL),
+
+	[ZX_CLK_DMA_PCLK]         = GATE("dma-pclk", clk_main[0], 0x94, 3, 0),
+
+	/*
+	 * There are a lot more VOU related controls in these registers, but turning off the main
+	 * clock seems to shut off the entire VOU MMIO range.
+	 */
+	[ZX_CLK_VOU_WCLK]         = GATE("vou-wclk", matrix_unk, 0x168, 0, 0),
+	[ZX_CLK_VOU_PCLK]         = GATE("vou-pclk", clk_main[0], 0x168, 1, 0),
+
+	/*
+	 * LSP uplink clocks. The pclk is fairly obvious (disabling it shuts off the entire LSP
+	 * register area). The wclk speeds were deduced by setting timers and qspi muxes to a
+	 * specific speed and seeing which bit in matrix+0x7c needs to be enabled for the device
+	 * to work.
+	 *
+	 * Due to the timers I am certain about the 26 MHz and 32 kHz clocks. I cannot directly
+	 * observe the qspi mux frequency, so the clock rates depend on ZTE's qspi mux selection
+	 * being correct.
+	 *
+	 * Two additional bits are specific to sound components - the mux for the LSP's TDM IP is
+	 * in matrixcrm and gets passed down. I2S has a mux in LSP, which can select the dpll-d4
+	 * clock.
+	 */
+	[ZX_CLK_TOLSP_MPLL_D5_WCLK]  = GATE("lsp-mpll-d5", PARENT_FW("mpll-d5"), 0x7c, 0, 0),
+	[ZX_CLK_TOLSP_MPLL_D4_WCLK]  = GATE("lsp-mpll-d4", PARENT_ID(ZX_CLK_MATRIX_MPLL_D4),
+					    0x7c, 1, 0),
+	[ZX_CLK_TOLSP_MPLL_D6_WCLK]  = GATE("lsp-mpll-d6", PARENT_ID(ZX_CLK_MATRIX_MPLL_D6),
+					    0x7c, 2, 0),
+	[ZX_CLK_TOLSP_MPLL_D8_WCLK]  = GATE("lsp-mpll-d8", PARENT_ID(ZX_CLK_MATRIX_MPLL_D8),
+					    0x7c, 3, 0),
+	[ZX_CLK_TOLSP_MPLL_D12_WCLK] = GATE("lsp-mpll-d12", PARENT_ID(ZX_CLK_MATRIX_MPLL_D12),
+					    0x7c, 4, 0),
+	[ZX_CLK_TOLSP_OSC26M_WCLK]   = GATE("lsp-osc26m", PARENT_FW("wclk-osc26m"), 0x7c, 5, 0),
+	[ZX_CLK_TOLSP_OSC32K_WCLK]   = GATE("lsp-osc32k", PARENT_FW("osc32k"), 0x7c, 6, 0),
+	[ZX_CLK_TOLSP_PCLK]          = GATE("lsp-pclk", clk_main[0], 0x7c, 7, 0),
+	[ZX_CLK_TOLSP_TDM_WCLK]      = GATE("lsp-tdm-wclk", PARENT_ID(ZX_CLK_TDM_MUX), 0x7c, 8, 0),
+	[ZX_CLK_TOLSP_DPLL_D4_WCLK]  = GATE("lsp-dpll-d4", PARENT_ID(ZX_CLK_MATRIX_DPLL_D4),
+					    0x7c, 9, 0),
+};
+
+static int zx297520v3_matrix_init(struct regmap *map)
+{
+	u32 axi_val;
+	int res;
+
+	/* Read the global AXI speed selection, insert it into our ballot and enable voting */
+	res = regmap_read(map, 0x0, &axi_val);
+	if (res)
+		return res;
+
+	axi_val &= 0x7;
+	res = regmap_write(map, ZX297520V3_AXI_AP_VOTE, axi_val);
+	if (res)
+		return res;
+
+	return regmap_write(map, 0x12c, 1);
+}
+
+static const unsigned int zx297520v3_matrix_exports[] = {
+	[ZX297520V3_SYS_TIMER_WCLK] =		ZX_CLK_SYS_TIMER_WCLK,
+	[ZX297520V3_CPU_WCLK] =			ZX_CLK_CPU_WCLK,
+	[ZX297520V3_CPU_PCLK] =			ZX_CLK_CPU_PCLK,
+	[ZX297520V3_ZSP_WCLK] =			ZX_CLK_ZSP_WCLK,
+	[ZX297520V3_ZSP_PCLK] =			ZX_CLK_ZSP_PCLK,
+	[ZX297520V3_DDR_CTRL_PCLK] =		ZX_CLK_DDR_CTRL_PCLK,
+	[ZX297520V3_DDR_CTRL_WCLK] =		ZX_CLK_DDR_CTRL_WCLK,
+	[ZX297520V3_EDCP_WCLK] =		ZX_CLK_EDCP_WCLK,
+	[ZX297520V3_EDCP_PCLK] =		ZX_CLK_EDCP_PCLK,
+	[ZX297520V3_SD0_WCLK] =			ZX_CLK_SD0_WCLK,
+	[ZX297520V3_SD0_PCLK] =			ZX_CLK_SD0_PCLK,
+	[ZX297520V3_SD0_CDET] =			ZX_CLK_SD0_CDET,
+	[ZX297520V3_SD1_WCLK] =			ZX_CLK_SD1_WCLK,
+	[ZX297520V3_SD1_PCLK] =			ZX_CLK_SD1_PCLK,
+	[ZX297520V3_SD1_CDET] =			ZX_CLK_SD1_CDET,
+	[ZX297520V3_NAND_WCLK] =		ZX_CLK_NAND_WCLK,
+	[ZX297520V3_NAND_PCLK] =		ZX_CLK_NAND_PCLK,
+	[ZX297520V3_DMA_PCLK] =			ZX_CLK_DMA_PCLK,
+	[ZX297520V3_MBOX_PCLK] =		ZX_CLK_MBOX_PCLK,
+	[ZX297520V3_PDCFG_WCLK] =		ZX_CLK_PDCFG_WCLK,
+	[ZX297520V3_PDCFG_PCLK] =		ZX_CLK_PDCFG_PCLK,
+	[ZX297520V3_RFFE_WCLK] =		ZX_CLK_RFFE_WCLK,
+	[ZX297520V3_SSC_WCLK] =			ZX_CLK_SSC_WCLK,
+	[ZX297520V3_SSC_PCLK] =			ZX_CLK_SSC_PCLK,
+	[ZX297520V3_AXI_WCLK] =			ZX_CLK_AXI_WCLK,
+	[ZX297520V3_GMAC_WCLK] =		ZX_CLK_GMAC_WCLK,
+	[ZX297520V3_GMAC_PCLK] =		ZX_CLK_GMAC_PCLK,
+	[ZX297520V3_GMAC_AHB] =			ZX_CLK_GMAC_AHB,
+	[ZX297520V3_VOU_WCLK] =			ZX_CLK_VOU_WCLK,
+	[ZX297520V3_VOU_PCLK] =			ZX_CLK_VOU_PCLK,
+	[ZX297520V3_LSP_MPLL_D5_WCLK] =		ZX_CLK_TOLSP_MPLL_D5_WCLK,
+	[ZX297520V3_LSP_MPLL_D4_WCLK] =		ZX_CLK_TOLSP_MPLL_D4_WCLK,
+	[ZX297520V3_LSP_MPLL_D6_WCLK] =		ZX_CLK_TOLSP_MPLL_D6_WCLK,
+	[ZX297520V3_LSP_MPLL_D8_WCLK] =		ZX_CLK_TOLSP_MPLL_D8_WCLK,
+	[ZX297520V3_LSP_MPLL_D12_WCLK] =	ZX_CLK_TOLSP_MPLL_D12_WCLK,
+	[ZX297520V3_LSP_OSC26M_WCLK] =		ZX_CLK_TOLSP_OSC26M_WCLK,
+	[ZX297520V3_LSP_OSC32K_WCLK] =		ZX_CLK_TOLSP_OSC32K_WCLK,
+	[ZX297520V3_LSP_PCLK] =			ZX_CLK_TOLSP_PCLK,
+	[ZX297520V3_LSP_TDM_WCLK] =		ZX_CLK_TOLSP_TDM_WCLK,
+	[ZX297520V3_LSP_DPLL_D4_WCLK] =		ZX_CLK_TOLSP_DPLL_D4_WCLK,
+	[ZX297520V3_SRAM0_PCLK] =		ZX_CLK_SRAM0_PCLK,
+	[ZX297520V3_GSM_CFG_PCLK] =		ZX_CLK_GSM_CFG_PCLK,
+	[ZX297520V3_LTE_MODEM_WCLK] =		ZX_CLK_LTE_MODEM_WCLK,
+	[ZX297520V3_LTE_MODEM_PCLK] =		ZX_CLK_LTE_MODEM_PCLK,
+};
+
+static const struct zx_clk_data zx297520v3_matrixclk_data = {
+	.init = zx297520v3_matrix_init,
+	.clocks = zx297520v3_matrix_clocks,
+	.num_clocks = ARRAY_SIZE(zx297520v3_matrix_clocks),
+	.exports = zx297520v3_matrix_exports,
+	.num_exports = ARRAY_SIZE(zx297520v3_matrix_exports),
+};
+
 static int clk_zx297520v3_probe(struct platform_device *pdev)
 {
 	const struct platform_device_id *id = platform_get_device_id(pdev);
@@ -828,6 +1350,10 @@ static const struct platform_device_id clk_zx297520v3_ids[] = {
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
2.55.0

