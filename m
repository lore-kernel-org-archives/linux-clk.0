Return-Path: <SRS0=uYlR=DU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B428DC433E7
	for <linux-clk@archiver.kernel.org>; Tue, 13 Oct 2020 18:34:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46A6120BED
	for <linux-clk@archiver.kernel.org>; Tue, 13 Oct 2020 18:34:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="EOJchwXf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387823AbgJMSeD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Oct 2020 14:34:03 -0400
Received: from z5.mailgun.us ([104.130.96.5]:31867 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387721AbgJMSeC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Oct 2020 14:34:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602614042; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=oTD8LpKKCnV46OI+BNWHfk3f2QO90nyAuysPw1Q1aCE=; b=EOJchwXfRUa0Zvr14V7G9+FNIZCgta82pQUYm9+rJKTzeKNdO/LY5enPAIATjRoclMyqrjTg
 zQuYv2oyOA0PgewlxK0COTFTB3WBCuouP8e/quoQOMXI9ZHw4smSCqGPdoD6swzlbfjnt1jx
 IwQMcUioK5dT/hpmroBxVkIuZLo=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f85f304ef891f1ee2e0620b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Oct 2020 18:33:40
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EF159C43385; Tue, 13 Oct 2020 18:33:39 +0000 (UTC)
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AC5FEC433F1;
        Tue, 13 Oct 2020 18:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AC5FEC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v0] LPASSCC: Configure the PLL in case lost for SC7180
Date:   Wed, 14 Oct 2020 00:03:27 +0530
Message-Id: <1602614008-2421-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In the case where the LPASSCC PLL loses the PLL configuration it would fail
to lock. Thus allow reconfigure the PLL from pm_resume.

Taniya Das (1):
  clk: qcom: lpasscc: Re-configure the PLL in case lost

 drivers/clk/qcom/lpasscorecc-sc7180.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

