Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0ADAC433E6
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:36:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B2E364EA4
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:36:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhBICfx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 21:35:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:34112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230490AbhBICfu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 21:35:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD9B064EA4;
        Tue,  9 Feb 2021 02:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612838110;
        bh=5qu/xhlSreRd2PFlbGJs/cpafYlV/0HR646H9ZWAzK8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pOSKE+OqaAgEFjkKBdgiZswQMrKNQqkqaLX05v2hNHLqH3KqIqqDSaAXhA8rnR7jy
         MlaflXgVye93mGclglDqmX2w86+w7eRfMeJ81wDtuIY47F7zk5hQWmzICI3WURTcKj
         9mCPIO0CdPo/gjpu01FIxSlh1cx6uM3+HIWqttI58IusxOJb9EHoESJKiD59xByEtp
         joR/wzaJ2xHsv4n3Sv0oWPkv4FfH3RLUB8pjQaPb2IO76WhrC57bWcbN0MXqNwFgGI
         /Hvp5zXkEpRM1wqHDjQ7fCjXYz0qHDHgqNZ9OtsQ4AHZ6np+9SYit+c0+jGenW2xEM
         anpoj7aiqXgcw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210121071659.1226489-9-m.tretter@pengutronix.de>
References: <20210121071659.1226489-1-m.tretter@pengutronix.de> <20210121071659.1226489-9-m.tretter@pengutronix.de>
Subject: Re: [PATCH v3 08/15] soc: xilinx: vcu: implement clock provider for output clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 08 Feb 2021 18:35:08 -0800
Message-ID: <161283810856.76967.15161489234600731515@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2021-01-20 23:16:52)
> The VCU System-Level Control uses an internal PLL to drive the core and
> MCU clock for the allegro encoder and decoder based on an external PL
> clock.
>=20
> In order be able to ensure that the clocks are enabled and to get their
> rate from other drivers, the module must implement a clock provider and
> register the clocks at the common clock framework. Other drivers are
> then able to access the clock via devicetree bindings.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---

Applied to clk-next
