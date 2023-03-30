Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB6CC761A6
	for <linux-clk@archiver.kernel.org>; Thu, 30 Mar 2023 11:07:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbjC3LHz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Mar 2023 07:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231447AbjC3LHv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Mar 2023 07:07:51 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75692976C
        for <linux-clk@vger.kernel.org>; Thu, 30 Mar 2023 04:07:36 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 20so19207481lju.0
        for <linux-clk@vger.kernel.org>; Thu, 30 Mar 2023 04:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680174454;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7LR0S6AFtSUht8G1Qa+bxNb42VLodjoT5rK6P9xF4Gc=;
        b=XqH/7X9qatA1dYQUrhBhn441lDbqy6pAT5lTOsxIGodOo2IVXQM8NfkE9c7nZt0TJv
         wLDz1AExDXUIMbkdo1GmCSRLb8LxScDgdiJVo5dNUeSS7j3n2JM0OV8sH7lDyWu+ZG4x
         9M5W3GBJ7QY1qOzrSEHeerKpzs5jnLE82/FJrl9VZKzDfy0ukqn3j9DJungOlReK1UPk
         IB6uScMlI39MgMCGOtZvqu8J4C/y2YCNKk/mBBvozmRP73SXLbhiStRHy4RIPZ/K54nW
         7I2WEQJ04BUxHHXHCv1YwJSv7Ij8UbMzUk/aUv7vNVIKrazwzGxmbazBcPog3LvTXMKM
         IkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680174454;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7LR0S6AFtSUht8G1Qa+bxNb42VLodjoT5rK6P9xF4Gc=;
        b=p2hBbQyemggUHCRWiaKHjl4hw70ddJp8dt98VnI8sA+Rns0ldR5yaaXVCSzsfcZx0p
         T8GBpWtxLCeQ2+Ggv8XpSC8JxI8o/9qqYvJWoboeqkgzrBeQy/a1KKIpS3koU2nmrfT5
         b3uMSUhJ0L8y2O5SFb78irNRd9ZXm7ZQZZtyhsXU9Q4pppltmPlhQyZvfu57rO3Ze3Is
         6NE8zTnNn5K4h1pT2wRObyYtwzUCBRdy5zjqrm0r6qZdkbqyh+pEDNo0aVZB/BqVtceZ
         jKotz9xIlGZNJqOGQ2FkyVsrDvA8e6SWh5jXCU6hdt3bqigNHIYzrGobOk8t0MIibOja
         0xmw==
X-Gm-Message-State: AAQBX9f1PnUBHMsatH4r5xylkX0c6cMkzKCwbInlCmyYLtHujCIcYphK
        Eqltl9ld7CdEm+MuAM6ZwBdlSw==
X-Google-Smtp-Source: AKy350a0PgypgwzkeyyVZVF+0aACOhmQj6Ct7xxutZCWN1CqF+6llkKERiyx17zTvopzsIZ7UD4KTQ==
X-Received: by 2002:a2e:b0eb:0:b0:2a4:def6:7112 with SMTP id h11-20020a2eb0eb000000b002a4def67112mr5430895ljl.30.1680174454602;
        Thu, 30 Mar 2023 04:07:34 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d2-20020a2eb042000000b002a1e54581desm3147611ljl.58.2023.03.30.04.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 04:07:33 -0700 (PDT)
Message-ID: <fe6eb9ce-6303-ca8a-1252-53c608b943cd@linaro.org>
Date:   Thu, 30 Mar 2023 13:07:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 1/2] dt-bindings: clock: versal: Add versal-net
 compatible string
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        devicetree@vger.kernel.org
Cc:     git@amd.com, linux-clk@vger.kernel.org, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        michal.simek@xilinx.com
References: <20230330091309.16215-1-shubhrajyoti.datta@amd.com>
 <20230330091309.16215-2-shubhrajyoti.datta@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230330091309.16215-2-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/03/2023 11:13, Shubhrajyoti Datta wrote:
> From: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>
> 
> Add dt-binding documentation for Versal NET platforms.
> 
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@xilinx.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
>  .../devicetree/bindings/clock/xlnx,versal-clk.yaml         | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> index 4bbf96484b56..ee1924acebaf 100644
> --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> @@ -20,7 +20,12 @@ select: false
>  
>  properties:
>    compatible:
> -    const: xlnx,versal-clk
> +    oneOf:


Just enum. Your descriptions are not saying anything more than
compatible is.

Best regards,
Krzysztof

