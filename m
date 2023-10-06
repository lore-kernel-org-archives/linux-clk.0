Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34FCDE92FDE
	for <linux-clk@archiver.kernel.org>; Fri,  6 Oct 2023 03:39:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjJFDjM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Oct 2023 23:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbjJFDjL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Oct 2023 23:39:11 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7B3DB;
        Thu,  5 Oct 2023 20:39:09 -0700 (PDT)
Date:   Fri, 6 Oct 2023 05:39:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1696563547;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y8gM+5bxgcjLBwjx6eiNsY111P2+A8NBDT1mBtA5yyo=;
        b=KW1MHQI0yb22k6g0oHz61UQiSGNbsUYUSK0J/7eaMiIexsb9ZS2FwiXI8YSRDnFMzBn4MW
        cN22jQ9ok1sWEIWAHWFBQE2mzwVwvnSEbsj9dVurLd3x61gDNp8vevkAWsfo4aEVsj27zx
        Q/YXmlQLiSTgcVykKtQM1dz6/SCp2r4PJQU1c2wgnNanQYFoyQoY8HUjbD+bDrVFz2Ttn/
        KyvhztZEfAt0TIWNa0wu9YdqQoP+vANkWEc52E1Wd7lHMjBHUbLnbg5gLeIQX1sIrDvnYV
        CemQDB/NyQM1V8/11uNVsPEr4MkX/nqk2VEvQQCiCNJ+9tMy6z0guo4xAWKRWA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1696563547;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y8gM+5bxgcjLBwjx6eiNsY111P2+A8NBDT1mBtA5yyo=;
        b=bNCmbpBIEcFp+V3vBpVGtEpl81sllI2MPzb45Hn/BpNWkqKPRuAFJJpTZB/ioxiYC6hsQf
        AtCjiG9GM8VybECQ==
From:   Benedikt Spranger <b.spranger@linutronix.de>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH 1/1] clk: socfpga: gate: Fix of by factor 2 for serial
 console
Message-ID: <20231006053906.1bb2a7d8@mitra>
In-Reply-To: <77d94f6a6a4b45f8ad711f52ca6ba86c.sboyd@kernel.org>
References: <20231005095927.12398-1-b.spranger@linutronix.de>
        <20231005095927.12398-2-b.spranger@linutronix.de>
        <qpskbgigcaoyjuhzeguz366cjukv3ij7utlbkra5edhwn6uzh4@bdedm6vs62y5>
        <20231005203202.08b5d1cf@mitra>
        <77d94f6a6a4b45f8ad711f52ca6ba86c.sboyd@kernel.org>
Organization: Linutronix GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 05 Oct 2023 14:03:19 -0700
Stephen Boyd <sboyd@kernel.org> wrote:

> What's your analysis?
Commit 9607beb917df ("clk: socfpga: gate: Add a determine_rate hook")
breaks serial console output and changing the determine_rate hook to 
__clk_mux_determine_rate() fix the issue.
 
> Does this patch also fix it?
> 
> ---8<---
> diff --git a/drivers/clk/socfpga/clk-gate.c
> b/drivers/clk/socfpga/clk-gate.c index 8dd601bd8538..b3400d2d8128
> 100644 --- a/drivers/clk/socfpga/clk-gate.c
> +++ b/drivers/clk/socfpga/clk-gate.c
> @@ -173,6 +173,7 @@ void __init socfpga_gate_init(struct device_node
> *node) if (init.num_parents < 2) {
>  		ops->get_parent = NULL;
>  		ops->set_parent = NULL;
> +		ops->determine_rate = NULL;
>  	}
>  
>  	init.parent_names = parent_name;

No. serial console is broken too.

Regards
    Benedikt Spranger
