Return-Path: <SRS0=Ck/k=OT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E91C04EB8
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 16:18:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E97120672
	for <linux-clk@archiver.kernel.org>; Mon, 10 Dec 2018 16:18:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="i9fLMhyM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E97120672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728669AbeLJQSN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Dec 2018 11:18:13 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46002 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728662AbeLJQSN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Dec 2018 11:18:13 -0500
Received: by mail-wr1-f67.google.com with SMTP id b14so11070399wru.12
        for <linux-clk@vger.kernel.org>; Mon, 10 Dec 2018 08:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zSLZfhqj5LlgFfpYLOueILNrvF0k+OKE5voNHu/WFJA=;
        b=i9fLMhyMg+YgyHOHTvKZAa3yzDcRG1Q+CVmwCSS+wetlWyhZPoviQ01kR/cMaG/n0D
         IZGL21eOSqxq7ZGokDjFL49h8G1pVkrDlEBRNteA4xK/ccY3XEX5C8RJFe8I1+IV6Ioy
         DDl7QG6mkfm+zSMch6J4RPgbkjNMpLKbhBQ+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zSLZfhqj5LlgFfpYLOueILNrvF0k+OKE5voNHu/WFJA=;
        b=U+Xp2d1Cafwy5L7NHWrxvXR7joevva85SUG0uopn9bTHTeXLJXqsPJNvhV6K4wgwmF
         zStZR2YiB3BfEsODel/det9PY0VVzTT73OkQpfsw0Z+4Rq9iRVu1knc7Gtl+pz/URtuj
         E34wKxtC3AIPnr4sf3c5aMiCFd9PreoQvJ1sKlIEAogXDkKIN8MsSTvGlw0TdM18hgma
         WZtexRkbtVbM7BPlHkvex5zJXWKfNDBYZ2cPr4zVYJXvHoqGlkDhYj23nPwWLxj8Oa1R
         iksZicOJx3LZigrI/PqrJB+4fffj++NLRaOK4V0dDXBGsuflB15x+WsXsJDM1TJoPD4L
         Jg6g==
X-Gm-Message-State: AA+aEWbHquaXv71KVltjx6++iDDl3piQoKxdkPt+lGnDgqrxjiEGJg6D
        UbxQ2hRvkRXv/gl1y9GRj+fK8g==
X-Google-Smtp-Source: AFSGD/UG8pTrHfDIEcjUTcTwXDbLv36fj4jWRUX42zMKoNQDG4BaPOHeJx6GzE5YfiHqXFAEts88IQ==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr9992101wrv.161.1544458691718;
        Mon, 10 Dec 2018 08:18:11 -0800 (PST)
Received: from localhost.localdomain (ip-162-59.sn-213-198.clouditalia.com. [213.198.162.59])
        by smtp.gmail.com with ESMTPSA id b13sm8397503wrn.28.2018.12.10.08.18.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Dec 2018 08:18:11 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        linux-amarula@amarulasolutions.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v5 16/17] dt-bindings: sun6i-dsi: Add A64 DPHY compatible (w/ A31 fallback)
Date:   Mon, 10 Dec 2018 21:47:28 +0530
Message-Id: <20181210161729.29720-17-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181210161729.29720-1-jagan@amarulasolutions.com>
References: <20181210161729.29720-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The MIPI DSI PHY HDMI controller on Allwinner A64 is similar
on the one on A31.

Add A64 compatible and append A31 compatible as fallback.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
index adc7cdf129dd..08f1f57abff5 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
@@ -40,6 +40,7 @@ D-PHY
 Required properties:
   - compatible: value must be one of:
     * allwinner,sun6i-a31-mipi-dphy
+    * "allwinner,sun50i-a64-mipi-dphy", "allwinner,sun6i-a31-mipi-dphy"
   - reg: base address and size of memory-mapped region
   - clocks: phandles to the clocks feeding the DSI encoder
     * bus: the DSI interface clock
-- 
2.18.0.321.gffc6fa0e3

