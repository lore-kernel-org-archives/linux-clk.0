Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF6AC6FD1D
	for <linux-clk@archiver.kernel.org>; Tue, 21 Mar 2023 23:54:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbjCUXyH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Mar 2023 19:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjCUXyD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Mar 2023 19:54:03 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE0D24BE7;
        Tue, 21 Mar 2023 16:53:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 8547DCE1B99;
        Tue, 21 Mar 2023 23:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A5DC433D2;
        Tue, 21 Mar 2023 23:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679442827;
        bh=Se62AcjZEbRL9aU/OO95SPGgaa/PfL/hcFXxxs6W4G0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FI/d6pDxJ6Idr3dco1XDBXPi+ZyFLwVSffYeTmO4Sz2ph24n2fKyyK+mIswHebjd7
         qlXoewwBY+hl9zSL6FaBZj/7SN6WIZr8EsVG4CWlNa2grbCLjekWETUfvsLgKSPxUP
         uJN895g8tIv7+QzFBzXW2xODVquAYWMh9Bdvko40hSqQPi1B3ygQvSWorYnFy6sBYp
         b2dRSBAdNbT7a+hwfXUcCZvA9TwHL4wNUARwsunBN6cEXX4WOXSB3Yk1VeprVbMsyY
         Jc5GCEIgTL2i8WeF6KnsV5LyqYOOZz805tq/3jxrpYmCm9e3CqG5dS4JuVXDLEJMNu
         mAcnDLj0svyyA==
Message-ID: <bb61577f0340b2d02497a76cbf14d6da.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221209152913.1335068-6-marpagan@redhat.com>
References: <20221209152913.1335068-1-marpagan@redhat.com> <20221209152913.1335068-6-marpagan@redhat.com>
Subject: Re: [PATCH 5/6] clk: socfpga: use of_clk_add_hw_provider and improve error handling
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marco Pagani <marpagan@redhat.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Dinh Nguyen <dinguyen@kernel.org>,
        Marco Pagani <marpagan@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 21 Mar 2023 16:53:44 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marco Pagani (2022-12-09 07:29:12)
> The function of_clk_add_provider() has been deprecated, so use its
> suggested replacement of_clk_add_hw_provider() instead.
>=20
> Since of_clk_add_hw_provider() can fail, like of_clk_add_provider(),
> check its return value and do the error handling.
>=20
> The return type of the init function has been changed to void since
> the return value was not used, and the indentation of the parameters has
> been aligned to match open parenthesis, as suggested by checkpatch.
>=20
> The err variable has been renamed rc for consistency.
>=20
> Signed-off-by: Marco Pagani <marpagan@redhat.com>
> ---

Applied to clk-next
