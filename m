Return-Path: <SRS0=wiT5=RJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 893E5C10F00
	for <linux-clk@archiver.kernel.org>; Wed,  6 Mar 2019 17:47:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5F8E720661
	for <linux-clk@archiver.kernel.org>; Wed,  6 Mar 2019 17:47:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m9c5xwPs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730542AbfCFRrO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Mar 2019 12:47:14 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38263 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbfCFRrN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Mar 2019 12:47:13 -0500
Received: by mail-pf1-f193.google.com with SMTP id n125so9180802pfn.5
        for <linux-clk@vger.kernel.org>; Wed, 06 Mar 2019 09:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wIDuHEQWfSGozqoJvBxHadpJ6Vo2hH3jLM6+B+AQsyw=;
        b=m9c5xwPsupNm+5WKr/xik3yQYkk684eFAEHpfPYj+fJ4wY5U00YBJ1ZgdIapAtUWWq
         tIqDYAqxVO+iuUYOiEnUAhkeKG4FC+hiiRUP1H6XMCOZjG7QcFyBJaiOrBpFXEcqa6Ox
         zn2iimma6tx4siCRfuV8/YIU/CmEp4BLUaEolK4IRT3HmK8FOluBW/E77EAf4YCL2YD9
         hlGrgRNgFg/SvY9j8o1Tx5n2QnXeS+pmvDxjxAxkxOOGkn6js0FrOUd2xPRcoHZM1T1r
         oSqGH27WZKUOF3NlIRvuVaN70rlxmAj0IV7JcH1C/hwjLrhmQfquLVFdnYhxVpgtJVZA
         r6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wIDuHEQWfSGozqoJvBxHadpJ6Vo2hH3jLM6+B+AQsyw=;
        b=DOgvTWDgwqzv70DPQ3crscVDCVWEEGA845W4QBrnbiAdS8blRzxE8OjRyYaGC47aLl
         eIKXPBvQZ6ZjGj+/w9FIhhacEtHzGdZvZPkF+nErWkUOspQqZMU6VjK+qcGvWzZYI+wG
         8KmogIZjnxAMBtcbOMMNpFx2C96DFd9DsRPkMy0f6viL1DJ8TQLn14mouN9i+s/KzCRi
         BT4aa3gunyslMKnn9KP1bi9HNfXZ5xLaV82Jc2D596pTuMAXg4ZBN99DQ/eHzrHMMHUF
         GXpWwBYFIbUPysUISEJlpfaqBVau7kgf8NLF6hG7V5FrTKSbIpKkJtg+FMdPY2oFHcdD
         3zXQ==
X-Gm-Message-State: APjAAAW9QSUo48O3bSVKGPz1p0zR1fJDKmgasLcE90v01OQrF7Tum/ll
        8l9cyKTEndEV9tOTm5bXd1J69Q==
X-Google-Smtp-Source: APXvYqz8MQI+57gbd4zxGupvAhLXk3KOkqf2tRVq/TAunyHqBfXgiU0B1rdL+64pc0N4ezLNKz7pSA==
X-Received: by 2002:aa7:8299:: with SMTP id s25mr8435662pfm.56.1551894432472;
        Wed, 06 Mar 2019 09:47:12 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h64sm4098293pfj.40.2019.03.06.09.47.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Mar 2019 09:47:11 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: clock: Introduce Qualcomm Turing Clock controller
Date:   Wed,  6 Mar 2019 09:47:56 -0800
Message-Id: <20190306174758.22462-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190306174758.22462-1-bjorn.andersson@linaro.org>
References: <20190306174758.22462-1-bjorn.andersson@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add devicetree binding for the turing clock controller found in QCS404.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../bindings/clock/qcom,turingcc.txt          | 19 +++++++++++++++++++
 .../dt-bindings/clock/qcom,turingcc-qcs404.h  | 15 +++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,turingcc.txt
 create mode 100644 include/dt-bindings/clock/qcom,turingcc-qcs404.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,turingcc.txt b/Documentation/devicetree/bindings/clock/qcom,turingcc.txt
new file mode 100644
index 000000000000..126517de5f9a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,turingcc.txt
@@ -0,0 +1,19 @@
+Qualcomm Turing Clock & Reset Controller Binding
+------------------------------------------------
+
+Required properties :
+- compatible: shall contain "qcom,qcs404-turingcc".
+- reg: shall contain base register location and length.
+- clocks: ahb clock for the TuringCC
+- #clock-cells: from common clock binding, shall contain 1.
+- #reset-cells: from common reset binding, shall contain 1.
+
+Example:
+	turingcc: clock-controller@800000 {
+		compatible = "qcom,qcs404-turingcc";
+		reg = <0x00800000 0x30000>;
+		clocks = <&gcc GCC_CDSP_CFG_AHB_CLK>;
+
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
diff --git a/include/dt-bindings/clock/qcom,turingcc-qcs404.h b/include/dt-bindings/clock/qcom,turingcc-qcs404.h
new file mode 100644
index 000000000000..838faef57c67
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,turingcc-qcs404.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019, Linaro Ltd
+ */
+
+#ifndef _DT_BINDINGS_CLK_TURING_QCS404_H
+#define _DT_BINDINGS_CLK_TURING_QCS404_H
+
+#define TURING_Q6SS_Q6_AXIM_CLK		0
+#define TURING_Q6SS_AHBM_AON_CLK	1
+#define TURING_WRAPPER_AON_CLK		2
+#define TURING_Q6SS_AHBS_AON_CLK	3
+#define TURING_WRAPPER_QOS_AHBS_AON_CLK	4
+
+#endif
-- 
2.18.0

