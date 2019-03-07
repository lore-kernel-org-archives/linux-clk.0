Return-Path: <SRS0=2CmL=RK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB42C4360F
	for <linux-clk@archiver.kernel.org>; Thu,  7 Mar 2019 19:53:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D64820675
	for <linux-clk@archiver.kernel.org>; Thu,  7 Mar 2019 19:53:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="b+FR1ejK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbfCGTxY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Mar 2019 14:53:24 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34048 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726172AbfCGTxX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Mar 2019 14:53:23 -0500
Received: by mail-lj1-f194.google.com with SMTP id l5so15370004lje.1
        for <linux-clk@vger.kernel.org>; Thu, 07 Mar 2019 11:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:references:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g9M43El7SuHdJ092C/Cq5P1tzW62nPCU8JFHYMuTAeU=;
        b=b+FR1ejK4aeXfLSwn/PXrZ9vbfiORLj2zPEeCiC573Dy3KXaCCoGse2NGcV94D96jO
         q00tpeQHAB+K8SzttR6XqAesWTwRqlxq56/EO42ioSXC4pVMjkSIPnap80Jl+jFNaLx2
         nIVp1VViVA9FQdyPUQkcKfhmOjHPl5lDJxGVwJ3iJkFSSADB0FHjy7Gfh+NyB3oK8sGZ
         yezb8q/ERxog2nW+8g39lDV/Xe0hAixG+LXOWT4VonYeaRZUBoMlVvd53RTt86VEwF1y
         x8ZCEWBn5L1/UQtzlsZqLO1lmtWzhAX4rdLLVT43wlDv1u/pOr8EHp0iYXl6um7cUrNR
         F/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=g9M43El7SuHdJ092C/Cq5P1tzW62nPCU8JFHYMuTAeU=;
        b=m2aHEOrCZ/Hh8LfJhxEfUcUdSy+aTGYtRkrW/P/1Xi8RQymrWHyOQ+IWPp9PNyFrxU
         IjeDVABEYBJo6GroL3KXu7Fkvih1vrcREJ/c0WueR+h8fQHEs05nwjy+yDdTwnZI6Mpm
         i1weBLxud7mcsNVg1sseKpeqf7GBqIPbB40B/G6gdejy469YGn4KvnYFmqCF9w0nxcGi
         68NOp76waoPC3zNUapUNz09fNb/qtnXaYplL6R6rfxahkwx8leBvRbqL4GYsSVBLo4HI
         1ZUHrKsWYMwSs93TxbgxPJ8tgqRo2ihZDYwE0gId5L40O1ege5zExkDm9iQkvvMJNo4I
         +otw==
X-Gm-Message-State: APjAAAU8HelZRHtPi7oHA6CZ86hPfckBg41yNZaFX1iIqTjrcL3KovPs
        L8uvOkV44i+axgK8jH39UmI94Jsiqio=
X-Google-Smtp-Source: APXvYqxA38Znn+8CKsB1BjtM3Lh3KMtCOW0COFeI2Jy4g+yTZWdZ1w0SpjPjzLAevuVT24BODgdYTw==
X-Received: by 2002:a2e:161b:: with SMTP id w27mr4105083ljd.40.1551988401324;
        Thu, 07 Mar 2019 11:53:21 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.80.179])
        by smtp.gmail.com with ESMTPSA id d12sm1090199lja.72.2019.03.07.11.53.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Mar 2019 11:53:20 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] clk: renesas: r8a77980-cpg-mssr: fix RPC-IF module clock's
 parent
To:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <ebc41558-2a0a-bf6d-05df-077e3c769344@cogentembedded.com>
Date:   Thu, 7 Mar 2019 22:53:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Testing has shown that the RPC-IF module clock's parent is the RPCD2 clock,
not the RPC one -- the RPC-IF register reads stall otherwise...

Fixes: 94e3935b5756 ("clk: renesas: r8a77980: Add RPC clocks")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'clk-renesas' branch of Geert Uytterhoeven's
'renesas-drivers.git' repo.

 drivers/clk/renesas/r8a77980-cpg-mssr.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: renesas-drivers/drivers/clk/renesas/r8a77980-cpg-mssr.c
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/r8a77980-cpg-mssr.c
+++ renesas-drivers/drivers/clk/renesas/r8a77980-cpg-mssr.c
@@ -171,7 +171,7 @@ static const struct mssr_mod_clk r8a7798
 	DEF_MOD("gpio1",		 911,	R8A77980_CLK_CP),
 	DEF_MOD("gpio0",		 912,	R8A77980_CLK_CP),
 	DEF_MOD("can-fd",		 914,	R8A77980_CLK_S3D2),
-	DEF_MOD("rpc-if",		 917,	R8A77980_CLK_RPC),
+	DEF_MOD("rpc-if",		 917,	R8A77980_CLK_RPCD2),
 	DEF_MOD("i2c4",			 927,	R8A77980_CLK_S0D6),
 	DEF_MOD("i2c3",			 928,	R8A77980_CLK_S0D6),
 	DEF_MOD("i2c2",			 929,	R8A77980_CLK_S3D2),
