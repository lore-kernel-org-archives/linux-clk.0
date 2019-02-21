Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7670C4360F
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 18:47:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9014F20855
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 18:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550774876;
	bh=AcaDa74sLaNQzmj3S2ctQBHylsgm8VAVgDr4WqrS+go=;
	h=Subject:References:From:In-Reply-To:To:Cc:Date:List-ID:From;
	b=v+ADxKUw+Gc8bNIxu3MK/ABaXpRvw++GThTE7sy5g26TZBORbcLCwAX0yAuZRDee+
	 ZvyZz8WETU6qgfAr4YVXF+odXf2JwgtfF4DDpf2Xswi/TCsb96Rgx4hrKhioQe4NyQ
	 oSivdZSVuTLXrM61h0RtUpC0BhVHogSqOJqC6PrY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfBUSr4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 13:47:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:48206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbfBUSrz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Feb 2019 13:47:55 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 439962084D;
        Thu, 21 Feb 2019 18:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550774875;
        bh=AcaDa74sLaNQzmj3S2ctQBHylsgm8VAVgDr4WqrS+go=;
        h=Subject:References:From:In-Reply-To:To:Cc:Date:From;
        b=ZDeSdKuNVtSaCBA7Igdki+nZPrp3344VYTt8/Mw55niqOSaftNt5wCq6ObLNw3uzM
         RJNX1bnWciWkME2gHQAIKbqb0qH4+eCkgV0C3ZVmRxzaxMPktdAu0EK8vE4lqXQDpq
         IILiF8LwgGhHiSx9nhShbK3CcZq4MqWzBPTG6i/M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [git pull] clk: renesas: Updates for v5.1 (take two)
Message-ID: <155077487453.77512.5035334691458450250@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
References: <20190212102050.32229-1-geert+renesas@glider.be> <CAMuHMdUwNwVQ-4o8WKdH4pEUtk=Jmyq7gy7frXGW82rgu+afVA@mail.gmail.com> <CAMuHMdWy4MQ0FLU-8Yx1oc0Yj2iyn5mydrYwkAyVzn_4JxCpzA@mail.gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <CAMuHMdWy4MQ0FLU-8Yx1oc0Yj2iyn5mydrYwkAyVzn_4JxCpzA@mail.gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Date:   Thu, 21 Feb 2019 10:47:54 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2019-02-21 04:36:46)
> Hi Mike, Stephen,
>=20
> On Thu, Feb 21, 2019 at 10:18 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Tue, Feb 12, 2019 at 11:48 AM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > The following changes since commit d9286d9743b6e8cfbf1a13f8db84e9c65c=
0b09c7:
> > >
> > >   clk: renesas: r8a774c0: Correct parent clock of DU (2019-01-24 16:0=
1:08 +0100)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers=
.git tags/clk-renesas-for-v5.1-tag2
> > >
> > > for you to fetch changes up to d1de227de8145e661e940377e050286098197e=
eb:
> > >
> > >   clk: renesas: r8a774c0: Add TMU clock (2019-02-05 10:40:05 +0100)
>=20
> > I was wondering if you've received my pull request?
>=20
> Please ignore, I've just saw it appear in today's clk/clk-next.
> Thanks!
>=20

Sorry, I forgot to send the email where I stated it was pulled into
clk-next.
