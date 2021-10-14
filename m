Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EF9C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 14 Oct 2021 19:11:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC6DB61151
	for <linux-clk@archiver.kernel.org>; Thu, 14 Oct 2021 19:11:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbhJNTNg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Oct 2021 15:13:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:37846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231265AbhJNTNe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 14 Oct 2021 15:13:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9923661090;
        Thu, 14 Oct 2021 19:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634238688;
        bh=SUExpjeO0ZWO9PXaGWFIlspnd7e4CidpfLchVwZpqxc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uM51oHn1wk6Sr092ovOaqu66dbICk3ixFMnaV5Dji84LkukJy3SHajtA5BeGaQ3b6
         uHB/fWQrD6ZoR5BbTeKFZshjA14a/ZWgJSBAaO8qgmTRGQHad41AcobjYjVoX2j6vv
         SE0GxVoj8tsJ7hPe6fFcrNrY96eH9cIxQEs2wv/ZueYYXs1yYzxQBrIXmSKh2fXm8W
         ujjuA2pSeH6SzVFHV6Raww6jTIEyF/4RMt8Hgunj1/Cv1kghxp8sY0udGG5j0yjTGJ
         vVj5/nRcLUL1Vhv3llDqmnygGjzL4haRbZ2dTN1jwzWpTVyZcLwvDFLchfGRx76PxJ
         qfssM7rZH2D6w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202110142319.FQFXTiZp-lkp@intel.com>
References: <202110142319.FQFXTiZp-lkp@intel.com>
Subject: Re: [clk:clk-qcom 17/38] drivers/clk/qcom/gcc-sc7280.c:200:37: error: 'gcc_parent_data_0_ao' defined but not used
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
To:     Taniya Das <tdas@codeaurora.org>, kernel test robot <lkp@intel.com>
Date:   Thu, 14 Oct 2021 12:11:27 -0700
Message-ID: <163423868721.1688384.12110807137093333765@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting kernel test robot (2021-10-14 08:53:27)
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk=
-qcom
> head:   1daec8cfebc28bbe596743c34bebd11b80fba990
> commit: 3165d1e3c737fd9432e9e68b44a64c47f886f647 [17/38] clk: qcom: gcc: =
Remove CPUSS clocks control for SC7280
> config: arm-buildonly-randconfig-r005-20211014 (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/c=
ommit/?id=3D3165d1e3c737fd9432e9e68b44a64c47f886f647
>         git remote add clk https://git.kernel.org/pub/scm/linux/kernel/gi=
t/clk/linux.git
>         git fetch --no-tags clk clk-qcom
>         git checkout 3165d1e3c737fd9432e9e68b44a64c47f886f647
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cro=
ss ARCH=3Darm=20
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Thanks. I need to update my toolchain.
