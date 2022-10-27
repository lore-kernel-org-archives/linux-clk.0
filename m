Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DDCECAAA1
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 18:59:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235971AbiJ0S7o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 14:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235786AbiJ0S7k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 14:59:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 089652DE1;
        Thu, 27 Oct 2022 11:59:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 983F262465;
        Thu, 27 Oct 2022 18:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6D5C433C1;
        Thu, 27 Oct 2022 18:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666897175;
        bh=7XvcaZXCkgQN8izVvBlOMmqOAZ8aiJxBLfXtriGkHVI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hKHNVvRILFS6ss0gD86P24TeHlcxUCj5kbB+Y8LITAmNaOip2bIbCuMGnlFDDVC9M
         sei45M3O3xJ/TB6ZZ5o8++PYxi/bXNZZOEjjCiWUe1CBtOuYOV19OJ88qxWyqeATMC
         FGCBQBgxZddR4YOjVF/LBxochLisTkFiWGVTEQxB63dVhShAUGvqhzY0KLXYa3Xm31
         F6rQNp8J5AkWZQ0y0RKnISMDz/R9ngDycPg8YhM+Ng2cMyDjRpNF5Hz2I+tpjsPVv6
         GghqAMnQFiAMKajBLEU/hlyG/qtmXgpd0eKRXubqCU0WDD+s+/MKPrMxJYcAUrl0mi
         dS1pvhuB8hrtA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221026194345.243007-4-aidanmacdonald.0x0@gmail.com>
References: <20221026194345.243007-1-aidanmacdonald.0x0@gmail.com> <20221026194345.243007-4-aidanmacdonald.0x0@gmail.com>
Subject: Re: [PATCH v2 3/6] clk: ingenic: Add .set_rate_hook() for PLL clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     zhouyu@wanyeetech.com, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        paul@crapouillou.net, robh+dt@kernel.org
Date:   Thu, 27 Oct 2022 11:59:32 -0700
User-Agent: alot/0.10
Message-Id: <20221027185934.EE6D5C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aidan MacDonald (2022-10-26 12:43:42)
> The set rate hook is called immediately after updating the clock
> register but before the spinlock is released. This allows another
> register to be updated alongside the main one, which is needed to
> handle the I2S divider on some SoCs.
>=20
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---

Applied to clk-next
