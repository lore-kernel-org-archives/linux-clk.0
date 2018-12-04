Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B583FC04EBF
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 19:52:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A6522082B
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 19:52:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="MvFEvWx8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A6522082B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbeLDTwq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 14:52:46 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34766 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbeLDTwp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 14:52:45 -0500
Received: by mail-lf1-f68.google.com with SMTP id p6so12913615lfc.1
        for <linux-clk@vger.kernel.org>; Tue, 04 Dec 2018 11:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:references:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=clxCSVOoVrDQ6qklc+2R2m+J9+4S5VWMRbJpGgKyiPk=;
        b=MvFEvWx8sjwC0FvUXh5GQmoBMLPKgImsEHqD9C+YdK8Br0wXbvjCMp+uzdotzx+ihB
         rensIZlEUdaxIMhoQumQkTKB4Zhfo/k/MOTOOmPiIq5rtRq0TIrKZnXlrZ1ZsgUqiKNc
         G8CT8hPEoso2S77fgdYdiu0FZIruoDpQYxOoizklcu0rBHMA+VuKEteKapm27OrVxjbf
         SbRJT1LjOEXeb06eRZuwfjYBs2KnCpIhmUGoRGsCfIWo2OZdWhFbHAU8LE/dQA/U+Ebt
         ztnZ4r35EPDveKFS/2jN0g/IavLEMuv0Jo2vj6/6Y+vwZIqydyROAJ9CCEdKIwvN1zoO
         gO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=clxCSVOoVrDQ6qklc+2R2m+J9+4S5VWMRbJpGgKyiPk=;
        b=VspA7Flj0m58Osx+l39kL3C6KsR1OPdzPjWOMe6ZCU2++Rzr7oSjEhJ2hdcEp0FCPs
         9eVBgTMakn1NdleM3MxuHaCx3nFFXH/uuakYMU4WWljvm+qOUU8z9/DLW6qz0waEkLOy
         35BKQw8tYBjt/+1CKI3Fwf6tCtLwYQjCkWV5RalYfIGafwoasYGdS/BN7pBQXK6I+ISa
         uMMGosoxjbfGdyWczOpVB8EJ02PizyC5Un5VNFBrnVElE+HikS32su/POTKZ0cSyssPc
         9DsecIEydf9i4dCTdjhHG580ON1BfMvT5D4YQU5qV/OiWc2M88QlEHmu4kRHK7FaziF9
         KWCw==
X-Gm-Message-State: AA+aEWZLzfTCTaZ4Z/oXTUTUlCNIVBHMB22gQKn48hYx+go6qROf2jJv
        YMuKB49i9mHRS7Mlqjvft7XAGQVaVRE=
X-Google-Smtp-Source: AFSGD/VM30q90y5ngsyXhBLDUPsRmUeIwknWyokVYB5iFfXZpkRzJrJJqE4eha4yH5gwX8vRpuoe9w==
X-Received: by 2002:a19:d242:: with SMTP id j63mr13502219lfg.26.1543953163368;
        Tue, 04 Dec 2018 11:52:43 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.250])
        by smtp.gmail.com with ESMTPSA id g70-v6sm3374047ljg.92.2018.12.04.11.52.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Dec 2018 11:52:42 -0800 (PST)
Subject: [PATCH v2 4/4] clk: renesas: r8a77980-cpg-mssr: add RPC clocks
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <c4921d75-3e1a-80a5-10ce-12671bffddd5@cogentembedded.com>
Date:   Tue, 4 Dec 2018 22:52:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
as well as the RPC-IF module clock, in the R-Car V3H (R8A77980) CPG/MSSR
driver.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- moved the RPCSRC clock support to the R-Car gen3 CPG patch adding the RPC
  clocks;
- rewrote the patch description.

 drivers/clk/renesas/r8a77980-cpg-mssr.c |    8 ++++++++
 1 file changed, 8 insertions(+)

Index: renesas-drivers/drivers/clk/renesas/r8a77980-cpg-mssr.c
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/r8a77980-cpg-mssr.c
+++ renesas-drivers/drivers/clk/renesas/r8a77980-cpg-mssr.c
@@ -41,6 +41,7 @@ enum clk_ids {
 	CLK_S2,
 	CLK_S3,
 	CLK_SDSRC,
+	CLK_RPCSRC,
 	CLK_OCO,
 
 	/* Module Clocks */
@@ -65,8 +66,14 @@ static const struct cpg_core_clk r8a7798
 	DEF_FIXED(".s2",	CLK_S2,		   CLK_PLL1_DIV2,  4, 1),
 	DEF_FIXED(".s3",	CLK_S3,		   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED(".sdsrc",	CLK_SDSRC,	   CLK_PLL1_DIV2,  2, 1),
+	DEF_BASE(".rpcsrc",	CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
 	DEF_RATE(".oco",	CLK_OCO,           32768),
 
+	DEF_BASE("rpc",		R8A77980_CLK_RPC, CLK_TYPE_GEN3_RPC,
+		 CLK_RPCSRC),
+	DEF_BASE("rpcd2",	R8A77980_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
+		 R8A77980_CLK_RPC),
+
 	/* Core Clock Outputs */
 	DEF_FIXED("ztr",	R8A77980_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED("ztrd2",	R8A77980_CLK_ZTRD2, CLK_PLL1_DIV2, 12, 1),
@@ -164,6 +171,7 @@ static const struct mssr_mod_clk r8a7798
 	DEF_MOD("gpio1",		 911,	R8A77980_CLK_CP),
 	DEF_MOD("gpio0",		 912,	R8A77980_CLK_CP),
 	DEF_MOD("can-fd",		 914,	R8A77980_CLK_S3D2),
+	DEF_MOD("rpc-if",		 917,	R8A77980_CLK_RPC),
 	DEF_MOD("i2c4",			 927,	R8A77980_CLK_S0D6),
 	DEF_MOD("i2c3",			 928,	R8A77980_CLK_S0D6),
 	DEF_MOD("i2c2",			 929,	R8A77980_CLK_S3D2),

