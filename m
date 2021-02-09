Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7674CC433E0
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 07:44:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C5FB64EB8
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 07:44:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbhBIHoS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Feb 2021 02:44:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:36822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229503AbhBIHoR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 9 Feb 2021 02:44:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCF2164EB8;
        Tue,  9 Feb 2021 07:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612856617;
        bh=UG6pEotndOOlskRubOeAWbb7duyo3EqzZnQ5WPH0h6M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=j6FUqkRu5mT6caeRRwbRY+sls5Hv4FtSgNahmJAJeNRBL/o9UG9Ilxs0TPADhG1xi
         91Iioh+6V62zwc42GZK69O2s9szY/eBzdtQppSUXtDnGhy4LnLiTjVAuUbSZhsbd6y
         0tZ1hMrEl5CHIqssJxE6z4S7odAuVZ4oP45m3UmpPv/rZIEsamDqlWJbW7RUXhIvf0
         O2r0i4II0LMGPHp2W36RtgkclUZfNcVaVTHMvje5YndGU2QkWhGNBt1VlpI51qTCqh
         1jAScVQMdMw74zFpaPHtUt2ZwSJNOhTVqRaBkgPm5XPHs9bqumkVCw5BuTqhBa62vE
         8aS/w7HUFtxzw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210120131026.1721788-2-arnd@kernel.org>
References: <20210120131026.1721788-1-arnd@kernel.org> <20210120131026.1721788-2-arnd@kernel.org>
Subject: Re: [PATCH 1/4] clk: remove tango4 driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>
To:     Arnd Bergmann <arnd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 08 Feb 2021 23:43:35 -0800
Message-ID: <161285661535.418021.3252883284741137095@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Arnd Bergmann (2021-01-20 05:10:23)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The tango platform is getting removed, so the driver is no
> longer needed.
>=20
> Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Cc: Mans Rullgard <mans@mansr.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-next
