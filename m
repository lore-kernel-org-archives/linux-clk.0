Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692C3C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 24 Jan 2022 16:52:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243936AbiAXQwT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jan 2022 11:52:19 -0500
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:40462 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241226AbiAXQwQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Jan 2022 11:52:16 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4JjGHK3d63z9w2xs
        for <linux-clk@vger.kernel.org>; Mon, 24 Jan 2022 16:52:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3vS_bNgOiclW for <linux-clk@vger.kernel.org>;
        Mon, 24 Jan 2022 10:52:13 -0600 (CST)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4JjGHK1dlwz9w2xr
        for <linux-clk@vger.kernel.org>; Mon, 24 Jan 2022 10:52:13 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4JjGHK1dlwz9w2xr
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4JjGHK1dlwz9w2xr
Received: by mail-pl1-f197.google.com with SMTP id cp2-20020a170902e78200b0014a9f3e3c1fso3635850plb.5
        for <linux-clk@vger.kernel.org>; Mon, 24 Jan 2022 08:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y+tHqbGxYTZxLAsM/2xshYqCJwWoXL4A34qQepi4q+A=;
        b=qTRfymmBKC6ulS4TRgxgZKClqn/zZAFzLlGZ9X8q4tPcpU4l6boeMZwpKIVwgfGf0u
         BUzjWVHswyFWdKCrVRUgyIiUUSdCxNlyQoD40ujFs9DLvHyZ5IA7opMGjYe5NQ32dJ4s
         jBHYtVUZJ9tooDz2GRD3vJjJ9KXzADNLTsZnWMHV1/uH9g5OquNsWbgWgABBZOfvcIMI
         efVYuFAs1lQ5EQjCC6JHzf974Lvb+FSKV438Tb5OlBqBm53q1eP38MqODlR1/CsMItMD
         rk93yz9f+XgCR0cth3LHoR1OsHnZy9nQfUNAJKrIPSj44Y2ihnIQvZAZOLi73L3bI4wh
         lTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y+tHqbGxYTZxLAsM/2xshYqCJwWoXL4A34qQepi4q+A=;
        b=kkzuRW8h9f/jy/hdwZasFZLMsqXTxjQb+C9QA+iTdIYCzmbQfF6H1XWsz3p37R//Hu
         ihjeWJNFxRdDgfGe4HBzDD81cT1VDVsnoYPknLk4kN7Y+fVi1ePbOEgUwjv35BiJINNB
         txP5InT1FTDpAocRK38OYUg/SNwwtNFp79P1YmL29+WkONlEqt4JO5UYIIidun5N7fiY
         9qgDOCb3j9J7zPMYsg7HxZ+Q7X8jy61nWbSsd61TGxzvAOn7C2GESwtjAaRW6sk0bR4s
         bslwUbW5m8+ELCjeqt0KXglKPE/Rh45rPShMHlkoEaFRm02XkcICFcXF5o1z1DwxqS1T
         1hgQ==
X-Gm-Message-State: AOAM530ssiDDIeiiFpTZRP5pkt5P7Sn15fv87GFOunHHPqI1j7GEfJAW
        XEBTpzjhz6VKmJgUs6o507JXtEKsigf14/O/c/Mo1VoXAEVpOH+lBDtEcfZLH85iCV+Rn6MpZ8F
        K5fhft4QYG8m06UuJhgCkICOb
X-Received: by 2002:a17:90a:9488:: with SMTP id s8mr2752324pjo.40.1643043132426;
        Mon, 24 Jan 2022 08:52:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4GMuF2+Hhif3WBk5US0gETu4RE21+7UtomtMNIIf3WFvwybUV3W7ojOWWWG8Hp0/sZjoQAA==
X-Received: by 2002:a17:90a:9488:: with SMTP id s8mr2752309pjo.40.1643043132222;
        Mon, 24 Jan 2022 08:52:12 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.61.248])
        by smtp.gmail.com with ESMTPSA id 17sm16984414pfl.175.2022.01.24.08.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 08:52:11 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Adam Ford <aford173@gmail.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: imx: Fix a NULL pointer dereference in imx_register_uart_clocks()
Date:   Tue, 25 Jan 2022 00:52:06 +0800
Message-Id: <20220124165206.55059-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In imx_register_uart_clocks(), the global variable imx_uart_clocks is
assigned by kcalloc() and there is a dereference of in the next for loop,
which could introduce a NULL pointer dereference on failure of kcalloc().

Fix this by adding a NULL check of imx_uart_clocks.

This bug was found by a static analyzer.

Builds with 'make allyesconfig' show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 379c9a24cc23 ("clk: imx: Fix reparenting of UARTs not associated with stdout")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
The analysis employs differential checking to identify inconsistent 
security operations (e.g., checks or kfrees) between two code paths 
and confirms that the inconsistent operations are not recovered in the
current function or the callers, so they constitute bugs. 

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

 drivers/clk/imx/clk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
index 7cc669934253..99249ab361d2 100644
--- a/drivers/clk/imx/clk.c
+++ b/drivers/clk/imx/clk.c
@@ -173,6 +173,8 @@ void imx_register_uart_clocks(unsigned int clk_count)
 		int i;
 
 		imx_uart_clocks = kcalloc(clk_count, sizeof(struct clk *), GFP_KERNEL);
+		if (!imx_uart_clocks)
+			return;
 
 		if (!of_stdout)
 			return;
-- 
2.25.1

