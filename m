Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF5DC6FD1D
	for <linux-clk@archiver.kernel.org>; Tue, 21 Mar 2023 22:54:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjCUWy0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Mar 2023 18:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjCUWyZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Mar 2023 18:54:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1BF3193F2;
        Tue, 21 Mar 2023 15:54:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 69AC661EC6;
        Tue, 21 Mar 2023 22:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1C8C433D2;
        Tue, 21 Mar 2023 22:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679439263;
        bh=q1wTtCqCbNvbVYDAzo1Gaq47pVYvmxrAU7M/4u6A/lY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Kolg4YTgU6uwQAMtkl1n9TXpsBVjjcNkMmhTAVIjo9ddqt2L1/tjnKtlsrxvWxWbD
         ix9cq6h1zHZ0mgJeL0JgaBqFIiMPWzJEnrhn++u2WYiu0+jh6DWvgblpJHg/c+wzgs
         nxXScxxd4pPy+BjRxDiXwXKDP2mb7ZOrGG7enbxCzcIA/hFiw6CUHBYEq88N0sAvOg
         d/Bkmv17g04jT17wGoVmFHYkBD3XeYdwvygpH4YZOFneyHH80pY0gqLRQcWM8jVaFy
         wjFEx1y7yoom81Shx1YrYsjdMV09UkhyaeSGt1m+e7cHYg2jp0uEG5Ub/fmIzkx3Dn
         y6Oa9eliDjIAw==
Message-ID: <62d8aff43456051cb607999a7db0b5cd.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230321201022.1052743-1-noltari@gmail.com>
References: <20210315122605.28437-1-noltari@gmail.com> <20230321201022.1052743-1-noltari@gmail.com>
Subject: Re: [PATCH v3 0/4] clk: add BCM63268 timer clock and reset
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez?= Rojas <noltari@gmail.com>
To:     devicetree@vger.kernel.org, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, krzysztof.kozlowski+dt@linaro.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, p.zabel@pengutronix.de,
        robh+dt@kernel.org, william.zhang@broadcom.com,
        =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez?= Rojas <noltari@gmail.com>
Date:   Tue, 21 Mar 2023 15:54:21 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting =C3=81lvaro Fern=C3=A1ndez Rojas (2023-03-21 13:10:18)
> Broadcom BCM63268 has a timer clock and reset controller which has the
> following layout:
>   #define POR_RESET_STATUS            (1 << 31)
>   #define HW_RESET_STATUS             (1 << 30)
>   #define SW_RESET_STATUS             (1 << 29)
>   #define USB_REF_CLKEN               (1 << 18)
>   #define UTO_EXTIN_CLKEN             (1 << 17)
>   #define UTO_CLK50_SEL               (1 << 16)
>   #define FAP2_PLL_CLKEN              (1 << 15)
>   #define FAP2_PLL_FREQ_SHIFT         12
>   #define FAP1_PLL_CLKEN              (1 << 11)
>   #define FAP1_PLL_FREQ_SHIFT         8
>   #define WAKEON_DSL                  (1 << 7)
>   #define WAKEON_EPHY                 (1 << 6)
>   #define DSL_ENERGY_DETECT_ENABLE    (1 << 4)
>   #define GPHY_1_ENERGY_DETECT_ENABLE (1 << 3)
>   #define EPHY_3_ENERGY_DETECT_ENABLE (1 << 2)
>   #define EPHY_2_ENERGY_DETECT_ENABLE (1 << 1)
>   #define EPHY_1_ENERGY_DETECT_ENABLE (1 << 0)
>=20
> Also excuse me for the delay in the v3, but I totally forgot about this...

Please don't send as a reply to a previous round. It makes applying the
patch series more difficult and buries the new series deep down in the
mail thread.
