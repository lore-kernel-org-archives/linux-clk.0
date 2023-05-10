Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E99FC77B7C
	for <linux-clk@archiver.kernel.org>; Wed, 10 May 2023 21:28:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236072AbjEJV2L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 May 2023 17:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235902AbjEJV2L (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 May 2023 17:28:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D7552711;
        Wed, 10 May 2023 14:28:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BF43B640AD;
        Wed, 10 May 2023 21:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21865C433D2;
        Wed, 10 May 2023 21:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683754082;
        bh=2GyyXCow6WRLL3Eufl1je7mUXtfgSAGMQ/Y3xTOuzxs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZpPzJ653QgWl190a8hGaJXAt32az6HbzRwRsk1iz0c85juAd1e7HeT44Qsf6lZtGc
         PXHKo8/5MumSZu3pJLzQGhhlvK0bl1v81+UF/HjINsiLLwIWU21jIChKqbZ48EmjMf
         i+5Rz0PufRnOYfcb0Xn6yBpCCPWssnq1/iwSi8EkcpwL3Zu274rpneF+W8DKIEglKY
         0He1XwUTkDolW8Pi2yEQ1SKi8JbowTjGrPH9u0vefW8cY831zjJbmUHzDyKZ2GywYC
         KMFHyRbkLpo/gTSwukqVPS2pxXyLAS8s11X4lYmXP8fptF87MBierxLYHZhIKC4TQz
         JXwhOVxlVgj5A==
Message-ID: <8bb3a4b07d5f53c1c8cb23139c1a5456.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230507133906.15061-3-marek.vasut+renesas@mailbox.org>
References: <20230507133906.15061-1-marek.vasut+renesas@mailbox.org> <20230507133906.15061-3-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH 3/3] clk: rs9: Fix .driver_data content in i2c_device_id
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-renesas-soc@vger.kernel.org
To:     Marek Vasut <marek.vasut+renesas@mailbox.org>,
        linux-clk@vger.kernel.org
Date:   Wed, 10 May 2023 14:27:58 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2023-05-07 06:39:06)
> The .driver_data content in i2c_device_id table must match the
> .data content in of_device_id table, else device_get_match_data()
> would return bogus value on i2c_device_id match. Align the two
> tables.
>=20
> The i2c_device_id table is now converted from of_device_id using
> 's@.compatible =3D "renesas,\([^"]\+"\), .data =3D \(.*\)@"\1, .driver_da=
ta =3D (kernel_ulong_t)\2@'
>=20
> Fixes: 892e0ddea1aa ("clk: rs9: Add Renesas 9-series PCIe clock generator=
 driver")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

Applied to clk-next
