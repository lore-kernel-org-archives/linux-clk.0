Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7201C3F9F42
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 14:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965723; cv=none; b=MOsebKo4doXEOzZU9YRJ3v49GyhLlpXIo2G6iEfi3heHw2ns3C1iUiFy0pCIJQXYzZmn7x/u5atZuN7nHTVGzE8FWPsifwZJgRFeaMt/lel+FDEgygRE5IfNfodHwryegGumKglMZhwFmKIIPJhFH2bomyhO4btRmmTzm20OFjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965723; c=relaxed/simple;
	bh=29a+QWmzRiXdRrprbsrP+/ZM7W6QdW0AI3DnrCCqPdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YfsCYYmfH8zka4/tJv8G6AEtp4jh2NJx9wBAP75jiMZcB9wimgzjDV4791WDlZz61THtayhsPNZ7Ss+isbyyV7mnw3KrceTCw5qk5x2z801gaQlnkEIYXOXoypa/hnJa9asc3YuGGH2qFMFjIkJ/wkDMxRPXyB6KLnGQpOum7Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gEJ8WeFB; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gEJ8WeFB"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59e6ab06167so770362e87.0
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 07:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774965718; x=1775570518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fRm2KLSrPDi3+vX0vzzEz5KohutdRyFsvItUKtsNxA=;
        b=gEJ8WeFB+Ul/SASuj5zoCAW59eju+jqZmlmykK/Bb0T0Ief1m8qFlBlBNga7Hydijx
         vW1Q5GxuzW1cVpIlrcreDA8jcscgwd2/91k+4M2geBt89OPVgLz+EPsT2PtQMkEbGBCA
         4GfO8aVrlJZIA9zzkwMLa39NR2PdHms9E7pMvqIvKpwXE9KDdqSGSX/Coi2nqkStUlbd
         3h7gdwX1T8LNki3hxH33n7im1Teo2BMum6HruvaD0q9iOrRHIhVVU5Ge5cEFFKDAOErr
         Y3avWROfUYg0+PKwBU/RrByKRJNqcE2kbDDmK5Gc0x58V63Qgy/62K10cNXG/aAxqzS6
         DdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965718; x=1775570518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9fRm2KLSrPDi3+vX0vzzEz5KohutdRyFsvItUKtsNxA=;
        b=LGJ+hmQ57YjaQVMmo/P4fhKEDdKxU5Af/67AHwlh0dqd7C3xDjWP5++UfZ4EWUMmDU
         Y0uq3hRTkqHoTRozCDRBQSUa3VxSek5ByM5C727vzz59cr4lLacko1BhgfrAJp0Ug5RI
         ylzC5jxiIwc9SkTmey5g55wE4kx61TcdfqqHat73vRKPKte2t5HY2aQG2Skhvtm0NyZp
         zQJJpirszxNKmCROEt1zjyzhGUOhAKux1eOWcvVkw24QT3TsnF4UnPF7Mn/hquX0vni/
         FeBzWgBKvsMm2DiD/P9vB3sIfFmjFuNCyFQiTAVcmH4rTPzcdVrv4HFap46zCW5vt2Ds
         h/3g==
X-Forwarded-Encrypted: i=1; AJvYcCXtriGG6z/1XiIW+spmOKLCbnCfnZymkCb+pMvl+Wuuv3QP2iErAZQV8CEXQyRMt0r3lnRcxfK87S0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAxEW5ltQKZtVMBe1vO/CLNRBepeChcMlT8G5EhoebygYgOs1t
	8pgTB1TFmbormoDS+LdRZLMmwPejKRlbwqXYjIZBn9TFfaTRZoA1t1ovFhChJqupICQ=
X-Gm-Gg: ATEYQzwvRLn68LrDy/jraL9KucnXcytqiaAxP6oRv2wcg6R1g780Sjcw/qRkUwtws+1
	uSMbzyCRY++fVn2mwnKAmYPcIJrXUxwa/LZsFwhgEgW/MVOa8rIUZD5nkYowCYmLeLFQFO0pcx5
	hBjuPb1p4Bcx3paXlC+YYown/tw6ok/DNP022yntZbZs6oBoI2kOucch9jW7zLN2bi6/+jqsD8T
	f+9Xv0uVBt8qBVxkDdNQqKbkK3tQ14HnrqtGHOloJCvC8+1KVemb0mk8NunQlNgz9e7Z2rN89Ku
	ykNV9g3EQC4UAfVjoRqHIv+Krn+3a4iEVw9W+tVn0SVc/KrmmGJtlOHCu5Vn7VPE3NDp/J1FF/t
	o+J165TxObd+cf3AohYLvESwfYY/DW00a73DPCVS0Mc+a394zTqMCCKkYIszt5AxZZPOsKdM1zV
	EMmVBwqSzCtrqkHvzIjC+Qn1k+iuCttY0NjPAQIfGqZTG17KVLdQWXJeouL77VKLpyew==
X-Received: by 2002:a05:6512:3b9f:b0:5a2:7c19:414f with SMTP id 2adb3069b0e04-5a2ab913e44mr2639870e87.3.1774965718014;
        Tue, 31 Mar 2026 07:01:58 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1456aa2sm2434745e87.68.2026.03.31.07.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:01:57 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: camcc: Make Titan GDSC a power domain of clock controller
Date: Tue, 31 Mar 2026 17:01:42 +0300
Message-ID: <20260331140142.892579-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting from Snapdragon 845 platform CAMCC IP is a provider of GDSCs and
clocks for a number of CAMSS IP blocks, and the clock provider controller
requires Titan GDSC to be turned on before getting access to the CAMCC
clocks on the clock consumer side.

In case of CAMSS IP (including CCI) the devices are described as requiring
both CAMCC Titan power domain and CAMCC clocks, and the dependency between
the power domain and clock controller is managed in the consumer device
driver by forged runtime PM operations, which is a great complication, but
it was dragged to the working state.

Camera image sensors require to get MCLK clocks provided by CAMCC clock
controller, however the sensors cannot be described as ones belonging to
Titan GDSC power domain hierarchy, hence the original model of shifting
complexity of runtime PM from the CAMCC driver to CAMCC consumer drivers
cannot be stretched to the sensors.

The change explicitly adds Titan GDSC as a power domain of CAMCC clock
controller on a number of modern Qualcomm SoCs, where their correspondent
CAMCC drivers are added into runtime PM framework, this allows to perform
PM operations of sensor drivers out-of-sync and independently from CAMSS
driver. The simplest way to reproduce the originally discivered issue is
to attempt to unbind the sensor driver, which triggers rpm_resume():

    % echo 0-0056 > /sys/bus/i2c/drivers/s5kjn1/unbind # SM8650-HDK
    ------------[ cut here ]------------
    cam_cc_mclk3_clk status stuck at 'off'
    WARNING: drivers/clk/qcom/clk-branch.c:87 at clk_branch_toggle+0x168/0x188, CPU#6: sh/832
    <snip>
    Call trace:
    clk_branch_toggle+0x168/0x188 (P)
    clk_branch2_enable+0x24/0x38
    clk_core_enable+0x7c/0x300
    clk_enable+0x34/0x60
    s5kjn1_power_on+0x110/0x160
    __rpm_callback+0x50/0x1b0
    rpm_callback+0x7c/0x90
    rpm_resume+0x518/0x758

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-milos.c    | 1 +
 drivers/clk/qcom/camcc-sm8450.c   | 1 +
 drivers/clk/qcom/camcc-sm8550.c   | 1 +
 drivers/clk/qcom/camcc-sm8650.c   | 1 +
 drivers/clk/qcom/camcc-sm8750.c   | 1 +
 drivers/clk/qcom/camcc-x1e80100.c | 1 +
 6 files changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/camcc-milos.c b/drivers/clk/qcom/camcc-milos.c
index 0077c9c9249f..15d432859843 100644
--- a/drivers/clk/qcom/camcc-milos.c
+++ b/drivers/clk/qcom/camcc-milos.c
@@ -2132,6 +2132,7 @@ static const struct qcom_cc_desc cam_cc_milos_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_milos_resets),
 	.gdscs = cam_cc_milos_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_milos_gdscs),
+	.cc_gdsc = &cam_cc_camss_top_gdsc,
 	.use_rpm = true,
 	.driver_data = &cam_cc_milos_driver_data,
 };
diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
index ef8cf54d0eed..ce2d8c8a57ac 100644
--- a/drivers/clk/qcom/camcc-sm8450.c
+++ b/drivers/clk/qcom/camcc-sm8450.c
@@ -3045,6 +3045,7 @@ static const struct qcom_cc_desc cam_cc_sm8450_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_sm8450_resets),
 	.gdscs = cam_cc_sm8450_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_sm8450_gdscs),
+	.cc_gdsc = &titan_top_gdsc,
 	.use_rpm = true,
 	.driver_data = &cam_cc_sm8450_driver_data,
 };
diff --git a/drivers/clk/qcom/camcc-sm8550.c b/drivers/clk/qcom/camcc-sm8550.c
index b8ece8a57a8a..ae40979b2f12 100644
--- a/drivers/clk/qcom/camcc-sm8550.c
+++ b/drivers/clk/qcom/camcc-sm8550.c
@@ -3545,6 +3545,7 @@ static const struct qcom_cc_desc cam_cc_sm8550_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_sm8550_resets),
 	.gdscs = cam_cc_sm8550_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_sm8550_gdscs),
+	.cc_gdsc = &cam_cc_titan_top_gdsc,
 	.use_rpm = true,
 	.driver_data = &cam_cc_sm8550_driver_data,
 };
diff --git a/drivers/clk/qcom/camcc-sm8650.c b/drivers/clk/qcom/camcc-sm8650.c
index 8b388904f56f..c38dd23430fb 100644
--- a/drivers/clk/qcom/camcc-sm8650.c
+++ b/drivers/clk/qcom/camcc-sm8650.c
@@ -3563,6 +3563,7 @@ static const struct qcom_cc_desc cam_cc_sm8650_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_sm8650_resets),
 	.gdscs = cam_cc_sm8650_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_sm8650_gdscs),
+	.cc_gdsc = &cam_cc_titan_top_gdsc,
 	.use_rpm = true,
 	.driver_data = &cam_cc_sm8650_driver_data,
 };
diff --git a/drivers/clk/qcom/camcc-sm8750.c b/drivers/clk/qcom/camcc-sm8750.c
index a797b783d4a9..969c2c80065f 100644
--- a/drivers/clk/qcom/camcc-sm8750.c
+++ b/drivers/clk/qcom/camcc-sm8750.c
@@ -2681,6 +2681,7 @@ static const struct qcom_cc_desc cam_cc_sm8750_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_sm8750_resets),
 	.gdscs = cam_cc_sm8750_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_sm8750_gdscs),
+	.cc_gdsc = &cam_cc_titan_top_gdsc,
 	.use_rpm = true,
 	.driver_data = &cam_cc_sm8750_driver_data,
 };
diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
index cbcc1c9fcb34..32169879990a 100644
--- a/drivers/clk/qcom/camcc-x1e80100.c
+++ b/drivers/clk/qcom/camcc-x1e80100.c
@@ -2462,6 +2462,7 @@ static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
 	.num_resets = ARRAY_SIZE(cam_cc_x1e80100_resets),
 	.gdscs = cam_cc_x1e80100_gdscs,
 	.num_gdscs = ARRAY_SIZE(cam_cc_x1e80100_gdscs),
+	.cc_gdsc = &cam_cc_titan_top_gdsc,
 	.use_rpm = true,
 	.driver_data = &cam_cc_x1e80100_driver_data,
 };
-- 
2.49.0

