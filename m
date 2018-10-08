Return-Path: <SRS0=r4nj=MU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871C5C6787E
	for <linux-clk@archiver.kernel.org>; Mon,  8 Oct 2018 02:47:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3852D2086D
	for <linux-clk@archiver.kernel.org>; Mon,  8 Oct 2018 02:47:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qwEBjLsW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3852D2086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbeJHJ45 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Oct 2018 05:56:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:33266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbeJHJ45 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Oct 2018 05:56:57 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 149322084D;
        Mon,  8 Oct 2018 02:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1538966852;
        bh=FTFv6uXBqtCjnUQd8FP2o8aPDcs1S0kLS9GD5Kr6cdc=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=qwEBjLsW5K7k3xXhDqsE4RpmQE6kownkEyTEwxgV5J3DGoy4dKPTriMDdpd+fSUbS
         K9OqQzN0fK/Wh+A11dsp2Wo5u9sotOlZQK/r5J/lirm53YpQkdTsf7Q+dqsDnZsges
         Y6j+b/0e+dIrOolMx/WQfjKFSu5wMR2S2vI4qBEw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181002115210.15541-1-m.szyprowski@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <CGME20181002115219eucas1p23816d543c4dedb233406869c22713a95@eucas1p2.samsung.com>
 <20181002115210.15541-1-m.szyprowski@samsung.com>
Message-ID: <153896685140.119890.3664164252562492456@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH] clk: samsung: Use clk_hw API for calling clk framework from clk
 notifiers
Date:   Sun, 07 Oct 2018 19:47:31 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Szyprowski (2018-10-02 04:52:10)
> @@ -432,7 +432,7 @@ int __init exynos_register_cpu_clock(struct samsung_c=
lk_provider *ctx,
>         else
>                 cpuclk->clk_nb.notifier_call =3D exynos_cpuclk_notifier_c=
b;
>  =

> -       cpuclk->alt_parent =3D __clk_lookup(alt_parent);
> +       cpuclk->alt_parent =3D __clk_get_hw(__clk_lookup(alt_parent));

It would be nice to get rid of __clk_lookup() from here too. Please try
to do that if at all possible.

>         if (!cpuclk->alt_parent) {
>                 pr_err("%s: could not lookup alternate parent %s\n",
>                                 __func__, alt_parent);
