Return-Path: <SRS0=lm+m=BA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD30C433E1
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jul 2020 08:01:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC02A22482
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jul 2020 08:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595318498;
	bh=jSPRnH7eEP1x8Pe4KIb515ID/InrBkcmbzx8jgqPjO8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=C4awzexMfCE3Awl0xc7gnefv6QTWbd0lxbTl3ajLsPvluQEav2X/tGp1zHTM+V4VL
	 Tjb2LZOelbWWfNlZYtKaKfvvA0ZTsREFNXIpeTq5VrrJgEGbBCC21SiBfAbyrh5UaY
	 dqs2ublhGbXgoQwAGBRcRwOBvDuJvYFTuMFZWobw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728638AbgGUIBi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jul 2020 04:01:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:37080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728536AbgGUIBi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 21 Jul 2020 04:01:38 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EE5FA20709;
        Tue, 21 Jul 2020 08:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595318498;
        bh=jSPRnH7eEP1x8Pe4KIb515ID/InrBkcmbzx8jgqPjO8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=e2P05u34HIAGFQWkicYhQ3GLDJlHwDZU3AJ03gInVljv+qlvVGcl7IfDRUzfyYEbX
         kNcRw1jCgFUPgeMh9bc8qwaQFXlxX91NBlMOaDyjC99ZRselsouLmE44Gq5SNr941u
         aPulq7zIZK+ZIbRP2IU3LZlK6hPV+6+O6L/My6a4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jr1tapis8.fsf@starbuckisacylon.baylibre.com>
References: <1jr1tapis8.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: updates for v5.9
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
To:     Jerome Brunet <jbrunet@baylibre.com>
Date:   Tue, 21 Jul 2020 01:01:37 -0700
Message-ID: <159531849724.3847286.18132175454334945320@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2020-07-17 02:55:51)
> Hi Stephen,
>=20
> Here are the amlogic clock changes for v5.9
> Business as usual - Please pull.
>=20
> Cheers
> Jerome
>=20
> The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c74=
07:
>=20
>   Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.9-1
>=20
> for you to fetch changes up to 2568528f55356a2f20f80a18244d3e235cbd2cab:
>=20
>   clk: meson: meson8b: add the vclk2_en gate clock (2020-07-09 11:37:44 +=
0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
