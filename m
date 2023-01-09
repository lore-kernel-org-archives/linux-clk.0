Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 472BCC54EBE
	for <linux-clk@archiver.kernel.org>; Mon,  9 Jan 2023 14:19:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjAIOTS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Jan 2023 09:19:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjAIOSx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Jan 2023 09:18:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 656B5167DB
        for <linux-clk@vger.kernel.org>; Mon,  9 Jan 2023 06:18:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5795FB80DE2
        for <linux-clk@vger.kernel.org>; Mon,  9 Jan 2023 14:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4A7C433F2;
        Mon,  9 Jan 2023 14:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673273929;
        bh=rP/q5PI5+9VsM9NHQlOzk3wACSP9ZKD3iTSstyibXd0=;
        h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
        b=LbQ7658BGjPNB0wRKJ0dYwgIRkGIrD44IKBwYixeJKy1Law45RRVNlpVqD3RboNL0
         UZhE0yRGkPp5uaD6XOLlL0XRCTsXq/B2nNnarDKW4EGjgneuFjgqfe7eJDPTo+HOf7
         ELh9P+Yj1fyJs+iiQ30VUxhQ2Gu7BTcgKju2pOG1Dyex3umLI+DsrAfiemZjdwrpEP
         xvOLWcRddjw8c3K9LO2P2kGdIII19R8Qzpl2GbjrFowbu5w16luNZ5pgRR0gJxMZFL
         geqJx2S0dwCwWnz55MwyzTSDMd9ZNbEjH/SwPpMQ27OB+JEErG+rCBjsf7qUfKGZUf
         Xz4C0caOloDqw==
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailauth.nyi.internal (Postfix) with ESMTP id 36D0C27C005A;
        Mon,  9 Jan 2023 09:18:47 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 09 Jan 2023 09:18:47 -0500
X-ME-Sender: <xms:RiK8Y3KRXR6pGL4NFNLbVNKD26lg3HuM-N3Xj2wWYDMO4p9n2tQHmw>
    <xme:RiK8Y7J1kTez6KObYAd9FAxMwLJNj7GETNchqMUzKf8Ifs26KTd5nGAZ4s2T_IeJ5
    BTeHTRsFkr8lGfGjVo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeigdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpedvveeigfetudegveeiledvgfevuedvgfetgeefieeijeejffeggeehudeg
    tdevheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddv
    gedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdrug
    gv
X-ME-Proxy: <xmx:RiK8Y_tgJSyb9h-h3udmeagNikidGuf3UFYhmAWZ3tDoClRW_OxVSA>
    <xmx:RiK8YwY5U7dsDzslamLKMsMuEK7x92QW6hos8Bpev2ia-gYyTL2Xzg>
    <xmx:RiK8Y-ZvdtWHV1KwfF22rlX3bV-Tw-Gq8cpiPkYsC3P-6LH4Vba0VA>
    <xmx:RyK8Y6SrdZVfrMS3EPzbHsr5CSGVmEfVzPv-iQBW6FIyf3KAHvvMaw>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 7A37BB60086; Mon,  9 Jan 2023 09:18:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <59f8702d-bfa7-45ba-a415-ff29a1203365@app.fastmail.com>
In-Reply-To: <2d085660-41a2-492c-a343-7df80d510a59@app.fastmail.com>
References: <20230105134622.254560-1-arnd@kernel.org>
 <20230105134622.254560-5-arnd@kernel.org> <m2sfglh02h.fsf@free.fr>
 <2d085660-41a2-492c-a343-7df80d510a59@app.fastmail.com>
Date:   Mon, 09 Jan 2023 15:18:27 +0100
From:   "Arnd Bergmann" <arnd@kernel.org>
To:     "Arnd Bergmann" <arnd@arndb.de>,
        "Robert Jarzmik" <robert.jarzmik@free.fr>
Cc:     "Daniel Mack" <daniel@zonque.org>,
        "Haojian Zhuang" <haojian.zhuang@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        "Michael Turquette" <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Ulf Hansson" <ulf.hansson@linaro.org>,
        "Dominik Brodowski" <linux@dominikbrodowski.net>,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH 04/27] ARM: pxa: drop pxa310/pxa320/pxa93x support
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Jan 8, 2023, at 14:40, Arnd Bergmann wrote:
> On Sun, Jan 8, 2023, at 09:49, Robert Jarzmik wrote:
>> Arnd Bergmann <arnd@kernel.org> writes:

> If that's all you think is missing, I can add this
> trivial patch as well and rework the series to not
> drop code that depends on PXA310/PXA320:
>
> --- a/arch/arm/mach-pxa/Kconfig
> +++ b/arch/arm/mach-pxa/Kconfig
> @@ -45,6 +45,8 @@ config MACH_PXA27X_DT
>  config MACH_PXA3XX_DT
>         bool "Support PXA3xx platforms from device tree"
>         select CPU_PXA300
> +       select CPU_PXA310
> +       select CPU_PXA320
>         select PINCTRL
>         select POWER_SUPPLY
>         select PXA3xx

I've put this in a separate branch now and will submit
it as a bugfix along with two other patches for issues
I found while testing omap1.

I've dropped the pxa310/320 removal now, but kept
the pxa93x removal, since that has no DT support at
all and remains dead code.

     Arnd
