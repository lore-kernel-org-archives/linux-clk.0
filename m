Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC3BC61DA4
	for <linux-clk@archiver.kernel.org>; Thu,  2 Feb 2023 15:30:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232993AbjBBPaA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Feb 2023 10:30:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233097AbjBBP3u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Feb 2023 10:29:50 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25DDD93CA
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 07:29:05 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id t7so2056710wrp.5
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 07:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Z/XOX5bG8yGv4MzjlHggQMoXQ9pyCAc4znwfftCw9k=;
        b=tB32XjeQXip+lYFOTLbsvkHytujuR4kbcfeisnQ8i44dL8uRS+FPDbs2tn+JMklZDi
         n559ZoMz6kkNjRqJWEX7jY5sVNkftxOfBkAUCJfVSD8i2OrnWDD3f9nE6l2+Dt8pkkSf
         9f7ZYpU74R2eAdCI70IEbNA++iFj06qw1dsES7cG1mmAB8N0xbjDYYUpBTvLgvO9S6SF
         Bk5/LHYwes+VVju53vqnCeDKhCi6ItuBFHJTwJge3qUKKH1pRLT63J4ZewWebHSVzBZX
         plJbHhUoBqysHS1XdLr6tcrQA/pquWCDIWwFoCy6hPXwaSi8T7aArAy49fyuJBobBYLt
         eVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Z/XOX5bG8yGv4MzjlHggQMoXQ9pyCAc4znwfftCw9k=;
        b=NnI5yJHITkJ0G+07XbXFCM2UICdyNNPkTYFZ+DicTf2BcAikCw8Db9YJL8WyEaGl2g
         cf2998lC8ftZRhVo5Tg0UffGPvlrhE/hPWxv5gZpxiD2gMn6qeRJPn+tUkek+UsI9YI7
         HLcWuZiN98ayuQmmohSruP9spAIIB7QbyfSp5IHbEhY4HplMUhmYqaILwN2bSs/WulgT
         xFfHcy7Ql/hfceDPZQa8/7amG/eTgHjj2q0WAQYZo1fdzh6Ru7Sr6xByWcL9HZBUXBwG
         7EYyzH44S0MRxVNampd1O8xvJGzW7Z2AVEAmwI2OK23bnXMAiI/IHSH0ZPyEf5hd/LcK
         B/eg==
X-Gm-Message-State: AO0yUKXq/+fy3LFMs8kEzKK4kJvZkVhZkX64zI42mRtJstLMjozVhduh
        mxpW2XiCyhAug+v23GkF/fhDDw==
X-Google-Smtp-Source: AK7set+9qfRXRhN1bMZ6UNCmOYR0aQOlT93xQt/sZRo2/r0MRH6rubyno0cK9agN2E/VYKCVZWa22w==
X-Received: by 2002:a5d:4e04:0:b0:2c2:fa7:56b1 with SMTP id p4-20020a5d4e04000000b002c20fa756b1mr5785115wrt.56.1675351719601;
        Thu, 02 Feb 2023 07:28:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n9-20020a5d67c9000000b00294176c2c01sm20098243wrw.86.2023.02.02.07.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 07:28:39 -0800 (PST)
Message-ID: <4ffa873f-f83e-38c0-6286-8c89940b65d1@linaro.org>
Date:   Thu, 2 Feb 2023 16:28:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/6] dt-bindings: clock: qcom,a53pll: add IPQ5332
 compatible
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202145208.2328032-1-quic_kathirav@quicinc.com>
 <20230202145208.2328032-3-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202145208.2328032-3-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/02/2023 15:52, Kathiravan T wrote:
> Add IPQ5332 compatible to A53 PLL bindings.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

