Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8811C433F5
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 21:21:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbiJCVVb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 17:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiJCVTk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 17:19:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B21051408
        for <linux-clk@vger.kernel.org>; Mon,  3 Oct 2022 14:12:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DBADA610D5
        for <linux-clk@vger.kernel.org>; Mon,  3 Oct 2022 21:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC63C433D6;
        Mon,  3 Oct 2022 21:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664831540;
        bh=PMXiHaHX8cdiMSpxbKSGFpYCW/v8Nl0ML/t1WU7O3Vs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=agvtNGPAXNkN0PMbndePEtBWIM9VSrpgYOM+xFcfi7OSZePc1E7ygsnv9Yo3B17no
         tBv6D9y1v5PLAvFIxt5e0CFHL3VC1szlF7McVq9dj3b5dp8ldGBkXolch9PVGW/t8/
         rNZQ8N9K9SuNJ3g5jJAYmWs7XPoxirNPcgp0AE6qc9bixwDWwPn677lKhuYW8O4Rg/
         qv+t6wTsmGy8DUNHpa/US0d0UBsbBrISlOJrfMHPu14ctwWrCQ50p5LAP+q6+E/bXr
         jMzHS4CrGG7DKgtT9Kpx2uPQsV3QSBheWbzaX1LvHZyN2uQc/auLd4gkRKomTDfHlN
         +XVkg9ROfIyjw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220421040426.171256-1-joel@jms.id.au>
References: <20220421040426.171256-1-joel@jms.id.au>
Subject: Re: [PATCH] clk: ast2600: BCLK comes from EPLL
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
To:     BMC-SW@aspeedtech.com, Joel Stanley <joel@jms.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Date:   Mon, 03 Oct 2022 14:12:18 -0700
User-Agent: alot/0.10
Message-Id: <20221003211220.3EC63C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Joel Stanley (2022-04-20 21:04:26)
> This correction was made in the u-boot SDK recently. There are no
> in-tree users of this clock so the impact is minimal.
>=20
> Fixes: d3d04f6c330a ("clk: Add support for AST2600 SoC")
> Link: https://github.com/AspeedTech-BMC/u-boot/commit/8ad54a5ae15f27fea5e=
894cc2539a20d90019717
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Applied to clk-next
