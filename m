Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D808C64ED6
	for <linux-clk@archiver.kernel.org>; Sat, 18 Feb 2023 10:22:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjBRKWp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 18 Feb 2023 05:22:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjBRKWo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 18 Feb 2023 05:22:44 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4D62364C
        for <linux-clk@vger.kernel.org>; Sat, 18 Feb 2023 02:22:43 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id i28so1195243eda.8
        for <linux-clk@vger.kernel.org>; Sat, 18 Feb 2023 02:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eDXyALqRpYISww1jNLImcxxytsuzRTcQknk8mT+rvJw=;
        b=colOQEc7HoIRgu5f0DqiYjPRIN4O1OtnSiLcdfz/dlCzc6uPUmY1DU24JM/1iPUSp8
         kyRycsoVC84ogqDi17/eEIn08RN8E7tIZx8kjb+YlI2mewvHF0kEbZxScgQnid32GFIr
         ZqbANrNPtNbFuO0zokUeAn1uQKHwjsg/5T9niLuGvP+Pwp9X7V2sy8ruzzJPgmtT6Uf2
         MYPdg5fJsqIlE1ctdc9IsgzsRwFjpf3dckeIUIuoa+kPOSMjbMUXp/uBBQlWDUS3gHJO
         U8DpzI2Kw2VBbTq7u/wn7qxOjId6YXIAYF93Gj7x1gl2rMe1eIYlR/1wSMgsUsenk6xE
         bhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eDXyALqRpYISww1jNLImcxxytsuzRTcQknk8mT+rvJw=;
        b=YnvnWij3QOpJqA4gRJf+5EmH5PTGNFDSSk1IrZwB3rnVUcyrKnqIi2hZfPcxiF59p+
         2zCTyxYs+oymHRiLIWkw6Mg9Eq+ixXhAm7e3WX7EY5aeAgIGYLaOZ2ZeACPEB7+NOToY
         yV2YRVrZwBwlEFRgD0ugyf9BodbFwrCooYi6KnTiHpPTy41NxqcdzolmC66fzULGLvZw
         h7hSWUeydGoi1W9oEYQkCYpok+lEfBSNFxnA0lU+dQMQiSbb56mvWNnsdFM4Wyh3fc/Z
         SzEXAFT5ZP21j9bA1Mi6jtnYm9xefoui35i9mlyb2mKHx16z/fiTZrD2Osm97vZdGyOX
         A1bg==
X-Gm-Message-State: AO0yUKU8s/2YIREQT0yoQmw4F29tZw1wsolnbSzlXzj9tF6dkfWXmeqB
        I3sn0nSZ0UHcRt7fFXCMU9rgLg==
X-Google-Smtp-Source: AK7set83o99Qlrps59qgcdOUiScjYgixR3ZTjvOcMGxZc6l7v+tZQyhBYeSHic6cqt1PKpaDDNUxug==
X-Received: by 2002:aa7:c146:0:b0:4ae:e547:e563 with SMTP id r6-20020aa7c146000000b004aee547e563mr3046245edp.36.1676715761767;
        Sat, 18 Feb 2023 02:22:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v14-20020a50c40e000000b004acaa4d51bdsm3439252edf.32.2023.02.18.02.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 02:22:41 -0800 (PST)
Message-ID: <90a16467-316a-e855-87ba-8d2d7d28fe4e@linaro.org>
Date:   Sat, 18 Feb 2023 11:22:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2 3/5] dt-bindings: mailbox: qcom: add compatible for
 IPQ9574 SoC
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        catalin.marinas@arm.com, will@kernel.org,
        dmitry.baryshkov@linaro.org, arnd@arndb.de,
        geert+renesas@glider.be, nfraprado@collabora.com,
        broonie@kernel.org, rafal@milecki.pl,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com
References: <20230217134107.13946-1-quic_devipriy@quicinc.com>
 <20230217134107.13946-4-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230217134107.13946-4-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/02/2023 14:41, Devi Priya wrote:
> Add the mailbox compatible for IPQ9574 SoC
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>  Changes in V2:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

