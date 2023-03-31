Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96B2C76196
	for <linux-clk@archiver.kernel.org>; Fri, 31 Mar 2023 09:56:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232601AbjCaJ4b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 31 Mar 2023 05:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbjCaJy5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 31 Mar 2023 05:54:57 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCB3E1DFB1;
        Fri, 31 Mar 2023 02:54:38 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 1EB7B6603192;
        Fri, 31 Mar 2023 10:54:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1680256477;
        bh=uO0m8n14JLI7IWscEOpkhxVDFLw0lJfH0RRYJJ0etvg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=QO+tIyI2Vr3sxGboyaTqWX9ggHX4L20aTc8kN94LcMlW0vENMEuNnej/sb8+uNu1b
         AI87DzJcK3IrbmE21XuNt61EF1MmpcYbUQc2sbQyfGQyWjFe+eBjvpUqo1Dy+orlIK
         tX4fOIPY7SYJeufHNmlp86G0KrV/z2W3/XpZPPxM1xi4He9FNRtrO9bVSXmte6xoaB
         StHcmqRm1Z56HLhlLsVNkJPCDOsJRvWQGuFN1dNH8VfQ7zC3vR2qTWjEuls2VvP+/M
         C8Yfn+4JvusQ2JJSjP28Y7m0sEfhP05R/l1v7+6QX1BBxdDHZdOPmn1V6KgJBEdf/j
         aiEAVq82o/oug==
Message-ID: <abb74f12-a1c0-7d5f-ad11-c9c892a38fe2@collabora.com>
Date:   Fri, 31 Mar 2023 11:54:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 09/19] clk: mediatek: Add MT8188 ipesys clock support
Content-Language: en-US
To:     "Garmin.Chang" <Garmin.Chang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc:     Project_Global_Chrome_Upstream_Group@mediatek.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org
References: <20230331082131.12517-1-Garmin.Chang@mediatek.com>
 <20230331082131.12517-10-Garmin.Chang@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331082131.12517-10-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Il 31/03/23 10:21, Garmin.Chang ha scritto:
> Add MT8188 ipesys clock controller which provides clock gate
> control for Image Process Engine.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


