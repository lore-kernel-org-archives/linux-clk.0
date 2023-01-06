Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6770CC4708D
	for <linux-clk@archiver.kernel.org>; Fri,  6 Jan 2023 12:50:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233524AbjAFMul (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Jan 2023 07:50:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232864AbjAFMuk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Jan 2023 07:50:40 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78C94745AD
        for <linux-clk@vger.kernel.org>; Fri,  6 Jan 2023 04:50:39 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id ja17so982418wmb.3
        for <linux-clk@vger.kernel.org>; Fri, 06 Jan 2023 04:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rePk4otgmJsoUZx3wQir/mu8uKDtUT/unn9iCMuDGXc=;
        b=MqIJJ92YjJFSQvhXLtVY8CkFHRQ13ALDrV/xKqsiSFrxW3Xqh3zr9vjSFz9dtQlu0O
         vargvSI325gDktqjgCCUqTQvoNQFTolCA9ixi1w+O9pzujBdaK4FZu2+X/wapQAiqc1J
         vDegVa3jmE3oWMQVaKLQgSYCBLj1KKpxUU65gCkG/C7oKimli2qjdn4vQMpiu2Q5yE5m
         RDifRiDL6Z+QRTUevhcXVn4vowqHiXGiI/Z8H+16FyUX0cpAYITZpffjxz214WSF0P0Y
         YzfnelvTityLktxfnTcKBSHFVV0ZJe3WGxJcDFpx1SYlgV/AXu4aSVTw5O7+0pdvqZJi
         co6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rePk4otgmJsoUZx3wQir/mu8uKDtUT/unn9iCMuDGXc=;
        b=GFS49TeT0SfsrRBzC0xBu8S3cEk/oawOKj26N/kU4Jg8IsFfiDZ4iJI3dOffoFKxDn
         tIb29KKQXGnZ+e9JX/bp75V27IiFZJQVc3AFX2DqbFZTyFikMAv1m1X6qZNIuGWHnBWV
         86EIXMKvS7HVNXswUTlZsH4PEtiPVtRKPEn/AMD2bQ7lzJfh0Bn9fvb1sZt+vt0QauGc
         dxyg6D1qC3sDJ3snvuk2MFpUnobGYqpvaf0ihvp7SGxULGOa/Ga4zzpe4LuguH0vTsq6
         TVG8jCt4znpRJz1dxA1qY3BXoQolpgpwbqyYnr1dlT2Aj2elvj/zaECGcgEoAOD4Af/v
         XXfA==
X-Gm-Message-State: AFqh2krBhmicnS0sw9C7hsMNZE+Wridfa9/EaxhHlLuX24Av6CBD1jWk
        SNhvQW+UU1Ea/2D2N/1FN25aaA==
X-Google-Smtp-Source: AMrXdXtyoYVLJQIjlfYxEMk1BpTcEtQndRolLJIQH+LL6HNl3W2EK7y2mrtxK6fpyK1Iu3cAyTteFA==
X-Received: by 2002:a05:600c:3495:b0:3c6:e62e:2e74 with SMTP id a21-20020a05600c349500b003c6e62e2e74mr39719299wmq.15.1673009438067;
        Fri, 06 Jan 2023 04:50:38 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u16-20020a05600c00d000b003cf4eac8e80sm1880432wmm.23.2023.01.06.04.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 04:50:37 -0800 (PST)
Message-ID: <ed1b6934-a836-65ef-86a4-18706345ec29@linaro.org>
Date:   Fri, 6 Jan 2023 13:50:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 03/12] dt-bindings: clock: qcom,mmcc: define
 clocks/clock-names for APQ8084
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
References: <20230105134133.1550618-1-dmitry.baryshkov@linaro.org>
 <20230105134133.1550618-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230105134133.1550618-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/01/2023 14:41, Dmitry Baryshkov wrote:
> Define clock/clock-names properties of the MMCC device node to be used
> on APQ8084 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

