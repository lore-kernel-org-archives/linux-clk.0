Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73238C49EA6
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 02:49:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EE7F61C2E
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 02:49:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbhF1CwJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 22:52:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:57558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231678AbhF1CwJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 22:52:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6895B61607;
        Mon, 28 Jun 2021 02:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624848584;
        bh=W7MTuFLCwM6YPrqenHfc6jWcUmLaJMk53wY67eaaBRM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NGm5gTiN1xP0uq84vlEZ3XvPdl1a4HoEoLDA278UGfP2I/Uerh67bl6fPR3QHMx6I
         dqp/509XPBXOE6ldh8IAGSqJA1JXuEHCv9NQoP2WAaxWGf6xF3aCzObwDdQ9ICtnq4
         xHmzmqNt4PWNizCXQTzh3l8mP9vvr6e7w4C55e0/NGnM9HG6hVerckvg4dZnfFDxfL
         HnJZ8BMxgLiA2zaOQFU6T35sCA2UsgOWYaobiLazxT6hByhEwuuZiyjweF0Uq/eMTy
         nh3UK4HeRV+HfJQdDe2QwLWPVocovVCs76moJpTlYbPWaC0d7Y/oazFEIRKXgQV4ri
         Bu2Jy4hmpnQLA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210530164923.18134-4-paul@crapouillou.net>
References: <20210530164923.18134-1-paul@crapouillou.net> <20210530164923.18134-4-paul@crapouillou.net>
Subject: Re: [PATCH v2 3/6] clk: ingenic: Read bypass register only when there is one
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        list@opendingux.net,
        =?utf-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>
Date:   Sun, 27 Jun 2021 19:49:43 -0700
Message-ID: <162484858328.2516444.4508277207707511552@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Paul Cercueil (2021-05-30 09:49:20)
> Rework the clock code so that the bypass register is only read when
> there is actually a bypass functionality.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next
