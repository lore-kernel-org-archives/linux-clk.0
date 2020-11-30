Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8043CC64E8A
	for <linux-clk@archiver.kernel.org>; Mon, 30 Nov 2020 09:22:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2389B20809
	for <linux-clk@archiver.kernel.org>; Mon, 30 Nov 2020 09:22:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HOxgezE/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726337AbgK3JVw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 30 Nov 2020 04:21:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:49576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbgK3JVw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 30 Nov 2020 04:21:52 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 297FB20825;
        Mon, 30 Nov 2020 09:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606728071;
        bh=JEwKhnYVOwUJKAXmLq5UT6BRurrdFLXxVfE3qdhqAeo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HOxgezE//B6a4Mgz/FlnTA2SAol1gpGVOrRNB4sQ2hX2+w0Y9o2V1f4NzefTpz5dM
         U7+SuDvpLYfW5CxzjtB4FLEI4ymvm8+AT21/055bw9TRzi4k3Ys69obag3Ss3+40RY
         n3hwXNt8eLzUzx2SDxJ2aNF77y5uBAbPxkrOj0Zs=
Date:   Mon, 30 Nov 2020 17:21:05 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Michael Walle <michael@walle.cc>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        "Y . b . Lu" <yangbo.lu@nxp.com>,
        Xiaowei Bao <xiaowei.bao@nxp.com>,
        Ashish Kumar <Ashish.Kumar@nxp.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v3 2/9] arm64: dts: ls1028a: fix FlexSPI clock input
Message-ID: <20201130092104.GB4072@dragon>
References: <20201108185113.31377-1-michael@walle.cc>
 <20201108185113.31377-3-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201108185113.31377-3-michael@walle.cc>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Nov 08, 2020 at 07:51:06PM +0100, Michael Walle wrote:
> On the LS1028A the FlexSPI clock is connected to the first HWA output,
> see Figure 7 "Clock subsystem block diagram".
> 
> Fixes: c77fae5ba09a ("arm64: dts: ls1028a: Add FlexSPI support")
> Signed-off-by: Michael Walle <michael@walle.cc>

Applied, thanks.
