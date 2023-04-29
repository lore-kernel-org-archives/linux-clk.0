Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0597CC77B60
	for <linux-clk@archiver.kernel.org>; Sat, 29 Apr 2023 01:13:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347128AbjD2BNj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Apr 2023 21:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbjD2BNi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Apr 2023 21:13:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF35A213C
        for <linux-clk@vger.kernel.org>; Fri, 28 Apr 2023 18:13:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 63D8962DA9
        for <linux-clk@vger.kernel.org>; Sat, 29 Apr 2023 01:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3BBC433D2;
        Sat, 29 Apr 2023 01:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682730816;
        bh=ngfPZVB4srf8It2rTrkDVVsU3/xInNiqv4mthWXVBAg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YByXy/Gxb8rdH9bv+tVMpoWPcjsI4UMpMmrhkyBFnCZDhnssNLOuOsOL16ZAk2FEj
         LyRQ+P5amSDee9Uoaxw+a2Km5va14pRfWjf5rj+B6GQOksyHrW6mPR7TlOhIlxGi99
         1jCnMMkYrEm51jikCusY52ZDKzumqzfnzzhiaqT0woEWVt88QUj9KIXuRLDyzTAorc
         8obl6LmsMZbcuDXQ1GiXzadIkpZhCy/03G3CRuAQpbIkqfDhVjZMLCpdtJqR7ZuaJi
         6Jb72ltOsHlrGsnZ5djaERvKjXsduEfzUz5T13QQRiqIt1HeVjzLjahuR4TRg/DgNI
         TWt5JaowrSWEQ==
Message-ID: <e181f270191e30d99554496517bd321d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230324145056.GA428955@dev-arch.thelio-3990X>
References: <202303221947.pXP2v4xJ-lkp@intel.com> <81b2a67f89d7f46dd27f6d05606e753f.sboyd@kernel.org> <20230322195933.GA2828949@dev-arch.thelio-3990X> <00c24196e5ceb60b7d69967b73910264.sboyd@kernel.org> <20230324145056.GA428955@dev-arch.thelio-3990X>
Subject: Re: [clk:clk-sunplus 1/1] drivers/clk/clk-sp7021.c:316:8: warning: result of comparison of constant 18446744073709551615 with expression of type 'typeof (_Generic((_m), char: (unsigned char)0, unsigned char: (unsigned char)0, signed char: (unsigned char)0, unsigned short: (unsigne...
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Qin Jian <qinjian@cqplus1.com>, kernel test robot <lkp@intel.com>,
        llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     Nathan Chancellor <nathan@kernel.org>
Date:   Fri, 28 Apr 2023 18:13:34 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Nathan Chancellor (2023-03-24 07:50:56)
> On Wed, Mar 22, 2023 at 04:48:43PM -0700, Stephen Boyd wrote:
> > Quoting Nathan Chancellor (2023-03-22 12:59:33)
> >=20
> > > It looks like clang is
> > > complaining that mask is an unsigned int and it is being compared
> > > against ~0ull, which will always be false. This makes the warning go
> > > away for me, which is similar to commit cfd6fb45cfaf ("crypto: ccree -
> > > avoid out-of-range warnings from clang"), but I am not sure if that is
> > > correct or not.
> >=20
> > Cool thanks. Can you send it as a proper patch?
>=20
> Sure thing, I will do so when I am back online next week.
>=20

Did you send the patch?
