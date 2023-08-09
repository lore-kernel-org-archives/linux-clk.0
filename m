Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DB1C001DE
	for <linux-clk@archiver.kernel.org>; Wed,  9 Aug 2023 21:17:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbjHIVR2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Aug 2023 17:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjHIVR2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Aug 2023 17:17:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D598610CA
        for <linux-clk@vger.kernel.org>; Wed,  9 Aug 2023 14:17:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6AC9C64A07
        for <linux-clk@vger.kernel.org>; Wed,  9 Aug 2023 21:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE38C433C8;
        Wed,  9 Aug 2023 21:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691615846;
        bh=deWueVbxWNfNyWjFH5/yNRM4pNhZhG/SmAXIlvbz0Rk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uM3fOpNbqfnWEAvJRsNzIMCebgtkrqWI2RuhX/x0lodSjbfbP1A6CL46Pri8+XOBD
         POjlVhH+tYQ0pihO84nmwN4ky+07NYPD2vetdWdYV1QJTnXGPrOBjqA7bbD2VXV9fj
         g+Q9GC+Go1GuwPXNXXn6JGJLBp7ctaSA9Fn0qrjBuIrv6/7Ri4TVBgUq7SeKMuTYhj
         vA2ymYrbZrgnBI4jdS1B9aBYW+H/biIgOReFcUb+9HpcANg95UB1qUkblcpcgiaeYM
         EKddb2Yv5gRtH5a6IZNwQvMjSlTfMsOV/IxAfgHYZ5PJFKlca5KpGN+T1jTFN3YCAt
         q7IPcELhuRYeg==
Message-ID: <d7f3c1fef7293d7da69620bed31d77a3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jh6p9o6cl.fsf@starbuckisacylon.baylibre.com>
References: <1jh6p9o6cl.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL]: clk: meson: amlogic clock updates for v6.6
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
To:     Jerome Brunet <jbrunet@baylibre.com>
Date:   Wed, 09 Aug 2023 14:17:24 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2023-08-08 09:09:24)
> Hi Stephen,
>=20
> Here are the amlogic clock updates for v6.6.
> It is mainly about dt-bindings this cycle.
> Instead of exposing clock ids as needed, it was decided to expose everyth=
ing
>=20
> You might notice a patch on amlogic,meson-gx-hhi-sysctrl.yaml which is
> not a clock controller. This syscon mainly hosts the gxbb clock
> controller. Neil asked for this to be taken along with the rest of gxbb
> clock schema to make things simpler. No risk of conflict there.
>=20
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaa=
a5:
>=20
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.6-1
>=20
> for you to fetch changes up to 4d023beb3998a775dc5c3aa2c22efd3435e061e1:
>=20
>   dt-bindings: soc: amlogic: document System Control registers (2023-08-0=
8 16:09:37 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
