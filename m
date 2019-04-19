Return-Path: <SRS0=/mgL=SV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFD0C282DF
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 20:19:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1BD7D217F9
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 20:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555705166;
	bh=M8nKRkU5xwF3iD0UlNUz2o+WV3MkeZOVhAkT625GiFU=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=CL+dBnNG1RHAjEbySL0ignuZ/kdhSlCw1RAmCsIBGiipLyJ3mBcvJMFAyEydmOta8
	 coTV7jZf672xRY7CxxTXZ+L6IfAybCXko0EB+TNkYy2miSwrNycIMt8wnzdzViGguY
	 JmJWQRkWHjGMTuSrLGYK2rVpkYaJjA6IKCAXOYDo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbfDSUTZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Apr 2019 16:19:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:38448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725817AbfDSUTZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Apr 2019 16:19:25 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AD12920821;
        Fri, 19 Apr 2019 20:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555705164;
        bh=M8nKRkU5xwF3iD0UlNUz2o+WV3MkeZOVhAkT625GiFU=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=DVH1HFOihKH23ACAA1Byid3DHjMMERQShB8krZjmSp3kjCM3gPhJWuZJYUJ/Jm4j5
         IbyYapmqEMEpfVWTe9b63bEXbyFGt0yd+JTZ4npoYlRuggSWiQ6K+RHKCXybX4hNPl
         Nki5UYnV+/QfheaoNhgtffqm5WB0xlIg+9r0mabI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190419112518.5zwaeqg7egfimts7@flea>
References: <20190419112518.5zwaeqg7egfimts7@flea>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] Allwinner clock changes for 5.2
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <155570516391.15276.12155157680991893525@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Fri, 19 Apr 2019 13:19:23 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2019-04-19 04:25:18)
> Hi Mike, Stephen,
>=20
> Please pull the following changes for the next merge window.
>=20
> Thanks!
> Maxime
>=20
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa23=
1b:
>=20
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-5.2

Thanks. Pulled but not yet merged into clk-next, because I see this error
when I try to build just the files that have changed:

	WARNING: unmet direct dependencies detected for MFD_SUN6I_PRCM
	  Depends on [n]: HAS_IOMEM [=3Dy] && ARCH_SUNXI
	  Selected by [y]:
	  - CLK_SUNXI_PRCM_SUN6I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI [=3Dy]
	  - CLK_SUNXI_PRCM_SUN8I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI [=3Dy]

	WARNING: unmet direct dependencies detected for MFD_SUN6I_PRCM
	  Depends on [n]: HAS_IOMEM [=3Dy] && ARCH_SUNXI
	  Selected by [y]:
	  - CLK_SUNXI_PRCM_SUN6I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI [=3Dy]
	  - CLK_SUNXI_PRCM_SUN8I [=3Dy] && COMMON_CLK [=3Dy] && CLK_SUNXI [=3Dy]

Maybe the Kconfig patch isn't completely proper. I suppose that
MFD_SUN6I_PRCM can be selected via COMPILE_TEST=3Dy path of
CLK_SUNXI_PRCM_SUN6I and then fail to enable because ARCH_SUNXI=3Dn.

