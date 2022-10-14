Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F95C4321E
	for <linux-clk@archiver.kernel.org>; Fri, 14 Oct 2022 20:40:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbiJNUkM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Oct 2022 16:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231587AbiJNUjy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Oct 2022 16:39:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 933B492CD1;
        Fri, 14 Oct 2022 13:39:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5A9BFB82421;
        Fri, 14 Oct 2022 20:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D53FC433D7;
        Fri, 14 Oct 2022 20:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665779969;
        bh=Iarhpng2U1jATe+718gp6xUn6xpKl89ko9ZIcVNMhfE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gnLbBp9b7xaGTOS8YlhXpYaV6INFMyRMu7/B0FNOcehzxfsJyTbFqsBNa9p2l0OJL
         wOYBp1dzjgFMkioPRwWc5TAJMmIiS5DnaXfEZSQ2SoqXq/sNt7bQ7aGU5nt3SvpNvK
         HEg2TsilRm35OrciYUmUlcOka9LNXJYfK+YBgs+rYOKa1itSDEfxDjlYurPDX+SW8d
         H9ZrFJbtc1Yz2NJQ3X01GMCpL0jdaSIMDFLvl8/XHmNYyy02HsAugVxquzQiMOOZkT
         qJS9sDXjGSjdCGAeDd3IeBaiy+o8ERcqbpZH8urxGzuKgoOljWB1wLUZwDSvSwji8u
         sQbl3j+AjMRKw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221012030635.13140-1-wangkefeng.wang@huawei.com>
References: <20221012030635.13140-1-wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v2] clk: at91: fix the build with binutils 2.27
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Kefeng Wang <wangkefeng.wang@huawei.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-clk@vger.kernel.org
Date:   Fri, 14 Oct 2022 13:39:27 -0700
User-Agent: alot/0.10
Message-Id: <20221014203929.0D53FC433D7@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Kefeng Wang (2022-10-11 20:06:35)
> There is an issue when build with older versions of binutils 2.27.0,
>=20
> arch/arm/mach-at91/pm_suspend.S: Assembler messages:
> arch/arm/mach-at91/pm_suspend.S:1086: Error: garbage following instructio=
n -- `ldr tmp1,=3D0x00020010UL'
>=20
> Use UL() macro to fix the issue in assembly file.
>=20
> Fixes: 4fd36e458392 ("ARM: at91: pm: add plla disable/enable support for =
sam9x60")
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---

Applied to clk-next
