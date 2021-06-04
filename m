Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800EEC47082
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 01:19:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60A5C613F6
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 01:19:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbhFDBVm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Jun 2021 21:21:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:37556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230158AbhFDBVl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 3 Jun 2021 21:21:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51F2A61168;
        Fri,  4 Jun 2021 01:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622769596;
        bh=R1Ykmxe4dRQWe/IJFA33H2rc+GDw9jPUumYFbEC6/+E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qMsYQOZSqdC5Az0dBoByEoJmhEMGQwl5IDkz4lJ+Jcwrcuqpp4qGGVC6M8Oc45VJ1
         d1y4yQMxsfdcbrNlJ3y7Y7X4cbt2bAtNjEfAZW5QEgjIkFSIPOQYFXw2P+dniNefmz
         foAPZRbc/S76Dm+2zN/LoNzCECbaN5X3XfwvBWau3jvZk4Z2MXWGdmByBErEt77vqR
         5WlL10c6NtQSF3u5CIomIadlf1tdK6zR5nmM9Q26rKVeWCGOnkS1m2XdORErJtWqVr
         htwAhG0bxgtatIy/OxtFa6ktJpBav13MsH1O6qk2/D5XLc9TnfBS2Al/vrhUwndb0m
         NQcBeifYOtbbA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202106031129.hK4xvnxz-lkp@intel.com>
References: <202106031129.hK4xvnxz-lkp@intel.com>
Subject: Re: [clk:clk-qcom 5/10] drivers/clk/qcom/gcc-mdm9607.c:37:32: warning: unused variable 'gcc_xo_sleep_map'
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        kernel test robot <lkp@intel.com>
Date:   Thu, 03 Jun 2021 18:19:55 -0700
Message-ID: <162276959506.1835121.3197175655380445671@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting kernel test robot (2021-06-02 20:25:31)
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk=
-qcom
> head:   ec7e22abec97b6bd577027380077ec395864a3c5
> commit: 48b7253264eadc05a3d84db9ea11eef528a0108a [5/10] clk: qcom: Add MD=
M9607 GCC driver
> config: arm64-randconfig-r001-20210603 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project d8e0=
ae9a76a62bdc6117630d59bf9967ac9bb4ea)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/c=
ommit/?id=3D48b7253264eadc05a3d84db9ea11eef528a0108a
>         git remote add clk https://git.kernel.org/pub/scm/linux/kernel/gi=
t/clk/linux.git
>         git fetch --no-tags clk clk-qcom
>         git checkout 48b7253264eadc05a3d84db9ea11eef528a0108a
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Darm64=20
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Thanks. I think we'll just have to delete them.
