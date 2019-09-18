Return-Path: <SRS0=9teh=XN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805C9C4CEC9
	for <linux-clk@archiver.kernel.org>; Wed, 18 Sep 2019 05:08:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4DDF121906
	for <linux-clk@archiver.kernel.org>; Wed, 18 Sep 2019 05:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568783304;
	bh=M9Y+nq5gDqt2YGGe/deFpL2zjVaY37QLGq93MhUJI9I=;
	h=In-Reply-To:References:Cc:To:From:Subject:Date:List-ID:From;
	b=TTWjkF/fnRzS/gj5Jqxnm7qo3YXtwJ/9SwAa6v6w2keTiyNDdQMtVTeOOO/dh5fp+
	 X0FrnMMD5CmtLIqq5DyoMYqVAKNyd1tpAHytEavJghrUKC7ctE73RBexM/QekQYflH
	 B0XdygTYKXdjK/wlkKd1kWlRjUmyoeRXv7U+mDQs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbfIRFIY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Sep 2019 01:08:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:45184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727152AbfIRFIX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Sep 2019 01:08:23 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 43E8B214AF;
        Wed, 18 Sep 2019 05:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568783303;
        bh=M9Y+nq5gDqt2YGGe/deFpL2zjVaY37QLGq93MhUJI9I=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=HqLg3O/F2/89M4xxpKZ3dKXGXFLZERooM0wwem1Tbr2KPShWpfSQi/kvKRRNe3eZt
         wXbjsG0KYDDrAle+WGrmJZ05DPutQ0oSK3QZAKmDNRhuaKBtIpDxpx2lGigT1YXpmI
         vks45rYawggZReGesrX5tH3iqS4AcnP5HDBOXgsM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190805100310.29048-3-miquel.raynal@bootlin.com>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com> <20190805100310.29048-3-miquel.raynal@bootlin.com>
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
Subject: Re: [PATCH 2/8] dt-bindings: ap806: Document AP807 clock compatible
User-Agent: alot/0.8.1
Date:   Tue, 17 Sep 2019 22:08:22 -0700
Message-Id: <20190918050823.43E8B214AF@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Miquel Raynal (2019-08-05 03:03:04)
> Add AP807 clock compatible to the bindings.
>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Applied to clk-next

