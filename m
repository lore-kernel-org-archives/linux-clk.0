Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D6FC77B7C
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 07:25:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240075AbjELHZx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 May 2023 03:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239970AbjELHZw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 May 2023 03:25:52 -0400
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BFEE171C;
        Fri, 12 May 2023 00:25:51 -0700 (PDT)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id C42DA24E2CF;
        Fri, 12 May 2023 15:25:48 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 12 May
 2023 15:25:48 +0800
Received: from [192.168.125.131] (113.72.146.187) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 12 May
 2023 15:25:47 +0800
Message-ID: <ebc3a1e9-06cd-7316-8cf3-945bec910a7c@starfivetech.com>
Date:   Fri, 12 May 2023 15:24:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 5/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor.dooley@microchip.com>
CC:     <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        "Emil Renner Berthing" <kernel@esmil.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-6-xingyu.wu@starfivetech.com>
 <2fb8c88a-dab5-791b-eefe-c983decad5e8@linaro.org>
 <20230512-brewery-spouse-86350c9664d8@wendy>
 <b0133bcb-9c46-643a-5eda-dfdd816296fa@linaro.org>
From:   Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <b0133bcb-9c46-643a-5eda-dfdd816296fa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [113.72.146.187]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2023/5/12 14:50, Krzysztof Kozlowski wrote:
> On 12/05/2023 08:43, Conor Dooley wrote:
>> On Fri, May 12, 2023 at 08:35:43AM +0200, Krzysztof Kozlowski wrote:
>>> On 12/05/2023 04:20, Xingyu Wu wrote:
>>>> From: William Qiu <william.qiu@starfivetech.com>
>> 
>>>> +  "#power-domain-cells":
>>>> +    const: 1
>>>
>>> Add it to the existing examples.
>>>
>>> This part confuses me... why aon appeared here?  Why power-controller
>>> disappeared? I don't think that Rob or me proposed any of this.
>> 
>> Rob did actually suggest this, as the power-controller child node had no
>> properties other than #power-domain-cells.
> 
> He suggested it for aon, but not for stg or sys... aon is not a child of
> sys, is it? Then why power-controller disappeared from sys?
> 

The power-controller is only for aon, but now just use power-domain-cells instead.
The sys only have the clock-controller child node not power-controller.
And stg has neither.

Best regards,
Xingyu Wu

