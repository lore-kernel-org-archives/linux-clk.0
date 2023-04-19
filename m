Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E94C6FD18
	for <linux-clk@archiver.kernel.org>; Wed, 19 Apr 2023 21:08:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjDSVIJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Apr 2023 17:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbjDSVII (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Apr 2023 17:08:08 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5406959F0
        for <linux-clk@vger.kernel.org>; Wed, 19 Apr 2023 14:08:05 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4ec8da7aaf8so136139e87.2
        for <linux-clk@vger.kernel.org>; Wed, 19 Apr 2023 14:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681938483; x=1684530483;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y4Qr1DXe1yvvm/vxNEQkt+SEuJu0KzbnH1GeDOIlXyQ=;
        b=hC5WFtDnayfS8GWsFSCr2rWJ952sK2ZuuSjzPTBUweoBJYnzyc2+eTgmkgOhIxUf6S
         BDUeCh7ucPblx5vCU3jh+xHT7Ufl8nN568uL5OmBnUcENBwm8bURgtNWq1VHsGfHoQUI
         ao+7dER7M8FSI9y9EZ9ygtz4MVXj+UtJo1J/wkLA5md3YI1VllMsFuxHqDOoAv3Q/9eq
         pKf1KX9NK63kJsc6Lw4xl+brmE4IpG3DC+/l8nMljCwNPA2FnaRThvXhgBlOpuVAso6f
         HVSuaVmL/BsETOwLRgDgVwyJFI+rsgciODVoEphuGnhlT6K2XNQYlcHlybGlaxaYDPjF
         6pAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681938483; x=1684530483;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4Qr1DXe1yvvm/vxNEQkt+SEuJu0KzbnH1GeDOIlXyQ=;
        b=H0TKyPxN4s2nCoqil0FkbIzhIX5cYrov8FQhfLLCN49s9G2GDDi9FkfKDmUuuJtS9t
         kW1vTTdrlvqunA7zH3ujQEtg2IM66HtvK/0GnNG/9Om4ZxyZJf/aU1NGRC0c36Sonj9k
         8tGpioVSSgv1uB13DNKi/QGrLykh4uKe7ot0NZ2BHdt9pijSzp4XrHhMdRaWoUWRNXzo
         bfnq7BnhXr70GTnVhJclQ/40Gt3xOFDYjTrhNGedoIDGLUYO4xqQj6DhZTG+4smGeY2I
         asfsqkVfeQoKJ+s5n+/RPsLAWSLEAqiGDdwq0RnTWN7TnNvWn5xDPO3QvBJeizO3E6qr
         AHmg==
X-Gm-Message-State: AAQBX9dYXVrQQ8OkvxGf05Pum8R/n0+/FluwhXNruc5qmBmaRVxF7UTD
        1IQnPYgPpi/d5Dtqar14oRZgYQ==
X-Google-Smtp-Source: AKy350bRPbKgT0N5fxItGxuOvv+MyhtWesynq8EjEf51YmaoGEZIZO4bHS/rGvjxJZSOp9eSI5UMZA==
X-Received: by 2002:ac2:4833:0:b0:4cc:96f8:f9c6 with SMTP id 19-20020ac24833000000b004cc96f8f9c6mr4457459lft.5.1681938483555;
        Wed, 19 Apr 2023 14:08:03 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id r4-20020ac24d04000000b004db0a7ce483sm11410lfi.162.2023.04.19.14.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 14:08:03 -0700 (PDT)
Message-ID: <6e55d3fa-744e-1f85-7642-6138f4e6e5a5@linaro.org>
Date:   Wed, 19 Apr 2023 23:08:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH RFT v2 01/14] dt-bindings: clock: qcom,rpmcc: Add a way to
 enable unused clock cleanup
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
 <20230303-topic-rpmcc_sleep-v2-1-ae80a325fe94@linaro.org>
 <ZD2YYrOdQMD3pi7u@gerhold.net>
 <d63d4896afe8a1a901470f88862ce608.sboyd@kernel.org>
 <3873483f-7f7d-a146-cca9-b50f054289d4@linaro.org>
 <6407af2a-18c6-9baf-cc9b-dcf7001812b7@linaro.org>
 <ZD_0AmYU-N5vzv8f@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZD_0AmYU-N5vzv8f@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 19.04.2023 16:00, Stephan Gerhold wrote:
> On Wed, Apr 19, 2023 at 01:31:01PM +0200, Konrad Dybcio wrote:
>> What should we do about the non-bus RPM clocks though? I don't fancy
>> IPA_CLK running 24/7.. And Stephan Gerhold was able to achieve VDD_MIN
>> on msm8909 with these clocks shut down (albeit with a very basic dt setup)!
>>
>> Taking into account the old interconnect-enabled DTs, some of the
>> clocks would need to be on so that the QoS writes can succeed
>> (e.g. the MAS_IPA endpoint needs IPA_CLK), it gets complicated again..
>>
> 
> I guess MSM8996 is the only platform affected by this? sdm630.dtsi seems
> to list the clock already in the a2noc and all others don't seem to have
> an interconnect driver yet.
> 
> This will be subjective and someone will surely disagree but...
> 
> IMO forcing all RPM clocks on during boot and keeping them enabled is
> not part of the DT ABI. If you don't describe the hardware correctly and
> are missing necessary clocks in the description (like the IPA_CLK on the
> interconnect node) then your DT is wrong and should be fixed.
> 
> I would see this a bit like typical optimizing C compilers nowadays. If
> you write correct code it can optimize, e.g. drop unnecessary function
> calls. But if you write incorrect code with undefined behavior it's not
> the fault of the compiler if you run into trouble. The code must be
> fixed.
> 
> The DT bindings don't specify that unused resources (clocks, ...) stay
> "magically" active. They specify that that the resources you reference
> are available. As such, I would say the OS is free to optimize here and
> turn off unused resources.
> 
> The more important point IMO is not breaking all platforms without
> interconnect drivers. This goes beyond just adding a missing clock to
> the DT, you need to write the driver first. But having the max vote in
> icc_smd_rpm (somehow) should hopefully take care of that.
Hm, interesting argument.

Krzysztof, Bjorn, what's your stance on this?

We *need* to add unused cleanup to rpmcc for feature completion and
there's no good way of discerning whether it's safe to do so..

Doing so will make clk_ignore_unused necessary to boot with legacy DTs.

Stephan argues the DTs were incomplete from the start and the breakage
is only a result of us previously abusing what's essentially undefined
behavior.. I think I second this, but it is *a* breakage so I want to
know your opinion.

FWIW the same happens when we have simple-framebuffer enabled and then
introduce dispcc on a given platform without adding the clocks under
the simplefb node and we've not been frowning upon that too much, so I'd
be willing to give it a pass if you're okay with it..

Not caring about this would make things far, far easier really..

Konrad
> 
>> I suppose something like this would work-ish:
>>
>> 0. remove clock handles as they're now contained within icc and
>>    use them as a "legacy marker"
>> 1. add:
>> 	if (qp->bus_clocks)
>> 		// skip qos writes
> 
> Maybe you can just check if all necessary clocks for QOS are there or
> not? I don't think it's a problem to skip it on broken DTs. I think it
> would be even fine to refuse loading the interconnect driver completely
> and just have the standard max vote (as long as that results in a
> booting system).
> 
>>
>> This will:
>> - let us add is_enabled so that all RPM clocks bar XO_A will be cleaned up
>> - save massively on code complexity
>>
> 
> +1
> 
>> at the cost of retroactively removing features (QoS settings) for people
>> with old DTs and new kernels (don't tell Torvalds!)
>>
> 
> I doubt anyone will notice :p
> 
>> This DTB ABI stuff really gets in the way sometimes :/ We're only now
>> fixing up U-Boot to be able to use upstream Linux DTs and other than
>> that I think only OpenBSD uses it with 8280.. Wish we could get rid of
>> all old junk once and then establish immutability but oh well..
> 
> Nice, thanks a lot for working on addressing the Qualcomm DT mess in
> U-Boot. I've been meaning to work this myself for a long time but never
> found the time to start... :')
> 
> Thanks,
> Stephan
