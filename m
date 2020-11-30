Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541BDC64E8A
	for <linux-clk@archiver.kernel.org>; Mon, 30 Nov 2020 08:54:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08CAD207BC
	for <linux-clk@archiver.kernel.org>; Mon, 30 Nov 2020 08:53:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727331AbgK3Ix7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 30 Nov 2020 03:53:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgK3Ix6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 30 Nov 2020 03:53:58 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4219EC0613D2
        for <linux-clk@vger.kernel.org>; Mon, 30 Nov 2020 00:53:18 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id yYt92300d4C55Sk01Yt99w; Mon, 30 Nov 2020 09:53:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kjevl-006uxW-He; Mon, 30 Nov 2020 09:53:09 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kjevl-006a5y-0Z; Mon, 30 Nov 2020 09:53:09 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>
Cc:     Gareth Williams <gareth.williams.jx@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] clk: renesas: r9a06g032: Drop __packed for portability
Date:   Mon, 30 Nov 2020 09:53:03 +0100
Message-Id: <20201130085303.1566901-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The R9A06G032 clock driver uses an array of packed structures to reduce
kernel size.  However, this array contains pointers, which are no longer
aligned naturally, and cannot be relocated on PPC64.  Hence when
compile-testing this driver on PPC64 with CONFIG_RELOCATABLE=y (e.g.
PowerPC allyesconfig), the following warnings are produced:

    WARNING: 136 bad relocations
    c000000000616be3 R_PPC64_UADDR64   .rodata+0x00000000000cf338
    c000000000616bfe R_PPC64_UADDR64   .rodata+0x00000000000cf370
    ...

Fix this by dropping the __packed attribute from the r9a06g032_clkdesc
definition, trading a small size increase for portability.

This increases the 156-entry clock table by 1 byte per entry, but due to
the compiler generating more efficient code for unpacked accesses, the
net size increase is only 76 bytes (gcc 9.3.0 on arm32).

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 4c3d88526eba2143 ("clk: renesas: Renesas R9A06G032 clock driver")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Please take directly (ppc or clk), as this is a build fix.
https://lore.kernel.org/linux-clk/20201128122819.32187696@canb.auug.org.au/

Compile-tested only due to lack of hardware.

 drivers/clk/renesas/r9a06g032-clocks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index d900f6bf53d0b944..892e91b92f2c80f5 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -55,7 +55,7 @@ struct r9a06g032_clkdesc {
 			u16 sel, g1, r1, g2, r2;
 		} dual;
 	};
-} __packed;
+};
 
 #define I_GATE(_clk, _rst, _rdy, _midle, _scon, _mirack, _mistat) \
 	{ .gate = _clk, .reset = _rst, \
-- 
2.25.1

