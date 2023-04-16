Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFB1C77B73
	for <linux-clk@archiver.kernel.org>; Sun, 16 Apr 2023 18:31:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjDPSbL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 16 Apr 2023 14:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjDPSbK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 16 Apr 2023 14:31:10 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2322122
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 11:31:09 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a5so2072399ejb.6
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 11:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681669867; x=1684261867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LlSBR/ShimGduJqFPI5aceEu54uJPlimp53JoHD6PME=;
        b=yFv2QCH3hdQbx8P4vVE9YZ6FaDSEmZtc0t1GxIAa1LajI3B1pOfGVqFOiJKTbaMMT3
         mEEzH5DJ+XWhjKg30hTxyGqyVmZ61OxMMNxwzfYvCglBLb4qLiCEvvcgENB8A67A2GDN
         zEJBPifwHT00k4boYDIlWdJubiETWr/nzLWn9tyIAvnBIka5+nei0TUt+Aq4fQMhtuOy
         YVm82apquBqlN3MKcfzagkW+BYtOYlN32x5sRUKZqzSCrnsnzZ6lWvm/GMPScUKSxxzZ
         nQmS/sbEFZGNY/TxoFfEgYxnSiYxx8JTlwkqtGSucta2THKSeajuJymxMUstaYsp6zKJ
         Kuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681669867; x=1684261867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LlSBR/ShimGduJqFPI5aceEu54uJPlimp53JoHD6PME=;
        b=iBL03W1KgLLcIPyKmcRxpWpv+Q6ZY8U8V1dx9J5voUK+HXN59U9w1kVcuFiFgia6WY
         aArxuP4PS5DVxGlF3Z5gJ73rPequMqokBgHmO2jJcqTwz+TsnGJU7U01FgPsGxyqzOA6
         xsg/sIuzocZI7QFq1OD3AXnuyUoihHa15RY9043WYqNuqJBORNPAwgFOw0jzaKLguMTf
         WW26BLO9tn/+YkFkgiRcIPw5nPS4Tfm0jxFDwxS3fZ8sSDKzccb9vPBaJslOAwe7BnOh
         43Bm4aIiHP4ZqYga46pcGhHg5cCNyP/iqk1LLjbXSaXj5z9DGN31XiX/ud3bh45SEINK
         eDpg==
X-Gm-Message-State: AAQBX9fhpV+XKGitY4aYsIZRgp6GS/HG30L5P3VwSAy016SFhT8Ll+Hq
        mXWneR4y4Yu7Cl7PQYUqfqy65Q==
X-Google-Smtp-Source: AKy350YW7KeEJrlhpMsn0KWhTkUJxdnRtKPEFgnpdqTcJQnTkS+JAd/5gtmkuKjD2e622LFsZTZUzQ==
X-Received: by 2002:a17:907:c018:b0:94f:6025:be53 with SMTP id ss24-20020a170907c01800b0094f6025be53mr1731474ejc.50.1681669867471;
        Sun, 16 Apr 2023 11:31:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id gv35-20020a1709072be300b0094f07545d43sm2896853ejc.188.2023.04.16.11.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 11:31:06 -0700 (PDT)
Message-ID: <dcaf82c5-8fc6-68fd-c087-8d55def90ea0@linaro.org>
Date:   Sun, 16 Apr 2023 20:31:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 3/4] dt-bindings: clock: Add gate-clock
Content-Language: en-US
To:     Yangfl <mmyangfl@gmail.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230416173302.1185683-1-mmyangfl@gmail.com>
 <20230416173302.1185683-4-mmyangfl@gmail.com>
 <8b3ea617-8d4e-cf0b-1cb2-d02405c39487@linaro.org>
 <CAAXyoMPcmbUGDpM6YAyJqGaXvgg2rQOCSdGGnaVQoGd5OE4OwA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAAXyoMPcmbUGDpM6YAyJqGaXvgg2rQOCSdGGnaVQoGd5OE4OwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/04/2023 20:28, Yangfl wrote:
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> 于2023年4月17日周一 01:41写道：
>>
>> Did you test the changes?
> 
> I don't know what "test" is here. make dt_binding_check passed and it
> can work with the driver.

I don't think so. If you tested it, for sure you would see warnings like
"node has a unit name, but no reg or ranges property".

Best regards,
Krzysztof

