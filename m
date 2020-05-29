Return-Path: <SRS0=l6vu=7L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22B5C433DF
	for <linux-clk@archiver.kernel.org>; Fri, 29 May 2020 21:17:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93F522071A
	for <linux-clk@archiver.kernel.org>; Fri, 29 May 2020 21:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590787041;
	bh=sME8ruLxoroLuY9q/Uj9rGG2wjg9pRbFEdETtL61H4c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=0HULR/Fs4pzue4pzwdGaG3xwW0eUXFxtw8oCUzc0Hl18blNtFRxOfsiKLWhdWRpxq
	 O/5ysR9LvMZUyuJHkeAeIdctD1TJiN3vrL1v1WSeDJfOXT1J+QY+W3Lw+UkQmoSoVX
	 HVth3XMnSjo+reEcatIfpEX4En5N4Z9ebWZzAWLE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728167AbgE2VRS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 May 2020 17:17:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:37202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727851AbgE2VRR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 29 May 2020 17:17:17 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E984F206A4;
        Fri, 29 May 2020 21:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590787037;
        bh=sME8ruLxoroLuY9q/Uj9rGG2wjg9pRbFEdETtL61H4c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=vhe6AHZO5O8RimaLFP7kzVzLRMLJhrLNePtmAG5uLBJjUaQ6JRJAYxPp8SIUcbzUs
         DxbCTECsbuw/0iJvghP5Ltn4P3z1K0hDb6+5rMpyxS3TiIJ/PsmbweAge1MhAiQEHW
         kQFaEt+erIFhX8IAvajkqKCxoc30++m7FjXXi7DA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <919e2f2f13583d4d53d0e95b81fc3fb8a7606107.1590594293.git-series.maxime@cerno.tech>
References: <cover.662a8d401787ef33780d91252a352de91dc4be10.1590594293.git-series.maxime@cerno.tech> <919e2f2f13583d4d53d0e95b81fc3fb8a7606107.1590594293.git-series.maxime@cerno.tech>
Subject: Re: [PATCH v3 02/25] dt-bindings: clock: Add a binding for the RPi Firmware clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Maxime Ripard <maxime@cerno.tech>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Date:   Fri, 29 May 2020 14:17:16 -0700
Message-ID: <159078703613.69627.13627047580756230984@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2020-05-27 08:44:58)
> The firmware running on the RPi VideoCore can be used to discover and
> change the various clocks running in the BCM2711. Since devices will
> need to use them through the DT, let's add a pretty simple binding.
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

> diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm283=
5-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm=
2835-firmware.yaml
> index cec540c052b6..b48ed875eb8e 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmw=
are.yaml
> +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmw=
are.yaml
> @@ -22,6 +22,25 @@ properties:
>        Phandle to the firmware device's Mailbox.
>        (See: ../mailbox/mailbox.txt for more information)
> =20
> +  clocks:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: raspberrypi,firmware-clocks
> +
> +      "#clock-cells":
> +        const: 1
> +        description: >

Just curious if this is the same as the | syntax? I haven't seen this
used before.

> +          The argument is the ID of the clocks contained by the
> +          firmware messages.
> +
