Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B68EC433DB
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 08:03:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E692164E25
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 08:03:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbhBIIDN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Feb 2021 03:03:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:39528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229564AbhBIIDL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 9 Feb 2021 03:03:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B682164EAA;
        Tue,  9 Feb 2021 08:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612857750;
        bh=VP8ceEIvn1ysrhFp17x56L8iFwhfmAy/mrq9jhOUt3Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VeCNaeMg09GJ2/tA4WC1SvpfYBXilJBPZC4eJ0+Pfef6J1wEi3v75imdYcexj6ncm
         C9glmzicqjhRsJ6xf5G2ZK9W1dJY5Nv81r6s7splkQqSg7kMC4cE+ZkWBrj5noxrFG
         f2FyBLH1eVxmtWCBm7L3Hm17UZXuY9zDM5q6BF938pssyfywBYM+M+1yC/ZXTZu5AB
         vW7AXF3/n8YdASMkYhQgIIBX5fM9Jr3qnH3qjRQ0bS6gu/nEQmdmB8y2MDrzuwxXGr
         oCvc2N+eJ2APfznL/i9/JqnGteHDbwRb44H55WniKtTMz7JWZKdu1J8e8kpcHlWJDP
         vckbMQIRmtSkw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210125170819.26130-3-laurent.pinchart@ideasonboard.com>
References: <20210125170819.26130-1-laurent.pinchart@ideasonboard.com> <20210125170819.26130-3-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/2] clk: mediatek: mux: Update parent at enable time
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Phi-Bang Nguyen <pnguyen@baylibre.com>,
        linux-mediatek@lists.infradead.org
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-clk@vger.kernel.org
Date:   Tue, 09 Feb 2021 00:02:29 -0800
Message-ID: <161285774959.418021.15519651953415527868@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Laurent Pinchart (2021-01-25 09:08:19)
> The mux clocks don't always correctly take the new parent into account
> when the parent is updated while the clock is disabled. Set the update
> bit when enabling the clock to force an update of the mux.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Applied to clk-next
