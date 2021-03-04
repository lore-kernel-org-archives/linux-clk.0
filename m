Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5A7C433E6
	for <linux-clk@archiver.kernel.org>; Thu,  4 Mar 2021 00:26:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BD7964E68
	for <linux-clk@archiver.kernel.org>; Thu,  4 Mar 2021 00:26:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385355AbhCDAYt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:24:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:37700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1447139AbhCDATp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 3 Mar 2021 19:19:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EFFC64EEC;
        Thu,  4 Mar 2021 00:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614817024;
        bh=gsfi5R68pk3iKitxnXVCTQM8M5UnqexpMVyKsAvADpE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Ng4TGMScFSrpP5mHMPcXjsnSDQ4fM4oqImlQxgv/nRaX4o/QbrRykjcVn42+AU8N5
         nSWeUT6EDYSfQlb/tMLGix0JSiODJySrNmlzgRpLU1fjWWVmWQkLatqahvWlpg34Wi
         fJCuuWHJ9Sx9QKk94T/toPbX5vthGzhf3kgAY07BVnkaNePUOyE/voJuEUv0BaV1fG
         BsVfvoUoaritwzaqhFLUw7ybn2oBFVeSDuU9M3cGPoUjSvD9ihoVbG1NhmC+5MABke
         OnHqcVsnlq7DharWwqR3Ddyd10CEj0yyR6HJfS8uHkdzEj1da00+HXsWEWcss9kOwv
         uSdcMDbOeuOsw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210303142430.3168703-1-lee.jones@linaro.org>
References: <20210303142430.3168703-1-lee.jones@linaro.org>
Subject: Re: [PATCH 1/1] clk: sunxi: Demote non-conformant kernel-doc headers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Emilio =?utf-8?q?L=C3=B3pez?= <emilio@elopez.com.ar>,
        Michael Turquette <mturquette@baylibre.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Boris BREZILLON <boris.brezillon@free-electrons.com>,
        linux-clk@vger.kernel.org
To:     lee.jones@linaro.org
Date:   Wed, 03 Mar 2021 16:17:02 -0800
Message-ID: <161481702291.1478170.841537456605456317@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lee Jones (2021-03-03 06:24:30)
> Headers must describe their parameters.
>=20
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/sunxi/clk-sun9i-core.c:27: warning: Function parameter or me=
mber 'req' not described in 'sun9i_a80_get_pll4_factors'
>  drivers/clk/sunxi/clk-sun9i-core.c:100: warning: Function parameter or m=
ember 'req' not described in 'sun9i_a80_get_gt_factors'
>  drivers/clk/sunxi/clk-sun9i-core.c:155: warning: Function parameter or m=
ember 'req' not described in 'sun9i_a80_get_ahb_factors'
>  drivers/clk/sunxi/clk-sun9i-core.c:235: warning: Function parameter or m=
ember 'req' not described in 'sun9i_a80_get_apb1_factors'
>  drivers/clk/sunxi/clk-usb.c:22: warning: cannot understand function prot=
otype: 'struct usb_reset_data '
>  drivers/clk/sunxi/clk-sun6i-ar100.c:26: warning: Function parameter or m=
ember 'req' not described in 'sun6i_get_ar100_factors'
>=20
> Cc: "Emilio L=C3=B3pez" <emilio@elopez.com.ar>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
