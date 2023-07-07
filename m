Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5BAEB64DA
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jul 2023 07:44:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232513AbjGGHon (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jul 2023 03:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232495AbjGGHoi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Jul 2023 03:44:38 -0400
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C3641FCE;
        Fri,  7 Jul 2023 00:44:36 -0700 (PDT)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id A0940819B;
        Fri,  7 Jul 2023 15:44:28 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 7 Jul
 2023 15:44:28 +0800
Received: from [192.168.125.128] (113.72.145.114) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 7 Jul
 2023 15:44:27 +0800
Message-ID: <0b6bd526-1b66-1091-8e9a-cae71d998021@starfivetech.com>
Date:   Fri, 7 Jul 2023 15:41:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v6 0/7] Add PLL clocks driver and syscon for
 StarFive JH7110 SoC
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC:     <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Conor Dooley" <conor@kernel.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
 <913206a5-3ce2-3ce1-774e-3a4a9030b0e2@linaro.org>
From:   Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <913206a5-3ce2-3ce1-774e-3a4a9030b0e2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [113.72.145.114]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2023/7/5 14:27, Krzysztof Kozlowski wrote:
> On 04/07/2023 08:46, Xingyu Wu wrote:
>> [Resending because it has a error about examples in syscon bingdings
>> and has to be fixed.]
> 
> Resending means you sent the same version. If you did not change
> anything, then it will fail, right? If you changed something, it is new
> version.
> 

Okay, I will fix it in new version of these patches. I sorry to make these noise.

Best regards,
Xingyu Wu
