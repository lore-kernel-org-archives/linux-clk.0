Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB59DC001DF
	for <linux-clk@archiver.kernel.org>; Fri,  4 Aug 2023 14:09:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbjHDOJn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Aug 2023 10:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbjHDOJm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Aug 2023 10:09:42 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D5CC139
        for <linux-clk@vger.kernel.org>; Fri,  4 Aug 2023 07:09:40 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99bccc9ec02so308897166b.2
        for <linux-clk@vger.kernel.org>; Fri, 04 Aug 2023 07:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1691158178; x=1691762978;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lJYYaTKtey3y+Pz5jtqG8m2sUM8QfqZdeIkGFwZW7AI=;
        b=ytQS9ilJGngjOx4zUsX+iZ5BR8SfUtQIMb+IvPQJFuDAyfEjKGQBDH5MOy5719P+1m
         bWoDpfIfWA/lKe2W9J11doI2F0EEzWU5LOcmz34lg4dvyXllzdxmH7V8pBknfGOztDjs
         Pz+xEsoaSCBYf9qeJlgf2WeG8bICMGp+zt1qmVSkJiBCmtPrnUexwlrFB94iNCteOaoZ
         mMr78Dvonb//OZOzOqhZlw6azTPN8CO6Yr35Uhhz7pqdmzshhqIaJ/4uueYTJ0gA7fUq
         tR9fAlACfHOjZHmCDYymfDRN1iGqoWAzvM+g1lpjwEk0XegLD6h8cTfOGwsKpzREsWWc
         oTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691158178; x=1691762978;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJYYaTKtey3y+Pz5jtqG8m2sUM8QfqZdeIkGFwZW7AI=;
        b=UaK6kctMk0kr2aNw4qpnK358HIl19Bgmy4DHIFPlzUWdMN+B4oIkmwJUQg50PJU9Gd
         lSWI4xSWDs7PHpX92cp7NXzoMQ/PUI1qFdH18QwMRvGCFDNGNlDQGnqPPPWDonZFykp5
         UwTCer59deKBAkb2qwc15Z4ud1cFjHThrJyb+Xk1F1I9UJC+80pHtICzwgqbdXIOOK3/
         n72B0no21XUxk1TTiuPzu2flNChkTChZeYRxP/93WCKtDMsR6UQsLMciqmrlDOBEwIuh
         y2opzD+hPBQzoNro3oeaVBwbrHazVrkM/J569x0hfI2o+8xgTlVk0jgZRdJX0xqSrpXa
         0ssQ==
X-Gm-Message-State: AOJu0Yw0YFAf+hwu4uohDlr0a9TW4DgGHzCXaKkZWT17kZi8zAWAxLYy
        AX7PkeXlPzZZyMAxQnpvr1qfIS/TAb+4pisuNUBTnA==
X-Google-Smtp-Source: AGHT+IE699YJCjVVMQ7Rm/VlK3NqzIiAfSaTnWHMOiZ+PGgPu3gCxJcNnPlDcybNKeB4NaCwq9M6CA==
X-Received: by 2002:a17:907:7638:b0:99b:cf57:11e3 with SMTP id jy24-20020a170907763800b0099bcf5711e3mr1501607ejc.59.1691158178378;
        Fri, 04 Aug 2023 07:09:38 -0700 (PDT)
Received: from [172.16.240.113] ([144.178.202.138])
        by smtp.gmail.com with ESMTPSA id k14-20020a170906158e00b00982d0563b11sm1350160ejd.197.2023.08.04.07.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 07:09:38 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 04 Aug 2023 16:09:30 +0200
Subject: [PATCH] clk: qcom: gcc-sm6350: Fix gcc_sdcc2_apps_clk_src
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230804-sm6350-sdcc2-v1-1-3d946927d37d@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAJkGzWQC/x3MMQqAMAxA0atIZgtpqyJeRRxKEzWDVRoQQXp3i
 +Mb/n9BOQsrTM0LmW9ROVOFbRuIe0gbG6FqcOg8jtgZPQbfo1GK0Rka+0iENgxsoSZX5lWefzc
 vpXzA9fv6XgAAAA==
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

GPLL7 is not on by default, which causes a "gcc_sdcc2_apps_clk_src: rcg
didn't update its configuration" error when booting. Set .flags =
CLK_OPS_PARENT_ENABLE to fix the error.

Fixes: 131abae905df ("clk: qcom: Add SM6350 GCC driver")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
As with sm8250[0], we need the same fix for sm6350 as we have the same
warning on boot. With this patch the warning disappears.

[0] https://lore.kernel.org/linux-arm-msm/20230802210359.408-1-patrick.whewell@sightlineapplications.com/
---
 drivers/clk/qcom/gcc-sm6350.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
index 9b4e4bb05963..cf4a7b6e0b23 100644
--- a/drivers/clk/qcom/gcc-sm6350.c
+++ b/drivers/clk/qcom/gcc-sm6350.c
@@ -641,6 +641,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parent_data_8,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_floor_ops,
 	},
 };

---
base-commit: fb4327106e5250ee360d0d8b056c1eef7eeb9a98
change-id: 20230804-sm6350-sdcc2-d85cdd01a6e1

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

