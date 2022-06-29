Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C62DC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jun 2022 07:41:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbiF2Hln (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jun 2022 03:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232203AbiF2Hlk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jun 2022 03:41:40 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 342F436B72
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 00:41:39 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id g26so30782166ejb.5
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 00:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TdkY72fU+VAjEVTDGUhkxypIF01xtYBlRjBQERW8zTI=;
        b=Bj0ruVqnSInSJl0FgwwskzMtrnErn3lOKlN9NGf41rKmubvI5VKzEO/eq6zTfuOsE6
         boWZP10MWJuc5w0SgEb73Y0npK6J+296i6pjOPGLdzOiCslr8zTfxN7bgaK+refMn4NU
         vEO6WZIc/eXhJV9eqA1RqYb8dDPr1z4uBnl9U6n9Hkrvs+MQCTKTeToD9/lE2kFLy0PQ
         r2Ff+4q4llsncnM9rAEDv3rGMX/ITebAYWTRt4TZuvaMQhGkvBRMVqREqxGcTxM1T4mQ
         TFh2z95+9hh5dj/nDbxDQJTH9i23Po5Ks6U+UTdhFft1jJc3jYEx7/DSAel7RviGSj9D
         9iqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TdkY72fU+VAjEVTDGUhkxypIF01xtYBlRjBQERW8zTI=;
        b=WCIhNrF00WTMorE+MY+Wlc2ynTwa4INTAK8Ix9inTF8D65hPMTsA+0iHtweHssJeJp
         aKhqKRtCGNacX1Nn7XMNEgE9u4crAVV5n6fMTMFAzvyDVXI1TyS/90+2WwWC5bLmNET7
         ZYJ2Pyv74SUxD3yEHCPrK0RuSiulzR1eeAZebZrKIRQ0eaYONZKMMRMP5HJBRHHpDT5Z
         bsILlsHIB2ovjgO3biQOb1HHDzj7g6ON0yr5yHzlwMaIK/1DkSrKkgCfJtDmkkuXrKeM
         W9nku/vYzVUWgyE0SkEVU+w93f8ABdilfDJMS/MY+OC4NPtRZg00u9i/fuyafrA8wCbB
         eSJg==
X-Gm-Message-State: AJIora9n2BgX0g8ctAUWAY0mGxxFwPxOMP2Es8jyINSiKSxSWEridXne
        TYt6YUGqfUYGWargFN8wZxIRGA==
X-Google-Smtp-Source: AGRyM1tyC9QQH5yDJ0Du3Th/pcsyMACbfhtfx3HrLQk2OT2vJDqrjNu0JAWdmfhWmOFOJN5xcEYp9w==
X-Received: by 2002:a17:906:ce:b0:715:705e:52fb with SMTP id 14-20020a17090600ce00b00715705e52fbmr1893034eji.303.1656488497742;
        Wed, 29 Jun 2022 00:41:37 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l7-20020a170906644700b0072354a54137sm7360766ejn.34.2022.06.29.00.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 00:41:37 -0700 (PDT)
Date:   Wed, 29 Jun 2022 10:41:35 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Marek Vasut <marex@denx.de>
Cc:     Lucas Stach <l.stach@pengutronix.de>, linux-clk@vger.kernel.org,
        Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Subject: Re: [PATCH v3 3/6] clk: imx: imx8mp: Add audiomix block control
Message-ID: <YrwCL2DNUp0mBpEe@linaro.org>
References: <20220625013235.710346-1-marex@denx.de>
 <20220625013235.710346-3-marex@denx.de>
 <YrnOTaLS2r7QBMNx@linaro.org>
 <66f689d9-a691-8bf6-62a2-48fac6eb3938@denx.de>
 <YrqxZFvKen7QybA9@linaro.org>
 <8d3fcbd9-2fd0-bf90-afa0-a21a79c81dbb@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d3fcbd9-2fd0-bf90-afa0-a21a79c81dbb@denx.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-06-28 19:06:39, Marek Vasut wrote:
> On 6/28/22 09:44, Abel Vesa wrote:
> > On 22-06-27 18:23:33, Marek Vasut wrote:
> > > On 6/27/22 17:35, Abel Vesa wrote:
> > > > On 22-06-25 03:32:32, Marek Vasut wrote:
> > > > > Unlike the other block control IPs in i.MX8M, the audiomix is mostly a
> > > > > series of clock gates and muxes. Model it as a large static table of
> > > > > gates and muxes with one exception, which is the PLL14xx . The PLL14xx
> > > > > SAI PLL has to be registered separately.
> > > > >
> > > >
> > > > Again, there is a chance that the blk-ctrl driver might disable the PD
> > > > from under this.
> > >
> > > Can you elaborate a bit more on this ? How/why do you think so ?
> >
> > At some point, the PDs from the Audiomix IP block will be added to the
> > drivers/soc/imx/imx8mp-blk-ctrl.c. Then, you'll have 2 drivers with the
> > same address range and the imx8mp-blk-ctrl also has runtime PM enabled.
>
> Why would the PDs be added into the block control driver?
>
> The audiomix is purely a clock mux driver, not really a block control driver
> providing PDs of its own.

OK then, fine by me.
