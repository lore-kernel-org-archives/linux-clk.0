Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59CEFA3740
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 18:59:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236081AbiJ0S7U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 14:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236402AbiJ0S7S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 14:59:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 190A03FD7A;
        Thu, 27 Oct 2022 11:59:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9965462456;
        Thu, 27 Oct 2022 18:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC323C433D6;
        Thu, 27 Oct 2022 18:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666897154;
        bh=REl37YtuYRtKTr6b/Ay4A3AdEJsHmx1V5gV97WyVEU8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=K67qgXty9/lzuiPZOWprJqtRqwovI0TE6jCrxvO62P89joJaWVm+FtwWpx+dm9jyR
         mTB0RwAbs7ONH8FmdWS8MYw5AM4J556m8+s5sTfhYDohutJKx/1754JA41LHd1RQy2
         TS/Zy/LdoqADinB+ikP/lCW6SkkyRZpP9taMt882IPiKbaHiX1iuYhgvr82aNP1vnK
         To6GyII/5B1znDOFB3SkxAdVNAJzudyyVx7t//39th2GArTEwL2OeKmuzHOJP+Gj3X
         +vo8s2J8rvftdjAwK1GK1irMJ22m+TLzsIW6+CaTB9bQRZwgodqAEwYphd7QH45Qkw
         kBO2VRgwP92Ew==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221026194345.243007-2-aidanmacdonald.0x0@gmail.com>
References: <20221026194345.243007-1-aidanmacdonald.0x0@gmail.com> <20221026194345.243007-2-aidanmacdonald.0x0@gmail.com>
Subject: Re: [PATCH v2 1/6] clk: ingenic: Make PLL clock "od" field optional
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     zhouyu@wanyeetech.com, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        paul@crapouillou.net, robh+dt@kernel.org
Date:   Thu, 27 Oct 2022 11:59:11 -0700
User-Agent: alot/0.10
Message-Id: <20221027185913.EC323C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aidan MacDonald (2022-10-26 12:43:40)
> Add support for defining PLL clocks with od_bits =3D 0, meaning that
> OD is fixed to 1 and there is no OD field in the register. In this
> case od_max must also be 0, which is enforced with BUG_ON().
>=20
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---

Applied to clk-next
