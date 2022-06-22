Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31049CCA47D
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jun 2022 15:14:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359275AbiFVPO3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Jun 2022 11:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359242AbiFVPOV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Jun 2022 11:14:21 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D53D43C705
        for <linux-clk@vger.kernel.org>; Wed, 22 Jun 2022 08:14:19 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id c65so1331493edf.4
        for <linux-clk@vger.kernel.org>; Wed, 22 Jun 2022 08:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=MrbZtaLd72AWbUNZUvq+3EUC9TFqAA/Ym3AEvzkLNkQ=;
        b=RtkZJ0W24qnsBx8EJBAs5r569tN8kJedXETYlMi1T5FjsGZVbGwmCLEwhBpOYxC4YZ
         neDhjYhVyFrIjkuIbq85C8MAHs/NyTShod3cTHY+I2UhJxzFS8BBdGt13Uy6MGqVPCO8
         BraKMmGvWW1dCGwdjMVgYWan2ZAcQz/PZRzIK16BuDxsDvQb0322zIggL9LQHd3MV76W
         gJsOW1Ag4JjlQ0mQbRQ3HizozpWos3mxfQ8PVZvM81TVX5xZrDJcA/gQq/rxkH78pdhu
         LLMAJm57sxF5ohAbGyw5ay7pCZ07AwnBIQH34Bh/GKy+IhR/oDQyBODX4wTmsB4wtKr+
         7MUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MrbZtaLd72AWbUNZUvq+3EUC9TFqAA/Ym3AEvzkLNkQ=;
        b=jbMMSXK1XYHr5DWaQ9xIpWOJsOsJ6rr1ApaWXuzkU04k+dIgmphbC6z/7QtudpJeCx
         aHFMylOwErGrd+VzWjNIXwKeTe46UqpFLqOuxnX2KcK9fz4w/vqf1shiJXIuynKNCjed
         G/V0scdlsX8vf3tISQkBk17l6yS87fkoiTqqffDEHrQ95MOO40oqHJfeKcewWIoy8dOO
         Gi2Lcp8X4iW8TrxQdV+UUDKoWr/3U7AuAcNffzPmFRpUaz2i9Kq4binJo/c2LgbFe5zD
         FLQVQZxajCCWTNXX0e98XOBtdAr+fKb0gCCNpDVuxfux7q7hY5Npa1NjU+KGkAfxyDD6
         +m+A==
X-Gm-Message-State: AJIora9X2fun8fR4+L133y0+wa58b64p0e8QR8sm2kYBKEgTco+LD+vS
        A3aWLKx6LqAq+kdUpOiYPQixvw==
X-Google-Smtp-Source: AGRyM1s2PrI91CQS76o4vHYX7nL2Klo+CzdTyknqWI0pfwCxZ0Srhg/foHX3Wb4KMaJnGGlL1UyvrQ==
X-Received: by 2002:a05:6402:51d3:b0:431:6c7b:28d with SMTP id r19-20020a05640251d300b004316c7b028dmr4549790edd.281.1655910858371;
        Wed, 22 Jun 2022 08:14:18 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b17-20020a1709063cb100b0070b7875aa6asm6737858ejh.166.2022.06.22.08.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 08:14:17 -0700 (PDT)
Message-ID: <317d18af-e4a0-523e-960f-5e2df66afe19@linaro.org>
Date:   Wed, 22 Jun 2022 17:14:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH V2 6/8] dt-bindings: qcom: Add ipq5018 bindings
Content-Language: en-US
To:     Sricharan R <quic_srichara@quicinc.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, p.zabel@pengutronix.de,
        quic_varada@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220621161126.15883-1-quic_srichara@quicinc.com>
 <20220621161126.15883-7-quic_srichara@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220621161126.15883-7-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/06/2022 18:11, Sricharan R wrote:
> From: Varadarajan Narayanan <quic_varada@quicinc.com>
> 
> Document the new ipq5018 SOC/board device tree bindings.
> 
> Co-developed-by: Sricharan R <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>

Your chain is wrong. Since you send it, your SoB is the last. We have
nice example for this:

https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L473


Best regards,
Krzysztof
