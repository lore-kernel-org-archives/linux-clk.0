Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FDDC433FE
	for <linux-clk@archiver.kernel.org>; Thu, 19 May 2022 07:20:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234652AbiESHUY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 May 2022 03:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbiESHUV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 May 2022 03:20:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA7E6F4AD
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 00:20:20 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id v8so5612105lfd.8
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 00:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=fdfSYz0vm9MQWJbSUfogROrxBfQQh8tD8bxvI5Fs7cI=;
        b=bbtch6XAWiN/DV2yOgt38hEl0PAk2t1n0PBAqWjkC07CKF2r50NEYLvYe/ajQO6DcL
         d9DV1AvR3EEGEbk+0vYrhRy1NQt960fzcROv5qDeTy8ne3IGxckoRyzheI5dPQTxIz7S
         UDF0rSA/3Cw7cMLZSIEDIk8uT1p2/71/hxT0yY0TFc3355n0CoxymE3WFNU9DT4nF2tv
         FeewUQe0FPJz7aNuzhm9YORUey8hvLIl6ZpXV8DNGWm4EFvUT54sLBjnSLPvvdSYcjzG
         3fk+BeIaVq33X9s6Z8kZVHoxNPECcQJqPwiTBpC7EIiPR8lsD56zFJoYiju+wtUpYs+e
         X7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fdfSYz0vm9MQWJbSUfogROrxBfQQh8tD8bxvI5Fs7cI=;
        b=Awx3NuYWsU3l88NJXRsJm/2FQrGW3b5qLiIzYlxa81P/8OESxWTjSV+w13WP4+Vp7R
         3CyO4sXf8mtGENdfWssOU2eqNCkK/+rMldf9b2CHv7cHxEwl0ovL7Lb/SoZTxkCw0XUq
         rP0NBTObnl5CHABoxqih1lMkxWAqm2UZX1zVQYvWQxdd0+Sg2PWySmNRZDzDtmGg/HWE
         09ELUrEC6E1cCAuZ75B89Tm5lLX7UzfRg2L8BtVVibLDDUf/qKA0fxfAmhrsQ1IqQ67R
         LUtggQAwLJUZlJRvJjwOeA47SQBJ9e0XL5n1MfcoHBu436vCsdlJzHFkl5vm6xnW4MkF
         YZZw==
X-Gm-Message-State: AOAM533supIDqNF3A+jz5PExw7f67SvUo/YH1MuG1btyX+rQZtwUmS+3
        KYBktM0nhv6xwGoSk6SL7dFBiQ==
X-Google-Smtp-Source: ABdhPJxoi/rsKjcwuY1nKxd+QQG6REhVdwGjY1Dy9hu/ZPzMp0gtsds4YLqAgc7BAe5dP8hSj4xH2Q==
X-Received: by 2002:a05:6512:1585:b0:448:3936:a5a0 with SMTP id bp5-20020a056512158500b004483936a5a0mr2318972lfb.108.1652944818555;
        Thu, 19 May 2022 00:20:18 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t1-20020a2e9c41000000b0024f3d1daeb1sm479424ljj.57.2022.05.19.00.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 00:20:18 -0700 (PDT)
Message-ID: <4b295be3-ae3b-f977-6922-d1505b7843f0@linaro.org>
Date:   Thu, 19 May 2022 09:20:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/8] firmware: qcom_scm-legacy: correct kerneldoc
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
 <20220501103520.111561-2-krzysztof.kozlowski@linaro.org>
 <20220519000350.DD5C0C385A9@smtp.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220519000350.DD5C0C385A9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/05/2022 02:03, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2022-05-01 03:35:14)
>> diff --git a/drivers/firmware/qcom_scm-legacy.c b/drivers/firmware/qcom_scm-legacy.c
>> index 1829ba220576..7854af4abc62 100644
>> --- a/drivers/firmware/qcom_scm-legacy.c
>> +++ b/drivers/firmware/qcom_scm-legacy.c
>> @@ -120,6 +120,9 @@ static void __scm_legacy_do(const struct arm_smccc_args *smc,
>>  /**
>>   * scm_legacy_call() - Sends a command to the SCM and waits for the command to
>>   * finish processing.
>> + * @dev:       device
>> + * @desc:      descriptor structure containing arguments and return values
>> + * @res:        results from SMC/HVC call
> 
> I think only SMC call is possible so drop HVC to not be confusing.

Sure.


Best regards,
Krzysztof
