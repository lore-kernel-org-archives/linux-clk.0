Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F0FC3526E
	for <linux-clk@archiver.kernel.org>; Sat, 19 Dec 2020 19:54:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88E76227BF
	for <linux-clk@archiver.kernel.org>; Sat, 19 Dec 2020 19:54:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727893AbgLSTyk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Dec 2020 14:54:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:42422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727856AbgLSTyk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 19 Dec 2020 14:54:40 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608407628;
        bh=5yoqkI9fhDMuYeOnuHEQbw+uh68RXOBtwDqanl8AKrc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=l/TirsqEUZ3GSqIslwlcsalLwgTeCTa7mCbImn+2IVf1bFRi+AXlkQ9h7fa68F6SM
         i2x6tUejRWIfmmKFy5iK8EXtlkxGloQwMK6OHoa2UGa9hO2PubUBg6NxDshjOX0tpV
         OLMTqfb9ocZec7l2PiFbUA+UsJPkrwmJ6kD27DtaBGA4PQzCS3cPsHKEQvNh2ibcbF
         ha8zcw668qVViOU/ey3EIPzCBXd14kcEOewy6rGkqH224elpmS4qfhK4PXxqch+/Z3
         B374FitdySUsmLM8n7NUPsrC3pewJiEmC7zeNqM7omnlcWMcm/SsR7ZGiqf6pHC2F9
         zXO/hzRCq0s1A==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1605800597-16720-6-git-send-email-claudiu.beznea@microchip.com>
References: <1605800597-16720-1-git-send-email-claudiu.beznea@microchip.com> <1605800597-16720-6-git-send-email-claudiu.beznea@microchip.com>
Subject: Re: [PATCH v6 05/11] clk: at91: sama7g5: add 5th divisor for mck0 layout and characteristics
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        mturquette@baylibre.com, nicolas.ferre@microchip.com,
        robh+dt@kernel.org
Date:   Sat, 19 Dec 2020 11:53:46 -0800
Message-ID: <160840762680.1580929.5437501377794696803@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2020-11-19 07:43:11)
> From: Eugen Hristev <eugen.hristev@microchip.com>
>=20
> This SoC has the 5th divisor for the mck0 master clock.
> Adapt the characteristics accordingly.
>=20
> Reported-by: Mihai Sain <mihai.sain@microchip.com>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---

Applied to clk-next
