Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D64EB64DA
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jul 2023 08:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbjGRIhv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jul 2023 04:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbjGRIhu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jul 2023 04:37:50 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E49115
        for <linux-clk@vger.kernel.org>; Tue, 18 Jul 2023 01:37:48 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-314319c0d3eso5520289f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 18 Jul 2023 01:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689669467; x=1692261467;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oqJ9u4SGNXyNg5ofFpDQaS2ayWAUml8z0VaX7hI3krE=;
        b=OtQl27dbnrPDI7c6OCZexeFM1iYA9d10Zwj0fJcjU/xtspNfbU+DGUpo46ndDA1aIM
         gZg/OCmSHMHuQuMmvVeoXewgFNsxM0pIz6YgPuvE2vjcY+02CxfSY1UL4s58Ck/orQ1o
         rYFArvC3gq1tjaq/Ls0ZSpzgjHsBPeY3D5vbiHVrl2WILTRaSuFa8nM1XkvE1CtETZM9
         XWwbJsgMx7HE8f/oE1sWY419GaCKdr+lXUbKY+6EoISl4wlhMQT/T5YzFDmRxzggXRnj
         qhUkGGoMXPPBH5sSG3KZe0+qk5qr1Ys7Z9El9iEcXhdSc1GBSVBQVKEGBQdURjhdcgg/
         5zVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689669467; x=1692261467;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oqJ9u4SGNXyNg5ofFpDQaS2ayWAUml8z0VaX7hI3krE=;
        b=FjN12s2V7R820VSZjricRDketShzfP9hBa+wDilm2NQCYEmzc624d/aBWzSk90SdmN
         35653FoCnIIxiezTS52PdG8KzwA40a+ZPJDJns+xp05yBc8tTshbt6vMjLh9TpOtLOMg
         BqCIov60hm+k5rzgsf7fcFyfQo7w6IDd7MPrBcIdCLjqnNoASQQpqsP2WaGSgX70cMO6
         4dF17bIPxuy4MpH7U6n/SGRe5JQJVURTkVA14IX8d4h34bcisREWJtc1QiD2az/rN6aP
         pQOcjHBG1UyKFyqwrmJb5SiskEp48xuTijfRhk7MjtO7STWJbShS2FdQQDcR+5dhSWQN
         eHuA==
X-Gm-Message-State: ABy/qLZsrjVqdYHK4fII8o17dCdNTpYzSvdYZZyE9B7E3bd9HGx8qtAG
        hvezbMFKG1q4gQRkO+kusLmepw==
X-Google-Smtp-Source: APBJJlFK/PMnPBKxy9LlIGsKQCxu9WTEnU0WFv4qPQ2XmQ7jxfyYmlP+rhkxlTGNQbZ/CrvEDeEwUA==
X-Received: by 2002:a5d:49d0:0:b0:314:1e47:8bc2 with SMTP id t16-20020a5d49d0000000b003141e478bc2mr13465958wrs.0.1689669467371;
        Tue, 18 Jul 2023 01:37:47 -0700 (PDT)
Received: from [10.101.1.6] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n18-20020adffe12000000b003143be36d99sm1696453wrr.58.2023.07.18.01.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 01:37:46 -0700 (PDT)
Message-ID: <cf31ccd0-f11a-49f6-4e55-457fa78c8b86@baylibre.com>
Date:   Tue, 18 Jul 2023 10:37:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] clk: mediatek: clk-mux: Support custom parent indices
 for muxes
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, sboyd@kernel.org
Cc:     mturquette@baylibre.com, matthias.bgg@gmail.com,
        wenst@chromium.org, msp@baylibre.com, yangyingliang@huawei.com,
        u.kleine-koenig@pengutronix.de, miles.chen@mediatek.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20230713072138.84117-1-angelogioacchino.delregno@collabora.com>
 <20230713072138.84117-2-angelogioacchino.delregno@collabora.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230713072138.84117-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 13/07/2023 09:21, AngeloGioacchino Del Regno wrote:
> Add support for customized parent indices for MediaTek muxes: this is
> necessary for the case in which we want to exclude some clocks from
> a mux's parent clocks list, where the exclusions are not from the
> very bottom of the list but either in the middle or the beginning.
> 
> Example:
> - MUX1 (all parents)
>    - parent1; idx=0
>    - parent2; idx=1
>    - parent3; idx=2
> 
> - MUX1 (wanted parents)
>    - parent1; idx=0
>    - parent3; idx=2
> 
> To achieve that add a `parent_index` array pointer to struct mtk_mux,
> then in .set_parent(), .get_parent() callbacks check if this array
> was populated and eventually get the index from that.
> 
> Also, to avoid updating all clock drivers for all SoCs, rename the
> "main" macro to __GATE_CLR_SET_UPD_FLAGS (so, `__` was added) and
> add the new member to it; furthermore, GATE_CLK_SET_UPD_FLAGS has
> been reintroduced as being fully compatible with the older version.
> 
> The new parent_index can be specified with the new `_INDEXED`
> variants of the MUX_GATE_CLR_SET_UPD_xxxx macros.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
