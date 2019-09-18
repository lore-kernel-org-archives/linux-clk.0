Return-Path: <SRS0=9teh=XN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C3CC4CEC9
	for <linux-clk@archiver.kernel.org>; Wed, 18 Sep 2019 05:08:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE943218AF
	for <linux-clk@archiver.kernel.org>; Wed, 18 Sep 2019 05:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568783321;
	bh=TsHmZdRjl8mDj2kqk/++qOzn2+7O6ohsLiHfYGe9u7w=;
	h=In-Reply-To:References:Cc:To:From:Subject:Date:List-ID:From;
	b=Pem7p8WvEdBmcG6YKrHArMvpR7vgrscx/e9/u0bXMmqPZgeNrvPFPWiFnDHJxDE54
	 PXGBpD7VxdaSSWpEVC/wCZLkrupOzcH5SRerODaxVLcIVmVtwQy0gDKjkw+kiD2Zsy
	 pxt9MT3ZnqKfbF+TEPGPYxmmldlhAoCZvabAtlKQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbfIRFIl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Sep 2019 01:08:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:45504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727152AbfIRFIl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Sep 2019 01:08:41 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0CEA214AF;
        Wed, 18 Sep 2019 05:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568783320;
        bh=TsHmZdRjl8mDj2kqk/++qOzn2+7O6ohsLiHfYGe9u7w=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=i5jcfp2riOfXwpxa1hqwR+CdTxV+N1d3nFZVSkMg0MHvtYAZybsaHZ1npSW0YU9VR
         I8eBgrBnYnS489ByPBQpEr/ZASpQwDxT5ZnjqzH3iuOGYvXz8YBxMC5pOcgcvz7yMa
         aG9p/xKIrhZqfDWHKRfP0/LRxfj4Xahjxo49akqY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190805100310.29048-7-miquel.raynal@bootlin.com>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com> <20190805100310.29048-7-miquel.raynal@bootlin.com>
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
        Omri Itach <omrii@marvell.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
To:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 6/8] clk: mvebu: ap806: add AP-DCLK (hclk) to system controller driver
User-Agent: alot/0.8.1
Date:   Tue, 17 Sep 2019 22:08:39 -0700
Message-Id: <20190918050840.B0CEA214AF@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Miquel Raynal (2019-08-05 03:03:08)
> From: Omri Itach <omrii@marvell.com>
>=20
> Add dynamic AP-DCLK clock (hclk) to system controller driver. AP-DCLK
> is half the rate of DDR clock, so its derrived from Sample At Reset
> configuration. The clock frequency is required for AP806 AXI monitor
> profiling feature.
>=20
> Signed-off-by: Omri Itach <omrii@marvell.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Applied to clk-next

