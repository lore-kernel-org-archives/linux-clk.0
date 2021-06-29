Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4797C11F66
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 06:10:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8DEC61DCA
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 06:10:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232087AbhF2GNB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jun 2021 02:13:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:34340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231881AbhF2GNB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 29 Jun 2021 02:13:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F2D3C61DC5;
        Tue, 29 Jun 2021 06:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624947035;
        bh=erYjZM3znz/8Dd47OzSopVWIyIGBBPSiIH5Ekwq9QII=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=A5MqbJCADNlwHQGPLdJivV1bRq6gEFCw4cEOiCo1Z4MgZTJQAnRyek3OhKkvdLt2I
         p2OxmnzzZsIOnTyG3qScwFPpYBC39hDKNlPI9jDo4lIuFWCpGD2DGIOjkz55S/EZkG
         g4ShpSbLriPSTjrULb34DZBpPKINMOQn5J5O7L5qEf1SIl/kfWhVDLmQ6DafMdrsPa
         Iq3YI+rhVtcflffrcyMN2Qx8cRe/xRnfGHRj1Jj9bJT3T0Qwn9xwxERVVv2V4xBZMR
         SAmwMUhvs6Nq8gw/pS7mXtSwAGusOoDMJ2YiRFurwjWpgTKGJ3wpqS6Pn3kXaWWkiF
         F8Nsf98aSPnvg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210628070122.26217-2-rajan.vaja@xilinx.com>
References: <20210628070122.26217-1-rajan.vaja@xilinx.com> <20210628070122.26217-2-rajan.vaja@xilinx.com>
Subject: Re: [PATCH v6 1/4] clk: zynqmp: Use firmware specific common clock flags
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Rajan Vaja <rajan.vaja@xilinx.com>
To:     Rajan Vaja <rajan.vaja@xilinx.com>, kristo@kernel.org,
        lee.jones@linaro.org, michal.simek@xilinx.com,
        mturquette@baylibre.com, quanyang.wang@windriver.com
Date:   Mon, 28 Jun 2021 23:10:33 -0700
Message-ID: <162494703384.2516444.13293216331096267775@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Rajan Vaja (2021-06-28 00:01:19)
> Currently firmware passes CCF specific flags to ZynqMP clock driver.
> So firmware needs to be updated if CCF flags are changed. The firmware
> should have its own 'flag number space' that is distinct from the
> common clk framework's 'flag number space'. So define and use ZynqMP
> specific common clock flags instead of using CCF flags.
>=20
> Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
> ---

Applied to clk-next
