Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCE2C4332F
	for <linux-clk@archiver.kernel.org>; Wed,  2 Nov 2022 09:12:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbiKBJMx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Nov 2022 05:12:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbiKBJL7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Nov 2022 05:11:59 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC8DD27DFE
        for <linux-clk@vger.kernel.org>; Wed,  2 Nov 2022 02:11:18 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id f37so27167994lfv.8
        for <linux-clk@vger.kernel.org>; Wed, 02 Nov 2022 02:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gKuPjdWLjmuOURV2Y/juGKCDch+E7gH5+a1ecFUi7wc=;
        b=yrRN4yGxnRVU/qumQdRHUjulC2bB243hbcXg92j0SvuzPfxsPUmMhIXJcSY6Qv7/Zr
         KrelyH+vCKrpgv+rnpMQbvkMorzgIvyv0eV8YT9tbx0G1MY4BO4hd9N+PslAlLa6MtCM
         9jJK+q9RcG8OXDaO4AgdU0dHI3MFNZEY/wfRXFileEDtOdpPb+b2U0nLBaAWs3jy4aHB
         Ko4zlZU+gaKQciYVTySKbwqY6rJQU9KH1uqVIXGAyfdI2eos/Uy32p8t4X30lG/jfKVQ
         ogz2UJ8pHjnbMKhsHcIGvU+qA5sC5W7PKGoGb+iuLUvLznhQRkR6GoG2vhISschcg4JZ
         vUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gKuPjdWLjmuOURV2Y/juGKCDch+E7gH5+a1ecFUi7wc=;
        b=dK9rYRaCAmiFjDknDspaxbIi5JcYkJOn3u/WWrq/6hYPHutFT3RBDK3wCcA3TNt+Ck
         X4O6GjIGXp/sEXEO0++k/EGgykCTaY8fhPH1xrA/ZrnD83ZJB38puXpGXnhM8q9F1tmD
         0QYRjcLW6AyMfnW/MjTbHa9ObIAo+Hq9qFmelHmkJqpKX/WAYwjo7tkWNdlNy/QIOeh3
         Bz/nNIp2Ui6LsSbcTMyzFh2MpYnkwJ/sopkk08n7ohTk2r/7b/fHGvAm7fVLgs+1j46P
         QXkVUbuMr2Id+Qg0Fuy5e0ElVH8s3yfEp7Z7z948w07eg+PNUpPDPcLMkVd57xMC7Nir
         a7UA==
X-Gm-Message-State: ACrzQf2AYlFzWTIg+PcGXYyPu8jlU/Ocl+YEDSmf/m5rc2GdyMhfOUc/
        D0SThVM3vV9HmJmS0m1tA9Ghxg==
X-Google-Smtp-Source: AMsMyM7z+0HcM3cE/rFtdLEKXxPZLNKW1MeUqcGmFCzjRwS6uSNWuXjkEHKhQq6N6vSCBdDNaeNowg==
X-Received: by 2002:a05:6512:2350:b0:4a2:4523:cd08 with SMTP id p16-20020a056512235000b004a24523cd08mr9653986lfu.231.1667380278272;
        Wed, 02 Nov 2022 02:11:18 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id q17-20020ac25fd1000000b004a2ae643b99sm1924375lfg.170.2022.11.02.02.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 02:11:17 -0700 (PDT)
Message-ID: <6b0e9539-864e-77e0-0010-66d5053c9730@linaro.org>
Date:   Wed, 2 Nov 2022 12:11:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 4/5] clk: qcom: dispcc-sm8250: Add missing EDP clocks
 for sm8350
Content-Language: en-GB
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20221102090140.965450-1-robert.foss@linaro.org>
 <20221102090140.965450-5-robert.foss@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221102090140.965450-5-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/11/2022 12:01, Robert Foss wrote:
> SM8350 supports embedded displayport, but the clocks for this
> were previously not accounted for.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sm8250.c | 22 +++++++++++++++++++++-
>   1 file changed, 21 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

