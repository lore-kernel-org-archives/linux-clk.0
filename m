Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48C7C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 17:57:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 968CD60F11
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 17:57:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbhG0R5J (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 13:57:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:46732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230054AbhG0R5I (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 27 Jul 2021 13:57:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81B3F6056B;
        Tue, 27 Jul 2021 17:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627408628;
        bh=mejTlmkLG6zbGS7GMMOnMI2qHdVVdSLcMDbPHgY7uL0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=USk0BJOawI2FI3CzDfmsyLCI8MbPz49tuIUKOx0uXhbJI4IAUkpxUZn+/D+d908CO
         K+n++JzNb6N1wzqWXmg0fbtqN5WgvNeHhbkdZYs3AkjXLa/toypYmZclrG5JbX09Vv
         7cWsrFINCi2ICpMNe53hRzaIbOBA3ccaaejbGO1I3EPCtyi41ssHAylfMcxm+01f1Y
         s4ASbxkJROH2enVY7uznQSvFTmgTCN4D3BPiVDrVyJ1iE24/ffXnRdB6wg0BBUhDo2
         fZ9gA7nxiPW6FvMUAFw7hzWGrfpDYHL4foQObxKQ+iFdX8VNbUEjlRTEG0JzNWxy9I
         cEPADssFZlsgQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210726105719.15793-18-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com> <20210726105719.15793-18-chun-jie.chen@mediatek.com>
Subject: Re: [v14 17/21] clk: mediatek: Add MT8192 mmsys clock support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 27 Jul 2021 10:57:06 -0700
Message-ID: <162740862632.2368309.18192597600151365795@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Chun-Jie Chen (2021-07-26 03:57:15)
> Add MT8192 mmsys clock provider
>=20
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---

Applied to clk-next
