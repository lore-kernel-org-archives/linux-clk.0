Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A07C49EAF
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 02:49:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0C3361607
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 02:49:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbhF1CwR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 22:52:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:57656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232041AbhF1CwR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 22:52:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90C5161A0F;
        Mon, 28 Jun 2021 02:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624848592;
        bh=QKrQWOJp+97CSAnVtVVhtJpWeaE7HgPzRjSo8gt6Xs4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=n7BpDG7nlfkl6sVc5VtauR7ij6oMO9Vb+I7tEOXCIdA0q1I+hSIffduxEz1hRSGs+
         fvHPaOOr2RdhG/AqEjlTI0RnGlT8PfKHy5p/78pAyTEUh+t+Tv0Pa4oKJuIjUBGL0B
         iIQywyoc1GXxhsug+Uc/pyL+gmNw81jkDEkMW/E1Whk//ZRrX34mHLuaCYMBYXkNYS
         T/ZS7KWUG/WR5iEMapp3xyebSRsN43zHZ37nmLT7Ljf3TTiox+eM6bNiAapzS2RfeB
         fYG5r75sCOPTej327BJ11ptllb9uQGq9u1aPlMf2vnJV+q2lTMyyvIGHQkVchzdPBY
         CFj/IcUNS9Pbw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210530164923.18134-5-paul@crapouillou.net>
References: <20210530164923.18134-1-paul@crapouillou.net> <20210530164923.18134-5-paul@crapouillou.net>
Subject: Re: [PATCH v2 4/6] clk: ingenic: Remove pll_info.no_bypass_bit
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        list@opendingux.net,
        =?utf-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>
Date:   Sun, 27 Jun 2021 19:49:51 -0700
Message-ID: <162484859150.2516444.13611912809661364397@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Paul Cercueil (2021-05-30 09:49:21)
> We can express that a PLL has no bypass bit by simply setting the
> .bypass_bit field to a negative value.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next
