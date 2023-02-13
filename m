Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE65C636D4
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 11:00:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbjBMLAM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 06:00:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjBMLAM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 06:00:12 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ABA9B772
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 03:00:10 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id m14so11697994wrg.13
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 03:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c2OREUNkDHFo+6N4ZDHlsRxITrcEyLw+kVy88yhDDyg=;
        b=bLYM6lVB6hoCsp0byzoA0iR72BM+YJVLDs6Nu4sZLAVLA1pPuYwCJV8ecUJQIoR+8P
         u76I2Z1jSi5uzQIX5yjPAKAGvBql3yAlnYXPbTnWlGMknTpgcSYMs3MR4/v6uOtpCZrm
         GS9XdUVWWvdzk83i5f3svEgoqndpoVNtVNm7Klf8FcAWt+9ItdaWtQvyHfM2HdRavRr9
         nCNaByxSrKsHAM770HAQLfAhtooM3/1sQfAUqEqW+UmJXInJvAMNhVXimCyMr1UsSxao
         NLd/4fHTDEIH3jbvW84cpuFFq3AjiWbJ8frIF4CWHfMRP/ovJQvSmXlMkb8FOK3+eEw7
         jEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c2OREUNkDHFo+6N4ZDHlsRxITrcEyLw+kVy88yhDDyg=;
        b=7YDBsU6VWqgb4RcKcaZbAqZHPDMj+Ax1LaoCpqHAz3O71JQJmYUWB0s/SEr1dsyrCb
         Wx9evjjFfQWjVqw/f8DQDNfnYJbPTbcJGiDnZABLKkwqe6nTOSb1W6dfhElQzxDiAFTb
         XuTXBh2h+EcoqTlgFSCKmBjf/yfz3qeOirYEYkREmQlEVZ68yNNH9RYKtOnMj1BkP09i
         eIjSsCXLm6xo7vZr25wPNjy4h8Pi7t+8KSgYqhQLVRllItSZ937phh3qxwQI0RFY6xR1
         hEeuuu1uSRS43xZob8DjMBaj26AKQ5EOzBoVEdRVTESA2k/4AbGrazCU77uCdNEZ6e1u
         Sj7A==
X-Gm-Message-State: AO0yUKWEvjLvyJlzhlPMki5imUQXnPk3/86AIiTGongKF4IhoawA3JoY
        IC13cykqeTfIWcMkc20wc+Kyfw==
X-Google-Smtp-Source: AK7set8Az8lflKGGAyVJoMUwWTvPJZXQy3tXG76vQT2n6km1ji7E3RkIzXnJ3v/QjTWCBlEoeoqdzw==
X-Received: by 2002:a05:6000:1d2:b0:2bf:b661:87d9 with SMTP id t18-20020a05600001d200b002bfb66187d9mr19780548wrx.50.1676286009033;
        Mon, 13 Feb 2023 03:00:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g17-20020a056000119100b002c54e26bca5sm5790579wrx.49.2023.02.13.03.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 03:00:08 -0800 (PST)
Message-ID: <f18230c9-7c9b-9e59-993f-24d40b74ba9d@linaro.org>
Date:   Mon, 13 Feb 2023 12:00:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6/6] dt-bindings: soc: amlogic: update sysctrl
 clock-controller subnode type
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
 <20230209-b4-amlogic-bindings-convert-take2-v1-6-c4fe9049def9@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-6-c4fe9049def9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/02/2023 14:41, Neil Armstrong wrote:
> Since the clock controllers are now documented define the right ref
> for the clock-controller subnodes and fill up the example node.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml         | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
> index 672eabd90c09..57eae355f1b9 100644
> --- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
> @@ -43,6 +43,10 @@ allOf:
>              - amlogic,meson-gx-hhi-sysctrl
>              - amlogic,meson-axg-hhi-sysctrl
>      then:
> +      properties:
> +        clock-controller:
> +          $ref: /schemas/clock/amlogic,gxbb-clkc.yaml#

You just added this binding. I don't understand the split.

> +
>        required:
>          - power-controller
>  
> @@ -53,6 +57,10 @@ allOf:
>              - amlogic,meson-gx-ao-sysctrl
>              - amlogic,meson-axg-ao-sysctrl
>      then:
> +      properties:
> +        clock-controller:
> +          $ref: /schemas/clock/amlogic,gxbb-aoclkc.yaml#
> +
>        required:
>          - pinctrl
>  
> @@ -81,7 +89,12 @@ examples:
>          compatible = "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon";
>          reg = <0 0x400>;
>  
> -        clock-controller { };
> +        clock-controller {
> +            compatible = "amlogic,gxbb-clkc";
> +            #clock-cells = <1>;
> +            clocks = <&xtal>;
> +            clock-names = "xtal";


Best regards,
Krzysztof

