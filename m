Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BC3C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 25 Apr 2022 23:45:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236013AbiDYXs6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Apr 2022 19:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiDYXs6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 19:48:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3F91903C;
        Mon, 25 Apr 2022 16:45:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0B8FCB81B04;
        Mon, 25 Apr 2022 23:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B4CC385A4;
        Mon, 25 Apr 2022 23:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650930350;
        bh=PTAq9T+deG4xUzSzpGcV3GnLGZT3ZsY1at3ZaUx8sNY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LHuBooUNPw9+e9YXAZ9vV/IdR7P9mQ/W/cQfJ4BcxGMR/6n7+1mrdzbhvY04Gg/+c
         WDMatowIbz9zt/kPQVZI60SAPXcft3yCtGkCSK9lz35APixwMYYG391LIuDTFiVEsN
         gKK3LSgIB9BZcVU/JKRb8tyqfNKAN/cyEyv8sEvIZMqjfR+1O+bkqgNU7jRsvW1xJB
         8z36ks9cmveBis9SChohp/VMIVCM97RA27hrt+BelLaSFw0kiZDu+1atipVDx1kt94
         cSxsJaxyYVz5e+Q1fojg/qZv72Q5sl6SEwdSIfwLuvxI2gDgzyNdB+/mBM4don5EVt
         q2oidI52Sgobw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220414221751.323525-2-linus.walleij@linaro.org>
References: <20220414221751.323525-1-linus.walleij@linaro.org> <20220414221751.323525-2-linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5 v3] dt-bindings: clock: u8500: Add clkout clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 25 Apr 2022 16:45:48 -0700
User-Agent: alot/0.10
Message-Id: <20220425234550.A8B4CC385A4@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2022-04-14 15:17:47)
> This adds device tree bindings for the externally routed clocks
> CLKOUT1 and CLKOUT2 clocks found in the DB8500.
>=20
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-next
