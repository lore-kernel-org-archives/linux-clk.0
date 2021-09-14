Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6608C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:18:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B91F76115B
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:18:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235506AbhINWTj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 18:19:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:54204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235517AbhINWTj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 18:19:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9141261175;
        Tue, 14 Sep 2021 22:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631657901;
        bh=8UYOgxQ/y4fca9kfPI88qemxf6oklkdQ917WplPmLjM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=SuFOgXc6G1WhoCY/Rt4N2Yo1Dri08ELhIlb5jXFBfcBZ8npNrLlxZGqkD3BXZ0IQu
         eXGq/uzbZzI3npBCEy8A6M0tskXRi+nD1sqLakkwVtYcHpgOgOC6YTBkAuOwr89LwS
         aIYFeyJus8kZLLcs0Ig6PQvwUEjcwMwmHLz9BRGw3KSx59tI6s/RSLpmxTamKkIgJD
         /OIngRwPryp6RcM7idZ+SnmXias6nX1Fj92vyznJz/DnzulMx2OpCCxr3qBp5qGa9s
         DcYygKwJWzw5AY0F1v//+bpJp6adH1Lu3U4PJ/VG6HaWLnITNDNNUWrffW8XueUNBJ
         gINRi/cQPuhGA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210914021633.26377-7-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com> <20210914021633.26377-7-chun-jie.chen@mediatek.com>
Subject: Re: [v3 06/24] clk: mediatek: Add MT8195 apmixedsys clock support
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
Date:   Tue, 14 Sep 2021 15:18:20 -0700
Message-ID: <163165790018.763609.10824046513029639929@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-09-13 19:16:15)
> Add MT8195 apmixedsys clock controller which provides Plls
> generated from SoC 26m and ssusb clock gate control.
>=20
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next
