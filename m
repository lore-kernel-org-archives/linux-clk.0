Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D692C07545
	for <linux-clk@archiver.kernel.org>; Tue, 24 Oct 2023 09:24:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234023AbjJXJYt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Oct 2023 05:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234013AbjJXJYs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Oct 2023 05:24:48 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F16C2;
        Tue, 24 Oct 2023 02:24:46 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id B69C26603102;
        Tue, 24 Oct 2023 10:24:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1698139485;
        bh=CAUfYWv2YFj91XMjH++uo8N0caauvtIZueuVlwW7mbo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Q2vRtHctkDuGlt4k0zp+0BXBxiyfukhatXmuBJqcYzfgGaCIYCbbJmXkbbknOmKan
         9BwzJrRl9ZdtfsypGKlWCl+lkA+IYn+WLtgF2Y+KTOJ2TYf1sf8k/RUmX/kgUo+GEc
         0jmp8FprvOCcqT/AmxpOewj9+XrPBTxsOSUtuoD8oSgB1fiNYK0T20vvscfvGTpJ1C
         vlcaZtEcemS4kp/QZdRDvp7AQOcTKaalkwQPB5jb60c50j1MAK2Jb1thmzlZZ+eUcW
         4PpkgPGsi31/xlxoqf/p7DTrOafWnnfd0N8c7iYkUraQQCilVhl4Vq00kccbDHjDTL
         7o/IPw5gQ68Lg==
Message-ID: <01a4467c-6a6e-472d-94bb-930ab12b5358@collabora.com>
Date:   Tue, 24 Oct 2023 11:24:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: fix double free in
 mtk_clk_register_pllfh()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Johnson Wang <johnson.wang@mediatek.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Edward-JW Yang <edward-jw.yang@mediatek.com>,
        Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <cd7fa365-28cc-4c34-ac64-6da57c98baa6@moroto.mountain>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <cd7fa365-28cc-4c34-ac64-6da57c98baa6@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Il 24/10/23 07:00, Dan Carpenter ha scritto:
> The mtk_clk_register_pll_ops() currently frees the "pll" parameter.
> The function has two callers, mtk_clk_register_pll() and
> mtk_clk_register_pllfh().  The first one, the _pll() function relies on
> the free, but for the second _pllfh() function it causes a double free
> bug.
> 
> Really the frees should be done in the caller because that's where
> the allocation is.
> 
> Fixes: d7964de8a8ea ("clk: mediatek: Add new clock driver to handle FHCTL hardware")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


