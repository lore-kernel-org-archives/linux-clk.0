Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B131CC61DA4
	for <linux-clk@archiver.kernel.org>; Sat, 11 Feb 2023 15:30:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjBKPaj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 11 Feb 2023 10:30:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjBKPai (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 11 Feb 2023 10:30:38 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55CA324129
        for <linux-clk@vger.kernel.org>; Sat, 11 Feb 2023 07:30:37 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id n13so5842463wmr.4
        for <linux-clk@vger.kernel.org>; Sat, 11 Feb 2023 07:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XBSWhsd3J5nNMaxtjAodHTsyNDtQVEl66g9yJXudwNs=;
        b=k2JFeSRcbjDPc+yFt1TDGWY3u6BYZD0bfdtEvpiQ97rr6w8TMr05uvK9Cmj64asGZ/
         OtxMEp+gIjpvDAkkVPVZVZIsMrOYVCbqRYQWv0Enw6zFB7etdhJt2AXm0bciLKcYZm8h
         B5JELWQiCeRUSxRxDsH+0ar7ajXit3XCH4HCnfFFx9TMHrU2UvUfHA4JS7q3QlpvPb9i
         HIwxCqRZ5/21/e7Nm4h2pacSIJwFkNnTLb1hCImCgsMzqfkVnbvf046pE+dmH92/gibn
         cWhO/7S5SCMHEWQLNmhvkydvDCs9H3O6z4e5vatRUw4WaRhmR0pb6cEW+mRnNTpFSUu0
         hsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBSWhsd3J5nNMaxtjAodHTsyNDtQVEl66g9yJXudwNs=;
        b=NtLEjOe3h87iy5YtHDvl6carKyArh5QMV370ZbiluTQPD3I3gwhEt8sPHbZI+/ZUD7
         CxYMU+UDrfF2khnNbRKyFeA806n7zmeylonfuU/mgUKZwdtRPt/OOB5jOqPzayXKArqF
         M9hShI7ZnkszNKwHfZHJk9DB+rsy+0m0QQtXoa+C99OKoYfzxmkAanw6UckHuS8+O3aa
         +6FjACRGB2cDTiJ2ASzxGtKGZOnb1vkrBbJCXb+Xw3X++zk61bDcylf/VgelXcpG//Y7
         dtMNl63xsqJXgfhbLC6USlGVyOkh7zFjeEtD4ryRlWfJrM6E3KHq32vOOZz5A+5zDQgi
         /MRA==
X-Gm-Message-State: AO0yUKXGDETOsEE83SiyBRmKMDMckNuPuyFtHwtPCky+qgkucXUSwU+O
        9XAxuyWHNq2begQ45ujEwbyprw==
X-Google-Smtp-Source: AK7set/pAScyi3VLor3iJHrDhU4alhpszfHReEWife9FyPwMgqqdTpFego5ZdTLsdB9DyH5wRxMKvA==
X-Received: by 2002:a05:600c:a28f:b0:3df:ff11:6775 with SMTP id hu15-20020a05600ca28f00b003dfff116775mr1181100wmb.14.1676129435919;
        Sat, 11 Feb 2023 07:30:35 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id o41-20020a05600c512900b003dc4aae4739sm13185441wms.27.2023.02.11.07.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 07:30:35 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] clk: renesas: r8a77980: Add VIN clocks
Date:   Sat, 11 Feb 2023 16:30:26 +0100
Message-Id: <20230211153026.3898491-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the VIN module clocks, which are used by the VIN modules on the
Renesas R-Car Condor (R8A77980) SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a77980-cpg-mssr.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/renesas/r8a77980-cpg-mssr.c b/drivers/clk/renesas/r8a77980-cpg-mssr.c
index 06f925aff407..6dc63eaf1155 100644
--- a/drivers/clk/renesas/r8a77980-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77980-cpg-mssr.c
@@ -150,11 +150,27 @@ static const struct mssr_mod_clk r8a77980_mod_clks[] __initconst = {
 	DEF_MOD("imp-ocv3",		 529,	R8A77980_CLK_S1D1),
 	DEF_MOD("imp-ocv2",		 531,	R8A77980_CLK_S1D1),
 	DEF_MOD("fcpvd0",		 603,	R8A77980_CLK_S3D1),
+	DEF_MOD("vin15",		 604,	R8A77980_CLK_S2D1),
+	DEF_MOD("vin14",		 605,	R8A77980_CLK_S2D1),
+	DEF_MOD("vin13",		 608,	R8A77980_CLK_S2D1),
+	DEF_MOD("vin12",		 612,	R8A77980_CLK_S2D1),
+	DEF_MOD("vin11",		 618,	R8A77980_CLK_S2D1),
 	DEF_MOD("vspd0",		 623,	R8A77980_CLK_S3D1),
+	DEF_MOD("vin10",		 625,	R8A77980_CLK_S2D1),
+	DEF_MOD("vin9",			 627,	R8A77980_CLK_S2D1),
+	DEF_MOD("vin8",			 628,	R8A77980_CLK_S2D1),
 	DEF_MOD("csi41",		 715,	R8A77980_CLK_CSI0),
 	DEF_MOD("csi40",		 716,	R8A77980_CLK_CSI0),
 	DEF_MOD("du0",			 724,	R8A77980_CLK_S2D1),
 	DEF_MOD("lvds",			 727,	R8A77980_CLK_S2D1),
+	DEF_MOD("vin7",			 804,	R8A77980_CLK_S2D1),
+	DEF_MOD("vin6",			 805,	R8A77980_CLK_S2D1),
+	DEF_MOD("vin5",			 806,	R8A77980_CLK_S2D1),
+	DEF_MOD("vin4",			 807,	R8A77980_CLK_S2D1),
+	DEF_MOD("vin3",			 808,	R8A77980_CLK_S2D1),
+	DEF_MOD("vin2",			 809,	R8A77980_CLK_S2D1),
+	DEF_MOD("vin1",			 810,	R8A77980_CLK_S2D1),
+	DEF_MOD("vin0",			 811,	R8A77980_CLK_S2D1),
 	DEF_MOD("etheravb",		 812,	R8A77980_CLK_S3D2),
 	DEF_MOD("gether",		 813,	R8A77980_CLK_S3D2),
 	DEF_MOD("imp3",			 824,	R8A77980_CLK_S1D1),
-- 
2.39.1

