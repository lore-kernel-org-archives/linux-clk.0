Return-Path: <SRS0=kMKU=RA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D410C4360F
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 17:13:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 71603213A2
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 17:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1551114838;
	bh=zYlPbrz0W90FZi7JFaZCX6Aa6tTVEua7P5L/ZCQSB74=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=DTc7PaXVCSEIZvoj72NLbZg4e8qxtwttTc7J0/cFgwZRAmFD242Y+n4yzAtMwkYhP
	 M6Qg+KDPz0oLebqr+H6LbDyXAUf1PoAt+95VdOSjwT0G6YzlxIkcMSgunrMWjBqsWS
	 SKY0cYRsgQ3mc7WbFbimXSmZyf5nD2IDuTMwyZ3c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728580AbfBYRN5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Feb 2019 12:13:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:34748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728400AbfBYRN5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 25 Feb 2019 12:13:57 -0500
Received: from localhost (unknown [104.132.1.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2351D20684;
        Mon, 25 Feb 2019 17:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1551114837;
        bh=zYlPbrz0W90FZi7JFaZCX6Aa6tTVEua7P5L/ZCQSB74=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=DuWVfDOrYJD/QNAmI2XNyj91erROcch+mPuf+jX9DJOrHnw6EE4zEP7CRrA2dC66z
         rRzu7lhuFPsaqGfIxxkmeVxhGsl728tGeZKdui6WzAUgZ5HslK3HrERr4YI52zp6IA
         0R7WKuEkoy1aM+4WI5IsDF9lw7NDP2oWkO8rgBj4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: renesas: r8a774a1: Fix LAST_DT_CORE_CLK
Message-ID: <155111483636.77512.6859625905860201581@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <1550836779-6868-1-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1550836779-6868-1-git-send-email-fabrizio.castro@bp.renesas.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Date:   Mon, 25 Feb 2019 09:13:56 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Fabrizio Castro (2019-02-22 03:59:39)
> Enum LAST_DT_CORE_CLK needs updating as R8A774A1_CLK_CANFD
> was recently added and it's the core clock with the highest
> index.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---

Applied to clk-next

