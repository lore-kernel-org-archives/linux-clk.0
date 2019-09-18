Return-Path: <SRS0=9teh=XN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF454C4CEC9
	for <linux-clk@archiver.kernel.org>; Wed, 18 Sep 2019 05:08:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B33F21906
	for <linux-clk@archiver.kernel.org>; Wed, 18 Sep 2019 05:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568783313;
	bh=GbQITAwTpCsP94psLdA4o7c8mmrjDxtJr+uYxpnxMKM=;
	h=In-Reply-To:References:Cc:To:From:Subject:Date:List-ID:From;
	b=DBwpelOiQaJhtuYD5mGw5qxre8MI2Ut1z4myDOKzVW8o2NZvgD8KdPsBMR1L7BBTm
	 kMirWcbFcVxiQDVmkWTXIAoP3Mq1NH2qwQJ84mHSypxK/MDAGH3ZXBYaIVbBua40gA
	 9/LwoYWK1fAjx/QYEYFts+oYiZlP5Wz74Envc11w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727190AbfIRFId (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Sep 2019 01:08:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:45364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727152AbfIRFId (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Sep 2019 01:08:33 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 67581214AF;
        Wed, 18 Sep 2019 05:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568783312;
        bh=GbQITAwTpCsP94psLdA4o7c8mmrjDxtJr+uYxpnxMKM=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=jraNnsqlY8D+HaLG0WVU5EnNvPMkWCsts6223WNXhGBU1+vmryznfQorIKCZCudJw
         s/e7crniwQ6gwwH71O4APMIm/j/24v4MfkEdgRyG79M1Vg78f24W7u0fl1zQesfhSf
         JP4jgnSt1iWSHziGblbngUwuxtXbsJsI1lerDg14=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190805100310.29048-5-miquel.raynal@bootlin.com>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com> <20190805100310.29048-5-miquel.raynal@bootlin.com>
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
Subject: Re: [PATCH 4/8] clk: mvebu: ap80x-cpu: add AP807 CPU clock support
User-Agent: alot/0.8.1
Date:   Tue, 17 Sep 2019 22:08:31 -0700
Message-Id: <20190918050832.67581214AF@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Miquel Raynal (2019-08-05 03:03:06)
> From: Ben Peled <bpeled@marvell.com>
>=20
> Enhance the ap-cpu-clk driver to support both AP806 and AP807 CPU
> clocks.
>=20
> Signed-off-by: Ben Peled <bpeled@marvell.com>
> [<miquel.raynal@bootlin.com>: use device data instead of conditions on
> the compatible]
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Applied to clk-next

