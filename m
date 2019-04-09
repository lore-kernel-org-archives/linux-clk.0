Return-Path: <SRS0=4wXd=SL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDA2C10F0E
	for <linux-clk@archiver.kernel.org>; Tue,  9 Apr 2019 20:47:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 685792084B
	for <linux-clk@archiver.kernel.org>; Tue,  9 Apr 2019 20:47:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SOvXYeUj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfDIUrp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Apr 2019 16:47:45 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46197 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfDIUrb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Apr 2019 16:47:31 -0400
Received: by mail-pf1-f196.google.com with SMTP id 9so10424844pfj.13
        for <linux-clk@vger.kernel.org>; Tue, 09 Apr 2019 13:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qGw/m7HHCKFTJMNBAQqfOMUpuzIj1MTny7DgtGjU83w=;
        b=SOvXYeUjqflbpCsSB6HQYFOY66k0ViRsIFWTvrG7DM8QKLlYBuV7/nmqu9ZI2/KBrD
         CxniiwWrpWcQrJTAlwvV7yhkD8Dpi/w4XIKHdfHWklbA8OWMz2rMFIiuLphm/XMDrM5I
         AgNXnhgsH9gjmzxjI46kbprt0DrALCvz7jQU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qGw/m7HHCKFTJMNBAQqfOMUpuzIj1MTny7DgtGjU83w=;
        b=mZxF+CqMRzEYBoJHzqnDMl1Bmthqf9ay2gh6wwy3YPtYp0f+tixNegnwH7Oimv9sbZ
         d38F9TEc0lZJll8WME44BIRxLD6Y0CXVdwNWF66jZxRgfWLDRzc9kc4ucoPjf+CL2a7+
         3xo32Z7D5KfcabExDn9Nt7JvOvL2kRaLIXUZYqSKv4VcNAYuY6zECF9t7FTGWqh8N1Bq
         lHg7xLOJDc8D46Sw6FsZ6hEQ33cIYJRYAQtbZa4G1fgCs7xkia+1hd6QzjxDNPeV7eHY
         4lCQgpr4l24JWybpl1CDHWJE5ipnDZ+GhDnsRyao3O5T9Xqh9UlIo1RkWx4czuaNMAVk
         lSvw==
X-Gm-Message-State: APjAAAU3+k7QO+UNkBOJHKeyMTEb+DKYjNZ/suLGGae0qVHv0DCHAvca
        sM9fWQaPGtgGta+Tl4IVoVZP6A==
X-Google-Smtp-Source: APXvYqziTGwh0PIRUWNKCDpa0NQ3K+Qztjxi3cO3WVIWHh6RXgLykiZFIO22QR/YjD1kq0rUyEPoGg==
X-Received: by 2002:a63:c104:: with SMTP id w4mr37135759pgf.409.1554842850956;
        Tue, 09 Apr 2019 13:47:30 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id x28sm35014016pgl.38.2019.04.09.13.47.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Apr 2019 13:47:30 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Caesar Wang <caesar.wang@rock-chips.com>,
        linux-rockchip@lists.infradead.org, mka@chromium.org,
        ryandcase@chromium.org, Elaine Zhang <zhangqing@rock-chips.com>,
        linux-clk@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] ARM: dts: rockchip: fix PWM clock found on RK3288 Socs
Date:   Tue,  9 Apr 2019 13:47:07 -0700
Message-Id: <20190409204707.150347-4-dianders@chromium.org>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
In-Reply-To: <20190409204707.150347-1-dianders@chromium.org>
References: <20190409204707.150347-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Caesar Wang <caesar.wang@rock-chips.com>

We use the new PWM IP on RK3288, but the PWM's clock indeed incorrect.

Signed-off-by: Caesar Wang <caesar.wang@rock-chips.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm/boot/dts/rk3288.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 8bce2fc49b24..efdfa3737561 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -677,7 +677,7 @@
 		#pwm-cells = <3>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pwm0_pin>;
-		clocks = <&cru PCLK_PWM>;
+		clocks = <&cru PCLK_RKPWM>;
 		clock-names = "pwm";
 		status = "disabled";
 	};
@@ -688,7 +688,7 @@
 		#pwm-cells = <3>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pwm1_pin>;
-		clocks = <&cru PCLK_PWM>;
+		clocks = <&cru PCLK_RKPWM>;
 		clock-names = "pwm";
 		status = "disabled";
 	};
@@ -699,7 +699,7 @@
 		#pwm-cells = <3>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pwm2_pin>;
-		clocks = <&cru PCLK_PWM>;
+		clocks = <&cru PCLK_RKPWM>;
 		clock-names = "pwm";
 		status = "disabled";
 	};
@@ -710,7 +710,7 @@
 		#pwm-cells = <2>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pwm3_pin>;
-		clocks = <&cru PCLK_PWM>;
+		clocks = <&cru PCLK_RKPWM>;
 		clock-names = "pwm";
 		status = "disabled";
 	};
-- 
2.21.0.392.gf8f6787159e-goog

