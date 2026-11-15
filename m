Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794773969;
	b=ZET2RDprXhI7iSHDPPHNnMUt9clhZVnDFjibudrsf7auvhgRGKGkvwVCPYoa8ZpEhjYA
	 m0Xr3MCpHo7Z9TjWypYAGIGcRsQCJLWXqRhSJ2QnHROobsqk1PWTnHhxx+8ii1wiwXp2s
	 5CCZq5jqD7JEmRigi7PhTpj0152sDLIZeyfcBpysAhO389FngJhLJ9ON1Lbw7MEbXI7S3
	 C1hslzTJvYow8AtBqeK6IoZXhapJvkhBOhNVfFLLtNaNDw0lxnPqDMFHK0BOKnQ98DtUL
	 d5dctLKcnv0/ng6ZuAUi02dOAXvx9e7iOUXtdEXOIuAyCpd7khyLDj+4pvnbatXRLUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773969;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pzARujkX7aTHdEYvdneej8atPbqX05O0FA5ShpbrJ/Y=;
	b=jQTAXGj2NBwmSdoVeHstE85FJk2BKEk4E1Iok1Nvu3tKgL9m/cFHbU2UNjubXDwozEE5
	 PQdFDDGd2Osh2vRIrZ5ZVS83S63AvrVhof/Aog5j6rLd+/tunwsdOPOXjLDidCpq+lBw2
	 aB5PoUHcC2kpu2rlxwaHLQxOPpW2ymHI577HFFULUXzeidc9vAA42mfzmufRG9AAxnJlF
	 1KrufPe8bSp65/nSxdVfscbtodcXnMzS6N+YbjqSdTDMw0jkLG0TH/xprtseiF22n3AnR
	 Bcm92qCXGXvKFGdKWiG7pA06uAns4eLvnBS+K67RRTVisqn2VLZpWoUZyd5r+usIh4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CEskCw2L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87BD606A890;
	Sun, 15 Nov 2026 20:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CEskCw2L
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794773968;
	b=VQs8/vIY+NTeEcKwqJwDyY2DU6xfljj2c1hovpJuJWnuVk2Iu+VUxWL+OVZJvy8baU0M
	 T8D7jDo/zxwnzMeS1XlaJ0wdsScZhdgTRKc+JdL07BIufEUK4+jibFSmwi+zPRnKkeNCo
	 7XSrYGRyS5l8yjfcTuvc7/Uq/y4aBGLCmMjHR9ZxdIJRiC+0800MzxXsXGjOF1KQ8O29g
	 joTD9KUCAh8QN9Um6u2AMdoQfZsSTxIuS87AM3Xmrnhh8sSa3J4eHzeyo/9OZd47lffIj
	 tv3isSd9MYzvK2tsTu8Orlxjm9mkzU5EfSWH7NMqjkzyB08w50PDqr9Efv9GRa53xFA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794773968;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pzARujkX7aTHdEYvdneej8atPbqX05O0FA5ShpbrJ/Y=;
	b=EkmzzhqfWMA6S3EoOe9gle83qQHzp0nZUIP0u/AUAj/rKBpAzfHOA5zC3mrFvl4DCZHC
	 GT/37lkwfPV6X8BdXckhG9eJDyT/QXYj0O3L+BHRMzW3vPx9UBeLddOa8aa7KcQqf+KMT
	 Sl5sHXhZnbK1wQ8AtqQwCUCzjmhP7qrzPk41TT0F8t6M0+DiE2XqqMxqBAJdy7cq+I+dA
	 sBmAySpVEaT4WnM5uFSpx+jV0XMRNOm8hVGp5zNsGGZOObV1u68HA4hT+ckk1JvrizHOT
	 bImODmNQk/KCPdCSpXhG7ZSwjNkC0Oj8BNKQ3utC/gmYCHPj0aHtZPAP6ehzzvrRU5A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0901F1F000D0;
	Sun, 15 Nov 2026 20:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794773968;
	bh=pzARujkX7aTHdEYvdneej8atPbqX05O0FA5ShpbrJ/Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CEskCw2LNNF6xfnQcVGEjgu9/sBLFvFVsXAsQNMuMKSRYTjRMtOuyqOtWw4I7KTho
	 h/FV+GCoy1Lqwgk7Nudc/cXx7FJ9m3UFEVzsNXc6xUqnMRwkcwz8QHm2njAjM3SSyc
	 XGT3hQhwIe5A6A/09UPUKNAv+qxDVsCpiHs45Tkzl5TU0HyRTstq3Cnyj4Zkm/TMci
	 89uQgOdoO5i/bXYj0YhchBnxqmRmGQmRHVWstA+5f60cEEKikSrJEw398W9hxdj3Em
	 ZL9yhaWzlANsM5jFuO/76+gPnlIZrT6SfOInawKMsxhm5EkPdy5mr3dhpqIp7cLIof
	 /IAwq29YYfG4w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8791B4A195;
	Sun, 15 Nov 2026 20:19:27 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 01:49:28 +0530
Subject: [PATCH 2/2] clk: qcom: gpucc-kaanapali: Add support for Molokai
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
Message-Id: <20261116-molokai-gpucc-v1-2-07cb3bf37c78@yahoo.com>
References: <20261116-molokai-gpucc-v1-0-07cb3bf37c78@yahoo.com>
In-Reply-To: <20261116-molokai-gpucc-v1-0-07cb3bf37c78@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794773966; l=2883;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=yTs1V5oRJ/5pxMi1XVakjSMJS3lZkregGBsivc3RB8w=;
 b=HFaMmyr+g4HBttl/+t66I5/U5IHQA0sc5ikItTfsnqq/zCfmmTHH3ycjg6TbmjICwY7P/c1ha
 ADHRwIQMrjUDhBQQ7Rw/YLv8S3rAjgGUs/I+Pp4nEXenirbgHLr5Pme
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

Assisted-by: LLM
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
2.56.0


