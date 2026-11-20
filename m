Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795189966;
	b=zoVGzQzduwiEIN2UqJhTPanb9Ku1StvdQFUn28TFIX88k3Q19rht6Ele7Pz3Ia/o3hRv
	 C4lLvIlr8QEc0I08TuzieTD28U4dflSyE8jMxMictxdIo1Rt+MWZNkaWSkZu5KYSI3D9m
	 HCMUYCDV03Y7gBm1V4ZxlwUpdvnfBbwdcqek0mpJQz0pPOzmmoTXMy2xDCfLVe6Os8gyM
	 TePPIp0YVQD9tieRbH23mdvOCDBZ2BrdBJ2JQlz7fSxnhzUjThWkoudPxDUCm/LJrwaWv
	 a92J5nuuRpVltU3vTlAEZub9CQ9guljwkuwgmAbOf5NULhKHV5jvNeC6vcltPxTb8HQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189966;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mdPLtd0pb2afPShT4wihtCgHtR7V2UHGwz5z/hOYOC0=;
	b=vqJyYfaRjfUDflHKq8g5kjJZHrqc63DkW0Y6MOOCvMz2T9R3Eq6XBrw2PxQrl0s/KrBF
	 +y6vBVeht0hJWxxkg8w2ARMe8jjtPt8CW1pibOFcfeh23T10ohtqIQpp036XI+JKI88Zu
	 dIAp8PmPqMozYNzu+Tt1f8TXmv4+BKEz/auQhfGIBGFTwDdSgv4eoPRzN7/cajhrKMdC1
	 932AAPQdmvyJMyrLR9JT8uWCXLLMxNVKpCXfKHt/An0fLfoTllVeoX4vO44BPld86t01R
	 9SLRKH4lSJsdYjud3zcEOuEOAP31RM5+tsFy0Rt07FV6OMBtaAHIcRrxp+aOndvFD8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YsoPTlUz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85782606A331;
	Fri, 20 Nov 2026 15:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YsoPTlUz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795189966;
	b=FBTjLPGcIiAvU1RwubeTnb3LGSJBX5eEFXxdcbDqo20qoTyXLFxzWYU0TLf3WXENmW8n
	 brZLZKVnqu1qcKfGGx4d2MWoG/+6fPYwEwtsTbRmQ5sqjwidTbkWtCNagHlYSGNdPfVFx
	 ULqE/o9ZJfDzV5coGCX/pF0RpjhNbb9xOOscYF5SXooa/6fkO5hW2ODdgJdspbx1v4LUN
	 RRBwAA3As6DMzupbjPChg+Gm17UhZQbczTXFPqhu3IxdPl29ivQgaKFP1X6dnPzxx0F54
	 L/OH+v71fTwJAybimso6AXG7RvmqZw3L9hH1Roc7QsfiTqUDJiLDEjN3VMB2uzs+EpA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795189966;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mdPLtd0pb2afPShT4wihtCgHtR7V2UHGwz5z/hOYOC0=;
	b=ReKPGNSus+Bnr6lAg712DZ2TyXsW+VIbuGZeEkacakKRGujiv6BhyIPGcIw/ALDAkT/R
	 SFMBmZaomiJF55MAiOaoZor5KcdBZNPn3PY/WG9nsGnghqmwDcGW7rOjUt9RwO+UIDIFb
	 xWHKtJtYUABBOMcrQz17kMm+yyOQXUQzuJRipRIXfBc/nwF+bzSD5GUxNWDLlDnFkyq2E
	 Vl017i3ABxTumuSjr6WOsX8QpR+mJ8JQHnsPs6pvvREkwiVafV26FiuB+g+3DV+WhN/Gf
	 fIG734jFlAaNMx7Nt0ouAz1+zCmlbdC15YotX4J42CmX8zV1LTtussr6Ir3zDz6+0/w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 153831F00A36;
	Fri, 20 Nov 2026 15:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795189966;
	bh=mdPLtd0pb2afPShT4wihtCgHtR7V2UHGwz5z/hOYOC0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YsoPTlUzu2Oib3RCWGFKHcDz0lzkt1wJparpGAwcF2ZLGhXZ+SOcm8CnKMSByenYK
	 U304vDBzZS+3no9S6hJvuKbBL3CbKkZ4cJCk+XzPYTGHgH7uJwe4+J/SWGrtM7KGFu
	 +l3B5obLWpAZiD+zbW3R9/deMzpPMLJ3LRWZTLF45LCr2K5mheAhLNt3LvbnISrzfB
	 I7tm4q1LO+bBJUc7ISSGt+OkaInvj6xTn8WUDyCsWEteTeMBjiE8P8SIPnrYuEpxXb
	 sJuvP6yDQcYPRFOqPuq2ou85LRI+93LH9yI4GMHWcwLph5JExPhkAf3Spn0Is09ahd
	 JQsq4Kc6eA3Vg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C5E404991F;
	Fri, 20 Nov 2026 15:52:32 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Fri, 20 Nov 2026 21:22:33 +0530
Subject: [PATCH v2 2/2] clk: qcom: gpucc-kaanapali: Add support for Molokai
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-molokai-gpucc-v2-2-e84a0869693f@yahoo.com>
References: <20261120-molokai-gpucc-v2-0-e84a0869693f@yahoo.com>
In-Reply-To: <20261120-molokai-gpucc-v2-0-e84a0869693f@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795189951; l=2918;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=E77h2g7w1A4rr/zrVjYooX8Uzt6Yb6EK+PXIb7U1yDI=;
 b=d2NhP4nt2He+fcf2+mMfjwFvw+db0JmJM1uuQwUHDnuQep/Zx+cJaTtBjxI+z7XOckC9esrrp
 u1YF/Ytvv9CDh6z2VfsR24GItiVChESdpWDt2XKDvocDVZTNepfSqFX
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

The graphics clock controller of Molokai (SM8845) is the Kaanapali one,
except for the PLL0 CONFIG_CTL_HI value and the CX accu shift, DPM and
MEMNOC GFX branch clocks, which sit one register further. Handle it in
the Kaanapali driver.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 drivers/clk/qcom/Kconfig           |  3 ++-
 drivers/clk/qcom/gpucc-kaanapali.c | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index e6c58e8b1849..5d4db3264c5a 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -200,7 +200,8 @@ config CLK_KAANAPALI_GPUCC
 	select CLK_KAANAPALI_GCC
 	default m if ARCH_QCOM
 	help
-	  Support for the graphics clock controller on Kaanapali devices.
+	  Support for the graphics clock controller on Kaanapali and Molokai
+	  devices.
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 
diff --git a/drivers/clk/qcom/gpucc-kaanapali.c b/drivers/clk/qcom/gpucc-kaanapali.c
index f75f2caa2205..ea30a9e07a83 100644
--- a/drivers/clk/qcom/gpucc-kaanapali.c
+++ b/drivers/clk/qcom/gpucc-kaanapali.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
@@ -52,6 +53,18 @@ static const struct alpha_pll_config gpu_cc_pll0_config = {
 	.user_ctl_hi_val = 0x00000002,
 };
 
+/* Molokai needs a different PLL0 configuration */
+static const struct alpha_pll_config molokai_gpu_cc_pll0_config = {
+	.l = 0x31,
+	.cal_l = 0x48,
+	.alpha = 0x7aaa,
+	.config_ctl_val = 0x25c400e7,
+	.config_ctl_hi_val = 0x0a8060e0,
+	.config_ctl_hi1_val = 0xf51dea20,
+	.user_ctl_val = 0x00000408,
+	.user_ctl_hi_val = 0x00000002,
+};
+
 static struct clk_alpha_pll gpu_cc_pll0 = {
 	.offset = 0x0,
 	.config = &gpu_cc_pll0_config,
@@ -457,12 +470,24 @@ static const struct qcom_cc_desc gpu_cc_kaanapali_desc = {
 
 static const struct of_device_id gpu_cc_kaanapali_match_table[] = {
 	{ .compatible = "qcom,kaanapali-gpucc" },
+	{ .compatible = "qcom,molokai-gpucc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gpu_cc_kaanapali_match_table);
 
 static int gpu_cc_kaanapali_probe(struct platform_device *pdev)
 {
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,molokai-gpucc")) {
+		gpu_cc_pll0.config = &molokai_gpu_cc_pll0_config;
+
+		gpu_cc_cx_accu_shift_clk.halt_reg = 0x9108;
+		gpu_cc_cx_accu_shift_clk.clkr.enable_reg = 0x9108;
+		gpu_cc_dpm_clk.halt_reg = 0x910c;
+		gpu_cc_dpm_clk.clkr.enable_reg = 0x910c;
+		gpu_cc_memnoc_gfx_clk.halt_reg = 0x90f0;
+		gpu_cc_memnoc_gfx_clk.clkr.enable_reg = 0x90f0;
+	}
+
 	return qcom_cc_probe(pdev, &gpu_cc_kaanapali_desc);
 }
 

-- 
2.56.1


