Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60609C05027
	for <linux-clk@archiver.kernel.org>; Fri, 20 Jan 2023 08:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjATIFz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Jan 2023 03:05:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjATIFy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Jan 2023 03:05:54 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40098AD04
        for <linux-clk@vger.kernel.org>; Fri, 20 Jan 2023 00:05:53 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so470992wmq.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Jan 2023 00:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qEiaE3Kt/Zqawbv0sFZW0DAx4T45mpd9/chaTTzXPeo=;
        b=mQ5bfQNkc8GF/MbtM8Odfdstz5NWj/maou5OY0puotwLLyBsWDPeF7gKwNS2a41g8F
         zKXRzDVR+5wpi2TVx/u1zNbJh7/XoHy7KZ3MJr8aeCTYOJQRftCpL7iw8jKlx2BvQshY
         nvSWtZIlyCewgwVCEMi+5q3R8t0wO7Z3+A5x56CNvi+6snktlz/JzdSabM+Df4dwiQUg
         /M0PrGarve2hGvmz7P4UUBnQXnBY7EoDHlAIQ5VfMebCR5FaL1uqlaiqlclcp/1yB7ew
         ZNevdtwswxXmwB8eqHoAeh+L4oynvI3oDm+2hZ/wj4Rj8s/+J9+nL/2/Sq1xRV+sxxK3
         o0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qEiaE3Kt/Zqawbv0sFZW0DAx4T45mpd9/chaTTzXPeo=;
        b=mTeFyxtbCoCz+7t3AETF7oqHjOexH36sc70jIwbo9W4VhdLq3AEo7CsqeP1BE/1hSA
         tR4ZIdeWcRBwmI60u6+jhxNUedUZrVndFGz7kebm+bkUw2YdpHjrsGjhhZDmZYZiE+2S
         RujKM4OLhfXVmWfwFb1iuw2hDxjXZ/u4HIkxjYJ3YOOUiUGliAncaTOW6jw8QwVnnsIj
         VzetnnToN4u9GZ3LkXwo6lqZAom1zeke3icCVMPPDluu44mCsFG/5QNnICARNuvkG4Ih
         qi50UwLPAEuwo82Q+/Frh2iZWo56Db60SUydTQtOwZLW7ddGzoGa/VzPoOAGj0CX+sM0
         CgWw==
X-Gm-Message-State: AFqh2koWaP1BlNtvr53bVwOFpwakXTlcIMX5vGn5JtSnsFWw97lqbGCs
        YkIa+tf2Uc5SpgoLgMrE1n8x5w==
X-Google-Smtp-Source: AMrXdXtel/zRPW7HHqCvaaP8It5ksyI0B/eOUV75c8cXYl4kkTUtSqoTiVeCApG97s//Y7gJnMhLNQ==
X-Received: by 2002:a05:600c:1c2a:b0:3cf:d0b1:8aa1 with SMTP id j42-20020a05600c1c2a00b003cfd0b18aa1mr12978979wms.0.1674201951795;
        Fri, 20 Jan 2023 00:05:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h11-20020a05600c314b00b003db0f4e12c8sm1556702wmo.34.2023.01.20.00.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 00:05:51 -0800 (PST)
Message-ID: <aaecbc1a-b43f-c7b3-ee47-0ca338f0196e@linaro.org>
Date:   Fri, 20 Jan 2023 09:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 2/8] dt-bindints: interconnect/msm8996-cbf: add defines
 to be used by CBF
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
 <20230120061417.2623751-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120061417.2623751-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/01/2023 07:14, Dmitry Baryshkov wrote:
> On msm8996 CBF interconnects power and performance CPU clusters. Add
> corresponding interconnect defines to be used in device trees.

Subject: typos and not correct prefix. interconnect: (without /).


> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  include/dt-bindings/interconnect/qcom,msm8996-cbf.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 include/dt-bindings/interconnect/qcom,msm8996-cbf.h
> 
Best regards,
Krzysztof

