Return-Path: <SRS0=3Kxj=UV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F34C43613
	for <linux-clk@archiver.kernel.org>; Sat, 22 Jun 2019 02:22:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9409F20881
	for <linux-clk@archiver.kernel.org>; Sat, 22 Jun 2019 02:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561170178;
	bh=2533Dg9bGOeJ2s+uZg4igKd819QK2urTK0KbdMeN+qI=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=CgKRxSm7L6ZZ92ID7Hylhfzpfe0vLi2+lJc7iMwG8ZfKUsfKLYmV4swHpBL3o60Bf
	 J9ZPm2S9XkB98UIH/hvO9ft8In6Idsexu5RFFCyLHTH+gl0wSNHGmjAYn7JNePlAg2
	 OrYStJx1aCsP9s09Pvod3bLpX34x5NVc7gVmUBjM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfFVCW6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Jun 2019 22:22:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:36502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726049AbfFVCW6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 21 Jun 2019 22:22:58 -0400
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E6F72084E;
        Sat, 22 Jun 2019 02:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561170176;
        bh=2533Dg9bGOeJ2s+uZg4igKd819QK2urTK0KbdMeN+qI=;
        h=Date:From:To:Cc:Subject:From;
        b=SNXE2UZFfi/pLKUtdA1F79y2iS8KHRZR2exKnufnYdTWQzOYlmsU78JX6Gdv3FgNL
         rqUmJBcMmWTg0wierBQPPbQGJWO6pPCzmVQ08HJUpu9WxXGbe4WFY3FoZdPzpEMr12
         SGBQVfWkoQXU6Tm8jjP3MOPQHNfOKIm6L8YiwMqk=
Received: by wens.tw (Postfix, from userid 1000)
        id 4AD2B5FC7A; Sat, 22 Jun 2019 10:22:54 +0800 (CST)
Date:   Sat, 22 Jun 2019 10:22:54 +0800
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] clk: sunxi-ng: clk parent rewrite part 1 - take 2
Message-ID: <20190622022254.GA7789@wens.csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Take 2 has build errors in drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
fixed.

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi-ng-parent-rewrite-part-1-take-2

for you to fetch changes up to 89f27fb2dd348d8d52a97e6ebec15c64fe461a25:

  clk: sunxi-ng: sun8i-r: Use local parent references for SUNXI_CCU_GATE (2019-06-22 10:13:16 +0800)

----------------------------------------------------------------
Allwinner sunxi-ng clk driver parent relation rewrite part 1 - take 2

The first part of ongoing work to convert the sunxi-ng clk driver from
using global clock name strings to describe clk parenting, to having
direct struct clk_hw pointers, or local names based on clock-names from
the device tree binding.

This is based on Stephen Boyd's recent work allowing clk drivers to
specify clk parents using struct clk_hw * or parsing DT phandles in the
clk node.

This series can be split into a few major parts:

1) The first patch is a small fix for clk debugfs representation.

2) A bunch of CLK_HW_INIT_* helper macros are added. These cover the
   situations I encountered, or assume I will encounter, such as single
   internal (struct clk_hw *) parent, single DT (struct clk_parent_data
   .fw_name), multiple internal parents, and multiple mixed (internal +
   DT) parents. A special variant for just an internal single parent is
   added, CLK_HW_INIT_HWS, which lets the driver share the singular
   list, instead of having the compiler create a compound literal every
   time. It might even make sense to only keep this variant.

3) A bunch of CLK_FIXED_FACTOR_* helper macros are added. The rationale
   is the same as the single parent CLK_HW_INIT_* helpers.

4) Bulk conversion of CLK_FIXED_FACTOR to use local parent references,
   either struct clk_hw * or DT .fw_name types, whichever the hardware
   requires.

5) The beginning of SUNXI_CCU_GATE conversion to local parent
   references. This part is not done. They are included as justification
   and examples for the shared list of clk parents case.

----------------------------------------------------------------
Chen-Yu Tsai (25):
      clk: Fix debugfs clk_possible_parents for clks without parent string names
      clk: Add CLK_HW_INIT_* macros using .parent_hws
      clk: Add CLK_HW_INIT_FW_NAME macro using .fw_name in .parent_data
      clk: Add CLK_HW_INIT_PARENT_DATA macro using .parent_data
      clk: fixed-factor: Add CLK_FIXED_FACTOR_HW which takes clk_hw pointer as parent
      clk: fixed-factor: Add CLK_FIXED_FACTOR_HWS which takes list of struct clk_hw *
      clk: fixed-factor: Add CLK_FIXED_FACTOR_FW_NAME for DT clock-names parent
      clk: sunxi-ng: switch to of_clk_hw_register() for registering clks
      clk: sunxi-ng: sun8i-r: Use local parent references for CLK_HW_INIT_*
      clk: sunxi-ng: a10: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: sun5i: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: a31: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: a23: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: a33: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: h3: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: r40: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: v3s: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: sun8i-r: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: f1c100s: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: a64: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: h6: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: h6-r: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: gate: Add macros for referencing local clock parents
      clk: sunxi-ng: a80-usb: Use local parent references for SUNXI_CCU_GATE
      clk: sunxi-ng: sun8i-r: Use local parent references for SUNXI_CCU_GATE

 drivers/clk/clk.c                        |  44 ++++++++++++-
 drivers/clk/sunxi-ng/ccu-sun4i-a10.c     |  39 +++++++-----
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c    |  41 +++++++-----
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c   |   2 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c     |  69 ++++++++++++--------
 drivers/clk/sunxi-ng/ccu-sun5i.c         |  34 ++++++----
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c     |  39 +++++++-----
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c     |  34 ++++++----
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c     |  34 ++++++----
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c      |  29 ++++++---
 drivers/clk/sunxi-ng/ccu-sun8i-r.c       | 104 +++++++++++++++----------------
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c     |  46 +++++++++-----
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c     |  29 ++++++---
 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c |  32 ++++++----
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c |  29 ++++++---
 drivers/clk/sunxi-ng/ccu_common.c        |   2 +-
 drivers/clk/sunxi-ng/ccu_gate.h          |  53 ++++++++++++++++
 include/linux/clk-provider.h             |  89 ++++++++++++++++++++++++++
 18 files changed, 526 insertions(+), 223 deletions(-)

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAl0NkP4ACgkQOJpUIZwP
JDCxkRAAo8LODRUyhT71hu5MiybkC1eIlL4klQFYuBQ5NP0GsEVr+ZTGP/ntrxku
A+bBcMCTMv9UCWhm/oE1WCBl7tzbaYrIa09DMnsUY26aAX70nnlhsh8xdwuc2R4r
ACwfT521jN0cal3iQax5g5tJl/g6LLQPAafrrNBW6P2UFjJLY9JSsbfg2oX9+jIO
w5T+r77FKtnom+cQhGIbVV/AeS9mUhDyWcJ1vBYWrVNK3P5+HKfshVDA9Hitn3BZ
nYA40EGIdbnYBtxxy6km24vJOOI4yxS3J3Cj6j/wB+Dlso24JXDJhHHOnzLyevTq
wqUU0FmozbSNhxdzvNKvTGBU+fSxI+j67sM/Iv+3AzjXqfIFHoX+jFKhDED7ZgCi
PpcS01Q88ziHIBehcqiMuiZMRBoiU35tbF8TT+4sssvsd2ujkAr2h3Jgz/ZSTcXC
y4TYa1FyLnfGFvLZhgcXwEJfvq70GB/u5fHuFCAi5rexmbCxdBhzVdsCfLMItLzR
2xwqSChajVW1EsHKNytSCfJZ0e1fTKt6PBteJ4jVUlpVQFZpVnbcf2YLdVN+Ksir
G647JLw3XCL/eM8ASboTRquBqEjOYn21JS55qQXz4WPA5fJIzM1K56Ez7HvWRnaK
HrhM6kD5L5V8yF6tNnRxjFbKAHplzSDS+XOQL2x7PzRsErwYNVM=
=SeQp
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
