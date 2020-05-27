Return-Path: <SRS0=u/0O=7J=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B59FC433DF
	for <linux-clk@archiver.kernel.org>; Wed, 27 May 2020 06:49:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAA002078C
	for <linux-clk@archiver.kernel.org>; Wed, 27 May 2020 06:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590562141;
	bh=e/7In+HgkoO1mXBVUF9g204ShooYF92hAISZ5kUXuns=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=ZbbjGE/5f5ewRvIGdEzoxs4Tc7jM29tWIKgPHClYnMfDWLjwXTClX+q18p81H+23M
	 xVNF8BrxCS6OVKeTvDrrADAxIzKc4I+O8wBz9t7wO6X6Czk3h7G7k8j/E9fx1tR6/H
	 dSW/zq5l7CKnMvKWtWlJ4Fdc74oaLXf6A/PIkL9o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729059AbgE0GtA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 May 2020 02:49:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:32806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728611AbgE0GtA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 27 May 2020 02:49:00 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 049D920787;
        Wed, 27 May 2020 06:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590562140;
        bh=e/7In+HgkoO1mXBVUF9g204ShooYF92hAISZ5kUXuns=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=vCo++hyiXNJhkarIrlSfMjKSxASpGZXV/u51UMb1EXwusISY2T2QMCN9SusJ/FHU3
         GKsY/m7x3d6bPg6A9CwotXMkQFipUFxJZouiHp8EHZMGMJDsdWWPowiEjM0DE9HMJg
         0W33vB6Y9xKf0jbcDuzQ5AJ6+TPNc0vzT54m4qp0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3eda4a838ba441b5cd8daf59a7e5115172d82c97.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech> <3eda4a838ba441b5cd8daf59a7e5115172d82c97.1587742492.git-series.maxime@cerno.tech>
Subject: Re: [PATCH v2 09/91] clk: bcm: rpi: Make sure pllb_arm is removed
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     dri-devel@lists.freedesktop.org,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
To:     Eric Anholt <eric@anholt.net>, Maxime Ripard <maxime@cerno.tech>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Date:   Tue, 26 May 2020 23:48:59 -0700
Message-ID: <159056213937.88029.2975519351515271642@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2020-04-24 08:33:50)
> The pllb_arm clock was created at probe time, but was never removed if
> something went wrong later in probe, or if the driver was ever removed fr=
om
> the system.
>=20
> Now that we are using clk_hw_register, we can just use its managed variant

clk_hw_register()

> to take care of that for us.
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: linux-clk@vger.kernel.org
> Acked-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
