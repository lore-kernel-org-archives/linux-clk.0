Return-Path: <SRS0=eW+W=6T=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B765EC47254
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 19:10:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9535D20735
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 19:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588705816;
	bh=uxareK78vxmfIvFodQD+Oa38MY8vebhJp7PDQpQCksA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=InNF606mk9eS1FO67UmsG9B2CVUaNm5Iy1oNa6fDwX4xVG1X6L0dhUd0bmhptP/d0
	 DmpcYPhcJrrcq4SCLTsRtZZSXNpWrasBlTlGpaWo3nTWr6PmzojMVQxEhFCpaIzKqc
	 ntzHB9tgzVc8YRFIQHr+tVr6ndBWffCIaEWM9TAk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbgEETKQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 May 2020 15:10:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:56548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726350AbgEETKP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 May 2020 15:10:15 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4753A206FA;
        Tue,  5 May 2020 19:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588705815;
        bh=uxareK78vxmfIvFodQD+Oa38MY8vebhJp7PDQpQCksA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=vI2sh5moGQUgayJgcTMxt0nnAkHsZObGmaao7WvLmAq7zcyyu0bjPghtnjHZ8B8Kr
         Wj5+qXiTSgLzcKGa/wR21tVzKN3XUR3/M9Wn9a1bK86WEJXDIuIg0BwEsrS+0kZ5Lr
         W9yf7YsyUw73HiSD/iBqUjNuPYAfXn8rQmsfwtcI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1j368egyie.fsf@starbuckisacylon.baylibre.com>
References: <1jftcli2k6.fsf@starbuckisacylon.baylibre.com> <158861256065.11125.3262677295691476922@swboyd.mtv.corp.google.com> <1j368egyie.fsf@starbuckisacylon.baylibre.com>
Subject: Re: clk: clk_register is deprecated
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        ulf.hansson@linaro.org
Date:   Tue, 05 May 2020 12:10:14 -0700
Message-ID: <158870581453.26370.15255632521260524214@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2020-05-05 09:03:21)
>=20
> On Mon 04 May 2020 at 19:16, Stephen Boyd <sboyd@kernel.org> wrote:
>=20
> > Quoting Jerome Brunet (2020-04-30 05:24:41)
> >>=20
> >> If not, what would be the recommended way to get the "struct clk*" from
> >> a newly registered "struct clk_hw *" ? Should we add something new to
> >> clk-provider.h API ?
> >>=20
> >
> > Yes we should add a clk_hw_get_clk() API that takes a device pointer and
> > a string name, mirroring the clk_get() API but cutting out the part
> > where we have to go through the provider to find it.
>=20
> We will try to propose something for clk_hw_get_clk() soon.
> If we do so, could we "UN-deprecate" clk_register() and make it a
> wrapper around clk_hw_register() and clk_hw_get_clk() ?
>=20
> It would make it easier on drivers which both register and use clocks.
>=20
> To get a short term solution for Martin and his MMC driver:
> -  If the above wrapper is OK and we commit on doing it soon, would you
>    also be OK for martin to use clk_register() in his MMC driver (now) ?
>=20
> -  If not, could we use clk_hw->clk until  we have clk_hw_get_clk() in
>    CCF ?

Using clk_hw->clk until we have clk_hw_get_clk() is fine for now.
Various drivers do that already and I hope that a simple coccinelle
script can figure out how to convert that to the new function.l Is it
much work to introduce this API now? I thought it would be fairly simple
to do it but I haven't looked deeply.

>=20
> >
> > This is so that one day in "the future" we can remove hw->clk and make
> > that an internal detail that struct clk_hw can't see because we go
> > through the clk_hw::clk_core pointer instead.
>=20
> Yes, I know it is your secret plan ... ;)
>=20
>=20

Hehe
