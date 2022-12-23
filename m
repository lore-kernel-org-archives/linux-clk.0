Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396D0C4332F
	for <linux-clk@archiver.kernel.org>; Fri, 23 Dec 2022 10:17:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235159AbiLWKRO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Dec 2022 05:17:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbiLWKRM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Dec 2022 05:17:12 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73DE81BEAE
        for <linux-clk@vger.kernel.org>; Fri, 23 Dec 2022 02:17:11 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id g14so4519314ljh.10
        for <linux-clk@vger.kernel.org>; Fri, 23 Dec 2022 02:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1u6P5JmEdjjPFnpioMwRM3NzE+xz8lzObWqbInEr8s4=;
        b=jXAsYxD559/NjQFfafcFTttoHR6Ys1BrWj+r8tOjiWjfeeK8HPAjRUhRYgVBnavd2r
         4qg7/Dwcn+2Jw1gjrwWJ8df4HhUAJW09R0FrBo/wt8ITYtQWRkffj7WZ37QiWX0zHXNB
         dYXLSiAcLkfw73tgitA4z93l6cKJTkb6JF72vKL3Rk1se6q/2/z/w3duWUIuPmMPQMmO
         evpIwuNdQ2W+91f27nPkMYUZUWRB0t912Wk9T7Il3aTJ5c6WIG5fSmbiEcwVNZ3Zqa9V
         G+u1XKjKiE2GIi6IEm2Kgx/aoHVIfg5KxcIsb5NYF8tSV7Bl9Ph68PIpmvrCBNHchbF7
         o5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1u6P5JmEdjjPFnpioMwRM3NzE+xz8lzObWqbInEr8s4=;
        b=chJXZPco/8rNT5W8gv/aXhQxu0k5Tzow0XknQoSlbAD8GAxfWUM5JgGwZHPE5wrCkd
         uFBoXZn1p21ZzKDVkfoRMH7LjjE+J94w23cbc6GVZjzHKvwT4KzbzZI2sFQo8HJZJMLy
         A0xHJSGgY8klcyBJDZwl55Ly1BW/pwnHZDHbsczTxQXtSPvjeCNI6vk8GmqobaaIXYr6
         KfsahDu2GbqTPdYy9yxq5iwj1OXgZzww8KTmy+p5KHtKR6gVwQUHCbWpSL3fpcYwms9N
         PITPnTyI63TV5s8yVwSLkHCo00lOfJ75uHEetVC5iFGf5iQ/0DgUQ9H/xStYMgv1yG1f
         MDFQ==
X-Gm-Message-State: AFqh2krhQN3zl7x/DV4ez5vIgfPqYLXc/C/5VkdH0G9O5K6wQDTVD+SL
        re3hTB36vxBEo+GJ970g2FY5bQ==
X-Google-Smtp-Source: AMrXdXsAL9I5ivFgD05+3G4gmxiAbxxri3dP5ysr4h1VzcC1Q6dsVmI2cXuMZ+hLJph2sh341cwtKw==
X-Received: by 2002:a2e:a376:0:b0:27b:620e:3dd with SMTP id i22-20020a2ea376000000b0027b620e03ddmr3093949ljn.13.1671790629798;
        Fri, 23 Dec 2022 02:17:09 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k6-20020a2ea266000000b00279e618444dsm359194ljm.122.2022.12.23.02.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Dec 2022 02:17:09 -0800 (PST)
Message-ID: <1f2901e3-c527-5528-9103-c722e56d046a@linaro.org>
Date:   Fri, 23 Dec 2022 11:17:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 4/5] ARM: dts: qcom: fix various wrong definition for
 kpss-gcc node
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Takashi Iwai <tiwai@suse.de>,
        Christian Brauner <brauner@kernel.org>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Marc Herbert <marc.herbert@intel.com>,
        James Smart <jsmart2021@gmail.com>,
        Justin Tee <justin.tee@broadcom.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220914142256.28775-1-ansuelsmth@gmail.com>
 <20220914142256.28775-5-ansuelsmth@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220914142256.28775-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/09/2022 16:22, Christian Marangi wrote:
> Fix dtbs_check warning now that we have a correct kpss-gcc yaml
> schema. Add additional qcom,kpss-gcc compatible to differentiate
> devices where kpss-gcc should provide a clk and where kpss-gcc should
> just provide the registers and the syscon phandle.
> Add missing #clock-cells and remove useless clock-output-names for
> ipq806x.
> Add missing bindings for msm8960 and apq8064 kpss-gcc node.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  arch/arm/boot/dts/qcom-apq8064.dtsi | 5 ++++-
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 4 ++--
>  arch/arm/boot/dts/qcom-mdm9615.dtsi | 2 +-
>  arch/arm/boot/dts/qcom-msm8660.dtsi | 2 +-
>  arch/arm/boot/dts/qcom-msm8960.dtsi | 7 +++++--
>  5 files changed, 13 insertions(+), 7 deletions(-)


warning: 1 line adds whitespace errors.
error: patch failed: arch/arm/boot/dts/qcom-apq8064.dtsi:845
error: arch/arm/boot/dts/qcom-apq8064.dtsi: patch does not apply
error: patch failed: arch/arm/boot/dts/qcom-ipq8064.dtsi:917
error: arch/arm/boot/dts/qcom-ipq8064.dtsi: patch does not apply
error: patch failed: arch/arm/boot/dts/qcom-msm8960.dtsi:63
error: arch/arm/boot/dts/qcom-msm8960.dtsi: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch


Best regards,
Krzysztof

