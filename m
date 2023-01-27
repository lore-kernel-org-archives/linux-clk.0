Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23871C38142
	for <linux-clk@archiver.kernel.org>; Fri, 27 Jan 2023 23:17:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232935AbjA0XRp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Jan 2023 18:17:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232943AbjA0XRl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Jan 2023 18:17:41 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255978CC6F;
        Fri, 27 Jan 2023 15:17:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7B45461DD9;
        Fri, 27 Jan 2023 23:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D319EC433EF;
        Fri, 27 Jan 2023 23:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674861454;
        bh=UFxjpIbYoFQ6NbJOkP2MqtpAr04UPlyKiZQ82r5f//I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Y3wvr9+Px6TzEMg2qb2Tnx8CpTdh/FgDt/QyyShHIASvUX7iEr1W5YIPxSCkEu5jO
         nUuKHNnx4FQk3Aet8xQYf2RZZdVOt4mZXt0m2BaDs/cS3WJaMYsX1qagZUF9Mzqesu
         eBNVd5EhUeQXjEFzF+mW0RfcNxC55QdDPmkO3btpP4+WnC9ojXjjKGsadzAig0HSaZ
         fS9AHqOvz9u83b6dtU1Z4gaO1DKYOskZW0rtLBU2c87MKSpPKNBhrRdWPQlR6vsbrH
         zvRaYKmZp3WoduEtLh+Og/muuK4moYdkjgzzj/M1024sU0xoGAIDHZlb+bLPN7wF4H
         mq16XN6lK8xsQ==
Message-ID: <bba37b76bc7fbd8ad45e8c7a0b3c8dd0.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cc85ee470c781ff4013f6c21c92c0a21574b12b2.1674703830.git.daniel@makrotopia.org>
References: <cover.1674703830.git.daniel@makrotopia.org> <cc85ee470c781ff4013f6c21c92c0a21574b12b2.1674703830.git.daniel@makrotopia.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: clock: Add compatibles for MT7981
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jianhui Zhao <zhaojh329@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Edward-JW Yang <edward-jw.yang@mediatek.com>,
        Johnson Wang <johnson.wang@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Fabien Parent <fparent@baylibre.com>,
        Miles Chen <miles.chen@mediatek.com>
To:     Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date:   Fri, 27 Jan 2023 15:17:32 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Golle (2023-01-25 19:33:46)
> Add compatible string for MT7981 to existing bindings at
>  - mediatek,apmixedsys.yaml
>  - mediatek,topckgen.yaml
>  - mediatek,ethsys.txt
>  - mediatek,infracfg.yaml
>  - mediatek,sgmiisys.txt
>=20
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next
