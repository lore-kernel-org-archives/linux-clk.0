Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DFAECAAD1
	for <linux-clk@archiver.kernel.org>; Thu,  1 Sep 2022 09:43:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232177AbiIAJn5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Sep 2022 05:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232830AbiIAJng (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Sep 2022 05:43:36 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D58027DF4
        for <linux-clk@vger.kernel.org>; Thu,  1 Sep 2022 02:43:35 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id m7so14675429lfq.8
        for <linux-clk@vger.kernel.org>; Thu, 01 Sep 2022 02:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=XEXQPbFYUmyLFpItRto0dJ/tByAUIKacMuPLqwHCo+s=;
        b=Gfpfg8Sf0jfSEIFCwMWjk3s/aMXgKh97v8gftg2tIeA0hFhfcr9sF82fGNdBg60CS8
         6QOTX1cQ0bOzLBNDeN0xpUCY/VfhGfKzFpUEC/anMa9dbPhSiKlNvCnaFCxks7sdT5v8
         mu+7BgT8JYpHUGRxUGpPMI/IpPmcrFmdGbmvEdNPySVhZEmZq3M1o65Xm+/1Q8KhJGPq
         gSpai+QkPC6f8g6yyRsfgH3oBouVnCSfHT3IBO/K1+1H2ytY7teisWFsxQH/6V6BC3Ns
         KeIyllpNim/cEtVMwepqRgJmRRGfFaOta1JxIPQp3zn1QG/05V5mBT1hQRJOQqnQCov6
         pkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=XEXQPbFYUmyLFpItRto0dJ/tByAUIKacMuPLqwHCo+s=;
        b=OVmDwhVnMlNZqKJ34if/Q6zHy6MyX4EeXbYeYqe9yUQq56NdtqbKx4dIm5WcbaW30P
         be+bZb9H0BVdu2c5/NEeZYa/mKBjEDunaGETKd0JJsuU29EwXBwMWR9qRhDgqp8UGZBv
         lv1SlnHDcFapBegGd5yg04JCzhR2gJMHKuAgdIA1qT7witCh99XtVVMyicSPlNDt0u98
         XWsrbMhCSgrSG17e6I6pkvTBH2y2ve6DOUqKGJ3N/X4NsP2xrKXE0z1OaA/L47EwHR+j
         VZN6htUvKIR/+Mxib3ONAl0cnfn+SvrdJEHZyCl/xSz3Jqs36LzN/zcVBxQcE+eKhEH/
         w06w==
X-Gm-Message-State: ACgBeo0BCZ0Lp/+b0eMy1Ysdcp5AvwX23PalbjOctCUtGIBOpxFwczwh
        b6dyxmYrp35Af/DjfUKtbNEjuA==
X-Google-Smtp-Source: AA6agR4UzJqQQVStYvJ8JDhqeBGqAZuikeg2f1LAfkytqNgMWk4O3K4J51+OxtTxriFWxC20JQQqcg==
X-Received: by 2002:a19:505b:0:b0:494:6549:ade7 with SMTP id z27-20020a19505b000000b004946549ade7mr6436821lfj.62.1662025413899;
        Thu, 01 Sep 2022 02:43:33 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id u1-20020a05651220c100b0048b4690c78esm1180497lfr.288.2022.09.01.02.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 02:43:32 -0700 (PDT)
Message-ID: <91ed22e5-41c3-8a09-101f-7d3b7555cd7b@linaro.org>
Date:   Thu, 1 Sep 2022 12:43:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/4] dt-bindings: arm: mediatek: Add new bindings of
 MediaTek frequency hopping
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Edward-JW Yang <edward-jw.yang@mediatek.com>
References: <20220831124850.7748-1-johnson.wang@mediatek.com>
 <20220831124850.7748-3-johnson.wang@mediatek.com>
 <b1296c37-5283-81f7-1939-7ea20e1f4d0d@linaro.org>
 <1fae0c47-fff9-89e9-c849-536d167d741d@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1fae0c47-fff9-89e9-c849-536d167d741d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/09/2022 11:04, AngeloGioacchino Del Regno wrote:
> I know it's going to be a long read, but the entire conversation is on the list [1]
> 
> Cheers,
> Angelo
> 
> [1]: 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20220612135414.3003-3-johnson.wang@mediatek.com/

I see there hundreds of lines of quoted text without trimming to actual
parts, so no, no one is going to read it.

Best regards,
Krzysztof
