Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15ACC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 14 Jan 2022 02:08:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238787AbiANCI3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jan 2022 21:08:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238788AbiANCI2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jan 2022 21:08:28 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C896DC06161C
        for <linux-clk@vger.kernel.org>; Thu, 13 Jan 2022 18:08:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9024FB82356
        for <linux-clk@vger.kernel.org>; Fri, 14 Jan 2022 02:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5064DC36AEA;
        Fri, 14 Jan 2022 02:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642126105;
        bh=+7yXkCfraCxTAYR8m2m3+Hus0q7MEXhgJhVhZLdnybs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DuOVTwoqHpZi380inIuXMD/NQ7lSTT1262hsi3ARptVZvkG4J1jLanxfQhTOjOK0h
         QiDcZFXGRzQ6DhTcRAKyfsJZZcu40r0FPhMG+wgOkZ/YjfHkMJ4P7jeCJhqcZ5/ESR
         cIrO5Rk1fqiKa2lJ0l17nJBMRTKTVFIOqaDdDJBaBcZytQGuRtnIBQXWhGScqAZiA9
         a6W1Om6O5YCoVhtsQKwdGxBzMNCjrELzjAPs2hvf9zt6qGyQ/VjtHTbdBKKXoGQ9rY
         9ovK9MSyMO7Z/LcV/lcAyxOIyjWS+255Uiewr2PBWSOrLF/a5amnj/h+BNarldqyaX
         93u7lBEUBf4Og==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com>
References: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com>
Subject: Re: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ikjoon Jang <ikjn@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Nick Fan <Nick.Fan@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>
To:     Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        linux-mediatek@lists.infradead.org
Date:   Thu, 13 Jan 2022 18:08:23 -0800
User-Agent: alot/0.9.1
Message-Id: <20220114020825.5064DC36AEA@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alyssa Rosenzweig (2022-01-10 10:13:30)
> @@ -1238,6 +1265,10 @@ static int clk_mt8192_infra_probe(struct platform_=
device *pdev)
>         if (r)
>                 return r;
> =20
> +       r =3D clk_mt8192_infra_disable_mfg2acp(pdev);
> +       if (r)
> +               return r;

If this fails it leaves a bunch of allocations around that never get
freed. It's a problem before this patch so it's mostly just making me
grumpy that proper cleanup isn't already here. Can this be the first
thing done in probe instead?
