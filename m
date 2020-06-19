Return-Path: <SRS0=8Vdj=AA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A66C433DF
	for <linux-clk@archiver.kernel.org>; Fri, 19 Jun 2020 09:37:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52E662080C
	for <linux-clk@archiver.kernel.org>; Fri, 19 Jun 2020 09:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592559460;
	bh=vjTpSmnTmmOv94IpDmGtPP99GpL12wdAHsgrEGDpfS0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=eAzvNKlDs+sv2vYORkiqG21TjWxMOVmK6i+yCleNpB6kmfeS4lYc6kh92oVjF018c
	 exKR0qG8Zfny0IBKUmAlmgUxHFAl2sAd6xaw28mLV+C4wJFSMICgPxX98GO4PsTc9y
	 ct+aq70HevqBveivSSvSknA8QrvFtAz+tezpX2SI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730380AbgFSJhj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Jun 2020 05:37:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:50912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729195AbgFSJhj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Jun 2020 05:37:39 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BCE5120786;
        Fri, 19 Jun 2020 09:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592559458;
        bh=vjTpSmnTmmOv94IpDmGtPP99GpL12wdAHsgrEGDpfS0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=1AJE04JNn56TsdMVZm9vO6voR+upA/wknlpCNJt7942CxnqoZyzuJDDBKYjQDd4/l
         W3nDsaCvaAPbSzG66nwCLRZrfNfPhOMh1B+X/1dkby9154Iis2g0MHueQaVSQGfKcF
         ELh9n6NzhkWboj+yZ6Ecvq9fl/vk9HHNh04veKw4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.98f979c2af2337c57217016d21d7c68e1ac2ce8a.1592210452.git-series.maxime@cerno.tech>
References: <cover.98f979c2af2337c57217016d21d7c68e1ac2ce8a.1592210452.git-series.maxime@cerno.tech>
Subject: Re: [PATCH v5 00/27] clk: bcm: rpi: Add support for BCM2711 firmware clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>, devicetree@vger.kernel.org,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Date:   Fri, 19 Jun 2020 02:37:37 -0700
Message-ID: <159255945796.62212.5838238989498858379@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2020-06-15 01:40:40)
> Hi,
>=20
> Since the whole DRM/HDMI support began to grow fairly big, I've chosen
> to split away the two discussions between the firmware clocks and the
> HDMI support.
>=20
> Let me know what you think,
> Maxime

Do you want this to go through clk tree? Or looking for acks/review
tags?
