Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C80C7EE29
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jun 2023 22:56:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236281AbjFBW41 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Jun 2023 18:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234452AbjFBW40 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Jun 2023 18:56:26 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E67D419B;
        Fri,  2 Jun 2023 15:56:25 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2005)
        id C141F68AA6; Sat,  3 Jun 2023 00:56:21 +0200 (CEST)
Date:   Sat, 3 Jun 2023 00:56:21 +0200
From:   Torsten Duwe <duwe@lst.de>
To:     Conor Dooley <conor@kernel.org>
Cc:     Xingyu Wu <xingyu.wu@starfivetech.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        yanhong.wang@starfivetech.com,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: Add StarFive JH7110 PLL
 clock generator
Message-ID: <20230602225621.GC27915@lst.de>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com> <20230512022036.97987-2-xingyu.wu@starfivetech.com> <20230519135733.GA10188@lst.de> <20230519-smokeless-guileless-2a71cae06509@wendy> <df43411e-8982-74f5-6148-e7281c37dada@starfivetech.com> <20230602183922.649b8e88@blackhole.lan> <20230602-drained-wheat-b6c5ea009f16@spud> <20230602165713.GA27915@lst.de> <20230602-wise-entomb-975a2474d97a@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602-wise-entomb-975a2474d97a@spud>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jun 02, 2023 at 05:59:29PM +0100, Conor Dooley wrote:
> On Fri, Jun 02, 2023 at 06:57:13PM +0200, Torsten Duwe wrote:
> > On Fri, Jun 02, 2023 at 05:43:25PM +0100, Conor Dooley wrote:
> > > > 
> > > > Can you _please_ point me at that "PLL driver" "in Linux" ?
> > > 
> > > It's patch 2 in this series:
> > > https://lore.kernel.org/linux-riscv/20230512022036.97987-1-xingyu.wu@starfivetech.com/T/#m4b2d74c36b3bb961a1187ec5cda1a0a0de875f0e
> > > 
> > Unfortunately, it's not, AFAICS. I'm looking for the driver that
> > will control the PLLs' parameters, grepping for "pll" should yield
> > results, to start with. The thing should act on the SYS_SYSCON iomem,
> > at 0x13030000. Ideally, a DT node should point it there...
> 
> The driver binds against a child node of the syscon @ 1303_0000:
> https://lore.kernel.org/linux-riscv/20230512022036.97987-1-xingyu.wu@starfivetech.com/T/#m882de9210850eb6f871cafc3418f3202ba915de8
> 
> Am I missing something?

No, you're right. Seems I took a wrong turn somewhere. I prefer
patchwork, where available, and probably got into the wrong series.
Found the correct one:

https://patchwork.kernel.org/project/linux-riscv/patch/20230512022036.97987-3-xingyu.wu@starfivetech.com/

Now only the device tree needs to match against that, and U-Boot
needs to remain still functional...

Thanks and sorry for the noise.

	Torsten


