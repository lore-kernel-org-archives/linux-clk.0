Return-Path: <SRS0=6ucw=AG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAEABC433DF
	for <linux-clk@archiver.kernel.org>; Thu, 25 Jun 2020 00:45:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94DEE207DD
	for <linux-clk@archiver.kernel.org>; Thu, 25 Jun 2020 00:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593045924;
	bh=qZMq5gJSej3TYdXnXDxd78oe5ecr2fgkTSwTAEMkuXc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=gLqMZ9hOU9iQPsbZxqAqbQEkNUz2ndjXQ6kfhWBmbPVv8KQSwN9o5NWOY+SynADpJ
	 JuQRebFSmABUIGoE9OGJm0v0nsvecD0bFU2b5HULSvB2mp6hGagATlPydw5/ph9HI2
	 YtruaB1HM2gUEE7m+olMLzL7NWO5hR0ATGo30XnU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388795AbgFYApY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Jun 2020 20:45:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:59196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388776AbgFYApX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 24 Jun 2020 20:45:23 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 29C2A20836;
        Thu, 25 Jun 2020 00:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593045923;
        bh=qZMq5gJSej3TYdXnXDxd78oe5ecr2fgkTSwTAEMkuXc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=zQpxE6iCA2BvzNrf0GH6ywRl7/vLEG/6S6b+e5zXF94XFDBzFrZZMjto3Li2WafQT
         Bl3pU92oe3t6vjLjUbB+l8FQwy5j3Ou2lizezhPi58pSeUHytCpDb8qp641NZ9eZcq
         RbFhePXzlXeh1UOA9WHe3/s85ipiZq7T3dTUqPeo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <fdc21962fdc7de5c46232f198672d5d5c868ec74.1592210452.git-series.maxime@cerno.tech>
References: <cover.98f979c2af2337c57217016d21d7c68e1ac2ce8a.1592210452.git-series.maxime@cerno.tech> <fdc21962fdc7de5c46232f198672d5d5c868ec74.1592210452.git-series.maxime@cerno.tech>
Subject: Re: [PATCH v5 17/27] clk: bcm: rpi: Split pllb clock hooks
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
Date:   Wed, 24 Jun 2020 17:45:22 -0700
Message-ID: <159304592256.62212.16244414120435895037@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2020-06-15 01:40:57)
> The driver only supports the pllb for now and all the clock framework hoo=
ks
> are a mix of the generic firmware interface and the specifics of the pllb.
> Since we will support more clocks in the future let's split the generic a=
nd
> specific hooks
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: linux-clk@vger.kernel.org
> Acked-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Tested-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Applied to clk-next
