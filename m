Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D44AC64E7B
	for <linux-clk@archiver.kernel.org>; Tue, 17 Nov 2020 19:46:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FA762222E
	for <linux-clk@archiver.kernel.org>; Tue, 17 Nov 2020 19:46:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIOGOw6h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730474AbgKQTpW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Nov 2020 14:45:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730464AbgKQTpV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Nov 2020 14:45:21 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C1DC0617A6;
        Tue, 17 Nov 2020 11:45:20 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id cq7so23742004edb.4;
        Tue, 17 Nov 2020 11:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cfXI1Q85bb28+McjuHeu3xbkODr0lp86DQ42QSmzooY=;
        b=UIOGOw6hK+SW6PZnTFb6Ge3JqTDe/NwtTmNJTO4P+2RtdCxVwpi7Rq/Aqdy7x6Adcp
         wRP88fBy5dFJaM2aQnbeAQ86OaDGwNfxN12gzmJ3dkqFpVnOiTua1TOmWPi7J28YErO5
         +vT7F/x1TgHqtmEhUwh1PGspoG99p7+7gC8IC1SqDzWM6y+6IByo7u7LnARJsyzVo3vk
         EGBbLldPVSZ2FfdplHh31JJWObz6Q/AbWGttToOaFGaxQ4Bnap+uRazajLZG+ZNqt8mO
         LDNPLKADpPwuoYQpU5npEVkcgsD8/4BWY1DBz+1+56qMZZS+niS+ovqyTi/ggQR6pvM/
         lMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cfXI1Q85bb28+McjuHeu3xbkODr0lp86DQ42QSmzooY=;
        b=P2ocJ4QT/dyAJAgpkCemwYWS6Emz0mxWvhfLZ7eyd5pN9mI64Yn+8Bzc9FrOq5wwx7
         4qHgmienHb9D26Y76cu6oWaeYfCy2V38p50WGGD/CyQBy/Ew/CD5hJbSkjhthN0Wq3Vh
         mQ/mljxm94LS/m2PpB89iX595GMkNv6xZ3MyWPgLJhfkY4yohK8x0Ym12IF6fntA+tl/
         q2Wvcpu9axfWkdpzKlqDvWO0sNV2WmxL5q0AaPG3zUGctTTaNNZ6uDaCAygXhEygyr3w
         Mteq9diixRnsxi1Vn5cvRqwYTiS1APdQE3tjNGSRGsW9X+lTVpbOHmaP2vitLZfnACD6
         QAUg==
X-Gm-Message-State: AOAM530xJDYrNmyAmwKloZrzUuL31y32GY9izEOi1eL0412D/FgnhXN5
        DD+7G8Y6TdyYrkNjjBoSswDaaHuMTBVnRw==
X-Google-Smtp-Source: ABdhPJzm63HVDveFpEYpiHWpLCJrGBMkWK296r8Fu/+E5TNgbXn9uz3U4HX7amby2EJhlwkYrbPUvQ==
X-Received: by 2002:a05:6402:1389:: with SMTP id b9mr12408755edv.178.1605642319735;
        Tue, 17 Nov 2020 11:45:19 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id w2sm727972ejc.109.2020.11.17.11.45.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2020 11:45:19 -0800 (PST)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     hjc@rock-chips.com, robh+dt@kernel.org, airlied@linux.ie,
        daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/7] dt-bindings: display: add #sound-dai-cells property to rockchip rk3066 hdmi
Date:   Tue, 17 Nov 2020 20:45:03 +0100
Message-Id: <20201117194507.14843-4-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201117194507.14843-1-jbx6244@gmail.com>
References: <20201117194507.14843-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

'#sound-dai-cells' is required to properly interpret
the list of DAI specified in the 'sound-dai' property.
Add it to rockchip,rk3066-hdmi.yaml to document that the
rk3066 HDMI TX also can be used to transmit some audio.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
index 4110d003c..585a8d3b9 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
@@ -42,6 +42,9 @@ properties:
     description:
       This soc uses GRF regs to switch the HDMI TX input between vop0 and vop1.
 
+  "#sound-dai-cells":
+    const: 0
+
   ports:
     type: object
 
@@ -101,6 +104,7 @@ examples:
       pinctrl-names = "default";
       power-domains = <&power RK3066_PD_VIO>;
       rockchip,grf = <&grf>;
+      #sound-dai-cells = <0>;
 
       ports {
         #address-cells = <1>;
-- 
2.11.0

