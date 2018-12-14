Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9ACFC43387
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 17:20:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 841F9206E0
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 17:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544808047;
	bh=iSsfQz6FJg7l7CIgdvU9bccsh3QK5OP/IOYayZF8vQU=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=l+DE56BVgbDlrUHzZflEjcRnFq2pvrvmSXd5Uc+GOZirtpluoZ5K/UB4cS1UI3o1E
	 E5NXJymRD+T8WAa0vZ1fKHfM0RsdZ4kBM60Nr1aBNejudQZA6nLRGLwOcE3NGYvC8k
	 ziXUs28Gaz5+6sWDMRHIC36APZRZjGQFHlClS9gY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729660AbeLNRUq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Dec 2018 12:20:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:41710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729067AbeLNRUq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 14 Dec 2018 12:20:46 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A3BA206DD;
        Fri, 14 Dec 2018 17:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544808046;
        bh=iSsfQz6FJg7l7CIgdvU9bccsh3QK5OP/IOYayZF8vQU=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=wwj1UuFTqdbOCVxKvt03Cy6v6soIcWU8/nwCvEQlvQQAF9TzS5t6Q/stbKCpcT9d2
         x+bVo+Db8O9j46RqR90034FlUOfRu/fa3GRr/+Mn07kxa09iRwJiX5QRjYFg1izsiB
         4F2sHCgOci7dJGF2qsCxsGQyJMxryz3PhegLtZmo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <201812141711.PtX1q2JM%fengguang.wu@intel.com>
Subject: Re: [clk:clk-doc 4/5] drivers/clk/nxp/clk-lpc32xx.c:1094:5: error: 'struct clk_fixed_rate' has no member named 'flags'
To:     kbuild test robot <lkp@intel.com>
References: <201812141711.PtX1q2JM%fengguang.wu@intel.com>
Message-ID: <154480804446.19322.18272502916154391218@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     kbuild-all@01.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Date:   Fri, 14 Dec 2018 09:20:44 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting kbuild test robot (2018-12-14 01:31:14)
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk=
-doc
> head:   9369ad9e3dd4ec5a5d189825a49c1b76bb733571
> commit: 9274efae17dcaf8bb2f8abf802ea254ae8810794 [4/5] clk: Remove 'flags=
' member of struct clk_fixed_rate
> config: arm-lpc32xx_defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 9274efae17dcaf8bb2f8abf802ea254ae8810794
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D7.2.0 make.cross ARCH=3Darm=20
>=20
> All error/warnings (new ones prefixed by >>):
>=20
> >> drivers/clk/nxp/clk-lpc32xx.c:1094:5: error: 'struct clk_fixed_rate' h=
as no member named 'flags'
>        .flags =3D (_flags),    \
>         ^
> >> drivers/clk/nxp/clk-lpc32xx.c:1228:2: note: in expansion of macro 'LPC=
32XX_DEFINE_FIXED'
>      LPC32XX_DEFINE_FIXED(RTC, 32768, 0),
>      ^~~~~~~~~~~~~~~~~~~~
>    drivers/clk/nxp/clk-lpc32xx.c: In function 'lpc32xx_clk_register':
>    drivers/clk/nxp/clk-lpc32xx.c:1471:21: error: 'struct clk_fixed_rate' =
has no member named 'flags'
>        parents[0], fixed->flags, fixed->fixed_rate);
>                         ^~

Ah thanks. Good news is that it's an easy fix.

