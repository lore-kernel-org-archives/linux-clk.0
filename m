Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB9BC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 18 Oct 2021 20:01:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9135F610A1
	for <linux-clk@archiver.kernel.org>; Mon, 18 Oct 2021 20:01:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbhJRUDY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Oct 2021 16:03:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:43076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229941AbhJRUDY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 18 Oct 2021 16:03:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 750736108E;
        Mon, 18 Oct 2021 20:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634587272;
        bh=LMLKoKsrV0EY6U9Mb+w1OhE8Gpm+Ab4Imi2To/9dgcQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=q7yOLRYXzT1wdakZ/h6nisRiaQfI2rZWx10pZmaKqQ1t6HSz23Xk3gFfVOQ1VvwbD
         YzFu9jNsuPWCBTHcFkqItdl/y2YPMYZCcNuPssBcnRON6aFqCY4wHZ1toQ4Pm1SrpZ
         i8Y0Rr0l6wwwkmfmlL3KPWeEVxTDFmjhnw4S6hyq5svYSngmPwAFDJ7lMrOlkct6DO
         Gs4/RhL0p/g9gN1K7LjTpONAZ20b2WZffcZlueghaaZ9x91zpBNbOfzwx/P9JqB7El
         F5oqUOZ8e+1ZIWyCquM8m4TcwwsVonyqElMC8GcMNADp4TwGWf/l7TuBI24XJm+FGE
         HBdRMFIvrzhbQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211016105022.303413-3-martin.blumenstingl@googlemail.com>
References: <20211016105022.303413-1-martin.blumenstingl@googlemail.com> <20211016105022.303413-3-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH clk-fixes v1 2/2] clk: composite: Use rate_ops.determine_rate when also a mux is available
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, knaerzche@gmail.com,
        mturquette@baylibre.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-clk@vger.kernel.org
Date:   Mon, 18 Oct 2021 13:01:11 -0700
Message-ID: <163458727129.1767887.7945772309296747310@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Martin Blumenstingl (2021-10-16 03:50:22)
> Update clk_composite_determine_rate() to use rate_ops.determine_rate
> when available in combination with a mux. So far clk_divider_ops provide
> both, .round_rate and .determine_rate. Removing the former would make
> clk-composite fail silently for example on Rockchip platforms (which
> heavily use composite clocks).
> Add support for using rate_ops.determine_rate when either
> rate_ops.round_rate is not available or both (.round_rate and
> .determine_rate) are provided.
>=20
> Suggested-by: Alex Bee <knaerzche@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---

Applied to clk-next
