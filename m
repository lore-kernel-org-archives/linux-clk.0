Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5357AEB64DC
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jul 2023 06:34:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbjGRGeP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jul 2023 02:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbjGRGeO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jul 2023 02:34:14 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA16100
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 23:34:13 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-991f956fb5aso658243266b.0
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 23:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689662051; x=1692254051;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EPkvjpW78jsIt8CqCb8WWAfnv5G9ccqWF9gc3RVA7fQ=;
        b=UOr7Uub3LaSWhK8uO1L4h1AZl6+leVhaICTT/mDuWVSi/wAXS0nK6H+X3BUcqprPTa
         doQ7OUpubu3ibJ26DJd7H6xJ9FjXqRbSi0ltTS9vuu/ZmkgFm+zB6fBOCe3QaG//fS53
         1M2furBAf4NDEJtMfARGNWBKcShvDQ0SqllnehdPTG6tvxN7nRYrZxoY+JzHpthd7tXd
         bVMAQbdlKUeXG09oGyPTkIEx+iXmIt5Xl9qfFoA9a6QCrn6hXJYpWpo7cmhDa16xaQD3
         DFIUJSyFMw6tWPQ//3LvNLjW/C58JgOx6pBytsJJyK+ipf4oNMu0BI47ZHrC6i73U2xX
         L28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689662051; x=1692254051;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPkvjpW78jsIt8CqCb8WWAfnv5G9ccqWF9gc3RVA7fQ=;
        b=fwk29ARci/Jj6sgdRYOJyth3QqQi6Hzy6JzOmNozVczRTSRvOThNA8IERAo3EDRD3U
         WJv4/l6MQUDrR2JSrRoKm+qDxop4ecXnPfRxZf8wjI0IpDR5ktiphRSJXZpF0IVfpcx+
         k/X6o9M8UqIWabB4+C9vsNyKQcWLDWEyClc7aHbAQeoieqFYoyt6qWaOCChhV2aoNvog
         ZhJeMF92Ge6N+Ap0TIsGc3yhwK7db9eNZPwSqZfYuHTUUR/dCxg7ui9uiN2orV0v5rrM
         cCcgGyE01CcVhryGWldV7GwiKgBVR5y7SkZPYIroiwNvOOtZ57xNyFDHQLFZDlZXbPxC
         Tjtw==
X-Gm-Message-State: ABy/qLbQMVPPyrhOUzFGQPMOHCU8PdsGOPkGtMTKA9K9TeAyVOG3dsJe
        fj3doDOZaN/+Lo6iBijIihPBRQ==
X-Google-Smtp-Source: APBJJlGAKB+Gn194UC+gwki4JCiy+b7H5WoMQ6NE7CnVecQZ4rEqmc0p7uKdgj/CJlxFUdJxmNahXg==
X-Received: by 2002:a17:907:7656:b0:993:c267:3612 with SMTP id kj22-20020a170907765600b00993c2673612mr11033201ejc.12.1689662051496;
        Mon, 17 Jul 2023 23:34:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id gs19-20020a170906f19300b00992f81122e1sm612364ejb.21.2023.07.17.23.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 23:34:10 -0700 (PDT)
Message-ID: <2c7b062f-fc9b-7697-1a74-070dead55fb6@linaro.org>
Date:   Tue, 18 Jul 2023 08:34:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] dt-bindings: clock: ast2600: Add I3C and MAC reset
 definitions
Content-Language: en-US
To:     Dylan Hung <kobedylan@gmail.com>, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     BMC-SW@aspeedtech.com, Dylan Hung <dylan_hung@aspeedtech.com>
References: <20230718062616.2822339-1-dylan_hung@aspeedtech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718062616.2822339-1-dylan_hung@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/07/2023 08:26, Dylan Hung wrote:
> Add reset definitions of AST2600 I3C and MAC controllers. In the case of
> the I3C reset, since there is no reset-line hardware available for
> `ASPEED_RESET_I3C_DMA`, a new macro `ASPEED_RESET_I3C` with the same ID
> is introduced to provide a more accurate representation of the hardware.
> The old macro `ASPEED_RESET_I3C_DMA` is kept to provide backward
> compatibility.
> 
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

