Return-Path: <SRS0=Bh1D=AE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3B3C433DF
	for <linux-clk@archiver.kernel.org>; Tue, 23 Jun 2020 02:07:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F29F20771
	for <linux-clk@archiver.kernel.org>; Tue, 23 Jun 2020 02:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592878066;
	bh=YNrYfuA6FZhhsYSAt455rW8cI8ui18M08tk4z9xdIfA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=OsbWGex1NbxlVs9NxHRo1ISZEBjMUFlJcgs/gDDASmHXPba7L8KPCqSF//GDv+4qj
	 r2pFUlyMkDDN1gw9GJJp16tBKPb5OOLO+zTgel/6nK9bOYTGtc2ZmQIK9s8CFR1qCf
	 86ZRfMwFt4VHp6XC5RJaFzy3r7XXE4xhDYEkMhkY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731415AbgFWCHq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Jun 2020 22:07:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:44664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730804AbgFWCHq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 22 Jun 2020 22:07:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9DDA120720;
        Tue, 23 Jun 2020 02:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592878065;
        bh=YNrYfuA6FZhhsYSAt455rW8cI8ui18M08tk4z9xdIfA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PWdoT00y42kPQeOWu4jBqlvPq0QkDKnsHPHGcLGpxOjSU8C/owNL+VfPuUpnN7MXa
         6jTS7IS+Bu2gLY8ShVyotzyvNCtqHajnWJFTRZhvn4t2D+k07zYoRncex1ueOARuBl
         /bk/OgDnEZNM6vlfsgJmVP6hZlAjZtdjCLvMY2qg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200603111923.3545261-1-thierry.reding@gmail.com>
References: <20200603111923.3545261-1-thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] clk: tegra: Capitalization fixes
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        LABBE Corentin <clabbe@baylibre.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
To:     Thierry Reding <thierry.reding@gmail.com>
Date:   Mon, 22 Jun 2020 19:07:45 -0700
Message-ID: <159287806503.62212.1465425499140080735@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2020-06-03 04:19:22)
> From: Thierry Reding <treding@nvidia.com>
>=20
> HW, XUSB and PLL are abbreviations and should be all-uppercase.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
