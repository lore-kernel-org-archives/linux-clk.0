Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE529C6FD1D
	for <linux-clk@archiver.kernel.org>; Mon, 27 Mar 2023 20:20:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232777AbjC0UU2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Mar 2023 16:20:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232799AbjC0UUY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Mar 2023 16:20:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C079D35BD;
        Mon, 27 Mar 2023 13:20:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 05047B818FF;
        Mon, 27 Mar 2023 20:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A860CC433D2;
        Mon, 27 Mar 2023 20:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679948418;
        bh=DtxMn5crarOiOaxs9JoCejAERTl+y7BT1NAt1vX8RcE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=UKv2eJAzj4+EYUHxtxz11dtpm8Afv2e7d6FchcHo/HqeODyod1+krvpJDZbnTr7D9
         b0kHui/oxrKXBArB+JwhA3MjyfsrQvxKos9Md9FiajpXT/l9gQSy7LXMYcZYsoZzfX
         Y79klA0etJplKoLeC8uH2z6QrS99Hm9GATRNY3GBfufWLv/amv4sQQwj0gm/7BZXjy
         PKOf/t/Gr+mWeNIAatECwypwZW968ZDpdSWxE/decubVqQyJfSeY0u9tIk783exO0s
         peie0dOzVlKVLGbz8R8OblBLmQPWbKWYN59vi5ir+eE8b+93oi5dY+YNK4qwCuAymq
         69ch+rFuodraQ==
Message-ID: <570da6684b58281147bfc24693c7eab3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230322171515.120353-5-noltari@gmail.com>
References: <20230322171515.120353-1-noltari@gmail.com> <20230322171515.120353-5-noltari@gmail.com>
Subject: Re: [PATCH v4 4/4] clk: bcm: Add BCM63268 timer clock and reset driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez?= Rojas <noltari@gmail.com>
To:     devicetree@vger.kernel.org, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, krzysztof.kozlowski+dt@linaro.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, p.zabel@pengutronix.de,
        robh+dt@kernel.org, william.zhang@broadcom.com,
        =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez?= Rojas <noltari@gmail.com>
Date:   Mon, 27 Mar 2023 13:20:15 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting =C3=81lvaro Fern=C3=A1ndez Rojas (2023-03-22 10:15:15)
> Add driver for BCM63268 timer clock and reset controller.
>=20
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---

Applied to clk-next
