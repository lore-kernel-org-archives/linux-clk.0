Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14BDC43441
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 17:40:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9A01214DA
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 17:40:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="MXtBlAOB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9A01214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbeKVEQE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 23:16:04 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38017 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732451AbeKVEQE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Nov 2018 23:16:04 -0500
Received: by mail-wm1-f67.google.com with SMTP id k198so6640754wmd.3
        for <linux-clk@vger.kernel.org>; Wed, 21 Nov 2018 09:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=26rsxk07e0CFhgI82v6hb8K404IJKdY8wrKvJcP4P44=;
        b=MXtBlAOB1ImNQHfcMOYaARoBHVjlOegcaaOPX1lht0wsgxwzR6eyfSkrdUedLuLrYq
         5dDbubqncYD/voSZozkwu+Cr7J3edLqEgqEk9IJAw5KaMUElSYs/kF0CGCy0SxviF6sQ
         EZEca8Zv3HnBz7osAYh7AxkjosUYHmPMFyrvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=26rsxk07e0CFhgI82v6hb8K404IJKdY8wrKvJcP4P44=;
        b=GCAuuV9OUtfUTuK9fV1aOTFzTcYDLFBft/9SKhmE3l2VQAz+zHau9ZzB/aa4Xf+Tlk
         hzEkAZm0RNHVkqaJ9uoDkYm1PrTXjXdWNbY0Qn/R+GQN8ifY5o5Ci3H4wRTgX9e+k3qd
         pvDxU1kNmqK7r2v8cQhfRYcv4jsXKP7uhg6TF3PzVY7QEp5EEZm1YvFm2z7mTSrINJ/c
         +xYquJYJD/yGx8v5IsYXFoY3bvDwIA9B1AmOdEj8TfZQ/sg8pfTGH1WOagAhRY3NqZb4
         qbCjH2SA2kgVv9rTPyso+sRBxspZMGtOG8Z6wve9xb+HKZ1WC1Ja997nbohfiwbxIFfn
         uj3g==
X-Gm-Message-State: AGRZ1gLR/55Q93HcGchDLML1b1Ar7C71SD6g/QoaKbVCykTdmUPy6byY
        8adU0yhBQmnYigZg4a7uIFgZlA==
X-Google-Smtp-Source: AFSGD/X5AyligLM2ldRv5BaTcOLe+9ndBncv+O37g6eQPV2L8Fk9kwHM1SiQkVeqbH3RoQc4VgJErQ==
X-Received: by 2002:a1c:a4c5:: with SMTP id n188-v6mr6697374wme.149.1542822043271;
        Wed, 21 Nov 2018 09:40:43 -0800 (PST)
Received: from lpoulain-ThinkPad-T470p.home (atoulouse-654-1-394-222.w90-55.abo.wanadoo.fr. [90.55.193.222])
        by smtp.gmail.com with ESMTPSA id w2-v6sm11821005wrr.78.2018.11.21.09.40.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 09:40:42 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     andy.gross@linaro.org, david.brown@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] clk: qcom: msm8916: Additional clock rates for spi
Date:   Wed, 21 Nov 2018 18:40:41 +0100
Message-Id: <1542822041-9675-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add SPI friendly clock rates to the spi freq table.
Today it's not possible to use SPI at lower than 960Khz.
This patch adds 100/250/500/1000 kHz configs to the table.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: reword: s/khz/KHz

 drivers/clk/qcom/gcc-msm8916.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index ac2b0aa..7d9647c 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -544,7 +544,11 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_blsp1_qup1_6_spi_apps_clk[] = {
+	F(100000, P_XO, 16, 2, 24),
+	F(250000, P_XO, 16, 5, 24),
+	F(500000, P_XO, 8, 5, 24),
 	F(960000, P_XO, 10, 1, 2),
+	F(1000000, P_XO, 4, 5, 24),
 	F(4800000, P_XO, 4, 0, 0),
 	F(9600000, P_XO, 2, 0, 0),
 	F(16000000, P_GPLL0, 10, 1, 5),
-- 
2.7.4

