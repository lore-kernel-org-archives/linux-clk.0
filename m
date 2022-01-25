Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2282CC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 22:30:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233856AbiAYWaI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 17:30:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233824AbiAYWaI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 17:30:08 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E17A7C06173B;
        Tue, 25 Jan 2022 14:30:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A925AB81B7D;
        Tue, 25 Jan 2022 22:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E96C340E0;
        Tue, 25 Jan 2022 22:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643149805;
        bh=/WXVbhYH+nHM3QxlJyzW5r48WGgFaqAkR0BvB8HfFVg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WaoerlILabNmPxfiV6/FjRU5CKS1TJsXIj2qGcy6J0HTmf7gNSBcVJHRJSqtC6oZZ
         R7RtJNZyDnBHPbCHW9avCZpFuGo1uoP8fz+Ib4LqsoK4f4svoe41CP2JwJbXYwhPR1
         64GDpE5qYBd0tto5h0U76Tu+5iLZtDKscsE3tPySY6Tl5ZKhtkyfn+XvSxI2f6yddm
         frgT66h2ynhX09dL982GLoL681I5faBpBjIKnL6sAo93zILl1FdchIEyjBUx9dpxNi
         /u/xM2iqxTuQ0frDWFf0JNjDTnp14HBFXu5TL+NAyUVJMcZAHwMsSdPx/af3xT6tbO
         ZQUvlX9QwXzLw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220125093336.226787-7-daniel@zonque.org>
References: <20220125093336.226787-1-daniel@zonque.org> <20220125093336.226787-7-daniel@zonque.org>
Subject: Re: [PATCH RESEND v4 6/9] clk: cs2000-cp: add support for dynamic mode
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>
To:     Daniel Mack <daniel@zonque.org>, mturquette@baylibre.com
Date:   Tue, 25 Jan 2022 14:30:03 -0800
User-Agent: alot/0.10
Message-Id: <20220125223005.55E96C340E0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Mack (2022-01-25 01:33:33)
> The CS2000 chip features two input clocks, REF_CLK and CLK_IN.
>=20
> In static mode, the output clock (CLK_OUT) is directly derived from
> REF_CLK, and CLK_IN is ignored. In dynamic mode, CLK_IN is used by the
> digital PLL.
>=20
> In dynamic mode, a low-frequency ratio configuration that uses a higher
> multiplier factor.
>=20
> Until now, only the static mode and high-frequency divider rations of
> the hardware was supported by the driver. This patch adds support for
> dynamic mode and both ratios:
>=20
>  * Parse a new OF property 'cirrus,dynamic-mode' to determine the mode
>  * In dynamic mode, present CLK_IN as parent clock, else use REF_CLK
>  * The low-frequency ratio mode is automatically selected, depending
>    on the mode of operation and the given input and output rates
>=20
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---

Applied to clk-next
