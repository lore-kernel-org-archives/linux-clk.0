Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F15C61DA4
	for <linux-clk@archiver.kernel.org>; Wed, 15 Feb 2023 02:51:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232054AbjBOCvh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Feb 2023 21:51:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjBOCvg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Feb 2023 21:51:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22B2231E3E;
        Tue, 14 Feb 2023 18:51:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9F4B0619AC;
        Wed, 15 Feb 2023 02:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA47CC433D2;
        Wed, 15 Feb 2023 02:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676429495;
        bh=hRyigJaGI1OnqJ5TAZtMYDFjSp4uhphLpcroDkazujI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YFivFtMXFwclsMkYYYexeE7WH0MXNFIckBquVthxz9112rUKYY+Raubdi3+Dc7lrc
         R0ZaVFxrTYu5hXSkGIGR1uXvW/aS0niVENWc0sg7Zz4VOTSfh4aqBFAQJRQJBv5gVV
         3OUxZPcyl3Vat1o01a+oJLzwnFqZJFjOxWwBGt+y9SXo+2g2a6woRIFmrxEL0d2BxE
         tldm6YzsBkAEnb+xPMlGwZuQTPIMiLHTbn11rERvkLjMDb17zuvFKr+F9+PAATeiHj
         kO3W2GALp70XOieYggHUvBeMyOsS584Jgtrr64+zmD/0FOOYoiYofX/dmDH7USZctf
         R4DwLuEpeVa/w==
Message-ID: <d6cdc1328fca7475da20f139c16fd462.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1676278827.git.geert+renesas@glider.be>
References: <cover.1676278827.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.3 (take three)
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 14 Feb 2023 18:51:32 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2023-02-13 01:44:47)
>         Hi Mike, Stephen,
>=20
> The following changes since commit bd176e46e9c23f669b28630cc8f3fb1b89fd61=
0e:
>=20
>   clk: renesas: r8a779g0: Add CAN-FD clocks (2023-01-26 15:13:53 +0100)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.3-tag3
>=20
> for you to fetch changes up to b1dec4e78599a2ce5bf8557056cd6dd72e1096b0:
>=20
>   clk: renesas: rcar-gen3: Disable R-Car H3 ES1.* (2023-02-10 10:35:16 +0=
100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
