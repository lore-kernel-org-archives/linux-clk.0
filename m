Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F449C001DF
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jul 2023 07:49:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbjGGHtA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jul 2023 03:49:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231213AbjGGHs5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Jul 2023 03:48:57 -0400
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BC481FDD;
        Fri,  7 Jul 2023 00:48:55 -0700 (PDT)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id 0A6C68116;
        Fri,  7 Jul 2023 15:48:54 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 7 Jul
 2023 15:48:54 +0800
Received: from [192.168.125.128] (113.72.145.114) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 7 Jul
 2023 15:48:52 +0800
Message-ID: <b649773b-ec51-20fa-a5a1-553e89b0d223@starfivetech.com>
Date:   Fri, 7 Jul 2023 15:45:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v6 3/7] dt-bindings: clock: jh7110-syscrg: Add PLL
 clock inputs
Content-Language: en-US
To:     Conor Dooley <conor@kernel.org>
CC:     <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
 <20230704064610.292603-4-xingyu.wu@starfivetech.com>
 <20230704-tingling-automaker-22460e884793@spud>
From:   Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <20230704-tingling-automaker-22460e884793@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [113.72.145.114]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2023/7/5 6:23, Conor Dooley wrote:
> On Tue, Jul 04, 2023 at 02:46:06PM +0800, Xingyu Wu wrote:
>> Add PLL clock inputs from PLL clock generator.
>> 
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> 
> As expected this produces warnings for the existing, in-tree,
> devicetrees which go away when the later dts patches are applied.
> It'd be good to mention that its intentional if you end up sending
> another version of the series.
> 
> Otherwise, this looks good to me too.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 

Thanks, I will add the mentions in next version.

Best regards,
Xingyu Wu
