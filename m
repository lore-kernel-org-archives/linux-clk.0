Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA0EC4361B
	for <linux-clk@archiver.kernel.org>; Thu, 17 Dec 2020 08:56:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D2A22389E
	for <linux-clk@archiver.kernel.org>; Thu, 17 Dec 2020 08:56:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbgLQI4R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Dec 2020 03:56:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:60418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726259AbgLQI4R (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 17 Dec 2020 03:56:17 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608195337;
        bh=FL2t5hhudOLhIx0t130/8vEDyVq+PJWtHbS8rAyMkN0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZiG+mLQ5A3wW0ghkZBjIg8UDyUXMaOW8bwyNjDHUeNPtJ+mRhSIOmjjITTr+LAgIm
         U8dp2cam+jr/Ae3xi5BMfDUUQ5w2qo+8EFiwtTrPNMpCtZu3XLFEn7HgEc5t8GQZXk
         WKvTwuv3JyZJvVzsJgNkAlEHMP9q6CZhHeIiyEpnDJy9w+f2D8CSon1y/MMEZ9rHxG
         6BI/5K5oZlUm6J6c6iPNTfvRSIocaxdOdeaJOxzgp6i1qM3MOEbiX0rgBgtP399gyq
         knLkV0pXTzSp1/1XMwXfCSh7nfxvn/lhyLP8PUXSViR9TyTcKo+QOrt7LphgV2a93e
         6vnnhPUso0KqQ==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201209083921.879-1-tinghan.shen@mediatek.com>
References: <20201209083921.879-1-tinghan.shen@mediatek.com>
Subject: Re: [PATCH v2] clk: mediatek: Remove MT8192 unused clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, weiyi.lu@mediatek.com,
        ryan-jh.yu@mediatek.com, nathan.chung@mediatek.com,
        erin.lo@mediatek.com, Tinghan Shen <tinghan.shen@mediatek.com>
To:     Tinghan Shen <tinghan.shen@mediatek.com>, drinkcat@chromium.org,
        matthias.bgg@gmail.com
Date:   Thu, 17 Dec 2020 00:55:35 -0800
Message-ID: <160819533548.1580929.12545650149091991895@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tinghan Shen (2020-12-09 00:39:21)
> From: "Tinghan Shen" <tinghan.shen@mediatek.com>
>=20
> Remove MT8192 sspm clock
>=20
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
> v2: resend patch to linux-mediatek because blocked by wrong mail setting.=
 =20
>=20
> This patch depends on series "Mediatek MT8192 clock support"[1].
>=20
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D37=
9955=20

Can this be rolled into that series?
