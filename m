Return-Path: <SRS0=KPyc=2V=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94427C2D0DC
	for <linux-clk@archiver.kernel.org>; Tue, 31 Dec 2019 11:01:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5CDDB206E4
	for <linux-clk@archiver.kernel.org>; Tue, 31 Dec 2019 11:01:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="Of+72ES+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfLaLBD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Dec 2019 06:01:03 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:24334 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726658AbfLaLBD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Dec 2019 06:01:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577790062; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=m61M2js+jrSrrH/126W/2QGGPCgkQ9DaoPMsFQSdJlM=; b=Of+72ES+m2JPMBduhcDTqzKS8r0gCUB4YIiUb9Zo0PwO4hq6mhe9f/6Y7ZSSw/6lwqje2UOp
 vkZpbWEjnVmwIdmWSb/j/0lHcZ3zJ4ocVDf4JmbqM/CHEIZlaT2YrQGw1rJ2acslhH/5dKjF
 n7kEzPa2K+Bpq4ctG1Iun7WlkB0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0b2a6c.7fca16f85ed8-smtp-out-n02;
 Tue, 31 Dec 2019 11:01:00 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2F4D9C4479C; Tue, 31 Dec 2019 11:00:59 +0000 (UTC)
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1F234C433CB;
        Tue, 31 Dec 2019 11:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1F234C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 0/2] Add support for IPA clock for SC7180
Date:   Tue, 31 Dec 2019 16:30:46 +0530
Message-Id: <1577790048-18263-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Support IPA clock for SC7180 and also handle undefined clock registration
in clk-rpmh driver.

Taniya Das (2):
  clk: qcom: rpmh: skip undefined clocks when registering
  clk: qcom: rpmh: Add IPA clock for SC7180

 drivers/clk/qcom/clk-rpmh.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
