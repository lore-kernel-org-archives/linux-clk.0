Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3ED8FA3740
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 18:59:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236402AbiJ0S73 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 14:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235971AbiJ0S72 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 14:59:28 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FD3DE3;
        Thu, 27 Oct 2022 11:59:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 8ED2FCE2812;
        Thu, 27 Oct 2022 18:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEAD8C433C1;
        Thu, 27 Oct 2022 18:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666897164;
        bh=TU2CUrS30Palk9ZwkfsjkAroIZaz+MyM+u26DyZIUpI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rHR5J2PdcHRWMD0HlhNxdNBRSlL5e1L8TBdB/kyj7WIe90Csqfw/qU3KMQFCgfe8X
         qd8uHSY6tiPmbnrK6vdJm+pFJOb1ypQkkv/e2121SlafdfNWm6kNvzNkZ3zztlg1uc
         +GOcZPRsqS3fxqv8S0VB76mFSjoKP+H690LoArA3+E1GLeTzYpQHQxWvRpAwHIiGNL
         UzleHvPsk0jqOGjcCGNk87/3PIs1J1kpzk1vcAE9C9tx9YrqLaWdTIKBDwSXYcRRV3
         xZ/XCyJZoyKjFFrao0Rb2+6Ve6ChH01BMOOMV8/ardsP89GwIbdnf6Ai8EQPuWG1jN
         FyS257SnwrUDg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221026194345.243007-3-aidanmacdonald.0x0@gmail.com>
References: <20221026194345.243007-1-aidanmacdonald.0x0@gmail.com> <20221026194345.243007-3-aidanmacdonald.0x0@gmail.com>
Subject: Re: [PATCH v2 2/6] clk: ingenic: Make PLL clock enable_bit and stable_bit optional
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     zhouyu@wanyeetech.com, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        paul@crapouillou.net, robh+dt@kernel.org
Date:   Thu, 27 Oct 2022 11:59:22 -0700
User-Agent: alot/0.10
Message-Id: <20221027185924.AEAD8C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aidan MacDonald (2022-10-26 12:43:41)
> When the enable bit is undefined, the clock is assumed to be always
> on and enable/disable is a no-op. When the stable bit is undefined,
> the PLL stable check is a no-op.
>=20
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---

Applied to clk-next
