Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F3FC432BE
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 04:26:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40C7C608FE
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 04:26:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbhH2E1A (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 00:27:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:44510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229534AbhH2E07 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Aug 2021 00:26:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 569666056B;
        Sun, 29 Aug 2021 04:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630211168;
        bh=Vb285kp+zmf7wFywDXzvgbCEOGGzpWQ8A4n2t83hQfU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=W+LQszqjCa+sfnOI1t2yYIn3d/Q5IGaNb5F8KYCOXs1HrtuHPZ2eqb4+17VOx7ItF
         D/zC2VOftCmAp5EF5U39vICLj+CuuGZGR5H7JVEOvNzveZms3mSsTH+sZQPnXCPdIO
         QlXZzI2VgyQsTON6FtTnjkzjbJB0ouWuutBm38HTl40XmnI9CU0WRjeCy4wS46G27F
         SvJaUWC/dTqdncdZATBUG+AbMH6oMiB0qUUMUEQz9ESWnHSb9DvqqSiFOjM45f2NYd
         jWxu6ePZH/dpFROsSQHLHiGyPDNoF9zLH6ZGCZp7qPTMOUeUV/eMMWWdi7SdYp9t/J
         AeBxLRXCkMTSw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210818065929.12835-2-shubhrajyoti.datta@xilinx.com>
References: <20210818065929.12835-1-shubhrajyoti.datta@xilinx.com> <20210818065929.12835-2-shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH 1/3] clk: zynqmp: Check the return type
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, michal.simek@xilinx.com,
        git-dev@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org
Date:   Sat, 28 Aug 2021 21:26:07 -0700
Message-ID: <163021116718.2676726.11392120047712660459@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2021-08-17 23:59:27)
> Currently the return value of of_clk_add_hw_provider is ignored.
> lets check and return value.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---

Applied to clk-next
