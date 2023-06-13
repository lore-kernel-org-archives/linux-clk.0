Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D02DC7EE43
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 01:13:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbjFMBNP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 21:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbjFMBNO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 21:13:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09DA2A0;
        Mon, 12 Jun 2023 18:13:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 97D406301F;
        Tue, 13 Jun 2023 01:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC162C4339B;
        Tue, 13 Jun 2023 01:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686618793;
        bh=gmymbzHrclsljsrpfO7Q/CbjPvQelDe6/g5madNgpDw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lOgMuJIJDpYz8zYDUwBofEtANK4cUJ5n3jyErIPXP24XiN+DMPUFEfLhRPQL8SvRe
         WvNGnjsBzfQEKOuFwXbGiNE2X6NtX/gU9gdhajeXDAHQVLxUhSDhBI6fO/V1rANCNB
         9vyxzn05pioC9DSFPDC0dFfiZTAzcTM+mC8EnfwltkjbxCmOnNszmDjjYku6X1lsNq
         AZfmDQvIQhOvFO3o0d7ItiMHQaVXrXKEAVfVscAeZMUgqY/ifS143i27ZWfxyqTa1p
         /JAioEaGqcdoxSBxQ/81vqZDIQVujBtHH8e/grmPivWPbjLxk7j97W6i3eHxvUqT3I
         yH6L2SOIG1pWQ==
Message-ID: <4e4327afb0c71ae299e6aaaa3dffd4f9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230511133226.913600-1-msp@baylibre.com>
References: <20230511133226.913600-1-msp@baylibre.com>
Subject: Re: [PATCH] clk: mediatek: mt8365: Fix inverted topclk operations
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Alexandre Mergnat <amergnat@baylibre.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 12 Jun 2023 18:13:10 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Markus Schneider-Pargmann (2023-05-11 06:32:26)
> The given operations are inverted for the wrong registers which makes
> multiple of the mt8365 hardware units unusable. In my setup at least usb
> did not work.
>=20
> Fixed by swapping the operations with the inverted ones.
>=20
> Reported-by: Alexandre Mergnat <amergnat@baylibre.com>

Checkpatch complains now that there isn't a Closes: tag here.

> Fixes: 905b7430d3cc ("clk: mediatek: mt8365: Convert simple_gate to mtk_g=
ate clocks")
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---

Applied to clk-fixes
