Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94ED7C27C76
	for <linux-clk@archiver.kernel.org>; Wed, 25 Jan 2023 23:34:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjAYXdu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Jan 2023 18:33:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235659AbjAYXdu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Jan 2023 18:33:50 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E50EB2916F
        for <linux-clk@vger.kernel.org>; Wed, 25 Jan 2023 15:33:45 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id rl14so881951ejb.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Jan 2023 15:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alCMOK5cE2QJ8BpFheg8uTDRx7xWYhGAEAsl76U70GU=;
        b=iwdxpbrD4xN0U5LygfOmg1YW8nrnc7w4b9dd96+FCvOM0/fr/yoyfu+s24nITIritQ
         +sAxqwlHkVrESQmjBcitpOD+YXtmwEdS5cQ9ZuQA6eEZIsPgPLrHUzw1c5L5AIhF6gFp
         PWibNgHpYXqwiI279sEdwnQwsuSYalCcMLJjIh743aDHHAdm8lJSJDyEGcpmUzrwP2DF
         fE6PFIVKsjSCkLxbP+GysF51fRLeL0l370Skwqg320NOvAgfQPQm0/EhNJMqe6ZiWtnM
         dyl1zYAqNPFjzbdqaLnfzkBmrjrbkcjRJA54n3X7zMMdmkhsuUo0k0PaTzRp4krxPfkv
         Mqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alCMOK5cE2QJ8BpFheg8uTDRx7xWYhGAEAsl76U70GU=;
        b=XQ9XH/Ax1csaQ1tso4qeNIsxOUiWKWIZj7X/QH+hyQboqECnok6ndJRnBN31IqUTHa
         Vz7R0Rn1R8yR8zoz8mm0/ZNJCfmF09HgvGlzI6RmReZ1rBQh6uONMgGsKLJJu8VxLNUM
         GF2TzZ6/xhNHF4g1jbLyz5stnk1w6L1Cqo4q2Px9+VNdWcBwZXXhTi4gGqKiuEiEBg02
         Ni908M+PdmuC78pBmo1b+E/phj0RTDy6IaYsMcG0bajIGVCOQ+5ggDJh371TkravB5Pu
         RUUZfhCkw5RfEy6Dx7vbvtHMXVJv+glR8DYYxekLvgphFK26cGK2ZQvVXDpA5V5wg6vV
         iElQ==
X-Gm-Message-State: AFqh2kqEKtHAEqvI337xnZc35OcErSRRhHcoTMdueS/L+3xfVBCM/RvN
        zOlEzVuJD6yrmaAEppmPxlbiiA==
X-Google-Smtp-Source: AMrXdXvQtpO2go/Tg1RVocWt7FbIn7SqDzmAG1aqkYdbY4lVv5X/yly6tqxJLVRtU9IcjqvxdrWNCQ==
X-Received: by 2002:a17:907:104d:b0:86e:d851:3a0a with SMTP id oy13-20020a170907104d00b0086ed8513a0amr44241035ejb.51.1674689624508;
        Wed, 25 Jan 2023 15:33:44 -0800 (PST)
Received: from [192.168.1.101] (abyk108.neoplus.adsl.tpnet.pl. [83.9.30.108])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709067c0600b00871ac327db6sm2989960ejo.45.2023.01.25.15.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 15:33:44 -0800 (PST)
Message-ID: <b24dbfb4-8b02-bb30-d859-a313a4aaa363@linaro.org>
Date:   Thu, 26 Jan 2023 00:33:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v4 1/3] clk: qcom: smd: Add XO RPM clocks for
 MSM8226/MSM8974
To:     Stephen Boyd <sboyd@kernel.org>, Rayyan Ansari <rayyan@ansari.sh>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20230121192540.9177-1-rayyan@ansari.sh>
 <20230121192540.9177-2-rayyan@ansari.sh>
 <06d53a3fa48080d902476b71308e69bd.sboyd@kernel.org>
 <4c531c68-b74f-2f90-e8f6-98a4b0316cd4@ansari.sh>
 <a7058fb92642a1661995d7d3ca6411bd.sboyd@kernel.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <a7058fb92642a1661995d7d3ca6411bd.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 26.01.2023 00:00, Stephen Boyd wrote:
> Quoting Rayyan Ansari (2023-01-25 14:25:08)
>> On 25/01/2023 20:58, Stephen Boyd wrote:
>>> Quoting Rayyan Ansari (2023-01-21 11:25:38)
>>>> Add the XO and XO_A clocks to the MSM8974 clock list, which is also
>>>> used on MSM8226.
>>>
>>> Why was this missing for so long? Does this break suspend? Why are you
>>> adding it now?
>>
>> I am adding it because of a recommendation from a maintainer on an older 
>> patch version.
>> See 
>> https://lore.kernel.org/linux-arm-msm/20230119023337.h6a7f56lizhv4tcy@builder.lan/#t
> 
> So nobody has tested this on msm8974? Can you add this information to
> the commit text?


And can it be tested on msm8974?
+ Luca

^ could you, please?

Konrad
