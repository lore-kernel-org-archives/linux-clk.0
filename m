Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0204C2B9F7
	for <linux-clk@archiver.kernel.org>; Wed, 26 May 2021 03:11:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF6796128B
	for <linux-clk@archiver.kernel.org>; Wed, 26 May 2021 03:11:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbhEZDMg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 May 2021 23:12:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:47070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231461AbhEZDMf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 May 2021 23:12:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BEEC6128B;
        Wed, 26 May 2021 03:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621998664;
        bh=N1BEo7o5BMwvjE2r9zfHshQckEwcjvZTPgSGzqrrPRY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=b4XMcUAQNqX3fNnW+EL660emzIgWN64xRm13uFVpFC2UMMY+5UAGsttpeT5X4tagr
         WaPUgIuAe+pDaP7uA3Rxc1lUeqNkmigzRJQ9a6VlCAYBeyQRRT122pVduD2dBHYFm9
         7QfwULBcj4w0zxlqA8gbrdBZP8seNPYts5xo/t+koIOy1fHGsgpiaRCtmCKUAS5KHd
         kaoUkl5PmWSD/CYHdJ800zLD69QL0fz2+52bCZvCYie+YHSUnQROkaJPti56aqjC8d
         ja/HlepTk2ujFouMhyBr6yCQWhrZUxJeiiUH+0s5F1HWFENbgbaa5PhUeMWsFlF/kP
         vGnugrkUMs3IA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210520073136.272925-1-jbrunet@baylibre.com>
References: <20210520073136.272925-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] clk: meson: axg-audio: improve deferral handling
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Date:   Tue, 25 May 2021 20:11:03 -0700
Message-ID: <162199866348.4130789.1317470297014925785@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2021-05-20 00:31:36)
> Use dev_err_probe() for clock and reset resources to indicate the deferral
> reason through sysfs when waiting for the resource to come up.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
