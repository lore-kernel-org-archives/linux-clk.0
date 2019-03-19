Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C124C43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 19:44:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C3E520863
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 19:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1553024652;
	bh=dPpK2GZsgvw3VeUXID6bIJVQ/XVKm0pIUGrMBOe3ZRo=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=tfMPl/vqKhw/Xs6ZUls7uhuQkzI2n6uLvmAlghsqXi8LO58jx1W1eVXl57WtApjyj
	 d6A1Kr7YUwvwFobV34qmfqxBP/DwFpuPVDd8YW8ubbUfRRrmI4lJM5N1hUXtPYuj2H
	 hQXUB72OUaEMgHaJVsg8EhEJmeQqv4AvH3cTiAck=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbfCSToM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 15:44:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:53002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726944AbfCSToL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 19 Mar 2019 15:44:11 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 179542085A;
        Tue, 19 Mar 2019 19:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1553024651;
        bh=dPpK2GZsgvw3VeUXID6bIJVQ/XVKm0pIUGrMBOe3ZRo=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=p1RbnstWe/xD+diUa7zTEltFhBrdAM5rlLkCWbNjKYbf3GGporYg8ovQme50GDQVe
         UwNIOAOZ4VpfhK8LffWudOi3Hmvb6hWDb96w1dFlJ/x4yVsnHFzDSX6st1/PaT4U0/
         gq381TDsy96Mo4EeYTQUwF2N4T5c9pXF1HAkKALQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190318105045.26943-1-nicolas.ferre@microchip.com>
References: <20190318105045.26943-1-nicolas.ferre@microchip.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] clk: at91: fix programmable clock for sama5d2
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, matthias.wieloch@few-bauer.de,
        stable@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>
To:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-clk@vger.kernel.org
Message-ID: <155302465034.20095.18419682766528248325@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Tue, 19 Mar 2019 12:44:10 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Nicolas Ferre (2019-03-18 03:50:45)
> From: Matthias Wieloch <matthias.wieloch@few-bauer.de>
>=20
> The prescaler formula of the programmable clock has changed for sama5d2. =
Update
> the driver accordingly.
>=20
> Fixes: a2038077de9a ("clk: at91: add sama5d2 PMC driver")
> Cc: <stable@vger.kernel.org> # v4.20+
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> [nicolas.ferre@microchip.com: adapt the prescaler range,
>                 fix clk_programmable_recalc_rate, split patch]
> Signed-off-by: Matthias Wieloch <matthias.wieloch@few-bauer.de>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---

Applied to clk-fixes

