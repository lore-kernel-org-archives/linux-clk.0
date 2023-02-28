Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D3FC64EC7
	for <linux-clk@archiver.kernel.org>; Tue, 28 Feb 2023 10:08:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbjB1KIL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 05:08:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbjB1KHp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 05:07:45 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8604E2B601
        for <linux-clk@vger.kernel.org>; Tue, 28 Feb 2023 02:07:43 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id h14so9101169wru.4
        for <linux-clk@vger.kernel.org>; Tue, 28 Feb 2023 02:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677578862;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=psjJwXUn7PRcI5m/RImknQcyjGBuWJdfkTn40E9In1A=;
        b=O685HJi03vIRupVUGwMK3w4GAbWev/8/QRJUFeUKeoV+pRbCuyZCYhJvmLKML1pKGg
         zvsEZf+vrRwiwED7gNsLnNZWVWRdaa0cLa5t9x54L9HkWMGzZk2Wz5jq2b5Ez2J6kBti
         lFjo0EhVsc367UxyH4D0diZF5Any8pF25DtfgDGZ7mQ1yJ2J/dswBpFhoKZMEFRlB/f8
         v3WbxWVP55YCqS51ttaIbQK2qskXUFrdcikMHacTN6h4ijFDcyV+qddqG/fAAN2YmcoR
         H4xydO4idTDtmn/TA0nBH4p+ZH/Dvv4wYQ37EYV34vKta1PulHNccmW08xERAizDAO3Z
         /rbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677578862;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=psjJwXUn7PRcI5m/RImknQcyjGBuWJdfkTn40E9In1A=;
        b=7ofPbSD/1tYcT5mAfKsTFnfJOByxAbPiOsSkuYsfBMFC5faBlByZEGy0fS21UMBcV5
         ZARpduoPQB/GZ0wTQMcTo/Brq+djahSnkoXMRCIl/XC92/6S9FUAiSru/B1g9510iZPW
         YOj1hFNlqe6aTfUnjGdHEBPPWBumYiqLs/Qy+qWsn0veuF+F2DbvXYa7NvL1+/RIR+hx
         VcZl2omcsk0BiC8c/3PoUo0Xwf59rrRmNXwrOmnGzS24HuDh2s/F02IQWNBpF9z15u/w
         4P+WPxMNnMvxtrOacEP9m0p86lcTsCr0qFYAeIfhqxlTxAM8hCS0o++0XPLTmc8LiOvq
         kfkQ==
X-Gm-Message-State: AO0yUKWw5EfTlNeO2fzOqLMRlPQ53U+UzRmLI5d3JIsIs5mSFiGwnheB
        JdDHZs1VAJGQ2RuDsctjfj10Ng==
X-Google-Smtp-Source: AK7set8NDrOuCRgbhVHknjNj61F2a7D1OPwxOsECuVAXugPLWyW5dmyA8KJ7qvgbrPRSnCcZ622l2Q==
X-Received: by 2002:a05:6000:1206:b0:2c7:70d:cc36 with SMTP id e6-20020a056000120600b002c7070dcc36mr1720830wrx.5.1677578862030;
        Tue, 28 Feb 2023 02:07:42 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k28-20020a5d525c000000b002c556a4f1casm9264878wrc.42.2023.02.28.02.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 02:07:41 -0800 (PST)
Message-ID: <49d93fbb-f4f7-dce1-167d-086aff88dbb8@linaro.org>
Date:   Tue, 28 Feb 2023 11:07:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 2/5] dt-bindings: clock: ast2600: Add top-level I3C
 clock
Content-Language: en-US
To:     Jeremy Kerr <jk@codeconstruct.com.au>,
        linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20230228091638.206569-1-jk@codeconstruct.com.au>
 <20230228091638.206569-3-jk@codeconstruct.com.au>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230228091638.206569-3-jk@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/02/2023 10:16, Jeremy Kerr wrote:
> The ast2600 hardware has a top-level clock for all i3c controller
> peripherals (then gated to each individual controller), so add a
> top-level i3c clock line to control this.
> 
> This is a partial cherry-pick and rework of ed44b8cdfdb and 1a35eb926d7
> from Aspeed's own tree, originally by Dylan Hung
> <dylan_hung@aspeedtech.com>.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> 
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

