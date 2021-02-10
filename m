Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2377BC433DB
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 01:41:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C47C964E3F
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 01:41:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234216AbhBJBlf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Feb 2021 20:41:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:50920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234582AbhBJBjy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 9 Feb 2021 20:39:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D796D64E3F;
        Wed, 10 Feb 2021 01:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612921154;
        bh=PA6QtRdEDilmI9Cf+UleJSR7PME9vJIQ+zFT+vWQOKo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=geX+B8YQW8OQWp7RMOC509bviK6xXCQ66EdlgYsCx+qWdpzUoktdhArGdkcGyGPcZ
         JBeEJMiGX9+t2sHVDaM2NtgbMLOGWB9k8ZXXHj9+XmCe8KPeYgkfOAL7hlE3snERif
         slZ42BMJRQj8N8mmgwlf8NnNSn353DVjIAW8VxDEUcOFfbor+gjeUQ+8sSgcgEEk4/
         b0TTSi3soXccBUpzLhw7ySSJwXjgC07gj5HZHJYQarOUz1xTCoHrnN6/BRvoKxFK8P
         wFeUj0Pzzrj2LyebaeOxde4qt34/4fs+4pl91zEZMOWWVDBn39qSIBnLKptw0ikXQm
         Gj+5wX6h/O66g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202102100848.pTE3qASH-lkp@intel.com>
References: <202102100848.pTE3qASH-lkp@intel.com>
Subject: Re: [clk:clk-unused 3/5] arch/arm/boot/dts/zx296702.dtsi:3:10: fatal error: dt-bindings/clock/zx296702-clock.h: No such file or directory
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
To:     Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>
Date:   Tue, 09 Feb 2021 17:39:12 -0800
Message-ID: <161292115233.418021.13766068523238080937@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting kernel test robot (2021-02-09 16:16:55)
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk=
-unused
> head:   ee7294ba49bf8559b560b21629ed8153082c25cf
> commit: bcbe6005eb18d2cd565f202d9351737061753894 [3/5] clk: remove zte zx=
 driver
> config: arm-allyesconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/c=
ommit/?id=3Dbcbe6005eb18d2cd565f202d9351737061753894
>         git remote add clk https://git.kernel.org/pub/scm/linux/kernel/gi=
t/clk/linux.git
>         git fetch --no-tags clk clk-unused
>         git checkout bcbe6005eb18d2cd565f202d9351737061753894
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Darm=20
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
>    In file included from arch/arm/boot/dts/zx296702-ad1.dts:5:
> >> arch/arm/boot/dts/zx296702.dtsi:3:10: fatal error: dt-bindings/clock/z=
x296702-clock.h: No such file or directory
>     #include <dt-bindings/clock/zx296702-clock.h>
>              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    compilation terminated.

Arnd, did you want to take the driver removal through whatever tree is
removing the dtsi files?
