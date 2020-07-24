Return-Path: <SRS0=WVnq=BD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20ADEC433E3
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jul 2020 09:25:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F02C920674
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jul 2020 09:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595582708;
	bh=hr1lzVQwvZa/ffCgXI+siSvs8/fHom8ursNzlP7K2lg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=cd9rBphb8o9d/eRDRCsVHC2gK5EC7CqIX1WXIXMHcnC07faxxQCsvPxX7fdmMKplt
	 iInX3mqb3OCiUsfQeP4K2aWwNAmH2lnYkNANE56gaEefZNW6amjbChhEtXMeTtL2x1
	 WCY5xm+x8BwdrQCCYAfsNcAeJm9LjsKVSqYo6mig=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgGXJZE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jul 2020 05:25:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:54328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726572AbgGXJZE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 24 Jul 2020 05:25:04 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C78742063A;
        Fri, 24 Jul 2020 09:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595582703;
        bh=hr1lzVQwvZa/ffCgXI+siSvs8/fHom8ursNzlP7K2lg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=0gr1eSOGYBp1Vikurdn0O0SaVca1qIfWyOTWiyAM6lD4iyzL4JEfMmmosY1h19zsZ
         dyyTFfFB5bbzybd1aoUgrsdAa1Xv4JNnT8FlO0/IjlN5az8ecNlHiP3hqw1WCH/uEJ
         hWd7H2RRJ+YQnxIBvCXatTiJmcPDutfIb6Q2Yd7M=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200703073236.23923-1-a.fatoum@pengutronix.de>
References: <20200703073236.23923-1-a.fatoum@pengutronix.de>
Subject: Re: [PATCH] clk: at91: fix possible dead lock in new drivers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Date:   Fri, 24 Jul 2020 02:25:03 -0700
Message-ID: <159558270306.3847286.15644620940013309349@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Ahmad Fatoum (2020-07-03 00:32:35)
> syscon_node_to_regmap() will make the created regmap get and enable the
> first clock it can parse from the device tree. This clock is not needed to
> access the registers and should not be enabled at that time.
>=20
> Use device_node_to_regmap to resolve this as it looks up the regmap in
> the same list but doesn't care about the clocks. This issue is detected
> by lockdep when booting the sama5d3 with a device tree containing the
> new clk bindings.
>=20
> This fix already happened in 6956eb33abb5 ("clk: at91: fix possible
> deadlock") for the drivers that had been migrated to the new clk binding
> back then. This does the same for the new drivers as well.
>=20
> Fixes: 01e2113de9a5 ("clk: at91: add sam9x60 pmc driver")
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---

Applied to clk-next
