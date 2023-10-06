Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C63E81E19
	for <linux-clk@archiver.kernel.org>; Fri,  6 Oct 2023 16:40:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232738AbjJFQkn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Oct 2023 12:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232496AbjJFQkn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Oct 2023 12:40:43 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2567FC2;
        Fri,  6 Oct 2023 09:40:40 -0700 (PDT)
Date:   Fri, 6 Oct 2023 18:40:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1696610438;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xJK9V2VtLPnBrImfjMOmFTNsUiDy1Y0fI2z1sk+3JmU=;
        b=1uoOGzSonar2EkeoparSKR9fpxQO4KWP9mczppZnHMlBSeaTPqCqtigTWCZJ3XFCDtecad
        G1L9RRBTaWv+ds1u7J9/x8WnhL9MLdYkDkGHszVTd7pRYndKjWotV/GG1dQR5rEi2G3M3d
        v53c4q7xCOmH/13Sp/ylOVcRhFfWVQIoDzcNAHI4iiegIkFvgd1CyFpKLHaKe/8OtVXQid
        SeqnVVChA8exJYD9p/KbyIxL1zF7DgcFO16wPwuNE0tTnEmlGjY5EyR9KC1rth3Z1vRIGT
        XA3MNp2PhpBSY4GQERrXN6APSzbjwntKvCYRguDWYNWjFYut3XC8880gxIwiaw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1696610438;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xJK9V2VtLPnBrImfjMOmFTNsUiDy1Y0fI2z1sk+3JmU=;
        b=74pAOyjNU+plxaJMGG2ktItK+APbVyqDvDy1lePId2QUmYEWVnhs5OppTY+ms9MDHHfPQ9
        zKL2rsyKf7o9yMCA==
From:   Benedikt Spranger <b.spranger@linutronix.de>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH 1/1] clk: socfpga: gate: Fix of by factor 2 for serial
 console
Message-ID: <20231006184020.7fb6f509@mitra>
In-Reply-To: <ujs6kaisllqu3qzm76qkwpmdy2vnulp6z742ooclbsdz36zl5f@m7ujgar4pwqs>
References: <20231005095927.12398-1-b.spranger@linutronix.de>
        <20231005095927.12398-2-b.spranger@linutronix.de>
        <qpskbgigcaoyjuhzeguz366cjukv3ij7utlbkra5edhwn6uzh4@bdedm6vs62y5>
        <20231005203202.08b5d1cf@mitra>
        <ujs6kaisllqu3qzm76qkwpmdy2vnulp6z742ooclbsdz36zl5f@m7ujgar4pwqs>
Organization: Linutronix GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 6 Oct 2023 17:01:34 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Thu, Oct 05, 2023 at 08:32:23PM +0200, Benedikt Spranger wrote:
> > On Thu, 5 Oct 2023 13:34:01 +0200
> > Maxime Ripard <mripard@kernel.org> wrote:
> > 
> > > Where is that factor 2 coming from?
> > In drivers/tty/serial/8250/8250_dw.c p->uartclk is set twice as high,
> > as it should be: 
> > 
> > dw8250_set_termios() is called and rate is evaluated to 20000000 in the
> > bad and 10000000 in the good case. As a result p->uartclk is set to
> > 20000000 in the bad case.
> 
> Sure, sorry I worded that poorly. What I meant was what clock tree
> decision is taken now that wasn't taken before that leads to that factor
> 2 difference.
OK.

> Thanks for the traces, that's helpful. It looks like the culprit is:
> 
> Good:
> 
>             init-1       [001] .....     0.125643: clk_rate_request_start: l4_sp_clk min 0 max 4294967295, parent per_base_clk (200000000)
>             init-1       [001] .....     0.125651: clk_rate_request_done: l4_sp_clk min 0 max 4294967295, parent per_base_clk (200000000)
>             init-1       [001] .....     0.125657: dw8250_set_termios: dw8250_set_termios: rate = 200000000 newrate = 1843200
> 
> vs Bad:
> 
>             init-1       [001] .....     0.116063: clk_rate_request_start: l4_sp_clk min 0 max 4294967295, parent per_base_clk (200000000)
>             init-1       [001] .....     0.116089: clk_rate_request_done: l4_sp_clk min 0 max 4294967295, parent per_base_clk (200000000)
>             init-1       [001] .....     0.116096: dw8250_set_termios: dw8250_set_termios: rate = 4294967274 newrate = 1843200
> 
> The rate returned is super suspicious, as it's an -EINVAL casted into an
> unsigned long. So I think something on that clock chain is returning an
> error for some reason, which is then treated as a rate by the rest and
> everybody's just confused.
OK.

> What is the board that you're using?
I am using a Cyclone5 DE0-Nano-Soc/Atlas board
(socfpga_cyclone5_de0_nano_soc.dts). 

Regards
    Benedikt Spranger
