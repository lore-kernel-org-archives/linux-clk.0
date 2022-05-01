Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196B2C4321E
	for <linux-clk@archiver.kernel.org>; Sun,  1 May 2022 10:36:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344750AbiEAKjO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 1 May 2022 06:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345460AbiEAKjC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 1 May 2022 06:39:02 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE04F07
        for <linux-clk@vger.kernel.org>; Sun,  1 May 2022 03:35:35 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id p18so13688916edr.7
        for <linux-clk@vger.kernel.org>; Sun, 01 May 2022 03:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rC1RBfaaxLYiq5iDakFFR3OcWxeEK5RtgKrD6YK+e+w=;
        b=KkTptCIVR37GTgVLSobIw/FK+uwlmuXtDgiLycnNG2JlYGOwLQPoDSnRhqBvzz+6SS
         R9l/gbqlMYdym5zI9lGWG6p2FXtpGD5Qonk7lLky4Z4sNSQ3j9ySpMwUMJ6ydyxig2rD
         hQdo1eoDH52wcHVDanEtNk/2nupfnX1tFlut9LIktJNRtzZqA4rKDuNIlCjJR1G2wrCw
         m1pLFg4bM/+Nei6QG7BdMlCKbbXukaUgNeGxzdW4KmES5dVikXiQp0Ilv8H5VX5Jvd8h
         Bdj8JBWCU9KmeyPNLea5DGGlhNvpyA4BayrrlJeDXr1aipkwQ92fCWOX2LokVFwsTW72
         Pabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rC1RBfaaxLYiq5iDakFFR3OcWxeEK5RtgKrD6YK+e+w=;
        b=T2FGZfkHZNYANgehhHuzw9TvqMOgTxv/SR5UOgXDlv0SofHqhoTZ1F0HuCPTRY/3FE
         sC5NnvbGhZuIhNTuujubtMhYZC83KL6Ebku5MncrjD1DJVA9yqu/sKBFGm22tbgVu39f
         5YFPN6/5gCUPS2CjCQazTU5i/5w7nS1d5ya2e4b4HHHn3QCci+2gPcmwu3l8nCIAZtc5
         HrqNlb6IkJaZF9jlYVwNT3CDimO7tikIBVUr27oLIet4NkFb98uf3vv2EXoiqI2Gx+9C
         eeLhD1cvL755uhf3ZDU4TPY8ogwidMSHoqRJpFNB6fHzOuOXYwO7O9NAZ/pSrRpel6/Q
         pfEg==
X-Gm-Message-State: AOAM533f+hOmVkdQc9+eOXZ6pvRtl38XtehcS6PvZ8mfTdpq83DmMUNa
        +g9G4H8K08GJfveLNV9VX9gHrJdV0p1sIA==
X-Google-Smtp-Source: ABdhPJzPxoWEYsPQoFqVn0Mn6T9T5bfRt2FN5RA/30mw3XraPQgHBZwCu2LbyVfL7i1/k4t2uEGHEw==
X-Received: by 2002:a05:6402:909:b0:416:6f3c:5c1d with SMTP id g9-20020a056402090900b004166f3c5c1dmr8069640edz.108.1651401333801;
        Sun, 01 May 2022 03:35:33 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id zp1-20020a17090684e100b006f3ef214df1sm2464438ejb.87.2022.05.01.03.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 03:35:33 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 6/8] rpmsg: qcom: correct kerneldoc
Date:   Sun,  1 May 2022 12:35:18 +0200
Message-Id: <20220501103520.111561-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
References: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Correct kerneldoc warnings like:

  drivers/rpmsg/qcom_glink_ssr.c:45:
    warning: expecting prototype for G(). Prototype was for GLINK_SSR_DO_CLEANUP() instead

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/rpmsg/qcom_glink_ssr.c | 2 +-
 drivers/rpmsg/qcom_smd.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_ssr.c b/drivers/rpmsg/qcom_glink_ssr.c
index dea929c6045d..776d64446879 100644
--- a/drivers/rpmsg/qcom_glink_ssr.c
+++ b/drivers/rpmsg/qcom_glink_ssr.c
@@ -39,7 +39,7 @@ struct cleanup_done_msg {
 	__le32 seq_num;
 };
 
-/**
+/*
  * G-Link SSR protocol commands
  */
 #define GLINK_SSR_DO_CLEANUP	0
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 7c8c29f6c91d..e7e49d972d36 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -729,7 +729,7 @@ static int qcom_smd_write_fifo(struct qcom_smd_channel *channel,
 }
 
 /**
- * qcom_smd_send - write data to smd channel
+ * __qcom_smd_send - write data to smd channel
  * @channel:	channel handle
  * @data:	buffer of data to write
  * @len:	number of bytes to write
-- 
2.32.0

