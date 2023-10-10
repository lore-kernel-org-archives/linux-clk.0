Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8EECD68E3
	for <linux-clk@archiver.kernel.org>; Tue, 10 Oct 2023 03:07:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379411AbjJJDH3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Oct 2023 23:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379409AbjJJDH2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Oct 2023 23:07:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A23C93;
        Mon,  9 Oct 2023 20:07:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE737C433C7;
        Tue, 10 Oct 2023 03:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696907245;
        bh=ShI5v88r+6uLa8HgLKlpe/Nm7sSNlAVHWw6lOSglagM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GEhYpjc8o6DZKmpiLMT0gcpZ5pwn5mHQiAeoqqYomKTyCDy/Orpzt/bhBanFw1/Z8
         b3+HM/lDlInfN4Pq3DAROqvq9yByed0W+J6vtR+aJeNtzvhkSa16zJAmeBNYWIRHVl
         hFINtjreOZhdOnnu7/yRITT9Dd+1YX6bl4Y92/Nx+pn3qlh6vkeb1Hya2JtzekAbG8
         Sk9jTcOE19UMUvmLPpNLnIBSItFSLwaxLAn9T54DJ60X4m/UD5Ck7y5AWByYp4WKGz
         J7fiUnOeA7Kqo7IdX80g7mU+n1jcToSTCvbbCdzsSdrEOOTs0EToJ0a+QuNw4OIr3H
         vKE3NbFISkFZQ==
Message-ID: <81048d31c880485752bdce90a04e5aef.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1695985912.git.geert+renesas@glider.be>
References: <cover.1695985912.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.7
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 09 Oct 2023 20:07:23 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2023-09-29 04:17:57)
>         Hi Mike, Stephen,
>=20
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d=
1d:
>=20
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.7-tag1
>=20
> for you to fetch changes up to 87882525e5ddae7ef6f1b1df5e1eda9bcbcd7720:
>=20
>   clk: renesas: r8a7795: Constify r8a7795_*_clks (2023-09-26 09:38:00 +02=
00)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
