Return-Path: <SRS0=eW+W=6T=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABE4C47256
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 06:23:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 877A0206E6
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 06:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588659804;
	bh=tRg2txKP3RqlxCNyb24xuXkMASizYq+VAlsN6GlYJjA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=agEtNkaLMf1ycNsd4p+zfI7PMSDn/nYukGwhP3b3DdnbdDP1MjDkGBbVuxN0rwYDW
	 L6QhxZiiefBg9Rf9IbXzE14Ncs6vHumIctgZbIaAZ8cWkjEbsJOe0UgLYCMwMZmXf1
	 ihIVrfWYgX3e/MyMtxv2Zeya1Wteg7uI1dvedbfg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbgEEGXY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 May 2020 02:23:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:59308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725320AbgEEGXY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 May 2020 02:23:24 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CAF59205C9;
        Tue,  5 May 2020 06:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588659803;
        bh=tRg2txKP3RqlxCNyb24xuXkMASizYq+VAlsN6GlYJjA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QjXIEODme7fIvxBhrBHizSB+d3JY+okgYMrhfhVtdcxpC90hQz9TXJRYfLxcb1R1i
         W5B2uDmPL2yH40vTs9Nvatt3jo9Hb0S7Swdv2BYzjqWCM59++qyELLTW/TB5IOQ236
         OL7u0Q67yq7SoV4KQPGDJ8aNJ8CerWeQCcUM1kBw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CACRpkdaurouZLFD2aqjDnUgvp=iMOjZ0Lu=xboxqEUx4-dvWWg@mail.gmail.com>
References: <20200416081348.326833-1-linus.walleij@linaro.org> <158754977096.132238.12292029969034991900@swboyd.mtv.corp.google.com> <CACRpkdaurouZLFD2aqjDnUgvp=iMOjZ0Lu=xboxqEUx4-dvWWg@mail.gmail.com>
Subject: Re: [PATCH] clk: impd1: Look up clock-output-names
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 04 May 2020 23:23:23 -0700
Message-ID: <158865980315.24786.12205627766889336218@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2020-04-28 05:51:10)
> On Wed, Apr 22, 2020 at 12:02 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > Quoting Linus Walleij (2020-04-16 01:13:48)
> > > The IM-PD1 still need to pass the clock output names.
> > >
> > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Is this a
> >
> > Fixes: 84655b762a27 ("clk: versatile: Add device tree probing for IM-PD=
1 clocks")
> >
> > change?
>=20
> Yep. Can you fold it in when applying?
>=20

This is being deleted so does it matter anymore?
