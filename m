Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BFDAC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:19:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85B01611ED
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:19:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235642AbhINWUQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 18:20:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:54684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235633AbhINWUP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 18:20:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69D2A61164;
        Tue, 14 Sep 2021 22:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631657937;
        bh=tIdO8AvfEw7TMRf2V6g/vWLh8elNlsAu49gIboFy68U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MSikHtQdLObbGYYkdEBkHoeG7GG4u+lU/qRMPrpaQhFTkFjU6CTPN9grOzFAYHPeQ
         8bqEo3ZFrTp+cgpbRbd4dftGQ8eaXsek8dzMmHELctkXndryIP9RFnBOi9CLBR6pFm
         Q+Tv0HChF0g3nCROodCKkho97hnQj0U4Qol63Stm+8B7GIrHWIw+KFxpqqEpI8rbJY
         xinqlsd/7oIXDqXJDCetapkyOn/ReUg3rdXVOSsFO9bwAcg1Msihb7G484OBvqxCTm
         pxPAJY2r6o0+gjERNmBHOmvF/icmLddQzbH/k7jeYBEN7KgF4xPZlvWPjYyS0zL9OI
         Ywni7JgCyFdJA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210914021633.26377-12-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com> <20210914021633.26377-12-chun-jie.chen@mediatek.com>
Subject: Re: [v3 11/24] clk: mediatek: Add MT8195 ccusys clock support
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
Date:   Tue, 14 Sep 2021 15:18:56 -0700
Message-ID: <163165793627.763609.7958043375772890349@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-09-13 19:16:20)
> Add MT8195 ccusys clock controller which provides clock gate
> control in Camera Computing Unit.
>=20
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next
