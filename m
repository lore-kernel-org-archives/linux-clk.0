Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F4AC433DB
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:37:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F7FA64DF6
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 02:37:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhBIChL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 21:37:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:34224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231166AbhBICgN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 21:36:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91FC164EC5;
        Tue,  9 Feb 2021 02:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612838132;
        bh=zA1GHceCU9CofE3Acm1E+URpRFxNeWfhG1nsjW0gh6g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=I9hPidd3gG8L5Vhjibh98OqsrbnwoXhNbkyerBoVakdSqsl9WyyyP+5CB14y9SNSK
         rNVFQHBEjNRrRHBGVJXIlWDadf3+v4Iswumq4ydleo0t7lkbyd/JmxEoI/zzD1r+NX
         qAJqAcCdGLAVI1aFZEzE3H4++hbbAQyAgR/34D4i0WSl6avYH0u3J8W2YCn7q2Y2xs
         94FdgWvm86xn0uDvfUYJu1RMUt/q+xu/kzndRnDtegzo5lQTeeJTrCIjVymFkef8EO
         QznpyKdQVyWNPeM6ntykSpuAqZz3jHfRgrQRKc71TNeynv91l8PbNInfn0igP4bEGH
         ykp9/gjeC4b8w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210121071659.1226489-13-m.tretter@pengutronix.de>
References: <20210121071659.1226489-1-m.tretter@pengutronix.de> <20210121071659.1226489-13-m.tretter@pengutronix.de>
Subject: Re: [PATCH v3 12/15] soc: xilinx: vcu: use bitfields for register definition
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 08 Feb 2021 18:35:31 -0800
Message-ID: <161283813111.76967.17123883026199659844@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2021-01-20 23:16:56)
> This makes the register accesses more readable and is closer to what is
> usually used in the kernel.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---

Applied to clk-next
