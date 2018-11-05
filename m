Return-Path: <SRS0=vj01=NQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C33C0044C
	for <linux-clk@archiver.kernel.org>; Mon,  5 Nov 2018 19:41:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 87D2120685
	for <linux-clk@archiver.kernel.org>; Mon,  5 Nov 2018 19:41:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T8eSztBh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87D2120685
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbeKFFB3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Nov 2018 00:01:29 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38527 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbeKFFB2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Nov 2018 00:01:28 -0500
Received: by mail-pl1-f196.google.com with SMTP id p4-v6so2550762plo.5
        for <linux-clk@vger.kernel.org>; Mon, 05 Nov 2018 11:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YXYamjpF54xPI4xprjmDSNKifg3b2CSoDvPVO1+NKHw=;
        b=T8eSztBh3tK92GEomtjwPwnFqQIo8ELCfddp4DE7oOc8pqedXR61DAlPlHPBDtEeoq
         PsRBbgLBs7J8bL9q0N/qoYseN4XGSPUvHloxF7vZvGavxGszbFokcRZGy8/5BZ/Qd59z
         vTzTb6Sn/Q8vKWxtMVh0fFGhwsQmT9WqzaR8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YXYamjpF54xPI4xprjmDSNKifg3b2CSoDvPVO1+NKHw=;
        b=ow/q0um4JlVfIcWy2t1Gy0Ly2RK/hUHSgZI/0R0nj30+VHrRd6XCRaK0UoFMOiHZ1F
         v99Nh6gWSOG3dObFh4o6CHjOyoMI4Pu6nki6f91bLem2PGvR38D5U+T+SmctAOubAsiI
         O0YU+QDS9D8gz0supw75KYqwPecmfOvYyKBBmIuCH7+yMkjmEj8jz4DVfMxgZVoGcY3a
         YuDNbUlxM5QfQlEnqUAXT+PfZTCN519arfvSzcmb3je8BeS34Zsq/U358TY25BpwRUGT
         a99E3SN/FqTIbMODz75oClj9PJKaZMKWuy1KGXmuf/tpqKZyA2Tvs4cKOTeS6Lh2ZFHm
         pTzQ==
X-Gm-Message-State: AGRZ1gJwCKVT7ynLTofx144PzHA6AKlZraW8d6d8ubL4jBlMIDj7Cooc
        bhPXbQ9TzZSDN43WHSf2J3DJB+cRz+Y=
X-Google-Smtp-Source: AJdET5cj0j7v5OtsgSRptBWwCiht9C8Arc1XOuMdP3efF4vqzYCkYl8YpJN7P1QU4wqYF82gcjZaAg==
X-Received: by 2002:a17:902:4083:: with SMTP id c3-v6mr23548669pld.181.1541446815360;
        Mon, 05 Nov 2018 11:40:15 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:1:fed3:9637:a13a:6c15])
        by smtp.gmail.com with ESMTPSA id q25sm700728pgb.2.2018.11.05.11.40.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Nov 2018 11:40:14 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH 1/2] dt-bindings: clk: Introduce 'protected-clocks' property
Date:   Mon,  5 Nov 2018 11:40:10 -0800
Message-Id: <20181105194011.43770-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.19.1.930.g4563a0d9d0-goog
In-Reply-To: <20181105194011.43770-1-swboyd@chromium.org>
References: <20181105194011.43770-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a generic clk property for clks which are not intended to be used by
the OS due to security restrictions put in place by firmware. For
example, on some Qualcomm firmwares reading or writing certain clk
registers causes the entire system to reboot, but on other firmwares
reading and writing those same registers is required to make devices
like QSPI work. Rather than adding one-off properties each time a new
set of clks appears to be protected, let's add a generic clk property to
describe any set of clks that shouldn't be touched by the OS. This way
we never need to register the clks or use them in certain firmware
configurations.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../devicetree/bindings/clock/clock-bindings.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
index 2ec489eebe72..b646bbcf7f92 100644
--- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
+++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -168,3 +168,19 @@ a shared clock is forbidden.
 
 Configuration of common clocks, which affect multiple consumer devices can
 be similarly specified in the clock provider node.
+
+==Protected clocks==
+
+Some platforms or firmwares may not fully expose all the clocks to the OS, such
+as in situations where those clks are used by drivers running in ARM secure
+execution levels. Such a configuration can be specified in device tree with the
+protected-clocks property in the form of a clock specifier list. This property should
+only be specified in the node that is providing the clocks being protected:
+
+   clock-controller@a000f000 {
+        compatible = "vendor,clk95;
+        reg = <0xa000f000 0x1000>
+        #clocks-cells = <1>;
+        ...
+        protected-clocks = <UART3_CLK>, <SPI5_CLK>;
+   };
-- 
Sent by a computer through tubes

