Return-Path: <SRS0=WVnq=BD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36754C433E0
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jul 2020 09:22:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 110242074F
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jul 2020 09:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595582548;
	bh=9tPh3btI6by0aK62uud8rAfohfOuysh731MEj7sejn8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=OxiuHQk/jy2jklNHYOHhtQd8uEDQeXBmY35dj3X+H7aoixKLpjrhtcY1jpHxPYCFr
	 SIyv+5PVp7a/VZd1C4Sz4EO1pSLK9YfAwUg8sJPb71TiNrDb6PsG5sIwalBVVOuhlC
	 K4ajqpCoZAfrmq32qNNvpIoAnefa+wsMvF2xDS2g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727971AbgGXJW1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jul 2020 05:22:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:52828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726572AbgGXJW1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 24 Jul 2020 05:22:27 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A67020674;
        Fri, 24 Jul 2020 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595582547;
        bh=9tPh3btI6by0aK62uud8rAfohfOuysh731MEj7sejn8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Pjvn025j6/ENiK40+wMztPDg32q8wY6dI+nKO4v1gssjy/U3OV0TmOUHkk9RgHOjQ
         OOgueNOUtqY6JsqRlzGnoC0imUP5AuYBrmwQgXtSUiZwT1eeQ1u62Ic5YFk2wF6ffb
         9LmD2e6H5Blzip/0kwtHywg1xiSZ2nf1W63v6ASM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1595403506-8209-17-git-send-email-claudiu.beznea@microchip.com>
References: <1595403506-8209-1-git-send-email-claudiu.beznea@microchip.com> <1595403506-8209-17-git-send-email-claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 16/18] clk: at91: clk-sam9x60-pll: re-factor to support plls with multiple outputs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bbrezillon@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        mturquette@baylibre.com, nicolas.ferre@microchip.com
Date:   Fri, 24 Jul 2020 02:22:26 -0700
Message-ID: <159558254661.3847286.7842791848340220486@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2020-07-22 00:38:24)
> Some of the SAMA7G5 PLLs support multiple outputs (e.g. AUDIO PLL).
> For these, split the PLL clock in two: fractional clock and
> divider clock. In case PLLs supports multiple outputs (since these
> outputs are dividers (with different settings) sharing the same
> fractional part), it will register one fractional clock and multiple
> divider clocks (dividers sharing the fractional clock).
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---

Applied to clk-next
