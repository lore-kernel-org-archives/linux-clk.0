Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2513C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:20:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D50B61184
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:20:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235835AbhINWVg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 18:21:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:55806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235786AbhINWVc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 18:21:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A2DB6115B;
        Tue, 14 Sep 2021 22:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631658014;
        bh=jvI12QmPpCnTZnWtnOHFRAXmDQ1Q9jJWv5MmuR9s6xA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YPiP+CmmWIY/o1SC9RXyQws8EPOPFD4OGHj1ZdWlnVpBykQ2cpfjoQdRPQYQVnCLL
         IWxSwF6lt3gOXyAP+KdLTF7F1IoGhTDe2M97AzVSly9tdr2ie4R0y6CdyamZkB1rbV
         jDAj6sq99Jk9QBwDPqfKjM9hFuPMKm7cy9dypCpL2oKlpnLSirL/TlvwIPbv03LzxW
         ViFAYDbnSARuIizeHPRIRaWFYBbg/9qH+zPwcdgzwrey4RbUIO8KZ/FbWN9nv0lTHi
         PqqXeg48MtOxNUxua+jFcPWS2V0IVCJWi22NOpHaORG57QPm1tNTtaMscy3bAFRgom
         rpZK3hkQJ4LuQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210914021633.26377-24-chun-jie.chen@mediatek.com>
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com> <20210914021633.26377-24-chun-jie.chen@mediatek.com>
Subject: Re: [v3 23/24] clk: mediatek: Add MT8195 imp i2c wrapper clock support
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
Date:   Tue, 14 Sep 2021 15:20:13 -0700
Message-ID: <163165801346.763609.12185791472817481426@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-09-13 19:16:32)
> Add MT8195 imp i2c wrapper clock controllers which provide clock gate
> control in I2C IP blocks.
>=20
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied to clk-next
