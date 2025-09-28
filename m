Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59B01F5EA
	for <linux-clk@vger.kernel.org>; Sun, 28 Sep 2025 13:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759065269; cv=none; b=F/Cjhai5WS9m6cJtIjoJ++90vWCNbWAhfwCKr3fKnmrcS9L2k05yWEZkTUjCcLQOE1tNrIf+jwIi1+epqOhOR3TG7dBz3fZrOVCURWbMvu9ZYs35AWitKr7dgQW39kMYOg5bPxpEuVXvjiSaEe2g7yhm2BvUVp50iFNzGD8f4uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759065269; c=relaxed/simple;
	bh=3riZSv89RF2gYphT6PVorEQD/jVFxTpvGpr0z6+XnH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=INm0rxx46dteJLQDOZWOmOTQrLNnfw5ybKJ5Jxl7S4N/3W69nJeq05YSlvkQBz+07ulz3uv4B1DoWTss2vL6u6KRlpY3uQZPDq8QagMGePkNDWvycGZUEFyTVnfm3APy1UnKkrf3T3+6DQr0FVZMV74wf5sG774ol4/arV2eA3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qLut65Bg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qLut65Bg"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e317bc647so23356015e9.2
        for <linux-clk@vger.kernel.org>; Sun, 28 Sep 2025 06:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759065265; x=1759670065; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gnNndhc0WQdDWGMDmZUWmVIb8CtGrXN6Pk1K2XcSkQQ=;
        b=qLut65BgcxvXtMLERBOXoXoDW9XGGi82l2Fh6QzoOGAFNGce/8eosmEWvMeoH2SRxq
         osQ695KbKkJ0fUluO3XzP6kT5vC6LC3O3a9rKv+VuyMVnLERZs1B0z24tH2yG1c0jWxQ
         Ht8OrukJM1mKXvw9eoNkLKarUvhEiajQza/AQ7MNTw8eX2inGjA8oV/AWvYOcqnLB9VU
         s/O1+Vkp+zNsjPjPctsWdUU/tW0IxMC6dpXabcAz7yjxBElvzmGUgLFhD95sC93I8ZmX
         9qtqBC34FksCg7uvE1YX3jibertHVWNxN+4PHJ7eaOGw6O0rgWvtPP+MnwcEi+iVnp99
         aBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759065265; x=1759670065;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnNndhc0WQdDWGMDmZUWmVIb8CtGrXN6Pk1K2XcSkQQ=;
        b=SN0hjeTSmS8FUk53L35Fb1aVUf9eM+hDdtXgupS7mlWlfC+6CLV0vERRk1Fl8vAetH
         w2flj+6E995ow+pakgihiuTnGxObB1LYsuBlKvptunO4oMaRUg5QmP0ohyBb8U9UJBCK
         sepp9TwCevrch3ZD3ebfy3P0wWKtoQfmEjeneCdCGgKGfq47osMNarmobqC+FQKiVE1A
         L8r5WHEE3Qq+xu72uD6ix2KxgIXbuZkQKM6Xlu7UqCRhBb82aW2/ffiVWAZAw1qEaQZh
         S7rVKnL94lwqy700NvOTVVVnakwlQaMZJKHkEuOxM4sE7hNlZeAcfahHAfXBVttjXLK0
         ha/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDyItgE1ylDAvp112d0JrW/a6WCvEnbxvvVfNrmQEDBZULkaHBCu+UeY9MbfLkfX41sTJxreH8mB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnTSWjmZspe0weLsxV2C39Il4JWkKfDqejVSCm5iFa/6mj1THs
	T/xMMkOVtTr3IuFgPpzoeqA8vgd93vPHSRquF0o/EQxNelkUN4l6sN/PZanQ/4TLcvk=
X-Gm-Gg: ASbGncthI51sIgr2GqZSXTFn4Enr7zpiqoRHzxeqvMiZ3oxqb9xbA6fCtzvf/vO+rey
	aHQ8aI2J/wRzMiwQyI14qPJ/ARKW3U9xcwb95e3KHEfGzqloven1OfQRsV6pu0MQI8hRnv3CYCj
	nShwwA7/wEuhEr/jqzzA/c7OThvy8gLz09a6l4zftmtHd02ZDDm2dT0LYy4ek4ld1hf+LCos5Fb
	kygvruyIUY+RSaWhLx5/qjqn8GEzkZQubMXB2UBOn9qnKxTaZUC4Q9hXbIXg0BF8ZK3BixDcPcj
	RyFIZVGQj+aLwyDMA+vYFt0bx2AYL58xjwxyhCXZF2BX/2nJ0lhXqLbWkjHNa6xf7Hq3WMtXPuj
	+fGh8tlPfgHp4W+sgrP6+
X-Google-Smtp-Source: AGHT+IFHb3oDQ0OVmvk0hVB8JKFPZtRGTwTlv1xt2zo6q6m03RR19MwfC+nHlf/J1s1P9XWzP2+A4g==
X-Received: by 2002:a05:600c:8286:b0:46e:456e:ada5 with SMTP id 5b1f17b1804b1-46e456eaecbmr42961705e9.28.1759065264953;
        Sun, 28 Sep 2025 06:14:24 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab7d4e3sm188496385e9.23.2025.09.28.06.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 06:14:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Sun, 28 Sep 2025 16:14:09 +0300
Subject: [PATCH] clk: qcom: glymur: Fix the sec and tert phy pipe clock
 halt check
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-clk-qcom-glymur-gcc-fix-sec-tert-pipe-clk-v1-1-55e323cc98cf@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKA02WgC/x2NywqDMBAAf0X27EIetdj+ivRQ1jVd6iPdpEUR/
 73B48Aws0NiFU5wr3ZQ/kmSZS5g6wro9ZwDo/SFwRnXmJtrkcY3fmiZMIzb9FUMRDjIiokJM2v
 GKJFP6zpc2sZa731voPSichHPV/c4jj+AShyiewAAAA==
X-Change-ID: 20250928-clk-qcom-glymur-gcc-fix-sec-tert-pipe-clk-6f48511333d0
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1618; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=3riZSv89RF2gYphT6PVorEQD/jVFxTpvGpr0z6+XnH4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo2TSmmRI6R9RZyfovfldOzZKEpXFB1ZFYgHV8k
 R5526ldYfOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaNk0pgAKCRAbX0TJAJUV
 VsrgD/9mRj60D87jBf2Up0vFZFZ+yc2SiYwJj2SOotV65izhQ6ON59lJ6wa/LwixviEDBH4M9f9
 jTdsp2tWnwXIoUyH54YCKHL1L/ZZq/ekUJqloDkH7g5lQJxHA6WDo7bHd10B+S2o/UxT+xzogx9
 7n1fXb6ttVNNJehlB1Al8Pi1SzqCgDS2tYHyYOx3hXMV2Y6ASrnBQB7gu+kaYeJ692bVzK5FUu2
 lqdL35zrnqtiztC4wtvUQiaBALn4875yee8VHHH8bJXZ2edV5PdkHhimFwRFveidJja0NQ74Gga
 3nwYTD6zDkowpVUVrXPvgw5qdqDVVr0jUdrrwrJYv2jsBFoD2WEtRFTFSfmILmFBOICK2u4ENcA
 8nICplVZGn6AfLP4unAwKmpatrs6v3sBJqOCncE/xqNnxbpZTfxisq2ZI63et4dRbN/0LXF9J93
 8z9L8M3Aot7WSFfyfWSP69c0JNaP+Y6LrqbQG0unypyuD4n7ZhriZ6D6zE5VTgmt1I9ZHeNyWCt
 TSRm5xrT1EU0rWe5/U3KgZcnl3dECSpoV7fJj1NIHXr1+Hy4qCts5pbU7jAc8gwGib0iNQDE15Z
 nO0r8dbHTjup5uIsG9RKItELgkoiPb/WYbCBZGRIzVNjagK5uMCKLXWbcDGEP9aLVNvq10dN9Ho
 KgHDmlsfRHwWQOg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

On Glymur platform, halt checking on gcc_usb3_sec_phy_pipe_clk and
gcc_usb3_tert_phy_pipe_clk on enable reports them as being stuck as off,
but since the gcc_usb3_prim_phy_pipe_clk clock halt check flag is marked
as delay, means it probably it should be the same for sec and tert as
well. So replace the voted flag with the delay one for these two clocks.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/gcc-glymur.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 62059120f9720bbac03852c0368f4de3038a559c..f00d72bb4ac4d60032e5332e6bcc439f890e5082 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -6816,7 +6816,7 @@ static struct clk_branch gcc_usb3_sec_phy_com_aux_clk = {
 
 static struct clk_branch gcc_usb3_sec_phy_pipe_clk = {
 	.halt_reg = 0xe2078,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_DELAY,
 	.hwcg_reg = 0xe2078,
 	.hwcg_bit = 1,
 	.clkr = {
@@ -6872,7 +6872,7 @@ static struct clk_branch gcc_usb3_tert_phy_com_aux_clk = {
 
 static struct clk_branch gcc_usb3_tert_phy_pipe_clk = {
 	.halt_reg = 0xe1078,
-	.halt_check = BRANCH_HALT_VOTED,
+	.halt_check = BRANCH_HALT_DELAY,
 	.hwcg_reg = 0xe1078,
 	.hwcg_bit = 1,
 	.clkr = {

---
base-commit: 262858079afde6d367ce3db183c74d8a43a0e83f
change-id: 20250928-clk-qcom-glymur-gcc-fix-sec-tert-pipe-clk-6f48511333d0

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

