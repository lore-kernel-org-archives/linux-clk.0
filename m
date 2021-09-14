Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12909C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:03:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2083610A6
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:03:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232349AbhINWEV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 18:04:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:49890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231559AbhINWEU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 18:04:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B27936108F;
        Tue, 14 Sep 2021 22:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631656982;
        bh=oigmEST1EHQL5Om5LvHyBc0X19sT+8476VYDnxPswWs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hAYqoc22cxkB8K5SjRZZVsaMGXnNvakxTsd9vpallnn7G5aq49zEKLHBHRBgHCcCM
         V0mVpAbvUJpq3pfJhAfZ8KHF4G/Uft1WF/ifLvHnxlVn45OmpNurkU9h6tpKJfJA+8
         bZpaR2OxRGc2i+h4LEVW1tENDZ+5mmad5yBXyDS8ZzogmI2qn07/aWboOebCHs4MPd
         kEgwvxbEBUJRBT27vQ6okoGN81N73uEfH2yBSedAPghJnfed6PxJtOLESXecb1YSF0
         /6f2Vg+6y1x9upyclij0ym81crZShm6MauK0lcS0qNlcWbfIb2W8AyMUNHwa9zR5uQ
         myDBPCE8Ev2tA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210913082633.110168-1-clement.leger@bootlin.com>
References: <20210913082633.110168-1-clement.leger@bootlin.com>
Subject: Re: [PATCH] clk: at91: check pmc node status before registering syscore ops
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Clement Leger <clement.leger@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Date:   Tue, 14 Sep 2021 15:03:01 -0700
Message-ID: <163165698139.763609.11633047159530535523@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Clement Leger (2021-09-13 01:26:33)
> Currently, at91 pmc driver always register the syscore_ops whatever
> the status of the pmc node that has been found. When set as secure
> and disabled, the pmc should not be accessed or this will generate
> abort exceptions.
> To avoid this, add a check on node availability before registering
> the syscore operations.
>=20
> Signed-off-by: Clement Leger <clement.leger@bootlin.com>

Any Fixes tag?
