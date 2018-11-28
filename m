Return-Path: <SRS0=nz6M=OH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68FCC43441
	for <linux-clk@archiver.kernel.org>; Wed, 28 Nov 2018 18:33:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 626EC206B6
	for <linux-clk@archiver.kernel.org>; Wed, 28 Nov 2018 18:33:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="apgNGCC2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 626EC206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726737AbeK2Fg2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 00:36:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:54620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726283AbeK2Fg2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 29 Nov 2018 00:36:28 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 106F920665;
        Wed, 28 Nov 2018 18:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543430034;
        bh=lv36Ff/OkRI8zNzBzeJhmuuWE71+FqmR0+S1CFgxiak=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=apgNGCC29bHUhrvfdpvyRDwlnUaVdCbTf5Gaubi2q0KcJIL3XfSQw4LgaJWFm1tH4
         rvC7caQ3A86lF/meLjUzh8roagIfObDnqxtlvrNhqHKWh+SikSzpfxDQR7MZ2U/oYl
         QHjq3PpCSxXRfb3peOTeEpc9+TZzIm1LROySH8Pg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181123085635.31067-1-geert+renesas@glider.be>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20181123085635.31067-1-geert+renesas@glider.be>
Message-ID: <154343003340.88331.9888843680619389201@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [git pull] clk: renesas: Updates for v4.21
Date:   Wed, 28 Nov 2018 10:33:53 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2018-11-23 00:56:35)
>         Hi Mike, Stephen,
> =

> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d=
2a:
> =

>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> =

> are available in the Git repository at:
> =

>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v4.21-tag1
> =

> for you to fetch changes up to eb38c119dd91c61de26f67050671a84064554f7d:
> =

>   clk: renesas: r7s9210: Add USB clocks (2018-11-13 09:58:51 +0100)
> =

> ----------------------------------------------------------------
> clk: renesas: Updates for v4.21
> =

>   - Add support for SDHI and USB clocks on RZ/A2,
>   - Add support for RPC (SPI Multi I/O Bus Controller) clocks on R-Car
>     V3M.
> =

> Thanks for pulling!
> =


Thanks. Pulled into clk-next. Plus I threw a sparse warning fix into the
pile.
