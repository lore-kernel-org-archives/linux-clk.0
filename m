Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A41C64E7C
	for <linux-clk@archiver.kernel.org>; Tue, 17 Nov 2020 19:45:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E14962463F
	for <linux-clk@archiver.kernel.org>; Tue, 17 Nov 2020 19:45:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/P6lB+w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730830AbgKQTp3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Nov 2020 14:45:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730464AbgKQTp1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Nov 2020 14:45:27 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D3F2C0617A6;
        Tue, 17 Nov 2020 11:45:25 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id d18so10850907edt.7;
        Tue, 17 Nov 2020 11:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MNzWsDtU39BR4iFEfSJQ9mnoYu92ToJLMEGgLWUUrPw=;
        b=j/P6lB+wO6vdZOi5Agv1mqQVbIrni+q+ALO6i+QbbntEAjO3ALjbyoaIccUUaOa0Yj
         o6cvV+wMx3wOdDlbzNzxjXywYGNQbe72oR4JacgcqedptYB1kV4gPGE+9dGv9jes269G
         Bq0r064CiJxLQraZzATdDk96xLcU/rIXbMJPuKTx1omwbiBt8qZeYKJpGfqDIPuYdMfY
         kyat5CUjgA9yeRMemvobcamXiv2alDl+Dd1uzPC8Lmqx7g7WXqB3glUF4qtkFkoaYh1h
         ZI4XdciXwfyp2DhlBEthUhQgPupbBA3tggimAtRPScUSsyZY2QGd69uiH5vjBKPHREA3
         /ZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MNzWsDtU39BR4iFEfSJQ9mnoYu92ToJLMEGgLWUUrPw=;
        b=dJuvB3Qgo1AGvdC2TdoWLF8PQfOPudWcf5FfmyGdfNRvhegV3YjgoBVoDApD4NuvX7
         kn3e/B6IMf1+RQauSuKG+aMnzKnFeXFF+a+MPHlCSQc2/bXPwXULZZixOM6oNZTyUixw
         QqcqWL8vTRoFRnzBBXXyhludzAFl9bCYcV2VN7Od+a/bEPcvMdAQDKGPs16hXkqFdcAk
         bkCO/y9zwnJxLo+uxfleouZC6Jm6sAuH0vGcuf2uwrePgaVPYGLrO4B8wF3oy9aJS5i4
         e6ffe0mtMoHPxdns4rw7qgKQdt7ZtzN71KKHFLf3mF8Be07oKW/ug1bkwlvPDg7jV7uu
         CQRg==
X-Gm-Message-State: AOAM531i81udNCiTCYipIk4kP0BfNcERPxd5Qixb5VmGdradl6zS067K
        kBB4QG1SDASS1v833uYTvOk=
X-Google-Smtp-Source: ABdhPJyrzzhxGF5lvPmDjYfPklRS9F51sz7rQAaESr2rA6OkcPjado8yI8xHELXCq5r82ignHt0H3A==
X-Received: by 2002:a50:a105:: with SMTP id 5mr21926061edj.165.1605642324325;
        Tue, 17 Nov 2020 11:45:24 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id w2sm727972ejc.109.2020.11.17.11.45.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2020 11:45:23 -0800 (PST)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     hjc@rock-chips.com, robh+dt@kernel.org, airlied@linux.ie,
        daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] ARM: dts: rockchip: enable hdmi_sound and i2s0 for rk3066a-mk808
Date:   Tue, 17 Nov 2020 20:45:07 +0100
Message-Id: <20201117194507.14843-8-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201117194507.14843-1-jbx6244@gmail.com>
References: <20201117194507.14843-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Make some noise with mk808. Enable the hdmi_sound node and
add i2s0 as sound source for hdmi.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3066a-mk808.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/rk3066a-mk808.dts b/arch/arm/boot/dts/rk3066a-mk808.dts
index eed9e60cf..5fe74c097 100644
--- a/arch/arm/boot/dts/rk3066a-mk808.dts
+++ b/arch/arm/boot/dts/rk3066a-mk808.dts
@@ -116,6 +116,14 @@
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
+&i2s0 {
+	status = "okay";
+};
+
 &mmc0 {
 	bus-width = <4>;
 	cap-mmc-highspeed;
-- 
2.11.0

