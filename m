Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CE0C54EBE
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 00:32:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232442AbjAMAck (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 19:32:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbjAMAcj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 19:32:39 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799CB60CC0;
        Thu, 12 Jan 2023 16:32:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0E3CC621D8;
        Fri, 13 Jan 2023 00:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5939BC433D2;
        Fri, 13 Jan 2023 00:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673569957;
        bh=D+CLx71N7hh+aMCrNFwner/r2ssmRTSXXThuDIxd478=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jY0ccoL8B48ZokoTeh5+PEtKN6kWxbJxS0xC7fk4NF+f0OyUPiKiZYDK/nOD14oid
         tLz7NLzF3Tx0Xwg9MEZaKi2SudIgyVHThZJfATddeqtW/zbtKYZKlEdKnn/oKOUiWO
         R/pgDXxWBTAeDYOJCK2j2rGbe+UOwXa26bbjOPXoTF2KxBtke+2UnxsnRHhmKn9O17
         uiBWTtjprisS5+XIq8dEjy4bdTZInkEdsQTnAWM9QBXTFwkd5z57v4Opxh/A9QzWx+
         y+TxrCELwlTHXPeWWjKpVnjYDdYmORSIanvLI1oB6z0tfPEy1vZIzjGuWMvCSydUIJ
         WnrJCnWZMKtkg==
Message-ID: <b19614d43df2dbd3614b9241d2c3cfc1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221225212632.2760126-1-martin.blumenstingl@googlemail.com>
References: <20221225212632.2760126-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1 0/4] clk: meson: switch from .round_rate to .determine_rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        jbrunet@baylibre.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org
Date:   Thu, 12 Jan 2023 16:32:35 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Martin Blumenstingl (2022-12-25 13:26:28)
> The goal of this series is to switch the meson sub-drivers to use
> clk_ops.determine_rate instead of clk_ops.round_rate. The former has
> lower precision (2^31 instead of 2^32 on 32-bit systems). Also the idea
> of the .determine_rate callback is that is replaces .round_rate so the
> latter can be removed at some point.
>=20
> No functional changes (apart from the 2^31 to 2^32 difference mentioned
> bove) intended.
>=20
>=20
> Martin Blumenstingl (4):
>   clk: meson: mpll: Switch from .round_rate to .determine_rate
>   clk: meson: dualdiv: switch from .round_rate to .determine_rate
>   clk: meson: sclk-div: switch from .round_rate to .determine_rate
>   clk: meson: clk-cpu-dyndiv: switch from .round_rate to .determine_rate
>=20

Acked-by: Stephen Boyd <sboyd@kernel.org>
