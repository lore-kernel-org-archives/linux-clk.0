Return-Path: <SRS0=fPJi=XW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C0FC4360C
	for <linux-clk@archiver.kernel.org>; Fri, 27 Sep 2019 18:09:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 65715207FF
	for <linux-clk@archiver.kernel.org>; Fri, 27 Sep 2019 18:09:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="et7G1+BS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbfI0SJ0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Sep 2019 14:09:26 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34837 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727243AbfI0SJZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Sep 2019 14:09:25 -0400
Received: by mail-lf1-f67.google.com with SMTP id w6so2595636lfl.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Sep 2019 11:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:references:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jejcHSERbn5SAMpVOGLOyvx25Sx+RooXXTI/pzL1Mnw=;
        b=et7G1+BS/RHmjb4LzAVZC7eTYdwgwQcTBX1fhr7MxCSlLbgBz35+j+Vfr36sIk7oq0
         nhpEHLKUC+L/i0HjSn1ZxsPq2P9wVp+5LerD21xA44Ho7HhNMwJSwdwS1ZTk3rtdCK5s
         9thWvKfOpln3CQYllgJTGtPAUa8aUDCUqGi9WjFP8UJxXtSSA0pMLZ4mZ8KZwq1UX/Va
         Y3O7iqKkizdWnyop0lCWsQhwGjHn/TgOLJowvcVX7e3wI6hKTSNHyJp3P9SYNQ6yxsnn
         Rq1kCQ1OTVsAX9/3HeznueXedbWv4GOytUG9PiDjQcqMt7WMFuqIUDZBWeU2R6Vca4C5
         f9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jejcHSERbn5SAMpVOGLOyvx25Sx+RooXXTI/pzL1Mnw=;
        b=BkvE09hqctQ3Q4KH3O4fo/ZaEeiauG36hK0cGFBvv+gvvQDTOYGpFrEsWAqWuvIAG8
         OSHD+5owZyBc8SPge7YE9IFUH0FJQBuscIj01UWRJ/a/R37JtQsn+vw+oGxkqif/HTbR
         8edN/elYDl+Qr99uWHON063y3B/7t+FFaOUyARW3iZEVnXytTYN/AMgw36fdsgeoYrZ8
         8d85jw7uUmSq/Rv4xR8StaNHyUNaWc412tlFqG9LHhrzcEzfNIiXy+bC3Iiam0Osl9yz
         Fy/SKJqkQZJZ7aEdv/bsvQrI34IERaqHK+U1RJuM7CwWYS88QuS/3tbC0zTbMauGQChD
         xZAQ==
X-Gm-Message-State: APjAAAXxd+auMuEmjJVhUlE5otzQElV1WgiR6a5USX/iFujBnfPgXLPS
        bhJvRi64e5ZG3N+qYWqWi8Q+UQtR4rU=
X-Google-Smtp-Source: APXvYqz43d57eb5cffb8wUA/C43DxnNI1Z7rDxzcQuFGGQbUNVkM7IWwYlA03yE2SzHIKGmNBeMkqQ==
X-Received: by 2002:ac2:554e:: with SMTP id l14mr3955369lfk.32.1569607764012;
        Fri, 27 Sep 2019 11:09:24 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:8df:57d9:464d:c6f1:f498:da95])
        by smtp.gmail.com with ESMTPSA id z14sm605879lfh.30.2019.09.27.11.09.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 11:09:23 -0700 (PDT)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] clk: renesas: rcar-gen3: allow changing the RPC[D2] clocks
To:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <be27a344-d8bf-9e0c-8950-2d1b48498496@cogentembedded.com>
Date:   Fri, 27 Sep 2019 21:09:21 +0300
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

I was unable to get clk_set_rate() setting a lower RPC-IF clock frequency
and that issue boiled down to me not passing CLK_SET_RATE_PARENT flag to
clk_register_composite() when registering the RPC[D2] clocks...

Fixes: db4a0073cc82 ("clk: renesas: rcar-gen3: Add RPC clocks")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'clk-renesas' branch of Geert Uytterhoeven's
'renesas-drivers.git' repo.

 drivers/clk/renesas/rcar-gen3-cpg.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

Index: renesas/drivers/clk/renesas/rcar-gen3-cpg.c
===================================================================
--- renesas.orig/drivers/clk/renesas/rcar-gen3-cpg.c
+++ renesas/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -464,7 +464,8 @@ static struct clk * __init cpg_rpc_clk_r
 
 	clk = clk_register_composite(NULL, name, &parent_name, 1, NULL, NULL,
 				     &rpc->div.hw,  &clk_divider_ops,
-				     &rpc->gate.hw, &clk_gate_ops, 0);
+				     &rpc->gate.hw, &clk_gate_ops,
+				     CLK_SET_RATE_PARENT);
 	if (IS_ERR(clk)) {
 		kfree(rpc);
 		return clk;
@@ -500,7 +501,8 @@ static struct clk * __init cpg_rpcd2_clk
 
 	clk = clk_register_composite(NULL, name, &parent_name, 1, NULL, NULL,
 				     &rpcd2->fixed.hw, &clk_fixed_factor_ops,
-				     &rpcd2->gate.hw, &clk_gate_ops, 0);
+				     &rpcd2->gate.hw, &clk_gate_ops,
+				     CLK_SET_RATE_PARENT);
 	if (IS_ERR(clk))
 		kfree(rpcd2);
 
