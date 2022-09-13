Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8124EC6FA82
	for <linux-clk@archiver.kernel.org>; Tue, 13 Sep 2022 18:26:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbiIMS0x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Sep 2022 14:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbiIMS0h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Sep 2022 14:26:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F53CE65;
        Tue, 13 Sep 2022 10:44:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D25FEB80DCB;
        Tue, 13 Sep 2022 17:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F17C433C1;
        Tue, 13 Sep 2022 17:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663091066;
        bh=Ic/VkqMBJjuwfLGWBGT9Tc39hmFMScQMkwunOI94tFg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s+TnU1vRb4T4DpJ4MIOfOPek8KCXQfe40HKcXuHkrBy6QlKdSFLWBh5YjDmpBYcHk
         j3mjBOlBTBtLGLBkmY1S3AV0gdH3aAZFXxh6FDsc356KBPDYsei9Qoyk8H8b37YKrO
         tVPdf7x3Huor0YjmmZfStaszdLNY4O74zjlApywWRd4oJqsbKIrdmh83CMqXO5F6hM
         pBpUEFCzHHMCLzq1dLznJo9pHMDFeLYSNUI6F0NbN5LdqerPH0GXVj2zXxvgWHK8Kc
         CzCdauMR9GiXuBgBwkfryDFPs3URk4JSrkNKfko8VsFqxDdYSmWSBKj1O89erfUzD9
         57HUZKWlJy32w==
Date:   Tue, 13 Sep 2022 23:14:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Li Yang <leoyang.li@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 0/8] phy: Add support for Lynx 10G SerDes
Message-ID: <YyDBdn+IHqConzIW@matsya>
References: <20220902213721.946138-1-sean.anderson@seco.com>
 <de50858e-0056-fd72-2b67-27bf597b3366@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de50858e-0056-fd72-2b67-27bf597b3366@seco.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09-09-22, 11:05, Sean Anderson wrote:

> 
> I noticed in patchwork [1] that this entire series is marked as "Changes
> Requested," despite having received only automated feedback on one patch
> in the series. I am concerned about this because last time this occurred
> [2], the series received no feedback for a month. I suspect this is
> because series marked "Changes Requested" are hidden in patchwork by
> default. Can you change the status of this series back to new? Or should
> I just resend again?

Yes please, update with ack collected any feedback addressed would be
right...

> [1] https://patchwork.kernel.org/project/linux-phy/list/?series=673741&state=*
> [2] https://patchwork.kernel.org/project/linux-phy/list/?series=665484&state=*

-- 
~Vinod
