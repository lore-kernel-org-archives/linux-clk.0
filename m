Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55837C761A6
	for <linux-clk@archiver.kernel.org>; Mon,  3 Apr 2023 09:44:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbjDCJoh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Apr 2023 05:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231749AbjDCJoS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Apr 2023 05:44:18 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1890C1205C
        for <linux-clk@vger.kernel.org>; Mon,  3 Apr 2023 02:43:40 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id i5so115009883eda.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Apr 2023 02:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680515013;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=emdytwm6Vo64J5QWp59UQMgTkiLCnS1+d3jrELtdiyg=;
        b=EYD2yhSSmiqu3ePf7ZuJWZvqACeLurOIT3MSjtzJ7Tn0FlzKzxvp34CSYLW3X8ewjN
         u/aQEAP6RaN5ny4/uKWoR0tAOE71l34KFBZp6tIVhsb4IwHtMxiXyPP306LcGPHnBwdj
         WyMVRwkrf1a5JKtZ2vURm3GlmgE2aMl96MWDiZLK2JtZCqQ0PueDiAzHrJjYO+HrQN7e
         G9xqedq0uhJS3hUz5BD+HLjJPeGvxZdjBoOc4SkVw2daYAVZqnYz6rsR5vyKiTeBM2ne
         YQnBqddmY80C2zNqtbRdcd0N1LjHIyV5Fcd8WZq8UzeerNzItqvLrVk6ssl6/ScMtn+x
         0dBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680515013;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=emdytwm6Vo64J5QWp59UQMgTkiLCnS1+d3jrELtdiyg=;
        b=UkeaPF8BK2rA1yaWbgOvuxxYgovOrJPFLdCuoRIOUZQJKjO3n+yOyxNbItrKNJsXO8
         UrbW5hfIGeJx2aybwIl5wztpz3cn4N4dBKjzgRn3O8V8/29VVBZt5eJCVyQb3cN8gKo0
         N8C7RkLW6Vio65IKq+DVME2h0AM7HNMfy0p2yYaP84UWsZgmeGhcOPRah+s/Xl++tIFb
         JFieIzuS2hs7D9HqTkwH6pZBEadH43BHvdXGzZrJvmOjjljEdHaJqkvlPZWNxGArBlOX
         l5A1FpjbuhGDjIg5EffkmJnv77sBjjfs1SVBcey9SFwTc/oAmx4/FezJriKWDdS5SWve
         bD2A==
X-Gm-Message-State: AAQBX9dDwSYEd2FlIWZ96xz/kPJc89Hz6jAt869YFrBmzgZcQId6drD3
        EIx1xOpVFtEhAlI69QTb3CqyKg==
X-Google-Smtp-Source: AKy350Y0hl/RzYdB7dN+wNKEqctheVFdh+D4QlJV8y5dEO3YNu3a8xD1aDOYFuiSABD5iNu2w/XIJw==
X-Received: by 2002:a05:6402:653:b0:4fb:e9b8:ca56 with SMTP id u19-20020a056402065300b004fbe9b8ca56mr29259113edx.41.1680515013182;
        Mon, 03 Apr 2023 02:43:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805? ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id a24-20020a509b58000000b005027d356613sm3974212edj.63.2023.04.03.02.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 02:43:32 -0700 (PDT)
Message-ID: <14d7b3ab-5ac6-61dc-a538-62993edadae6@linaro.org>
Date:   Mon, 3 Apr 2023 11:43:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V2 6/7] dt-binding: clock: imx93: add NIC, A55 and ARM PLL
 CLK
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, abelvesa@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20230403071309.3113513-1-peng.fan@oss.nxp.com>
 <20230403071309.3113513-7-peng.fan@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230403071309.3113513-7-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/04/2023 09:13, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX93 NIC, A55 and ARM PLL CLK.
> 

Fix subject in all your patchsets.

Best regards,
Krzysztof

