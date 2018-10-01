Return-Path: <SRS0=O2Xu=MN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E353FC43143
	for <linux-clk@archiver.kernel.org>; Mon,  1 Oct 2018 21:54:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A7D8E2145D
	for <linux-clk@archiver.kernel.org>; Mon,  1 Oct 2018 21:54:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vcW/ErKu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7D8E2145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbeJBEeG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Oct 2018 00:34:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:46734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725878AbeJBEeG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 2 Oct 2018 00:34:06 -0400
Received: from localhost (unknown [104.132.0.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6FF6B20666;
        Mon,  1 Oct 2018 21:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1538430853;
        bh=9mx6wu/2mId8TmBd9sgedZYAZSjVfMiaDfNktfTwqR8=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=vcW/ErKuVKiON/7lMFw8OWT0KBdJeZjZFlyhbnUXtR/wB4EmZAtr845UBt8tr0dvz
         XOoPfJjPKXLDUBJPcl/KmZm+1Qh4i0H1WVkLvmsHdPH1+u7hd3D+XqQ9OxG6XLGz0j
         V2AbI0qQxBEpRiOchkP2ocwJ4E1p9MDbgbpy6y98=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180928084139.20016-1-geert+renesas@glider.be>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20180928084139.20016-1-geert+renesas@glider.be>
Message-ID: <153843085275.119890.13438984066136473491@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [git pull] clk: renesas: Updates for v4.20 (take two)
Date:   Mon, 01 Oct 2018 14:54:12 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2018-09-28 01:41:39)
>         Hi Mike, Stephen,
> =

> The following changes since commit b30c862f2a72002c06df23d05c2ca6b49148c4=
d4:
> =

>   clk: renesas: r8a77990: Add missing I2C7 clock (2018-08-31 10:33:59 +02=
00)
> =

> are available in the Git repository at:
> =

>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v4.20-tag2
> =

> for you to fetch changes up to a53a28dca4124048c90b4a8de457668ede57e67c:
> =

>   clk: renesas: r7s9210: Add SPI clocks (2018-09-28 09:57:09 +0200)
> =

> ----------------------------------------------------------------
> clk: renesas: Updates for v4.20 (take two)
> =

>   - Add support for CMT timer clocks on R-Car V3H,
>   - Add support for SHDI and various timer clocks on R-Car V3M,
>   - Add support for the new RZ/A2 (R7S9210) SoC, including early clock
>     support for the Renesas CPG/MSSR driver,
>   - Add support for the new RZ/G1N (R8A7744) and RZ/G2E (R8A774C0) SoCs,
>   - Convert DT binding includes to SPDX license identifiers,
>   - Small fixes and clean ups.
> =


Thanks. Pulled into clk-next.
