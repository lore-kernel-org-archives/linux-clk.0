Return-Path: <SRS0=sCFe=N7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B03EC18E01
	for <linux-clk@archiver.kernel.org>; Tue, 20 Nov 2018 11:15:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F90F2087E
	for <linux-clk@archiver.kernel.org>; Tue, 20 Nov 2018 11:15:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ae03QBU+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F90F2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbeKTVnh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Nov 2018 16:43:37 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35397 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728268AbeKTVnh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Nov 2018 16:43:37 -0500
Received: by mail-wr1-f65.google.com with SMTP id 96so1537207wrb.2
        for <linux-clk@vger.kernel.org>; Tue, 20 Nov 2018 03:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=xZcEPIfg4frvh5Hs0xnUDMuN5+SH2Ev3SNI6h8iKwZs=;
        b=Ae03QBU+GQwGkbonnlUfPhiDmDATEFd1gAYOd4U2kdIAyJm9PBnC1bHoA9+6S49AR7
         Q8yVGJz378/f/s4vsSKJHKkNUFJgP/g0k5XUo1fDiQqT7berX0kJk9hBZ61Q6zA5XfJz
         wXyyWSodb4lKnyZDznTUVXYmIKTWwjDyK1UGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xZcEPIfg4frvh5Hs0xnUDMuN5+SH2Ev3SNI6h8iKwZs=;
        b=khHjghtxcrRa9NSTy3kbCb6vkbiymxIg/Tdy5EurWRmzuJ0sZxW1n0TlzCivrCduGW
         2z/Np4d7vDV/QHloghRZAveBxwGyQwYvNEFBthmg82RwBXBCtc6tDqDT/LU/Bvf1Mdf7
         CtTmDuHYg+sRlqbqac1cuOce8o1wuf0J7rCi0YoBlaGvXJ1fbo2WDFFcEvs2nNixhIhV
         2/SgOYXQmtTiUfH3hyxtnuR/cyjBIkS7w/tA7fffqUaGlETq/Op+MhQKe0hIrWXm1QnR
         4oRJ5u4cq3KtlYj/JvXRAr3fiXl3f13HXcdh8zTdmyMYMuStUFlFC2/S27vJgTnRxFir
         lxxA==
X-Gm-Message-State: AA+aEWbx7XytW1D1NcZ3LBTcbUl5DAkQXsefFegG39TIgotsxc3cwMkr
        yDETXC7KbJFVXg0XzLBYYNiM4w==
X-Google-Smtp-Source: AFSGD/XsuVJggo55LijR7qufmSMxF5Q3FGGwHYqc1iKTd0dBb513iuPT7I/mhknsz2bjIrAqDI/XIQ==
X-Received: by 2002:adf:ae41:: with SMTP id u1mr1510793wrd.20.1542712498693;
        Tue, 20 Nov 2018 03:14:58 -0800 (PST)
Received: from lpoulain-ThinkPad-T470p.home (atoulouse-654-1-394-222.w90-55.abo.wanadoo.fr. [90.55.193.222])
        by smtp.gmail.com with ESMTPSA id q3sm13222795wrn.84.2018.11.20.03.14.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 03:14:57 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     andy.gross@linaro.org, david.brown@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] clk: qcom: msm8916: Additional clock rates for spi
Date:   Tue, 20 Nov 2018 12:14:56 +0100
Message-Id: <1542712496-24941-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add SPI friendly clock rates to the spi freq table.
Today it's not possible to use SPI at lower than 960Khz.
This patch adds 100/250/500/1000 khz configs to the table.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
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

