Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573F5C54EAA
	for <linux-clk@archiver.kernel.org>; Fri, 27 Jan 2023 23:17:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbjA0XR3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Jan 2023 18:17:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232909AbjA0XR1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Jan 2023 18:17:27 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A363883065;
        Fri, 27 Jan 2023 15:17:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 07EC761DD1;
        Fri, 27 Jan 2023 23:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631BCC433D2;
        Fri, 27 Jan 2023 23:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674861445;
        bh=ed4erZ+GHit7ZLhnJyWp1GJF9wKHODWqJeCXVYmBkT4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JJD5/ZfNF4+6YjKWdsF8Uzl8GvF7wbH0nNxljBfqJUCgu6+pVSwPL9DuH88jcY74d
         70pUlWVO7Fwr1+hxjbBYW7YgT+UxWPLqjCtNjyRgwArY/NSoTjYdHhz4xMhGzZZApY
         LTvIZu9Lfr2EtBn4p+7QnMvlI2JGfJayOvCOD86NmfMFK37tH/K2fuKe/XSk0GtwKk
         do50o/qG3mbQ1PJAS/BfsrQRGAc/lrCxVZSgoUNViTjO+OLJpIdiD+EsChaHzyldmK
         xW5aCo55Ac4wLf44jXXhPcU40wa/d/mAY/3VarbKN24sAW/Bh5qEg47qL/bTXRv47k
         ZECKuuXjQpxgg==
Message-ID: <88903c0db1586ce9a12404969f757a7e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e353d32b5a4481766519a037afe1ed44e31ece1a.1674703830.git.daniel@makrotopia.org>
References: <cover.1674703830.git.daniel@makrotopia.org> <e353d32b5a4481766519a037afe1ed44e31ece1a.1674703830.git.daniel@makrotopia.org>
Subject: Re: [PATCH v5 2/3] dt-bindings: clock: mediatek: add mt7981 clock IDs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jianhui Zhao <zhaojh329@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Edward-JW Yang <edward-jw.yang@mediatek.com>,
        Johnson Wang <johnson.wang@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Fabien Parent <fparent@baylibre.com>,
        Miles Chen <miles.chen@mediatek.com>
To:     Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date:   Fri, 27 Jan 2023 15:17:23 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Golle (2023-01-25 19:34:05)
> Add MT7981 clock dt-bindings, include topckgen, apmixedsys,
> infracfg, and ethernet subsystem clocks.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next
