Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1ACCC4332F
	for <linux-clk@archiver.kernel.org>; Fri, 25 Nov 2022 15:23:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbiKYPXb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Nov 2022 10:23:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiKYPXa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Nov 2022 10:23:30 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2671D1E3E3
        for <linux-clk@vger.kernel.org>; Fri, 25 Nov 2022 07:23:29 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id c1so7376480lfi.7
        for <linux-clk@vger.kernel.org>; Fri, 25 Nov 2022 07:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wFHAlxkiZpUZ5hPbRPKH2HFMbjaXBev0Ro4GJeC1cAM=;
        b=aaRbvgGyLJ6+00U9JLZJxO2Rliyo1ziWXa3tKsB4Y9JQz+nXW8/QXELTyaeFBxcTHp
         bpvMZ3uRS1mOk1fP+bvnS5P5g7MrDf1DrRzzCdczIWGd9RzA55vxqlfN18W2SoNVbaW/
         evX5yZPJRjsa/zpSgiVpUtWijPqEIT+/6uZqr8/8CqtS8wftVwZ7r/daezLtxttK2OeK
         LpCt44AOTIHwo5S+V4+rCS4ccrRG9LRoRQuG7e4NmPPNcXpefZ7v7IqxVokhArz/nCnW
         FKbXe51biFe+mNmby3dPBn9VOZnD/ixuAjHi9s/tGHQzCWtHDnatZaFeH0Wll7QFa66p
         rM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wFHAlxkiZpUZ5hPbRPKH2HFMbjaXBev0Ro4GJeC1cAM=;
        b=ToEnXmv9o9cO1jH5ZqBxhVYKyn6Ql7AE/Yu4YrjFwFd2Q25ZoWyWIWtw8NO1j5xFBi
         wFiki/4LhnKDldbOFEbh9IjRRNWnW4FNBNi3DOpOmnVWwPvX0+ty9NnxcJdHI1o1Qgmc
         sIWfduCxWo1N7900M94ZVMNZThodaNgsOAdkbLFT+VvjCPz9HmwXC3Hpqi04RGD0y9kt
         odQQxOrhZGpEqCiWcAhg03xAuVjAWQTAMef62JubTf0yJeO3uUROkyH9ubUPkFATty6D
         D2UAZmXwfvca+E9RYUUojWoWYAaexfThpOMYw7xb76hZb0UyLcoHy1Z5e5Q53UNlg8zm
         mXUQ==
X-Gm-Message-State: ANoB5pk9etmdfKf1dyuF4ybvTg4ZvR2n8nLYsFoJTMXG7nHwJwxHfUqC
        fCjxbM3nOGCMdns7FzZE2yp78A==
X-Google-Smtp-Source: AA0mqf6pvs2Ot7tvrbn/hAGy2dWaL6aheYF7QSXxMPfRF3XoXTcWJmjuwbOL3xWmKDrCeuxZLZsEIw==
X-Received: by 2002:ac2:5281:0:b0:4b3:ff4b:80a2 with SMTP id q1-20020ac25281000000b004b3ff4b80a2mr6608868lfm.281.1669389807525;
        Fri, 25 Nov 2022 07:23:27 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id l11-20020a2ea80b000000b002771888fda1sm389514ljq.84.2022.11.25.07.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 07:23:27 -0800 (PST)
Message-ID: <65314720-30ea-fdc1-4002-cce12d9f3cb9@linaro.org>
Date:   Fri, 25 Nov 2022 16:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 1/3] dt-bindings: clocks: imx8mp: Add ID for usb
 suspend clock
Content-Language: en-US
To:     Jun Li <jun.li@nxp.com>, Abel Vesa <abel.vesa@linaro.org>
Cc:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <1664549663-20364-1-git-send-email-jun.li@nxp.com>
 <Y3ufuH1UAT+rsjl7@linaro.org>
 <PA4PR04MB964010FFDD808E0078913C1F890E9@PA4PR04MB9640.eurprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <PA4PR04MB964010FFDD808E0078913C1F890E9@PA4PR04MB9640.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/11/2022 11:55, Jun Li wrote:
> 
> 
>> -----Original Message-----
>> From: Abel Vesa <abel.vesa@linaro.org>
>> Sent: Monday, November 21, 2022 11:57 PM
>> To: Jun Li <jun.li@nxp.com>
>> Cc: sboyd@kernel.org; abelvesa@kernel.org; robh+dt@kernel.org;
>> krzysztof.kozlowski+dt@linaro.org; shawnguo@kernel.org;
>> s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
>> dl-linux-imx <linux-imx@nxp.com>; mturquette@baylibre.com;
>> l.stach@pengutronix.de; Peng Fan <peng.fan@nxp.com>;
>> alexander.stein@ew.tq-group.com; gregkh@linuxfoundation.org;
>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>> linux-clk@vger.kernel.org
>> Subject: Re: [PATCH v4 1/3] dt-bindings: clocks: imx8mp: Add ID for usb
>> suspend clock
>>
>> On 22-09-30 22:54:21, Li Jun wrote:
>>> usb suspend clock has a gate shared with usb_root_clk.
>>>
>>> Fixes: 9c140d9926761 ("clk: imx: Add support for i.MX8MP clock driver")
>>> Cc: stable@vger.kernel.org # v5.19+
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>> Signed-off-by: Li Jun <jun.li@nxp.com>
>>
>> Applied all. Thanks.
> 
> Hi Abel,
> 
> Could you please also take the dts patch[1] in this series?
> As the dts patch has a build dependency on the clk patches,
> So Shawn suggested you take the dts patch too [2].
> 
> [1] https://www.spinics.net/lists/linux-clk/msg75904.html
> [2] https://www.spinics.net/lists/arm-kernel/msg1013220.html

DTS cannot go via driver tree. Share the header from DTS tree to driver
to solve it... or add defines to your DTS.

Best regards,
Krzysztof

