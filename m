Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12DD9EB64DC
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jul 2023 13:29:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbjGRN3t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jul 2023 09:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbjGRN3s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jul 2023 09:29:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7397718B;
        Tue, 18 Jul 2023 06:29:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DB5EE61590;
        Tue, 18 Jul 2023 13:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32200C433C9;
        Tue, 18 Jul 2023 13:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689686984;
        bh=N3aIV0HWnuZiVpn6L5619rqDbPKqzDyiTGe7jMrlJmg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eb67WvZVbUDKKXvNg8xrcPA1bvauGIrL1qVV2wxncF79Tb8COtj2LDoqR7L9tjFY6
         ox4hP48+hR4SyzWRk7MjqsvsmWX8aPBshAsa7540VaDowt9BzUht8qIrKESuFNFbgH
         ODv2xiya1OBwOPkzId5Mfm2/gFa4jP7CaOIekCtPisbCNwotScXhg+Znf+ktPANDZs
         /msa63RSXPcU6n21urC30BizHBDpPdJJAjfemLK3u5/Yzuiohp4YKe/9ikpuM0Ga11
         d+gzVR1+M0DCe26yooKPt1LP//yVYrjQYVodi0oJstv5ni21JrXcMKHM+RbjQCSTQn
         42Dae3aGtZAAQ==
Received: from johan by xi.lan with local (Exim 4.96)
        (envelope-from <johan+linaro@kernel.org>)
        id 1qLkm1-0005by-2T;
        Tue, 18 Jul 2023 15:29:53 +0200
From:   Johan Hovold <johan+linaro@kernel.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>, stable@vger.kernel.org
Subject: [PATCH 1/8] clk: qcom: camcc-sc7180: fix async resume during probe
Date:   Tue, 18 Jul 2023 15:28:55 +0200
Message-ID: <20230718132902.21430-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718132902.21430-1-johan+linaro@kernel.org>
References: <20230718132902.21430-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

To make sure that the controller is runtime resumed and its power domain
is enabled before accessing its registers during probe, the synchronous
runtime PM interface must be used.

Fixes: 8d4025943e13 ("clk: qcom: camcc-sc7180: Use runtime PM ops instead of clk ones")
Cc: stable@vger.kernel.org      # 5.11
Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/clk/qcom/camcc-sc7180.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
index 8a4ba7a19ed1..6f56bdbf0204 100644
--- a/drivers/clk/qcom/camcc-sc7180.c
+++ b/drivers/clk/qcom/camcc-sc7180.c
@@ -1664,7 +1664,7 @@ static int cam_cc_sc7180_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = pm_runtime_get(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret)
 		return ret;
 
-- 
2.41.0

