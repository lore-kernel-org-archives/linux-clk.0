Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5830EC00A8F
	for <linux-clk@archiver.kernel.org>; Tue, 24 Oct 2023 03:38:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbjJXDiv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Oct 2023 23:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbjJXDiv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Oct 2023 23:38:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39180B7;
        Mon, 23 Oct 2023 20:38:49 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8FE1C433C8;
        Tue, 24 Oct 2023 03:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698118728;
        bh=xinKZF7gQ6fnFF1wJ3HeENUjv5ikkykRN2jQu+EuQJY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=a7ImS2zH1XdVnvPAra1OedejZt+kVx5c/flpRjIPJPuFSiFPFK7G+NepTZD2KtYjY
         pynIiAmYjBfyPCXFH0j9+m7tGW16kJBvyL0vLRLkTYO60uZFqDzB5I530YSz/NgXnx
         QdNu7iSSPGRbjpn7yiFZ8ko3XIEXaA9v+nwKyrfN13A7lEgUa9BvedYgNahAcFiRqC
         TW1hBalKv6fPFok36TPHuCdArmspBf4+59hqkEp1ZXg+Y+AsNoD7O2Np/qR3L1/fDH
         yPbNkrFxxc6rY1A5PDEFXDKgIQhL+3s2/mU9jFKBDnlsziZa/dXcPv9NZfyYJ1Rdod
         mOzIbWViQo8MA==
Message-ID: <47616bcf9f17a2d8665767d9ada49f25.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231016113002.15929-2-jay.buddhabhatti@amd.com>
References: <20231016113002.15929-1-jay.buddhabhatti@amd.com> <20231016113002.15929-2-jay.buddhabhatti@amd.com>
Subject: Re: [PATCH RESEND 1/2] drivers: clk: zynqmp: calculate closest mux rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To:     Jay Buddhabhatti <jay.buddhabhatti@amd.com>, michal.simek@amd.com,
        mturquette@baylibre.com
Date:   Mon, 23 Oct 2023 20:38:46 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jay Buddhabhatti (2023-10-16 04:30:01)
> Currently zynqmp clock driver is not calculating closest mux rate and
> because of that Linux is not setting proper frequency for CPU and
> not able to set given frequency for dynamic frequency scaling.
>=20
> E.g., In current logic initial acpu clock parent and frequency as below
> apll1                  0    0    0  2199999978    0     0  50000      Y
>     acpu0_mux          0    0    0  2199999978    0     0  50000      Y
>         acpu0_idiv1    0    0    0  2199999978    0     0  50000      Y
>             acpu0      0    0    0  2199999978    0     0  50000      Y
>=20
> After changing acpu frequency to 549999994 Hz using CPU freq scaling its
> selecting incorrect parent which is not closest frequency.
> rpll_to_xpd            0    0    0  1599999984    0     0  50000      Y
>     acpu0_mux          0    0    0  1599999984    0     0  50000      Y
>         acpu0_div1     0    0    0   533333328    0     0  50000      Y
>             acpu0      0    0    0   533333328    0     0  50000      Y
>=20
> Parent should remain same since 549999994 =3D 2199999978 / 4.
>=20
> So use __clk_mux_determine_rate_closest() generic function to calculate
> closest rate for mux clock. After this change its selecting correct
> parent and correct clock rate.
> apll1                  0    0    0  2199999978    0     0  50000      Y
>     acpu0_mux          0    0    0  2199999978    0     0  50000      Y
>         acpu0_div1     0    0    0   549999995    0     0  50000      Y
>             acpu0      0    0    0   549999995    0     0  50000      Y
>=20
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> ---

Any Fixes tag here?
