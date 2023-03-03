Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1481FC6FA8E
	for <linux-clk@archiver.kernel.org>; Fri,  3 Mar 2023 02:29:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjCCC3W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Mar 2023 21:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjCCC3V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Mar 2023 21:29:21 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3BD1CAEF
        for <linux-clk@vger.kernel.org>; Thu,  2 Mar 2023 18:29:17 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id t11so1849029lfr.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Mar 2023 18:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677810556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UvP5dlba1SnOnrJzjTH6Yl38TduqMTlOKCpl48T8jEQ=;
        b=OkKBIYGskI8jazmVLYRtLg4JtLcn8LoNaZlhg21xJqeazztJtRcpDjcwxXIVRBzDMJ
         qVCYtAoWfpl3MelFjQ2BelyxK6gP7TJ0bt7wIbSujs3aY6gx+rWfM53j3heQjBCqNmLK
         ZuiWG/8iRy9LYvrnYRJ8GABZm/FxSJecb7xVnaSWfykUSvFwofcsx3GUp543UcUjnlxz
         smVMKoxdN2NFs+xRFgqFHmI78MFDo8baw5uWKy1GzidOyi51IOQzwZBToKtiRi65+XuN
         R0Do2HpONuIgURYRGjdyqjFqPdnylHnDvHrsDzd68+GaoU1HZGRdXl8NUmHSQJ2FswsH
         umeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677810556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvP5dlba1SnOnrJzjTH6Yl38TduqMTlOKCpl48T8jEQ=;
        b=S5Jku4+LPx1PJmEcxEWH1GWzXy9JzG/3tRw10Giq1fnK4ziTMSVyZej6y3qIq5KZyL
         fCea+39Fd4/PWL/htBqAL5KbzVVN9NFvTwR1NDBQvAKoqq4v4Flh7rOMkOAh7E0kK+TO
         Wa2gj6r0n7u1TLMCY87DKQy5OYun4JbaZE2lc4ZQJ6qmnYabzQNQwOIdSoVKXO8lV+h3
         7ogE0eAXoRihWCNURmN9zEzR59LbnhzmCLMHCRDpr9EzSWvgnD8x5zgZZI+FYvrUETfA
         rL+TyJT9e9FE/h2ginFey5cocAsFyVIbnEE+NxF9HNjkwNXI61bcr5CTroLOargfiiKQ
         ZBOg==
X-Gm-Message-State: AO0yUKWkmIph4XbdPqgVyPjHDjOOmIOfjaTK+0W61WNhsqDJmjxYb4cz
        uzR+g/nTv0xQFfJb+Z4VWId6qg==
X-Google-Smtp-Source: AK7set9JjiCFK0hySnnZzBVLri4plc02xY98zNDdSOnD3TbrIu5/e83yF/+vv9n6WeSh3X3fvvczNw==
X-Received: by 2002:a05:6512:21d:b0:4c6:4ff7:ba04 with SMTP id a29-20020a056512021d00b004c64ff7ba04mr104917lfo.2.1677810556189;
        Thu, 02 Mar 2023 18:29:16 -0800 (PST)
Received: from localhost.localdomain (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id p10-20020ac246ca000000b004cb1135953fsm175574lfo.240.2023.03.02.18.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 18:29:15 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: gcc-sm6375: Update the .pwrsts for usb gdsc
Date:   Fri,  3 Mar 2023 03:29:11 +0100
Message-Id: <20230303022912.2171177-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The USB controller on sm6375 doesn't retain its state when the system
goes into low power state and the GDSCs are turned off.

This can be observed by the USB connection not coming back alive after
putting the device into suspend, essentially breaking USB.

Fix this by updating the .pwrsts for the USB GDSCs so they only
transition to retention state in low power.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sm6375.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
index ad3c4833990d..93164670fbe1 100644
--- a/drivers/clk/qcom/gcc-sm6375.c
+++ b/drivers/clk/qcom/gcc-sm6375.c
@@ -3534,7 +3534,7 @@ static struct gdsc usb30_prim_gdsc = {
 	.pd = {
 		.name = "usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 };
 
 static struct gdsc ufs_phy_gdsc = {
-- 
2.39.2

