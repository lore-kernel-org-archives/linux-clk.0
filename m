Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE695C77B7F
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 09:56:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbjEQJ4H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 05:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbjEQJ4F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 05:56:05 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A474ECE
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 02:56:01 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-96649b412easo79921466b.0
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 02:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684317359; x=1686909359;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o0UJprFe8SfcD9ht4MYliq9M7kxDvSUlI5EYK4zEHg8=;
        b=rLUYiIn9+nCG6E01rvMUfmUdR+Vn1c8lfcxt7iFAbr4py7VH64jAl9KkEHn6CSUeW+
         EVgCo/cM0zj5w2+rg5pcRVBfD1A65r/iI6YivabhDXDr61YB28+mg0NglgHqWbP2paNq
         wCy8KJHjLwb0T9XIFRrHRQGRGajCbOkS6rLJyDIqqkFgU4tQQ7StA7Bi0w/k3a6/Isu1
         DmJbFFCn05q/SLFvuzht0nldNEBCGS8swDg9fW65J3UBJYaeLViEZnXp5snkP0+UYccA
         M4Eiu1ZDL4+k8su1RdR8UNVMceTmiA4mdG7NFdAIqg99K61lu4NRT2xgBwSiqCo4BfhV
         TuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684317359; x=1686909359;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0UJprFe8SfcD9ht4MYliq9M7kxDvSUlI5EYK4zEHg8=;
        b=kAgoqCxegRiDVTPk9epUhj8mL8wLUrhFv9Mo1jh3BC+fSATY95Cvyk6Zr9ivRyRSMU
         jDEuyhggB8yPtevQSvYG+u2xqSCZTde7aL2yJEanNh3Lne7A6mGtR6GCfjz3gbcn9vLb
         DAFl0L9os/c4ejKKgDce5vsMH51poS9HZnqnOjVFush8VlhDi03M+67cPq3+gZpQqK97
         pfK+SRJpEeupO24izoPkBClZwSg9QOKyCLhvcRhTH/gMEnq5wJ+WDoFlQMcNL934asGW
         V1zrQUg1U9nsricCD2cekW4OX5ILzrE3LSYBmh6yAWnwUTqF/q2iXYPwFf7frU2RU0bF
         gUuQ==
X-Gm-Message-State: AC+VfDxQ2XsBtECWnJ0uWN82ImOhGMp/7/85SO5Ah+t7GB9y9N5sSM06
        jQqOXxBclGP5TQNKbqZ1wTtuRw==
X-Google-Smtp-Source: ACHHUZ70rZeXSoFG1abrTOHAq6446HdZswHzwiRauRzt/gQKgjuxNZiurz7JSmnX9087WBAzToo2bg==
X-Received: by 2002:a17:907:97c8:b0:966:17b2:5b0b with SMTP id js8-20020a17090797c800b0096617b25b0bmr38530077ejc.49.1684317359586;
        Wed, 17 May 2023 02:55:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d? ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id z11-20020a1709067e4b00b00965f6ad266bsm11942656ejr.119.2023.05.17.02.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 02:55:59 -0700 (PDT)
Message-ID: <14694246-f09f-cebb-fadf-2d97719cc81b@linaro.org>
Date:   Wed, 17 May 2023 11:55:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] clk: mediatek: mt8365: fix the clock indexes
Content-Language: en-US
To:     Alexandre Mergnat <amergnat@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wenst@chromium.org>
Cc:     Markus Schneider-Pargmann <msp@baylibre.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20230517-fix-clk-index-v1-0-142077a1732b@baylibre.com>
 <20230517-fix-clk-index-v1-1-142077a1732b@baylibre.com>
 <9c7ff0f1-3d2c-b83a-a47d-544c76f29663@linaro.org>
 <62c51f2c-a620-a879-5659-faf3c4b77268@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <62c51f2c-a620-a879-5659-faf3c4b77268@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/05/2023 11:34, Alexandre Mergnat wrote:
> On 17/05/2023 10:40, Krzysztof Kozlowski wrote:
>> On 17/05/2023 10:28, Alexandre Mergnat wrote:
>>> Before the patch [1], the clock probe was done directly in the
>>> clk-mt8365 driver. In this probe function, the array which stores the
>>> data clocks is sized using the higher defined numbers (*_NR_CLOCK) in
>>> the clock lists [2]. Currently, with the patch [1], the specific
>>> clk-mt8365 probe function is replaced by the mtk generic one [3], which
>>> size the clock data array by adding all the clock descriptor array size
>>> provided by the clk-mt8365 driver.
>>>
>>> Actually, all clock indexes come from the header file [2], that mean, if
>>> there are more clock (then more index) in the header file [2] than the
>>> number of clock declared in the clock descriptor arrays (which is the
>>> case currently), the clock data array will be undersized and then the
>>> generic probe function will overflow when it will try to write in
>>> "clk_data[CLK_INDEX]". Actually, instead of crashing at boot, the probe
>>> function returns an error in the log which looks like:
>>> "of_clk_hw_onecell_get: invalid index 135", then this clock isn't
>>> enabled.
>>
>> Please use subject prefixes matching the subsystem. You can get them for
>> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
>> your patch is touching.
> 
> I will.
> 
>>
>> This is huge ABI break and I don't understand why it is needed. Entire
>> description above did not explain me that.
> 
> Briefly, clocks with the higher index than the data clock array can't be 
> used. I've this issue:
> [    0.427054] of_clk_hw_onecell_get: invalid index 135
> [    0.429525] of_clk_hw_onecell_get: invalid index 69
> [    0.442998] of_clk_hw_onecell_get: invalid index 70
> 
> That means CLK_TOP_SSUSB_PHY_CK_EN, CLK_IFR_SSUSB_REF and 
> CLK_IFR_SSUSB_XHCI aren't working when I need them. So my USB doesn't work.

That sounds like a driver, not bindings problem.

Best regards,
Krzysztof

