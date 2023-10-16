Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C7ECDB483
	for <linux-clk@archiver.kernel.org>; Mon, 16 Oct 2023 08:44:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbjJPIoI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Oct 2023 04:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232527AbjJPIoI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Oct 2023 04:44:08 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20DA9E5
        for <linux-clk@vger.kernel.org>; Mon, 16 Oct 2023 01:44:06 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so11046357a12.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Oct 2023 01:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697445844; x=1698050644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0rRmLP9fjkilMgxeFjtjmzdH7ixA8dxS/1mEKnbj6c=;
        b=iSq/vkjTALUFrY/gSMgmb6DrdO/bFrClUmM713ttq/AaV0MnrYUEjlzhOgdpv+dA54
         8n3BTlbhV0YWXsGi0lwL8AkxSz5Y0mI5cm4ubpddzJmOyVNpeb6oI7WItHl6i6yPJegl
         SjBnh7CDviyQROMx2/+Td9xFke7kHl3nljEnosLy3+Z+/PeDfXEhtS+mTrg/pnQaA2VS
         NtWQrOW+h5gF40qOVKqTMOqfLcNlQzh+H1eXaoCq46LJpVDLK7tBZ56YfheuQjK1IhCa
         baB8qfqPAtVkaQdlYtJMVwAQfD9xLGVEBGQZfaXUxr6ige+oV4r9iFwT5LCoAhYdUeVd
         EtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697445844; x=1698050644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0rRmLP9fjkilMgxeFjtjmzdH7ixA8dxS/1mEKnbj6c=;
        b=kdwKEEDg5zhUjw/6zRzI3qU+2UuIm7tHAVAN2gVYVmtq5iUifI4Cc1uKQS3w5MNOlq
         NwlI0fjb/Ezf9WgahdWDOoI+ezEdy+kNaeJPU3hOHfMhnlwRWAB0itmC+d3TC9VSPTgL
         bdZUl0vpO/TNw1dueY2zDL8tsC8cMJtLuuZ94aQv5HVDgk8D+IGlZI/huxe51oQp3STD
         nG4rNKWQNlFpyAbvBw4r5TdehcAD6HUtJ5m9lURdKLNf5qcfHoZebbQgcd5nEOpwS+/s
         vTNfjfXP/QvvhR6/kPceKP8Dt4SegFkQQbQzNwsZnFXZAaNOsv/7lyDoleFxpbPniR3T
         fJDw==
X-Gm-Message-State: AOJu0Yy0/zwVRU7+uY4Ca4QONuF0MgEQdDPIUCyXEwjg5KXrkeRplrdP
        ceD3wZIdkIDYNjKU1xlh7APlZ7JlHSicBkvjOjn7UgZV
X-Google-Smtp-Source: AGHT+IHrYWALOoBqZKJ1TG7otqxucdJ1/0uNs2khdKNAQS9zMidfhGYJpoelH+5hCyY6zCqV7rIH5w==
X-Received: by 2002:aa7:d4d5:0:b0:52e:3ce8:e333 with SMTP id t21-20020aa7d4d5000000b0052e3ce8e333mr6876446edr.18.1697445844516;
        Mon, 16 Oct 2023 01:44:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (i68975BB5.versanet.de. [104.151.91.181])
        by smtp.gmail.com with ESMTPSA id l18-20020a056402029200b0053443c8fd90sm15021814edv.24.2023.10.16.01.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 01:44:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: [PATCH 2/2] clk: qcom: videocc-sm8550: switch to clk_lucid_ole_pll_configure
Date:   Mon, 16 Oct 2023 11:43:56 +0300
Message-ID: <20231016084356.1301854-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016084356.1301854-1-dmitry.baryshkov@linaro.org>
References: <20231016084356.1301854-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Instead of manually specifying the RINGOSC_CAL_L and CAL_L values in the
alpha_pll_config.l field, use the proper clk_lucid_ole_pll_configure()
function to configure the PLL.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sm8550.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
index 3bb136ec31b1..f3c9dfaee968 100644
--- a/drivers/clk/qcom/videocc-sm8550.c
+++ b/drivers/clk/qcom/videocc-sm8550.c
@@ -36,8 +36,7 @@ static const struct pll_vco lucid_ole_vco[] = {
 };
 
 static const struct alpha_pll_config video_cc_pll0_config = {
-	/* .l includes RINGOSC_CAL_L_VAL, CAL_L_VAL, L_VAL fields */
-	.l = 0x44440025,
+	.l = 0x25,
 	.alpha = 0x8000,
 	.config_ctl_val = 0x20485699,
 	.config_ctl_hi_val = 0x00182261,
@@ -68,8 +67,7 @@ static struct clk_alpha_pll video_cc_pll0 = {
 };
 
 static const struct alpha_pll_config video_cc_pll1_config = {
-	/* .l includes RINGOSC_CAL_L_VAL, CAL_L_VAL, L_VAL fields */
-	.l = 0x44440036,
+	.l = 0x36,
 	.alpha = 0xb000,
 	.config_ctl_val = 0x20485699,
 	.config_ctl_hi_val = 0x00182261,
@@ -427,8 +425,8 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap);
 	}
 
-	clk_lucid_evo_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
-	clk_lucid_evo_pll_configure(&video_cc_pll1, regmap, &video_cc_pll1_config);
+	clk_lucid_ole_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
+	clk_lucid_ole_pll_configure(&video_cc_pll1, regmap, &video_cc_pll1_config);
 
 	/*
 	 * Keep clocks always enabled:
-- 
2.42.0

