Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0104D34A76F
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 14:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014526; cv=none; b=fKbvgCsvir63MSkh65/RhAeHoyvmOXTtBT8z7TJdjjypiT/9TomdbpQ7KRXPtIhcUTwTTh37wru7lmXG59RwKOyqENj4e/ipLA05nObHEymn/pJrwY1r+zrRrVrTykeANVFcD8fEBE8S4KV8VHHK4Qb6VOG+/+3WYj85RRFOsSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014526; c=relaxed/simple;
	bh=issgt3k3RvI/5CGJJzJAMkNYfQCHRM53jrOTT6DroO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vj9oKVwxoZkBvuc5kJbj4VS1G0bKZFSI9i+Qi7rjToNtJlBbZ8GZaIQ0K/b6Z0nfqlkU3VS3WylkiEqM5iViVUIw0D55UUIlIxIsbxBDOTyG9ElGNQTnlRQYCGbs7/qs3w2BJlgfHF0MaamJH6WCg8mnqiYb2hzmb4t7x5rhOzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ysX01lqr; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ysX01lqr"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b3637b90so48337245e9.3
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 07:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014523; x=1781619323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXs3e9o8/qwduDh5D/7PUgnbBUvjl2lx8El20vD0f48=;
        b=ysX01lqr2YfYZ8Hb2mQB6O2oP74cHzWHtHWS57DLP+g18P+yI6Cf3MamQI9SpZNMXH
         mobdz1rxaZt5aFyKMook18Ds07NNFJH7ruhsgbdAUng93eifT2y1bwEm8J591Iytw6dX
         S3XKuLhooyMhT9ozK0Z4CPyAfSWLSFOHBoAzm0ScgROlReIV5eoOavn4/3p+ms34oD65
         16TsKF7BhRpp2WBbF8cTAqxwHfYoSLUM7mk+wNHNq9J2vG+mTOstdRUnTU7E/2zfmK2n
         NhOJ7gG6+8BR0jEl/kEwXJa6Z8d4RH2jNqput+CuhFP8/f2zdTlt/sZWzU1GEZGJIP9x
         V2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014523; x=1781619323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IXs3e9o8/qwduDh5D/7PUgnbBUvjl2lx8El20vD0f48=;
        b=NiG28E6S3c8LBg2R6SjGuRC+seEWaVb19lznRMhc3XL86sa8VaEgyW5Z8yrzeJ9qm0
         YS+PGi+Yr5kDo5exlhXojtIfOtxWgbsRLGHuHYYhDEzNY9bbuZbeEe/s06H0oXdkZNG3
         nD+rW9e6GBOcoHXAsUlPlpGofXZ7Z8ZPKdqDLyDQoUGv4WNHSuoT/Xv+ES9FhVE4LDCo
         BTBkoprALKrycaJ67AQG4uHM2xJYXXL02ihQyNr1S2Y/FcNduE7kTlWvMJ5qd9t8Z3kN
         HsZLZm0zf1nPGa5M9buxOSqbKtq7kNO/+nXJIUgaLieGPTAavettLlPYJp692ZtOaJOv
         tntg==
X-Forwarded-Encrypted: i=1; AFNElJ9aimI/JGAfatE506WxFcCQmZniOPWEvFVZ+vDXxJg8AxKQRlv40WPaEc3KfmL41ERYf3A/jP0PeGk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/fs9roEFHMeIlHCSZoXHVoUdlHvVog6wG7XNeX4WHc3RoQzTn
	5nvCw1iRlpD3cV4Kn3pdYs+0vbXf7AhjRQt9IZaJqAx4YGWxsa4tHWljs1IO6KbsFJo=
X-Gm-Gg: Acq92OHlblPZsfRch7Pwo/lhlNov4YPW2P0BiP2XxSusncge5z8vHPfstPLT80MQV1L
	jZcP7wADxqAlFZTBDVv0d+qCnEsSeF5VYo2RXvWwoUzq2+eV9p/Ds8jxdmoPizmmuRqQKj3BTmo
	pMVL2aboeRH4qIKEAE0VPRecrepa+TSgZrMKGQs76HaOFLQjT3Y8TzWu3NoG1UwT3cDFmpqoavR
	GvDKPzQCer+zxPVrNyfqTChg/rCtG5ZplZ0ofsBrQIlHM2ti/4obHrbolvnnFyCwXTCbBbtQ9eo
	5pUfrZJMOfFp7N6UlKyy5p/eEatmzQwqqkh6elXaR7puEHHciYJQu0YdFYh5GyL8bd/YU6xCEuT
	pZHTlahoGm+fol29IrLClg9ilpG95SQdZYQPxczk3q5/gA94Azw6zeluK9wcvdJxfEuRgtfkfDY
	J5fAqyb18M0O4zmYgWSkeW+3Nvk07nTvn5zyryTAJ9txNd1p5xQmmGCS3hXQ==
X-Received: by 2002:a05:600c:5246:b0:490:b591:b5a3 with SMTP id 5b1f17b1804b1-490c26196e9mr324507225e9.32.1781014523109;
        Tue, 09 Jun 2026 07:15:23 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:22 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:43 +0200
Subject: [PATCH 07/12] clk: qcom: gcc-mdm9607: Drop incorrect
 apss_tcu_clk_src
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-7-5e9717faf842@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

From: Stephan Gerhold <stephan@gerhold.net>

This clock does not seem to exist on MDM9607. Reading/writing the registers
always results in 0 or crashes. The math in the frequency table is also
broken. GPLL2 on MDM9607 runs at 480 MHz, so:

 - F(155000000, P_GPLL2, 6, 0, 0), // 480 MHz/6 = 80 MHz, not 155 MHz
 - F(310000000, P_GPLL2, 3, 0, 0), // 480 MHz/3 = 160 MHz, not 310 MHz

Presumably, this definition was mistakenly copied as-is from gcc-msm8916
(which uses 930 MHz for GPLL2). There are no branch consumers of this root
clock inside gcc-mdm9607 (notably, gcc_apss_tcu_clk has bimc_ddr_clk_src as
parent instead of this clock), so we can just drop it.

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 7c1890934fe8..61809e221d69 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -677,26 +677,6 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_gcc_apss_tcu_clk[] = {
-	F(155000000, P_GPLL2, 6, 0, 0),
-	F(310000000, P_GPLL2, 3, 0, 0),
-	F(400000000, P_GPLL0, 2, 0, 0),
-	{ }
-};
-
-static struct clk_rcg2 apss_tcu_clk_src = {
-	.cmd_rcgr = 0x1207c,
-	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_gpll1_gpll2_map,
-	.freq_tbl = ftbl_gcc_apss_tcu_clk,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "apss_tcu_clk_src",
-		.parent_data = gcc_xo_gpll0_gpll1_gpll2,
-		.num_parents = 4,
-		.ops = &clk_rcg2_ops,
-	},
-};
-
 static const struct freq_tbl ftbl_gcc_usb_hs_system_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(57140000, P_GPLL0, 14, 0, 0),
@@ -1515,7 +1495,6 @@ static struct clk_regmap *gcc_mdm9607_clocks[] = {
 	[PDM2_CLK_SRC] = &pdm2_clk_src.clkr,
 	[SDCC1_APPS_CLK_SRC] = &sdcc1_apps_clk_src.clkr,
 	[SDCC2_APPS_CLK_SRC] = &sdcc2_apps_clk_src.clkr,
-	[APSS_TCU_CLK_SRC] = &apss_tcu_clk_src.clkr,
 	[USB_HS_SYSTEM_CLK_SRC] = &usb_hs_system_clk_src.clkr,
 	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
 	[GCC_BLSP1_SLEEP_CLK] = &gcc_blsp1_sleep_clk.clkr,

-- 
2.54.0

