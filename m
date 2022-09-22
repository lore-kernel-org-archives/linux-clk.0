Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B38DC6FA8B
	for <linux-clk@archiver.kernel.org>; Thu, 22 Sep 2022 06:25:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbiIVGZK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Sep 2022 02:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbiIVGY6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Sep 2022 02:24:58 -0400
Received: from us-smtp-delivery-115.mimecast.com (us-smtp-delivery-115.mimecast.com [170.10.129.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A71ABD4E
        for <linux-clk@vger.kernel.org>; Wed, 21 Sep 2022 23:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
        s=selector; t=1663827895;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BtUJUYZOy4dsKmtYSOJkIch/jexIUqRsQ+FbLNIyJJQ=;
        b=BOVUj4qBnxf+dMBSKLTTLgtwpxAhMz79Z4HVPr4aPFRQvK/Zid3tTSMzxskQqPo1pZb7pO
        S3O+wuXiAdeZTW1pLI+NnxKFsIXmmQcYjIB61BWtqoUH0Li6vhf2VIfobDVGVhJKQc89tW
        mBRCS5DXTNycJ/6+9BW5HrRVTgWSwMf//fUmxXjrkX5LZptTCRRirLWA7xfGTAXxcE6G+J
        ci8uhNvXB2lce2LKlQXW+9vT6HZlMLsWdLDINpKfkQUxWTB39yztW5o7M0M5bSdqUgGuUQ
        9FARP5DHMZqVlxoE7FF+cAU2wI6UCXzjFQUFByVyCSxfgbdJgkr2pBX+jYCg1A==
Received: from mail.maxlinear.com (174-47-1-83.static.ctl.one [174.47.1.83])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 us-mta-387-Qz4s7qjMOKKbkb33FezZmg-1; Thu, 22 Sep 2022 02:24:54 -0400
X-MC-Unique: Qz4s7qjMOKKbkb33FezZmg-1
Received: from sgsxdev001.isng.phoenix.local (10.226.81.111) by
 mail.maxlinear.com (10.23.38.120) with Microsoft SMTP Server id 15.1.2375.24;
 Wed, 21 Sep 2022 23:24:51 -0700
From:   Rahul Tanwar <rtanwar@maxlinear.com>
To:     <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <linux-clk@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-lgm-soc@maxlinear.com>,
        "Rahul Tanwar" <rtanwar@maxlinear.com>
Subject: [PATCH RESEND v2 5/5] clk: mxl: Add a missing flag to allow parent clock rate change
Date:   Thu, 22 Sep 2022 14:24:28 +0800
Message-ID: <73cdb7cb3919b29a41a52da4904b1273bd81c7fe.1663827071.git.rtanwar@maxlinear.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1663827071.git.rtanwar@maxlinear.com>
References: <cover.1663827071.git.rtanwar@maxlinear.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: maxlinear.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

One of the clock entry "dcl" clk's rate can only be changed by
changing its parent's clock rate. But it was missing to have
CLK_SET_RATE_PARENT flag as enabled.

Add/enable CLK_SET_RATE_PARENT flag for dcl clk in order to
allow its clk rate to be changed via its parent's clk.

Signed-off-by: Rahul Tanwar <rtanwar@maxlinear.com>
---
 drivers/clk/x86/clk-lgm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/x86/clk-lgm.c b/drivers/clk/x86/clk-lgm.c
index e312af42e97a..34e16ea90596 100644
--- a/drivers/clk/x86/clk-lgm.c
+++ b/drivers/clk/x86/clk-lgm.c
@@ -255,7 +255,7 @@ static const struct lgm_clk_branch lgm_branch_clks[] =
=3D {
 =09LGM_FIXED(LGM_CLK_SLIC, "slic", NULL, 0, CGU_IF_CLK1,
 =09=09  8, 2, CLOCK_FLAG_VAL_INIT, 8192000, 2),
 =09LGM_FIXED(LGM_CLK_DOCSIS, "v_docsis", NULL, 0, 0, 0, 0, 0, 16000000, 0)=
,
-=09LGM_DIV(LGM_CLK_DCL, "dcl", "v_ifclk", 0, CGU_PCMCR,
+=09LGM_DIV(LGM_CLK_DCL, "dcl", "v_ifclk", CLK_SET_RATE_PARENT, CGU_PCMCR,
 =09=0925, 3, 0, 0, 0, 0, dcl_div),
 =09LGM_MUX(LGM_CLK_PCM, "pcm", pcm_p, 0, CGU_C55_PCMCR,
 =09=090, 1, CLK_MUX_ROUND_CLOSEST, 0),
--=20
2.17.1

