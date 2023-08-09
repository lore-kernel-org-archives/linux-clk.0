Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798BEC04A6A
	for <linux-clk@archiver.kernel.org>; Wed,  9 Aug 2023 15:40:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232625AbjHIPkf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Aug 2023 11:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232335AbjHIPkf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Aug 2023 11:40:35 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035AB211D
        for <linux-clk@vger.kernel.org>; Wed,  9 Aug 2023 08:40:33 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5236a9788a7so908542a12.0
        for <linux-clk@vger.kernel.org>; Wed, 09 Aug 2023 08:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691595631; x=1692200431;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/yC5xase6smHlx6Uy5irliycOyGMEybwCUwk9LUBQXs=;
        b=t/wqd7+FII8iINHlG1eDUtpIETF3crH/5YRfn29MT/3ap33OUQN2dEGYsBCsN3Z17k
         g9R1pf0KoxuHWQrnAttp6GA6d8mUEaecC+rZN+jAn08N7/+7CIqca2FgQxGI7oB9jdI0
         ju+RHOvg7VRJYBXq9/pGNrw9GtqU7CWGkH1eua8S3E3LVRqBfdb2eos1XCwGUWSyKnAc
         Ux1gFGoS5hOhKKB0CQXtOdKRQcGHlFBLufrhLowjQGYR8UA0wtydQuuOO8HgLRwPAz0d
         NKclJ9eNcgSkgxpVAmhMS3JARTiAq+B677MptiYX1nru4Jbd5V0b/QKBXN1G5aIU/tYV
         nP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691595631; x=1692200431;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/yC5xase6smHlx6Uy5irliycOyGMEybwCUwk9LUBQXs=;
        b=X/Qp/vSxhi2w2iLLUx0d0P/20UDuXvdqruLlixxncSs8sBEgwbwmHXP2S7YQtXfWtL
         DHMnfVXeg0e52sc4H3Am/9zd8a8WQC5cUlSEglsQROE+f+PVGz6Gh5kV43yhH7wkMYBU
         GlOiEBRCP7IvE0nzKJ6A2VHJ0v5hRRpHdAATFNZJrBpg7uqMu5jvHR5UePFn7Oh+IUAM
         2mWYQtRudTKKN2AnWYU1IBUlI/meZeaZXLQFurPExh9i5JhNkGqE21umcnkiphhWCTZa
         41La2CKtoJ9zjWvLbwN/y3PBOd3dbqxxFse2K8gBHLTw6AoAcbGryYxzKWJ8W6oQwwWL
         Bbmg==
X-Gm-Message-State: AOJu0YwZ5i10D22ntgoP/7crDs2b1l3UkwRrYOaQWJ/Bm5M7fsdkHc4v
        OalqUkHLGo+I8nE58GqDRGHWmA==
X-Google-Smtp-Source: AGHT+IF13UWe1MzHgutPF37GkytYBpFYpWtYYBuaRYhBQgtEtu8j0k3Zh1rX2Rf9+htNW51UD1J/9A==
X-Received: by 2002:a17:907:2bf8:b0:99c:a2ca:4f54 with SMTP id gv56-20020a1709072bf800b0099ca2ca4f54mr2307609ejc.34.1691595631439;
        Wed, 09 Aug 2023 08:40:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id fy2-20020a170906b7c200b00992eabc0ad8sm8074852ejb.42.2023.08.09.08.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 08:40:30 -0700 (PDT)
Message-ID: <e42b0248-f7a7-5615-0c8a-8255c8a4548c@linaro.org>
Date:   Wed, 9 Aug 2023 17:40:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 4/4] arm64: defconfig: Enable qca8k nss clock
 controller
Content-Language: en-US
To:     Luo Jie <quic_luoj@quicinc.com>, andersson@kernel.org,
        agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_srichara@quicinc.com
References: <20230809080047.19877-1-quic_luoj@quicinc.com>
 <20230809080047.19877-5-quic_luoj@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230809080047.19877-5-quic_luoj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/08/2023 10:00, Luo Jie wrote:
> Enable clock controller config for Qualcomm qca8386/qca8084 chip.

Which boards or products in upstream kernel use it? We do not enable
drivers which are not used/needed.

Best regards,
Krzysztof

