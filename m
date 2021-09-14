Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F97C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:18:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4453161175
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:18:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235553AbhINWTe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 18:19:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:54104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235539AbhINWTd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 18:19:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4D4B61166;
        Tue, 14 Sep 2021 22:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631657895;
        bh=MsfbPxyCjoEu5YUx1VmHVZqWv0E2F1FKz9dVKhBh8hA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sAyf6CTyt0HYu+rueK6LyANOUU4YOC2+33uvMxxIjDW1ov3nG5VGKDw62Jgx4yUtH
         onaWb3RrZByps3KigJVkbU7niJQWS7exz5QaIsHWVYrmhxIIS/wMSYDsvIYeC9WhJq
         SAkumAhzA/Uw+m8G2goCNuWAMyrg8UWC0AOTQe274xEMGPjb1EQFeiyVbJsp/oPDoW
         7iy7Us8o9ANp4s3YIvfvw1QZLLAbkAKtzjzPGLlddupcmgYdRAf6UonUGy6UFM+X5F
         nbRVAJBi7A8MC4UAgLzB2llnfq+mLDjlFdtRwt2rp54fYcm3LDHe9lXfzdG9gnaEXA
         hr+UXhWtQgSgQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210914021633.26377-6-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com> <20210914021633.26377-6-chun-jie.chen@mediatek.com>
Subject: Re: [v3 05/24] clk: mediatek: Fix resource leak in mtk_clk_simple_probe
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
Date:   Tue, 14 Sep 2021 15:18:14 -0700
Message-ID: <163165789454.763609.3729811744499552764@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-09-13 19:16:14)
> Release clock data when clock driver probe fail to fix
> possible resource leak.
>=20
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next
