Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F11CC3DA78
	for <linux-clk@archiver.kernel.org>; Sun, 15 Jan 2023 14:35:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbjAOOfa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 15 Jan 2023 09:35:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231213AbjAOOf3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 15 Jan 2023 09:35:29 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D4D113E8
        for <linux-clk@vger.kernel.org>; Sun, 15 Jan 2023 06:35:27 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id qx13so4215880ejb.13
        for <linux-clk@vger.kernel.org>; Sun, 15 Jan 2023 06:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DMuIH5LG2Ixkb3oKpryjATK2iwStMCn/u2ZA+n6gcS8=;
        b=BgwVzXD0n3KGXA0DkPiJuIUd0XhBqL41XcLGLS3BXVxEzzD3IHDUDARxXhrNM34vHx
         OCOk66fh1zUpjlKFSkcvWrUFtpR6uU701TB9mf4MVsp6EwgLWZ5OyQag9yr+lHGaujn1
         aJLSWXFBN7WuDwuNTXvYU1QWRSLrhJrAf3m2ISFcF7knkLlXR5AdvHi+W5ZesxD9MzMj
         CnqVMWLz2lqWPSIFkxoN/JddaCnACYIwgozkw+HFeraVRQqTZ+deoG+8/SX8wJB7jQBL
         aqqOJ8c8yDSoSncz4+38X3E5biDJSlEwjnqjMrY6Z3uah0AtwvOIbh7Q0eG7lGqFuvga
         yXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DMuIH5LG2Ixkb3oKpryjATK2iwStMCn/u2ZA+n6gcS8=;
        b=LAgyPv1LomlZEZvNYTfFs+jskHOD2071wPt3UMSxYfapGX/571HjEi6iIviiPG44qe
         Rlc8OZAICrU+xAWmce7VJxwuXAx353dVWadse7t9hXwaTWUWwNLAOZP2ngZwIbDJ7qAx
         QMBAzCNIf8a2MtMrb0QaM7Z1gjqrqws4r2ay/gWNruimMwyh029G86e6UVFhOHXUr/Qy
         uL5sOTBg2mC/RXEmuzRlShE3VU1D4Jh4H1ldzr4NpMLlaJyO4jVYOm2fC5P4S3uWNRp9
         4H2QtLQygkKFIyRRs7ThtCPyrrXsA+3YzM13zbLMrejzQ1FyxhtsAmMwWTMp5QgAC+yQ
         l43Q==
X-Gm-Message-State: AFqh2kooPYoFsrg9LYpIPznwnzU9umiAzQewQdvLUTCng8Begml7/oUk
        23Z+CFjQ4m9xmdN4hrL6Ip/lDg==
X-Google-Smtp-Source: AMrXdXsKlT6DeiXdPYqVuF4feQTf1Ore6dkf4nNfirTPjsdE3vBPGR0y270Pizq9p+u5Bh0ry55icw==
X-Received: by 2002:a17:907:2c61:b0:86e:fccc:bc19 with SMTP id ib1-20020a1709072c6100b0086efcccbc19mr3609305ejc.43.1673793326201;
        Sun, 15 Jan 2023 06:35:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id wl21-20020a170907311500b0084d37cc06fesm9623940ejb.94.2023.01.15.06.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 06:35:25 -0800 (PST)
Message-ID: <063c5516-417d-7c21-b58f-a6552779a621@linaro.org>
Date:   Sun, 15 Jan 2023 15:35:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: clock: qcom,a53pll: drop operating-points-v2
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230113145859.82868-1-krzysztof.kozlowski@linaro.org>
 <e73ad320fafa1365e3506bbd4cc77d8d.sboyd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e73ad320fafa1365e3506bbd4cc77d8d.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/01/2023 21:28, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2023-01-13 06:58:59)
>> The CPU PLL clock node does not use OPP tables (neither driver).
> 
> What device is qcom_a53pll_get_freq_tbl() operating on?

On its own, internal table. While of course driver could be converted to
operating-points-v2, no one did it within last 5 years, so why it should
happen now?

Best regards,
Krzysztof

