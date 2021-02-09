Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CCAC433E0
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 07:44:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83CEC64EBA
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 07:44:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbhBIHof (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Feb 2021 02:44:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:36904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229472AbhBIHoe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 9 Feb 2021 02:44:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85E6764E6C;
        Tue,  9 Feb 2021 07:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612856634;
        bh=YChRCS/TZXuQz7X4FCX98+Fr36g2PeaTNVtKCzTZlks=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ErYwgo3uAOdCu0pCsgYFrwzLdZ4v54BBo2qdy6YfbFJSsDhHwd+uNUw29Dk+FElCw
         6EvhglbCzPtR1bsWIEEt25pMo4CfdL1KEpazxCZpZE1hY5bkjhUqFq0P95Q4ldCt+K
         iBvfScqEOvNvnQWFFvnaiRWOKR1MQVyoZ1jGhTpDsJdHxc87v/r8FtIfHBDSkQkgUg
         CT2vEaDsKcL7jExPw3rNNi6OWge2ANPr1iALlM5kFntnoktqTmNVYQ27VWmz33dfRj
         JHVaYNzfo7SvpHW5UPzMCZQGH4PcZeTVSbXcgdXryOdyGdF/W/NJd3JXsjXx0rYWRs
         q0xbZXmTjvffw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210120131026.1721788-5-arnd@kernel.org>
References: <20210120131026.1721788-1-arnd@kernel.org> <20210120131026.1721788-5-arnd@kernel.org>
Subject: Re: [PATCH 4/4] clk: remove u300 driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 08 Feb 2021 23:43:53 -0800
Message-ID: <161285663342.418021.5458016027650681194@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Arnd Bergmann (2021-01-20 05:10:26)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The ST-Ericsson U300 platform is getting removed, so this driver is no
> longer needed.
>=20
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-next
