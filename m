Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA08EC7EE26
	for <linux-clk@archiver.kernel.org>; Tue, 23 May 2023 10:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235624AbjEWK6i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 May 2023 06:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233037AbjEWK6h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 May 2023 06:58:37 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451DAFF
        for <linux-clk@vger.kernel.org>; Tue, 23 May 2023 03:58:36 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f60e730c4bso1993555e9.1
        for <linux-clk@vger.kernel.org>; Tue, 23 May 2023 03:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684839515; x=1687431515;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i6w3sPrSomaK6vYQVMgu/kzGmiGHSmd5gsIIpynPqCg=;
        b=ZqWAbyEakVKPpFD/J/z3kYo7lHMPrxJjYYN7fnLelta0e/YR9Xmz3GMlu5Ym+Zr2pK
         ouFcbNJFQknKe98Zw+zI8kbqTwTPY6eLMWhFxiCcav6cBhxAlYya8e7aJifoqv0YAQzU
         fqpJjF/TVcp938OLCWo5wRRGjYd1aLzQskm3YZ/H1fsua80DSr8LOwtPOSAFSfUcYw3z
         LSIYmux9uryyokaXuXLYEvDl5CAxAu4mGn9Kb6kFhXm+Zq+FUdatjGkmMo43fAjnaKD3
         Sj39zh1BKS0x+qo2iOwFlMoYkW3UXJZ1dgius2stQHDAsri6U35E6rETfSLp0N6DFzc9
         sYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684839515; x=1687431515;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i6w3sPrSomaK6vYQVMgu/kzGmiGHSmd5gsIIpynPqCg=;
        b=caVtf71MInlFWOIGAeXEgROakR1ktPq7u2M3nJLKrpBXRhzzIeisbMcv36d8MpwCcv
         PQ0HTdwZwvkqwjXTWI3m8CViDhhuSNXPsop6xq6YEfxqAQ/L3myZQ0S5MWPpqrJiS4NS
         GKtXLEuGJYXpsiCMDTbdH+IsQeAS02u6yC12Xd9VSFR+O3/QbGCtQpP03OKQ2l513bs9
         8bOM51rzjvzIGgZl+1EWU93AbS8fUhNDlBASEeyPRht9q6DFuEvcg3pbUshL0GsewvBH
         Ai/v/qn2TceJ3akm44/M7nGPXRKyp16WXGtkK+y4SmtwvOnrKpz8reVEG+HSSbOXzmQ2
         Z1fQ==
X-Gm-Message-State: AC+VfDwdXSBVrVqXVwty965KwC81dzD8BBWs5uZ1/OtOLGRAU7Lz7SXw
        CibhZECyIpIXiQvrIzfzZsXzyQ==
X-Google-Smtp-Source: ACHHUZ7S/7Vokqqrj6HwXGeGDqC/4hlfaVpowDnOSEx8UktgQIfdViz/chTBaLrC2s80+i7yUZqCxA==
X-Received: by 2002:a1c:f402:0:b0:3f4:23a4:7a93 with SMTP id z2-20020a1cf402000000b003f423a47a93mr10738378wma.25.1684839514687;
        Tue, 23 May 2023 03:58:34 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id y21-20020a7bcd95000000b003f4e8530696sm11286717wmj.46.2023.05.23.03.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 03:58:34 -0700 (PDT)
Message-ID: <af25cbbe-bfa9-3d29-360e-e4f932d286c8@baylibre.com>
Date:   Tue, 23 May 2023 12:58:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] clk: mediatek: Remove CLK_SET_PARENT from all MSDC
 core clocks
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
 <20230516135205.372951-3-angelogioacchino.delregno@collabora.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230516135205.372951-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/05/2023 15:52, AngeloGioacchino Del Regno wrote:
> Various MSDC core clocks, used for multiple MSDC controller instances,
> share the same parent(s): in order to add parents selection in the
> mtk-sd driver to achieve an accurate clock rate for all modes, remove
> the CLK_SET_RATE_PARENT flag from all MSDC clocks for all SoCs: this
> will make sure that a clk_set_rate() call performed for a clock on
> a secondary controller will not change the rate of a common parent,
> which would result in an overclock or underclock of one of the
> controllers.
> 
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
> Reviewed-by: Matthias Brugger<matthias.bgg@gmail.com>
> Reviewed-by: Markus Schneider-Pargmann<msp@baylibre.com>

Tested on mt8365-evk board.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
