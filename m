Return-Path: <SRS0=6ucw=AG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D33C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 25 Jun 2020 00:44:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6200F207DD
	for <linux-clk@archiver.kernel.org>; Thu, 25 Jun 2020 00:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593045891;
	bh=rTMjgv3e2KY32A0HY+yJItR7gx3EM/nUFwnySGIZHCg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=gqcvkaylrfSJ+FV24G8UM+Xxmvw/MKJxQfoplpQIcabQgXJGP8rq2CGinjzO+GD4L
	 J35d+0avZiLRIXRwfkSvFOEMVuuFzoxOewNCIVfF+TtveqM90NhY6RXREuYl7x5YlA
	 AbqZkTC047tQD4SFV7lYxz1+F5BYePemZjIiaC18=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388989AbgFYAou (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Jun 2020 20:44:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:58532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388987AbgFYAou (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 24 Jun 2020 20:44:50 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1AA312078D;
        Thu, 25 Jun 2020 00:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593045890;
        bh=rTMjgv3e2KY32A0HY+yJItR7gx3EM/nUFwnySGIZHCg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WSEIOnbWT9TI+ZJ3ehHyPX6RloSdO0C9HDdxGxISPEVMuHIyCI8vKiRIbs+lyEAyb
         WeniRInWBhbTMYWooJt1Qc8ee7EYmSIt1qMjWNpikK7TBtCf5OoZWKxoddt12n/qRN
         FdfqulGj+L2bEbWQvTmzTRe1OMGyaVjJoXqDEmkk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d4c53dab6de5d5f70743d9c139d0117589530e62.1592210452.git-series.maxime@cerno.tech>
References: <cover.98f979c2af2337c57217016d21d7c68e1ac2ce8a.1592210452.git-series.maxime@cerno.tech> <d4c53dab6de5d5f70743d9c139d0117589530e62.1592210452.git-series.maxime@cerno.tech>
Subject: Re: [PATCH v5 12/27] clk: bcm: rpi: Use CCF boundaries instead of rolling our own
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Date:   Wed, 24 Jun 2020 17:44:49 -0700
Message-ID: <159304588950.62212.14370493293554575629@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2020-06-15 01:40:52)
> The raspberrypi firmware clock driver has a min_rate / max_rate clamping =
by
> storing the info it needs in a private structure.
>=20
> However, the CCF already provides such a facility, so we can switch to it
> to remove the boilerplate.
>=20
> Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Tested-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Applied to clk-next
