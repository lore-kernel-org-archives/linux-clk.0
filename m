Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BCFC7EE21
	for <linux-clk@archiver.kernel.org>; Thu,  4 May 2023 09:31:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbjEDJbG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 May 2023 05:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbjEDJbE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 May 2023 05:31:04 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E9449C0
        for <linux-clk@vger.kernel.org>; Thu,  4 May 2023 02:31:00 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so15284239a12.0
        for <linux-clk@vger.kernel.org>; Thu, 04 May 2023 02:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683192658; x=1685784658;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AaczximwLqjWvhf3kocqHyl+J5SvoMmPF03yVDwkRs4=;
        b=aNPccQY+gX06bolqcHhXi2YhG6kR04MHmDjVRfdOemxBzkYktH3gKS6dDofm6KP+Up
         Jhtmd94g6jXYRGWtkr+21KPl0Q4MtgiOtLaXDuDaKUEPNT3oW1LDbhh0yNvX7PS47i7R
         3jIaJrpfhYfTBhZV9jA7qOWXofW9NeDkQa0yaM12YWLc+jp/iOLi3HgsDhrO44Z6u3c3
         VJU5Ex3jk6CK+xA8sXQ9WMYJILu2bmXEFUe5Zzi9rf9LJ9GJf+sLbSF5JqNe485AGKLv
         4s4b65yZrcUE22zy50aIzWxXICitIDSH3YeP2nKSVQ3hcauABzOSfBCV59Jr0pjnxMfr
         dDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683192658; x=1685784658;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AaczximwLqjWvhf3kocqHyl+J5SvoMmPF03yVDwkRs4=;
        b=OaDNjXggCGQzXxdBVLBcLn8eyrcIeFzW/uLGRRdgXr6rRnKbp2jhv/M1vLsyFRFQQK
         fNjdtZz9gZIVB+dK4JFoQngkdwAoqAdSwOBAzqI3wtzdIyryYXwXI1GhlX2sjF7n4xdI
         KuCVYRzK8qdroLzkyu0BHp3s/O9ck5Uf8aEAAN5GgsZ3bCd352iNQLvd/ogTcCpv3Sdn
         YSDf+EBAY/uaaGyJ8bWykAHPVeqBRtRU1RLE/3ynpcYCGspe/q3k/fw5a8PCCUArcjqM
         feu8lmEoyKZeV3ayQjfM5UU7T2wBivpnKfyHg3K+jg8xCb3pgdSia+bQmD9ZGT5CnA0D
         VSVg==
X-Gm-Message-State: AC+VfDywEncIPCenhUnXlxihNQUaYdAaSOao3vYaXuWkZgVIeLyTiQSj
        4D7y9DR0TbEZvhe2nZQB9V56zA==
X-Google-Smtp-Source: ACHHUZ4zWC5818MrlYN1OkCW/KpORJOzjBkAj9AnViKKKaMTTIpIp5OwrMHe9lbhkR79JVl27RQsFQ==
X-Received: by 2002:a17:907:3e84:b0:94f:1ce7:1865 with SMTP id hs4-20020a1709073e8400b0094f1ce71865mr5054078ejc.26.1683192658602;
        Thu, 04 May 2023 02:30:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id hz19-20020a1709072cf300b009629ffabe0asm3349435ejc.224.2023.05.04.02.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 02:30:58 -0700 (PDT)
Message-ID: <b09998bc-9ff7-3a18-89af-9778521ab127@linaro.org>
Date:   Thu, 4 May 2023 11:30:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] clk: imx: imx93: introduce clk_bypassed module parameter
Content-Language: en-US
To:     Peng Fan <peng.fan@nxp.com>, Greg KH <greg@kroah.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>
Cc:     "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230504085506.504474-1-peng.fan@oss.nxp.com>
 <2023050410-rejoin-vocation-8560@gregkh>
 <DU0PR04MB9417F9CBB5C9EE1FC85B10A2886D9@DU0PR04MB9417.eurprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DU0PR04MB9417F9CBB5C9EE1FC85B10A2886D9@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/05/2023 11:17, Peng Fan wrote:
> + DT maintainers.
> 
>> Subject: Re: [PATCH] clk: imx: imx93: introduce clk_bypassed module
>> parameter
>>
>> On Thu, May 04, 2023 at 04:55:06PM +0800, Peng Fan (OSS) wrote:
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>> With the clk names specified in clk_bypassed module parameter, give
>>> user an option to bypass the clk from managing them by Linux kernel.
>>
>> As I said on another email, no, please do not add new module parameters
>> for drivers, this is not the 1990s
> 
> ok, but this is for boot, so only DT could be considered.
> 
> But DT is to describe hardware, here I just wanna give user
> an option to bypass some clocks. Is it ok to add a DT property
> saying "fsl,imx93-bypass-clks = <IMX93_CLK_X>, <IMX93_CLK_Y>" ?
> 

I don't know what it is to "bypass some clocks". This does not look like
parameter for system at all.

Best regards,
Krzysztof

