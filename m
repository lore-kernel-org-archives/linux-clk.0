Return-Path: <SRS0=JZ/x=BW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCECBC433DF
	for <linux-clk@archiver.kernel.org>; Wed, 12 Aug 2020 07:53:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9184F20786
	for <linux-clk@archiver.kernel.org>; Wed, 12 Aug 2020 07:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597218811;
	bh=P6ejn0S1w+bT2hmJQj0bBbZBGv/i7M2RCBerqlQ0tto=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=Maf17pMwa5Yu7mSkusJKjDuglrCVf7kyPOks7FoadSLjaSw7orW0LkAAcakItVyLo
	 nIBKxVhByWlXjAM7Tn00ah++EARW1nyTy59J2r0XAr+TbiLGTnv++/1PMaIMWffx2X
	 zfKLmd4fodpZ4eIBOh92HH0YF/nmf6DWUAHF7Z3Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726517AbgHLHxb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Aug 2020 03:53:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:35774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726507AbgHLHxa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Aug 2020 03:53:30 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B45720771;
        Wed, 12 Aug 2020 07:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597218810;
        bh=P6ejn0S1w+bT2hmJQj0bBbZBGv/i7M2RCBerqlQ0tto=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=cYpOh+wGFM5q4h0EVw4BenMsqzWP58oOKUENaUKnf31yzm8gW69JYPjy59IdNYhf4
         e1I1V8vWSdNMtpxNY4gNzcTAuWAVIs5SuDEKWEJvaywvK0XGOaSOm39fZbxeFkAfWV
         BSP0At06Izb5dIxnKzChYlLDR4M3KPGOBGNKm5D8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200806182059.2431-5-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org> <20200806182059.2431-5-krzk@kernel.org>
Subject: Re: [PATCH v2 05/41] ARM: s3c24xx: make S3C24XX_MISCCR access indirect
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
To:     Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Date:   Wed, 12 Aug 2020 00:53:29 -0700
Message-ID: <159721880936.33733.15599563496602398778@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Krzysztof Kozlowski (2020-08-06 11:20:22)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The clk driver uses both a function call into an exported
> platform file and a direct register access to a hardcoded
> virtual address for accessing the MISCCR register, both
> become are a problem for a multiplatform kernel because
> of the header file dependency.
>=20
> Make this an indirect function call through platform data
> instead.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
