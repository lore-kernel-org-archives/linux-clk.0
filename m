Return-Path: <SRS0=vytI=PR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5230C43387
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 18:35:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7632E214C6
	for <linux-clk@archiver.kernel.org>; Wed,  9 Jan 2019 18:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547058943;
	bh=CKMsbL+01IU2AWTkMa1wjMNUUsJT8VvKiuJAFUZXlqo=;
	h=Subject:Cc:To:In-Reply-To:From:References:Date:List-ID:From;
	b=fMb0IC/WRYRapOfS8tgD3L+X4CQcT+X1xG0LAj05bikQPIM2es5Wkujwp8JWXAOA+
	 EgQeXipYx5zTe758GoSbSPqagZwcRLepCpDYG+IliwCdZStideL93MfN2ly9T9yjYc
	 Uw7Teu1znFGPn0SL/zYvjNHTOGXu4Ep22Ek+qE2A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfAISfn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Jan 2019 13:35:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:40532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726292AbfAISfn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 9 Jan 2019 13:35:43 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 43DCC2064C;
        Wed,  9 Jan 2019 18:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547058942;
        bh=CKMsbL+01IU2AWTkMa1wjMNUUsJT8VvKiuJAFUZXlqo=;
        h=Subject:Cc:To:In-Reply-To:From:References:Date:From;
        b=iPQEgagc1r0aLZrK6CDotjaY0/DQo5T7NpQqBZ28sqfO054Bqwb/OuD+ciIzUCiHk
         tfn2Gu50hmXKhLjrhj8vb39tTy46gTy/RfpRwRDoTd3bl72PuXlyZID0rLHRcx6J3Z
         MP7T386HivdJwqbWTvJ9Ncpnw20/KXUBPgKIz21A=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: tegra: dfll: Fix a potential Oop in remove()
Cc:     Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        kernel-janitors@vger.kernel.org
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
In-Reply-To: <20181218082241.GA440@kadam>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
References: <20181218082241.GA440@kadam>
Message-ID: <154705894157.15366.18371281346979788597@swboyd.mtv.corp.google.com>
Date:   Wed, 09 Jan 2019 10:35:41 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dan Carpenter (2018-12-18 00:22:41)
> If tegra_dfll_unregister() fails then "soc" is an error pointer.  We
> should just return instead of dereferencing it.
>=20
> Fixes: 1752c9ee23fb ("clk: tegra: dfll: Fix drvdata overwriting issue")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Applied to clk-fixes

