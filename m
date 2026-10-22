Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678109;
	b=j3I5ZQSwGd8IDE9o63VW56oL40FmfgrEW41JGC6J9K3Oz92Cscgs0mA61TKB+jpqU9AA
	 mUsLqaQv4MSDSk6W26z0YyABKPF8D/zutuIih0hINTmFkBOC0Imnkmnoc9V1KvkqAVLCV
	 F0u96bcTfabGeodNAn9LS6hV4J6J5V7d2BRMowJKhvTrM0fyMgSbqfLIN8h7fzBXxF5/b
	 3IvZp67NoVyt53SfJAvo4hsXWWwA1QJwIlYvPuF/6FAvL3FuWdDWVyRm0H7DEVJut4+Gm
	 umtIle6fqsiYy2wSRqDgGFkWuta070QzCPmXEPXxL73Bczje4PNcomsZzMagnzJxOlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678109;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=/6YGebWgHGPWMyBtJuZLEzuWWT6Sl+na3jZ5wK/Q9Gc=;
	b=R+B4IVjzUvmzbM0zkkqLf/wm6knKN++QKsDiepVnEzADofuoedj8ohTJGws7cAGCnNPj
	 eovVSClRVJ1pn2Jwgu3huDRiEEYchAAB9C+hHBnWtBfkkDtSEC12JKDzgrADMIQx8CMex
	 x4xgzBhpmmu4RAlma2VlS38IIJVg1FbgprVFP8UbLh/6knqn5aq8JOYFe2ahmX5/v2jru
	 NQl3h2/3B+3L0m76wIs/gdZwMnydDZ4M/FoOW5Ip3Mk1cPoylL7QuH8H2ZPBHKDU4aZIW
	 Y7lsMhgKbiIyPFKp9WvpCpcDxjPW3yhTVU1A5+ZulqTU9BwMnqNLQBpKYzypYXxZxNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A749606A32A;
	Thu, 22 Oct 2026 14:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A749606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=/6YGebWgHG
	PWMyBtJuZLEzuWWT6Sl+na3jZ5wK/Q9Gc=; b=QJiqP6gQTgjJKSdLMuHpl9ylZQ
	RiCVSNG73OYs/zsz6CKC2Q0B3vlVlEeEBpITmu72b5Ve7uq/lqWHHqapbRqBOfC1
	g/Sec9EzLiHwjBfn6Wrm9xFIBPyDcD7P6OEgFTtQdVdFGsQHbR/D9p2jHM/9jzN5
	03qOaaOz1l3t4itn8=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.229.107])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgDXWj_LGNpqZUstAA--.273S2;
	Thu, 22 Oct 2026 22:08:11 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [RFC PATCH] clk: qcom: dispcc-sm8750: reset the MDSS blocks at probe when the bootloader left them running
Date: Thu, 22 Oct 2026 22:08:10 +0800
Message-ID: <20261022140811.469417-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgDXWj_LGNpqZUstAA--.273S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr4xJF1kXw15Xr48Zr17Awb_yoWrtF1DpF
	sFyF45Kr4kCFyfXFy3Aa1Du3WrJ34ktFy5try3G347AwnxJFn3AFZ2y3sIkFWDtrs7JF1j
	qFW7KFWkCF1vqFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bYYLPUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREIB2rZEtVwHAAQsX

On Lenovo Legion Y700 Gen4 (SM8750, "lenovo,elden") the bootloader hands
over with the display block fully active: the dispcc PLLs are locked and
MDSS core / core_int2 / RSCC are out of reset.  The kernel's mdss_reset()
and clk_*_pll_configure() then run on top of that live state and the
command-mode panel fails to initialise:

  msm_dsi ae94000.dsi: command DMA timeout: status=0x2200200
  msm_dsi ae94000.dsi: bonded command DMA failed: master=-110 peer=-110
  panel-novatek-nt36536: Failed to initialize panel: -5

The result is a cold boot with backlight only and no /dev/dri/card0.

Asseting the three dispcc block resets and releasing them before the PLLs
are programmed makes the block start from a known-zero state, after which
the same panel initialises reliably.

Measured on the same device, downstream 7.2 payload, alternating real
power-on cold boots (fastboot boot of two images that differ only in this
hunk and the DSI PHY change mentioned below):

  without the reset:  5 of 9 cold boots failed (command DMA timeout)
  with the reset:    15 of 15 cold boots OK (two variants, see below)

As an RFC I have gated it to lenovo,elden because I cannot tell whether
other boards that hand over with a live display would benefit or would be
broken by resetting the block.  Two questions:

1. Is a per-board workaround in dispcc probe the right place, or should
   this be expressed as a DT property (e.g. qcom,reset-mdss-at-probe) or
   be handled unconditionally in the dispcc driver / in mdss?
2. LinuxLoader solves the same problem on the bootloader side under the
   name "DisableDisplayHW".  Would you rather see the reset done by
   mdss_reset()/DPU before the PLLs are configured, so that it also helps
   other bootloaders that leave the block running?

Separately, and relevant to Dmitry's "drm/msm/dsi/phy: power up the digital
top before starting the 7nm PLL" series: on the same board the missing
DIGTOP_PWRDN_B handling produces exactly the reported

  DSI PLL(0) lock failed, status=0x00000000

four times per boot (the PHY PLL is enabled by the clock framework from
of_clk_set_defaults() before the PHY is touched).  With DIGTOP_PWRDN_B set
and cleared together with PLL_SHUTDOWNB that message disappears from every
boot I measured (10 out of 10), but it does not change the command DMA
behaviour above: an image with only that change still failed 3 of 4 cold
boots with the PLL reported locked.  So the two are independent, and the
DIGTOP change looks correct on its own.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/clk/qcom/dispcc-sm8750.c | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
index e1d9534..c2a1705 100644
--- a/drivers/clk/qcom/dispcc-sm8750.c
+++ b/drivers/clk/qcom/dispcc-sm8750.c
@@ -5,9 +5,11 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/pm_runtime.h>
@@ -1919,6 +1921,39 @@ static int disp_cc_sm8750_probe(struct platform_device *pdev)
 		goto err_put_rpm;
 	}
 
+	/*
+	 * Some bootloaders hand over with the display block still fully
+	 * active: dispcc PLLs locked and MDSS core / core_int2 / RSCC out of
+	 * reset. Probing on top of that live state makes the command-mode
+	 * panel fail to initialise (command DMA timeout, panel init -EIO).
+	 *
+	 * Assert the three block resets and release them before the PLLs are
+	 * configured, so the block starts from a known-zero state.
+	 *
+	 * Limited to Lenovo Elden for now: it is the only board where this
+	 * handover behaviour was observed and the fix verified.
+	 */
+	if (of_machine_is_compatible("lenovo,elden")) {
+		static const u16 elden_bcrs[] = {
+			DISP_CC_MDSS_CORE_BCR,
+			DISP_CC_MDSS_CORE_INT2_BCR,
+			DISP_CC_MDSS_RSCC_BCR,
+		};
+		unsigned int reg;
+		int i;
+
+		for (i = 0; i < ARRAY_SIZE(elden_bcrs); i++) {
+			reg = disp_cc_sm8750_resets[elden_bcrs[i]].reg;
+			regmap_write(regmap, reg, 0x1);
+		}
+		/* Hold for one full ~30 Hz frame before releasing. */
+		msleep(50);
+		for (i = ARRAY_SIZE(elden_bcrs) - 1; i >= 0; i--) {
+			reg = disp_cc_sm8750_resets[elden_bcrs[i]].reg;
+			regmap_write(regmap, reg, 0x0);
+		}
+	}
+
 	clk_taycan_elu_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 	clk_taycan_elu_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
 	clk_pongo_elu_pll_configure(&disp_cc_pll2, regmap, &disp_cc_pll2_config);

