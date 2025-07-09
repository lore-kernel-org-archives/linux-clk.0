Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D2C28BABE
	for <linux-clk@vger.kernel.org>; Wed,  9 Jul 2025 10:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752055797; cv=none; b=kuvmfsRWRLmtljFBOYFjukJiAsM9wnyy8CiT7nc28zUW2pRksIuKNK7aUmGzebth0udK5Fn97jsNvFhO40s55Vs2qkiVhHmGt3P9FOm5daKiAj+H3WrEQTrpC2yLaJ2qFYPBsPFmEdvbguBXqrbeeRuL7U98+hIEdrm6sWiAkvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752055797; c=relaxed/simple;
	bh=oHtxKLb95kWtO1ABeXnwkyA2GtGWv8G/qQ04XDDzKoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fc19LcIvCCK8RbaW7vCIPSI4pV56QlVlwhNNLkD2jsdmqAb0XUls6dD3DW1Z8OAFF5cDDjkE7+k5ylmz9bXAmSysVgWCXMUSOWguZokAH0SJ0d991uSZSkVLC+zdXAmR+FbNygtt0gLRO0kPgPoSJULWKgSxTaPbxi5YKRGne58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TWg55c0C; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TWg55c0C"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so487926f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 09 Jul 2025 03:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752055793; x=1752660593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6HxvD09F6nT+66ixpsjcoirCJ37IebWgFlBepGL5ug8=;
        b=TWg55c0Ce6UX+XBe4R+NVyUUzcZglTFolRq9nhSSuxSyHHGlbsI5LMdEmF5+r2G2Ee
         mW0UwkzcsA0if2hMAXRfRe48+jUd2i+b9AGh7YZtusQ0px5bwhWPNjVeUuyA/uTGRGjc
         cJE4EZ72MTm7QiSwP3jzAcvRBTLy/6MOS/vsR3MGhK3U8nJXQVpvezdheRG7qhF8ulL8
         ZTFhipAIPZ+sNWCRpRVz/S4UVZSyOU+elNzq1KwEQ/DU7qSfvMW/bQKELsWryEB+WPgi
         Y9T2emXolOMAw1w/zetrR+XcocR1OfPv16K7ZL9L7ger7P0L/3SkndHiX2RLx8vqf9Zl
         644w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752055793; x=1752660593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HxvD09F6nT+66ixpsjcoirCJ37IebWgFlBepGL5ug8=;
        b=FzSP1d5VWgZdA/Ph2QswUVGV53WTfKXROKmE7w9S3cGPvnDPPv64bGUSx4e6TSvQur
         9GnR3UxkId+au64kPbmJLVdN9An6MzT1I6auTzAb14Xa+neVmuCjHI3xFuu5rCvmgoxC
         oS0mVin+DUAPxRDDiD2Td+UQGwdvjzdUhgUHrZD5OJ5h1yTkVlVxbMNttFgLC3jhLhEB
         7fDaEiLkLyKPy78B/7xNuIp1lqJBd88hu7Za19eXiliXJE1vkfQ4/MDaeSGvx+e7wXyP
         4RAbnvdfdLGCj1L9dgdxwiUIuiKlyPVeHAIMZz8wR9ditAmhkUWUMDeoXMkPH9I71NHU
         38aA==
X-Forwarded-Encrypted: i=1; AJvYcCV9QRqCSGw9VTuJ4jmcAOy2RnKloUzQIBmu+q5lFwUg+pgAxRje7yFHo0vDUk0eCdlILK0t9z6WRGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrUG4BRDAMS2ArwM9zudrrHBuUSawa2yRT0MIWm+itcsY6L6kD
	DJ8M7WfoIAw4o9rD9tM6RYUkDXisfv5+awWwUjO7iC97ASs6sj55xeXpOsbnGT+maXU=
X-Gm-Gg: ASbGnctGyJfQz5CycyXfcYQRGtmohJgHHjjKDnPE+Eid6SAUOdkF6HYwUFbZ1iS1Xso
	62eCjIfr6ko0KF1GXayd4MOOsm1FZaxDBlAlkwTTk1WWgzipNg1xQYcdRvW5X+lk1hV/3loh9SJ
	qJ32iADDidiRaQHjo2EFz3pHIrmNnHnpMIcUiJiq+bBqNDJQ32rq9hHlJGFjC/FZ05GHIFu3u8f
	AwVDwBjJWtZvevPG1jqICGQWMRgu1TxiFlbvfWMcYlr6IDyKJTYN631kuPObHQIglMO0D+WqCEc
	pWGYWez658APbxgv8fXWYYXe41LhClBwS74F3BF0VWh6GtztUH+r1ZDHHdqXsGMisCwLLPjv9W8
	kBw==
X-Google-Smtp-Source: AGHT+IGePVRa5c41YQYZ/2B1kylc5GX/RflEeqWBX0hcc0fLez3e7u4p1eY6s1aZVrZhJaHTwFshVQ==
X-Received: by 2002:a5d:5f8d:0:b0:3a4:d9d3:b7cc with SMTP id ffacd0b85a97d-3b5de03575cmr4975600f8f.28.1752055792512;
        Wed, 09 Jul 2025 03:09:52 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:d3be:a88a:dbb9:f905])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032997sm18342105e9.7.2025.07.09.03.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 03:09:52 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 09 Jul 2025 12:08:55 +0200
Subject: [PATCH v2 3/6] clk: qcom: videocc-sm8550: Add separate frequency
 tables for X1E80100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-x1e-videocc-v2-3-ad1acf5674b4@linaro.org>
References: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
In-Reply-To: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

X1E80100 videocc is identical to the one in SM8550, aside from slightly
different recommended PLL frequencies. Add the separate frequency tables
for that and apply them if the qcom,x1e80100-videocc compatible is used.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/Kconfig          |  2 +-
 drivers/clk/qcom/videocc-sm8550.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 26752bd79f508612347ce79fd3693359d4dd656d..53bbdbe0725bd1b37ecd4c6b15b0d31676d9f548 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1394,7 +1394,7 @@ config SM_VIDEOCC_8550
 	select QCOM_GDSC
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.
-	  SM8550 or SM8650 devices.
+	  SM8550 or SM8650 or X1E80100 devices.
 	  Say Y if you want to support video devices and functionality such as
 	  video encode/decode.
 
diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
index 3e5891b43ee404edc6c99bbf8f2583cb44df9e37..32a6505abe265472de4059c4a048f731fdbf1dfe 100644
--- a/drivers/clk/qcom/videocc-sm8550.c
+++ b/drivers/clk/qcom/videocc-sm8550.c
@@ -145,6 +145,16 @@ static const struct freq_tbl ftbl_video_cc_mvs0_clk_src_sm8650[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src_x1e80100[] = {
+	F(576000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(720000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1014000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1098000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1443000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 video_cc_mvs0_clk_src = {
 	.cmd_rcgr = 0x8000,
 	.mnd_width = 0,
@@ -177,6 +187,15 @@ static const struct freq_tbl ftbl_video_cc_mvs1_clk_src_sm8650[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_video_cc_mvs1_clk_src_x1e80100[] = {
+	F(840000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1050000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1350000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1500000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1650000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 video_cc_mvs1_clk_src = {
 	.cmd_rcgr = 0x8018,
 	.mnd_width = 0,
@@ -559,12 +578,22 @@ static const struct qcom_cc_desc video_cc_sm8550_desc = {
 static const struct of_device_id video_cc_sm8550_match_table[] = {
 	{ .compatible = "qcom,sm8550-videocc" },
 	{ .compatible = "qcom,sm8650-videocc" },
+	{ .compatible = "qcom,x1e80100-videocc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, video_cc_sm8550_match_table);
 
 static int video_cc_sm8550_probe(struct platform_device *pdev)
 {
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,x1e80100-videocc")) {
+		video_cc_pll0_config.l = 0x1e;
+		video_cc_pll0_config.alpha = 0x0000;
+		video_cc_pll1_config.l = 0x2b;
+		video_cc_pll1_config.alpha = 0xc000;
+		video_cc_mvs0_clk_src.freq_tbl = ftbl_video_cc_mvs0_clk_src_x1e80100;
+		video_cc_mvs1_clk_src.freq_tbl = ftbl_video_cc_mvs1_clk_src_x1e80100;
+	}
+
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8650-videocc")) {
 		video_cc_pll0_config.l = 0x1e;
 		video_cc_pll0_config.alpha = 0xa000;

-- 
2.49.0

