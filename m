Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30985C4332F
	for <linux-clk@archiver.kernel.org>; Fri, 23 Dec 2022 07:49:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbiLWHtP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Dec 2022 02:49:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiLWHtM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Dec 2022 02:49:12 -0500
Received: from ex01.ufhost.com (unknown [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A810D33CCE;
        Thu, 22 Dec 2022 23:48:33 -0800 (PST)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id 4DAB624E20C;
        Fri, 23 Dec 2022 15:48:12 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 23 Dec
 2022 15:48:12 +0800
Received: from [192.168.125.65] (183.27.97.120) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 23 Dec
 2022 15:48:11 +0800
Message-ID: <fc0ec71a-89f9-f201-c4e6-b5594bfc0c35@starfivetech.com>
Date:   Fri, 23 Dec 2022 15:49:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 04/11] reset: starfive: Factor out common JH71X0 reset
 code
Content-Language: en-US
To:     Conor Dooley <conor@kernel.org>
CC:     <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        <linux-kernel@vger.kernel.org>
References: <20221220005054.34518-1-hal.feng@starfivetech.com>
 <20221220005054.34518-5-hal.feng@starfivetech.com> <Y6I3IPsmz1YTC3IV@spud>
From:   Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <Y6I3IPsmz1YTC3IV@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.97.120]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 20 Dec 2022 22:28:48 +0000, Conor Dooley wrote:
> On Tue, Dec 20, 2022 at 08:50:47AM +0800, Hal Feng wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> > 
> > The StarFive JH7100 SoC has additional reset controllers for audio and
> > video, but the registers follow the same structure. On the JH7110 the
> > reset registers don't get their own memory range, but instead follow the
> > clock control registers. The registers still follow the same structure
> > though, so let's factor out the common code to handle all these cases.
> 
> Is it a bit ornery to want to see this as a movement and an extraction
> in two different patches? Would prob be easier to follow that way.

Definitely, it will be more readable and easier to review. OK, I split it
in the next version.

Best regards,
Hal
