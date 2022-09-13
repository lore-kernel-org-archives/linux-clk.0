Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2815CC6FA82
	for <linux-clk@archiver.kernel.org>; Tue, 13 Sep 2022 10:48:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbiIMKs6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Sep 2022 06:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiIMKs4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Sep 2022 06:48:56 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 570165F10E
        for <linux-clk@vger.kernel.org>; Tue, 13 Sep 2022 03:48:55 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id k9so20177110wri.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Sep 2022 03:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=LJCRMGu9UXK8orOWVRKbRgxw0UO+idyGAeR7Y3jikKw=;
        b=NeSntqardnDjnKrtpeILxp80AOsTlNfRCL7Uql0MIaGOdigKkinqklNZYFwWgL4ysm
         biZEg5cH1vEU0QxxBehIi6/RHlSDx8RvGIbhTMzyDcWR6GfDj2S5o/QZlwtk5PRy8T45
         tRh3Y2YHdG3gyMWtBOe9eWGf/SbiRWqldUV+Ui6nmsfBsh4ZoHTAUhTbyL589l3w9eik
         Al/u6Jxfbye8Of/2qleHhW0HLsdUzBM9nGQYaInf3tnh+aFtlvEX8vcXBY5mRzN7CgbN
         XK1df2zoP8/nEsJMHkB140sKV1GqKWLLi9AtE5UocKtFGOGDCpkr095XySzdELavSQOF
         fbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=LJCRMGu9UXK8orOWVRKbRgxw0UO+idyGAeR7Y3jikKw=;
        b=t4jjWb8GbrNK9th9J6Qedhm37FxmM4WsIYkDby/62dyDkFNxOpPJp9TrxLrcOdcNGc
         NGNzWakez7IGqzh0taFiwmWz/KGY7yCq9Pt4+jZcKRixemNCcKFOzj/ryiAncf8sEUf0
         GbkOQJ4islpnAh7QL/MKXpX6K5OCHkVfTRzEZTYiAixnTtOvZVRUaKp25catGRX92dj3
         iof4Je3zv9BmdsilT4nhaRWV7QjCfpgc1rq6TYpxuAne/DBLTBGAnmOWf6YTpQ9mCKVe
         7D45G6uiX/is+ges44iozfvc1u41VikO3QVpgFgFIYKdpevK6VC3q3LM1lDuRTOuiYrg
         8Z3w==
X-Gm-Message-State: ACgBeo0fO0SgdV5t0KnE3BlED3WdebQZI0SyoTMAA5CT+xWdn6DqGfW+
        pLS25aA6aTNB29v8WDifGsiuog==
X-Google-Smtp-Source: AA6agR4xsP9/dAm7OWDgkbyYRgdEH17SK6tKuWJh2vOluW5ov3tY2rT7SDbc/ARQdL/OHtYIW4AnPg==
X-Received: by 2002:a05:6000:1b90:b0:22a:c3a9:6567 with SMTP id r16-20020a0560001b9000b0022ac3a96567mr191509wru.118.1663066133882;
        Tue, 13 Sep 2022 03:48:53 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.70])
        by smtp.gmail.com with ESMTPSA id p35-20020a05600c1da300b003a5fa79007fsm12042552wms.7.2022.09.13.03.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 03:48:53 -0700 (PDT)
Message-ID: <893c8446-5c4b-0e16-6979-632a20c8a201@linaro.org>
Date:   Tue, 13 Sep 2022 12:48:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 0/2] Propose critical clocks
Content-Language: en-US
To:     Marco Felsch <m.felsch@pengutronix.de>,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        abelvesa@kernel.org, abel.vesa@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com
Cc:     linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
References: <20220913102141.971148-1-m.felsch@pengutronix.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220913102141.971148-1-m.felsch@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/09/2022 12:21, Marco Felsch wrote:
> Hi,
> 
> this proposal is to mark clocks as critical. It is somehow inspired by
> the regulator-always-on property. Since sometimes we can end in circular
> dependcies if we wanna solve the dependcies for a specific clock
> provider.
> 
> The property is generic so it can be used by every hw clock provider. So
> it can be seen as generic implementation to [1].

Missing devicetree list (so no testing), missing bindings. Please follow
Linux process, run checkpatch and CC necessary people an dlists pointed
out by get_maintainers.pl.

Best regards,
Krzysztof
