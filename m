Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8387C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 17 Oct 2022 21:06:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbiJQVGu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Oct 2022 17:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbiJQVGf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Oct 2022 17:06:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B527AC2B
        for <linux-clk@vger.kernel.org>; Mon, 17 Oct 2022 14:06:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B6BD3611EF
        for <linux-clk@vger.kernel.org>; Mon, 17 Oct 2022 21:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18589C433D7;
        Mon, 17 Oct 2022 21:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666040784;
        bh=43n54NkG4dt8LhHeNKhtcx2Oycro9sdIFotkSBtgcUE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=D/jAjwwJti+l0OSUVdTjUwmpqAWnLrn7mnH3nhwQOlgLGd5oi15co/gtNkWX71mq1
         X6wYhfCaQ2ZvjToMCRQrig7/7WYGZcFKVL+5iXmI9UwJLXKCkTHTAVv3I6M6vJYQ13
         jQIH0IHwrg5favFUgmEyrlEZhystqfv+86DAVpNUY/MAdx3Q+jHgjQdO8I3/DRdwnv
         7xJCcrayCpIId2s8bGAjIawa0g0qbsbsb/9qzFVV82znWScp8cw4ISeKdwsPhb5KvZ
         DyGW/pusFr8HLuixe6DU5x8OjJgspzrOnq5nZQousz/w7qelTzj9qedEfeAgiYe98h
         wX7ZVszfcbkVA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220929195521.284497-1-marex@denx.de>
References: <20220929195521.284497-1-marex@denx.de>
Subject: Re: [PATCH v4] clk: rs9: Fix I2C accessors
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marex@denx.de>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Michael Turquette <mturquette@baylibre.com>
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Mon, 17 Oct 2022 14:06:22 -0700
User-Agent: alot/0.10
Message-Id: <20221017210624.18589C433D7@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-09-29 12:55:21)
> Add custom I2C accessors to this driver, since the regular I2C regmap ones
> do not generate the exact I2C transfers required by the chip. On I2C writ=
e,
> it is mandatory to send transfer length first, on read the chip returns t=
he
> transfer length in first byte. Instead of always reading back 8 bytes, wh=
ich
> is the default and also the size of the entire register file, set BCP reg=
ister
> to 1 to read out 1 byte which is less wasteful.
>=20
> Fixes: 892e0ddea1aa ("clk: rs9: Add Renesas 9-series PCIe clock generator=
 driver")
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Applied to clk-fixes
