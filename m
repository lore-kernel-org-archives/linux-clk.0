Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903F1C43334
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 15:12:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbiGOPMv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 11:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233019AbiGOPMt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 11:12:49 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95FBF7C193
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 08:12:48 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id u14so6054467ljh.2
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 08:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=76oZtBS/foVZEkUC9OiorabaBtf3lSNeNe99cdZLStA=;
        b=v5v5inoEi6PQuOUkPu6nO36nLN/ZY8ivrBX1AUTWy6RGRCdAv0Ptwd8yobv7HhXrys
         7yg9wYXKmTfUI4Imf3ZNtTzCKu+O77avrHbvOblPAd7AgOfyKE2g/1TdeuNXuV1sZnND
         iQweLAJ8iDH6b/wPddg7lvKXZSiT+nsMiScCwT2I7mhhwfTNn2VcKYxjIlUfap8Yfkbu
         QZrD20fpVrCsfaJDjvOhuQyButVlqV60wqfW34xg3zdAHXH9zIcS+dgQThlwGwmRySDc
         prUM3kOpIkdDVup+YY+sPRYqBWbMpaUeFL/zdgEF16zZMQsdZ5XVvlNvU9ILX5U+XrzI
         lcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=76oZtBS/foVZEkUC9OiorabaBtf3lSNeNe99cdZLStA=;
        b=Dm2moAIyp08CddFSInTF1cpDkaTA9qL82hOgSol9XkqfM3Uwbmc7ujHYJym5dlAK9p
         oFJShG2SLikcmG/DyLO5/IePNR1y1SufYwfU3O76IWs0Qbet5quNky+GP/+zgxvzSbru
         KTp4WgL6smHoC06h9hXlnWBPHnYLFQAd0kxM9m8KYhu+xx6hsoEbZ70i8kEbtGNinpnm
         7m5ia45I6afmmi57/r8ARYQAT9Q2DwFQyPo4u1az4HdaXAxLz1mm005IdXo7vqJNejvp
         SIzsAtqcKisfJzDa9uV6gGBkxG43uc/XR8S5fc8C85nyx/lIRByzt8rLEnGsIZoElZNL
         rxMw==
X-Gm-Message-State: AJIora+T1G3e9z+Y7A7GuYec8tcJFmzGcKSCOcDA5SqMX3jnEB9kjaRL
        wc6m0Zs2Y5was0FjVzWET+zJCA==
X-Google-Smtp-Source: AGRyM1ts3yMPaVarrKM2ncpHF2S97FKxw1xuAlGlSpaA7rSqLRt4K5FbQ1crX4P4is8LeEATejkiMA==
X-Received: by 2002:a2e:594:0:b0:25d:47ee:85ff with SMTP id 142-20020a2e0594000000b0025d47ee85ffmr7479924ljf.435.1657897966980;
        Fri, 15 Jul 2022 08:12:46 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s5-20020a056512214500b0047255d2111csm940406lfr.75.2022.07.15.08.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 08:12:46 -0700 (PDT)
Message-ID: <c5251107-33f5-d5e9-7977-eccb1c6e1130@linaro.org>
Date:   Fri, 15 Jul 2022 18:12:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: (subset) [PATCH v6 0/4] arm: qcom: qcom-apq8064: add separate
 device node for tsens
Content-Language: en-GB
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20220521151437.1489111-1-dmitry.baryshkov@linaro.org>
 <165716107313.864223.16495504646338874492.b4-ty@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <165716107313.864223.16495504646338874492.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/07/2022 05:31, Bjorn Andersson wrote:
> On Sat, 21 May 2022 18:14:33 +0300, Dmitry Baryshkov wrote:
>> Currently gcc-msm8960 driver manually creates tsens device. Instantiate
>> the device using DT node instead. This makes the APQ8064 follow the
>> IPQ8064 device tree schema (which is also closer to the way tsens
>> devices are described on newer Qualcomm platforms).
>>
>> Compatibility with the previous devices trees is kept intact.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/4] dt-bindings: clock: qcom,gcc-apq8064: move msm8960 compat from gcc-other.yaml
>        commit: 91a4cbf93326f2d27dda7361c43a5bb24cfd93c3
> [2/4] dt-bindings: clock: qcom,gcc-apq8064: split tsens to the child node
>        commit: 621f984840928f0bd14b20c86b70a15590ed2d3e
> [3/4] clk: qcom: gcc-msm8960: create tsens device if there are no child nodes
>        commit: 93b793d88da8b2c7afd63c64772666ec4274efad

I hope to see patch 4/4 to be also picked up at some point...

-- 
With best wishes
Dmitry
