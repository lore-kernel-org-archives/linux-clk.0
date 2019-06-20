Return-Path: <SRS0=jKhQ=UT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC01C43613
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jun 2019 15:00:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 876362084A
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jun 2019 15:00:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="G+jGjIMv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732087AbfFTPAe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jun 2019 11:00:34 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53443 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732054AbfFTPAd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jun 2019 11:00:33 -0400
Received: by mail-wm1-f66.google.com with SMTP id x15so3392519wmj.3
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2019 08:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eF8xBGeTljvvRz8oIGPjn0ZgbNxxAvWP0tXIK0uht64=;
        b=G+jGjIMvhLDlHlsS6ZUQa62iQPcD1g9joTMkE88tdYoN0qASnjniGNFYJPZU+MLSCX
         H7EPMSh7fkUYj/ww1ZZ4miAqZl1duvLB+21CLWFEY9BOKNgXt9caf9pxRR0j94gTykle
         oZzT0WdZTg3PVn2yUYMarDfak4tAp1QeolW/5s6jNYm8aZxbPu/oQRZCVsjn8zZDkjR3
         g9qrP/pXJWwTpDIiKG3L5k4I7FRfpiQ4v2MH31zO/f3/tgspZsezciharlR3DlUw9mXJ
         0aaBOLMZUcIGomlBEMSR0QE/fZONdiICEkN1HZ0hE/PFo6spyeh0+0S+2jraLAi9vYs1
         AMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eF8xBGeTljvvRz8oIGPjn0ZgbNxxAvWP0tXIK0uht64=;
        b=V5wbwfOkPtA7nEslGHNh8+dVlLOx8xjsGj4hNKM+c58fLs1mTTRGfyzpmhIWTXY7f5
         f35o0cHP6cjbESNHptjTDaFtBXOLmLh1S8cnTLysE+wezonwxW/AQy/Q83XuknQoEB0c
         7+68z0Ftpx+jKTpZU+rXixF5J5cICczvlYH+Li5P8TUsdV+BRQcfB3L9HuTftIyTRPe0
         YQqEbs2gymWcxQCFEGhr/x9yBLJ939YJsB0PWflWD/i0hIqXrm6yvHr8DjPfQeLB5rTq
         R/WTP7rPyCs+aJdTaJEvEvshvgSeVczD59BupQRiwv9MIfwYD5VNGKasJIATBP0fdUH4
         Ey9g==
X-Gm-Message-State: APjAAAWosP/hOpLmXVyktNwnuzaEgHHEpCi455UrdBEgOHCw8QJAX194
        sTBdKE4Hs6Jq6cBIr36Bj6hqNQ==
X-Google-Smtp-Source: APXvYqyB0M/8J7elbFZ7JqzPsyIKsmt8dD5yRCndjrBFTtmLDZMEgDCJQgbv0JCT6BR9I/9CVeq96w==
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr56296wmf.154.1561042831759;
        Thu, 20 Jun 2019 08:00:31 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o126sm6802520wmo.1.2019.06.20.08.00.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 20 Jun 2019 08:00:31 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT 10/14] arm64: dts: meson-g12-common: add pwm_a on GPIOE_2 pinmux
Date:   Thu, 20 Jun 2019 17:00:09 +0200
Message-Id: <20190620150013.13462-11-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620150013.13462-1-narmstrong@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the ao_pinctrl subnode for the pwm_a function on GPIOE_2.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 2baa04303762..76484801478d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1984,6 +1984,14 @@
 						};
 					};
 
+					pwm_a_e_pins: pwm-a-e {
+						mux {
+							groups = "pwm_a_e";
+							function = "pwm_a_e";
+							bias-disable;
+						};
+					};
+
 					pwm_ao_a_pins: pwm-ao-a {
 						mux {
 							groups = "pwm_ao_a";
-- 
2.21.0

