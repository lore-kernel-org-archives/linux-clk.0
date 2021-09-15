Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E34CC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 01:23:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 571DF61209
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 01:23:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231979AbhIOBZI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 21:25:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:58338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232814AbhIOBZI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 21:25:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 18B0C61164;
        Wed, 15 Sep 2021 01:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631669030;
        bh=64nXdNaboRHGPiOfE18v9wd+99WndHPRdbRxXUIuN+g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GmOFHx8nhiSekvsuh0utn7Luy8tL+mdg1YKFxPgmqZBISrPzO5cqGaYU9yNwbPKoM
         JaZjitWwKECn+V/ppfNMZIYtBma/z6T26T6KYEZD+0suX5xo5k/Hy7/2ctUdoC3ycU
         Mt+agjcpT5jBx3SBm6HxmfSwWA8pFo6KyqS4qPn+S36yMxvYUp/cAc4nY2eGevg4dQ
         rvU4nS81FofZm/kH3pt/yyAlN4tjPHSnmK9icVN/qXvvVQ+9urDS4XENhrwtWhXmlY
         M9gh349FQTamm7A7jHeRNQXKA+4Bi94TS/eQX1+tgn4Y2K3rxrhUvR6AZh1tpfg2ni
         Wtcv6wUQjrBhA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210901222526.31065-3-miles.chen@mediatek.com>
References: <20210901222526.31065-1-miles.chen@mediatek.com> <20210901222526.31065-3-miles.chen@mediatek.com>
Subject: Re: [PATCH v3 2/3] clk: mediatek: support COMMON_CLK_MEDIATEK module build
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Wendell Lin <wendell.lin@mediatek.com>,
        Hanks Chen <hanks.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
        Miles Chen <miles.chen@mediatek.com>,
        Lee Jones <lee.jones@linaro.org>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Miles Chen <miles.chen@mediatek.com>
Date:   Tue, 14 Sep 2021 18:23:48 -0700
Message-ID: <163166902892.763609.977824990105929862@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Miles Chen (2021-09-01 15:25:25)
> To support COMMON_CLK_MEDIATEK module build,
> add MODULE_LICENSE and export necessary symbols.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Hanks Chen <hanks.chen@mediatek.com>
> Cc: Wendell Lin <wendell.lin@mediatek.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---

Applied to clk-next
