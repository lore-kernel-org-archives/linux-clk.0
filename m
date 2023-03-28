Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F89C76196
	for <linux-clk@archiver.kernel.org>; Tue, 28 Mar 2023 03:39:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232488AbjC1DjS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Mar 2023 23:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231841AbjC1DjQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Mar 2023 23:39:16 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DA1F171E
        for <linux-clk@vger.kernel.org>; Mon, 27 Mar 2023 20:39:15 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id e21so11115423ljn.7
        for <linux-clk@vger.kernel.org>; Mon, 27 Mar 2023 20:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112; t=1679974753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+teYGhMbJ/qz9LQzLhsSWOaFjw154Q/LczJdwFN1UeE=;
        b=F25dTMryVlQgpQKpjDgvxzOxrW0aEVP+Jq/+lByoYVS4zsu4zkgCJDRkE1d60fMccI
         U2JOv0BB7HitFjCJ7FNotbGPYdFO3+qc1LUidTvGZmaIEoJAdCxMbHGY6sFK67fqTa8D
         wA6nqM6YJpJqaUQsHT0d+grlxH3eBNSTK3d/Jne867T6UGBPA0McqjIrs6H2OxOBiHVT
         lkxmZyDkc1gc2ONr6Aupt+KVjw4o1zXiN+cL00c6b7xcZI6WLjnDaoMD4d6S7bRqNrfw
         49xt5E4eyIFwFj+EkD22/H4x23prEI3eQWCIDWf1idGAd3kmYWna6PNMNa/jAPqG2oRq
         bi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679974753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+teYGhMbJ/qz9LQzLhsSWOaFjw154Q/LczJdwFN1UeE=;
        b=kr285cDHQP1MUPb65iKn1c/ieUji6oOcnBMY6LLD57FYBT7tN0dZqi6P0G/vh+BnTQ
         AE9NQ7Tz83jytCgwl4d+aNxqB/KQDTnHxir91RfETB3sXbs98KmX1je+qcy5x4Mm1M/l
         8uKbGdYH9pmCFgHzsNn3vkkXzqX51rHhFkA7pJR0t3cBWH7EdrmuNXvhVhYrIM0CMRDh
         sqquI+FnccUvdSDLSxrOAWdsuQ9CmfkIR594okrrKWjnFlpTCj3USOIk1WCZGJGsyGdM
         +BLGYo0nm/sHEOwiqLH0iXxZG58gao0a5iqasrBIPXwU2Ryyqx4zY4IFUqqQSbnvE4kY
         sJjw==
X-Gm-Message-State: AAQBX9e+23HJq/Y6bLrFEaroaBZJAydP3azXGr751VBPjmAKWqdke8wt
        j/idZs7ZglBDraBiD6oqItKPhg==
X-Google-Smtp-Source: AKy350ZXmlguZVLGLGK8nHVPZeZlcJTzhlT/xD/9+u+W4Dc/kdvYAValjAG/AN1/BfQqHwd4pZb1UA==
X-Received: by 2002:a2e:868c:0:b0:298:9b8d:cc17 with SMTP id l12-20020a2e868c000000b002989b8dcc17mr4391050lji.9.1679974753652;
        Mon, 27 Mar 2023 20:39:13 -0700 (PDT)
Received: from cobook.lan ([85.193.119.48])
        by smtp.gmail.com with ESMTPSA id r10-20020a2eb60a000000b002945b851ea5sm4865094ljn.21.2023.03.27.20.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 20:39:13 -0700 (PDT)
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH] clk: renesas: r8a77980: Add i2c5 clock
Date:   Tue, 28 Mar 2023 09:39:02 +0600
Message-Id: <20230328033902.830269-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The MSSR clock definition for i2c5 was missing. Add it.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/clk/renesas/r8a77980-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a77980-cpg-mssr.c b/drivers/clk/renesas/r8a77980-cpg-mssr.c
index 01ea09891b32..2f21a8725907 100644
--- a/drivers/clk/renesas/r8a77980-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77980-cpg-mssr.c
@@ -206,6 +206,7 @@ static const struct mssr_mod_clk r8a77980_mod_clks[] __initconst = {
 	DEF_MOD("gpio0",		 912,	R8A77980_CLK_CP),
 	DEF_MOD("can-fd",		 914,	R8A77980_CLK_S3D2),
 	DEF_MOD("rpc-if",		 917,	R8A77980_CLK_RPCD2),
+	DEF_MOD("i2c5",			 919,	R8A77980_CLK_S0D6),
 	DEF_MOD("i2c4",			 927,	R8A77980_CLK_S0D6),
 	DEF_MOD("i2c3",			 928,	R8A77980_CLK_S0D6),
 	DEF_MOD("i2c2",			 929,	R8A77980_CLK_S3D2),
-- 
2.30.2

