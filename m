Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8AEECAAA1
	for <linux-clk@archiver.kernel.org>; Mon,  5 Sep 2022 07:53:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236290AbiIEHxE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Sep 2022 03:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235795AbiIEHxD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Sep 2022 03:53:03 -0400
X-Greylist: delayed 346 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 05 Sep 2022 00:53:02 PDT
Received: from us-smtp-delivery-115.mimecast.com (us-smtp-delivery-115.mimecast.com [170.10.129.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A1F11D0CB
        for <linux-clk@vger.kernel.org>; Mon,  5 Sep 2022 00:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
        s=selector; t=1662364381;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=m+UK/3xmvV65NQU0nckZ1VWPUugzCRzrBeOVEtHB3BM=;
        b=gmgunwUWUBAu8zuRyXzOtUua3D7bN4yBkVVgxo/++XljQ51NzPEqFwJhqsZepV4Y49RjNR
        Urwwjg+iLwf/JOolesYooIUE3QWzTjspppW2OocsmZ0ZAnYDbr2MeSQP9mI4n+XR2GmEfd
        dWSpkmPBzUNpy+JwwgHGHBgO9tLHYl2tbucYRc/09wJ4ygQDd0igysUSKZd4b8bQ3HZrQq
        NV8vHBamJI8c36BtCAog0CTG6vYyAIe/aGLmOxwAeyMVvBYeeQvmmES1DM5FHaTAPnLddY
        vMMVOUHjufLUKnL6hXhae9Vnb3DhdcyGmMNyNXx8GgNlXIGD5uqJfdIxVRaozw==
Received: from mail.maxlinear.com (174-47-1-83.static.ctl.one [174.47.1.83])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 us-mta-230-8p819PzjPSCMsQ4KzKoqSg-1; Mon, 05 Sep 2022 03:44:05 -0400
X-MC-Unique: 8p819PzjPSCMsQ4KzKoqSg-1
Received: from sgsxdev001.isng.phoenix.local (10.226.81.111) by
 mail.maxlinear.com (10.23.38.120) with Microsoft SMTP Server id 15.1.2375.24;
 Mon, 5 Sep 2022 00:44:02 -0700
From:   Rahul Tanwar <rtanwar@maxlinear.com>
To:     <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <linux-clk@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-lgm-soc@maxlinear.com>,
        "Rahul Tanwar" <rtanwar@maxlinear.com>
Subject: [PATCH v2 4/5] clk: mxl: Add validation for register reads/writes
Date:   Mon, 5 Sep 2022 15:43:47 +0800
Message-ID: <09c3b98ba9f74719b02e1b5153c3e639cb8d34ca.1662363020.git.rtanwar@maxlinear.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1662363020.git.rtanwar@maxlinear.com>
References: <cover.1662363020.git.rtanwar@maxlinear.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: maxlinear.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some clocks support parent clock dividers but they do not
support clock gating (clk enable/disable). Such types of
clocks might call API's for get/set_reg_val routines with
width as 0 during clk_prepare_enable() call. Handle such
cases by first validating width during clk_prepare_enable()
while still supporting clk_set_rate() correctly.

Signed-off-by: Rahul Tanwar <rtanwar@maxlinear.com>
---
 drivers/clk/x86/clk-cgu.h | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/x86/clk-cgu.h b/drivers/clk/x86/clk-cgu.h
index 73ce84345f81..46daf9ebd6c9 100644
--- a/drivers/clk/x86/clk-cgu.h
+++ b/drivers/clk/x86/clk-cgu.h
@@ -299,29 +299,51 @@ struct lgm_clk_branch {
 static inline void lgm_set_clk_val(struct regmap *membase, u32 reg,
 =09=09=09=09   u8 shift, u8 width, u32 set_val)
 {
-=09u32 mask =3D (GENMASK(width - 1, 0) << shift);
+=09u32 mask;
=20
+=09/*
+=09 * Some clocks support parent clock dividers but they do not
+=09 * support clock gating (clk enable/disable). Such types of
+=09 * clocks might call this function with width as 0 during
+=09 * clk_prepare_enable() call. Handle such cases by not doing
+=09 * anything during clk_prepare_enable() but handle clk_set_rate()
+=09 * correctly
+=09 */
+=09if (!width)
+=09=09return;
+
+=09mask =3D (GENMASK(width - 1, 0) << shift);
 =09regmap_update_bits(membase, reg, mask, set_val << shift);
 }
=20
 static inline u32 lgm_get_clk_val(struct regmap *membase, u32 reg,
 =09=09=09=09  u8 shift, u8 width)
 {
-=09u32 mask =3D (GENMASK(width - 1, 0) << shift);
+=09u32 mask;
 =09u32 val;
=20
+=09/*
+=09 * Some clocks support parent clock dividers but they do not
+=09 * support clock gating (clk enable/disable). Such types of
+=09 * clocks might call this function with width as 0 during
+=09 * clk_prepare_enable() call. Handle such cases by not doing
+=09 * anything during clk_prepare_enable() but handle clk_set_rate()
+=09 * correctly
+=09 */
+=09if (!width)
+=09=09return 0;
+
 =09if (regmap_read(membase, reg, &val)) {
 =09=09WARN_ONCE(1, "Failed to read clk reg: 0x%x\n", reg);
 =09=09return 0;
 =09}
=20
+=09mask =3D (GENMASK(width - 1, 0) << shift);
 =09val =3D (val & mask) >> shift;
=20
 =09return val;
 }
=20
-
-
 int lgm_clk_register_branches(struct lgm_clk_provider *ctx,
 =09=09=09      const struct lgm_clk_branch *list,
 =09=09=09      unsigned int nr_clk);
--=20
2.17.1

