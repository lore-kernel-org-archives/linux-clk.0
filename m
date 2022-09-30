Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36D7C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 21:26:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231759AbiI3V04 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 17:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231806AbiI3V0y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 17:26:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01A0110B20C;
        Fri, 30 Sep 2022 14:26:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 17A69624F4;
        Fri, 30 Sep 2022 21:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EC3C433D6;
        Fri, 30 Sep 2022 21:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664573211;
        bh=/8IsS2twG4mpl1zl2+/C8htW4m56Q1+w9dbjIz8qNCU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HUiyqKIa18jctP6hVAhL6wD1i3QyFFENAFV1qlVgJuDVNMLpYShDyDJYvoPoXtWAJ
         g6XUUZ98qKTFDjjonOaB0hLS53PYIPgx3Z7GXagiFeX9ljcjTTCDBXIG387a+qDpU5
         irje7TdwFpt9feQOHOtdwfRSDHVPtaGd85BHfhZeyWR7aZr85IQZAHUeg9fGDYeO/C
         XLDIdLJBJNKgdcLE9Thd78amqMg6j1sadfsnDzMI4nVg+yBhxvSvPa4ddCfDXROInt
         rayHSEbMATzQcu/OoiRNLQYtWposAlTzGzKzF23uJwIBtqTDU9YW+Gho/NGjf2JSxx
         9UVT7mS7FvWCQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220929225402.9696-6-Sergey.Semin@baikalelectronics.ru>
References: <20220929225402.9696-1-Sergey.Semin@baikalelectronics.ru> <20220929225402.9696-6-Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH RESEND v12 5/8] clk: baikal-t1: Move reset-controls code into a dedicated module
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
Date:   Fri, 30 Sep 2022 14:26:48 -0700
User-Agent: alot/0.10
Message-Id: <20220930212651.70EC3C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Serge Semin (2022-09-29 15:53:59)
> Before adding the directly controlled resets support it's reasonable to
> move the existing resets control functionality into a dedicated object for
> the sake of the CCU dividers clock driver simplification. After the new
> functionality was added clk-ccu-div.c would have got to a mixture of the
> weakly dependent clocks and resets methods. Splitting the methods up into
> the two objects will make the code easier to read and maintain. It shall
> also improve the code scalability (though hopefully we won't need this
> part that much in the future).
>=20
> The reset control functionality is now implemented in the framework of a
> single unit since splitting it up doesn't make much sense due to
> relatively simple reset operations. The ccu-rst.c has been designed to be
> looking like ccu-div.c or ccu-pll.c with two globally available methods
> for the sake of the code unification and better code readability.
>=20
> This commit doesn't provide any change in the CCU reset implementation
> semantics. As before the driver will support the trigger-like CCU resets
> only, which are responsible for the AXI-bus, APB-bus and SATA-ref blocks
> reset. The assert/de-assert-capable reset controls support will be added
> in the next commit.
>=20
> Note the CCU Clock dividers and resets functionality split up was possible
> due to not having any side-effects (at least we didn't found ones) of the
> regmap-based concurrent access of the common CCU dividers/reset CSRs.
>=20
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>=20
> ---

Applied to clk-next
