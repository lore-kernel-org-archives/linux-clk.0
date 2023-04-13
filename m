Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8152C77B61
	for <linux-clk@archiver.kernel.org>; Thu, 13 Apr 2023 18:40:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjDMSkd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Apr 2023 14:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbjDMSk3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Apr 2023 14:40:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD487DB0;
        Thu, 13 Apr 2023 11:40:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 23B30640B7;
        Thu, 13 Apr 2023 18:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536EDC433EF;
        Thu, 13 Apr 2023 18:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681411224;
        bh=mwYnTH2xTUlzJflPd1vC123IfsPEl3nEWJIFOU/ryso=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=C1b7JS3gODDSYYlBDTIpxlgxG1R4XL1R85N0pALFWGPerftCQh/QgRTkSYmNuEYE9
         L/Edkv3kS7VyqrGIxRIIdjjQO2xm/Qoe5ITC3m4M51owUTozFTFYrb45KhE0FrHJ9E
         yjniCCFn4wdkU5OC0UqrILGm8af4piU0eXT+ootGLCww0CkSFCgOTSkv41JoWKduH1
         wNXgpYg6SbGBH3SUhdHfLx6632/mSuRMo2Q/jkQfKPur8yk4bqg7cVIAPHLTp5pE43
         rCPZVphcdd8JaZowPPREGMbP25Ke1cssVQFxLKe/7IZLp0MzhMSd+NPktv81meIG13
         zpAqAywMfmBGA==
Message-ID: <f09425fde83f4b21ee301ef8810c4c29.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230413090128.60119-1-gehao@kylinos.cn>
References: <20230413090128.60119-1-gehao@kylinos.cn>
Subject: Re: [PATCH] mediatek/clk-mt8173-apmixedsys: convert to devm_platform_ioremap_resource
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     gehao@kylinos.cn, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
To:     Hao Ge <gehao@kylinos.cn>, matthias.bgg@gmail.com,
        mturquette@baylibre.com
Date:   Thu, 13 Apr 2023 11:40:22 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Hao Ge (2023-04-13 02:01:28)
> diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8173-apmixedsys.c
> index a56c5845d07a..fe386bf8225d 100644
> --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> @@ -90,7 +90,7 @@ static int clk_mt8173_apmixed_probe(struct platform_dev=
ice *pdev)
>         struct clk_hw *hw;
>         int r;
> =20
> -       base =3D of_iomap(node, 0);
> +       base =3D devm_platform_ioremap_resource(pdev, 0);
>         if (!base)

This needs to be updated.

>                 return PTR_ERR(base);

And PTR_ERR(NULL) is 0, which is wrong.
