Return-Path: <SRS0=klTJ=DV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C48C433DF
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 03:06:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E054021D81
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 03:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602644797;
	bh=lONtkNsAS1u7UyYdV2Zpir2RdhXnJFFWq7wq+Y9c6Wg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=rw214bgGf7JIxz/RdqF9f9e5OgAKExaGe8OyH3TsQBLOrXJpePuTuS0Z+ZqDeAyD0
	 ZfwCzNl13lDJb7hWAMtO3K2UZaTyXguca/dWWUi1raFd0IRVz8ndA4UhcFJly7YR2N
	 4VNtVJ6YUZpL47twch/xiBqNstucE8kpkdGYXDVk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728917AbgJNDGh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Oct 2020 23:06:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:44270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728951AbgJNDGh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Oct 2020 23:06:37 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EE29F221FF;
        Wed, 14 Oct 2020 03:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602644797;
        bh=lONtkNsAS1u7UyYdV2Zpir2RdhXnJFFWq7wq+Y9c6Wg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YUvkDGZ6xM192uwCFYKDjUssva0Y5z0iscxFS22SxGjCKTqNFfFdtxImlMVSAD6+B
         3LITJNgXwWVELHiPhorJdHtaArMuwGgv+GDmGnJPKTdFt6q3QVnU+erXZsfTAVvyKB
         0CqgibXi8gI8521WL+Qtg6ZlyfrPD++bR8ueviFA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200903015048.3091523-4-paul@crapouillou.net>
References: <20200903015048.3091523-1-paul@crapouillou.net> <20200903015048.3091523-4-paul@crapouillou.net>
Subject: Re: [PATCH 4/5] clk: ingenic: Don't tag custom clocks with CLK_SET_RATE_PARENT
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     od@zcrc.me, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>
Date:   Tue, 13 Oct 2020 20:06:35 -0700
Message-ID: <160264479583.310579.953634574877271513@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Paul Cercueil (2020-09-02 18:50:47)
> The custom clocks have custom functions to round, get or set their rate.
> Therefore, we can't assume that they need the CLK_SET_RATE_PARENT flag.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next
