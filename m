Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15311CDB482
	for <linux-clk@archiver.kernel.org>; Thu, 19 Oct 2023 01:15:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjJSBP1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Oct 2023 21:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjJSBP0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Oct 2023 21:15:26 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C275B114;
        Wed, 18 Oct 2023 18:15:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A63FC433C7;
        Thu, 19 Oct 2023 01:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697678124;
        bh=PMTO8UWQCoX94E73XTeAOx24nxa4cTkNMfXh7S7Z5DI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KjKKLc+UKiksoWp2TLvoOGwi61JlSjSDMtUYP/hTtIrWCr/xRwjQd2cC5atIgj06S
         E8QF8q+jhQWglonqfg1cDB8vzGuPY+uggWJSNiHGI8S0aoVBBkW6NCRliZUqrGR68j
         NUDS2QHvu1luzGw7f5cdXMg5Sq5WRHjlkYWQZ+M98YpniwxZQaLWYPH9WDsc4XHdRp
         XEGcwUc1wlmmW2r7GK0SbVgPm/p8LyS2m7/wUkdrfY7Dgx3WJ5pO08dnyZuoB4+kgH
         uF7spZjAIa/e4Y2pSZrsGD979SXEHREPIo/KIiRAwhyxvGtKrKVObiWMyp6Uulrho6
         FSunhlD7A+KRw==
Message-ID: <9c8633033bb689bdaa18b672ed4ae40f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230912093407.21505-1-jiasheng@iscas.ac.cn>
References: <20230912093407.21505-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH 1/5] clk: mediatek: clk-mt6765: Add check for mtk_alloc_clk_data
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>, amergnat@baylibre.com,
        angelogioacchino.delregno@collabora.com, cw00.choi@samsung.com,
        frank.li@vivo.com, kevin-cw.chen@mediatek.com,
        luca.ceresoli@bootlin.com, macpaul.lin@mediatek.com,
        mars.cheng@mediatek.com, matthias.bgg@gmail.com, msp@baylibre.com,
        mturquette@baylibre.com, owen.chen@mediatek.com, robh@kernel.org,
        ryder.lee@mediatek.com, u.kleine-koenig@pengutronix.de,
        wendell.lin@mediatek.com, wenst@chromium.org,
        wenzhen.yu@mediatek.com
Date:   Wed, 18 Oct 2023 18:15:21 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jiasheng Jiang (2023-09-12 02:34:03)
> Add the check for the return value of mtk_alloc_clk_data() in order to
> avoid NULL pointer dereference.
>=20
> Fixes: 1aca9939bf72 ("clk: mediatek: Add MT6765 clock support")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---

Applied to clk-next
