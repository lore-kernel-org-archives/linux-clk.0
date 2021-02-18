Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760A6C43381
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 07:36:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40EB064DE9
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 07:36:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbhBRHcY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Feb 2021 02:32:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbhBRH2m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Feb 2021 02:28:42 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0254C06178C;
        Wed, 17 Feb 2021 23:07:19 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id l12so1637646wry.2;
        Wed, 17 Feb 2021 23:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jiX7X0M+t1Zm8HAFufsMGCFO60ftU2nIQxPg0v/LgAc=;
        b=lF85QSD+vYfT7DlSOt6Lh41R38GeGRS80DlSfvCEsrAPEM+asxWsbIPISJseavuhlY
         zsSCFytWTgoKlDwQfqEGEunVSsm4NPDAdiqaHaJhsm768AK3xAOXZgcufiRv8aj9tgnR
         DcvS2PhlLweBIVytmX6DUdg7RvEU9ZsNfSHiKJ1BKrQE1bc5FDxQd3bjOW4KLtORohox
         ypZaqFAtqe4mxX4RMSQivJ16sMxWE+aASBgKTaK7LJvUQwXllBuFMbgUNl+v4FaMCo/P
         34RSz3M/PTYv4UJlatoLLXTP2jsp/2K8bEXoj3+SNM2aZ3Yv4lc89MdQBPoLg7f3zk0a
         8LWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jiX7X0M+t1Zm8HAFufsMGCFO60ftU2nIQxPg0v/LgAc=;
        b=akOQuQLa3+DqEUOfQxqGgtpuKqZZc82/Pj2NbEFsZDQbhM+WQngZAB+yvUv3GSz5fs
         NHjsQ4DNRzdaOOjSbDsG3SoorUVbvbgrqWHTGvb9pfasWtbAZTASzKt+hl25gHlApBQ2
         dq3aNif5tND4dJ6lB1+ZNcMHO+GdyoYLh0pe6WwDfoNrGKu5fA9F0A7IdV0NEv9C4JcJ
         nfG8zhGXH+4KQAx9GLFu219gOePAzmcHrJlzhwWglbB50jB1rq92BzLSndxdkEQhyVzz
         gE2V+Gm2+E0EqdkR1xopK3mBSFUohEFbF7AdV24i1j3o2e3NYC13yBc5h8XoupfynPiC
         Bdqw==
X-Gm-Message-State: AOAM532clVLFdDNNv6TgBVGTYf4DFNcT2/N9aegvsz8JIYH5s6YqX9nO
        ZYqQcs0MPQ5FqkfFV6+ZERM=
X-Google-Smtp-Source: ABdhPJzTOnJ2x02hqakckgGgFn+4lopjhaB9yCEKqRGzMSs12Rw6Xn/SU5cQxXjIf3qICSbhlK5vKQ==
X-Received: by 2002:adf:d20c:: with SMTP id j12mr2872975wrh.76.1613632038781;
        Wed, 17 Feb 2021 23:07:18 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id 4sm6136555wma.0.2021.02.17.23.07.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Feb 2021 23:07:18 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 6/6] MAINTAINERS: add MT7621 CLOCK maintainer
Date:   Thu, 18 Feb 2021 08:07:09 +0100
Message-Id: <20210218070709.11932-7-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218070709.11932-1-sergio.paracuellos@gmail.com>
References: <20210218070709.11932-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Adding myself as maintainer for mt7621 clock driver.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 809a68af5efd..be5ada6b4309 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11288,6 +11288,12 @@ L:	linux-wireless@vger.kernel.org
 S:	Maintained
 F:	drivers/net/wireless/mediatek/mt7601u/
 
+MEDIATEK MT7621 CLOCK DRIVER
+M:	Sergio Paracuellos <sergio.paracuellos@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
+F:	drivers/clk/ralink/clk-mt7621.c
+
 MEDIATEK MT7621/28/88 I2C DRIVER
 M:	Stefan Roese <sr@denx.de>
 L:	linux-i2c@vger.kernel.org
-- 
2.25.1

