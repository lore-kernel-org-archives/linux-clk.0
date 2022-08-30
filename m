Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB77ECAAA1
	for <linux-clk@archiver.kernel.org>; Tue, 30 Aug 2022 14:56:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbiH3O4w (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Aug 2022 10:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiH3O4v (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Aug 2022 10:56:51 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C71DA11C158
        for <linux-clk@vger.kernel.org>; Tue, 30 Aug 2022 07:56:49 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id p5so12763105lfc.6
        for <linux-clk@vger.kernel.org>; Tue, 30 Aug 2022 07:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=SFuf6cO9xSesX47vp+nMPNrkFWqJziAxRMGo0ItDIgE=;
        b=Jmo1pgNLku6CVfOzFwkt15dNf1DJMvKCXQM2TnIjZZg8mE5vEHR7YfiRfMRkn/Ogbt
         10dY9eIBheBYNnMVtNYkkjdfSU2cwx/GYYWBmfBGFP1YmsIiX5/vdS7xHowZHGnDupjF
         uFsh1ZcvHxUDS9DMXV9XTm6Hbe+jM/5CPs0kgROImgRw7npk7FBe/TMr66hyQM/OHLtS
         jAYVzrQI6AG/MY6kKM39MKHNBDe3QvpbX32ySfOBi4dySrWzSfuCv6lp7lff6GtT+irO
         69fyBXianxsE4xDX2M/wXn0eal/kBkUymX5DyBsZTzh8cmzxFnhyQoBDorqz1Z6JUtI4
         B8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=SFuf6cO9xSesX47vp+nMPNrkFWqJziAxRMGo0ItDIgE=;
        b=MSCv7nFAwXBsH99pW2OA3I/4Mn5YOnO8L9nT7g61/DuKxUBCy/10tYA6ml9vRu7wNI
         sm/2zOH2qZtC+L1M/5zqS91vLdQgmpahizvrzZKfx69DP8rrp6NZbMprj54zvubRJvip
         4jTlgRDcAsfjxY1mIb5ij/c/YUtsAwfaBM37KY9iVq+8R/OjzmqWspW/9rDA2mAPlwem
         nuoNHArXAyeQKK50m4i5ZIMn0Iq0FcSpZBwfxa6k0qWBIlly+UhpWFwmVNyJwqINn7wA
         tk94SxrL2MoKQ57LWDcg7XOpw2QU6yTDxpPaDr3UhoRe7e7ZrfkPM3MfsldcCvaQY8Hp
         ES9Q==
X-Gm-Message-State: ACgBeo0vc7tRyhytmiHa4MM6UOyudvfS9sfSN2G/4+kXUPA2hRhIlJpl
        AFu0ZMW6qzBx4Q0mj2BJ5NrsMw==
X-Google-Smtp-Source: AA6agR6lhPdWWgHOUG9Pri/Ny+/ow2NiSK17zEyYPAyiDpOb5/SqP2iJpFFQIpvyknqSAhWop0RG8Q==
X-Received: by 2002:a05:6512:3d9e:b0:494:5ea8:8eba with SMTP id k30-20020a0565123d9e00b004945ea88ebamr5201536lfv.635.1661871408179;
        Tue, 30 Aug 2022 07:56:48 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id s10-20020a2e150a000000b00261cf313b83sm1768756ljd.18.2022.08.30.07.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 07:56:47 -0700 (PDT)
Message-ID: <e7c40568-b08d-e34c-81da-d979e31fec47@linaro.org>
Date:   Tue, 30 Aug 2022 17:56:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 02/15] dt-bindings: clocks: qcom,mmcc: define
 clocks/clock-names for MSM8960
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
 <20220623120418.250589-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623120418.250589-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/06/2022 15:04, Dmitry Baryshkov wrote:
> Define clock/clock-names properties of the MMCC device node to be used
> on MSM8960/APQ8064 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
