Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17939C7EE2E
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 16:54:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjEQQxl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 12:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjEQQxQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 12:53:16 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5AF9D
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 09:53:00 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f41d087a84so1984375e9.1
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 09:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684342379; x=1686934379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8dOJVIGMX/56gfv9vT65ZzraMpImyEbSMTyJtUPlCLo=;
        b=2BVmhZvz4oCFmI5/DV5GvMVrMDeSuoxTJrL4iNd3Jxd8RMgHHaG2zBP3QGXd4XOrKH
         hnCaxYsoji/6w9ykNXsu7Fi6zdPHszF1Q4gQwaYtYi+alCroMmK3dTCvf76H24m0hBNH
         uPYMxYIcvwsv9oLoqcnRqkuJqG160ovtznAlXlPoISd+6G5FUe39gNEpXnHhlVhKSgAr
         j7cJBOpVpVr6bIWkD/AWH7j1IIm/DQGL+hgxy/nADAKFAC150PQwk4fwE0f01qyGHD+P
         Cp76uAflMqRUWC6k9pvk/7rn+QHXpv19LDYyCPOIgLeWLoQ8+IfQ09AyPHmlKEGKrCXG
         SwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684342379; x=1686934379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8dOJVIGMX/56gfv9vT65ZzraMpImyEbSMTyJtUPlCLo=;
        b=Bsz3x8NBgy7Raf/6Pn0ur2ANVnWgHHkyh+cRXCkBmwmQ52lMISMvut+TXs/0OkPp5A
         XDWgzsNyPZtTsBGuruuqmIta9RSDq3wNs0U58e5hyh+s8v+vU153n3xa7+n99LSfdYbo
         7kEMUjiKU7yvwAEVFkGZ/7ItVONMJPlcLy/HuUsw6qoQ0tW064VU9wTJqP7sc3sVb9vw
         tk/fDaiUUF9ekPxj4kmEX2W3lMbk+u/43ocs1lYSp+9F3R2ALylYuZr9Wo0PFUifb7n6
         xO5oyAQXuawKJSdHJtPPcoRHIR50oVzaBv1FJJVwSU7jw8Q1lJ09PBN58UpmC+gc6r1V
         1sVA==
X-Gm-Message-State: AC+VfDwRek5yc9hW9QMaYP41k8p/LSLwFZTQvnuLQoiX/yB5B+ogMkT9
        MN2py+UXUVQ+mLWv8KlsMsV9JA==
X-Google-Smtp-Source: ACHHUZ5oWXHIEKdFAwIxANhWR9lMlqKmEiYA0FORJIMDBWG4zKRbrOzb0ppHIUnnzPT2YmO1WjO6DQ==
X-Received: by 2002:a7b:cd01:0:b0:3f4:fe7f:3d18 with SMTP id f1-20020a7bcd01000000b003f4fe7f3d18mr2318552wmj.2.1684342378813;
        Wed, 17 May 2023 09:52:58 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id u15-20020adfed4f000000b00307c46f4f08sm3267555wro.79.2023.05.17.09.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 09:52:58 -0700 (PDT)
Message-ID: <94f8af4a-2555-052d-d04a-a0e54e0e2d13@baylibre.com>
Date:   Wed, 17 May 2023 18:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/2] clk/mediatek: Adjustments for MSDC rate accuracy
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
Content-Language: en-US
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230516135205.372951-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/05/2023 15:52, AngeloGioacchino Del Regno wrote:
> Changes in v2:
>    - Extended the changes in this series to MT8365 clocks
> 
> This series stops unconditionally forcing CLK_SET_RATE_PARENT on
> MediaTek muxes, as that should be set in the clock driver for each
> clock requiring it, and removes CLK_SET_PARENT from all MSDC core
> clocks to allow mtk-sd to select the right clock parent when doing
> mclk setting, improving the rate accuracy and avoiding both under
> and overclocks of the eMMC/SD/SDIO card, both improving performance
> and stability of the attached storage.
> 
> This series was successfully tested on MT8173, MT8192, MT8195.
> 
> AngeloGioacchino Del Regno (2):
>    clk: mediatek: mux: Stop forcing CLK_SET_RATE_PARENT flag
>    clk: mediatek: Remove CLK_SET_PARENT from all MSDC core clocks
> 
>   drivers/clk/mediatek/clk-mt6765.c          | 20 +++++-----
>   drivers/clk/mediatek/clk-mt6779.c          | 24 +++++------
>   drivers/clk/mediatek/clk-mt7981-topckgen.c | 12 +++---
>   drivers/clk/mediatek/clk-mt7986-topckgen.c | 12 +++---
>   drivers/clk/mediatek/clk-mt8173-topckgen.c | 24 +++++------
>   drivers/clk/mediatek/clk-mt8183.c          | 22 ++++++-----
>   drivers/clk/mediatek/clk-mt8186-topckgen.c | 24 +++++------
>   drivers/clk/mediatek/clk-mt8188-topckgen.c | 40 +++++++++++--------
>   drivers/clk/mediatek/clk-mt8192.c          | 23 +++++------
>   drivers/clk/mediatek/clk-mt8195-topckgen.c | 46 +++++++++++++---------
>   drivers/clk/mediatek/clk-mt8365.c          | 38 +++++++++---------
>   drivers/clk/mediatek/clk-mux.c             |  2 +-
>   12 files changed, 155 insertions(+), 132 deletions(-)
> 

I will try to test it next week on MT8365 SoC.

-- 
Regards,
Alexandre

