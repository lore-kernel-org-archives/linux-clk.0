Return-Path: <SRS0=uslk=OM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96AD4C07E85
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 17:15:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 570F82087F
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 17:15:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHpQVXsa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 570F82087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbeLCRPm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 12:15:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:45792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726657AbeLCRPm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 3 Dec 2018 12:15:42 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8313E20848;
        Mon,  3 Dec 2018 17:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543857340;
        bh=ysPNaHS1PxY9ROXZfZNrYWzk2JgfBqchDmUPIGrH2yA=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=ZHpQVXsafzEmQSns22ljQoCHhONhB1GiQdn9cJqH5o03UbvW3GZSxu82WKCQgLDle
         E4AYFkNHh8C9bAtFxOiWXRxCkGwNFrqmmwO/8Cbzeg6A1ur6z3V2bfHWCAk/EQ3jq7
         8/YHENf3+1RezGr/6p0OPQV/qxa5un4ucmtMetNg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Lucas Stach <l.stach@pengutronix.de>,
        kbuild test robot <lkp@intel.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <201812010931.vrPHNqVZ%fengguang.wu@intel.com>
Cc:     kbuild-all@01.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Abel Vesa <abel.vesa@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>
References: <201812010931.vrPHNqVZ%fengguang.wu@intel.com>
Message-ID: <154385733975.88331.517929167531670456@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [clk:clk-imx8mq 2/5] clk-frac-pll.c:undefined reference to
 `__aeabi_uldivmod'
Date:   Mon, 03 Dec 2018 09:15:39 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting kbuild test robot (2018-11-30 17:08:33)
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk=
-imx8mq
> head:   de9cffdeeef50f513954ae83e91e1a465906ace5
> commit: 9fd680d0fafd4cfef36088cf866c98ecb028ac34 [2/5] clk: imx: add frac=
tional PLL output clock
> config: arm-defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 9fd680d0fafd4cfef36088cf866c98ecb028ac34
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D7.2.0 make.cross ARCH=3Darm =

> =

> All errors (new ones prefixed by >>):
> =

>    drivers/clk/imx/clk-frac-pll.o: In function `clk_pll_round_rate':
> >> clk-frac-pll.c:(.text+0x50): undefined reference to `__aeabi_uldivmod'

Oops. I forgot to drop this branch from the clk tree. Thanks for the
reminder.

