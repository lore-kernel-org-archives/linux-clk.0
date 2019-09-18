Return-Path: <SRS0=9teh=XN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 747C9C4CEC9
	for <linux-clk@archiver.kernel.org>; Wed, 18 Sep 2019 05:08:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 41602218AF
	for <linux-clk@archiver.kernel.org>; Wed, 18 Sep 2019 05:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568783326;
	bh=lRSb3A3YnwGdnbdfkKS2tcl3uG83G1W3RLa50MybZQI=;
	h=In-Reply-To:References:Cc:To:From:Subject:Date:List-ID:From;
	b=m8pOPHYwOftpmR3uc27OgE+Pd2UTkj1CjJCK/mWrTrY3FVtXJ0p6w4veS3OkXA71K
	 fFarkNOyjHg5CCCwyJMTSPKFI1L9kEQgvlpfUHLFZbo5NAJs/EstKZmcX7WlY4m4Nn
	 ReVQF62EpOXWCaRTkYvvSoYhJYEcT8dtX5doCDTc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727206AbfIRFIq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Sep 2019 01:08:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:45598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727152AbfIRFIp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Sep 2019 01:08:45 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 35123214AF;
        Wed, 18 Sep 2019 05:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568783325;
        bh=lRSb3A3YnwGdnbdfkKS2tcl3uG83G1W3RLa50MybZQI=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=iGyC2LnMU+hBE9/ZTzfHr+K9WnPHzbI4Yyi8px/9CiTQvtiEd/RVq7U/oUpjeZeki
         rkMtr4d+ariiQb20BWVFZbummerCd7Mk9JewrDWGJY9xILM/tGDQU/hMNrG0tRlqRq
         d+FZTaDnkwCeemYRhO+NzetZSqpYWjb/9es2lrwQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190805100310.29048-8-miquel.raynal@bootlin.com>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com> <20190805100310.29048-8-miquel.raynal@bootlin.com>
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
Subject: Re: [PATCH 7/8] clk: mvebu: ap806: Prepare the introduction of AP807 clock support
User-Agent: alot/0.8.1
Date:   Tue, 17 Sep 2019 22:08:44 -0700
Message-Id: <20190918050845.35123214AF@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Miquel Raynal (2019-08-05 03:03:09)
> From: Ben Peled <bpeled@marvell.com>
>=20
> Factor out the code that is only useful to AP806 so it will be easier
> to support AP807. No functional changes.
>=20
> Signed-off-by: Ben Peled <bpeled@marvell.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Applied to clk-next

