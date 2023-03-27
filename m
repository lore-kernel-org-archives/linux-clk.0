Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95479C6FD1D
	for <linux-clk@archiver.kernel.org>; Mon, 27 Mar 2023 19:08:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232115AbjC0TIn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Mar 2023 15:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232220AbjC0TIj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Mar 2023 15:08:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 262981721
        for <linux-clk@vger.kernel.org>; Mon, 27 Mar 2023 12:08:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C0491B818BC
        for <linux-clk@vger.kernel.org>; Mon, 27 Mar 2023 19:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4ABC433D2;
        Mon, 27 Mar 2023 19:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679944116;
        bh=3O4T5YBpK2zqZ5vsxmOMfJZIMYRcb85gG00sbVRacVs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GZe+wADajXPj8VAU2KfFLQ69tVccCU9ecqFORGJRP2j/DMeZNkeG/06/xkKRJkoYD
         TCLyX90UqxdRM3S7FyJTJ3LGN93ZT7/g3vmd+QdYxE/sSFiYak/vkWECfBxTceBn5x
         cPsdOr6QtFQ6C/v27VJYhWSV5HcG8681CRIplOAOvVSGbyV8xsq9uRDF2tXQm2b7TE
         NTPC2ltXNxiIro7fQwy/mTIYfDTfz5WbVsp/T9mt1mfg5wRKwPC260EQTFdIdVtgEt
         fQdIpN7Ap4h7jdQ/8XdNMXla3BPSHKM83WRzQDsqCb6HHOmQOv/C+/sLAYLsNvcLw2
         Q6g305Fmb1OnA==
Message-ID: <f73ec03e092d32597f0adea54bd3c771.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230324104958.25099-1-shubhrajyoti.datta@amd.com>
References: <20230324104958.25099-1-shubhrajyoti.datta@amd.com>
Subject: Re: [PATCH] clk: zynqmp: pll: Remove the limit
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     git@amd.com, mturquette@baylibre.com, michal.simek@xilinx.com
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-clk@vger.kernel.org
Date:   Mon, 27 Mar 2023 12:08:34 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2023-03-24 03:49:58)
> The range is taken care in the zynqmp_pll_round_rate. Remove the rate ran=
ge
> in the zynqmp_clk_register_pll() to prevent the early truncation of the
> frequencies and also allow multiple combinations of child and parent to g=
et
> more accurate rates.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---

Applied to clk-next
