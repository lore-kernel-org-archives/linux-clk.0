Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8A3C32793
	for <linux-clk@archiver.kernel.org>; Wed, 18 Jan 2023 18:57:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjARS54 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 13:57:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbjARS5n (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 13:57:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB4C59B5F;
        Wed, 18 Jan 2023 10:57:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2869261866;
        Wed, 18 Jan 2023 18:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB15C433EF;
        Wed, 18 Jan 2023 18:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674068259;
        bh=pTDWezi/hbG4qiOSeW/G0y9G1CRYCQcQCVXuUVCVtyE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KDwIT18ajYD7zLRkBYoktrIrkjYXoukwPbVnarXOb5NcCvGiSNEduin1QFQ/GHrvx
         WUHpkDspNKz3QoQV+nywO9zvvAJxApLpoLm/Ak3ag5HQjTHwmYF0Cben6j9d1vci6K
         DDiYZjo6pG7Lqhk+Gx5m1xrbE3pErNTx2Imtthvwbqcw1cqGtdsh8SoohHQ90SHp6a
         05Hpm4+ZwiDUFb9YcUKJKYXr6D7ea89GkGTCvwzUtSJYXOzEsiXKwiFgj+DDDPHXOB
         uO9PD0fLjDBXREOOgRB0wSYTxTBWzi1igK0n/FahHTMQgHNQfoXCgNgYbvrHtq/4bh
         n3Fce7uUhCwvQ==
Message-ID: <1f7a9775ff089edb4f63b4302b8c1745.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230114233500.3294789-3-lars@metafoo.de>
References: <20230114233500.3294789-1-lars@metafoo.de> <20230114233500.3294789-3-lars@metafoo.de>
Subject: Re: [PATCH 3/3] dt-bindings: clock: versaclock5: Document 5P49V60 compatible string
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>
To:     Lars-Peter Clausen <lars@metafoo.de>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 18 Jan 2023 10:57:37 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lars-Peter Clausen (2023-01-14 15:35:00)
> The 5P49V60 clock generator is part of the same family of devices that is
> described by the versaclock5 binding documentation.
>=20
> Add the compatible string of the 5P49V60 to the binding documentation.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---

Applied to clk-next
