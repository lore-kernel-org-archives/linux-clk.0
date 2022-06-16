Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CE8C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jun 2022 14:18:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377055AbiFPOS1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Jun 2022 10:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377668AbiFPOSZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Jun 2022 10:18:25 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F372252B3
        for <linux-clk@vger.kernel.org>; Thu, 16 Jun 2022 07:18:24 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id z17so863639wmi.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Jun 2022 07:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UN5i/UKbtbONOs/WPjPNnPxxMDAl0vrQLK88lnS0mL4=;
        b=borFl+1dJOHpYvvyoUMMVCWKZHUKiB35x656cUgpGZgxyXRd6BlVe9MlysI1XLGXg2
         LweQJzHCnssF4XbGeZNoo7DA+CeUxz2YtHDA+83oRpTfPLs2dA/VPk1VVJA3X64TdXPe
         hTV1eB97I8OWUdnKliftqc6oVC+j1VcKcay5espvSvYmdGbovu0ejbWlypNtvvg0iBta
         ouQgQqDzxPy284vv3evT54tmfbzR041f+jeU2c0UGA0TU0XfTeB59j9R4FCCF3RYXZfy
         t0V3hFxDqTShT5A/HEDkDrc3mIm7+Ltysddd2tYTaFoJrWVWQzIy1hhHn8paBqBwsa36
         XE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UN5i/UKbtbONOs/WPjPNnPxxMDAl0vrQLK88lnS0mL4=;
        b=0+BQTPx3B7j+d+YYm7CI++aoY61cHgnvnPX+B9HdNgz8L3pN2ZwiS8rfuRFarnx023
         Wa1831tc2dI9oaDsEBojbEECXRAJgGkmlpVibMKP0xz5Lla00LeM4ZxRFTNGTDtn065K
         0039DfHBVNEIHBSSiyloQQZmsKXAT0xT64I8Dc+pDDNq0CkSgmfudAuvtp4Vh1K1Jzz5
         JmKruAVRYmOE7SBR79NdrQMX5zf4Zj5nyaNTvkI6Q9oUXDPr9ekDSuaRianDghizZ+dj
         sUWq3I1JkXgq0kLQX4sVxs8Ad35Pap0klkrpOZHkghTFuq9izTXSDeT8xWdo9ILL1OUo
         jDWA==
X-Gm-Message-State: AJIora9F/Y7dLgDYM4M5Rfh/42Pe6hPfCEvnc6Oits3ZMl914i3NWzUZ
        AwjQCcoiV9Z5Xle/EEvphKs2Qw==
X-Google-Smtp-Source: AGRyM1s5H8lKNZFdVa1S5zuMhAw0QUhD3qePq0J1JVU31PInsz4xDL9JKRXazszmikfRAVP5FcBYpA==
X-Received: by 2002:a05:600c:1caa:b0:39c:49a4:2e34 with SMTP id k42-20020a05600c1caa00b0039c49a42e34mr5423762wms.82.1655389103112;
        Thu, 16 Jun 2022 07:18:23 -0700 (PDT)
Received: from ryzen ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id t15-20020adfeb8f000000b0020e63ab5d78sm2055631wrn.26.2022.06.16.07.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 07:18:22 -0700 (PDT)
Date:   Thu, 16 Jun 2022 17:18:20 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH 3/7] clk: imx93: Correct the edma1's parent clock
Message-ID: <Yqs7rPynoWBi0XoY@ryzen>
References: <20220609132902.3504651-1-peng.fan@oss.nxp.com>
 <20220609132902.3504651-4-peng.fan@oss.nxp.com>
 <YqpRjwTVZU12H4Gb@ryzen>
 <20220616001604.D4C3CC3411A@smtp.kernel.org>
 <DU0PR04MB9417B711D79B0DE67D425E7B88AC9@DU0PR04MB9417.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR04MB9417B711D79B0DE67D425E7B88AC9@DU0PR04MB9417.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-06-16 03:58:10, Peng Fan wrote:
> > Subject: Re: [PATCH 3/7] clk: imx93: Correct the edma1's parent clock
> >
> > Quoting Abel Vesa (2022-06-15 14:39:27)
> > > On 22-06-09 21:28:58, Peng Fan (OSS) wrote:
> > > > From: Jacky Bai <ping.bai@nxp.com>
> > > >
> > > > For EDMA1 in AONMIX, its parent clock should be from cm33_root, so
> > > > Correct it.
> > > >
> > > > Fixes: 24defbe194b65("clk: imx: add i.MX93 clk")
> > > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > >
> > > The reviews done internally do no count in upstream.
> > > I think that's the rule. So drop the R-b tags from all patches.
> > > Keep only the S-o-b tags.
> >
> > Is it any different code from what is sent upstream here? If not any different
> > then I don't think anything is stopping the review tags from being kept.
>
> There is no difference, I directly cherry-pick downstream patch to upstream,
> with only a very minor subject change, dropping the JIRA ticket number.
>

Sounds good to me then. I'll apply it now. Thanks.

> Thanks,
> Peng.
