Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150FDEE49A5
	for <linux-clk@archiver.kernel.org>; Tue, 22 Aug 2023 21:53:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbjHVVxw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Aug 2023 17:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbjHVVxv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Aug 2023 17:53:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D3E0CE;
        Tue, 22 Aug 2023 14:53:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 254296445C;
        Tue, 22 Aug 2023 21:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F5A9C433C7;
        Tue, 22 Aug 2023 21:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692741227;
        bh=NdFfERDJGlZT28x/zEiciMMhfGCQTDFiEvZIICPeI6E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=un7lcYSlNOFPZbj1MDAvWyDfew97Fs+aG/DXeazkeNcySnemHBgA8aZTqCt2tqUnZ
         +/exgqDMQ15ScM/VJZpjra8UudpO5BdmkWzLVNg71F0uSmBCEFY4ZhxGjooXfRWjj8
         XBFXmxK/1z5fYexfDtbvIKfJMwKNw/7sE5K1PzNGuejsB9Iam5L1gt7XZjza81DvM6
         Z3s6UHp8ab6xvX39rWiE7e8/pSX4r9v6v9eNFa413XRaoSM1n97dj8hFKWIaxovEkx
         bbdDXx7ONQbIH6nl/EQOyMuk28W7DG783dUPjO2feMW8Zv0Zh4egfIR0glO7LwVjk6
         lbuxul9PixmmA==
Message-ID: <f6a0f01b8183d3be0724f5148251d8ec.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230705065313.67043-6-frank.li@vivo.com>
References: <20230705065313.67043-1-frank.li@vivo.com> <20230705065313.67043-6-frank.li@vivo.com>
Subject: Re: [PATCH 06/13] clk: gemini: Convert to devm_platform_ioremap_resource()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Yangtao Li <frank.li@vivo.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Yangtao Li <frank.li@vivo.com>
Date:   Tue, 22 Aug 2023 14:53:45 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yangtao Li (2023-07-04 23:53:06)
> Use devm_platform_ioremap_resource() to simplify code.
>=20
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---

Applied to clk-next
