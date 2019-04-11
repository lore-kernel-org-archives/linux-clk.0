Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3B9C10F13
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 19:29:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1FFCF206BA
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 19:29:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbfDKT3i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 15:29:38 -0400
Received: from gloria.sntech.de ([185.11.138.130]:32978 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726577AbfDKT3i (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Apr 2019 15:29:38 -0400
Received: from ip5f5a6320.dynamic.kabel-deutschland.de ([95.90.99.32] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1hEfOB-0001KB-Qv; Thu, 11 Apr 2019 21:29:35 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Caesar Wang <caesar.wang@rock-chips.com>,
        linux-rockchip@lists.infradead.org, mka@chromium.org,
        ryandcase@chromium.org, Elaine Zhang <zhangqing@rock-chips.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] ARM: dts: rockchip: fix PWM clock found on RK3288 Socs
Date:   Thu, 11 Apr 2019 21:29:35 +0200
Message-ID: <2052522.emLDVJXZZO@diego>
In-Reply-To: <20190409204707.150347-4-dianders@chromium.org>
References: <20190409204707.150347-1-dianders@chromium.org> <20190409204707.150347-4-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Dienstag, 9. April 2019, 22:47:07 CEST schrieb Douglas Anderson:
> From: Caesar Wang <caesar.wang@rock-chips.com>
> 
> We use the new PWM IP on RK3288, but the PWM's clock indeed incorrect.
> 
> Signed-off-by: Caesar Wang <caesar.wang@rock-chips.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

applied into a branch for 5._3_ ... as it requires a change coming
through a different tree, the patch gets a "quarantine"-release in
between.

Thanks
Heiko


