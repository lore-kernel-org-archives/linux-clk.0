Return-Path: <SRS0=9teh=XN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D535CC4CEC9
	for <linux-clk@archiver.kernel.org>; Wed, 18 Sep 2019 05:08:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E5B721848
	for <linux-clk@archiver.kernel.org>; Wed, 18 Sep 2019 05:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568783317;
	bh=N9tRAMUMCiqF7p5Ce3VLjwSCnPeSUk+XVnO8tgfFPM4=;
	h=In-Reply-To:References:Cc:To:From:Subject:Date:List-ID:From;
	b=tz7x4fia5e1yIIP2LfebDdrywYK6meGKMlLWwejNR78+PTrIPIs0q3JRSSdkrwbs4
	 90xE8d4em3NTCzSwrMN0VoFIC7VtGmv7kb3+OcJl34zd+FEzJK/KO2Zz/RS6e6rhiQ
	 pAaxjBGB1dJfvMeyX+9r0AOM9OyYhOiJULxIy6QM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbfIRFIh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Sep 2019 01:08:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:45438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727152AbfIRFIh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Sep 2019 01:08:37 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7FDDD214AF;
        Wed, 18 Sep 2019 05:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568783316;
        bh=N9tRAMUMCiqF7p5Ce3VLjwSCnPeSUk+XVnO8tgfFPM4=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=wgHAjl+OJ/fgJ46dqBwcFmnKI3sAl3wNe08B/567yXZLzkyNeQdEEikFRPIr8g3Fy
         t56hnbGVFTCDg0Wh5ATYkp37oLBss4wQ4zI9snarHBIJ5M/KMYHjQwlhAnjPXm+qPz
         7FY7pxQZ4g9AZ/nOYUC5umEFmBtLjueHLZGQarM0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190805100310.29048-6-miquel.raynal@bootlin.com>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com> <20190805100310.29048-6-miquel.raynal@bootlin.com>
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
Subject: Re: [PATCH 5/8] clk: mvebu: ap806: be more explicit on what SaR is
User-Agent: alot/0.8.1
Date:   Tue, 17 Sep 2019 22:08:35 -0700
Message-Id: <20190918050836.7FDDD214AF@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Miquel Raynal (2019-08-05 03:03:07)
> "SaR" means Sample at Reset. DIP switches can be changed on the board,
> their states at reset time is available through a register read.
>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Applied to clk-next

