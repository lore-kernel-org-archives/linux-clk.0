Return-Path: <SRS0=P1jM=7F=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2C6C433DF
	for <linux-clk@archiver.kernel.org>; Sat, 23 May 2020 04:10:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EFBF206F6
	for <linux-clk@archiver.kernel.org>; Sat, 23 May 2020 04:10:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com header.i=@marek-ca.20150623.gappssmtp.com header.b="2UK8Wjsk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbgEWEKV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 May 2020 00:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgEWEKU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 May 2020 00:10:20 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F2AEC05BD43
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2020 21:10:19 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id e16so4128842qtg.0
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2020 21:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JQRdlWeBFwW72SP5g/vtRanTpJEntmyERJEmpRIOS+U=;
        b=2UK8WjskI9kR3d3Yd3Xf0+JoSkzInKHntBynwegfLlXiIHBwQobw2szryEAyvj43jS
         TxOlTFMGWYk5AsV5diEf6P857m47Zs+fWZRhAyYqprtRbdfzIbbfDcWiuVxeBEeuTGgY
         YraepTvs+5kbMkGLpnkxPzqFjg0hqjvk/C1fXMXi2ZDcQnFh3c30ZWOyDgD83gReiynW
         WAAJTBp4874+smcHo1+E+/3MPEbH+opaoGYNg0IdC9xQEVdeofpnuDu8N5fpvnU3Q0AF
         ODivAhPXAiyy9A33GhsmPxaCcBH498MlcmuwrTUYGq7PvHKPES5I68wR9i261RlG6lP2
         cLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JQRdlWeBFwW72SP5g/vtRanTpJEntmyERJEmpRIOS+U=;
        b=rBaXkUVj2okLzCdaJNNm4fLKXbjUpxgDEkp0HNqumlEEYeTU+JR4NAbGYNY4vk0dkt
         3ZPN+7ZmXeE0LS6a9MplAS8f2EzgCFgCO14/u2hU4SRamuZ0Rlru72f0ykg9DuhyZMOT
         xSu9fExqB4R8St+smWicCqc5LwkY12tbAeJx9B7/HnyTl+eorTH2/svHyZK0SEm7HTIs
         4y2NKjEOQsQy/+SuZZrCLDPC36gZm358UC1jO3VTMR2PtF4ZBGC+yWIcuGRw91zLceZk
         lfrVd6QHtXvredbYR6H1HoQJkUTd391cq8Kr0Jh7Gj6TlCcEC+uma7MwPX897+pUwXNM
         Ettg==
X-Gm-Message-State: AOAM533//DJ3NUmzquiA4ZGB0aciCeMwX3lwP7tYkoAlBlL0B46xsiLY
        nAo2WYh5eqnO1WXPr05MJl9vHA==
X-Google-Smtp-Source: ABdhPJyc9SpWKGei/BBZrhSmxes65VLODl8xKcISTm3+l4/KHO2KPyL5MVOuWiE5nTaUgboE2AH6OA==
X-Received: by 2002:ac8:4d02:: with SMTP id w2mr18743140qtv.170.1590207018696;
        Fri, 22 May 2020 21:10:18 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id n85sm6219467qkn.31.2020.05.22.21.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 21:10:18 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: qcom: sm8250 gcc depends on QCOM_GDSC
Date:   Sat, 23 May 2020 00:09:47 -0400
Message-Id: <20200523040947.31946-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The driver will always fail to probe without QCOM_GDSC, so select it.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/clk/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 5df110be52c1..59dc0bdafad4 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -378,6 +378,7 @@ config SM_GCC_8150
 
 config SM_GCC_8250
 	tristate "SM8250 Global Clock Controller"
+	select QCOM_GDSC
 	help
 	  Support for the global clock controller on SM8250 devices.
 	  Say Y if you want to use peripheral devices such as UART,
-- 
2.26.1

