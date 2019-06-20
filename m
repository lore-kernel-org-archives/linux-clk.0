Return-Path: <SRS0=jKhQ=UT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CD5C43613
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jun 2019 15:01:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB3AF2084A
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jun 2019 15:01:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jiMFQLFW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbfFTPBX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jun 2019 11:01:23 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43549 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731982AbfFTPA3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jun 2019 11:00:29 -0400
Received: by mail-wr1-f67.google.com with SMTP id p13so3354976wru.10
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2019 08:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xpe6ifKz7SuClVLyY+/xaKksjob7YtLZf3uysFqr17Y=;
        b=jiMFQLFWtay0rRLzh+SDB1Dk3ZblEFbfmuUEilGmgJhW7Qz4KUAOuTU5opeNKO7nWt
         3n6KP2WFOgh4jIbh0CB9N9m692nzvHycKqZRsgw92Mlfi9t2kewxfiNiBnBP5KlFLxic
         9sQlOpOiP0tLfshVxMI7gTuXYR4gXXsG0+JRzy1uCzshnXvPYB+bAiQslnrgRGdC0QLh
         NMa/SVGZJA10pDNrdq1V2bwTLxwVHMR7VPnGXjDgUXHQq/AVt4tl6/UlAxL1WAvBtdy6
         2FmQiQyKUnniVQIQw0J8yoVz/rtn/FkGaG8a51HsMYSRhJKY5QMSsch1/WLNdyKN+7zC
         oXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xpe6ifKz7SuClVLyY+/xaKksjob7YtLZf3uysFqr17Y=;
        b=SOwpj7Qid5veZ5VFpSVz+VN5fs5lpW4czGNb670bJtu9SLmYU+mJ5YgMp1wJXmgLnJ
         h5D0oxIrmLcScbaRm96d19k4SQPJGneNS2Ee6QbY+q2hRGsGv+ktqu7jx9OBPgq4W8gH
         Q4EGGau5cSGiDcxXLMzFf2vwdzEKTWISPTJEZqm27dBhr9C8Y+qKhJjLDqu7mjNjWoPC
         vYxV8SZUthdLsDlNs8n0UJS+aA8IU2cZM1DH5P85eG0/eeguUxrz+aBefiGiTYgx4Fx9
         b6d+LWfscnq6KofOB5NhKjLU5ik23eC/vJ7xnB48Bg/awOI2YQzu9W3qIDd8Rez7S3HS
         1rpw==
X-Gm-Message-State: APjAAAVeZ+GCmQQpmLyXVkFceg6qZbYxvFmPG7K6DYUA5gfi24qnsN3O
        6zR7igVfCoqVRjild5SNLeWEKg==
X-Google-Smtp-Source: APXvYqz/51ebhU5rXHGYChuENG7sgffban6b+i1SauMMfobKCffeLHRbzIr3Iq24zACKZETqEf1n9Q==
X-Received: by 2002:adf:f046:: with SMTP id t6mr41634172wro.307.1561042827408;
        Thu, 20 Jun 2019 08:00:27 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o126sm6802520wmo.1.2019.06.20.08.00.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 20 Jun 2019 08:00:26 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT 06/14] soc: amlogic: meson-clk-measure: add G12B second cluster cpu clk
Date:   Thu, 20 Jun 2019 17:00:05 +0200
Message-Id: <20190620150013.13462-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620150013.13462-1-narmstrong@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the G12B second CPU cluster CPU and SYS_PLL measure IDs.

These IDs returns 0Hz on G12A.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index c470e24f1dfa..f09b404b39d3 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -324,6 +324,8 @@ static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
 	CLK_MSR_ID(84, "co_tx"),
 	CLK_MSR_ID(89, "hdmi_todig"),
 	CLK_MSR_ID(90, "hdmitx_sys"),
+	CLK_MSR_ID(91, "sys_cpub_div16"),
+	CLK_MSR_ID(92, "sys_pll_cpub_div16"),
 	CLK_MSR_ID(94, "eth_phy_rx"),
 	CLK_MSR_ID(95, "eth_phy_pll"),
 	CLK_MSR_ID(96, "vpu_b"),
-- 
2.21.0

