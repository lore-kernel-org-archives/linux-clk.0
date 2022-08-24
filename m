Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B61C00140
	for <linux-clk@archiver.kernel.org>; Wed, 24 Aug 2022 13:27:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238258AbiHXN1T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Aug 2022 09:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237172AbiHXN1S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Aug 2022 09:27:18 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A148672EE4
        for <linux-clk@vger.kernel.org>; Wed, 24 Aug 2022 06:27:17 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id q7so20302673lfu.5
        for <linux-clk@vger.kernel.org>; Wed, 24 Aug 2022 06:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=c45lYX8RXqinZK4YfOxUYn7I1dL1A9tsyXH/7KdT7zo=;
        b=j17KyB8x4HHjQgrh7HEBJuDHYBcdyG5IYrfjIAfF29/vOt5ceX5mYiEN9Lhr26iEHT
         uguDoQY5k75hXyfRORn/LIoIIZXgnfjsRkknswONFXYgOB6hu46c6q1jCnKRxMozx+U8
         IwKzb8fz1FtUJ3u86SjBVR7KbiYwf8HBMfLUmwVCJ/UuLhWIKFo4Pdl6hhFe/FfHb6id
         K2GtQCOpwdX/IHCXHISI4qDW0RlADt+S/e7StA3OHH++Kzi3UWW0QFVE0vImgiKB0Nm1
         QLkXkED2ft0zCWwkSHcqsPk5AtknEvFaxsj74ToimQwyfjoBNeAZhSssV2mdV5JY0KkE
         N+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=c45lYX8RXqinZK4YfOxUYn7I1dL1A9tsyXH/7KdT7zo=;
        b=PifiqSZf0FPktqwUh6+DmMvHun/3MaauFab3Mqgu1+eiWaRzYnm531r0p4pTqSDaJe
         6m4LlzbxYvU3X2Kuf545lBUxWMD/GlO2RFoRH0OjkOtHE6jn75sRn5ClW1sGRxrwv1Zu
         zreIKefioHU+0AqMHkbN/fxP9Zp6nTIBdIDPmy597LmsJGtEin98n8oWP0FgO5080JBH
         LJ7euEUO/VPRiUw1fwTKZJ6Ir6m57PXdVvhyzKEKKlSO/veNC8b9BOAraLbYkSO/OEw1
         wrGrMvtcfvw6hgDCMs0NoUyDTrNjJESnyBCFWttlbBuCjIlOjUZdWFnmtxAfojG0Z0jo
         yyfA==
X-Gm-Message-State: ACgBeo2VUv7KUENysoiaOoe6WiAnnsscoABePD8kn/NHkF7dVUlbAiJ0
        qc9r/ScOzCYk+k9fp1h9RMquSw==
X-Google-Smtp-Source: AA6agR5+dvoQAGR9/rB/GV9HncXOGxbKuFJefiohubaUP2MqmRN7gCj3f7ww8Mwsdzj3XsY8oLCoKg==
X-Received: by 2002:ac2:4465:0:b0:493:b4:c4ac with SMTP id y5-20020ac24465000000b0049300b4c4acmr1848654lfl.446.1661347636057;
        Wed, 24 Aug 2022 06:27:16 -0700 (PDT)
Received: from [10.243.4.185] (107-129-159-217.sta.estpak.ee. [217.159.129.107])
        by smtp.gmail.com with ESMTPSA id z13-20020a056512376d00b0049288e0bd61sm3028871lft.58.2022.08.24.06.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 06:27:15 -0700 (PDT)
Message-ID: <a9125027-a23a-ef58-cede-0b1d019f362c@linaro.org>
Date:   Wed, 24 Aug 2022 16:27:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 2/5] dt-bindings: clk: document PolarFire SoC fabric
 clocks
Content-Language: en-US
To:     Conor Dooley <conor.dooley@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Hugh Breslin <hugh.breslin@microchip.com>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220824093342.187844-1-conor.dooley@microchip.com>
 <20220824093342.187844-3-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220824093342.187844-3-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/08/2022 12:33, Conor Dooley wrote:
> On PolarFire SoC there are 4 PLL/DLL blocks, located in each of the
> ordinal corners of the chip, which our documentation refers to as
> "Clock Conditioning Circuitry". PolarFire SoC is an FPGA, these are
> highly configurable & many of the input clocks are optional.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
