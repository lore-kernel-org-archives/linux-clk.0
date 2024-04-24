Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBB88C05
	for <linux-clk@vger.kernel.org>; Wed, 24 Apr 2024 01:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713922776; cv=none; b=Sa5QPPFjptRn0cvzPySG+Ljz6ZYSmwqHF+o+6jnb5TPszQC4WrhNXu1O1liQe356A69iqUibZpApHXKkOwxTqjMVQbAFrEyzN4PmG89GZFEOjdWcJPyuALes/23iJmqdFNB9tKQvU5+mo3F46Ueoc6G9+WswxiladikjHS0Q5zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713922776; c=relaxed/simple;
	bh=mmpz/wbHDRDW8GXi4f/Kh4tJEWD2H5kJEpj0vD29QCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U6UE2b0KtLCtTJoMsvoEt7FYGzz85uu5uzKdSXERUUDPDPrh42XSjIoyVNVZ3KuTh291lu/E0dS+9cQqFSCO7RVzSs6wOF/+ek0G8KpUPL1IbHZRZW1pNuV9txETtI4TwIrHlrJX5l4ZUjLYQF7biH/dl9als8atqvMxK8JU6bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bc8BRe6j; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bc8BRe6j"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51b526f0fc4so3467636e87.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 18:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713922772; x=1714527572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0gU/NWfwRkEOZNKhr+BK9ugofjdDYkGwMawolvk4RI=;
        b=bc8BRe6jbsEGGn2p4nNfmpW8SzfgREPf32qM0jBrjNkZGfA/p0L3cvPZ6ya7bqPXOd
         e1fftUbLdyYWIztjU6uBkupiP6NWpzTyoZEdqdcT0RFx/tj4eijWJqeqK1/Zkh9Y/wGc
         USj+2MEg/TUVYeDW46ySGB2ymTAC23HmLhdVb2XMy0O5E0gUUha8ERFbINZ1iOAQ2+sG
         7sOESKAH3eekmui5uDfEA3/Qbt+CGAcW72pRcAh1xAVILqJ3Iqco6UP/rLAwY3W1hp32
         UTRtB6dwqXeXCYCQNrAPf+Amqm7yPILSGaPClGvAj+qOH/h+QTYgEAvNyhfNm00wffxU
         5x3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713922772; x=1714527572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0gU/NWfwRkEOZNKhr+BK9ugofjdDYkGwMawolvk4RI=;
        b=onG5KyWC0Y5l81EvIb3/C0+qGTHBrWDG448GOeARIezb7YhiAoVDYOApGLi5gnVOtz
         Dmbnz7LQmUFOh6wB6OWuFWXFu849iw0iAOP4kJnlbFp9IVllijbsoB1C5KugU2fVvnrC
         nUNnVDZVGnWoJMcIV3mgAZPBzqxghRQW88MaOs9gaIe6U5RuBh0RFgnm75aDzYIrcOmu
         Iyosm7xmZ17Jmm7x6PKa/uGgE/obo3CknsX78Kb696iKe6LJJ0g9tbk9/f1vCMOddYdT
         QJh8kmxpBj77tqtgX9K7x4pac1HJFvFG+56dh1mG/6LYbu5VuGeouxINHHTTErptK4wt
         eNJA==
X-Forwarded-Encrypted: i=1; AJvYcCXU3NPGAf2wfGsnzgafv4JlaEoICIop5pDG7DlpTwJPdEPnK6q/u7uUQ2R1AIcR5nHHcDDm7Ym5zsloMuWqkkKsGvRZ4Br0OSTi
X-Gm-Message-State: AOJu0YwcOK8Jtd2M+nRx0mBPxzI0EybfHAsgUC5jSAaYHzWtll+7XXnH
	8yeNAXvtbMqhmF2OHl/qsA7z6mWJsIEnmYJIopsgHCAx2rAoGLGus7Lpq3h/biw=
X-Google-Smtp-Source: AGHT+IHssxT9a4TQxoRvOW9saq3mUk+fPKrGmejqpchwQcWickC/qj7UsGh6hmnVqlJw5urFCcgvLA==
X-Received: by 2002:ac2:593c:0:b0:51b:bdb1:e658 with SMTP id v28-20020ac2593c000000b0051bbdb1e658mr622916lfi.55.1713922772109;
        Tue, 23 Apr 2024 18:39:32 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g12-20020a19ac0c000000b0051bb40c7ee7sm308220lfc.185.2024.04.23.18.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 18:39:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 04:39:30 +0300
Subject: [PATCH v2 2/4] clk: qcom: dispcc-sm6350: fix DisplayPort clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-dispcc-dp-clocks-v2-2-b44038f3fa96@linaro.org>
References: <20240424-dispcc-dp-clocks-v2-0-b44038f3fa96@linaro.org>
In-Reply-To: <20240424-dispcc-dp-clocks-v2-0-b44038f3fa96@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mmpz/wbHDRDW8GXi4f/Kh4tJEWD2H5kJEpj0vD29QCA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmKGLRxO41CkbrfP/anarHJu9uaguFaqMi0IZTA
 PU2km/d/seJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZihi0QAKCRCLPIo+Aiko
 1aVdB/96X0iiZjshy2kzTustfxyKgqGNazxxs9Q/tAO5uZOnN/lXtDx+GoVk4LCnLmzrB42z9DE
 prWUP6PlrjinsLM7xgBd0iVjYPD7p+olHm+n3pXcfY3TYryrDl0s2cLTqKFdRGYT3ACXp1kNUU/
 8QvcmdJGiIGm15pYUnxdw+thJWztkbNz66QnL5EWmFQUEfA9av5PUE0W+hN8j8RUfqP/rSD5bUE
 iV4fWhYHbRKMaFiLf83FX5IVSGoHcA9b6sdxndsK3tr7dekdUGcoAyj7Zmr7ap/lAtUciZEuAhU
 NK/sHPL1Srqgm6jnyCYHEMH6chokj+O0Ue8+17KP53xP6wsj
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On SM6350 DisplayPort link clocks use frequency tables inherited from
the vendor kernel, it is not applicable in the upstream kernel. Drop
frequency tables and use clk_byte2_ops for those clocks.

This fixes frequency selection in the OPP core (which otherwise attempts
to use invalid 810 KHz as DP link rate), also fixing the following
message:
msm-dp-display ae90000.displayport-controller: _opp_config_clk_single: failed to set clock rate: -22

Fixes: 837519775f1d ("clk: qcom: Add display clock controller driver for SM6350")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Luca Weiss <luca.weiss@fairphone.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm6350.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
index 839435362010..e4b7464c4d0e 100644
--- a/drivers/clk/qcom/dispcc-sm6350.c
+++ b/drivers/clk/qcom/dispcc-sm6350.c
@@ -221,26 +221,17 @@ static struct clk_rcg2 disp_cc_mdss_dp_crypto_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_disp_cc_mdss_dp_link_clk_src[] = {
-	F(162000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
-	F(270000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
-	F(540000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
-	F(810000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
-	{ }
-};
-
 static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
 	.cmd_rcgr = 0x10f8,
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_0,
-	.freq_tbl = ftbl_disp_cc_mdss_dp_link_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_link_clk_src",
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_byte2_ops,
 	},
 };
 

-- 
2.39.2

