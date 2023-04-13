Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F10B5C77B6E
	for <linux-clk@archiver.kernel.org>; Thu, 13 Apr 2023 22:48:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjDMWst (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Apr 2023 18:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbjDMWsi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Apr 2023 18:48:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9A5469E;
        Thu, 13 Apr 2023 15:48:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BFFDE6420C;
        Thu, 13 Apr 2023 22:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055A4C433D2;
        Thu, 13 Apr 2023 22:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681426105;
        bh=2r4AGUeUoeN45ZcBLry7NPduP3jS6MEazXMcZDx4tSk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fe/70YgQzYpVg7kdBUWkl/HnpAoPIowg9lpjh74s/hQdBVwFbV0I3rF+fN4y4DSqm
         dabT3RGw7iBgtB/WE4qGpc+HigeDyVLJo6HqRwMPtNRcjTezZ5FHfd5XHMQfamtdhV
         9CsIbkabMl4mNgzvMOaaVzR0rcMeC1Cj56/BHX0DCNxm9mXmDx+uB1AXcYZyfT/c+W
         6jpMSLXbiavb68fmMIFBcSyfllCEG7p6CL8RUccbwyn8jGHoVmIFtTBiNWlEKeFgRC
         qYLS2tO743qgLz0u9/KEWh46c8aNhY7LJvzf3X12P2UEUv5OcXECiUNidi4tbeuoGg
         2T7YJSRlA6hcA==
Message-ID: <e4cedf7608d84adb209aa889f524fc09.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230413205528.4044216-1-sboyd@kernel.org>
References: <20230413205528.4044216-1-sboyd@kernel.org>
Subject: Re: [PATCH] clk: starfive: Avoid casting iomem pointers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev, Tommaso Merciai <tomm.merciai@gmail.com>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Hal Feng <hal.feng@starfivetech.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Xingyu Wu <xingyu.wu@starfivetech.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Date:   Thu, 13 Apr 2023 15:48:22 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Boyd (2023-04-13 13:55:28)
> Let's use a wrapper struct for the auxiliary_device made in
> jh7110_reset_controller_register() so that we can stop casting iomem
> pointers. The casts trip up tools like sparse, and make for some awkward
> casts that are largely unnecessary. While we're here, change the
> allocation from devm and actually free the auxiliary_device memory in
> the release function. This avoids any use after free problems where the
> parent device driver is unbound from the device but the
> auxiliuary_device is still in use accessing devm freed memory.
>=20
> Cc: Tommaso Merciai <tomm.merciai@gmail.com>
> Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Cc: Hal Feng <hal.feng@starfivetech.com>
> Cc: Conor Dooley <conor.dooley@microchip.com>
> Cc: Xingyu Wu <xingyu.wu@starfivetech.com>
> Fixes: edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock dri=
ver")
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-next
