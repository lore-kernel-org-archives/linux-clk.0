Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72E1EB64DD
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jul 2023 13:53:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232641AbjGFNxa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jul 2023 09:53:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbjGFNx3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Jul 2023 09:53:29 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C8D1FD0
        for <linux-clk@vger.kernel.org>; Thu,  6 Jul 2023 06:53:20 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-992b2249d82so93144366b.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Jul 2023 06:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688651599; x=1691243599;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tPEzdt5vw44+M4gmXEM24Z25S5TAPcKwUGBEpWjsTdQ=;
        b=obxZS7+ft/Fv0S44gKLyvG/X9b9ABfexExDbaUc1GZM641C10i+s75gmHcMVfCnYQD
         uoFz9K9L8AQeBgJxwRfVRgn50qyayMdZnYBE4Dv9TRMawaJiZa5+xkpl1R8qeg+SkbYe
         h2LRJqRrm/7biEmXHVwkJwBAd5o8BOcOyxyQLfav2jnv0HusDJhQQ0yzjgCIeOzcV+7G
         yE8Ws8qO3xfkEtFriIydzCUdetkUojISlNT4SEgodwO+HWfq+e/GExCRFqkeuvZeF8Ul
         /ToeESiBhx7sX7CuAF95sznCmn4LftL1mGAWMjzaySzubIhYSKqu9Ng5lrhsbYCG4ebf
         4JuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688651599; x=1691243599;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tPEzdt5vw44+M4gmXEM24Z25S5TAPcKwUGBEpWjsTdQ=;
        b=cc9t74xxoKN9CutweKqCL8NPgrd+B9NvkXgaN2GYAHfXYTwkF4Ea7ca9fOYeZDKRcl
         UPXRLjulHCY8fclAqari/2rFIoPvuuOjdPet4VAPVzXzRK4r/dXXj5+waIdddxcNsaBo
         9wkKMJK82r6B/tjFB0aK5twoAGaeqz8VDtdvcdmoaOwXS2jIZ7yfPVV7IUoccP7JAKk2
         CgxkIbG10P9xYpvU3oYDOqj55jw+BDgt+i15DK+DtDNDKLPWNuIlLinaGsCz7kQbvzs8
         0y+wRYEdjvpBqNd9FGZghO+IJ4hJ15j7HrO/3/CFfqUO9amN3s9IuSv+4n+zvcuThaQ2
         1EjQ==
X-Gm-Message-State: ABy/qLZ1HW+MkmxWUaXCENItnRpBit9B5kX6dh1G2+2ak2L+vv/5nJiP
        /69aKw95mY/39oecxRFIWGFB6iezag5bskkGalc=
X-Google-Smtp-Source: APBJJlFm+y4dHMOcJedxZQfunsZdLlAk8L53nNHkNvTuAWcu/qlnBKiJUAFV8JDXvtqWuEp+4cZq7A==
X-Received: by 2002:a17:906:1013:b0:992:9907:638b with SMTP id 19-20020a170906101300b009929907638bmr1664126ejm.6.1688651599593;
        Thu, 06 Jul 2023 06:53:19 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id s6-20020a170906c30600b009934b1eb577sm851191ejz.77.2023.07.06.06.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 06:53:19 -0700 (PDT)
Message-ID: <385b2a3d-2f65-53da-5219-55f530b92d12@linaro.org>
Date:   Thu, 6 Jul 2023 15:53:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 2/3] dt-bindings: clock: imx8-clock: Add audio clock
 mux related clock
Content-Language: en-US
To:     Shengjiu Wang <shengjiu.wang@nxp.com>, abelvesa@kernel.org,
        peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        shengjiu.wang@gmail.com
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1688607078-4183-1-git-send-email-shengjiu.wang@nxp.com>
 <1688607078-4183-3-git-send-email-shengjiu.wang@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1688607078-4183-3-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/07/2023 03:31, Shengjiu Wang wrote:
> Audio Clock Mux is the IP for i.MX8QXP, i.MX8QM, and
> i.MX8XL platform, Add the clockid for them.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

