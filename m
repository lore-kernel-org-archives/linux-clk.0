Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBFBC282CE
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 18:41:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C64802173C
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 18:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555008076;
	bh=SKZYrYy1ulQMBmp4m2Dde3m2s+eVYQd/QRQKXVHUH/I=;
	h=In-Reply-To:References:From:Subject:Cc:To:Date:List-ID:From;
	b=ufy/C/fUkbIsdqNYUiThjGlsq6k+KqufCwA29IAcDRDheaNJ5NYVuNtxtSLD2grFx
	 K8ZQVVkB+nx7dXxWaAQk25qXAq5sHFhlac9CJPAhVlBSbD8ylFYshBHps7V2lcUlfz
	 kfStePO1KAi0/pVq6zChIM4C8lKHIprTe5P2XFpI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbfDKSlQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 14:41:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:54304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726603AbfDKSlQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Apr 2019 14:41:16 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AF8242083E;
        Thu, 11 Apr 2019 18:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555008075;
        bh=SKZYrYy1ulQMBmp4m2Dde3m2s+eVYQd/QRQKXVHUH/I=;
        h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
        b=LochXBim49ZQrk7yjUMrgv7NParDba8g+ucZ0lfCON7jRRemZ5e2nu/Ttb2Sjmyp9
         iCimWgPoF8/sox1HGr7rawhiYWYyZjiFZSQW2MLIGqZ5sGNwW5wsS54endvGfqfp79
         JAz5aQffd43aUxaQPhJsWOFq8NpcJg3GvG4cOPxY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190319100147.4178-4-m.tretter@pengutronix.de>
References: <20190319100147.4178-1-m.tretter@pengutronix.de> <20190319100147.4178-4-m.tretter@pengutronix.de>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 3/4] clk: zynqmp: fix check for fractional clock
Cc:     kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Message-ID: <155500807497.20095.9402731758543991418@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 11 Apr 2019 11:41:14 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2019-03-19 03:01:46)
> The firmware sets BIT(13) in clkflag to mark a divider as fractional
> divider. The clock driver copies the clkflag straight to the flags of
> the common clock framework. In the common clk framework flags, BIT(13)
> is defined as CLK_DUTY_CYCLE_PARENT.
>=20
> Add a new field to the zynqmp_clk_divider to specify if a divider is a
> fractional devider. Set this field based on the clkflag when registering
> a divider.
>=20
> At the same time, unset BIT(13) from clkflag when copying the flags to
> the common clk framework flags.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---

Applied to clk-next

