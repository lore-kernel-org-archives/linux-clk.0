Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D31C433E0
	for <linux-clk@archiver.kernel.org>; Sat, 13 Mar 2021 20:38:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74F0F64E62
	for <linux-clk@archiver.kernel.org>; Sat, 13 Mar 2021 20:38:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234535AbhCMUiK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 13 Mar 2021 15:38:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:36968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234697AbhCMUiK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 13 Mar 2021 15:38:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5C1964ECD;
        Sat, 13 Mar 2021 20:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615667889;
        bh=y3AzkWl/QkhO0HyMix80Bdu2IWVQbZY6mwVEyUe6XEA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=d3ZBX4+08x+8QWxRvV2Hfe0XPAinUiX+SNnw2IAbecZMWj0WHn/QxOg0LIE3BImZj
         gHd0tYJ36DZEjZwxl2xe44uFzDm7XnrKQq8BudfC6p/qp9u5la/h+hRWJ57AuyDsLV
         9RpSFx6bYoD7F/4kyINX7k46Or8YRKCtcJPwEQ/ZbvvsukIraemisr8HxSHb4m97H/
         5pLSV5wP4tUImXFSRdUKRvj0mvtF1W57vEfGV+nTsLPJkwfgg/A7XvUXETslFBhmVr
         uOFQIgOcBvKqdA6SNt2Hq+4MT4GsM2Kl5EVPyU1r+dVWZ19M58yBiezjTT9jbSSbBp
         coM3Ib6PqfpiA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210305003334.575831-1-linux@rasmusvillemoes.dk>
References: <20210305003334.575831-1-linux@rasmusvillemoes.dk>
Subject: Re: [PATCH] clk: use clk_core_enable_lock() a bit more
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date:   Sat, 13 Mar 2021 12:38:08 -0800
Message-ID: <161566788864.1478170.2232755793586125893@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Rasmus Villemoes (2021-03-04 16:33:34)
> Use clk_core_enable_lock() and clk_core_disable_lock() in a few places
> rather than open-coding them.
>=20
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---

Applied to clk-next
