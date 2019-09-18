Return-Path: <SRS0=9teh=XN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCF8C4CEC4
	for <linux-clk@archiver.kernel.org>; Wed, 18 Sep 2019 05:08:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88AE821848
	for <linux-clk@archiver.kernel.org>; Wed, 18 Sep 2019 05:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568783331;
	bh=aphTbOeAyuYUZh5mSSRoZaZ88QxBnMyjJCXkfJWaEvE=;
	h=In-Reply-To:References:Cc:To:From:Subject:Date:List-ID:From;
	b=L598f08bOxEDNKtNEh338lBC0G0tGbCm2K0s+Vkdmxo6EoLAPsRoJQq/cZtFd8vl3
	 UERvSKledCv/MMFja8dmOYuK+uTtcaBuA+2KWtYcRsgjVjwXE7kAgr9EIM15+j+lhA
	 NNzhtysfwuWP/D3pQK3t5wv2SKLd/ODundy2dTw0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfIRFIv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Sep 2019 01:08:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:45704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727152AbfIRFIv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Sep 2019 01:08:51 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6BE59214AF;
        Wed, 18 Sep 2019 05:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568783330;
        bh=aphTbOeAyuYUZh5mSSRoZaZ88QxBnMyjJCXkfJWaEvE=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=CItcyzof0r59IiYG2jJVJJi7Qs/toXKHU3rUoEbG0KFU4+F5IfS6bm5VjQm/X1VmO
         mR2HLz1fDIus0I2wyP5ytoclrZzIPmr/TJO7UYuYOhPeU++OgKE/JMliScA6poi588
         V1oIuVcc6AbpBLXpQ2Ms/J4WGRZ9lVzhLCWBqPVw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190805100310.29048-9-miquel.raynal@bootlin.com>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com> <20190805100310.29048-9-miquel.raynal@bootlin.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Stefan Chulski <stefanc@marvell.com>,
        Yan Markman <ymarkman@marvell.com>,
        Ben Peled <bpeled@marvell.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
To:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 8/8] clk: mvebu: ap80x: add AP807 clock support
User-Agent: alot/0.8.1
Date:   Tue, 17 Sep 2019 22:08:49 -0700
Message-Id: <20190918050850.6BE59214AF@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Miquel Raynal (2019-08-05 03:03:10)
> From: Ben Peled <bpeled@marvell.com>
>=20
> Add driver support for AP807 clock.
>=20
> Signed-off-by: Ben Peled <bpeled@marvell.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Applied to clk-next

