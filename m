Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FF5C433B4
	for <linux-clk@archiver.kernel.org>; Tue, 13 Apr 2021 02:10:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 219F261370
	for <linux-clk@archiver.kernel.org>; Tue, 13 Apr 2021 02:10:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241603AbhDMCKw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Apr 2021 22:10:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:53004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237219AbhDMCKu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 12 Apr 2021 22:10:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 83D196135C;
        Tue, 13 Apr 2021 02:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618279830;
        bh=LT7+wid+Hg+3TnmzagCHKWDiMDJpLhPRz/HcxTEUzSE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jtDjSTQjqsaluOu6tjDDlwYlmIQaaypQ/SXzsYtCqrvK2BTnX5edaQYDvio9NiPsM
         gmFvX7mCq5y0vWnb3KVFMn9TCeMYTgbCzycbmD/n2MchKGy4JIvkBuxzpgi/dDf1Fm
         OOL1ux/Tepvp05G2yZZTlJ/24CtueOIj9hxGs97u0ue465oajfwsBvvrBi/Qjo52JA
         19QKPe8rDJ6L1UgeFyz5FviACvmiwBJZpqMK9F0QLA+Hs/oE8WGzPg13BCpUFA5SJ+
         AWPCyt9s9itRvH0wR0vFXW456M493X/t2cwxv/FPIjXGtuyeC48JMCEXsQYjwuqAi8
         umUsuTZGdq9zg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210409090104.629722-2-colin.king@canonical.com>
References: <20210409090104.629722-1-colin.king@canonical.com> <20210409090104.629722-2-colin.king@canonical.com>
Subject: Re: [PATCH][V2] clk: uniphier: Fix potential infinite loop
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Colin King <colin.king@canonical.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 12 Apr 2021 19:10:29 -0700
Message-ID: <161827982902.3764895.8459589544672421029@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Colin King (2021-04-09 02:01:04)
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The for-loop iterates with a u8 loop counter i and compares this
> with the loop upper limit of num_parents that is an int type.
> There is a potential infinite loop if num_parents is larger than
> the u8 loop counter. Fix this by making the loop counter the same
> type as num_parents.  Also make num_parents an unsigned int to
> match the return type of the call to clk_hw_get_num_parents.
>=20
> Addresses-Coverity: ("Infinite loop")
> Fixes: 734d82f4a678 ("clk: uniphier: add core support code for UniPhier c=
lock driver")
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied to clk-next
