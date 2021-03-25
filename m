Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF7CC433EB
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:13:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95A9F61A32
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:13:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhCYLMb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 07:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbhCYLLz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 07:11:55 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2DDC06174A
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:54 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id v15so1915542lfq.5
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e7cDGwvCK159I/9FSrY1M64d33eVbPn2loBLKSHFDao=;
        b=jtseuONb9QFK3RlyU9bxTU25y2S9tzvUWMk6sEmJ+6y2MP+UDkYn4AxEhHlqyM9xko
         BvkwVSDwBRof9OZR/ROGGnSM12wFsfUxlfcI2kwK8eRtiz+CA2TCT6j6Zr/EpFsLe/7E
         vCGgnI08ilMXuQV+XuiUfHgeS87zLiaWk+us3QrQlMwYEFWs4ZfLVYyKQFNBme1LvYJc
         9NxcxVWtbJaj47DESnTdQOgfmUVJ4i65OixHz0Ly8k5J/qzsY0RKbjy1MPWv2fs3N9VF
         oWilh0vad5HIu/kitv3/LCJKjfGbKMSP18nmJinVL9t1WnMLQlWhkBK6kjS0kmWpAwQ6
         uohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e7cDGwvCK159I/9FSrY1M64d33eVbPn2loBLKSHFDao=;
        b=LPURkfEFAnVOhx0661G5rUyxxGTOeQTP3QKOKPjrkfVHcjOmxNmWvAHErXhtu2oPVQ
         lttHPaCBQqfir5DlnDEry6p59oj8bMzVoV8Lfsv6XtjIeGLdNtyPH64m8Fdm4DzbcaAU
         JR1TXTsu1WBw1Pj4eUiBF9lSVNkqouoJjQLA2izxHnti7L8wQIObfekYIPwMQwyqFTT9
         +xbVaGBP4Fkdnl0YI51gbK8QI4eGCHCyts7ML1Jb72GVdbCUM64MZepF7tnct6AOTUCo
         0H6tsvZkSrWrna2vNvMLdjqWFuOl5YGNcESRlLfdEYEMEsEPihDrzopnizUhya8duyZr
         qCGg==
X-Gm-Message-State: AOAM532oToVGrcXhwj5tELugyVKbiQLGW6xmCS6fis1RHtVdcbS8B8o1
        oEOQholb45KxUbfaYcjh3riv6w==
X-Google-Smtp-Source: ABdhPJwC4SUa7MA1gu7EPCykjjAuH890xuFSk8HvGIrmFw6MMRTxhOPlda6jst48IlBmcrFi2ebB8Q==
X-Received: by 2002:ac2:5444:: with SMTP id d4mr4914650lfn.126.1616670713126;
        Thu, 25 Mar 2021 04:11:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 08/15] clk: qcom: videocc-sm8250: drop unused enum entries
Date:   Thu, 25 Mar 2021 14:11:37 +0300
Message-Id: <20210325111144.2852594-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop unused enum entries from the list of parent enums.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index b0efadc19634..06a8a2c98deb 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -21,8 +21,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CHIP_SLEEP_CLK,
-	P_CORE_BI_PLL_TEST_SE,
 	P_VIDEO_PLL0_OUT_MAIN,
 	P_VIDEO_PLL1_OUT_MAIN,
 };
-- 
2.30.2

