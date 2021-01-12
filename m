Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1703CC43381
	for <linux-clk@archiver.kernel.org>; Tue, 12 Jan 2021 19:31:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDAA62310A
	for <linux-clk@archiver.kernel.org>; Tue, 12 Jan 2021 19:31:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437129AbhALTbg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Jan 2021 14:31:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:49946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436646AbhALTbf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 12 Jan 2021 14:31:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3258E22DFA;
        Tue, 12 Jan 2021 19:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610479855;
        bh=WgolaYx4rbZPxU9P/Bog8n07DJNfBjkIOY5FfolVGxc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Zpnc6rQZzjvCYiEHol8suiAMvF0vOx+97yUuUWWFutEcu4qx/cvo7BXgRbcuwZcLu
         RX3wphPp5+kxOTNcd3mmqtr8B2TGiM78jdUdQUDGFAHkiYeD994md2jefjQhZ/CwVP
         aneOWtmr+dK+YM/3TPBzBYIRisFjQPPfoqSCk4xesj4/uVlLtFmKtZOt/tJZw1pl1J
         OC6NxG5x4tnFfV7zi8KiXyUfjpqpAGZSl262mJVtaTHLpGYobc2G94GjQHJ6F4qPAt
         FqrRZ+Y3MWc42kabd9OfQTuF8+pTvhGu9ByvKdYPGwsq3CZpzaxHCKNTtjCEo4sRJy
         qL+IdinB3XNVw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210107023304.24442-1-rdunlap@infradead.org>
References: <20210107023304.24442-1-rdunlap@infradead.org>
Subject: Re: [PATCH] linux/clk.h: use correct kernel-doc notation for 2 functions
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mike Turquette <mturquette@linaro.org>,
        Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Date:   Tue, 12 Jan 2021 11:30:54 -0800
Message-ID: <161047985402.3661239.16161443773537998218@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Randy Dunlap (2021-01-06 18:33:04)
> Fix kernel-doc notation for 2 functions so that the generated
> html is correct. Currently it skips all text between the
> ':' and the '-', so "[un]register a clock rate" is missing.
>=20
> Fixes: 86bcfa2e87c4 ("clk: add pr_debug & kerneldoc around clk notifiers")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Mike Turquette <mturquette@linaro.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-clk@vger.kernel.org
> ---

Applied to clk-next
