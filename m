Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873ACC3526E
	for <linux-clk@archiver.kernel.org>; Sat, 19 Dec 2020 19:54:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62F2322D01
	for <linux-clk@archiver.kernel.org>; Sat, 19 Dec 2020 19:54:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgLSTyW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Dec 2020 14:54:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:42276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727312AbgLSTyW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 19 Dec 2020 14:54:22 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608407622;
        bh=g9n/CKHgaGisC/odl88GOw8iGZBnmnrtpTcKlMPkSrc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eEJkiQutQLLXBIH6gedBifzksJL4iaZ4A9L07l8o/UiPdG/7iTX4VuZWZuetU6WW/
         b1lKIuTCy3diRC+LoBK+KCjwAx0OTYJU6Q9acBqYk8DgSwjS/q5JfxJ5cR0r8nzbwk
         bZBP885TbgEmMhWiVBUNOe1sAlNK9zIliBg8je3RvYHM4SD+7apAYyOdgO9EqKaFCx
         NQaB8R2C+V/fRo6aigNmPth4tQbE9UpEa+BIHRcWp4FT5rH7ZPy7hFtEvvzH691GRp
         13fAjnBxOmu8X/w9d0NyU/kcClTKi0AJ6dEu9xkLmSDU+V5PLxGdSXcoaad+gf7Ekb
         jMY2ur2IQTffg==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1605800597-16720-5-git-send-email-claudiu.beznea@microchip.com>
References: <1605800597-16720-1-git-send-email-claudiu.beznea@microchip.com> <1605800597-16720-5-git-send-email-claudiu.beznea@microchip.com>
Subject: Re: [PATCH v6 04/11] clk: at91: clk-master: add 5th divisor for mck master
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        mturquette@baylibre.com, nicolas.ferre@microchip.com,
        robh+dt@kernel.org
Date:   Sat, 19 Dec 2020 11:53:40 -0800
Message-ID: <160840762080.1580929.15718973910513536158@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2020-11-19 07:43:10)
> From: Eugen Hristev <eugen.hristev@microchip.com>
>=20
> clk-master can have 5 divisors with a field width of 3 bits
> on some products.
>=20
> Change the mask and number of divisors accordingly.
>=20
> Reported-by: Mihai Sain <mihai.sain@microchip.com>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---

Applied to clk-next
