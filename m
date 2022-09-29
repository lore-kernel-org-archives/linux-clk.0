Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6867C04A95
	for <linux-clk@archiver.kernel.org>; Thu, 29 Sep 2022 01:33:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbiI2Bdl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 21:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234346AbiI2Bdk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 21:33:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C26FB118DEC;
        Wed, 28 Sep 2022 18:33:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2A50D61824;
        Thu, 29 Sep 2022 01:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73153C433C1;
        Thu, 29 Sep 2022 01:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664415218;
        bh=N5BA8bHC8pdKQGoSWcCTt0SDD9FfHiL9T5gTYfb/eDo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=U8+08XYxmaOEmKIqqDNRmQVY0cRu+dq1VdoN0PgrwI/BolqI/hAqu52aEo2MSWy4O
         32xcd4VONEhtwxvLHeZf3UsaH9FBGPDzT164W5eWYmB55IA0m2+02wwtIr5sp+BiXC
         iMDs7CFPFaluFlse+nY3N1kzSVaMoGtNfMym0F0MjBQZih2uKzqLR6YBotdVnvfa4q
         fAJ29W8z9GmSnVxASfl0E2BxwWjPSlbiTHBfATDR+CHCSrCIlKQbe/SYFK6XOsLZmj
         7rUfpApY0JsSB+D1o7eKmuMmUzXqAyNRYcvptRJCggjKC7el36gqxc6Gwi3G6RYST6
         nLkZrk7ScxSAw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220905161504.1526-1-f.fainelli@gmail.com>
References: <20220905161504.1526-1-f.fainelli@gmail.com>
Subject: Re: [PATCH v2] clk: iproc: Do not rely on node name for correct PLL setup
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
        Michael Turquette <mturquette@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To:     Florian Fainelli <f.fainelli@gmail.com>, linux-clk@vger.kernel.org
Date:   Wed, 28 Sep 2022 18:33:36 -0700
User-Agent: alot/0.10
Message-Id: <20220929013338.73153C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Florian Fainelli (2022-09-05 09:15:03)
> After commit 31fd9b79dc58 ("ARM: dts: BCM5301X: update CRU block
> description") a warning from clk-iproc-pll.c was generated due to a
> duplicate PLL name as well as the console stopped working. Upon closer
> inspection it became clear that iproc_pll_clk_setup() used the Device
> Tree node unit name as an unique identifier as well as a parent name to
> parent all clocks under the PLL.
>=20
> BCM5301X was the first platform on which that got noticed because of the
> DT node unit name renaming but the same assumptions hold true for any
> user of the iproc_pll_clk_setup() function.
>=20
> The first 'clock-output-names' property is always guaranteed to be
> unique as well as providing the actual desired PLL clock name, so we
> utilize that to register the PLL and as a parent name of all children
> clock.
>=20
> Fixes: 5fe225c105fd ("clk: iproc: add initial common clock support")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> Acked-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---

Applied to clk-fixes
