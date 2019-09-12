Return-Path: <SRS0=F2l5=XH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE67C4CEC7
	for <linux-clk@archiver.kernel.org>; Thu, 12 Sep 2019 14:15:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 332CB214AE
	for <linux-clk@archiver.kernel.org>; Thu, 12 Sep 2019 14:15:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P+ZBQtY8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732580AbfILOPq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Sep 2019 10:15:46 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43521 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732571AbfILOPp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Sep 2019 10:15:45 -0400
Received: by mail-wr1-f67.google.com with SMTP id q17so23956721wrx.10
        for <linux-clk@vger.kernel.org>; Thu, 12 Sep 2019 07:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n4HuXOecJ8CldO3Qcv/+iPcaR05KtaOHoI08UvS2vkA=;
        b=P+ZBQtY8IAzNGPcyXB0igxUncNFGMCWwMBp9abZV+Jm5F+30LQOPBeppdSvnj0ygqm
         hrS8LCbc8eJXsTvZ1EDprLEJhHN8zQchzIrOTywH921iwg+b8Zd57BPryK42xPtGP1tD
         BSxXYfkq4yxzMb3SqyYpz0yimALHuxtr1ZWK+fR02j/xCqh0L5dI9qxGNH2ydy39OEEY
         SJbI7PaGH2wanzx8FloCIpgmk+wTxnzV1+aJm0I9huFHiwf6m1NeO2rU+24OcbRrS9Bl
         vp6Q/plLCc2O6pf3mQj/LdU+bb/kXx4srClG/b8ynaDNK4EFzAaGX0eNWeUUKEG7wLJF
         oWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n4HuXOecJ8CldO3Qcv/+iPcaR05KtaOHoI08UvS2vkA=;
        b=peMzDe5nYF+vKMMAH1bbEM2VgqvfYrsHbQD6HLbb3siXe1F1ZJ2jtcsMz1q2A37ZyS
         mxyTUJ7ivKPhCnG7xaE7Gw6R6p2LGchcpN4fO1j60Ej3fgGh2BnIkhz0hXSZe/OJB8CF
         btbSbT757LCt3S6t5T58oSyah5Jih9z1I04n1vePIViiCxZYe2PdV7kPvujwmxoyc4al
         lDTBixGAZ8F+efj0+SxImycJaAU02FWJK6pDP2bNlFscLFAUZwEcFbgMCmRjg4CX67//
         aVLdWjHarq9DDWVNSQ/jpjlivZvez4Xgtve6HKXf+3GnN0olbSFjeydpDdnLzcGn+K4s
         d8AA==
X-Gm-Message-State: APjAAAWC2iYXeaCuQ/tVmXfPAjIdg/iwC0dWB0W81toCNwNU2hRBsstT
        S8mfT+OqIFKwL2+ghntcRB4KBg==
X-Google-Smtp-Source: APXvYqyih+Sy3DwbxhQMt84jV1sr/5rvW4oqW++DujL7wzkF2wJQBkpZxnK2AsrisCkUHIFZcHVIlQ==
X-Received: by 2002:a05:6000:1101:: with SMTP id z1mr30889258wrw.332.1568297743762;
        Thu, 12 Sep 2019 07:15:43 -0700 (PDT)
Received: from localhost.localdomain (69.red-83-35-113.dynamicip.rima-tde.net. [83.35.113.69])
        by smtp.gmail.com with ESMTPSA id p23sm137599wma.18.2019.09.12.07.15.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 12 Sep 2019 07:15:43 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        agross@kernel.org, mturquette@baylibre.com,
        bjorn.andersson@linaro.org
Cc:     niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] clk: qcom: hfpll: CLK_IGNORE_UNUSED
Date:   Thu, 12 Sep 2019 16:15:32 +0200
Message-Id: <20190912141534.28870-4-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190912141534.28870-1-jorge.ramirez-ortiz@linaro.org>
References: <20190912141534.28870-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When COMMON_CLK_DISABLED_UNUSED is set, in an effort to save power and
to keep the software model of the clock in line with reality, the
framework transverses the clock tree and disables those clocks that
were enabled by the firmware but have not been enabled by any device
driver.

If CPUFREQ is enabled, early during the system boot, it might attempt
to change the CPU frequency ("set_rate"). If the HFPLL is selected as
a provider, it will then change the rate for this clock.

As boot continues, clk_disable_unused_subtree will run. Since it wont
find a valid counter (enable_count) for a clock that is actually
enabled it will attempt to disable it which will cause the CPU to
stop. Notice that in this driver, calls to check whether the clock is
enabled are routed via the is_enabled callback which queries the
hardware.

The following commit, rather than marking the clock critical and
forcing the clock to be always enabled, addresses the above scenario
making sure the clock is not disabled but it continues to rely on the
firmware to enable the clock.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/hfpll.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
index e64c0fd82fe4..225c675f6779 100644
--- a/drivers/clk/qcom/hfpll.c
+++ b/drivers/clk/qcom/hfpll.c
@@ -56,6 +56,13 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
 		.parent_names = (const char *[]){ "xo" },
 		.num_parents = 1,
 		.ops = &clk_ops_hfpll,
+		/*
+		 * rather than marking the clock critical and forcing the clock
+		 * to be always enabled, we make sure that the clock is not
+		 * disabled: the firmware remains responsible of enabling this
+		 * clock (for more info check the commit log)
+		 */
+		.flags = CLK_IGNORE_UNUSED,
 	};
 	int ret;
 
-- 
2.23.0

