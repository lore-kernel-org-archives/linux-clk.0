Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C56CDB483
	for <linux-clk@archiver.kernel.org>; Thu, 19 Oct 2023 01:15:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjJSBPj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Oct 2023 21:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232318AbjJSBPg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Oct 2023 21:15:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23982130;
        Wed, 18 Oct 2023 18:15:34 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABCBDC433C7;
        Thu, 19 Oct 2023 01:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697678133;
        bh=n5i2LsXUOUuNZ00paA52ew1UOEi/S4bwIfX1nvj6Vmc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=k/Xt3eNXYFGxkOVSmnbnQi4Jtpbk4EkBUe0GVQJqVEsab4D9tVK0ek8FobnyVAoDH
         7d6VPvn5/yW9hKNbqnotpzVACiXv9P/HXoImN9HhWQcj1sZi+pOLWBMH+KzCXDF6Cq
         u1D8gEdGtffO9SWTcJzZ8JVF4pgYMk6NoUxag1araMvbcuiCLhMPSTgAM//AfhXh36
         zSsn5HFaC9Wj5QiK4mGl6iK2n1QW+yKraz5hlc9E+z48g2h1VbiLUjaU1yCSBnujKk
         C/CRh0NcasZXGm3BHidevWGHhEFuQjIuiLG4BL6P8H0TDNdOkMMHGJ6Bj9kYtryX4n
         Jd1hdwzhMyjnA==
Message-ID: <631c2191b10950d27515883adca6d64d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230912093407.21505-2-jiasheng@iscas.ac.cn>
References: <20230912093407.21505-1-jiasheng@iscas.ac.cn> <20230912093407.21505-2-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH 2/5] clk: mediatek: clk-mt6779: Add check for mtk_alloc_clk_data
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
Date:   Wed, 18 Oct 2023 18:15:31 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jiasheng Jiang (2023-09-12 02:34:04)
> Add the check for the return value of mtk_alloc_clk_data() in order to
> avoid NULL pointer dereference.
>=20
> Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---

Applied to clk-next
