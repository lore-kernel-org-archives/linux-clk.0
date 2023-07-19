Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4DCC001B0
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jul 2023 19:46:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbjGSTqc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jul 2023 15:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbjGSTqc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jul 2023 15:46:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D5D1FD7;
        Wed, 19 Jul 2023 12:46:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EABDF617DA;
        Wed, 19 Jul 2023 19:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51492C433C8;
        Wed, 19 Jul 2023 19:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689795990;
        bh=tSmWR/4k8ORnPCTOHcYyyCnb1E81LTSfoGE7XgXb1nk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VxN+Mp4aqHBaBRgyth5qnRV29QsVJp0rb6FHcCu88kDsWsyUXH8WV1rzz2b9a/MKY
         XGV/U6Ld9ISwdirlv3IrHhKD+fKDxCvDF5lDSI2goVVYdS5u3Es/32M8jydWPXfX5+
         1M5RYvcko4Cc7yXjglBl/OH/YlCBPPax200ipj77YggnXczVNLMSiUr4emrYSEAu+s
         80k0u+XsLDjyEZta/xX2sLoB4c6ChhMP68B431oJd0iFaew1vlNknMHnuxl52P25iP
         fkUkQKioiVv/sEdKG/55LGUWxYQ6njOg/r6POsxAj7zPI9IbeXFPwBzEAJABgDcKxx
         E50AmKozjA66g==
Message-ID: <e5befd3ce35149ca1be92d2ca747e9bb.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230707210700.869060-1-robh@kernel.org>
References: <20230707210700.869060-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: hisilicon,cpuctrl: Merge "hisilicon,hix5hd2-clock" into parent binding
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
To:     Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Wei Xu <xuwei5@hisilicon.com>
Date:   Wed, 19 Jul 2023 12:46:28 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Rob Herring (2023-07-07 14:07:00)
> The "hisilicon,hix5hd2-clock" is simple enough to just add it into its
> parent node binding, "hisilicon,cpuctrl".
>=20
> This fixes a warning that "hisilicon,hix5hd2-clock" is missing a schema.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
