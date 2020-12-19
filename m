Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63094C352A2
	for <linux-clk@archiver.kernel.org>; Sat, 19 Dec 2020 23:33:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39B6E23A7B
	for <linux-clk@archiver.kernel.org>; Sat, 19 Dec 2020 23:33:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbgLSXdS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Dec 2020 18:33:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:33176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726673AbgLSXdR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 19 Dec 2020 18:33:17 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608420757;
        bh=79N78roUP3DtOS2r83vFZZiq4TT7n3sIdsy/QwqoSmc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ivio1Z0x1vKXhX8S/Zco8XjYf25zQ5OUf1kZTMwTBUHKC94BQubYO/TMzS0dx04P3
         KxosnnuqlqTDosG7zyoE4HmdX4jyE6c1/d+GRXp23+R2DFs/YgpHrnTU3oPGXP77Zu
         aLWgnBeZnVZHMonmfb8M11z4QMOlvC2tgBlklzOjAXe3kpzxWIK4BpMtXqH4CWFvk7
         ZbMrU1OZZUta4MmZz9pZn+MNZF4LxJ0sqCoQe5BElNFHV6VEGFqENizXISLeIL7qPs
         nReybSdvkWaocBUbU2bcYDFf68rgP+kclusR6dJy5zDy6NkdakAyjRv18GAYk5lksB
         KY7fZleEIEfzA==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201202125816.168618-1-alexandre.belloni@bootlin.com>
References: <20201202125816.168618-1-alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] clk: at91: sam9x60: remove atmel,osc-bypass support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Date:   Sat, 19 Dec 2020 15:32:36 -0800
Message-ID: <160842075616.1580929.2903889967979036608@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alexandre Belloni (2020-12-02 04:58:15)
> The sam9x60 doesn't have the MOSCXTBY bit to enable the crystal oscillator
> bypass.
>=20
> Fixes: 01e2113de9a5 ("clk: at91: add sam9x60 pmc driver")
> Reported-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---

Applied to clk-next
