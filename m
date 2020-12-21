Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E092C433E0
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 01:48:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61FDC22D5A
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 01:48:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgLUBr7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 20 Dec 2020 20:47:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:44116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725497AbgLUBr7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 20 Dec 2020 20:47:59 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608515238;
        bh=cAPnsXBJUnGGzwY3CB4NbAYIw7ntX3aA/4lciHAco70=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eNxmGVmrCnazZEwWwNha+XOTmgHmG46/YENnYewukqN+i+OnHDXUH5ZGttP+TRQtK
         xvl8npBVyso5WjaIWUbGVZUtkm8rn/a8l6VYNkzs4Pr+yQ+B/9pkR59W4q374s1abt
         btgZQcyw+uYSqPPLNFIMrtAKR63PNFmRaYC5qEYHEtY072msUDPlOXP6Th62H3eZim
         XoyZXT1h82ongneFSb/pKfGDRYj04JKBa1yxJvyy9H2O8m6M4jfFrB4qi4DS8LlPjJ
         EhBKbj4iGrOhHCHeG77j1BbUWowE+4jB7bOJ5pVdFlT5sqMFhJ+k+Zjj/y0gryY9Zr
         uHYOjfqSoqz6g==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201220162135.yyijnczu6dxgnpda@pali>
References: <20201106100039.11385-1-pali@kernel.org> <160842189035.1580929.16863503861561557281@swboyd.mtv.corp.google.com> <20201220162135.yyijnczu6dxgnpda@pali>
Subject: Re: [PATCH] clk: mvebu: a3700: fix the XTAL MODE pin to MPP1_9
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Marek Behun <marek.behun@nic.cz>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Terry Zhou <bjzhou@marvell.com>,
        Konstantin Porotchkin <kostap@marvell.com>
To:     Pali =?utf-8?q?Roh=C3=A1r?= <pali@kernel.org>
Date:   Sun, 20 Dec 2020 17:47:17 -0800
Message-ID: <160851523731.1580929.3311960856996476601@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Pali Roh=C3=A1r (2020-12-20 08:21:35)
> On Saturday 19 December 2020 15:51:30 Stephen Boyd wrote:
> > Quoting Pali Roh=C3=A1r (2020-11-06 02:00:39)
> > > From: Terry Zhou <bjzhou@marvell.com>
> > >=20
> > > There is an error in the current code that the XTAL MODE
> > > pin was set to NB MPP1_31 which should be NB MPP1_9.
> > > The latch register of NB MPP1_9 has different offset of 0x8.
> > >=20
> > > Signed-off-by: Terry Zhou <bjzhou@marvell.com>
> > > [pali: Fix pin name in commit message]
> > > Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
> > > Fixes: 7ea8250406a6 ("clk: mvebu: Add the xtal clock for Armada 3700 =
SoC")
> > > Cc: stable@vger.kernel.org
> > >=20
> > > ---
> >=20
> > Applied to clk-next
>=20
> Hello Stephen! As this is fix also for stable releases, could you please
> queue this patch for 5.11 release?

No problem.
