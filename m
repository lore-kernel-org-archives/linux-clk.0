Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF6927727
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 13:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739270; cv=none; b=teblbANHJU0HoqK1GpDdTK6RmbEY7ewU7vsOJ4S01LWKpgsBl8uR+MiNPWQ5Okj5iS0bOXUU37hKQjFvl/9ShUaZgE2qobbInVgoVguZB9EKIIRx1ePzzIZOz76D3L0uDMx8bscSkHygSmygSewUQQt+rG1l18w/tLlBC0tpziw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739270; c=relaxed/simple;
	bh=QxzWy/Hv5RiNDtU4NazhiKpBVXecqMQz1LvHg0mRcRo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wam7QhVSPE8rlvU2l5fIEbAlaSSh9HCEUbBiZWmRaSQ/SayEb8et1Wd/27W3g1QYjONZDIYDDcnlGw76enayYV8prHUAcJWBtItVg3b6meX4N9k0hQQAIwWM8xVF1xJ99uPL6DLL6qn5Lb1hC8Zk0+QRRcRzrYmpNT2dsy/ZpHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIEOVhRa; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIEOVhRa"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38005a36edbso549332a91.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 06:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782739269; x=1783344069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IheE9qVzV7PsklKZKF/CcoIEwL18pQsEGgmo5EP68GU=;
        b=QIEOVhRaFhSnMNl0QAu8zgBZaCGPTi2t8PCoaL2aGx9aKnyMH1PofvmUy2jlE6C4TD
         GBldgUsf3UB5R0M6ipOGNAA1U3+nsVXRwu5fnYxmGYXohsNfbF12P0RZn//C7ARtzcNC
         q8MMElIBW2IQjLPo+CoNG9Lfiy7oomcSTrTAN/qeW3+Du1+H1dp/12RQpBWJycMgeAB5
         gVa0DVfnigmAAe4p25zchuvIxPoTNlbWeRTT/cGPMVtFeo5445qyFlf1UjDYYoWU7Ktg
         sDWD/Mgyl1/Q/xUiI0Pz7nUN1qGuL7XWcmUGClMWvaLSuDZizuX64mQbIEI02FdTseW/
         uWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739269; x=1783344069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IheE9qVzV7PsklKZKF/CcoIEwL18pQsEGgmo5EP68GU=;
        b=rchnwW9zj3SY58rabjkXG/e9DC4xUNtl342yPFm3BglBQ16/9cnv4trmT2lyrEuwBV
         7Lthji3s8d+aljT1F+Au2t82uBaUg6CadGQ9WCL7qv6qxc6gBx5GxB/cMB85jEnwGLcs
         haqGx4qib9zwLkCoZCwiypj4tuukRMODaOm1mwTy4VIxcQJwOURQZv3bTAeMy0H49dbr
         MrW/KrrO3kEvYGdmy1qZWD0NOreTP0e4EWDOqC8VOAu1zv6gw6LV+UOf3mBO2lke9u5R
         JDKXPcVTWx9+c5nZnJDh7YL+wdB9r4/JMtYOU3G2VDp8e5wuRgb8woFWfQC/l/nxDoDd
         U2Jg==
X-Forwarded-Encrypted: i=1; AHgh+RqmLxNTTS9+fbtkBsOuspOpVWMGAbQxFBF3bg/+hpCfcjgHENFEHA6SW9GAgIhwEQN9FjfJGIRpk3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSMeoaYfUOvQjZGvWp/5UIf8CMQm6GhdjzDddmv7Isb/6fCDC9
	je/nayQ6T4yCZIGP56CQKMmtRS371o0XK1xk88hlIihgw49Rr+Av2aup
X-Gm-Gg: AfdE7cmnXT5BGQbNcUzpgAf/3cwFC8Y4YVLNnHSkIOVFoNSqir8THbU7JSxLtA3ZwKs
	zcEvA/gaeeYJSxQAcLYpLu3IIYxodRd6L2tAvsmZT5CnHmW1EEXOVcwOyYym3Ow+u1k/j7OXY+T
	i1Hx5iVO9wU8vRfH0f/Tud5mQRu8njBfVWHdQNdWzx81kPCQ+Ax+fdQLsg7t37GbvcgRPOe25lC
	MPRml0ekKUs7/TgBT5RiatdQToyq5VBH3QN0tx4aqTR0MANsLkotfz0H2bkDSMj56tewdsrILpO
	KPoiSw1GPHxBgg81/f1Zfdjf6eg8DE+AQfTkG6fge1tnFIhgT5kpa1I3NCJ1gd3Z6UHKO7EZ6ZY
	s50PXF5emqkH32ksMMIb/3bUYDhUVQrdtFmNsVjyT6jBp9MhQcn0Z62cYicS3iIkCYec+EIU487
	z877LXPtbDcrN69zXNEmViB0hW7treNTkw5dykoFwWEF3K
X-Received: by 2002:a17:90b:3f10:b0:37f:db06:2299 with SMTP id 98e67ed59e1d1-37fdb062e8amr5490736a91.21.1782739268802;
        Mon, 29 Jun 2026 06:21:08 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df411ddf7sm9007528a91.16.2026.06.29.06.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:21:08 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Henry Chen <henryc.chen@mediatek.com>,
	James Liao <jamesjj.liao@mediatek.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] clk: mediatek: mt8135: Fix inverted gate control for devapc_ck
Date: Mon, 29 Jun 2026 22:20:43 +0900
Message-ID: <20260629132044.208905-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The devapc_ck (CLK_INFRA_DEVAPC) on MT8135 is currently using
"mtk_clk_gate_ops_setclr". However, checking the downstream kernel reveals
that this clock is configured with set:enable and clr:disable making
"mtk_clk_gate_ops_setclr_inv" the appropriate choice.
But, it is strange that some downstream kernels are not like that.

Amazon: INV
ChromiumOS (early): not INV
ChromiumOS 3.16 to 3.18-revew-v2: INV
ChromiumOS 3.18-review-v3 and later (sent to kernel.org): not INV

Link: https://github.com/amazon-oss/android_kernel_amazon_mt8135/blob/e2b2163a8ec4a7c8d961c89003a15b4ba0f0e371/arch/arm/mach-mt8135/mt_clkmgr.c#L1022-L1028
Link: https://github.com/mtk09422/chromiumos-third_party-kernel-mediatek/blob/4b624ee66e65d5dcd43fca36b313086efae8922a/arch/arm/boot/dts/mt8135-clocks.dtsi#L944-L948
Link: https://github.com/mtk09422/chromiumos-third_party-kernel-mediatek/blob/decd80c01d0dbe9f3afa8ff72273b5618b418180/drivers/clk/mediatek/clk-mt8135.c#L881-L882
Link: https://github.com/mtk09422/chromiumos-third_party-kernel-mediatek/blob/9b6f06cb7637100aa1a42e1fc351b36b384a1c54/drivers/clk/mediatek/clk-mt8135.c#L450
Fixes: a8aede794843 ("clk: mediatek: Add basic clocks for Mediatek MT8135.")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8135.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8135.c b/drivers/clk/mediatek/clk-mt8135.c
index 084e48a554c2..1d20e15608f7 100644
--- a/drivers/clk/mediatek/clk-mt8135.c
+++ b/drivers/clk/mediatek/clk-mt8135.c
@@ -409,6 +409,9 @@ static const struct mtk_gate_regs infra_cg_regs = {
 	GATE_MTK_FLAGS(_id, _name, _parent, &infra_cg_regs, _shift,	\
 		       &mtk_clk_gate_ops_setclr, CLK_IS_CRITICAL)
 
+#define GATE_ICG_INV(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &infra_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
 static const struct mtk_gate infra_clks[] = {
 	GATE_DUMMY(CLK_DUMMY, "infra_dummy"),
 	GATE_ICG(CLK_INFRA_PMIC_WRAP, "pmic_wrap_ck", "axi_sel", 23),
@@ -419,7 +422,7 @@ static const struct mtk_gate infra_clks[] = {
 	GATE_ICG(CLK_INFRA_CPUM, "cpum_ck", "cpum_tck_in", 15),
 	GATE_ICG_AO(CLK_INFRA_M4U, "m4u_ck", "mem_sel", 8),
 	GATE_ICG(CLK_INFRA_MFGAXI, "mfgaxi_ck", "axi_sel", 7),
-	GATE_ICG(CLK_INFRA_DEVAPC, "devapc_ck", "axi_sel", 6),
+	GATE_ICG_INV(CLK_INFRA_DEVAPC, "devapc_ck", "axi_sel", 6),
 	GATE_ICG(CLK_INFRA_AUDIO, "audio_ck", "aud_intbus_sel", 5),
 	GATE_ICG(CLK_INFRA_MFG_BUS, "mfg_bus_ck", "axi_sel", 2),
 	GATE_ICG(CLK_INFRA_SMI, "smi_ck", "smi_sel", 1),
-- 
2.54.0

