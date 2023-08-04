Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E9BC04A6A
	for <linux-clk@archiver.kernel.org>; Fri,  4 Aug 2023 15:25:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbjHDPZv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Aug 2023 11:25:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232018AbjHDPZc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Aug 2023 11:25:32 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A94C74C22
        for <linux-clk@vger.kernel.org>; Fri,  4 Aug 2023 08:24:55 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fe27849e6aso3868466e87.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Aug 2023 08:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691162693; x=1691767493;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O1Or5NpNw41SHQj2iyH+eJyA3dinn8/BZZ3KWUyyGdY=;
        b=HGy68hWNUTpYoQmPbBUKb6KmzzOSlxuaLUpFV5oYNPo95vLciBnk45JtiI9QKRPdhx
         cL1UedO1TlShJcR/zgpn+Rg4UANbDv20yOYr1G1JU1zjfPLDjD1eVFpCwNRHicyjSOni
         MPMfWdHl6Mv1gh/fa459OnYp0y2XMWfBVSQ4K/x9FndJCx8Kj5/zKGl2MmB/eRZ0hwNL
         WgB6kNcyfErUQIvkDDP0pdYfstqPZSPXpO4KExFKnIAMeBks60QAKLaRj3QsVzfvXQGe
         F0pnqJGO8SL39wV2uk7eMQvLbo7ayo0JlSUwlUVyaDdbKpf5lEZls2GBtiu4JEcqeh4h
         c5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691162693; x=1691767493;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1Or5NpNw41SHQj2iyH+eJyA3dinn8/BZZ3KWUyyGdY=;
        b=IMVfa34oZyeVMBCxG4SOH06Iwwrhbv3QKZCYhOsoQGsCPzSd8dkWwcXkZ+AOjvwTuZ
         HZToPjlNh2JfMTuJ4u5aYvsSfOL0mAj9MU+pYS41603MJGAcDBqfw3XOyTlThQtVPCMr
         vEnisbLPeRCI7mb9SnO/P1SzOmMiDBAkCM4DHrF7pSdg5kBKKjFA8CZLB+Ek85JzUS0h
         uknrOnGZxUIvxMYp3OSH7y0Nb+gs5ik6y9wjzbYEpQdnRXTLMysUiwZ5OczBLX9zUfk+
         gXRaKieRVJAoUnYzE0IQgxhFqzHYyOlIaqft5ogjA2BdgTRGCTGsm/dtsFs1d+F4LrPf
         HAhw==
X-Gm-Message-State: AOJu0YxF4KqtEykb9iPLPcn+tGpkzLb/XNSo68411hXxeTiZPXwhLx4A
        z68KwJ26x18hkd2sgWB2mLxg6w==
X-Google-Smtp-Source: AGHT+IGjXT+2eDwqicNrccsDlhQSZH8EsWtYCj4nBKE927hnDWkDF04fzthDynVquMC40LvH2Oyqtg==
X-Received: by 2002:a05:6512:2149:b0:4fd:faa2:884c with SMTP id s9-20020a056512214900b004fdfaa2884cmr1570202lfr.29.1691162693232;
        Fri, 04 Aug 2023 08:24:53 -0700 (PDT)
Received: from [192.168.1.101] (abyk53.neoplus.adsl.tpnet.pl. [83.9.30.53])
        by smtp.gmail.com with ESMTPSA id u28-20020ac2519c000000b004fe38e566cfsm408201lfi.280.2023.08.04.08.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 08:24:52 -0700 (PDT)
Message-ID: <1532622f-0ba8-4af1-b44a-eecf7fbdfc70@linaro.org>
Date:   Fri, 4 Aug 2023 17:24:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-sm6350: Fix gcc_sdcc2_apps_clk_src
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230804-sm6350-sdcc2-v1-1-3d946927d37d@fairphone.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230804-sm6350-sdcc2-v1-1-3d946927d37d@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4.08.2023 16:09, Luca Weiss wrote:
> GPLL7 is not on by default, which causes a "gcc_sdcc2_apps_clk_src: rcg
> didn't update its configuration" error when booting. Set .flags =
> CLK_OPS_PARENT_ENABLE to fix the error.
> 
> Fixes: 131abae905df ("clk: qcom: Add SM6350 GCC driver")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
