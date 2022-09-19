Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A33ECAAD3
	for <linux-clk@archiver.kernel.org>; Mon, 19 Sep 2022 10:04:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbiISKEz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Sep 2022 06:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbiISKEx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Sep 2022 06:04:53 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86EA72600
        for <linux-clk@vger.kernel.org>; Mon, 19 Sep 2022 03:04:51 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a8so45998828lff.13
        for <linux-clk@vger.kernel.org>; Mon, 19 Sep 2022 03:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=yNE2cp1RD1RoFuEYU5xwyQsBh6VbTtl5xLpOIA56rKU=;
        b=qL4HPMcfptSWQnmD3iCMUCdb7qVYUg0OJMQvjunISVwVid3qG9+fclUGpBJKtuRDfT
         7TO7gODJE3ezG0+ABlxs3nWZAfJDaFp/WEdcinjMOA4dK4mE19fWrAFTC8ZSYcFQSqC7
         z2882o9IRCJ3M62jsAlwbxfCAOdyrZ+Lcrxn7HoY1/ydvoo4jV3/1SF8PRQZdn8OwUZf
         PG529g6LcMpWf0NG7YSV9GUztHoVPTHwtxnsdNPD4bP3P2TkXg1fLycKtW2hu5O+AQ48
         KUK6rD9UMJgxPsmx8ZkVK6W2PE5rY+M1+ZS70rrtxv/VT4RS3RK6pQCIgb4vzq44kYsB
         9jCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yNE2cp1RD1RoFuEYU5xwyQsBh6VbTtl5xLpOIA56rKU=;
        b=JoscYxlmTXvYV79tUeyPh9G3wVZbr72Fu0J6uQPsErQT24Gs8X3SA6916Ar43yLgB7
         j5QUgAfaceqkTsTPwIoz7ETzdf4Bbo1J8p9fGaihyk/qQPoIZAqEVmK6x5yhZFGFpUet
         Zd8htO3ebeFntI9tnwji0T9M/8xLsn8HUTBdw/8AIHxjTCXwS1ArNoexWC0w4zWlLcnc
         t1sa4f3l8RnzscWpw7lrTxjN08HQ90hW+o3ZkMUISJgJ2y61RuKpHAISKQe2bGSHQrWK
         e0fH4ds+joQz044wnVVP8pprWavCAQEEdaF8mZqgCXzlcZabrcgHLV6JAQAfa/qakdcT
         w+lA==
X-Gm-Message-State: ACrzQf2RIAH76sVWoMZRndkfkqlqGU86aquEDX6XuPb8ytzrMlpxk27v
        6Mq09M8tzIHb1WO3zdjnObgMBw==
X-Google-Smtp-Source: AMsMyM64syZOKjIOi9iMOVhXz1gn4ACZcGEmVgxFTnQUH4zzM/GgVRcz3QHUBXYJ4FUtBMIK6Y9Wgg==
X-Received: by 2002:a05:6512:1320:b0:488:8fcc:e196 with SMTP id x32-20020a056512132000b004888fcce196mr5759696lfu.602.1663581889926;
        Mon, 19 Sep 2022 03:04:49 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q14-20020a056512210e00b00492cfecf1c0sm5136819lfr.245.2022.09.19.03.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 03:04:49 -0700 (PDT)
Message-ID: <54d22a77-5db7-e44b-176f-755e80e44c25@linaro.org>
Date:   Mon, 19 Sep 2022 12:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH V3] dt-bindings: clock: add i.MX8M Anatop
Content-Language: en-US
To:     Peng Fan <peng.fan@nxp.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     dl-linux-imx <linux-imx@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "abel.vesa@linaro.org" <abel.vesa@linaro.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>
References: <20220919055904.1659124-1-peng.fan@oss.nxp.com>
 <20220919065820.fk3ppcdoioubqfbg@krzk-bin>
 <DU0PR04MB9417BF9DF3BB65B859BBB676884D9@DU0PR04MB9417.eurprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DU0PR04MB9417BF9DF3BB65B859BBB676884D9@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/09/2022 11:28, Peng Fan wrote:
>>> V2:
>>>  Drop syscon, use clock-controller
>>>  Add fsl vendor prefix
>>>  Add interrupt property
>>>
>>>  dts update not included, so there will be dtbs_check fail.
>>>
>>>  .../bindings/clock/fsl,imx8m-anatop.yaml      | 51 +++++++++++++++++++
>>>  1 file changed, 51 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
>>>
>>
>> Running 'make dtbs_check' with the schema in this patch gives the following
>> warnings. Consider if they are expected or the schema is incorrect. These
>> may not be new warnings.
> 
> As I wrote in cover letter, dts patches are not included. Should I post V4
> to include dts fix? I planned to do that after this yaml got reviewed.
> 

Yes, better to include both DT schema and the DTS changes together.

Best regards,
Krzysztof
