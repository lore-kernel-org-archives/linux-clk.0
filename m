Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56383C7EE22
	for <linux-clk@archiver.kernel.org>; Tue,  9 May 2023 13:00:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbjEINAY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 May 2023 09:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbjEINAX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 May 2023 09:00:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477463580;
        Tue,  9 May 2023 06:00:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9F0E5645F4;
        Tue,  9 May 2023 13:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A1FC433EF;
        Tue,  9 May 2023 13:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683637220;
        bh=/gNuNjyjzD94LeQPPBnUSbLHlkRpw/7XLI3M8KSY0B8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qHeYapALQh/WPbieIv0prg07vJ/QNowDSaROx28vil1Kr/9Fl2ayv8WSHG63XePea
         GaKQ03lvXRMUya1mEwnOmBWwwXG2WbtgIKm6f7YWQTlp4SIrFQTwc3e7WNvb5b1Oak
         9cE80UU45ZYo3SKZp1iqT4ThmLAE7UCZhX7Bm8EGRyzR/Zu4kJutfAh1oJxsYoc3uF
         mkJD+NcGKbFucI/QNOHZG3rRXH/IMMYFNkKCgqA15Zz6IGOOfS43lezGIPTppWZTOt
         ZRAOMvwGv+QqT6zFoUGpo5q1N0C1rc2WLmIemAi1QeHbvdja9seddcfXaEg/6MqR8G
         0YL8mjCYiM/OQ==
Date:   Tue, 9 May 2023 18:30:16 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org,
        Madalin Bucur <madalin.bucur@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linuxppc-dev@lists.ozlabs.org,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v14 06/15] clk: Add Lynx 10G SerDes PLL driver
Message-ID: <ZFpD4I2LK9YIQQat@matsya>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
 <20230413160607.4128315-7-sean.anderson@seco.com>
 <ZFi9t84UoIfUyHhi@matsya>
 <1012f955-180e-0013-cc13-1da10991b5f5@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1012f955-180e-0013-cc13-1da10991b5f5@seco.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08-05-23, 11:31, Sean Anderson wrote:
> On 5/8/23 05:15, Vinod Koul wrote:

> >> +int lynx_clks_init(struct device *dev, struct regmap *regmap,
> >> +		   struct clk *plls[2], struct clk *ex_dlys[2], bool compat);
> > 
> > so you have an exported symbol for clk driver init in phy driver header?
> > can you please explain why..?
> 
> So that it can be called at the appropriate time during the phy's probe function.
> 
> This is really an integral part of the phy driver, but I was directed to split it
> off and put it in another subsystem's directory.

That is right clock should be belong to clk driver. IIUC the hardware is
phy along with clocks and you are doing the clk init. I think that may
not be correct model, you should really have a device tree node to
represent the clock and the phy node


What stops this from being modelled as it is in the hardware?

-- 
~Vinod
