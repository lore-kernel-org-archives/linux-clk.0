Return-Path: <SRS0=IRPH=3N=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63BDC32771
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jan 2020 22:43:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BAC9C2087E
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jan 2020 22:43:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H5M3q6aW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387422AbgAXWnU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jan 2020 17:43:20 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42475 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387408AbgAXWnT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jan 2020 17:43:19 -0500
Received: by mail-pf1-f194.google.com with SMTP id 4so1787694pfz.9
        for <linux-clk@vger.kernel.org>; Fri, 24 Jan 2020 14:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LCy4d/uPw5BLn8Wtp8APLodtLD4pO2HOn2Pu/h6vPEQ=;
        b=H5M3q6aWRWGz+DPDkuDKKDp9JmGrdLbld1dKDiQUVp3fn2wQvRevBwkem3NygaawT/
         eRqCOrI1rSecV50Rs2vF8UXdyTv1JEJ7vAaCBQYa2uM9shXTNvrJdFW2lmTnxJhaDWot
         dLWxiqt3t4KkiP56kPl5Abs3KcMMZPahXAbfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LCy4d/uPw5BLn8Wtp8APLodtLD4pO2HOn2Pu/h6vPEQ=;
        b=DSFjjMHx7U9rKMeIXABCDEgE06JmnsLr7odwQlhdBRtcRVDjENiZOf+2hUDl1jvtyA
         UXcvWUdNWO0jOiqMmT5PI31nAXLvLamULpUofZsn/XNvW2d94A4ugKGXOBwxsbWSqy1r
         xqpM9isV+tCk8RDlZOs5ZEM46ZsgWZBRNotV5G0W6WOJz9mFaQVcwbs2G15qrNN2JKQe
         lSPRreZym7uyd2XWvRZBU2JdXcgbptM6Ld/GpneuCwHCKAne06twGCycr3wwEpboVcpo
         bWGwwW85DeAmD3FQEjYIMmBMGUXqBaTVtobISapPHGn9aPPewDG4ZHEqBrbe0lLfDIXQ
         1Q/g==
X-Gm-Message-State: APjAAAXY+4VEefJgy6BFpp+t/Ko2vPpn5F/E+CD3gmvVEyYcqM6sugxC
        X8x7P7bJAKMP/eJl61F9AcYkiA==
X-Google-Smtp-Source: APXvYqwqOj229OreenHXwJi4oidfVVbTHzeOfUUBBvLdizzGOX34wX6hYI9c93bqiOm2N75XvR3FNg==
X-Received: by 2002:a63:5818:: with SMTP id m24mr6680605pgb.358.1579905799008;
        Fri, 24 Jan 2020 14:43:19 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id o2sm7690948pjo.26.2020.01.24.14.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 14:43:18 -0800 (PST)
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
Subject: [PATCH v2 03/10] arm64: dts: qcom: sdm845: Add the missing clocks on the dispcc
Date:   Fri, 24 Jan 2020 14:42:18 -0800
Message-Id: <20200124144154.v2.3.Ie80fa74e1774f4317d80d70d30ef4b78f16cc8df@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200124224225.22547-1-dianders@chromium.org>
References: <20200124224225.22547-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We're transitioning over to requiring the Qualcomm Display Clock
Controller to specify all the input clocks.  Let's add them for
sdm845.

NOTES:
- Until the Linux driver for sdm845's dispcc is updated, these clocks
  will not actually be used in Linux.  It will continue to use global
  clock names to match things up.
- Although the clocks from the DP PHY are required, the DP PHY isn't
  represented in the dts yet.  Apparently the magic for this is just
  to use <0>.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Patch ("arm64: dts: qcom: sdm845: Add...dispcc") new for v2.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index d42302b8889b..01354533a61b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2933,6 +2933,18 @@ opp-200000000 {
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,sdm845-dispcc";
 			reg = <0 0x0af00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+				 <&dsi0_phy 0>,
+				 <&dsi0_phy 1>,
+				 <&dsi1_phy 0>,
+				 <&dsi1_phy 1>,
+				 <0>,
+				 <0>;
+			clock-names = "xo", "gpll0",
+				      "dsi0_phy_pll_byte", "dsi0_phy_pll_pixel",
+				      "dsi1_phy_pll_byte", "dsi1_phy_pll_pixel",
+				      "dp_phy_pll_link", "dp_phy_pll_vco_div";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.25.0.341.g760bfbb309-goog

