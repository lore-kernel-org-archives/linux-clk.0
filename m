Return-Path: <SRS0=7p6v=2O=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CB8C2D0CF
	for <linux-clk@archiver.kernel.org>; Tue, 24 Dec 2019 08:01:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64CDD206CB
	for <linux-clk@archiver.kernel.org>; Tue, 24 Dec 2019 08:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577174472;
	bh=cuU8VKQE/3GVn78/4tq+dy3/V6uyV+wDpfpi8bZNkN4=;
	h=In-Reply-To:References:Cc:From:To:Subject:Date:List-ID:From;
	b=Y60SarEwwMQRnRcLfyl2ZSjveuZu+q0DJ28JLfB76F+dO4/sPj35cP2DSm0xUvAZS
	 iQkqDj724YU0U6S0I6BgmzmC0yFJSK229xWdE7UH0zsDULTtI+LROc/ZwXByrZdqYd
	 jDfjlHKrapiYOHXDShRRcvjkzC12JDVUXsVW5GCQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbfLXIBM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Dec 2019 03:01:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:50206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726043AbfLXIBM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 24 Dec 2019 03:01:12 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4DBA9206CB;
        Tue, 24 Dec 2019 08:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577174471;
        bh=cuU8VKQE/3GVn78/4tq+dy3/V6uyV+wDpfpi8bZNkN4=;
        h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
        b=PRrjIS7bvDONnoBb1pThfk4Weg5ZjMpYzVpGCsw/JbAryqNg1ki1RymGV2bl/MuDO
         QXfIXPdknyp6DPOcmuHDkG9YPfrFC9Jr5PQeH9krr8WWI0pLepQKyI0hwaFXoa0Bxc
         DG9KxwTw7gAQgckr76dPP5+6DXc/8FT4kKlwc9Dw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191210020512.6088-1-digetx@gmail.com>
References: <20191210020512.6088-1-digetx@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] clk: tegra: Fix double-free in tegra_clk_init()
User-Agent: alot/0.8.1
Date:   Tue, 24 Dec 2019 00:01:10 -0800
Message-Id: <20191224080111.4DBA9206CB@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Osipenko (2019-12-09 18:05:12)
> It's unlikely to happen in practice ever, but makes static checkers happy.
>=20
> Fixes: 535f296d47de ("clk: tegra: Add suspend and resume support on Tegra=
210")
> Reported-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Applied to clk-fixes

