Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADE4C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:19:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AF8361164
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:19:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235741AbhINWUd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 18:20:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:54820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235609AbhINWU1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 18:20:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C34461184;
        Tue, 14 Sep 2021 22:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631657948;
        bh=Og5YvxQccboDxIRsLntpmDoc7Q6eiSITMlpYoczGtoo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bWETerniKb5tuPkPE7bpUkYOagEPA6o1o4KNm4DIewQlLt9J0BCLP1anYqECg9Ae/
         V5nrpC0tJtNMfccalUPhOebBTa7zluDvCIWefRdbbYgmjTHeDU4f4Bdi7qeoG4dGFQ
         t1HArTkPsAapUdL78IfWU9JDndBcJcvtgv0qB0C0nUykgI8UAERcX2VlfayZxwhHBs
         Bo7/janhMGqd0bhWqfoaAWnVwamJTlV1E+ZdXfvjr9En8F1oiqBnd2Tgn4G/K14kDa
         QFPioGQ/0B5P8CutqEie5NfzHoNpWYh1JB/YX+LqrxaLO8TxUAmW2K5cbu5sj/uqV9
         kD5picvJNjrbQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210914021633.26377-14-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com> <20210914021633.26377-14-chun-jie.chen@mediatek.com>
Subject: Re: [v3 13/24] clk: mediatek: Add MT8195 ipesys clock support
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
Date:   Tue, 14 Sep 2021 15:19:07 -0700
Message-ID: <163165794746.763609.13448883456440776494@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-09-13 19:16:22)
> Add MT8195 ipesys clock controller which provides clock gate
> control for Image Process Engine.
>=20
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next
