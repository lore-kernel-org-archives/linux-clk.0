Return-Path: <SRS0=WVnq=BD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5B1C433E0
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jul 2020 09:22:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A21620768
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jul 2020 09:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595582525;
	bh=9tPh3btI6by0aK62uud8rAfohfOuysh731MEj7sejn8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=dRljKshGEavYXa4SY1WWSO7S5NM1EhwKrOG1iz2fc8omJ/WSrPD+cJqzsLuKTyzK1
	 YmX73kO2SAxjYx2siPBFEvR8rWYGjwtoclcdmpNSWzA86kHv/hFlMoV3uKYXegojYJ
	 UVhuqEQBng+pDhGd3aI3wZuR4HHD4pKpr+qz5paw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbgGXJWF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jul 2020 05:22:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:52480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726591AbgGXJWF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 24 Jul 2020 05:22:05 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BD40120674;
        Fri, 24 Jul 2020 09:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595582524;
        bh=9tPh3btI6by0aK62uud8rAfohfOuysh731MEj7sejn8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=V2ucr7CjXS/0+jmLsCeI3+/71CkycB9WHqP4FNwz5jGQEJqU8Q/inyqzInFt1dd7O
         eQSreuY+JAPNJcCv8YBQl4voVVXQ6ri0fkGuf2g1C6vXFFZCl4jPqGGkcOvMkl4C3u
         KszLrbwAAyKeSnU/4KD+zFmbZ/jqm/4iLjhQiwHs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1595403506-8209-17-git-send-email-claudiu.beznea@microchip.com>
References: <1595403506-8209-1-git-send-email-claudiu.beznea@microchip.com> <1595403506-8209-17-git-send-email-claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 16/18] clk: at91: clk-sam9x60-pll: re-factor to support plls with multiple outputs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bbrezillon@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        mturquette@baylibre.com, nicolas.ferre@microchip.com
Date:   Fri, 24 Jul 2020 02:22:04 -0700
Message-ID: <159558252415.3847286.3699918620483470980@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2020-07-22 00:38:24)
> Some of the SAMA7G5 PLLs support multiple outputs (e.g. AUDIO PLL).
> For these, split the PLL clock in two: fractional clock and
> divider clock. In case PLLs supports multiple outputs (since these
> outputs are dividers (with different settings) sharing the same
> fractional part), it will register one fractional clock and multiple
> divider clocks (dividers sharing the fractional clock).
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---

Applied to clk-next
