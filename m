Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F444C433B4
	for <linux-clk@archiver.kernel.org>; Sun, 25 Apr 2021 07:08:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EE4C61480
	for <linux-clk@archiver.kernel.org>; Sun, 25 Apr 2021 07:08:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbhDYHJ1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Apr 2021 03:09:27 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:32312 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbhDYHJ1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Apr 2021 03:09:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619334527; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=niPyJpAZpR71QDB+qwRPU8SYtCcTw1VHp+nM0K9chAQ=; b=XsuaWqWKfe2J4BJh/OhGelj8XLk9ZixNBXQWAciyEkgKE6IiCh6sQtWgqKdP1zoeg6seQq6V
 Y+28fAOyTK00+68Gp8L4PyE3v4Uedfj49gu1h7LE2yugZj4qQlPww9DnE5VIyHgiNwdqxn3/
 zMiaz0QmYnzMM231lLzxU0ZTXN0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 608515782cc44d3aea6e458b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 25 Apr 2021 07:08:40
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B4D2FC433D3; Sun, 25 Apr 2021 07:08:39 +0000 (UTC)
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BFF6CC433D3;
        Sun, 25 Apr 2021 07:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BFF6CC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3] Add support for duty-cycle for RCG
Date:   Sun, 25 Apr 2021 12:38:21 +0530
Message-Id: <1619334502-9880-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The root clock generators with MND divider has the capability to support
change in duty-cycle by updating the 'D'. Add the clock ops which would
check all the boundary conditions and enable setting the desired duty-cycle
as per the consumer.

[v3]
  * Implement clockops for get_duty_cycle.
  * Return -EINVAL for Non-MND or HID RCGs.

Taniya Das (1):
  clk: qcom: clk-rcg2: Add support for duty-cycle for RCG

 drivers/clk/qcom/clk-rcg2.c | 81 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

