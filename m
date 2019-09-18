Return-Path: <SRS0=9teh=XN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 120B3C4CEC9
	for <linux-clk@archiver.kernel.org>; Wed, 18 Sep 2019 05:07:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF08021848
	for <linux-clk@archiver.kernel.org>; Wed, 18 Sep 2019 05:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568783241;
	bh=AYq1bJFja4lt02Y/VmcxlSyhNOODpLDigKrrc4QWh1Y=;
	h=In-Reply-To:References:Cc:To:From:Subject:Date:List-ID:From;
	b=f1R53GBP8V1M6VeKLyBWJp1YccnvbjwpY0+SPS0cjhuMtFxU28H9skLmbZXcSpHBq
	 kxL1iS2oMELbzUzYjm+l7QEtpj6e4wjzcNOVYEWoxoYeUaGlRqGAta2Cx3RPZhk/Zb
	 vRVOzBFM+yDVYeMr6uKUsE0eEaKB85389v3zs8E8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbfIRFHV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Sep 2019 01:07:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:44538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726444AbfIRFHV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Sep 2019 01:07:21 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B390B214AF;
        Wed, 18 Sep 2019 05:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568783240;
        bh=AYq1bJFja4lt02Y/VmcxlSyhNOODpLDigKrrc4QWh1Y=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=reeBtGDnD4wFUaw90KLD4NbqMbyl0Us8oWS+6DeDzdjydhbGjmT/j/3PRMN8suYWE
         XXgi6BUQcjiydSA/GMGW3TqseNSm2k5UcFjh8g7zuRMD+y7zxcsR+CSEq6bV1qfgtH
         nCNlczok034GBEMHOYdxnHFb53GTlAmGIQbArz04=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190805100310.29048-1-miquel.raynal@bootlin.com>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com>
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
        Miquel Raynal <miquel.raynal@bootlin.com>
To:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 0/8] AP807 clocks support
User-Agent: alot/0.8.1
Date:   Tue, 17 Sep 2019 22:07:19 -0700
Message-Id: <20190918050720.B390B214AF@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Miquel Raynal (2019-08-05 03:03:02)
> Hello,
>=20
> This is the first batch of changes (out of three) to support the brand
> new Marvell CN9130 SoCs which are made of one AP807 and one CP115.
>=20
> This clock series applies on top of Gregory's "AP806 CPU clocks" [1].
>=20
> [1] https://patchwork.kernel.org/cover/11038577/

Ugh I found this series stashed away and never merged to clk-next.

