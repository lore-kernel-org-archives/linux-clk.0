Return-Path: <SRS0=klTJ=DV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7953C433DF
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 03:06:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 667F3221FF
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 03:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602644774;
	bh=GVNNlwaflLa44gRM2QBYbi9v0l8AH1tbD6k+0mQ3fgY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=OqYgXARc5ZFvBeRetUf/FPTyVJ17OwDoOxuCxdUn1xMR8wvQ6WAcWQE4XuArgZdLf
	 JVfSrNGRTNR2uA5oF+guO1p2WWV+sZL56zMVshwwdp3xBU/cfGTUUp0TU9OI7BAYvK
	 CrNBPx5pHKi+RU/yWSjRMNXw4sQpBbCZ5hvgUn34=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728435AbgJNDGO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Oct 2020 23:06:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:44020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726049AbgJNDGN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Oct 2020 23:06:13 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5799721D7F;
        Wed, 14 Oct 2020 03:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602644773;
        bh=GVNNlwaflLa44gRM2QBYbi9v0l8AH1tbD6k+0mQ3fgY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=K7n5JflM/Wx6isxkF7fSIGBpKjGY5t52nYMWKMyQKgUW6pDsn54P7QVStQ4QsuMEA
         qMF6D8EJBLFgvHlLag0HtuaOs+GkiEbrDYEUhyxX/xq3Vn9ZBW1iPcbl0oSNaEwf1N
         mU5+zG3EHQ7wIy+45b7q6L4o4ILsu7AvVbBe6qwQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200903015048.3091523-1-paul@crapouillou.net>
References: <20200903015048.3091523-1-paul@crapouillou.net>
Subject: Re: [PATCH 1/5] clk: ingenic: Use to_clk_info() macro for all clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     od@zcrc.me, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>
Date:   Tue, 13 Oct 2020 20:06:11 -0700
Message-ID: <160264477194.310579.2613880755543529677@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Paul Cercueil (2020-09-02 18:50:44)
> The to_clk_info() previously had a BUG_ON() to check that it was only
> called for PLL clocks. Yet, all the other clocks were doing the exact
> same thing the macro does, in-line.
>=20
> Move the to_clk_info() macro to the top of the file, remove the
> hardcoded BUG_ON(), and use it everywhere it makes sense.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next
