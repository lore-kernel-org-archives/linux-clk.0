Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883FAC43217
	for <linux-clk@archiver.kernel.org>; Thu, 17 Nov 2022 13:15:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239861AbiKQNPQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Nov 2022 08:15:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239850AbiKQNPP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Nov 2022 08:15:15 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB285A6D1
        for <linux-clk@vger.kernel.org>; Thu, 17 Nov 2022 05:15:14 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id r12so2748039lfp.1
        for <linux-clk@vger.kernel.org>; Thu, 17 Nov 2022 05:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=stcLcfNpen6Sr0+oQPYHLbDFl7MhcrBpJrboffeHmFk=;
        b=nLtyK5h7/zE4H4T4AunOP1htiXln9t1MUo2pDzXUs2Q7eF+E3lWtoEVFkBQ2HHYAX5
         XSkC6o3OQeTwhzYU6gbVccwe4WDTnYZtWFyLXMu1APjo4e4dnSi2COtLJzFEnvEMG6Q4
         WQR4HYVB7m5037Y/+jmGvrb+RJHQdpfncoOb+oqq+b/CHRMKTRymCDN1HJ3/8aJN9604
         lKhUqZ0c0C+2YZX41jdtooq3gnGyNIwKFKu1+eVyne080rvfmDdkEuuZiWjotdTzgc7f
         0DL2FxbzwaMkdon8yHLj+wDTD1yyrUn8JpimKZzXzMzhynZS/RjUWrzfBosiN5T7eYtO
         iFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=stcLcfNpen6Sr0+oQPYHLbDFl7MhcrBpJrboffeHmFk=;
        b=HjzrEY3wWhDgzWxoZJ4ZizkZh/AmZ1OU7VE7hP9qy8cnF5OLBWckxbuF+qPrDUGX6z
         B3kJ3MzBrUX1mz9LE4DaDxoLH9PKe8UnhnKpJrKXfhxlrvOwFn/LrAsXiQmkS8aOxz9A
         ea0nK940GZVh23uHVXaIJ1W6YwPKxgO2wS9TgrCtY4YnvCUuJVxKxgp3WwJRaMcPc63z
         KoXPebl16OGpE5F8urZnptGGsOBMR1yxgg8uWOtyCZwkVaE/tR/Onx943PX3OIE1CA6S
         p0xfqwhO0fSyqHssGkvtTCh/vcP+/1XWTyuTyifxKIu6wxyqDuKHa/ssis6nfe8aeAR2
         /AJw==
X-Gm-Message-State: ANoB5pnkV8t3jAlzgGgJNlCXqP6YRs1/GcBa3W66LzDaE7CB+qUkNd/8
        5Ke+FNwi7VzUBPwsAIJp19gpjQ==
X-Google-Smtp-Source: AA0mqf4fPosdxMf4T7BFozF5LWZbdHUE+s7XYYza8mzxxSavuBoGaqdWp5Ez0ltciJirbsR55wcCYg==
X-Received: by 2002:a05:6512:252c:b0:4b1:7c15:e8ca with SMTP id be44-20020a056512252c00b004b17c15e8camr826358lfb.601.1668690912833;
        Thu, 17 Nov 2022 05:15:12 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k3-20020ac257c3000000b00497a191bf23sm139942lfo.299.2022.11.17.05.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 05:15:12 -0800 (PST)
Message-ID: <f01ed99a-8487-aa4d-dfe8-df72037ce132@linaro.org>
Date:   Thu, 17 Nov 2022 14:15:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] dt-bindings: clk: Add binding for versal clocking
 wizard
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc:     linux-clk@vger.kernel.org, git@amd.com, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, michal.simek@xilinx.com,
        shubhrajyoti.datta@gmail.com, sboyd@kernel.org,
        mturquette@baylibre.com
References: <20221115145005.4747-1-shubhrajyoti.datta@amd.com>
 <20221115145005.4747-2-shubhrajyoti.datta@amd.com>
 <20221116220955.GA1042427-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116220955.GA1042427-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/11/2022 23:09, Rob Herring wrote:
> On Tue, Nov 15, 2022 at 08:20:04PM +0530, Shubhrajyoti Datta wrote:
>> The Clocking Wizard for Versal adaptive compute acceleration platforms
>> generates multiple configurable number of clock outputs.
>> Add device tree binding for Versal clocking wizard support.
>>
>> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>> ---
>>
>> Changes in v2:
>> rename the clocks clk_in1 to in1 and s_axi_clk to s_axi in dt
> 
> Why? Now you don't match the other clocking wizard. Yes, 'clk' is kind 
> of redundant, but making up different names for each version of h/w is 
> worse.
> 
> What happened to using the same schema file so we aren't defining the 
> same property (xlnx,nr-outputs) twice?

This might have been effect of my early comment, but then we discovered
we have more of bindings for the same, thus my comment might not be
applicable.

Best regards,
Krzysztof

