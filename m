Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA880C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 01:02:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 868D461185
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 01:02:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbhIOBD0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 21:03:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:46488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229458AbhIOBD0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 21:03:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AD6761184;
        Wed, 15 Sep 2021 01:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631667728;
        bh=xiR1zVZyatUhhHM7h0t0tphtw1rmICG6HoQcJlkykxE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=SQe5XCQzMAyIZq0fWrjzr/wtMHG2DGRt/oNvHTxjG3RuahRhDTHrT6OnZiG5SWygh
         NBYFlt1XeJnCq5rkeRqtS6HoRWDUyDWLZF09ZnJlxLVdOpHzKlwYtpfYSIRyfM8d92
         bXP35NPS654cAiny4JOdDqB+9rHcQ74nfSROZBYQ2ohvJSnqD7NFu4JQ4h/FvTt8N+
         eldfiVHl0D/AWNOLNXezfpjdMeYPSwaT86sj7PAy1KQYQUot2yz+RBOsVHVVOxLWv2
         RyDQr/Hw6sfqTKB24ezdc5i4DKJByWZxxzxf179juGVQ8CacS8hfqQh0b4nWgKI7n5
         m808a+56+MCOg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1631521490-17171-2-git-send-email-abel.vesa@nxp.com>
References: <1631521490-17171-1-git-send-email-abel.vesa@nxp.com> <1631521490-17171-2-git-send-email-abel.vesa@nxp.com>
Subject: Re: [PATCH 1/8] clk: imx: Remove unused helpers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, Abel Vesa <abel.vesa@nxp.com>
To:     Abel Vesa <abel.vesa@nxp.com>
Date:   Tue, 14 Sep 2021 18:02:07 -0700
Message-ID: <163166772703.763609.12601490478714219990@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Abel Vesa (2021-09-13 01:24:43)
> Remove all the helpers that are not referenced anywhere
> anymore. Most of them are not clk_hw based. The rest are
> passing the device as an argument and were intented for
> BLK_CTL driver usage, but that is not the case anymore since
> the BLK_CTL is (or will be) implemented outside of CCF.
>=20
>  - imx_clk_divider2
>  - imx_clk_gate2_shared2
>  - imx_clk_gate3
>  - imx_clk_gate4
>  - imx_clk_frac_pll
>  - imx_clk_sscg_pll
>  - imx_clk_pll14xx
>  - imx_clk_pll14xx
>  - imx_clk_divider2_flags
>  - imx_dev_clk_hw_gate
>  - imx_dev_clk_hw_gate_shared
>  - imx_clk_gate3_flags
>  - imx_clk_gate4_flags
>  - imx_dev_clk_hw_mux
>  - imx_clk_mux2
>  - imx_dev_clk_hw_mux_flags
>  - imx8m_clk_composite_flags
>  - __imx8m_clk_composite
>  - imx8m_clk_composite
>  - imx8m_clk_composite_critical
>=20
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
