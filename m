Return-Path: <SRS0=PWff=RB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E88C43381
	for <linux-clk@archiver.kernel.org>; Tue, 26 Feb 2019 17:41:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43EC52184D
	for <linux-clk@archiver.kernel.org>; Tue, 26 Feb 2019 17:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1551202895;
	bh=1sdRn6tWsfxeJZWcUvJQcVUem3n7ZKK0pNVh1fP4vnQ=;
	h=To:References:Cc:Subject:From:In-Reply-To:Date:List-ID:From;
	b=tukHk85JQC84iqztdqKvtGbNJVZh8HiAq9VP+8fx2Dc6kS18qLN9IxPk2B76tcUCw
	 HvR9SQPNzJMrApRZVqtaU4BSR6btpw6GhVv3/AZjqtjhnltWf5HHa1RFmX0oAOJBV7
	 GCf8H0AGzSSnUzl32DM/8Z+gHrxWZCMulAc4CTyI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728462AbfBZRlf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Feb 2019 12:41:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:44882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727108AbfBZRle (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 Feb 2019 12:41:34 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 29B70217F9;
        Tue, 26 Feb 2019 17:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1551202894;
        bh=1sdRn6tWsfxeJZWcUvJQcVUem3n7ZKK0pNVh1fP4vnQ=;
        h=To:References:Cc:Subject:From:In-Reply-To:Date:From;
        b=rSFKMg7rgcyScleP7SCXibgUZ6i7ecRYRNaC0EgTZfjEIplt03Pfw7gHvcoAsZHw9
         7FyHQyvtPmiFCFepP77rwfJUBO3xLHj4obdyJN8AV9GThPwO+HWGN/0/eYZmR/rfLO
         K2CmaxPTgJFmUNwwp+CGuMVXQX+0qb3ExS5z19p4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Michael Turquette <mturquette@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>,
        YueHaibing <yuehaibing@huawei.com>
References: <20190226015732.183552-1-yuehaibing@huawei.com>
Message-ID: <155120289328.260864.8270283395055934395@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Cc:     YueHaibing <yuehaibing@huawei.com>, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] clk: ingenic: Remove set but not used variable 'enable'
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190226015732.183552-1-yuehaibing@huawei.com>
Date:   Tue, 26 Feb 2019 09:41:33 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting YueHaibing (2019-02-25 17:57:32)
> Fixes gcc '-Wunused-but-set-variable' warning:
>=20
> drivers/clk/ingenic/cgu.c: In function 'ingenic_pll_recalc_rate':
> drivers/clk/ingenic/cgu.c:86:15: warning:
>  variable 'enable' set but not used [-Wunused-but-set-variable]
>=20
> It's not used after commit ab27eb4bc365 ("clk: ingenic: Add code to
> enable/disable PLLs")
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Applied to clk-next

