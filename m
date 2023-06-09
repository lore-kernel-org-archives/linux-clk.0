Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8E4C7EE25
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jun 2023 00:24:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjFIAYx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jun 2023 20:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237138AbjFIAYw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jun 2023 20:24:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8C02D72
        for <linux-clk@vger.kernel.org>; Thu,  8 Jun 2023 17:24:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EBFFE6518B
        for <linux-clk@vger.kernel.org>; Fri,  9 Jun 2023 00:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A66C433D2;
        Fri,  9 Jun 2023 00:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686270290;
        bh=NnyktKy8joH18KoWTb5qePeBOJw8lOSTUT43nvNvEko=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=plxsgCOSAidd8eX3aGbnTB6NQA/dzRYO7nthjQnJqUxZe/Kczi0zZ2e+3FU1sz3Lz
         TWp9liHZ8vVLbPG6JIe0KpDCUtxKxNOQj6OU478a7K8KRGtAMYQhqeff6ar1g/ia6L
         OJDX4HRU5oD2rwEeQgkbc3OyO5aapUAodWdl+C1uY1JiA1NFSO2FWjTMys2zfKE9yH
         mIz77/cEs+KnJufKC9FZ20RReHOlWOkzoFJdFZ+SngDbFn8QR4jEEoZnGCrc7T+BkZ
         TOEG229BIGij/g7t1GRAx9qaUytqCTsq0BuCabN+sILj4Tvt917nZhFmReCh3h6e8j
         TGVebROHCxCWA==
Message-ID: <6dba4123f60b14094d585dd011b1ee2d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230602221604.155027-3-festevam@gmail.com>
References: <20230602221604.155027-1-festevam@gmail.com> <20230602221604.155027-3-festevam@gmail.com>
Subject: Re: [PATCH 3/3] clk: imx: imx6sx: Remove hardcoded LCDIF1 parent
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     hs@denx.de, abelvesa@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@denx.de>
To:     Fabio Estevam <festevam@gmail.com>, shawnguo@kernel.org
Date:   Thu, 08 Jun 2023 17:24:48 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Fabio Estevam (2023-06-02 15:16:04)
> From: Fabio Estevam <festevam@denx.de>
>=20
> It is not a good idea to hardcode the LCDIF1 parent inside the
> clock driver because some users may want to use a different clock
> parent for LCDIF1. One of the reasons could be related to EMI tests.
>=20
> Remove the harcoded LCDIF1 parent as this is better described via
> devicetree.
>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---

Do you need to check for the DT property and skip these clk_set_parent()
calls if they're present? How does this work if the DT isn't updated at
the same time?
