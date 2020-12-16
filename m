Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5563AC4361B
	for <linux-clk@archiver.kernel.org>; Wed, 16 Dec 2020 20:22:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 276832368A
	for <linux-clk@archiver.kernel.org>; Wed, 16 Dec 2020 20:22:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728982AbgLPUWM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Dec 2020 15:22:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:38000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728673AbgLPUWM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 16 Dec 2020 15:22:12 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608150091;
        bh=lls6UfjvqS9lO825QuepZmHisTnOFKzad07I7ebvkS0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DxCbBPKHId3tpuuVHrDuRU9tvpuDMAyFL3sq5Ygl7Nw1XedyXujZfXkZO8icu4wvm
         pn0L6uAeJKaBQ3XPK7pE3SE59NwD//nRA50JkAXNi2gkz+aNBC37fUUVIIlznSgC+h
         ocs6HUc36btOojQwu5aXul/KFovjDgWmGiznF9gKfWxYpqFbdR6UYVJmKE2ip8tRnb
         mnSgxVvMf0KjGQ5ohTtm5CxAl8LDHVccr8O9qHHSCt69JY80D18QxsdTdR6bKoimXn
         DZX0aCjH2GaQC57kQlkcusGqaJWoODVqabjsmnldnCtu2SBwGlYtBAtc9eDbw5B4Hh
         kZZ0iJUjjFy7A==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201209094916.17383-5-zong.li@sifive.com>
References: <20201209094916.17383-1-zong.li@sifive.com> <20201209094916.17383-5-zong.li@sifive.com>
Subject: Re: [PATCH v7 4/5] clk: sifive: Fix the wrong bit field shift
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Zong Li <zong.li@sifive.com>,
        Pragnesh Patel <pragnesh.patel@sifive.com>
To:     Zong Li <zong.li@sifive.com>, aou@eecs.berkeley.edu,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, mturquette@baylibre.com,
        palmer@dabbelt.com, paul.walmsley@sifive.com,
        pragnesh.patel@openfive.com, schwab@linux-m68k.org,
        yash.shah@sifive.com
Date:   Wed, 16 Dec 2020 12:21:30 -0800
Message-ID: <160815009047.1580929.7758511273578717067@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Zong Li (2020-12-09 01:49:15)
> The clk enable bit should be 31 instead of 24.
>=20
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reported-by: Pragnesh Patel <pragnesh.patel@sifive.com>
> ---

Applied to clk-next
