Return-Path: <SRS0=DelH=WE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7047AC0650F
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 04:08:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 32E3221873
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 04:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565237303;
	bh=SfXPd4T/iPy4yFm0+4ZpSrVXDIPE9kIwjlBq5hF2ehY=;
	h=In-Reply-To:References:From:Cc:To:Subject:Date:List-ID:From;
	b=1gxjZuSf7nWlEXk3FWXC7vbB3EIhrQvC7SN7E2+MbLL94hs3EEF5EYP7L7oF4z09q
	 Sco50R0yZAb4eZTWJgL90aIzwu6KmYSBdi0qtXojtXr95C/0GQqwuWZoR7FUo4zqbG
	 wKZFLdN4KxNye8OlPLUKefnOsm56EX1WDYgbsCaA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbfHHEIW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Aug 2019 00:08:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:39376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725270AbfHHEIW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Aug 2019 00:08:22 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 430582186A;
        Thu,  8 Aug 2019 04:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565237302;
        bh=SfXPd4T/iPy4yFm0+4ZpSrVXDIPE9kIwjlBq5hF2ehY=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=CfdXw7P8r0bazXOgVEoU4sj5id7e63Ixa7qQkRBbWZmUmyjLhQ4AIbq9puLL7q1wQ
         2Hca7iKaiSGh4SQBFdqoEyAO7bFlR0MXdDQ+Ll4rVR2SGGsIiZMTwvXv+kGZErZEMj
         pduBIcnT6XrIpAzYYiAeJNXS3kqucc6k3M5dAxi8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1565220490.15188.0@crapouillou.net>
References: <20190701113606.4130-1-paul@crapouillou.net> <20190807213358.A62002186A@mail.kernel.org> <1565220490.15188.0@crapouillou.net>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] clk: ingenic/jz4740: Fix "pll half" divider not read/written properly
User-Agent: alot/0.8.1
Date:   Wed, 07 Aug 2019 21:08:21 -0700
Message-Id: <20190808040822.430582186A@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Paul Cercueil (2019-08-07 16:28:10)
>=20
>=20
> Le mer. 7 ao=C3=BBt 2019 =C3=A0 23:33, Stephen Boyd <sboyd@kernel.org> a =
=C3=A9crit=20
> :
> > Quoting Paul Cercueil (2019-07-01 04:36:06)
> >>  The code was setting the bit 21 of the CPCCR register to use a=20
> >> divider
> >>  of 2 for the "pll half" clock, and clearing the bit to use a divider
> >>  of 1.
> >>=20
> >>  This is the opposite of how this register field works: a cleared bit
> >>  means that the /2 divider is used, and a set bit means that the=20
> >> divider
> >>  is 1.
> >>=20
> >>  Restore the correct behaviour using the newly introduced .div_table
> >>  field.
> >>=20
> >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> >>  ---
> >=20
> > Applied to clk-next. Does this need a fixes tag?
>=20
> It depends on commit a9fa2893fcc6 ("clk: ingenic: Add support for
> divider tables") which was sent without a fixes tag, so it'd be
> a bit difficult. Probably not worth the trouble.
>=20

Does it need to go in as a fix for this -rc series then? Or is it not
causing issues for you so it's ok to wait until next merge window?


