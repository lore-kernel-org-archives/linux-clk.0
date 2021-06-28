Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE06C48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 02:31:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F32B261AC0
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 02:31:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231972AbhF1CeS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 22:34:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:53372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231678AbhF1CeS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 22:34:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC428619C5;
        Mon, 28 Jun 2021 02:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624847513;
        bh=sg5FRXpp15AceVPsuCKcp9dFnCITuCvOBT72SgZ/UcI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=OQ/wia0tiCdY0xq1u5miNGS5mY4zHqvBgyZGxZ1IX/h+eSvVxMqjn9eCyMCbP/Cxb
         IJR/9I+zH1wstvfWDrO22FxOE4D7HdYyt9HP3S/bWsowhvDGtUAsM3t/zLHkdVJ5nj
         QH+pWlnkujy5uKrDdZ0NNksONWNdCaxlxRx4n43zKB6cy90JPbN2RJC32lU59A8kuO
         fqxmS5tDzaBEec/xtIqZAgqYRmv5mRIdzAQfKKXVHHRuNW/S0K51A7Pixbwki5ZmR/
         L8oOaKO1XRyKBXxd+2a7Ohf4eVoiq8/w03P/NdEJ9xuAyOQQ4iZeIk3z2N+Q3atJcH
         JCYpUUtYuZtVg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210614155437.3979771-2-sean.anderson@seco.com>
References: <20210614155437.3979771-1-sean.anderson@seco.com> <20210614155437.3979771-2-sean.anderson@seco.com>
Subject: Re: [PATCH v2 2/2] clk: vc5: Add properties for configuring SD/OE behavior
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>,
        Sean Anderson <sean.anderson@seco.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Sean Anderson <sean.anderson@seco.com>,
        linux-clk@vger.kernel.org
Date:   Sun, 27 Jun 2021 19:31:52 -0700
Message-ID: <162484751253.3259633.12445078064883235282@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sean Anderson (2021-06-14 08:54:37)
> The SD/OE pin may be configured to enable output when high or low, and
> to shutdown the device when high. This behavior is controller by the SH
> and SP bits of the Primary Source and Shutdown Register (and to a lesser
> extent the OS and OE bits). By default, both bits are 0, but they may
> need to be configured differently, depending on the external circuitry
> controlling the SD/OE pin.
>=20
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---

Applied to clk-next
