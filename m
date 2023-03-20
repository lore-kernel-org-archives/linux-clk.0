Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F51C6FD1C
	for <linux-clk@archiver.kernel.org>; Mon, 20 Mar 2023 19:32:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjCTTce (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Mar 2023 15:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbjCTTcG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Mar 2023 15:32:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4888119134;
        Mon, 20 Mar 2023 12:25:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 953FE617B5;
        Mon, 20 Mar 2023 19:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA46C4339C;
        Mon, 20 Mar 2023 19:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679340339;
        bh=3fGON+9vlo8O171eVGVxUiOYPdlLCuWs1odLvjB4snM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IE1JaW8XlsCYmNWYDCunL7D09hl66J+hH+/gcUEnMiCbdg0pEAmcIFv3neTxEwYiD
         OcVvQg7zD3C5SzMO5YV2VlJKUlBYmG5rOAXFh5u7XTaDtwpAJdTpRmI1KQVniYkyI6
         fFir/5FQZHEnQZ2zNGTFXk5aKfNfZ/fnrphq+1sBIXHOukd7mXXENa771BbyOenUVN
         WXaRzhEgv+T1r+IPbdn/BRI29uJQwrwox3v5bXiR6OCKDWvnAkoyF2yzOlxfvSme8O
         Nu7JIZEtilOPLb233mha0boxScOBQ7BU4nPkEJcizS5HBixaz+tBF13ac/YR4NPZPh
         aVrtKp+03e/fQ==
Message-ID: <037449463ec342ec8d053163e4e58ee5.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230320091353.1918439-1-arnd@kernel.org>
References: <20230320091353.1918439-1-arnd@kernel.org>
Subject: Re: [PATCH] clk: mediatek: mt81xx: Ensure fhctl code is available
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Edward-JW Yang <edward-jw.yang@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Johnson Wang <johnson.wang@mediatek.com>,
        Fabien Parent <fparent@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 20 Mar 2023 12:25:36 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Arnd Bergmann (2023-03-20 02:13:42)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Just like in commit eddc63094855 ("clk: mediatek: Ensure fhctl code is
> available for COMMON_CLK_MT6795"), these three need the shared driver
> code, otherwise they run into link errors such as:
>=20
> aarch64-linux/bin/aarch64-linux-ld: drivers/clk/mediatek/clk-mt8192-apmix=
edsys.o: in function `clk_mt8192_apmixed_probe':
> clk-mt8192-apmixedsys.c:(.text+0x134): undefined reference to `fhctl_pars=
e_dt'
>=20
> Fixes: 45a5cbe05d1f ("clk: mediatek: mt8173: Add support for frequency ho=
pping through FHCTL")
> Fixes: 4d586e10c428 ("clk: mediatek: mt8192: Add support for frequency ho=
pping through FHCTL")
> Fixes: da4a82dc67b0 ("clk: mediatek: mt8195: Add support for frequency ho=
pping through FHCTL")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-next
