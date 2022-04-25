Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E79EC433F5
	for <linux-clk@archiver.kernel.org>; Mon, 25 Apr 2022 20:29:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245414AbiDYUcF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Apr 2022 16:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238993AbiDYUcC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 16:32:02 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA98331358
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 13:28:51 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id be20so11511930edb.12
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 13:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wvQYRS1pWv21ehmcnJxWSnYJsytlKQ2x5bcgfTp8r5E=;
        b=E0AIy0zXFuolgxRDb6PvDyvlBJBmvpqPHHcjwYTOkAWDEUeIUtIAo/PcJH+Sqz4TQw
         BygwGSFokKDLhRDupuKtC+Sx2WpgzowmMxZ1481MaNrRoA8VdiIpmYLpfulvqPM3Aaqd
         8W+Cs0N+RIrgubsLqEi7loNgGPcNvMbYEv5GIJu8deV/2nKJjwqS3Z8S8CwZx4WFtbHc
         jRKGWVem2UtxgqJkGzaRvc3vKAHN+hpuOipNzr/0icY8AJxL5zNRntxCyIBXmpe3JtB+
         +L9t1qxTai6pqXw/c7GTAMezs/b8j4yPrAJX25C3WratWnWYCHDYLgkv4LztKutixayI
         V3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wvQYRS1pWv21ehmcnJxWSnYJsytlKQ2x5bcgfTp8r5E=;
        b=JYtd8qtDZ0edLjYwzcN11XJnUkVeg9fGFbZa5CY5OY9huFRwLCx1EgzDjZPa1KAHmO
         l6l1kTGP6xMWkoGTSZJBGL6b7UZFuONJBLzWWlYWdN5l9LGwCuHuSRBsIEaVbrMQMfms
         cZS9U/+ezkPcvjaiAPk2y0OTwNe4ybZCIBQ5D4V8Q6+b0CM9ofrnrNo+paZOijNbsyA3
         1DguC7DCxD/8nHQj+pmpNgfEn6+uzDjJt4dqB7JaOLCJ25sKz79EBv1wL5t3V81UXt71
         RCyIvUOu5+Ha4tewz1qxnATIbL0Ot6ev72OPZzyPKHibFcFRNI5qu+MiPlGJQRC4a4e0
         tLEQ==
X-Gm-Message-State: AOAM532JbHJ1iAAG7YRcfwPm5/ezzixYb3gJN1NwIP0IRqPp8Ht03smE
        TPj2F0bxSfOmqd0bq5stoClIrQ==
X-Google-Smtp-Source: ABdhPJxRiXQdrMEZ1bEiijQmU3oSqmhzoZsPoezAg48UIyxDJ1owz8UIf9lbzN8JjioalA7frYn1kA==
X-Received: by 2002:a05:6402:26c5:b0:425:f7f0:fb6c with SMTP id x5-20020a05640226c500b00425f7f0fb6cmr1385802edd.133.1650918530508;
        Mon, 25 Apr 2022 13:28:50 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906059100b006cee1bceddasm3893124ejn.130.2022.04.25.13.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 13:28:50 -0700 (PDT)
Message-ID: <8db5f7cc-dbad-3636-0fd2-7d6dc29ee409@linaro.org>
Date:   Mon, 25 Apr 2022 22:28:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: clock: qcom,gcc-apq8064: Fix typo in
 compatible string
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Taniya Das <tdas@codeaurora.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220425133527.3723233-1-robh@kernel.org>
 <20220425193253.06828C385A4@smtp.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220425193253.06828C385A4@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/04/2022 21:32, Stephen Boyd wrote:
> Quoting Rob Herring (2022-04-25 06:35:27)
>> The compatible string should be 'qcom,gcc-apq8064', not
>> 'qcom,gcc-apq8084'. Found by enabling undocumented compatible checks.
>>
>> Cc: Ansuel Smith <ansuelsmth@gmail.com>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> ---
>>  Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
>> index 97936411b6b4..9910a3e033bb 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
>> @@ -25,7 +25,7 @@ description: |
>>  
>>  properties:
>>    compatible:
>> -    const: qcom,gcc-apq8084
>> +    const: qcom,gcc-apq8064
> 
> This file has dt-bindings/clock/qcom,gcc-apq8084.h referenced. Should
> that be removed? It looks like commit a469bf89a009 ("dt-bindings: clock:
> simplify qcom,gcc-apq8064 Documentation") took the more than just the
> compatible for apq8084 from qcom,gcc-other.yaml and put it in here while
> removing gcc-apq8064. Probably the apq8084 part needs to be a copy of
> the apq8064 file with the single compatible changed.

Good point, Rob's commit removes entirely qcom,gcc-apq8084 compatible,
which is and was used.

Probably the intention of that commit was to merge apq8064 and apq8084.
The first uses dt-bindings/clock/qcom,gcc-msm8960.h header for IDs. The
second has its own headers, added in mentioned commit.

I am not sure it is worth splitting this into two files. Adding here
enum for 8064 and 8084 should work fine.

Best regards,
Krzysztof
