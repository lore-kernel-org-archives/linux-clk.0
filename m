Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBCDC433B4
	for <linux-clk@archiver.kernel.org>; Sat, 17 Apr 2021 00:02:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9492611AF
	for <linux-clk@archiver.kernel.org>; Sat, 17 Apr 2021 00:02:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234712AbhDQACr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Apr 2021 20:02:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:36634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229719AbhDQACr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 16 Apr 2021 20:02:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3EC560FE5;
        Sat, 17 Apr 2021 00:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618617741;
        bh=dBY73gGe5A7WHgdxn7QVGt8B5HRiJmVNpz1Jhqz4K+c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=D88dMfSrZo1SEUgS55yuEn5mOHGAOCnIEa71NMQubseenUPH/TBk2VNVVSddCYZ8g
         l0YvA+hWONl8SWp1gfKwCG4xHTXSZjroj+XSgdVb0CsuNDSSkgeq5ES6G06r44B8cm
         2HW4xDXc8Yj2gwonFc1CruIPD3s3LRo2CaQy4a1jVVpnTTGL4S/CWK7uuSh3i22pUY
         27x3JknYsBotdQnPI7sTUG9cTc+pDKcKT634jJPpWuKNatQiM6EwDXL0f4QmueqYfQ
         MRDFnaiHw8+R9bHjAk9op5g+AkVChhSfWJeWBScW3+QsqzfPSW76nRa1TzuGTfJ4Tj
         G0CadU5VG32kg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618465960-3013-3-git-send-email-flora.fu@mediatek.com>
References: <1618465960-3013-1-git-send-email-flora.fu@mediatek.com> <1618465960-3013-3-git-send-email-flora.fu@mediatek.com>
Subject: Re: [PATCH v2 2/7] clk: mediatek: mt8192: Add APU clocks support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Flora Fu <flora.fu@mediatek.com>,
        Pi-Cheng Chen <pi-cheng.chen@mediatek.com>,
        Chiawen Lee <chiawen.lee@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        srv_heupstream@mediatek.com
To:     Flora Fu <flora.fu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 16 Apr 2021 17:02:20 -0700
Message-ID: <161861774045.46595.16984607053300669956@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Flora Fu (2021-04-14 22:52:35)
> Add APU clocks support on MT8192.
>=20
> Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
