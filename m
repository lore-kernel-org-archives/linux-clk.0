Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F81C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 00:27:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiI3A1c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Sep 2022 20:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiI3A1b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Sep 2022 20:27:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0472E201902;
        Thu, 29 Sep 2022 17:27:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 83E64B826C9;
        Fri, 30 Sep 2022 00:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A3C0C433C1;
        Fri, 30 Sep 2022 00:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664497648;
        bh=rp8ySoM3R2JOmYIcPYlg5loowpxacwoZFaIE/DRN2DM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JrTSVJjPpJ6CYRuI0CionM2KByAnerEIlXKrs6bNs8xMk7pfi6DndKsqcCvPhXicK
         GH6mOgKECpC/2wWai0TrDPfrROvJhU1Ev0eXj6jkGjmHSr3m8VOf9D8VdDvbXMYNKU
         Fay7Yrsj2k4cPSmjt8Uerm8gG1eHC7Uule/S0ZLaVGe2aKhSPSMFY1ukwtE7TAF9D4
         ZSKoWY0u0pr4fbUdPfBe9TB2+b6JxNOZEM3tFn2zPP4+X09hu0EJuJ13/cuBFb2/sl
         BjfFTSPMVBRPnaduXaoBFSFEw3U1+jwxUKkd4k0sWalrXiS3lgVpaEnH5J765+7ddB
         DTsfnxEHR7qyA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220903224125.2276690-1-floridsleeves@gmail.com>
References: <20220903224125.2276690-1-floridsleeves@gmail.com>
Subject: Re: [PATCH v2] drivers/clk/clk: check return value of clk_pm_runtime_get()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, Li Zhong <floridsleeves@gmail.com>
To:     Li Zhong <floridsleeves@gmail.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Thu, 29 Sep 2022 17:27:26 -0700
User-Agent: alot/0.10
Message-Id: <20220930002728.3A3C0C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Li Zhong (2022-09-03 15:41:25)
> clk_pm_runtime_get() could fail. Check the return status.
>=20
> Signed-off-by: Li Zhong <floridsleeves@gmail.com>
> ---
>  drivers/clk/clk.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 7fc191c15507..09353f7bf052 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2981,8 +2981,12 @@ static void clk_summary_show_subtree(struct seq_fi=
le *s, struct clk_core *c,
>                                      int level)
>  {
>         struct clk_core *child;
> +       int ret;
> +   =20
> +    ret =3D clk_pm_runtime_get(c);
> +    if (ret)
> +        return;
> =20
> -       clk_pm_runtime_get(c);

The patch is malformed. It can't be applied, sorry. Also, shouldn't we
print something if we can't runtime PM get?

>         clk_summary_show_one(s, c, level);
>         clk_pm_runtime_put(c);
>
