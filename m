Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA10C38147
	for <linux-clk@archiver.kernel.org>; Wed, 18 Jan 2023 16:54:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbjARQyT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 11:54:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjARQyS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 11:54:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BE8B12F2A;
        Wed, 18 Jan 2023 08:54:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 33B9461913;
        Wed, 18 Jan 2023 16:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B17FC433D2;
        Wed, 18 Jan 2023 16:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674060855;
        bh=RwHJvl4D5qmGQjZIXVYvEbuBvPMGq9xo3Uzk+iCGGwQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L3K0/E6ZEJodJAoNLwcLbc/rvJf+WG7swxtU45xi7fxpLgd37pJeeBz8ZDP49BOyX
         ugB7XV3yn0792GxNeqf0B4Qb/IZr/oHxSsQt9HPpMSXoogsnjPDkI7DCG9Ja86XSu5
         tvFnjPoy+9Xti51EaWOiw0Bq33f9Ww25cQZKhLmxSwR1Wgii7jRpw0lHB2ofkbHIy+
         hvYQt/cRX6poxw7TLOFqy71oALwYz669q0DnD4lH4AAMZud9bEqv0bYP1nYqxSYrzX
         VBhbIXu0TzIDnW1504zyEt/RIjVqhp7xxiN2l7te08f8riYzS3naP0cf8I4k13NCNm
         dYFlSQkl5qOaA==
Date:   Wed, 18 Jan 2023 22:24:10 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, Li Yang <leoyang.li@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 00/10] phy: Add support for Lynx 10G SerDes
Message-ID: <Y8gkMlqfPZic7reK@matsya>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <0024c780-ff9c-a9d3-8773-28e6b21bcc43@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0024c780-ff9c-a9d3-8773-28e6b21bcc43@seco.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17-01-23, 11:46, Sean Anderson wrote:
> 
> I noticed that this series is marked "changes requested" on patchwork.
> However, I have received only automated feedback. I have done my best
> effort to address feedback I have received on prior revisions. I would
> appreciate getting another round of review before resending this series.

Looking at the series, looks like kernel-bot sent some warnings on the
series so I was expecting an updated series for review

-- 
~Vinod
