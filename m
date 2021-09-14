Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA06C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:19:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1518161221
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:19:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235724AbhINWUq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 18:20:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:55054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235706AbhINWUn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 18:20:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 885E96115B;
        Tue, 14 Sep 2021 22:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631657965;
        bh=AgMSoy3JfMBRE/ZXBD7mZzhZ6tcZ1mRJ/exmm2fjcGI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=suJR8MBrfojYcQ8oMJamwq0k/7SLzGDP4c2aGsUEEWkRhdB5Nv0wZoIK7xENelsPo
         S4p+Tc3L/8Mw+IWKWYFUtO3wsV2FfwyzRixNlnxuW71ibCGDpoTF0qWnFgo0EH8z4N
         ONAUX6ySYjc3/PR80S6Ep/fsy2zl9YnXB3er6SeeoSJI1NVqYY5zb/evuBuaBXXdSE
         PG3XMCNQcTmiyr80aIRUbZNz1DB7C3QxF7yb9RcOaOUvNIxZVR1vWQ3cF4u2JsYQC1
         XltLUXLiQsKNzxOw/EU16g5paOx6sdaZBPNXLDuQpeMYu2A+LKJB3zKkW6eauBKvYa
         KmbJe14NT9NPQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210914021633.26377-16-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com> <20210914021633.26377-16-chun-jie.chen@mediatek.com>
Subject: Re: [v3 15/24] clk: mediatek: Add MT8195 scp adsp clock support
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
Date:   Tue, 14 Sep 2021 15:19:24 -0700
Message-ID: <163165796440.763609.12268726479643503630@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-09-13 19:16:24)
> Add MT8195 scp adsp clock controller which provides clock gate
> control for Audio DSP.
>=20
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next
