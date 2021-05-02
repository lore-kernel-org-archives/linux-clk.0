Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6894C433ED
	for <linux-clk@archiver.kernel.org>; Sun,  2 May 2021 12:20:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEB616134F
	for <linux-clk@archiver.kernel.org>; Sun,  2 May 2021 12:20:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbhEBMVn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 May 2021 08:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbhEBMVm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 May 2021 08:21:42 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2197C061343
        for <linux-clk@vger.kernel.org>; Sun,  2 May 2021 05:20:50 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id w3so3826589ejc.4
        for <linux-clk@vger.kernel.org>; Sun, 02 May 2021 05:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fsvE6WtMIKMdgchel4AwZbyPodFOn787PJi5Em1/sIU=;
        b=b6uyzwIqE/5gAw4uTRy7Lk+AHHUw4it3l+zWdboAjKsDf6/3ROvE3AMBy3qVIgYy1y
         qEsqFM/zI1gK8dc279V4PERd8TskJy6cs2IsRoW1e1DE5gGlhVeEkHRTxd0s2Mg0OECt
         eoz9URkSDAuLOid4gJ2vSduTY4SQ0hFnboBHvKAnGoIlCf4Tv7eGeokv/2GWechIM2Gy
         VfQamtu9bc4RiT9LQ+0ztn6/GjBO2Qd/4PDYKsG5UpoWCMeJQeVpf6kbiZFW+DH8uPjE
         k5Ejf8o2+btvm3TS6KF2DuzDfHRYEu1QcPSnEYXN6+IYejEhzLDYx0sr8i1dnAN4YhiB
         EZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fsvE6WtMIKMdgchel4AwZbyPodFOn787PJi5Em1/sIU=;
        b=tqG4DgtT+Y0Ik67DG5mGLGd0bCK8QK9FWgG1m0UfLfw1grFzGxyFR8ypaNPsnNw2K9
         VstkdajUovXWvsredqcnyQ62NknyP2KylofJJZanpos7hgci32SSBq3dghya8AamKf3S
         x1PrwjlxH68IF6OSs16WXSTkPEOeDphIOSydI9x0f5Z2HEX/69b4HHhjaoN+pWd1f04t
         5DQpdihCPI2+D8zICcRX/x1Gv+l+6EClNfwf0HbAFyZ+FR0dkuwc73FGGaeckzo+OACG
         H4iyH253eTEIor/7rU8OAYNbFJs1ByixPqzhqDrXQ5J130aG0ntGMu+5JXxoAxWrbNwJ
         s3Pw==
X-Gm-Message-State: AOAM533XnfgJnm7uoWUBXlP9Q7OW1D7h3Vz2VI7PsDtvIi0gUUaPi5De
        rNaLuO7kfnW+KHJf2+rhy0KQeK4PIOsyTrMq
X-Google-Smtp-Source: ABdhPJwI3BtPLCf/2LScXjOjr1q3ID5iBq8yyFRYna9IQEs33/TuZVWGiC+fYR6G9uJM6parQx0AeQ==
X-Received: by 2002:a17:907:3e27:: with SMTP id hp39mr12611354ejc.373.1619958049372;
        Sun, 02 May 2021 05:20:49 -0700 (PDT)
Received: from PackardBell (192038133011.mbb.telenor.dk. [192.38.133.11])
        by smtp.googlemail.com with ESMTPSA id b8sm9866238edu.41.2021.05.02.05.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 05:20:49 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id acc05d90;
        Sun, 2 May 2021 12:20:32 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH 3/4] dt-bindings: clock: qcom: rpmcc: Document MSM8226 compatible
Date:   Sun,  2 May 2021 14:20:26 +0200
Message-Id: <20210502122027.9351-4-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502122027.9351-1-bartosz.dudziak@snejp.pl>
References: <20210502122027.9351-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the dt-binding for the RPM Clock Controller on the MSM8226 SoC.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index b44a0622fb..6cf5a7ec2b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -12,6 +12,7 @@ Required properties :
 
 			"qcom,rpmcc-msm8660", "qcom,rpmcc"
 			"qcom,rpmcc-apq8060", "qcom,rpmcc"
+			"qcom,rpmcc-msm8226", "qcom,rpmcc"
 			"qcom,rpmcc-msm8916", "qcom,rpmcc"
 			"qcom,rpmcc-msm8936", "qcom,rpmcc"
 			"qcom,rpmcc-msm8974", "qcom,rpmcc"
-- 
2.25.1

