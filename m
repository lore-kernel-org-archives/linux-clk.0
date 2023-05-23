Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE4DC7EE23
	for <linux-clk@archiver.kernel.org>; Tue, 23 May 2023 10:54:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbjEWKyw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 May 2023 06:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236619AbjEWKyu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 May 2023 06:54:50 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FF79120
        for <linux-clk@vger.kernel.org>; Tue, 23 May 2023 03:54:49 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-309382efe13so4529598f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 23 May 2023 03:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684839287; x=1687431287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JpbiziC971fCgdwZTyN3rsD98IhVaUnm83YTaNKNO9U=;
        b=Im2BC/cZZs/nLmwVnIFV9v2x4XddTP6s/jNYrRuPb3xtg9NZgt5845Wuc5CCzJxvqt
         jyU6XsT6NRj8lu7AJ5J4YVMk12Iq/b/NmbZG8HNvsD0OrGAuphe1ipnH+3MBZDws5+3G
         oaMhKoymv3iCrZVy6I7p9okVdADL8bMeeBKnFDHpjsJ9WGRlv9VklsgCniJ8Ods85TJk
         v0i0DgcH37rrtDFdpazXkVThlpPpN87h/v5/HOe8gTu8hKN+f+k6drBg7tK7d/XqsUBk
         l/cYOlh4HFLLgPauWUTOWMeZyyNlx7EDF6Eg+AInEETIWnW00/ZOF9MWNopq3qI/3HY2
         wx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684839287; x=1687431287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JpbiziC971fCgdwZTyN3rsD98IhVaUnm83YTaNKNO9U=;
        b=PFqrWwjcTIDF/AUp+eDOlG4wPYKN8SkVshzpQgMccXIEiDh4FEw6jErEmoq9VaQBLs
         XukuImPkWfCvmtihXat/QdCoIuKzmVIy+2hMvTEzXNGROx7pHpyADdjHzUWd2nUkZqrP
         SAxY80M0vZnnDDQSWP9InxvXkJ5P49a5JAsqH/HuTfJKJgNsijCm/jt1IUYs0T1e+Hz5
         FcWE3qKOy90y7n0Y9dRuaY5xN+7/MiIPASI8E29oJuCV6M8bdzTCByhWHSDJIF9vaYar
         kAKPgUR2Gr7rRVtOapTldKtbGFYj4NjjjboZH1x+zASwWg+VfRKgjUJbINqM3n72AfbR
         Qm8A==
X-Gm-Message-State: AC+VfDyoCwoAFYoF0oojJR/qiYc63wCt9DIMx0QZYC5Rvj6gdakLLHqq
        htENtFBwrl61qse+hvclcElitA==
X-Google-Smtp-Source: ACHHUZ4OkQbxZxWJnqMxYZkGGL+kAn4S+slV+wc6xaUCOai6Uyf3iG710FbrcdEtIc85NncyWLqDTQ==
X-Received: by 2002:adf:f409:0:b0:2fe:e137:dbad with SMTP id g9-20020adff409000000b002fee137dbadmr8403815wro.51.1684839287494;
        Tue, 23 May 2023 03:54:47 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id w13-20020adfd4cd000000b0030497b3224bsm10633223wrk.64.2023.05.23.03.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 03:54:47 -0700 (PDT)
Message-ID: <b91a60a8-0f9e-9020-8b06-e78f21ef1fed@baylibre.com>
Date:   Tue, 23 May 2023 12:54:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] clk: mediatek: mux: Stop forcing
 CLK_SET_RATE_PARENT flag
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com
Cc:     sboyd@kernel.org, matthias.bgg@gmail.com, wenst@chromium.org,
        chun-jie.chen@mediatek.com, mandyjh.liu@mediatek.com,
        miles.chen@mediatek.com, zhaojh329@gmail.com,
        daniel@makrotopia.org, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, Garmin.Chang@mediatek.com,
        msp@baylibre.com, yangyingliang@huawei.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20230516135205.372951-1-angelogioacchino.delregno@collabora.com>
 <20230516135205.372951-2-angelogioacchino.delregno@collabora.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230516135205.372951-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/05/2023 15:52, AngeloGioacchino Del Regno wrote:
> The clk-mux driver was forcing the CLK_SET_RATE_PARENT flag even for
> the GATE_CLK_SET_UPD_FLAGS() macro, as in mtk_clk_register_mux() the
> flag was unconditionally added.
> 
> In preparation for a change on MSDC clock muxes, stop forcing this
> flag and, where necessary, update clock drivers to add it so that
> with this commit we introduce no functional changes for the currently
> supported SoCs.
> 
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
> Reviewed-by: Matthias Brugger<matthias.bgg@gmail.com>
> Reviewed-by: Markus Schneider-Pargmann<msp@baylibre.com>

Tested on mt8365-evk board.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>


