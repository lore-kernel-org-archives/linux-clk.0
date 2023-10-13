Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8803CDB47E
	for <linux-clk@archiver.kernel.org>; Fri, 13 Oct 2023 08:32:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbjJMIcv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Oct 2023 04:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbjJMIcv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Oct 2023 04:32:51 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE163A9
        for <linux-clk@vger.kernel.org>; Fri, 13 Oct 2023 01:32:49 -0700 (PDT)
Date:   Fri, 13 Oct 2023 10:32:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1697185968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=am7bF2zu0ng0HDWcqGv8ZcWnS0tcjvSpyG5v/0k4YfM=;
        b=iP/YVXhRo0aYKREzd3rkSMu5SCoFP8CIDSa19WKvpefpnwZEZA0aB1OhBqW8Gk5sPkNogH
        A6zNRW7seSbP4v8n/UtRFXVN4NF9LXhkZuRzIX0jGpk7ekf/okUQHsX3VhzQpRfGw7R3c3
        CTMy3jKt24EgVUznfE7FMRjnbqoXeM8qkG4oVMsWB63lkvPVCrD+N9v8szytWc2udmqt0L
        kgAK1TDcoYkjvGDVEXXDRsTg+/hn0T+Q33Kt/fmIBkWKJr+Av9ZYN+KtrVApuVUFf+oI+3
        EFFyH4n7/xspuPLDa3AtWrnC8EGXOODquc4/FTbq/HgPYY6MOfB5s92Mu76x/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1697185968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=am7bF2zu0ng0HDWcqGv8ZcWnS0tcjvSpyG5v/0k4YfM=;
        b=w4V/ZEU2i/F/ZPbM6ulYjiWMWBnJW44ICaER56FQB+VLidP6CKdLmQqJG8Q2tEqSQJDCby
        RUMhBQYW4uZBA+Aw==
From:   Benedikt Spranger <b.spranger@linutronix.de>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: socfpga: gate: Account for the divider in
 determine_rate
Message-ID: <20231013103246.17ba3576@mitra>
In-Reply-To: <20231012083729.2148044-1-mripard@kernel.org>
References: <20231012083729.2148044-1-mripard@kernel.org>
Organization: Linutronix GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Thu, 12 Oct 2023 10:37:29 +0200
schrieb Maxime Ripard <mripard@kernel.org>:

> Commit 9607beb917df ("clk: socfpga: gate: Add a determine_rate hook")
> added a determine_rate implementation set to the
> clk_hw_determine_rate_no_reparent, but failed to account for the
> internal divider that wasn't used before anywhere but in recalc_rate.
> 
> This led to inconsistencies between the clock rate stored in
> clk_core->rate and the one returned by clk_round_rate() that leverages
> determine_rate().
> 
> Since that driver seems to be widely used (and thus regression-prone)
> and not supporting rate changes (since it's missing a .set_rate
> implementation), we can just report the current divider programmed in
> the clock but not try to change it in any way.
> 
> This should be good enough to fix the issues reported, and if someone
> ever wants to allow the divider to change then it should be easy enough
> using the clk-divider helpers.
> 
> Link: https://lore.kernel.org/linux-clk/20231005095927.12398-2-b.spranger@linutronix.de/
> Fixes: 9607beb917df ("clk: socfpga: gate: Add a determine_rate hook")
> Reported-by: Benedikt Spranger <b.spranger@linutronix.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

To compile the patch I need that minor fix:

diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/clk-gate.c
index 486a4d84e418..0a5a95e0267f 100644
--- a/drivers/clk/socfpga/clk-gate.c
+++ b/drivers/clk/socfpga/clk-gate.c
@@ -116,7 +116,7 @@ static unsigned long socfpga_clk_recalc_rate(struct clk_hw *hwclk,
 }


-static int socfpga_clk_determine_rate(struct clk_hw *hw,
+static int socfpga_clk_determine_rate(struct clk_hw *hwclk,
                                      struct clk_rate_request *req)
 {
        struct socfpga_gate_clk *socfpgaclk =
        to_socfpga_gate_clk(hwclk);


Thanks for the fix and your work.

Tested-by: Benedikt Spranger <b.spranger@linutronix.de>
