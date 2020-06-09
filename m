Return-Path: <SRS0=69cD=7W=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBDDC433DF
	for <linux-clk@archiver.kernel.org>; Tue,  9 Jun 2020 21:16:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15B3C20734
	for <linux-clk@archiver.kernel.org>; Tue,  9 Jun 2020 21:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591737373;
	bh=e26IpfGJ9WhIIDdNAB2BegdKpPxmPKMY/Is6gl++1es=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=PRfwEPuuW88mMNT3kKMlYaYuvLaC5J/2+iSK1xvX3IamaRXKcjgIqNa7cuChYKGOf
	 mC0qaNjdJ1ULstKUT2GFPNu0oeAAICxZf3TduSpiwIgOBUKkRmbBpHopA+zm73dDzV
	 Y9YEIZoaO6PJq2E0g+q99S3BPAhv1x1SpUYLYxOA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgFIVQM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Jun 2020 17:16:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:38810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726395AbgFIVQK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 9 Jun 2020 17:16:10 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 14EB0206D5;
        Tue,  9 Jun 2020 21:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591737370;
        bh=e26IpfGJ9WhIIDdNAB2BegdKpPxmPKMY/Is6gl++1es=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FHDziFwD/dq7QDdliYeGTcN1ASQzrlpy/nXiO8tY7COvOY8lJSQnK5B2MtWqTpBXz
         oW71W1X4mMgrDI9YcqWIDMAOfZcMF+Xy3YWHm9FVxwWeWppV24HA4SWHZunLxby0Qg
         Xo1DNTY6ue0ejJZCrNc+nFrQSfKEYJ5FQMnfay98=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202005310615.TVwTAUgp%lkp@intel.com>
References: <202005310615.TVwTAUgp%lkp@intel.com>
Subject: Re: [clk:clk-mediatek 5/6] drivers/clk/mediatek/clk-mt6765.c:537:35: warning: unused variable 'ifr0_cg_regs'
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mars Cheng <mars.cheng@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>
To:     "Owen, Chen," <owen.chen@mediatek.com>,
        kbuild test robot <lkp@intel.com>
Date:   Tue, 09 Jun 2020 14:16:09 -0700
Message-ID: <159173736939.242598.14069411610834841250@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting kbuild test robot (2020-05-30 15:25:16)
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk=
-mediatek
> head:   571cfadcc628dd5591444f7289e27445ea732f4c
> commit: 1aca9939bf72893887cb7e3455e44c864bada2f9 [5/6] clk: mediatek: Add=
 MT6765 clock support
> config: x86_64-allyesconfig (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 2388=
a096e7865c043e83ece4e26654bd3d1a20d5)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout 1aca9939bf72893887cb7e3455e44c864bada2f9
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64=20
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>=20
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>=20
> >> drivers/clk/mediatek/clk-mt6765.c:537:35: warning: unused variable 'if=
r0_cg_regs' [-Wunused-const-variable]
> static const struct mtk_gate_regs ifr0_cg_regs =3D {
> ^
> >> drivers/clk/mediatek/clk-mt6765.c:543:35: warning: unused variable 'if=
r1_cg_regs' [-Wunused-const-variable]
> static const struct mtk_gate_regs ifr1_cg_regs =3D {
> ^
> 2 warnings generated.
>=20
> vim +/ifr0_cg_regs +537 drivers/clk/mediatek/clk-mt6765.c
>=20
>    536 =20
>  > 537  static const struct mtk_gate_regs ifr0_cg_regs =3D {
>    538          .set_ofs =3D 0x200,
>    539          .clr_ofs =3D 0x200,
>    540          .sta_ofs =3D 0x200,
>    541  };
>    542 =20
>  > 543  static const struct mtk_gate_regs ifr1_cg_regs =3D {
>    544          .set_ofs =3D 0x74,
>    545          .clr_ofs =3D 0x74,
>    546          .sta_ofs =3D 0x74,
>    547  };
>    548 =20
>=20

Thanks. I'm just going to pile a patch on top of clk-next to remove
these two structures.
