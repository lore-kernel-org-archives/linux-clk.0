Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B1FC77B75
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 12:32:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232141AbjEEMcI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 08:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232060AbjEEMcH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 08:32:07 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FAF111D90
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 05:32:06 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50bc4b88998so2952739a12.3
        for <linux-clk@vger.kernel.org>; Fri, 05 May 2023 05:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683289924; x=1685881924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9rulx3XpcK9ZcqvOFoebZzjIkj2vjyGTAItP7Et3Jpo=;
        b=f9/YRf0G4/yHQA9ZrPCOWjJqvRiajxaWoiwNciSx6p83h9gDVJZmc0Mg9paKCxoEat
         2GBzkeC62lEeOcBlDfYIlVdZp03mH5G/V/VOBO06tc7tYJRiD+lpVPZ743PcMmfnwe7L
         l8T9JB0O98fG0DIAvChWSRky5kU1FRWfVGHADRltw9EXCx3aKMAEB+a72uOIzgwHBpED
         uynhb9/EUUIo7Hamw33RUz3ewDkYzE2ViGkIaNAt44ab10ZwzlH/1zY4LTrDfFYw9w97
         FIYsgQyTVl+R4eryXvPsJi/iHOTZQyQ3euLmOAUsJ6G3Jilk6kz4sL+kR8AY5JLURmh5
         uhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683289924; x=1685881924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9rulx3XpcK9ZcqvOFoebZzjIkj2vjyGTAItP7Et3Jpo=;
        b=KplvbIIPlbsqFRasrHCxD3ApB4STSmZQfV0LCzSugql3q4F48flPXH0MKQ9d+xIEq+
         BOMB0NbH1/C5z+4RY4UWOqC68I6N2Q6Z+zQTv/Iu7GvPfz2IogAXGKdBnsFLMGMz7ZbG
         7SIM25Exj9z3peRHWmjx/U9G7RQBH6l8aZ/4mn69e/20NHM/Jig2NlTmI3yWPfqim1CT
         44izgKjRmhMQnwaiz7N3SMz7LVKLGG3tTAEVFhVMiWTnQuSLt5eGYsKe5FEbSGccbLa4
         q1/CcaD7KAmrgEU3E8MQA0xsUZJzSxX8hbnDTrD1BrhjfYGa4SPxOQKSI0uESyhv8Mp/
         dxjg==
X-Gm-Message-State: AC+VfDzpdrzJuxi86APyYNGhYpaYkLq1Ypp/Pp0ncW0+U4k2tWZddVvl
        vV6EHoJ3NVztgL06o13iGfMpWA==
X-Google-Smtp-Source: ACHHUZ6+yw8cSVm0sZNFJUhlsJz5DdajKxKExEbzpGhkKfl9sghrff69dynFdSFmqx6pBWAoOyA7WQ==
X-Received: by 2002:a05:6402:1255:b0:50c:646:cafd with SMTP id l21-20020a056402125500b0050c0646cafdmr1206373edw.7.1683289924710;
        Fri, 05 May 2023 05:32:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id w6-20020aa7d286000000b0050be0b14672sm2898604edq.3.2023.05.05.05.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 05:32:04 -0700 (PDT)
Message-ID: <b8a0a43f-a118-b3ac-01e9-703162e617f1@linaro.org>
Date:   Fri, 5 May 2023 14:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] dt-bindings: reset: mt8188: add thermal reset control
 bit
Content-Language: en-US
To:     Runyang Chen <runyang.chen@mediatek.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        Runyang Chen <runyang.chen@mediatek.corp-partner.google.com>
References: <20230505120108.26603-1-runyang.chen@mediatek.com>
 <20230505120108.26603-2-runyang.chen@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230505120108.26603-2-runyang.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/05/2023 14:01, Runyang Chen wrote:
> To support reset of infra_ao, add the index of infra_ao reset of thermal
> for MT8188.
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.corp-partner.google.com>

Your SoB does not march author.


Best regards,
Krzysztof

