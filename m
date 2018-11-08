Return-Path: <SRS0=ZQGu=NT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF6DC32789
	for <linux-clk@archiver.kernel.org>; Thu,  8 Nov 2018 09:31:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C0D5A2086A
	for <linux-clk@archiver.kernel.org>; Thu,  8 Nov 2018 09:31:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mdx9CXO/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0D5A2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbeKHTGU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Nov 2018 14:06:20 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43101 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726375AbeKHTGT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Nov 2018 14:06:19 -0500
Received: by mail-wr1-f66.google.com with SMTP id y3-v6so20136204wrh.10
        for <linux-clk@vger.kernel.org>; Thu, 08 Nov 2018 01:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qv6jxXezPla1EOeS4ig4mwMVMLxc3iGmB0uzoW/DK/k=;
        b=mdx9CXO/TpiD1KipUPoOtMrz+kColKlRYsgBm6O2nYPqh+8inJomDe1VgG56hL+b+w
         cQQIlape8z3+vPDINOk2ku8vVusWepOufK/W5GY4eXXNqjc2ISAlcIlCNdmqFJphpfF8
         0HQiSFognQ0FeqlMh0a5t46/xEcQIjfRRaBwwXGgQHBmmLv9GJDpUhk/5fJvQYoISA0+
         YVgDsHrQS7czjQqVIjyBOz7Z8ujqbe4d3D06QeZ/wOygSuypvv4a6GIVrvwdtDGp8YTO
         KJKr73wpx6Nbq8X3DVzDN866vlARFoHZa/I/USuDi2OvvKPsEOz723E0DIM+31rvbTPm
         LOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qv6jxXezPla1EOeS4ig4mwMVMLxc3iGmB0uzoW/DK/k=;
        b=hdz4xUeypWDJdNOdrrazeoxlExPU2pj9RLIIjVk9kohSRp69BwgQXPMwElpanSv89H
         eHEya55O4S1tZHLtaeFZz/aD9OCwQxJcUICLebrUWpXdWx1oCt2K84OwT/K4YG+GgEkd
         QBEAdQDbhdnl3ILXWKA8/ieok74SDTBzXPDiPn3u/92E1/qPJZZ1WEW0QU6ud4nL04Ra
         cAvmMZ53I5ZCRReHGnpg4Sv/0XDYUBYboa9hCTWUBvLuEo3FkhdBVJbLKfsomJz01A/9
         sqtceYmcD7gRIf9rq3lop35kSyBXnguejk1+OpxBviUe30w00Hh+FdhuTKLkbCtm0uk+
         PW4A==
X-Gm-Message-State: AGRZ1gK3Dse5lzsFHMi830z4R0stORD2jVwKfrKTvkSO9FqTSb2WlAir
        Lp+wVC2ToH3wtHC6BBN2ZSfnoQ==
X-Google-Smtp-Source: AJdET5dqOpjmf59tfNDjcWZr2+IVmZju9/yInfCxlo2lrv5Jg1yOLJnFB4Lnr6dXuwiiwO0xe1xSfQ==
X-Received: by 2002:a5d:6405:: with SMTP id z5-v6mr3206051wru.64.1541669501171;
        Thu, 08 Nov 2018 01:31:41 -0800 (PST)
Received: from boomer.local ([90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id m9-v6sm3513691wrn.36.2018.11.08.01.31.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Nov 2018 01:31:40 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Carlo Caione <carlo@caione.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson: axg: mark fdiv2 and fdiv3 as critical
Date:   Thu,  8 Nov 2018 10:31:23 +0100
Message-Id: <20181108093123.21498-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Similar to gxbb and gxl platforms, axg SCPI Cortex-M co-processor
uses the fdiv2 and fdiv3 to, among other things, provide the cpu
clock.

Until clock hand-off mechanism makes its way to CCF and the generic
SCPI claims platform specific clocks, these clocks must be marked as
critical to make sure they are never disabled when needed by the
co-processor.

Fixes: 05f814402d61 ("clk: meson: add fdiv clock gates")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

Hi Stephen,

If you can put this one in clk-fixes as well, it would be awesome.
It is basically the same thing as the change you took this Tuesday.

Since then, we had reports the same problem with SCPI was happening
on the axg, calling for the same fixup.

Cheers
Jerome

 drivers/clk/meson/axg.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index c981159b02c0..792735d7e46e 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -325,6 +325,7 @@ static struct clk_regmap axg_fclk_div2 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_names = (const char *[]){ "fclk_div2_div" },
 		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
@@ -349,6 +350,18 @@ static struct clk_regmap axg_fclk_div3 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_names = (const char *[]){ "fclk_div3_div" },
 		.num_parents = 1,
+		/*
+		 * FIXME:
+		 * This clock, as fdiv2, is used by the SCPI FW and is required
+		 * by the platform to operate correctly.
+		 * Until the following condition are met, we need this clock to
+		 * be marked as critical:
+		 * a) The SCPI generic driver claims and enable all the clocks
+		 *    it needs
+		 * b) CCF has a clock hand-off mechanism to make the sure the
+		 *    clock stays on until the proper driver comes along
+		 */
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
-- 
2.19.1

