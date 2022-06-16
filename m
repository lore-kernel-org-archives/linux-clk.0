Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8A5C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jun 2022 00:16:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344075AbiFPAQT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jun 2022 20:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345372AbiFPAQJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 20:16:09 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6140A37BFC
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 17:16:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id C2579CE2372
        for <linux-clk@vger.kernel.org>; Thu, 16 Jun 2022 00:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C3CC3411A;
        Thu, 16 Jun 2022 00:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655338564;
        bh=7xw4zYqYFvfxhUoOifisZKHl++dFmLd4PcqfRUqa/sk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FoYRptaTA4eILvxfUD3hRuHBvbNhqr/MjNMvLsPcMNzOFbb11dWCEcobjG8HIpTd0
         8uhLzswKmmV1eito7KTLwV/nLRpmbzfhuuGGgm2cJbRui1/kIWc3WWzTfwacWd26lJ
         dDee8mteVqxKepphBQEQanqpqmSRoei/kEznMJvi3LEeeATghorLq3nrDCZ/w8ZgUT
         jGjZZuo7NWAjZCmuq2de/KkOOD8rl5pFzpE2SrcU7Szf/6S3EvSNCa29suP2rlwUZh
         i6YqOTttypszIv9tC6Eo034NPNhE/8I0DZO0Y+gC9fs5Rxab8+prMCEL6A9niq8ppf
         xiqxU844EAyFw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YqpRjwTVZU12H4Gb@ryzen>
References: <20220609132902.3504651-1-peng.fan@oss.nxp.com> <20220609132902.3504651-4-peng.fan@oss.nxp.com> <YqpRjwTVZU12H4Gb@ryzen>
Subject: Re: [PATCH 3/7] clk: imx93: Correct the edma1's parent clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     abel.vesa@nxp.com, mturquette@baylibre.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
To:     Abel Vesa <abel.vesa@linaro.org>,
        Peng Fan (OSS) <peng.fan@oss.nxp.com>
Date:   Wed, 15 Jun 2022 17:16:02 -0700
User-Agent: alot/0.10
Message-Id: <20220616001604.D4C3CC3411A@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Abel Vesa (2022-06-15 14:39:27)
> On 22-06-09 21:28:58, Peng Fan (OSS) wrote:
> > From: Jacky Bai <ping.bai@nxp.com>
> >
> > For EDMA1 in AONMIX, its parent clock should be from cm33_root,
> > so Correct it.
> >
> > Fixes: 24defbe194b65("clk: imx: add i.MX93 clk")
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
>=20
> The reviews done internally do no count in upstream.
> I think that's the rule. So drop the R-b tags from all patches.
> Keep only the S-o-b tags.

Is it any different code from what is sent upstream here? If not any
different then I don't think anything is stopping the review tags from
being kept.
