Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576DBC4361B
	for <linux-clk@archiver.kernel.org>; Thu, 17 Dec 2020 09:54:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C52F22D6E
	for <linux-clk@archiver.kernel.org>; Thu, 17 Dec 2020 09:54:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbgLQJyE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Dec 2020 04:54:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:43798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726983AbgLQJyE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 17 Dec 2020 04:54:04 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608198803;
        bh=dnnvvYuG5TArejfyaSK2BovR1Ocojy32OV7AUh5FnlY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rOfRWqBB6yL6gCshCmh4ZJTdS9i0sMAuVI8akRvktqWUyKTrQQo5ylIpuTOzAgTi5
         ldr6wl2o60yI0bAk55A/eZrnN+FIZ2seVGNHE2t46AN69dXyKCi0JdptdSZO13XnkQ
         iuOQNyTgRDCPHWI+wFQ2/ltvyvnsel5aGKLnD0SgCCFks4KwKadlU/2JQwyVb29+V+
         h6E+4sS0hQbnYQiLLP03xYjGAAfF1RFviMOdyPhaarVQfwqoEl15SKkUdS/Ed7UWeU
         03w2dpOOkYBc7Sd9KXZa9pyobNCWPcFLWUEb/+HnmaCSUN206YmrEFQKymjLxGXyBf
         GF0CnoIZB8cNw==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201203074037.26940-2-alexandru.ardelean@analog.com>
References: <20201203074037.26940-1-alexandru.ardelean@analog.com> <20201203074037.26940-2-alexandru.ardelean@analog.com>
Subject: Re: [RESEND PATCH 2/2] clk: axi-clkgen: move the OF table at the bottom of the file
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, mdf@kernel.org, lars@metafoo.de,
        ardeleanalex@gmail.com,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 17 Dec 2020 01:53:22 -0800
Message-ID: <160819880240.1580929.8107081872151170089@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alexandru Ardelean (2020-12-02 23:40:37)
> The change is mostly cosmetic. No functional changes.
> Since the driver now uses of_device_get_match_data() to obtain some driver
> specific info, there is no need to define the OF table before the probe
> function.
>=20
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---

Applied to clk-next
