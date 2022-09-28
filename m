Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED271C04A95
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 13:31:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233378AbiI1NbW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 09:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233039AbiI1NbV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 09:31:21 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4DE1A1D70
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 06:31:19 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a26so27191693ejc.4
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 06:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=n3qQR+aqK3MBkpPhhE7yG0JzICbbOFyRcGevTT/H8DY=;
        b=MVeVzTtAnaZhe+EoVGaEnkpifnw/hFsnyVLN58MUI492PeZ58ECotTixHYDryoIQys
         22MSjzFXpNbc1k11Kg2gvhhGDfJTw09+oD5vaM+h2mlpSm1vvGTKIKlid4s5jqhKWGQp
         v3miQP7Cbf5oXutuuQBo27dxTIL7HWjlw5KvBMeyt+qsEoS9hICqhvxxR/RBc7VPIFlA
         Igo27gSvRFshssr2bdp0DMbJ1hS8V3R7XLYGvSusgCyH6EVoWi5A+nF8mavYal9YT3SB
         VjlSj/P8u7x45vl4S3k659wLSvFqYg2bSMEW5ne6pT7LHP+wH+RB1aQWh91EsH92B7Oc
         N4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=n3qQR+aqK3MBkpPhhE7yG0JzICbbOFyRcGevTT/H8DY=;
        b=jUWUZWdE6vZHt3Y0uNm+LfP8NdXPBPWNUwMGSGwE2UMjNNV5CyV/bEu9uTRW6iRnRJ
         GKBptcDFf5GBy/7fcK64jq71bvm2AwVetKLuBT7v3lmhaKbD5N89Lc5kOdRvw78/bPfM
         0WoiMbbAcgWP3BLvWT5TE04ztzTVU71bK2M0myMdAgt8R43oly07loOnoUmbhgaCdMwu
         P4c8ki+6f4mZzNKq0TskVEYt81HjEKcmLWV7b2pXdyCWi8y82o+CSfCXH8D6GOTQa+Uv
         5UBvzsgJ6ArR4q4OLPryfqm2ZqvzdsEenFeb5+u8zeriq5FqClgn/nGGNDW19IR6g3f/
         RRwg==
X-Gm-Message-State: ACrzQf3AQfn4IV18VlA0tOr9CV6ufxgAcX0VA7nnsPB5m+P8S62krAPE
        C+ZiTcwjlbohUkxv5GhOae2OeQ==
X-Google-Smtp-Source: AMsMyM6cihZ44FvcUe0BRre7FY4VoB3qwNPZoBjybGrc2Xnj5NprI+bSfV7OA1i9lnIJidtBUAxA9Q==
X-Received: by 2002:a17:907:72c4:b0:783:4fe0:daca with SMTP id du4-20020a17090772c400b007834fe0dacamr14835994ejc.455.1664371878293;
        Wed, 28 Sep 2022 06:31:18 -0700 (PDT)
Received: from otso.. (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id q1-20020a50cc81000000b00457618d3409sm3366096edi.68.2022.09.28.06.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 06:31:17 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-sm6350: Update the .pwrsts for usb gdscs
Date:   Wed, 28 Sep 2022 15:28:54 +0200
Message-Id: <20220928132853.179425-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The USB controllers on sm6350 do not retain the state when
the system goes into low power state and the GDSCs are
turned off.

This can be observed by the USB connection not coming back alive after
putting the device into suspend, essentially breaking USB.

Fix this by updating the .pwrsts for the USB GDSCs so they only
transition to retention state in low power.

Cc: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Similar to sc7180 & sc7280 patches that have been applied recently:
https://lore.kernel.org/linux-arm-msm/20220927170516.zrkzn3xl7oedzi4l@builder.lan/T/

@Rajendra Nayak: Maybe you know a bit more about the internals of
sm6350&sm7225. As described in the commit message USB just stops working
after suspend, with this it comes back after wakeup from suspend and
continues working. If any details in the commit message are somehow
wrong or I can add something, please let me know!
Thanks for fixing this on sc7180&sc7280!

 drivers/clk/qcom/gcc-sm6350.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
index 69412400efa4..9b4e4bb05963 100644
--- a/drivers/clk/qcom/gcc-sm6350.c
+++ b/drivers/clk/qcom/gcc-sm6350.c
@@ -2316,7 +2316,7 @@ static struct gdsc usb30_prim_gdsc = {
 	.pd = {
 		.name = "usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 };
 
 static struct gdsc ufs_phy_gdsc = {
-- 
2.37.3

