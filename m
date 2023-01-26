Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B03DC05027
	for <linux-clk@archiver.kernel.org>; Thu, 26 Jan 2023 08:56:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234330AbjAZI4r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Jan 2023 03:56:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233264AbjAZI4r (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jan 2023 03:56:47 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 562A646160;
        Thu, 26 Jan 2023 00:56:44 -0800 (PST)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 614616602D35;
        Thu, 26 Jan 2023 08:56:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1674723403;
        bh=vWrEwXXnA+bh7FpREBlnFxIhMjPpoC7sXkVgldlRvJU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=fpn8QBJJEnlOmo8CO36EN5fEhgUr0xjwTAV6/zl68U637DRFXGhToQlfWY1HNgn2D
         S/Q8wUbFtJTEyQXm8qv6TBarcaefVZ0bBTIPC+WaroQHk0H7ZVO7pwjcXOegVej8b8
         Mu3uX5rzSmZCoez7nefFujuQ2/dz90e44VpRu2skFtUl1XgKlfh6jFBX24QGOZ89HD
         SgbLCYdSsqGUSfi0buO5ol8KnLB98XwKMICMHVAdcRId6mw8NqqQnxyHunVCAecM5S
         i+DB2y5Mu8+sx6QqwYyCJVs4NWjZB2bRDaULCW42tbC1z6vzYziKRd+Hjico+HJIdF
         neKt7uxJBM3Zg==
Message-ID: <cc98e05b-714f-ba62-bc1e-b4f550d7f401@collabora.com>
Date:   Thu, 26 Jan 2023 09:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 3/3] clk: mediatek: add MT7981 clock support
Content-Language: en-US
To:     Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Jianhui Zhao <zhaojh329@gmail.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Edward-JW Yang <edward-jw.yang@mediatek.com>,
        Johnson Wang <johnson.wang@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Fabien Parent <fparent@baylibre.com>,
        Miles Chen <miles.chen@mediatek.com>
References: <cover.1674703830.git.daniel@makrotopia.org>
 <8136eb5b2049177bc2f6d3e0f2aefecc342d626f.1674703830.git.daniel@makrotopia.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <8136eb5b2049177bc2f6d3e0f2aefecc342d626f.1674703830.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Il 26/01/23 04:34, Daniel Golle ha scritto:
> Add MT7981 clock support, include topckgen, apmixedsys, infracfg and
> ethernet subsystem clocks.
> 
> The drivers are based on clk-mt7981.c which can be found in MediaTek's
> SDK sources. To be fit for upstream inclusion the driver has been split
> into clock domains and the infracfg part has been significantly
> de-bloated by removing all the 1:1 factors (aliases).
> 
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


