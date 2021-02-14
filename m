Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA663C433DB
	for <linux-clk@archiver.kernel.org>; Sun, 14 Feb 2021 20:58:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7211264E29
	for <linux-clk@archiver.kernel.org>; Sun, 14 Feb 2021 20:58:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhBNU55 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 Feb 2021 15:57:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:50530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229793AbhBNU54 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 14 Feb 2021 15:57:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6630B64E26;
        Sun, 14 Feb 2021 20:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613336236;
        bh=b7EUSU2wg84pHjqL78adUCRrMW1SRuGgH8O7wYdT/Qw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sYidP2fP83RzbRnAe7SpXpqMP9WCv95+Qo3fi7/WyVeJN+XFANz81NK73e7d5jeSy
         PL0L0ZVZwToalwy/ZzDdAEY+R9hWjZA7Rlt/0Zx5WHJujUpXERR6/UTWVr22ttfaiO
         p0GLrBUiid50ZDWLt2DHMEISP7PaZbrAAxuqU2glnBboYp4cjK5LFiYZIoaau/r0hj
         sHTATd9M3na0+RBoC4oFW6/q8xWbXkJwoneff3rnoRf+bx1p6vxwWqn88+bYkgYHdb
         8hnNyslK3auDw2Nbk+BOWj5W22cfCFkWuTIk1QMxdAz9fj6ZMY8nacclFGQmUF8HW5
         ckIUpDqp8fSyw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202102142027.QnL2H9Am-lkp@intel.com>
References: <202102142027.QnL2H9Am-lkp@intel.com>
Subject: Re: [clk:clk-qcom 27/42] drivers/clk/qcom/gpucc-msm8998.c:265:45: error: 'NO_RET_PERIPH' undeclared here (not in a function)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        kernel test robot <lkp@intel.com>
Date:   Sun, 14 Feb 2021 12:57:14 -0800
Message-ID: <161333623495.1254594.5276827354452666923@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting kernel test robot (2021-02-14 04:52:28)
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk=
-qcom
> head:   27aef2b9462a57798e9bc54bf471ed39cf60117a
> commit: 1e40c64b4026021a11bba22253741bb40141b778 [27/42] clk: qcom: gpucc=
-msm8998: Add resets, cxc, fix flags on gpu_gx_gdsc
> config: powerpc-allyesconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/c=
ommit/?id=3D1e40c64b4026021a11bba22253741bb40141b778
>         git remote add clk https://git.kernel.org/pub/scm/linux/kernel/gi=
t/clk/linux.git
>         git fetch --no-tags clk clk-qcom
>         git checkout 1e40c64b4026021a11bba22253741bb40141b778
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dpowerpc=20
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> Note: the clk/clk-qcom HEAD 27aef2b9462a57798e9bc54bf471ed39cf60117a buil=
ds fine.
>       It only hurts bisectibility.

Thanks I reordered the patches so it should be fixed now.
