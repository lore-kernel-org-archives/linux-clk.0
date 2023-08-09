Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5FDC04A94
	for <linux-clk@archiver.kernel.org>; Wed,  9 Aug 2023 13:02:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbjHINC3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Aug 2023 09:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbjHINC2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Aug 2023 09:02:28 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD681FF5
        for <linux-clk@vger.kernel.org>; Wed,  9 Aug 2023 06:02:27 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5222c5d71b8so9511643a12.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Aug 2023 06:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691586146; x=1692190946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2UTPDU0KQX0RK3PFL4VZ/siqN/71SBG93gUP3ty/AHI=;
        b=EKV2vY9KxdA/16++Yq3IXCAwhFYNW/5vtkUpWcl5whiTseN/z5MKtc8AmdpfPuzjJn
         do15Q+6YXXVpJ2l9jYsLvF4Gbo2jVJKXW04eOFUNr44WEK8QpdqT3SNb38JUeEjjkwon
         XJiqolrtWOpu9oe7+P1ckdTrZnB49bf59/ahl+IgSCF1JXEQ8psJ8907a6WgNz6DZuqR
         a5KWy2AulAyKrCMMZVaRCh2bpvzk/DyUXL6xxtB0d2bJVK2lmDGO6VCj1By649Pamc1v
         bdCQDd/h+UpxdO5Hq1cWCgWl/auPMFCcXyIbUV1Zwmk3dTr3S6Feo+eaOZ+4Lq3f1vGy
         iQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691586146; x=1692190946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2UTPDU0KQX0RK3PFL4VZ/siqN/71SBG93gUP3ty/AHI=;
        b=iaZYe9WaetFXzA3TPDMbK8CpXuRTvGk5MjwAaAoKN2gA4umUXaPmnSqykRljGLIBdS
         94RyP+VjjKXrJ5QnDCOL4xLm3UBNnRB4ETjlz/imwjmB/Czemk3+7cMd/Dvn1A9hZvHm
         e0z1CLeQVLSxP1W6b5K4gYwjomSOTnXzsIR6WJfZVCccOBVMpQTq//VlMddSgYghnL4/
         S1pTmKukTyiZ2j4XjnBcoD7FFyUR/XMYD4GTuKTdhKBhvNyirWgbhr2aPHkP0dMec6zi
         DS0RD6O/pztPN9xxMgDLuQDqxj96r6fL/8vnIpWAvJBLdCIOPGAbn1PPH0g9uLSBtHD8
         BvpQ==
X-Gm-Message-State: AOJu0YzahhDDqQJfBpmn5puVUYxPcAG25c9ks6SXQFXnJYILD/fjnGvP
        PUazYgG8v/zCqZ+RblQ2F/IhZQ==
X-Google-Smtp-Source: AGHT+IEidig6boVf6/NGmLXgeMbZejHvX6edJdvVWmAIRdrMFKINsNWdRvhNOytepsdCsN40c9Hz4A==
X-Received: by 2002:a17:907:a041:b0:991:bf04:2047 with SMTP id gz1-20020a170907a04100b00991bf042047mr1986339ejc.14.1691586145679;
        Wed, 09 Aug 2023 06:02:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id gl23-20020a170906e0d700b009894b476310sm7966706ejb.163.2023.08.09.06.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 06:02:25 -0700 (PDT)
Message-ID: <a48b1a97-2286-d2f9-742e-d718adcf1eed@linaro.org>
Date:   Wed, 9 Aug 2023 15:02:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson: Convert axg-audio-clkc to
 YAML format
Content-Language: en-US
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Alexander Stein <alexander.stein@mailbox.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230808194811.113087-1-alexander.stein@mailbox.org>
 <f4c57e4b-674b-f870-b215-8b2f80a7c9eb@linaro.org>
 <1j5y5obt0u.fsf@starbuckisacylon.baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1j5y5obt0u.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/08/2023 08:58, Jerome Brunet wrote:
>>> +      required:
>>> +        - '#reset-cells'
>>
>> else:
>>   properties:
>>     '#reset-cells': false
>> ???
>>
>>
>> You need to constrain the clocks per variant. Probably names are also
>> specific to each one, so the list of names can be moved here and you
>> keep just min/maxItems in the top level property.
>>
> 
> input clock names and constraints are the same for all 3 variants.

Then why do you have this huge, apparently unnecessary, oneOf? If it's
the same, then drop the oneOf and make number of clocks fixed.


Best regards,
Krzysztof

