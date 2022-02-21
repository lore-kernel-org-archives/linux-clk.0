Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B56C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 21 Feb 2022 18:22:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbiBUSWv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Feb 2022 13:22:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbiBUSUo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Feb 2022 13:20:44 -0500
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id 4A471249
        for <linux-clk@vger.kernel.org>; Mon, 21 Feb 2022 10:13:39 -0800 (PST)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1645467219; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=BavoGLppRRtQuuh4NjhSW9ieNl8URHL9Ejf/Z4d/Xxk=; b=h1GlrSC9B9pa6OuvKASYN6hxKTwLRNgDiL9c5Uy89hpxxKphBSqrP3IdE5wjpYve0POm9Hiq
 nDMc0v6jpJrka1V8ZXUMEv78KLmNiVp6jfDkesHjn9aBlG1RufF8MyS1qKD8zYe388J1D7X5
 DufWuYLH7+15uUfEV+Ukt2HfDfw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6213d653d9f69c7276a3775c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Feb 2022 18:13:39
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DA27EC4360C; Mon, 21 Feb 2022 18:13:38 +0000 (UTC)
Received: from hu-tdas-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 834C0C4338F;
        Mon, 21 Feb 2022 18:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 834C0C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 2/2] clk: qcom: clk-rcg2: Update the frac table for pixel clock
Date:   Mon, 21 Feb 2022 23:43:22 +0530
Message-Id: <20220221181322.5486-2-tdas@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220221181322.5486-1-tdas@codeaurora.org>
References: <20220221181322.5486-1-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Support the new numerator and denominator for pixel clock.

Fixes: 99cbd064b059f ("clk: qcom: Support display RCG clocks")
Signed-off-by: Taniya Das <tdas@codeaurora.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/clk-rcg2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 3a78a2a16cf8..cb5610c46882 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -729,6 +729,7 @@ static const struct frac_entry frac_table_pixel[] = {
 	{ 2, 9 },
 	{ 4, 9 },
 	{ 1, 1 },
+	{ 2, 3 },
 	{ }
 };

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

