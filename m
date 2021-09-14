Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AFCC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:19:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E92D6117A
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:19:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235609AbhINWVK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 18:21:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:55332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235795AbhINWVA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 18:21:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDAC16115B;
        Tue, 14 Sep 2021 22:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631657982;
        bh=+TVInzl/V3fHoee3tGRz68u6q/KN9a2igaTZb8TWSGk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nvDtMqJiPKsqtMV7h0kuh7TJNAalAi5BMO5Y0luq6mbxHywv2aiQTQDQQJZMc4H3k
         n+mVhXSj/QMPxcp6rV93nQLrJnUh4AXQLRlx6T4zMU50Jg2l4b2efX5QH2iI33MM6d
         AXf5QdIsWkMRnwC6/COU2xbdtkDExkgd/tf9eRuJPhRbPHq0Xld0HAV7+7dcWJKCtn
         0Ez0M+7YvwSVWFtYBnRpfDY+uUNkETRART3e6sSqZ8A2xY81Hi0P7Vh2gbGMOMavQB
         y7Ca61yFautNTNEwB6FtwRgfKshKFtY75BGyBuMV3bN1Etq66l9QhHL16kPrXVUpZy
         7uc9Cf1PG6v9A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210914021633.26377-19-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com> <20210914021633.26377-19-chun-jie.chen@mediatek.com>
Subject: Re: [v3 18/24] clk: mediatek: Add MT8195 vdosys1 clock support
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
Date:   Tue, 14 Sep 2021 15:19:41 -0700
Message-ID: <163165798165.763609.11608984682123876228@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-09-13 19:16:27)
> Add MT8195 vdosys1 clock controller which provides clock gate
> control in video system. This is integrated with mtk-mmsys
> driver which will populate device by platform_device_register_data
> to start vdosys clock driver.
>=20
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next
