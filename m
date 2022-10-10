Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28397C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 10 Oct 2022 08:08:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbiJJIIn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Oct 2022 04:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbiJJIIh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Oct 2022 04:08:37 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F77D57549
        for <linux-clk@vger.kernel.org>; Mon, 10 Oct 2022 01:08:32 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 0ACA36601F8A;
        Mon, 10 Oct 2022 09:08:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1665389307;
        bh=P6nhCoRjweIKc4fu9zRhMCufhOtLLw8r/9rd+wJojYE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=daoejMEgofkQYSO/lxL0gxokoM7H2sso72dGfR8HiRb7tpF0TLpU2q+N8cyKrrV/v
         /0Vc+bZ8qFzyTT6QE3WKDE51ji7rkyoKjpnx6A7JIVI1Y20URTBZz0do7y2BCqosFT
         AKxm4/JiitZ16I/ui8Jq+FQ2t4x7xVjOluojkQJZ8+am3MMGRVpKCfhpmtpruXpsa2
         NS2XIB2tMwo4aA3/Y3WvQyydBrEPX8L64AJH/VzCXqABiC1Utz77V8LjZvDSdd/H/v
         Eh5Og+HH7rRz2oUD3qiA7Er/6YeV44feve/kFLIogyKT77g7yQ9jE4TLCVh/4JQGdb
         wEGlPULXfPu0w==
Message-ID: <eccdb9ec-90d1-c24b-41e0-5230cf29b84a@collabora.com>
Date:   Mon, 10 Oct 2022 10:08:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] clk: mediatek: clk-mt8195-topckgen: Fix error return code
 in clk_mt8195_topck_probe()
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc:     wenst@chromium.org, mturquette@baylibre.com, sboyd@kernel.org
References: <20221009025056.35311-1-yangyingliang@huawei.com>
Content-Language: en-US
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221009025056.35311-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Il 09/10/22 04:50, Yang Yingliang ha scritto:
> If devm_clk_hw_register_mux() fails in clk_mt8195_topck_probe(), it should return
> error code.
> 
> Fixes: deeb2af77cf6 ("clk: mediatek: clk-mt8195-topckgen: Register mfg_ck_fast_ref as generic mux")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


