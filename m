Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5BDC433FE
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 07:52:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbiJCHw4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 03:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232291AbiJCHwU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 03:52:20 -0400
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 957D7B846
        for <linux-clk@vger.kernel.org>; Mon,  3 Oct 2022 00:29:48 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id b2so4379579lfp.6
        for <linux-clk@vger.kernel.org>; Mon, 03 Oct 2022 00:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=OWR0WOYIaygxKBvBdUgm8aSkracuNoxTbBMzqtzlAGM=;
        b=SgggRDKZ9637LDD9qoLTBMhZMGXPdWXed2DPJceiSK9Tc7Vq8nN2AZ2+pur7kK1vOr
         5QFpa7N1crON1mLhqfo3rguSdfAw+YtMbIrt9+xLNCU3I3Ts0JQtIFelpWyfhF2hjRiI
         2Z5pjmq5qQspmbGp1Al5jj4i1JpJeXxIIqBs1AQxiWVMR9DmWr9p5tXDFfNr05F9HAwK
         twd5N4ljZuoKr56ETEDFQIjdX2Xj75wOg2RWCgCGPoZQAlqK8aBGe5pAChJ6f8iA9roC
         OpIMYNUEKkZ4ZlUdyvZW0AxOqjnHWAM74+4X2Iza6NCUJnPik9SQ//yEIrtO8YmFNgqb
         wt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=OWR0WOYIaygxKBvBdUgm8aSkracuNoxTbBMzqtzlAGM=;
        b=J8NqsKMZSZx3QKL41eShbCYhfRBhjV2vNbzruWjJoA1GQe+N4VX7hqA1u4d+yWEJUC
         aCVTgr311JQSq57dpfmhis61p6mpJhpcmocG7R2hjYaAOdzkin2xfaDQc/dQTrIqCyDi
         X4Ba7S0q+sqVfO2GF8nXgbEmQhoioW37cXyfl1DCgAoe7Emz3CGueD0S5dFDQqL8EMbg
         I3OmUz4zMgJEImannjAk6yPR3YUUoK0FiRBOgOXwp+D393xBam3SttweSuxd7nTZTwxN
         REtKQ2dCLdIN+nDBzxMEDOPu35p5vB9GAV4KoioaBzVewgqmpovNoddBWWZM+0C7Sd42
         Cxeg==
X-Gm-Message-State: ACrzQf26HBtCJEDAW1JDq1V0xVT4Aw55HkBFrxB2qFu/ydpatpYEvG7P
        Lhkiiu8UtfLDr/p7TBAWuOYJ4uHNUBYLRA==
X-Google-Smtp-Source: AMsMyM48/WNE88THbqjlggjZtr95vdx5GT4rzEmO+1YcVjo0LbjTYzb5mlh5xE+DQbWZ6ZhqrlXliQ==
X-Received: by 2002:a05:6512:2342:b0:4a2:e4a:5fb7 with SMTP id p2-20020a056512234200b004a20e4a5fb7mr6340939lfu.272.1664781802167;
        Mon, 03 Oct 2022 00:23:22 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o12-20020a056512230c00b004946748ad4dsm1344042lfu.159.2022.10.03.00.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 00:23:21 -0700 (PDT)
Message-ID: <b495804c-cf04-4512-ac05-424eded46468@linaro.org>
Date:   Mon, 3 Oct 2022 09:23:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] dt-bindings: clk: Add binding for versal clocking
 wizard
Content-Language: en-US
To:     Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-clk@vger.kernel.org, git@amd.com, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org,
        mturquette@baylibre.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220930080400.15619-1-shubhrajyoti.datta@amd.com>
 <20220930080400.15619-2-shubhrajyoti.datta@amd.com>
 <CAL_JsqLaqjZeZd3c-fd9f5m-4OCXgOZcOu+paik9FV_eno5sLg@mail.gmail.com>
 <afb3f19f-eb40-5453-a82b-295e06861f86@amd.com>
 <20220930213924.GA1079711-robh@kernel.org>
 <6e58837e-896c-7069-7913-2afb90af5e95@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6e58837e-896c-7069-7913-2afb90af5e95@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/10/2022 09:15, Michal Simek wrote:
>>> And this is new IP. Not sure who has chosen similar name but this targets
>>> Xilinx Versal SOCs. Origin one was targeting previous families.
>>
>> Do we need a whole new schema doc?
> 
> It is completely new IP with different logic compare to origin one.
> 
>>
>> It is not ideal to define the same property, xlnx,nr-outputs, more than
>> once. And it's only a new compatible string.
> 
> I can't see any issue with using dt binding for xlnx,clocking-wizard.yaml
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml

So we already have out of staging document:
devicetree/bindings/clock/xlnx,clocking-wizard.yaml

and author wants to add one more:
devicetree/bindings/clock/xlnx,clk-wizard.yaml

Shall we expect in two years, a third document like:
devicetree/bindings/clock/xlnx,clk-wzrd.yaml
?

> 
> also for this IP if that's fine with you.
> Only xlnx,speed-grade can be defined for previous IP which is easy to mark.

That old binding also explained nr-outputs as "Number of outputs".
Perfect... :(

Best regards,
Krzysztof

