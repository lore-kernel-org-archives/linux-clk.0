Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13592C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:18:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF3F26115B
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:18:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235480AbhINWTV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 18:19:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:53890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235478AbhINWTU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 18:19:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4ED116115B;
        Tue, 14 Sep 2021 22:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631657882;
        bh=Hr9cKqBBHwOk/0NXW4zjh3+K/+9PPCpQdoKHJf6XeZs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Ej69gGw8jeXiptvPKmWyB5qouz35oA7AekdnmIT/74BoflpWylhp/Rmvy3MXBm3gG
         vYduypA82OaY5I8sftwHuFslF+LldERTR5GfHbC7dBxy3DBsqB5ruIaIsTTGNhZp2x
         X3vBpKuU0q/u7FaaJ0g4WlZIiVWUH5/VPSbJWkmAZci7VbBHye3715+UKXwv5/zmOJ
         27t2ccKBwE8MNpUbC+dojUHBH+FRhOIjAoZuAIUB+XuX9/3Tj+QLVJppU/XdZBQL7B
         2qN5UsaQveTprM6hxKuobuUyspIAnnrod30T/bbViVzktRQ7sGrq9wZWHLTBS+wJ0o
         AT2ESoN2Nh65w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210914021633.26377-4-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com> <20210914021633.26377-4-chun-jie.chen@mediatek.com>
Subject: Re: [v3 03/24] clk: mediatek: Fix corner case of tuner_en_reg
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 14 Sep 2021 15:18:01 -0700
Message-ID: <163165788118.763609.9804318993707120972@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-09-13 19:16:12)
> On MT8195, tuner_en_reg is moved to register offest 0x0.
> If we only judge by tuner_en_reg, it may lead to wrong address.
> Add tuner_en_bit to the check condition. And it has been confirmed,
> on all the MediaTek SoCs, bit0 of offset 0x0 is always occupied by
> clock square control.
>=20
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next
