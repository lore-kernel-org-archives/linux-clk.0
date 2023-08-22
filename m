Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CEAEE49A5
	for <linux-clk@archiver.kernel.org>; Tue, 22 Aug 2023 21:53:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbjHVVxh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Aug 2023 17:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231462AbjHVVxh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Aug 2023 17:53:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B52CFC;
        Tue, 22 Aug 2023 14:53:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 991DA6461A;
        Tue, 22 Aug 2023 21:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F37C433C7;
        Tue, 22 Aug 2023 21:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692741214;
        bh=uNLSAJuMHPs9GheoaWG2CEZvKy96Bx7OV00Y0pcQbwU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HzRek0qBe4RkcCAQEqvzcAq91JQH1oJZpT74CJJ1gJUfkfVEVnCeZboKrR6S+QXWI
         erKCGgb3+8FK3LPzAWzMd/w3PJBB5UPgv9Jgb4Bf5N5Xp6w/+WOx3+c8IITGegFlJp
         xR9fYnPsVXNsuhvFrAkpU68U/FjUKzdVkmHoN2A0yPRh5jlXI5kUwV+odekHm/nuA6
         5Iv+Rmz50vI6IBbzH9TITyTqkZeOJSs4+xn7AtsQEVrftati4iFMZj0Ct4yK+il72P
         QFpmYUbiEYcrXtxL1SCd+4woUcXJOvGPWYeeo7+nSfeWXWXaEfDv+2gaxq5zBzToEo
         bkp4M9eRCr8kw==
Message-ID: <19af6f4a4aca8472a924e9f81fb5e535.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230705065313.67043-7-frank.li@vivo.com>
References: <20230705065313.67043-1-frank.li@vivo.com> <20230705065313.67043-7-frank.li@vivo.com>
Subject: Re: [PATCH 07/13] clk: hsdk-pll: Convert to devm_platform_ioremap_resource()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Yangtao Li <frank.li@vivo.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Yangtao Li <frank.li@vivo.com>
Date:   Tue, 22 Aug 2023 14:53:31 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yangtao Li (2023-07-04 23:53:07)
> Use devm_platform_ioremap_resource() to simplify code.
>=20
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---

Applied to clk-next
