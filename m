Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4780DC4332F
	for <linux-clk@archiver.kernel.org>; Wed,  2 Nov 2022 19:00:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbiKBTAe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Nov 2022 15:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbiKBTAN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Nov 2022 15:00:13 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BFB09FEC
        for <linux-clk@vger.kernel.org>; Wed,  2 Nov 2022 11:59:45 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id 8so12401919qka.1
        for <linux-clk@vger.kernel.org>; Wed, 02 Nov 2022 11:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KL36/KYQtitUchCXNlaiiO8KyUhPMqUopDSq4Jvqk5s=;
        b=CP8TG+fq/p+ha/NN68dHRJaYHB3u9c17uhu9ITBVcylElfjK4bex9DaADtv++TIZ0/
         /x6UFQGvQmS6KkKNN8YzCr1yPUDVbAyLUstWeL2jUf+iNATfzKW9waNxwDznoomMrqLT
         YpC3yTH6htTKWdGFcv8ANDTQjvqpOBFooKs3QN9UvMHCl+6fpXLqx8xMHVgNUPRLZ58z
         HVs9dyOdm13vqFyM/nH9p2xCjA8G3vFYiaj1FEI8s4f286rUmF+Z/NIJChJ3xDYMDMvW
         iu/Qrl5nMzIH0CN+mfs0zYxq+vz9745VVvF67Alpgj9V17cXi59tKYpNwQJZ8z8l5IBK
         10GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KL36/KYQtitUchCXNlaiiO8KyUhPMqUopDSq4Jvqk5s=;
        b=xC0jnR1wsyI77saO8xGV9mv/dnU8Ax3dhXkEv5koT/gxxTyVE7aVUTBrIMniCk7ykF
         dWEeMydzqWo0uKZKCrd7b9u+vtIGt7milbQk/DnzzE4tYgeAjqyoKvWMtbO3Pav71x1V
         gtcjSR/s2h7x52ZKUq5uocPaSIVqpctwO5/a4mvFt/FEF9Cb5nmxlFn6+Qg7jDBZprg2
         RZunitREZhnfBKYEaXyZZmyH8Rrf1ZlZEIfCVPYJmErNw75LPTTo5z9KdPY3cRJmVMBF
         m8dp/2I5+Pkf2b0zeViwwuM1a5RuLzM6hB/TufNi1xwO0dfiMeuPujep+YLTDq5Bj9Wf
         6MWg==
X-Gm-Message-State: ACrzQf1XOibnHxZq8V5LEx5SVozwJgaKNKm+b8+HMfxPNR5gKvBSuWjk
        gZt/YeTVaIPLvwCqDZ0OOGtEqw==
X-Google-Smtp-Source: AMsMyM7QlzDvEZmq8XYDIZCgUHYRPB/lt+m8eEfHhtJEJ/gkPHcEpM5OGVFs857DIfUC1h3zoNQzZw==
X-Received: by 2002:a05:620a:5319:b0:6fa:4c1b:f054 with SMTP id oo25-20020a05620a531900b006fa4c1bf054mr7033091qkn.15.1667415584614;
        Wed, 02 Nov 2022 11:59:44 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id bp6-20020a05620a458600b006cf9084f7d0sm8962060qkb.4.2022.11.02.11.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 11:59:44 -0700 (PDT)
Message-ID: <e6fb1c27-389c-190a-2a2d-0f5446bfb9cc@linaro.org>
Date:   Wed, 2 Nov 2022 14:59:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCHv7 1/6] dt-bindings: mmc: synopsys-dw-mshc: document
 "altr,sysmgr-syscon"
Content-Language: en-US
To:     Dinh Nguyen <dinguyen@kernel.org>, jh80.chung@samsung.com
Cc:     ulf.hansson@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20221102173843.409039-1-dinguyen@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102173843.409039-1-dinguyen@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/11/2022 13:38, Dinh Nguyen wrote:
> Document the optional "altr,sysmgr-syscon" binding that is used to
> access the System Manager register that controls the SDMMC clock
> phase.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
> v7: and "not" for the required "altr,sysmgr-syscon" binding
> v6: make "altr,sysmgr-syscon" optional
> v5: document reg shift
> v4: add else statement
> v3: document that the "altr,sysmgr-syscon" binding is only applicable to
>     "altr,socfpga-dw-mshc"
> v2: document "altr,sysmgr-syscon" in the MMC section
> ---
>  .../bindings/mmc/synopsys-dw-mshc.yaml        | 33 +++++++++++++++++--
>  1 file changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.yaml
> index ae6d6fca79e2..80dd3d72424f 100644
> --- a/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.yaml
> @@ -6,9 +6,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Synopsys Designware Mobile Storage Host Controller Binding
>  
> -allOf:
> -  - $ref: "synopsys-dw-mshc-common.yaml#"
> -
>  maintainers:
>    - Ulf Hansson <ulf.hansson@linaro.org>
>  
> @@ -38,6 +35,36 @@ properties:
>        - const: biu
>        - const: ciu
>  
> +  altr,sysmgr-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to the sysmgr node
> +          - description: register offset that controls the SDMMC clock phase
> +          - description: register shift for the smplsel(drive in) setting
> +    description:
> +      This property is optional. Contains the phandle to System Manager block
> +      that contains the SDMMC clock-phase control register. The first value is
> +      the pointer to the sysmgr, the 2nd value is the register offset for the
> +      SDMMC clock phase register, and the 3rd value is the bit shift for the
> +      smplsel(drive in) setting.
> +
> +allOf:
> +  - $ref: "synopsys-dw-mshc-common.yaml#"

Drop the quotes.

Best regards,
Krzysztof

