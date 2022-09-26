Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C42C07E9D
	for <linux-clk@archiver.kernel.org>; Mon, 26 Sep 2022 16:12:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236033AbiIZQMv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Sep 2022 12:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235601AbiIZQMW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Sep 2022 12:12:22 -0400
X-Greylist: delayed 489 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 26 Sep 2022 08:00:11 PDT
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6803167E4
        for <linux-clk@vger.kernel.org>; Mon, 26 Sep 2022 08:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=eps/qtVKZZiETKIoPGE0JYH5ImQxLrY9fkg2zrYU1/k=; b=JzxnJJxgwG5XmfiI0bDH6sJMOj
        pjwygxysLWGESDr6G6K/Ug7FUoMtIUwkoShEeh2pNvv7MSj0zJtmlrhaBWnvQmhkzSO12MWgM9mp2
        v2ejH26UC/eu0n8UzuLQWiofrsLtJo3Fz5IuCWnTKF5jPwG95OVa3dbuDoMik87oTC/al5nYHLq86
        xAdq5jucEblUqfK37/VQQvIcyBU66zRvXmy17iYUVA7ZV0w2BwbgZ0vFXEr4AuPvyfFSth3M185X2
        alWNqtQK+CRoYxe4cNNaL13pC34hyVE2ml+fX9we8j1Snqug7vvXI/MmruRhe6HkFeBrr3N5LPGZN
        P+cEl5gg==;
Received: from [2a01:799:961:d200:3946:6b45:3eef:d112] (port=58956)
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1ocpSh-0002Kn-8C; Mon, 26 Sep 2022 16:51:59 +0200
Message-ID: <61777940-b892-1e39-d9f1-4af9d3b31e4b@tronnes.org>
Date:   Mon, 26 Sep 2022 16:51:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH] clk: bcm2835: Make peripheral PLLC critical
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        Stefan Wahren <stefan.wahren@i2se.com>,
        linux-rpi-kernel@lists.infradead.org
References: <20220926084509.12233-1-maxime@cerno.tech>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220926084509.12233-1-maxime@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



Den 26.09.2022 10.45, skrev Maxime Ripard:
> When testing for a series affecting the VEC, it was discovered that
> turning off and on the VEC clock is crashing the system.
> 
> It turns out that, when disabling the VEC clock, it's the only child of
> the PLLC-per clock which will also get disabled. The source of the crash
> is PLLC-per being disabled.
> 
> It's likely that some other device might not take a clock reference that
> it actually needs, but it's unclear which at this point. Let's make
> PLLC-per critical so that we don't have that crash.
> 
> Reported-by: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Acked-by: Noralf Trønnes <noralf@tronnes.org>
