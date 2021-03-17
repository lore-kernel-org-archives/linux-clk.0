Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511FFC4160E
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 14:41:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2986864F75
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 14:41:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232288AbhCQOlC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Mar 2021 10:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbhCQOkw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 10:40:52 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56963C06175F
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 07:40:52 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id k9so3297162lfo.12
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 07:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VZ0geH6BqMBlmbQ30iyES93D0PKaLEePFxddTMOy9xQ=;
        b=no1y5QTnePloWF6Kf5NJI+KW4hcc8iSa7md8U/h+236ztkxrCWmLM76BfogRg1Ve16
         ic8UeNY3CQvCIj7LBtJihb+1OVqWASBOHdzCyKDLDy2js/EZ90sO55MK70CNPfwgfQ0a
         L2Ye9KT0n0j0ihVSz+W9IqJqF/4X+TVYMGXigMPr7xBd603Q3UKwoLSy1ZnSjHuDVLX3
         wB6Ft/pYSwnaePxzAXT2IVJjEc4Pd7OaiabwwFxAGW3m7GcKKh/1U4ti1HXk8/Lz0stZ
         FzhGd5BZYHT9Drn7Av/GitUBhlueIZEfh1k7Yi53NqZX4V+p+Ljn4mSKTUE5WiRPZfgn
         zoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VZ0geH6BqMBlmbQ30iyES93D0PKaLEePFxddTMOy9xQ=;
        b=qZ2DLlH5xlhwVDBSa451QHhHgOjyzdzwhghYcbVX5BhvqyyLiQQ7ZlmucvNA0ksdPJ
         dWrryshIZMJ3mYsb4B4Van2QD2rDEXQ3C2tMvX8EeADy+iIucWhDKbyu9QtwI6Uc6Ue7
         KhCYfr/+hJjZPI286nNyp4DRfEdkgp5Ywb5plsnlRgs2Pl8WrXuCf5srYkq4GjMxJxMu
         iLVhTxOB+IcgiS9xW3NbxMk9DOQB/u+PZcbghSJm4hBMWHip5Ippsv/krqu5EKXaJrZQ
         0dySZvCvF7Y7Xi8Fd0dcEtOSjLtrBNug0Nj2zoRTn0tJaCnBr06UUcLc7SdcenoFPJd/
         BfJA==
X-Gm-Message-State: AOAM533dYVafR8pQIgKbVTBFt8DCUSeAvu8SdXEzQFmMwnFHWtxTXARp
        oMjtoB10ls0eFpoy9UuvUtsbqQ==
X-Google-Smtp-Source: ABdhPJw5jus2v3pxW594CEk+SrRrg9htGKBQ1CbmXj1XxLuT4EdAEgnqIByVfE0lXaRf41wydng6qw==
X-Received: by 2002:a19:44:: with SMTP id 65mr2673123lfa.104.1615992050905;
        Wed, 17 Mar 2021 07:40:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 07:40:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v1 09/26] arm64: dts: qcom: sm8250: assign DSI clock source parents
Date:   Wed, 17 Mar 2021 17:40:22 +0300
Message-Id: <20210317144039.556409-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
References: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 947e1accae3a..b6ed94497e8a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2445,6 +2445,9 @@ dsi0: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
@@ -2512,6 +2515,9 @@ dsi1: dsi@ae96000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
-- 
2.30.2

