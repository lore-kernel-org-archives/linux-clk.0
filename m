Return-Path: <SRS0=dRGr=B3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155A3C433E1
	for <linux-clk@archiver.kernel.org>; Mon, 17 Aug 2020 14:21:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE0DB20786
	for <linux-clk@archiver.kernel.org>; Mon, 17 Aug 2020 14:21:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="QmLj9uA9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgHQOVT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Aug 2020 10:21:19 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:22833 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728465AbgHQOVT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Aug 2020 10:21:19 -0400
X-Greylist: delayed 541 seconds by postgrey-1.27 at vger.kernel.org; Mon, 17 Aug 2020 10:21:18 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597674077;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=96QQ8PNl0xmiHcHVIu3R5ojOtvOFdSRuSRXLHkBwY8Y=;
        b=QmLj9uA9bsPhVOcXCDtY2GlyEXwvd5F8USISOjtD1pXNwlKqr9X3MJIe2o0BnRAPzc
        ZY8NsfzNWyHDCIAOiKDdIRMM7oiHJlTSFjF6hT/0U0S+p8BAKnJgKWA+TdyAJBYZ1mXw
        rFUevfg+YhriOCttyd+SvdoDkiLhmIhyI8R779GnED8SVtMZj8Xg0R5M6L2rZwS0PBUH
        BuycckhqQUUr5R0to/oJlpfkht403GtrUfitk2mgbYKbnCP/qkIc9x2fA2KHdzWfA/cx
        L2JUIm73XhmmEjslvDOubrWF8DYeKE4aYXw7wtWmNT6VmomrjL0gD089mTrhR5II1gv8
        85UQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB526O1+69"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id Y0939ew7HE9MH9j
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 17 Aug 2020 16:09:22 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>,
        Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH] clk: qcom: smd: Disable unused clocks
Date:   Mon, 17 Aug 2020 16:09:08 +0200
Message-Id: <20200817140908.185976-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

At the moment, clk-smd-rpm forces all clocks on at probe time
(for "handoff"). However, it does not make the clk core aware of that.
This means that the clocks stay enabled forever if they are not used
by anything.

We can easily disable them again after bootup has been completed,
by making the clk core aware of the state. This is implemented by
returning the current state of the clock in is_prepared().

Checking the SPMI clock registers reveals that this allows the RPM
to disable unused BB/RF clocks. For example, on MSM8916 with all
remote processors (except RPM) disabled, we get:

 +--------------------------+------------+---------+--------+-------+
 |                          | BOOTLOADER | HANDOFF | BEFORE | AFTER |
 +--------------------------+------------+---------+--------+-------+
 | BB_CLK1_STATUS1 (0x5108) |     ON*    |    ON   |   ON   |  ON*  |
 | BB_CLK2_STATUS1 (0x5208) |     OFF    |    ON   |   ON   |  OFF  |
 | RF_CLK1_STATUS1 (0x5408) |     OFF    |    ON   |   ON   |  OFF  |
 | RF_CLK2_STATUS1 (0x5508) |     OFF    |    ON   |   ON   |  OFF  |
 +--------------------------+------------+---------+--------+-------+
  * BB_CLK1 seems to be always-on in RPM on MSM8916

where:
  - BOOTLOADER = clk-smd-rpm disabled entirely in device tree
  - HANDOFF = temporarily after clk-smd-rpm was probed
  - BEFORE/AFTER = after boot without/with the changes in this commit

With this commit BB_CLK2/RF_CLK1/RF_CLK2 are disabled again when unused.

Cc: Georgi Djakov <georgi.djakov@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Originally I reported this here:
https://lore.kernel.org/linux-arm-msm/20200523120810.GA166540@gerhold.net/

Overall I'm not entirely sure why we need to force all these clocks
on at all... But the downstream driver also seems to do it and the RPM
interface is barely documented, so I didn't feel comfortable changing it...
---
 drivers/clk/qcom/clk-smd-rpm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 0e1dfa89489e..fa960cb794a8 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -171,6 +171,9 @@ static int clk_smd_rpm_handoff(struct clk_smd_rpm *r)
 	if (ret)
 		return ret;
 
+	/* During handoff we force all clocks on */
+	r->enabled = true;
+
 	return 0;
 }
 
@@ -300,6 +303,13 @@ static void clk_smd_rpm_unprepare(struct clk_hw *hw)
 	mutex_unlock(&rpm_smd_clk_lock);
 }
 
+static int clk_smd_rpm_is_prepared(struct clk_hw *hw)
+{
+	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
+
+	return r->enabled;
+}
+
 static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long parent_rate)
 {
@@ -396,6 +406,7 @@ static int clk_smd_rpm_enable_scaling(struct qcom_smd_rpm *rpm)
 static const struct clk_ops clk_smd_rpm_ops = {
 	.prepare	= clk_smd_rpm_prepare,
 	.unprepare	= clk_smd_rpm_unprepare,
+	.is_prepared	= clk_smd_rpm_is_prepared,
 	.set_rate	= clk_smd_rpm_set_rate,
 	.round_rate	= clk_smd_rpm_round_rate,
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
@@ -404,6 +415,7 @@ static const struct clk_ops clk_smd_rpm_ops = {
 static const struct clk_ops clk_smd_rpm_branch_ops = {
 	.prepare	= clk_smd_rpm_prepare,
 	.unprepare	= clk_smd_rpm_unprepare,
+	.is_prepared	= clk_smd_rpm_is_prepared,
 };
 
 /* msm8916 */
-- 
2.28.0

