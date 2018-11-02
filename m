Return-Path: <SRS0=F2gG=NN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_MED,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C90C32789
	for <linux-clk@archiver.kernel.org>; Fri,  2 Nov 2018 19:25:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE1992082E
	for <linux-clk@archiver.kernel.org>; Fri,  2 Nov 2018 19:25:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="P2mbbIE4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE1992082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbeKCEeW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 3 Nov 2018 00:34:22 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39870 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbeKCEeW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 3 Nov 2018 00:34:22 -0400
Received: by mail-lf1-f67.google.com with SMTP id n18so2064150lfh.6
        for <linux-clk@vger.kernel.org>; Fri, 02 Nov 2018 12:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:references:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9ZDr4t8auOL2s2l0/vokJ3YO2nhpAkuEA8w+w0p37gA=;
        b=P2mbbIE4N3HeF7JH46UEpqnR1N6jGHf2eklojliWUxZcVfPPAx8xSOAnbsAJeJcQHZ
         m8Q6ukwOqQ70Q5nlTcIRD0LFtQUk02AGDW7uIUeyie6/mUw0Kf07k9Kg39JYs+urary2
         NhOsHEJHZ3B6R4VDCFty8ZSUYaG0aABX95nDIx6xIw4H4cRf0QzqZoelP7V7bUofYpk4
         pj4RO27xAjOiq5/9Ay5xq1cUg6tXoms9lKXniL0LGNJuf25+dnD4TUZb2KXwRdNBNj2W
         yGT2TxNV2pGQ6kjWExrV58M4EKXFZRvmksJvz05Xa9O2lnNCf2gFY6TOvqh0aKD8o4Bc
         bi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=9ZDr4t8auOL2s2l0/vokJ3YO2nhpAkuEA8w+w0p37gA=;
        b=kXqC/bi4fWOHIQ+58I32ubRL68XhLDE+Cl9B8ruDnBGm7qHAFkhuKyBjrg/JGwnMJj
         fdJ0LTEuZmaynYF3mO3wqH5cTgnrnCPGxvlMaCc4aV8jIfgSonewbWkf5qV8nVgka20W
         Im0gxKIW/bt7jXuyTu7qfiqul5exohSO3HZLAEoB/n5ihnu1WDkoG+ooHvbJR7teaL4a
         /vVg3cHlWHncluwt+62mRvNjwybxuFxXpk3bEVlfQmr6dT/H6cA5Vh7GgR2spF8Y0V/q
         6kUxVYeiYkwejQhwqzHAOHHc0NalN+XG+bWpBXBOGWA4dvc4bq5vlceSvdc1dnTka9P3
         6c9w==
X-Gm-Message-State: AGRZ1gKfJUihnJQFmypC9mpk3x7mKlNPG5/FPC6UqYXOZASIXDaZZMxo
        YsJObTjDFw4CxmPC645Tzm6aImEAxSQ7ZQ==
X-Google-Smtp-Source: AJdET5eBH3gyLqeUjsk/DnHcjn4su7b/n+4inELK9tQ/04J3a64EkTpbo99ikQHW0xkjlzXG09x13w==
X-Received: by 2002:a19:9209:: with SMTP id u9-v6mr7958299lfd.26.1541186756074;
        Fri, 02 Nov 2018 12:25:56 -0700 (PDT)
Received: from wasted.cogentembedded.com ([94.72.11.11])
        by smtp.gmail.com with ESMTPSA id c22sm5242680lfd.88.2018.11.02.12.25.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Nov 2018 12:25:55 -0700 (PDT)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] clk: renesas: r8a77970: add RPC clock
To:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <5a5c65f1-d446-9445-4e2a-579f57f00abf@cogentembedded.com>
Date:   Fri, 2 Nov 2018 22:25:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On R-Car V3M (R8A77970), the RPC/RPCD2 clocks are output by the common
divider. Describe them, as well as the RPC-IF module clock.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'clk-renesas' branch of Geert Uytterhoeven's
'renesas-drivers.git' repo.

 drivers/clk/renesas/r8a77970-cpg-mssr.c |    4 ++++
 1 file changed, 4 insertions(+)

Index: renesas/drivers/clk/renesas/r8a77970-cpg-mssr.c
===================================================================
--- renesas.orig/drivers/clk/renesas/r8a77970-cpg-mssr.c
+++ renesas/drivers/clk/renesas/r8a77970-cpg-mssr.c
@@ -94,6 +94,9 @@ static const struct cpg_core_clk r8a7797
 		 CLK_PLL1_DIV2),
 	DEF_BASE("sd0",	R8A77970_CLK_SD0, CLK_TYPE_R8A77970_SD0, CLK_PLL1_DIV2),
 
+	DEF_FIXED("rpc",	R8A77970_CLK_RPC,   CLK_PLL1_DIV2,  5, 1),
+	DEF_FIXED("rpcd2",	R8A77970_CLK_RPCD2, CLK_PLL1_DIV2, 10, 1),
+
 	DEF_FIXED("cl",		R8A77970_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
 	DEF_FIXED("cp",		R8A77970_CLK_CP,    CLK_EXTAL,	    2, 1),
 
@@ -155,6 +158,7 @@ static const struct mssr_mod_clk r8a7797
 	DEF_MOD("gpio1",		 911,	R8A77970_CLK_CP),
 	DEF_MOD("gpio0",		 912,	R8A77970_CLK_CP),
 	DEF_MOD("can-fd",		 914,	R8A77970_CLK_S2D2),
+	DEF_MOD("rpc-if",		 917,	R8A77970_CLK_RPC),
 	DEF_MOD("i2c4",			 927,	R8A77970_CLK_S2D2),
 	DEF_MOD("i2c3",			 928,	R8A77970_CLK_S2D2),
 	DEF_MOD("i2c2",			 929,	R8A77970_CLK_S2D2),
