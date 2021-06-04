Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1290DC4743C
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 17:28:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE6B561402
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 17:28:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbhFDRaL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jun 2021 13:30:11 -0400
Received: from mail-qt1-f172.google.com ([209.85.160.172]:33340 "EHLO
        mail-qt1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbhFDRaK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Jun 2021 13:30:10 -0400
Received: by mail-qt1-f172.google.com with SMTP id a15so7607131qta.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Jun 2021 10:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W7q2U9QT7qAxj7hf+II4Z/nhms5EfM2onq31L99Ku2U=;
        b=knyEhL7QEI32EeLzI2KT4Dljnurd8LSBl3eY1jsnandqQeKWQkPZUAoZo33Ipg4z6i
         ebwNIk8PHzjI6iPgnKWu11xSJ7F8p2e1g4Ij1mMqWez1t91NnabPspncr395HhfNwHtT
         XC3F3nkkrdCmEg76mV5KLl7EfwTEHmszTUNvOB7m+zA8CdMGorb7cs0OF0da1HKyrZAc
         1/DVPkDnzn8KURWaYRlGNmlR8yNW1vy9Z+bnYexUzg5EymMymjArwtCVSzi+ETjbmrLA
         NTXzipMQwxfXaZ8LqfiQ4TiM1rat14suhnFWwRgBiFbHi7rnenPJD/Q1GOUWkVp8kaei
         tIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W7q2U9QT7qAxj7hf+II4Z/nhms5EfM2onq31L99Ku2U=;
        b=D7cmzNkuM3RGJMlOrWcVtIJfxRXcz6XBHLPYx1ZUlOYRV6SWI85+mqfoGDxk2MA9i+
         H1h7k++dar/WcqRGq1AIY4RuM37G8/sVqgGPZmRKtzMtW0zgC1VCx07TGO17ETTdMPwY
         fOuV/yTT36bxKl1b9QCciZBmZbyDzZvYX/lxABhFDlW8xZHnouqxSlBu3fI3IHxSbMf6
         wzeEAztt7/17XtrQjPpONqOtj78goIEB9BcTTt62HL810ajHc7HDQ9HBsCyPl0Pgqve1
         4NuQG20LWDbRCkKMF+AlcHYnMEEIy3vdMabUo1d7hvh4gg/1CmbiMahCSL2gfHdxSZd0
         ZFSw==
X-Gm-Message-State: AOAM532hIuX00/PUw9NfVFJnlDUA53McxrHb+TFNbQQgfCuwCNCroDd0
        UPNGCOBRJozYtikaPIWdcziAqA==
X-Google-Smtp-Source: ABdhPJxry73nGzw9vaNeSCAnH5NcGdzaokOeVX5S03eBqde14Jqq6PqvuHlpJHmbrHME98hK3aceEw==
X-Received: by 2002:ac8:570b:: with SMTP id 11mr5643304qtw.287.1622827643909;
        Fri, 04 Jun 2021 10:27:23 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id l5sm3411632qkf.55.2021.06.04.10.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 10:27:23 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] dt-bindings: clock: add QCOM SM8350 display clock
 bindings
To:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210519001802.1863-1-jonathan@marek.ca>
 <20210519001802.1863-2-jonathan@marek.ca>
 <162266925581.4130789.10178141366818328902@swboyd.mtv.corp.google.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <56f3b0bd-5dd7-80d4-041a-0fd2daf4b1f2@marek.ca>
Date:   Fri, 4 Jun 2021 13:25:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <162266925581.4130789.10178141366818328902@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 6/2/21 5:27 PM, Stephen Boyd wrote:
> Quoting Jonathan Marek (2021-05-18 17:18:02)
>> Add sm8350 DISPCC bindings, which are simply a symlink to the sm8250
>> bindings. Update the documentation with the new compatible.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>   .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml       | 6 ++++--
>>   include/dt-bindings/clock/qcom,dispcc-sm8350.h              | 1 +
> 
>>   2 files changed, 5 insertions(+), 2 deletions(-)
>>   create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h
> 
> Why the symlink? Can we have the dt authors use the existing header file
> instead?
> 

It would be strange to include bindings with the name of a different 
SoC. I guess it is a matter a preference, is there any good reason to 
*not* do it like this?

>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
>> index 0cdf53f41f84..8f414642445e 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
>> @@ -4,24 +4,26 @@
>>   $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
>>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>>   
>> -title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250
>> +title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250/SM8350
> 
> Maybe just "Binding for SM8x50 SoCs"
> 

Its likely these bindings won't be compatible with future "SM8x50" SoCs, 
listing supported SoCs explicitly will avoid confusion in the future.

>>   
>>   maintainers:
>>     - Jonathan Marek <jonathan@marek.ca>
>>   
>>   description: |
>>     Qualcomm display clock control module which supports the clocks, resets and
>> -  power domains on SM8150 and SM8250.
>> +  power domains on SM8150/SM8250/SM8350.
> 
> same 8x50 comment.
> 
>>   
>>     See also:
>>       dt-bindings/clock/qcom,dispcc-sm8150.h
>>       dt-bindings/clock/qcom,dispcc-sm8250.h
>> +    dt-bindings/clock/qcom,dispcc-sm8350.h
>>   
>>   properties:
>>     compatible:
>>       enum:
>>         - qcom,sm8150-dispcc
>>         - qcom,sm8250-dispcc
>> +      - qcom,sm8350-dispcc
>>   
>>     clocks:
>>       items:
>> diff --git a/include/dt-bindings/clock/qcom,dispcc-sm8350.h b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
>> new file mode 120000
>> index 000000000000..0312b4544acb
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
>> @@ -0,0 +1 @@
>> +qcom,dispcc-sm8250.h
>> \ No newline at end of file
