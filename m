Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE909C11F64
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 23:19:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8037F61D00
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 23:19:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235240AbhF1XVi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jun 2021 19:21:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:44082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234600AbhF1XVh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 28 Jun 2021 19:21:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73A4561CEF;
        Mon, 28 Jun 2021 23:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624922351;
        bh=NNrT4RLr2Jh5FnzYZTUHOqeLSobOEdvOe1R99DKd0II=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RPaSkVLQt5OezZ52RrPMu2Npcw1Ivo8E01xf6LNYy+FyJqr2mlF0sSvJ1q9PK9A8F
         K6poVVEnTa80Lar4TFll+TLLvNq6JSR3CbLdUtSUQG12vB0L7SAd4HfqfcQmPEGx+4
         RQaXkD36WF+ZRdmPlzT4YFed0FOx26L60OSQn4vhP/FeJxOr3ziliTvgOciMXjyTqg
         uVB2vEtbGs0o3tz1NOruQyVXjBr9qKhdpJp7hCR2P8NwoPY7VbhaQVAL6c1fWFbvcT
         ubKXdCvarTG+MDASrWEXaOYWjb/kR/02+sYVOOfu7iJ5y2xNEzTVs0K6taMsdrNeKi
         XpC2UYCgMZ7TA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202106282032.Nu4qxPkD-lkp@intel.com>
References: <202106282032.Nu4qxPkD-lkp@intel.com>
Subject: Re: [clk:clk-lmk04832 2/3] clk-lmk04832.c:undefined reference to `spi_get_device_id'
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
To:     Liam Beguin <lvb@xiphos.com>, kernel test robot <lkp@intel.com>
Date:   Mon, 28 Jun 2021 16:19:10 -0700
Message-ID: <162492235019.2516444.7165219982334089263@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting kernel test robot (2021-06-28 05:19:38)
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk=
-lmk04832
> head:   6181baa177d417211ea28de793524ec3d13b256d
> commit: 3bc61cfd6f4a57de32132075b15b0ac8987ced1d [2/3] clk: add support f=
or the lmk04832
> config: s390-randconfig-c023-20210628 (attached as .config)
> compiler: s390-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/c=
ommit/?id=3D3bc61cfd6f4a57de32132075b15b0ac8987ced1d
>         git remote add clk https://git.kernel.org/pub/scm/linux/kernel/gi=
t/clk/linux.git
>         git fetch --no-tags clk clk-lmk04832
>         git checkout 3bc61cfd6f4a57de32132075b15b0ac8987ced1d
>         # save the attached .config to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s O=3Dbuild_dir ARCH=3Ds390 SHELL=3D/bin/bash
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Will add depends on SPI to the Kconfig.
