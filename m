Return-Path: <SRS0=cbsA=RV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC03C43381
	for <linux-clk@archiver.kernel.org>; Mon, 18 Mar 2019 19:49:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E897A213F2
	for <linux-clk@archiver.kernel.org>; Mon, 18 Mar 2019 19:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1552938577;
	bh=rOGaqJLsPNHQ5Crk49tSHE7Ios2UsBkT7W9r9Ss67SI=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=NkSIlMvVDNaGTYFCErfqa4594p9hcbj8uwRyk99fObiKVdG6eFQHLb1q0w807Hh7n
	 Eft0J0dMaFxTdAYoqCWhWrGTgZkOE8uLn4z3B5a3VdUd9l9KhTRa3d528u0nlAAQSH
	 mu7ECrU2rwkuDscxmU5Mg4JydLN0cOh1DFMNpqr4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbfCRTtg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Mar 2019 15:49:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:40688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727218AbfCRTtg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 18 Mar 2019 15:49:36 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D1CE520989;
        Mon, 18 Mar 2019 19:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1552938575;
        bh=rOGaqJLsPNHQ5Crk49tSHE7Ios2UsBkT7W9r9Ss67SI=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=wNaGduMP50wgMMB+McHVfEdOWaGg3m/sNDrwzbCd236tsDE1SrmWI3tT7aIIGY6Gi
         dQ+KPvItuRREZYDWf7GXErmqci0CBKEz+g0vJV/A4VirkhJXOFqH/ov41QZcZiarna
         61iUrol9DPIQdaAninl9zEvvZRlr1dmS/JP/7PrA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190318102805.10145-1-maxime.ripard@bootlin.com>
References: <20190318102805.10145-1-maxime.ripard@bootlin.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: sunxi: Add Kconfig options
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
To:     Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <155293857501.20095.5076762911679502932@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Mon, 18 Mar 2019 12:49:35 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2019-03-18 03:28:05)
> diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
> new file mode 100644
> index 000000000000..2842d2feca0e
> --- /dev/null
> +++ b/drivers/clk/sunxi/Kconfig
> @@ -0,0 +1,21 @@
> +config CLK_SUNXI
> +       bool "Legacy clock support for Allwinner SoCs"

Maybe this should be a submenu, i.e. a menuconfig, so it's even further
buried and doesn't show up in the top-level clk config listing when it's
enabled.

> +       depends on ARCH_SUNXI || COMPILE_TEST
> +
> +if CLK_SUNXI
> +
> +config CLK_SUNXI_CLOCKS
> +       bool "Legacy clock drivers"

Maybe you can add some help text here to guide the user to understand
that these drivers shouldn't be used in most (all?) cases?

> +
> +config CLK_SUNXI_PRCM_SUN6I
> +       bool "Legacy sun6i PRCM driver"
> +       select MFD_SUN6I_PRCM
> +
> +config CLK_SUNXI_PRCM_SUN8I
> +       bool "Legacy sun8i PRCM driver"
> +       select MFD_SUN6I_PRCM
> +
> +config CLK_SUNXI_PRCM_SUN9I
> +       bool "Legacy sun9i PRCM driver"
> +
> +endif
