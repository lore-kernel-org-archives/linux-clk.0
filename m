Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A5DCA0ECF
	for <linux-clk@archiver.kernel.org>; Tue, 12 Sep 2023 10:02:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbjILKCv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Sep 2023 06:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232158AbjILKCt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Sep 2023 06:02:49 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF686E64;
        Tue, 12 Sep 2023 03:02:45 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 8E98B660731F;
        Tue, 12 Sep 2023 11:02:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1694512964;
        bh=hlC/1svFIdbWKp9qBrWrxSwCb206P2KQbs899SSIBEM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=axNIzIf8fBuLT7XaoCVuCcBtpEjRhM5FGjyx4Q6VZtCqsKPfDZiAcjQUqfPmhqAJi
         Cj0KGiBZHvSxw72C4kkMeaJYMNFdi3vU1JrT04eHb6UvMhPdrVszZx9Z5tMtMIkEnj
         /IbD91PoMWitD+vAyU2wal1Hv4vK5HQjXlH0pQd0IEPfNTQEAmVHS/mD3ov+07imLi
         Ks6uu0JcRWDFVccA9mimOWMqPzsp+ASkh1PAlEqMpB3FJQvJIejacO1UmMCaUNXM2z
         4PS8Sy7UH5QGNreiqs5YvZ1QXac5aOYufl2TtepfvmE3JVDhXX1MJUgDERdZij9n3/
         fviC+8FSErEGg==
Message-ID: <e066650a-edd3-2c53-7041-50f4fbd272cb@collabora.com>
Date:   Tue, 12 Sep 2023 12:02:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/5] clk: mediatek: clk-mt6765: Add check for
 mtk_alloc_clk_data
Content-Language: en-US
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>, mturquette@baylibre.com,
        sboyd@kernel.org, matthias.bgg@gmail.com, wenst@chromium.org,
        msp@baylibre.com, amergnat@baylibre.com, frank.li@vivo.com,
        robh@kernel.org, owen.chen@mediatek.com, mars.cheng@mediatek.com,
        macpaul.lin@mediatek.com, cw00.choi@samsung.com,
        u.kleine-koenig@pengutronix.de, wendell.lin@mediatek.com,
        luca.ceresoli@bootlin.com, kevin-cw.chen@mediatek.com,
        ryder.lee@mediatek.com, wenzhen.yu@mediatek.com
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20230912093407.21505-1-jiasheng@iscas.ac.cn>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230912093407.21505-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Il 12/09/23 11:34, Jiasheng Jiang ha scritto:
> Add the check for the return value of mtk_alloc_clk_data() in order to
> avoid NULL pointer dereference.
> 
> Fixes: 1aca9939bf72 ("clk: mediatek: Add MT6765 clock support")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

