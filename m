Return-Path: <SRS0=lMr4=DA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793F4C2D0A8
	for <linux-clk@archiver.kernel.org>; Wed, 23 Sep 2020 23:59:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F1AC21534
	for <linux-clk@archiver.kernel.org>; Wed, 23 Sep 2020 23:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600905580;
	bh=P8bLkiASxkBQzjWWGDsNDLDOdgBjKhEVIc1PbwjgVEE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=nnQKfa55j4+GRzBJabmHXUgiAxvm9rwuS0VJEGYxh3NC359ipovz3ZnCadD2AgQZJ
	 Os43LvdTiktjRCxZIZWryklpoQfouzdI9N31MimtALDNkN+RJvLgWf5v2LxkKWjKd8
	 eqT6+T46TlChxKyAoeUvaPa4kTLV2BepTFHJYRuc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgIWX7h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Sep 2020 19:59:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:41562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726562AbgIWX7g (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 23 Sep 2020 19:59:36 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5B1AA214F1;
        Wed, 23 Sep 2020 23:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600905576;
        bh=P8bLkiASxkBQzjWWGDsNDLDOdgBjKhEVIc1PbwjgVEE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=0aoH2b1z3M097Qabfw4OAP5v8kXH1OCN6tiHDyUO8KG602rao8m/VYDT+f3nnPICS
         mucYfXUpBLszFnCNs/HjLf0aHcWzyrpGxV9nyK2p5aBhbtmNelFhdwx42iIWjM2qnP
         C1+V/5A502sL2ubB5XND/IuMQ2YoNu1wdc45h5rU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200922191641.2305144-1-sboyd@kernel.org>
References: <20200922191641.2305144-1-sboyd@kernel.org>
Subject: Re: [PATCH] clk: tegra: Drop !provider check in tegra210_clk_emc_set_rate()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <treding@nvidia.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Date:   Wed, 23 Sep 2020 16:59:35 -0700
Message-ID: <160090557506.310579.8483856369527418212@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Boyd (2020-09-22 12:16:41)
> The provider variable is already dereferenced earlier in this function.
> Drop the check for NULL as it is impossible.
>=20
> Found with smatch
>=20
> drivers/clk/tegra/clk-tegra210-emc.c:131 tegra210_clk_emc_set_rate() warn=
: variable dereferenced before check 'provider' (see line 124)
>=20
> Cc: Joseph Lo <josephl@nvidia.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Fixes: 0ac65fc946d3 ("clk: tegra: Implement Tegra210 EMC clock")
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next
