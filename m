Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2D3C2B9F4
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jun 2021 14:48:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71AF56115A
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jun 2021 14:48:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbhFVOuf convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jun 2021 10:50:35 -0400
Received: from out28-2.mail.aliyun.com ([115.124.28.2]:44388 "EHLO
        out28-2.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbhFVOuf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Jun 2021 10:50:35 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.439722|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00839472-0.000267861-0.991337;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047213;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=8;RT=8;SR=0;TI=SMTPD_---.KWJick0_1624373295;
Received: from zhouyanjie-virtual-machine(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KWJick0_1624373295)
          by smtp.aliyun-inc.com(10.147.40.26);
          Tue, 22 Jun 2021 22:48:15 +0800
Date:   Tue, 22 Jun 2021 22:48:14 +0800
From:   =?UTF-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, list@opendingux.net
Subject: Re: [PATCH v2 0/6] clk: Ingenic JZ4760(B) support
Message-ID: <20210622224814.288587ac@zhouyanjie-virtual-machine>
In-Reply-To: <20210530164923.18134-1-paul@crapouillou.net>
References: <20210530164923.18134-1-paul@crapouillou.net>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

A gentle ping :)

Here are some new patches that need to be based on this series.

Thanks and best regards!

于 Sun, 30 May 2021 17:49:17 +0100
Paul Cercueil <paul@crapouillou.net> 写道:

> Hi,
> 
> Here is (finally) my v2 of the JZ4760(B) patchset.
> 
> Patches 1-5 are the exact same as in v1.
> 
> Patch 6's algorithm was updated with Zhou's feedback.
> 
> Cheers,
> -Paul
> 
> Paul Cercueil (6):
>   dt-bindings: clock: ingenic: Add ingenic,jz4760{,b}-cgu compatibles
>   clk: Support bypassing dividers
>   clk: ingenic: Read bypass register only when there is one
>   clk: ingenic: Remove pll_info.no_bypass_bit
>   clk: ingenic: Support overriding PLLs M/N/OD calc algorithm
>   clk: ingenic: Add support for the JZ4760
> 
>  .../bindings/clock/ingenic,cgu.yaml           |   4 +
>  drivers/clk/ingenic/Kconfig                   |  10 +
>  drivers/clk/ingenic/Makefile                  |   1 +
>  drivers/clk/ingenic/cgu.c                     |  92 ++--
>  drivers/clk/ingenic/cgu.h                     |  12 +-
>  drivers/clk/ingenic/jz4725b-cgu.c             |  12 +-
>  drivers/clk/ingenic/jz4740-cgu.c              |  12 +-
>  drivers/clk/ingenic/jz4760-cgu.c              | 428
> ++++++++++++++++++ drivers/clk/ingenic/jz4770-cgu.c              |
> 15 +- drivers/clk/ingenic/tcu.c                     |   2 +
>  include/dt-bindings/clock/jz4760-cgu.h        |  54 +++
>  11 files changed, 586 insertions(+), 56 deletions(-)
>  create mode 100644 drivers/clk/ingenic/jz4760-cgu.c
>  create mode 100644 include/dt-bindings/clock/jz4760-cgu.h
> 

