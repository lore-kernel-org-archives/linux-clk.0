Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70616C433E4
	for <linux-clk@archiver.kernel.org>; Fri, 26 Mar 2021 14:59:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54CCD61A44
	for <linux-clk@archiver.kernel.org>; Fri, 26 Mar 2021 14:59:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhCZO7F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Mar 2021 10:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbhCZO6w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Mar 2021 10:58:52 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48DECC0613B4
        for <linux-clk@vger.kernel.org>; Fri, 26 Mar 2021 07:58:52 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id y1so7689518ljm.10
        for <linux-clk@vger.kernel.org>; Fri, 26 Mar 2021 07:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=py+qMxCtB0tXumIyMaImIWCtQAbDaCSrR1VHRXcWfkQ=;
        b=piz+EhCdGgs+W4DM3BI/Pi3mRABk97mFyQhFgwGFbdvF9IIxDetQLG3lOw8pZfoIXE
         wIe06Oxdis5Nais2txoCu4kq+ga8hqEOw5wxJJ1Wt2hN8caFUSUrdQZ1kEzW2bNkiYDC
         z6pAjINg87Im+W6qUA6xHJJOO47Vttyz5b+sIq3GVjbswLEvDZB2EQQkdOvfmoPwmj1g
         3xZT22k3oQCUeR7rtuxYGkcdqGSFMviCY34KoZXE6KZBCdB7FeIkS6YLR/2o7SgkU4PC
         uJsQBdWU+yCxZW87S4tLGnKnlbjmhjkCT7H/6aL9XyO9+SOruvtM0yTDfrvS8GShgTE3
         vKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=py+qMxCtB0tXumIyMaImIWCtQAbDaCSrR1VHRXcWfkQ=;
        b=UDomLhwiUUlZGQZGtjWn4FgJv97aUBVnGMtdTFzwDTBOnJ3V5FcsUcbAECZXtdkw6z
         /JARCInpqxrVXB6X+KvHC/KI01ov/jv/TDiXtbG1z8zEeTh9/f4nnCkavmUvC8w4xJGg
         dgJEb5t4VhlNbGqSPz1KcGcyRGlNKduRe3BYsAHk63Vz4JpL/qnfa5L3NhTbU7BoNj/b
         jTaQe6TqKugI3lR+088pgEy+Yf9YKsTyq7iPv1egx8b/Tsk2ccS2hvXaNhPGPW86i/GD
         IZ7o3neG4FMZOT2pxBGBrNywwXvU5Z7NK/x3NPWtBwGVYS+itn34UXWDsvL9OCvaRQbT
         IPZQ==
X-Gm-Message-State: AOAM530z0NPVyMizmx9hfDfdWBVAjxS3WMAoHKAFguZvkhqEUCmgTsqq
        LzzB+i+w1ivL6ZPvR/QTbxUclQ==
X-Google-Smtp-Source: ABdhPJxTF6yb7fhM87ddnw9AISQEpIwe0//jTtPtigKlnVyJT45kkcVBneq4DQ8QOGXTUfIaEkK6SA==
X-Received: by 2002:a2e:3206:: with SMTP id y6mr8972663ljy.208.1616770730696;
        Fri, 26 Mar 2021 07:58:50 -0700 (PDT)
Received: from PackardBell ([82.160.139.10])
        by smtp.googlemail.com with ESMTPSA id k2sm893382lfm.174.2021.03.26.07.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:58:50 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id b8e0cdc9;
        Fri, 26 Mar 2021 14:58:48 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH 1/5] dt-bindings: clock: qcom: Add MSM8226 GCC clock bindings
Date:   Fri, 26 Mar 2021 15:58:12 +0100
Message-Id: <20210326145816.9758-2-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326145816.9758-1-bartosz.dudziak@snejp.pl>
References: <20210326145816.9758-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add compatible device strings and the include files for the MSM8226 GCC.
Also add missing includes for MSM8916 and MSM8960 SoCs.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 .../devicetree/bindings/clock/qcom,gcc.yaml         | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
index ee0467fb5e..1f609b40c2 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
@@ -22,12 +22,16 @@ description: |
   - dt-bindings/reset/qcom,gcc-ipq6018.h
   - dt-bindings/clock/qcom,gcc-ipq806x.h (qcom,gcc-ipq8064)
   - dt-bindings/reset/qcom,gcc-ipq806x.h (qcom,gcc-ipq8064)
-  - dt-bindings/clock/qcom,gcc-msm8939.h
-  - dt-bindings/reset/qcom,gcc-msm8939.h
   - dt-bindings/clock/qcom,gcc-msm8660.h
   - dt-bindings/reset/qcom,gcc-msm8660.h
-  - dt-bindings/clock/qcom,gcc-msm8974.h
-  - dt-bindings/reset/qcom,gcc-msm8974.h
+  - dt-bindings/clock/qcom,gcc-msm8916.h
+  - dt-bindings/reset/qcom,gcc-msm8916.h
+  - dt-bindings/clock/qcom,gcc-msm8939.h
+  - dt-bindings/reset/qcom,gcc-msm8939.h
+  - dt-bindings/clock/qcom,gcc-msm8960.h
+  - dt-bindings/reset/qcom,gcc-msm8960.h
+  - dt-bindings/clock/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
+  - dt-bindings/reset/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
   - dt-bindings/clock/qcom,gcc-msm8994.h
   - dt-bindings/clock/qcom,gcc-mdm9615.h
   - dt-bindings/reset/qcom,gcc-mdm9615.h
@@ -41,6 +45,7 @@ properties:
       - qcom,gcc-ipq4019
       - qcom,gcc-ipq6018
       - qcom,gcc-ipq8064
+      - qcom,gcc-msm8226
       - qcom,gcc-msm8660
       - qcom,gcc-msm8916
       - qcom,gcc-msm8939
-- 
2.25.1

