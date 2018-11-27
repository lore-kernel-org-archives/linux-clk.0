Return-Path: <SRS0=WhJS=OG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6108FC43441
	for <linux-clk@archiver.kernel.org>; Tue, 27 Nov 2018 19:24:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 22C2520645
	for <linux-clk@archiver.kernel.org>; Tue, 27 Nov 2018 19:24:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W4Xnc0SA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22C2520645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbeK1GXr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Nov 2018 01:23:47 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33545 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbeK1GXr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Nov 2018 01:23:47 -0500
Received: by mail-pl1-f193.google.com with SMTP id z23so16095090plo.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Nov 2018 11:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g/OwqtmgRAMd4U0V7CJeRYYW1Xv+UBnENuWIkRgDFsI=;
        b=W4Xnc0SALXHsz9j4ByrOWWy847eCAQ6Wd2A84EDRsWc7ccN1/IT4QDaNoKSMM0TDJa
         R+Mg65g8yCPFXcGXoa6IlbEwhL4/q7NUCCY2vfgBJZAl+rRoGp59qH6KwlDM28gUYEHK
         gwApdT7YOjXtHZ3iCv75nd+PnNU8xhwDwErA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g/OwqtmgRAMd4U0V7CJeRYYW1Xv+UBnENuWIkRgDFsI=;
        b=G+Q+nZPnJAgiBNZgIQZHEA63P/BecfG++udEPx8lggRrSlvA7K5JmmcKn60/EoaY6s
         MMpGwBDs4eT3aJYwEQKQe4CVd6ayy+0IVCazdKUZygWGGj4gm3mCbbrYMfwg1VTmP20r
         ZjyHKHyYU1XagQeZBJHM1trqlQ4I6xUskj8SE4iz5UV+kNQyGg82YXFRB5PC1KUlG7+8
         IntWOiE7u7L/aa63RtOdDhON8LUztN4tYEz9Q7xP6dIfT91cCVhuuETqbp5oGN0bnIbY
         hRRirtEJGhzkiYIRo8//UgQZQjDQJ+49OWW6KraXThxwvCRH+IAYyY51M1i1wqv4h7oP
         JucA==
X-Gm-Message-State: AA+aEWa0VX1h0cWrRRN5CF/sFp5rVvaHJhkEz1ZrVTnwnoiBWhLYS2QQ
        enJ5ztMZcJD66Q2ZQ5tKGqlA6A==
X-Google-Smtp-Source: AFSGD/Xjp/XKfkBczfxJMIw5g2S8f8QQZtyqrvf/+O9/QAWxHFzXJV+OGoclwbuglCmki3KhqcR6Ow==
X-Received: by 2002:a17:902:b701:: with SMTP id d1-v6mr32075209pls.29.1543346692646;
        Tue, 27 Nov 2018 11:24:52 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:c8e0:70d7:4be7:a36])
        by smtp.gmail.com with ESMTPSA id i189-v6sm5543091pfc.16.2018.11.27.11.24.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Nov 2018 11:24:51 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Require #reset-cells in sdm845-videocc
Date:   Tue, 27 Nov 2018 11:24:43 -0800
Message-Id: <20181127192443.136158-1-dianders@chromium.org>
X-Mailer: git-send-email 2.20.0.rc0.387.gc7a69e6b6c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The #reset-cells was listed as optional in the bindings for
qcom,sdm845-videocc.  There's no reason for it to be optional.  As per
Stephen [1]:

> We should update the binding to make it a required property. It
> doesn't make any sense why that property would be optional given
> that the hardware either has support for resets or it doesn't.

sdm845 support is still in its infancy so we shouldn't be affecting
any real device trees by modifying the bindings here.

[1] https://lkml.kernel.org/r/154330186815.88331.12720647562079303842@swboyd.mtv.corp.google.com

Fixes: 84b66b211603 ("dt-bindings: clock: Introduce QCOM Video clock bindings")
Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/clock/qcom,videocc.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.txt b/Documentation/devicetree/bindings/clock/qcom,videocc.txt
index e7c035afa778..8a8622c65c5a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.txt
@@ -6,8 +6,6 @@ Required properties :
 - reg : shall contain base register location and length
 - #clock-cells : from common clock binding, shall contain 1.
 - #power-domain-cells : from generic power domain binding, shall contain 1.
-
-Optional properties :
 - #reset-cells : from common reset binding, shall contain 1.
 
 Example:
@@ -16,4 +14,5 @@ Example:
 		reg = <0xab00000 0x10000>;
 		#clock-cells = <1>;
 		#power-domain-cells = <1>;
+		#reset-cells = <1>;
 	};
-- 
2.20.0.rc0.387.gc7a69e6b6c-goog

