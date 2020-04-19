Return-Path: <SRS0=qh3w=6D=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4442C54F70
	for <linux-clk@archiver.kernel.org>; Sun, 19 Apr 2020 18:16:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C351021973
	for <linux-clk@archiver.kernel.org>; Sun, 19 Apr 2020 18:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587320182;
	bh=qfwOwd3ytRf49SJ0a3g7zW4EAU2/3jHKngVx6gc9ckk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=C0QLh0ZyQMRG4jgS7M24EG0KqCg2XMe5k7c4CVurbWkmFC+SMScbHz7JJh7bugnlQ
	 Rjo4WXgB8vrA9HArIW8Yi14TiBHUUSXtgIh/af3/DobFTZeE/BupAK1qLVm4gYmj52
	 nKqRJ2lCEJd6u9P5EQTd9S/UEtMrttEfvKqBMn+E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgDSSQW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Apr 2020 14:16:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:38048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbgDSSQW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 19 Apr 2020 14:16:22 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB7BE20771;
        Sun, 19 Apr 2020 18:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587320182;
        bh=qfwOwd3ytRf49SJ0a3g7zW4EAU2/3jHKngVx6gc9ckk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bYXQZD1yHuPm6+vO9iIuYbPSv2YuozAg3G0BQH7YiV9QvhlOZvsz9XWG92/yifX1J
         uNrB9CMe+nJSwikIl25EPoEf7nNafV2/23FX3QzFsfszUrGY7NgCpJtyPfpi2cFifU
         hWUU+fSYevUwUkKJHhNd/dTnDbwPouO9VFnnQyXE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200417141116.23019-1-geert+renesas@glider.be>
References: <20200417141116.23019-1-geert+renesas@glider.be>
Subject: Re: [PATCH] MAINTAINERS: Add DT Bindings for Renesas Clock Generators
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Sun, 19 Apr 2020 11:16:21 -0700
Message-ID: <158732018113.132238.4025085178435481319@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2020-04-17 07:11:16)
> The "RENESAS CLOCK DRIVERS" section lacks the related DT bindings.
> Add them.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
