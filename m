Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A22C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 25 Apr 2022 18:49:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243738AbiDYSwf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Apr 2022 14:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244654AbiDYSwc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 14:52:32 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C961291D1
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 11:49:25 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id y3so11032933ejo.12
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 11:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=83hu77dgmAdgOlmu6Sz8NpPU54JO4fW9HRIvIUjVaz4=;
        b=QP3o+fHSOMrRf40mzyQrQUCqiB0DMBCJz7V49S2SDp/tc2/AlG+yOb/+Esp+KWOxHL
         Hpd2VguxluR47JPQ7RUFjqWjp/g46bH0bAvwx6tea3mKXa1M97jR4AagwTKTLN4UH9US
         oexyug+MYU33h2mlCaUkcRz2Vkk1Zer9seA6uomrtdnVNL8epo2381tJFdfmQG9jCMi5
         bfAzJlaVM1CNzAup4ELb1Ig7i7aUD5ox7Vi9SC3khNWG+XjdB6du+U4k4Wma2+0/SX/Q
         rqNDwH1ZUAVdlN/TYUZnT/JUFn3aoGcu8o+AUoI8ADGEKu5Si8gUCIU079DUbDpAAIJl
         d/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=83hu77dgmAdgOlmu6Sz8NpPU54JO4fW9HRIvIUjVaz4=;
        b=lIaFb6jUSZ2SFZgisYUFacb5dIXRyiRN5PQxKk2eLiJtM2ogO0Ks2HLVD0YqLimS0N
         BMdKVyApyuSl7Z1GnviyWOvvxBkwYK+3V4VyCwY+OXVBTup/cR67ohwCI4DQMGAhkoO+
         +SNj7YxTnWh+27KlrCocvZVya000vpjftqG6H80HhgVdSaDVlbk2txcLQwgUGPvKxWQJ
         JaQDyrlybQA4pr4EqcdNkDqTm1By9NtYZXKRqz+RgIEgdm4QEi3GA9htbC70z5PrgmPM
         kBuDMaK8OQQZzHnl9+VVUO9xPyECFbJRwCiIDfFTgpW/H0FcPcI/iMYAdUOUUUqcs40T
         GcTg==
X-Gm-Message-State: AOAM5312BouiiSNWanW+YwUp6b9BLT2UP+qaSEZMT8My2k9nBpd2mUKt
        UYLa5WF17LzyNeWsNqhKf33pVg==
X-Google-Smtp-Source: ABdhPJyQ7KfkySdz2j3okSsEM8q3uVin74vtr55i0ci5U16Z53odwYJ/cgDVkR+3Ym2GAk7d/IyFFA==
X-Received: by 2002:a17:906:a2c5:b0:6e7:f44d:ed7d with SMTP id by5-20020a170906a2c500b006e7f44ded7dmr17731309ejb.329.1650912563700;
        Mon, 25 Apr 2022 11:49:23 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b16-20020a170906709000b006f3a8aac0eesm277773ejk.0.2022.04.25.11.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 11:49:23 -0700 (PDT)
Message-ID: <3139ef34-322b-9afe-e5c8-ae0f1b7f1848@linaro.org>
Date:   Mon, 25 Apr 2022 20:49:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 6/7] dt-bindings: clock: qcom: ipq8074: add PPE crypto
 clock
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, absahu@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220425182249.2753690-1-robimarko@gmail.com>
 <20220425182249.2753690-6-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220425182249.2753690-6-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/04/2022 20:22, Robert Marko wrote:
> Add binding for the PPE crypto clock in IPQ8074.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
