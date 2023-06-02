Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71361C7EE29
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jun 2023 13:18:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236131AbjFBNSf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Jun 2023 09:18:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236151AbjFBNSd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Jun 2023 09:18:33 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C51B1B6
        for <linux-clk@vger.kernel.org>; Fri,  2 Jun 2023 06:18:12 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51478f6106cso2957529a12.1
        for <linux-clk@vger.kernel.org>; Fri, 02 Jun 2023 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685711891; x=1688303891;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+NwS3zwEZvLwZpFK4ZiaFDiysXGsoIUw128QiW5LtVU=;
        b=y4SvAQHWgG5smj0nfr9cPL7rQvdt+tK6xIKJN0ulw65aVNy/YL45IdSDjNDnQcMYUs
         Kj0wjGYzG93cyd6LOUYTn21uAVPRLY6nXj0urvDaZy4/6Fdo0KvV58x2jBQjl8sxMGkp
         F17BWTrDcCC1zPba7hYt12q4F/0G742A1CshaNWFJdzOX+mCMg9p2fb3J9/BRvCQqD2C
         MI7BP2tA1WBhHD4vzsFGkkvrOFS0WVTi7AHK92+OYpbpEvBg0jdSoj/a8zKeOcVQk1Kv
         NGk/Ate+EL5OQhweq+scBl3NcZEh6E88/c86+0VHj54iid0E8n97Hk7e8XiHhcFwVcHV
         fmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685711891; x=1688303891;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+NwS3zwEZvLwZpFK4ZiaFDiysXGsoIUw128QiW5LtVU=;
        b=VC3l2qsaRdVuFvPyedbuciHcrGJSIkZasc2wrXu41ooSGcb/ctg2j03HRamjWDRbWl
         4Ur0pDnVrCFnh2EWlkWR/Lm9JmOwkQz+ZVmVJAogYTZ+4omdOmK1Ezgvu8RE5kLoDuVw
         jnSWUn0Cmsrjq6oJk7YqI5fp1Io6VdAZxxQO0MXHqYdX4AUiBOHoJ4uyxuqTaTOSz3Op
         wluwgIn4VmuVPTDvIP0lagw46MqygG8SsVGteNeoyV9BTtc91Hxwhcp7XLw3E8CdHoi7
         8P7QzCDiUiXL78KKc6bQSbRa7NZEHJMmUJ8NN894m1bWi3RTmR024jpYdJMM5THzbCIr
         0bOQ==
X-Gm-Message-State: AC+VfDxGSQfrYpn67FOeJu/ipJRoyZAEkJMXxJwYyp7D5odqQNsIQafS
        486hNpUoYfvNbLBgjTniFFzItQ==
X-Google-Smtp-Source: ACHHUZ6JYFwp/knwwWxf+ufp1RJgv7D7BecZvMAW0KHV56DSQ8VwVIvFUeqNQttcyPPpjVyDgEDmXg==
X-Received: by 2002:a17:907:3e14:b0:974:545d:cfa3 with SMTP id hp20-20020a1709073e1400b00974545dcfa3mr3324224ejc.64.1685711891425;
        Fri, 02 Jun 2023 06:18:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id x17-20020a170906149100b009764f0c5fe6sm19622ejc.7.2023.06.02.06.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 06:18:11 -0700 (PDT)
Message-ID: <b06070d3-a272-9a0b-2d02-df8fbca4e951@linaro.org>
Date:   Fri, 2 Jun 2023 15:18:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 6/6] arm64: defconfig: Enable sc828x0xp lpasscc clock
 controller
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
 <20230525122930.17141-7-srinivas.kandagatla@linaro.org>
Content-Language: en-US
In-Reply-To: <20230525122930.17141-7-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Resending as my previous email probably got lost. If you got it twice,
apologies.

On 25/05/2023 14:29, Srinivas Kandagatla wrote:
> Enabled sc828x0xp lpasscc clock controller driver required for X13s laptop.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

