Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D9BC433E0
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:55:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F50F64E57
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:55:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbhBKTys (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 14:54:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:37556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231264AbhBKTx4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Feb 2021 14:53:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3E1164E57;
        Thu, 11 Feb 2021 19:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613073196;
        bh=46rw0P4rUTAJ5kjpE59dtrjVnwXMuxPL6aYlhkdhU6s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=F+Bbcl2XJjLCnKJmTWq5HCDtJ2PG1+FI/YwmR2/W07yA+FAlB/2MCnCzOFXs4K4zT
         N/sIaZ0x/JQmZJhXDkRPRh9yGzw8mLzfDVL2Q0gsqG56bAZ8ju09V17zUPRXnA5EgU
         Jn8SHGl3r1dUZtMLMWTsKaf0ltR70ThQUOw7tgXmzV53qgCcW3jbhHE0tQgGjL4g3/
         8Zy5bLwWWbm3voStR3bHBnsKdr6VDZzcTgW3Oi16mM7QSMDrubTfpRqtnuk/GJBFWm
         rRRbwx0NVE0REm9lJRo9HumGpCleMxvQUL8codtGNvBGknpnJd99Bovth6cuFn4g5n
         9snuWprhC/sBQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210120093040.1719407-20-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org> <20210120093040.1719407-20-lee.jones@linaro.org>
Subject: Re: [PATCH 19/20] clk: versatile: clk-icst: Fix worthy struct documentation block
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:53:14 -0800
Message-ID: <161307319456.1254594.4248577580722917620@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lee Jones (2021-01-20 01:30:39)
> Also demote non-worthy header to standard comment block.
>=20
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/versatile/clk-icst.c:53: warning: Function parameter or memb=
er 'map' not described in 'clk_icst'
>  drivers/clk/versatile/clk-icst.c:53: warning: Function parameter or memb=
er 'vcoreg_off' not described in 'clk_icst'
>  drivers/clk/versatile/clk-icst.c:53: warning: Function parameter or memb=
er 'lockreg_off' not described in 'clk_icst'
>  drivers/clk/versatile/clk-icst.c:435: warning: cannot understand functio=
n prototype: 'const struct icst_params icst525_apcp_cm_params =3D '
>=20
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Applied to clk-next
