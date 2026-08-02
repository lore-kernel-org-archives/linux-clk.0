Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7098833BBAD
	for <linux-clk@vger.kernel.org>; Sun,  2 Aug 2026 20:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702895; cv=none; b=GHSPiIfCqVPxe1yzlM7/gkaMcsqIZbQ8K4pPbjqv2ts+j6kWI6MlEFo9JCctvnp4WmL8IYhrRSSnGtUVktcLNXZs90GZFxyT4WXGqL9u/p9V6k7g49TGHAVvdXZayiw2TTBzBS/tXCrX1lA9QqIVSQdsxlg3BdZn7IrRaN3II+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702895; c=relaxed/simple;
	bh=uI5HEaw0V5CC62qkE3Hen4IpsN3Aztamtdb5xPF4I+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fPqa7EMBKVDhfc468mQ2UMXNclnv0WHcunnV2Lp8hcaWhJcAB9GG/msMj53uyYBbRHMlO6J2Ej7GT6yaGrmDZMtfMRNAooM6BAs2w8v4SHUQM2qMEdu6iPgabFTvwAf5uwdLtwEa+BrgnDjV1LSAzPXmocRVAC87fIsfYzhGm6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrYrl7wj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrYrl7wj"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-495437bb891so10671545e9.1
        for <linux-clk@vger.kernel.org>; Sun, 02 Aug 2026 13:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702891; x=1786307691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIP93lvBLMGojmWlYFRUzPyh/SNEeVDe+e2Useud0hs=;
        b=JrYrl7wj/jGKuWAULNTY2gvu1tWPkZ9nkxSMUU0lYRYDt+zcKadDj747hBnNS3+PIY
         KFmBSU7uHCgHkW25iGp1yzj85LMetB7kwhTKF8CbpTCLx6pMsXLtRLZNfsfOxmYrX2pw
         bAhpkrKgtDC/r9lXxGCdhdTPSlWxqBIkBbHuwOdhLDjtP9nnjnq6SBJMP9aEkMbEIAoS
         XptN8WHzy4NJhOzyf4ckct/1U7SzBo9IH9wEbxACjgaAWeAf7YmYp0sfJLvloA5LmUQq
         b5+a8bYgYDtrQdUqVLrOTADTqN/jQkz2IT3YqpqjxQaboKE8oIiXk2nEi3eq6PHhXxF6
         6a7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702891; x=1786307691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bIP93lvBLMGojmWlYFRUzPyh/SNEeVDe+e2Useud0hs=;
        b=ObbN2Wrcxqx1HpcBgpcUs8qd5/aM0ViDJTdnvo9zo1oFlPptMWqS2YX63sIBoWDYUa
         uvaJXjJheYPcru2PiXA6m2G/4+HnzHvM7QZ/AhUWJLj1gwmxZoacURkbdku3xjerE0y/
         2iraXH8QBaoO24VzdwqNvTDe6vU1bxC8UQMuVPSXLoUkOiDdn4AWxtwpv/utvrWg1VNi
         /QZcCIaE8shvpyGdGjzANAqgvIN2bBGT6rXUVP8yk4phdhZxwyIGpyGbYVbe+tt5o2t/
         TgOPDytkMnOiXa2u8SY3EkpgrAdNCHNaUxzh8HoKaFtuphRarDW31FSZhXzuOwmuPckh
         H58w==
X-Gm-Message-State: AOJu0YxPV2oIy3KVgYed8cKECy9EIDDVaYMnvQEgwYHpoSL0R+2tuJ0i
	WPVs/CEjDlKxgQce4nylOJrfb1XLS2iNJfaeq1P6fBWixUhsRtlZ60qqL19S4uONL18=
X-Gm-Gg: AR+sD13VPRi+La5h5xPUgIsfUo4o2k906L+urcum7s1nTd21bh9fuWPJltwB3m/e6qs
	AZY5oF23mLh1syR4budeygHWIZmapiGal3EECRxW8n0yqH6Kj2198KdBiTj4KEctXo8OLYgO3FZ
	nceLJZVqHpqwxCmcopGyZ+6jQgL+xX/QjapyVCLggo7jWzwimMB2sHCauuT5nUpCiJKNfU9wuDZ
	P1yofTkodUNk9+LrkWky1wHbzptHP99s3vynxFFWQa1XjvjKWNI5CHohqoo0V40aDh8M60ZHent
	uurCBubCI+3z2Nt675IOBKRAlM9jGkcB0kjfCea3lJpgGG18jQhDWx9oZkRyNj4PicJoEHQhANO
	bLEAtg4uuXgbtW6a9yE3eg2zfJN9e1QIL2I3phXnpsyPev++L1MmnZL2geocYp9prMYWnN3XkFJ
	26TYVQEHSaT7pjCuMHPQJSOYemlHUNFHLtyJKDG+O1QblFoVVbsGgSeeejts9W0MRyiz6I5Sqt
X-Received: by 2002:a05:600c:1912:b0:495:4f84:7280 with SMTP id 5b1f17b1804b1-4980eb8c4a1mr125120745e9.4.1785702890317;
        Sun, 02 Aug 2026 13:34:50 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807bb45ebsm118499905e9.4.2026.08.02.13.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:34:49 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 02 Aug 2026 23:33:41 +0300
Subject: [PATCH v9 09/12] clk: zte: Introduce a driver for zx297520v3
 matrix clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260802-zx29clk-v9-9-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
In-Reply-To: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=24645;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=uI5HEaw0V5CC62qkE3Hen4IpsN3Aztamtdb5xPF4I+0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqb6myQUW5FISpnt/EpHclyYa2MNWJ69RX2e190
 7oKC1uRhG+JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCam+pshsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJBbA//bAYRivoNcm7TBsgct4jHkm0NR2myEoo
 e0G8oUoqhLi648NpmDYGAZyJp7UJ/KUe11DGWDI5La9zhDWPTiBWzDyB9CF43PcyHsuNWLA2hVz
 ldVnhI6D0buE506usUlBZc+bV4GmY0jpNBIk456vODh9m2D3b4w0ON6nUb/+IQenjDNnaZkugUO
 Yk+HaRHRW4N4QeTCjvdWz8tEyXYM8QOXKBvB15iY5SO1Cb/25pf4R4tve9oymCT3NR2lzZVQM9a
 hdelZ7tOT/7VcvJYbdFgxS5YzQACmA6+vZ4xa5dQyHxt4Wjo2xfiuglX+7PmmLEh840wtGkPLL6
 1z+Ibt0u/bF3bNa8saT7ABNiGd0nHDykqYTlnldGXn2hXX0u1qL0Y0OjwyCLPjRgG/BOCYtUsoE
 R8cZbB0gGR0h7DRTdlJ13Wv1SUAJ8GczJVL5Vc/FZ8MeBKs9rM/mgYyfAg6lTMmKtDQ0hbpfbfY
 ajkaaIlaLVq+3uOKbsgkcFs2tph/NNfNRXQgoabVkAzZHgGZz4sTVMUikB6129CQ22JoukcUvzW
 j7mXnI/6LkoeHMRjmMrZQc7+Es5wbqQOBh6zYbrJVGW1nnZWV5a1fo8OEM15Jf3qX7rTKri4jjz
 TBO0UgZjptRkv7Als36OO6VHvYSUVinM+kKIpY0flryqBpTE23Kw=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This clock controller controls high speed devices: CPU, DMA, RAM, SDIO,
Ethernet. The only non-clock, non-reset registers I have spotted here
are hardware spinlocks.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

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
 drivers/clk/zte/clk-zx297520v3.c | 483 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 483 insertions(+)

diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
index f9915582f261..6c4a7a1c3a9b 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -769,6 +769,485 @@ static const struct zx_clk_data zx297520v3_topclk_data = {
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
+	ZX_CLK_MATRIX_DPLL_D6_PREGATE,
+	ZX_CLK_MATRIX_DPLL_D4_PREGATE,
+
+	ZX_CLK_MATRIX_MPLL_D16,
+	ZX_CLK_MATRIX_MPLL_D12,
+	ZX_CLK_MATRIX_MPLL_D8,
+	ZX_CLK_MATRIX_MPLL_D6,
+	ZX_CLK_MATRIX_MPLL_D4,
+	ZX_CLK_MATRIX_MPLL_D2,
+	ZX_CLK_MATRIX_DPLL_D6,
+	ZX_CLK_MATRIX_DPLL_D4,
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
+	ZX_CLK_DDR_CTRL_PCLK,
+	ZX_CLK_DDR_CTRL_WCLK,
+	ZX_CLK_ZSP_WCLK,
+	ZX_CLK_SD0_PCLK,
+	ZX_CLK_SD0_WCLK,
+	ZX_CLK_SD0_CDET,
+	ZX_CLK_SD1_PCLK,
+	ZX_CLK_SD1_WCLK,
+	ZX_CLK_SD1_CDET,
+	ZX_CLK_NAND_WCLK,
+	ZX_CLK_NAND_PCLK,
+	ZX_CLK_LTE_TPU_WCLK,
+	ZX_CLK_LTE_TPU_PCLK,
+	ZX_CLK_EDCP_PCLK,
+	ZX_CLK_EDCP_WCLK,
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
+/* Low confidence on the actual value, but at least I know it is bit 13 in top+0x140 */
+static const struct zx_parent_desc zsp_sel[] = {
+	PARENT_FW("wclk-osc26m"),
+	PARENT_FW("dpll"),			/* 491.52 MHz */
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
+static const struct zx_parent_desc tdm_sel[] = {
+	PARENT_FW("wclk-osc26m"),
+	PARENT_ID(ZX_CLK_MATRIX_DPLL_D4),	/* 122.88 MHz */
+	PARENT_ID(ZX_CLK_MATRIX_MPLL_D6),	/* 104 MHz */
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
+	[ZX_CLK_MATRIX_DPLL_D6_PREGATE] = FIXED_DIV("matrix-dpll-d6-pregate", PARENT_FW("dpll"), 6),
+	[ZX_CLK_MATRIX_DPLL_D4_PREGATE] = FIXED_DIV("matrix-dpll-d4-pregate", PARENT_FW("dpll"), 4),
+
+	/*
+	 * Matrix distribution gates: Every matrix-generated subdivision of the input PLLs
+	 * has a gate in 0x118. The original inputs from topcrm (mpll 624, mpll 124.8, gpll 200,
+	 * gpll 100, dpll 491.52) do not.
+	 *
+	 * I do not know of any user of dpll-d6 and do not know the divisor. An 81.92 MHz clock is
+	 * listed as a root clock without a consumer in ZTE's code. Most likely it is a possible
+	 * parent of the ZSP mux.
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
+	[ZX_CLK_MATRIX_DPLL_D6] = GATE("matrix-dpll-d6",
+				       PARENT_ID(ZX_CLK_MATRIX_DPLL_D6_PREGATE), 0x118, 8, 0),
+	[ZX_CLK_MATRIX_DPLL_D4] = GATE("matrix-dpll-d4",
+				       PARENT_ID(ZX_CLK_MATRIX_DPLL_D4_PREGATE), 0x118, 9, 0),
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
+	[ZX_CLK_ZSP_WCLK]         = GATE("zsp-wclk", PARENT_ID(ZX_CLK_ZSP_MUX), 0x3c, 0, 0),
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
+	 * device. If it is fed an incorrect clock, e.g. because dpll is not locked and outputs
+	 * 26 MHz, it will spam IRQs at SPI 68. This is likely a distress notification that some
+	 * internal PLL did not lock or similar
+	 *
+	 * ZTE's kernel has two defines for SPI 64: "LTE_TPU_INT_PS_INT" and "VOU_OSD_INT". The
+	 * latter is unlikely because VOU related clocks sit in matrix+0x168.
+	 *
+	 * Bit 9 in register 0x118 turns it off, providing a hint who the parent is.
+	 */
+	[ZX_CLK_LTE_TPU_WCLK]     = GATE("lte-tpu-wclk", PARENT_ID(ZX_CLK_MATRIX_DPLL_D4),
+					 0x60, 0, 0),
+	[ZX_CLK_LTE_TPU_PCLK]     = GATE("lte-tpu-pclk", clk_main[0],
+					 0x60, 2, 0),
+
+	[ZX_CLK_EDCP_PCLK]        = GATE("edcp-pclk", clk_main[0], 0x64, 1, 0),
+	[ZX_CLK_EDCP_WCLK]        = GATE("edcp-wclk", PARENT_ID(ZX_CLK_EDCP_MUX), 0x64, 2, 0),
+
+	/*
+	 * This seems to be another SPI-Like device. ZTE's firmware operates it and from testing
+	 * it looks like the matrix-osc26m gate in top+0x140 stops this device. This would be
+	 * consistent with the other SPI controllers too.
+	 */
+	[ZX_CLK_SSC_WCLK]         = GATE("ssc-wclk", PARENT_FW("wclk-osc26m"), 0x84, 1, 0),
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
+static unsigned int zx297520v3_matrix_exports[] = {
+	[ZX297520V3_SYS_TIMER_WCLK] =		ZX_CLK_SYS_TIMER_WCLK,
+	[ZX297520V3_CPU_WCLK] =			ZX_CLK_CPU_WCLK,
+	[ZX297520V3_CPU_PCLK] =			ZX_CLK_CPU_PCLK,
+	[ZX297520V3_ZSP_WCLK] =			ZX_CLK_ZSP_WCLK,
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
@@ -785,6 +1264,10 @@ static const struct platform_device_id clk_zx297520v3_ids[] = {
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

