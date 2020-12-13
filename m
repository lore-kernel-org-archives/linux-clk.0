Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D91C433FE
	for <linux-clk@archiver.kernel.org>; Sun, 13 Dec 2020 05:43:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA18922D71
	for <linux-clk@archiver.kernel.org>; Sun, 13 Dec 2020 05:43:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730196AbgLMFnF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 13 Dec 2020 00:43:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:44786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727865AbgLMFnF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 13 Dec 2020 00:43:05 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607838144;
        bh=vdos0gKRikK/H6Ze9NX2GP+UqbFvtdzEqMCIy5YESFs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bAqYPR/M5CxBiEcjQ0XTh3HXMP2FyGX8o6ewDv2JcLF+hHaz4zUh2Brr1f5Crdx2E
         txPWOgN8QLf6POSDriHi/ntklkP3D986aPyw4zcVkE1KHHfgdvDFai+7Rm/rCIQr+5
         XpcxqUCuYsxNqNYxpgJoD7I8kfnE2uw+PlXUWZd5kt7tthpQF+c5hkoENs7Ju+5NdZ
         cVLw04OVwOq40kaZT9lMy03W249AHaBXA9wyMI5NpXvRssrC2TlQFJp/mcp0rAwE9m
         A4FdBJcY772nyxvzRuNmLHIuHvH9GHQIw0gAl98Df50rngCUIWSkZyUtYV1F0wGzZW
         /cmBJvVVYzV2Q==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201116075532.4019252-3-m.tretter@pengutronix.de>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de> <20201116075532.4019252-3-m.tretter@pengutronix.de>
Subject: Re: [PATCH 02/12] clk: divider: fix initialization with parent_hw
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     rajanv@xilinx.com, tejasp@xilinx.com, dshah@xilinx.com,
        rvisaval@xilinx.com, michals@xilinx.com, kernel@pengutronix.de,
        robh+dt@kernel.org, mturquette@baylibre.com,
        Michael Tretter <m.tretter@pengutronix.de>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Date:   Sat, 12 Dec 2020 21:42:23 -0800
Message-ID: <160783814346.1580929.10685702721358767806@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2020-11-15 23:55:22)
> If a driver registers a divider clock with a parent_hw instead of the
> parent_name, the parent_hw is ignored and the clock does not have a
> parent.
>=20
> Fix this by initializing the parents the same way they are initialized
> for clock gates.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Any fixes tag?

with the proper fixes tag

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
