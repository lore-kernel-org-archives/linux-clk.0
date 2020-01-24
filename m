Return-Path: <SRS0=IRPH=3N=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D526FC35243
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jan 2020 22:43:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A93F12075D
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jan 2020 22:43:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jShQ2pX8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387458AbgAXWno (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jan 2020 17:43:44 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45452 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387444AbgAXWnX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jan 2020 17:43:23 -0500
Received: by mail-pf1-f193.google.com with SMTP id 2so1780222pfg.12
        for <linux-clk@vger.kernel.org>; Fri, 24 Jan 2020 14:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9BRqMxL/+QF9fXGxsodaUnU1nURwqkQVRb7Veb8jqnw=;
        b=jShQ2pX8IQIHGNrvrIOhAsqUK/C01VqaM9/g6/e7k6X2Xc4duWVu1GLO4DYADKLj8h
         DB1G4XhIeSlzDcjW5h0qV2Ri0rmkCIl/+sDXQ/FYpddk2u405IOAnDMRnaomXKuXhIYv
         rlfKquY9Gm+95wPB7AhitjDpdpTbpS0Fl/u1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9BRqMxL/+QF9fXGxsodaUnU1nURwqkQVRb7Veb8jqnw=;
        b=ImSkwOUyjYF+NzeaoxgaTnHaJqPs4aFuJo1wws3aCGz12SCn0ke5mjgzQ64FMrWXgh
         dhq3zFnPPaK3evsNYq+B5WWvz76JG9gCw9qehZbv0DHV1Xlu1OorS9KDscTTG75GUXEX
         ogZSxC00111UzdZjq9pDBThvgbjNiYNU3w0l8XyoOPhcBcol8yAgf0hOEJBrVZ9t8nii
         AtAZBg7ShevsE3Ocasai26GVsbxTkJOHCP+oXGUGim8Brb17XhSb6J4hF/u7iizYv6rx
         h1IgVV8lTQMIirHhCwA4+khphaSnfCD30/qVlDevlvdd2ix8dH6xhKpDr49Gl9yAaKTm
         2Wlg==
X-Gm-Message-State: APjAAAWq9gPRlD7VNg9q4jd7D4pen9RSKt40oDRLMil3GlaVEpM7n5GC
        YrAKPNHWA9wOiiYqo/kdMb7oBA==
X-Google-Smtp-Source: APXvYqwyIr9Hzf7MUy0r0DgFSN19tETtctZT8PEgdV9N562GI+cGiutgSkgp4ilXhVm9KOMG0sXfvw==
X-Received: by 2002:aa7:928b:: with SMTP id j11mr5412125pfa.176.1579905802569;
        Fri, 24 Jan 2020 14:43:22 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id o2sm7690948pjo.26.2020.01.24.14.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 14:43:21 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        mka@chromium.org, kalyan_t@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        hoegsberg@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 06/10] arm64: dts: qcom: sdm845: Add the missing clocks on the gpucc
Date:   Fri, 24 Jan 2020 14:42:21 -0800
Message-Id: <20200124144154.v2.6.If8596faf02408cef4bb9f52296b911eb9ba49287@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200124224225.22547-1-dianders@chromium.org>
References: <20200124224225.22547-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We're transitioning over to requiring the Qualcomm GPU Clock
Controller to specify all the input clocks.  Let's add them for
sdm845.

NOTE: Until the Linux driver for sdm845's gpucc is updated, these
clocks will not actually be used in Linux.  It will continue to use
global clock names to match things up.  Of course, Linux didn't use
the old "xo" clock anyway.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Patch ("arm64: dts: qcom: sdm845: Add...gpucc") new for v2.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 01354533a61b..e624c91dbd6d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1903,8 +1903,10 @@ gpucc: clock-controller@5090000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			clock-names = "xo", "gpll0", "gpll0_div";
 		};
 
 		stm@6002000 {
-- 
2.25.0.341.g760bfbb309-goog

