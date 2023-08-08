Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E21C001B0
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 15:59:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbjHHP7M (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 11:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjHHP5r (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 11:57:47 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43AB5FDB
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 08:44:06 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b9e6cc93d8so93760911fa.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 08:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509444; x=1692114244;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FFQCxsSM2uVo6fho+aJ/OGP5I8Vv4VqgpwCByYL+BHc=;
        b=gfo7JzaXYyc1Pbgt4GIcVIWxjkAP8U8es4arxC5I7fknH1F8wpFHz/jv8CGcvRHw4T
         pWotIfGWyp10JZmUrkLll98c6YifkqrZdGMuv4YDgWDkLIse5/fHwtd25+PLr841ksbq
         e6FjW4yfyPfvPzwFu6Ec93GIBoYrUC5XbSVGfCcXI21aRjJx7nHLgc9fT59Qpl/di7f8
         qcHfpjfWvIoJsMsjBlLDvsFyy/sesetMsLw9zvuf7hhk0mclCf/ZE81Irx7IJflqHC74
         5LiWxddaJzie5t+l4EeyBq3BBU8JXjZTBvpU6e7e8fKFfo3bREnwkanTA/116FeTc4Ss
         wLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509444; x=1692114244;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FFQCxsSM2uVo6fho+aJ/OGP5I8Vv4VqgpwCByYL+BHc=;
        b=PRt3P5v54BB6HMLQfel7LcmMoivaJSCglY27XB/IOLw7z1+VuDzmdod3GPS8oW7+S6
         fi0Qt+ibk0W7owmtuKw3sCdqJocgl9+w2x1yH6HlkL4sviF4AGAyC4Q3ejW9sGfdRtH4
         Hfy1XDwKOpkN3amZ6RARvHLTfzyxPBaE5jQLPhwMyNwunGlwbKQcRZkmon7GiqReMkQP
         AkeyJKDWl3lY1PCXw5YDo3DP6V+r2x8TCaCl0j93idCtYQBre+Qvi6WwxfrvIx/nFKH1
         vFBBwhuiE5QhoO6XJHAkT0kTuZzdeAji49A7tjTDborrp9tD6s1k9poVLtWOOeAAAJ5/
         JjPg==
X-Gm-Message-State: AOJu0YwgiufXC5RzcNfrDiIp3NYAaNzUUv0mg2vyZTi0akCpwuhRb5ZQ
        kRLxPmzZC8g9vJKfYbnMyH4K1xodg1zblR2kLh0=
X-Google-Smtp-Source: AGHT+IGHV9+UYzYvn5Ls/Ez67OotAAo6suz5ZNdonadR1VetzpLzmLYFNFXgqtoLI29IJKXXrA9EdA==
X-Received: by 2002:a17:906:220e:b0:99c:7333:199d with SMTP id s14-20020a170906220e00b0099c7333199dmr11376507ejs.30.1691507449835;
        Tue, 08 Aug 2023 08:10:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id y25-20020a1709063a9900b0099bc80d5575sm6773608ejd.200.2023.08.08.08.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 08:10:49 -0700 (PDT)
Message-ID: <f7f9b3a6-7ba3-3ac1-eb8f-4973d31690f4@linaro.org>
Date:   Tue, 8 Aug 2023 17:10:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 6/6] dt-bindings: arm-smmu: Fix MSM8998 clocks
 description
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20230531-topic-8998_mmssclk-v2-0-34273e275c51@linaro.org>
 <20230531-topic-8998_mmssclk-v2-6-34273e275c51@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531-topic-8998_mmssclk-v2-6-34273e275c51@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/08/2023 11:44, Konrad Dybcio wrote:
> MSM8998 was abusingly referencing one of the internal bus clocks, that
> were recently dropped from Linux (because the original implementation
> did not make much sense), circumventing the interconnect framework.

Please mention here that effectively you are dropping bus-mm clock and
the rest is the same as before. It's not possible to figure this out
from the diff alone.

With updated commit msg.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

