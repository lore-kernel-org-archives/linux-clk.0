Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA738C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 17 Dec 2021 01:50:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbhLQBu5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Dec 2021 20:50:57 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:41990 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232120AbhLQBux (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Dec 2021 20:50:53 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0912DB82654;
        Fri, 17 Dec 2021 01:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE640C36AE0;
        Fri, 17 Dec 2021 01:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639705850;
        bh=aR2Eao80We00IU9v5oEODCWJIe6zdbSBL1Fw4RhpzJA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rZAylsL6AtVOlxwg73P3yRKzMfnxvEiytsvT0h5LsxIKE5HrPRS6cPAU3ayN7uNLf
         tZdvy6F0rRS/Nd4OXAPXiCgevNv4ob0nzjjZu+i4DiZsvkwlwijQqXXZw1Ct2vAQuM
         t2f5TrhRwLuLY5RL8g1TTVjFcJTjq/3aSbRjhx74AHz7lb0rEy9edEn3DwJpE5UemG
         t7neOCnGLr9YQCpWdyxguK/NvS77CW5BWFvdbbpfua15iAWudvwytEIw9ASeGh3RCq
         7t/edO7YDNaqVMmuPYDAZ/FrZ6UKRJyM7UDJaJpknMf4Tj5BDxl+xii/NCd4Ai55j4
         fsdYQgjUuxULQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211208154535.72286-1-renner@efe-gmbh.de>
References: <20211208154440.72087-1-renner@efe-gmbh.de> <20211208154535.72286-1-renner@efe-gmbh.de>
Subject: Re: [PATCH v2 1/2] clk: si5351: Add DT property for phase offset
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, sebastian.hesselbarth@gmail.com,
        s.hauer@pengutronix.de, devicetree@vger.kernel.org,
        robh+dt@kernel.org, renner@efe-gmbh.de
To:     Jens Renner <renner@efe-gmbh.de>, linux-clk@vger.kernel.org
Date:   Thu, 16 Dec 2021 17:50:49 -0800
User-Agent: alot/0.9.1
Message-Id: <20211217015050.BE640C36AE0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jens Renner (2021-12-08 07:45:35)
> Add optional output clock DT property "silabs,clock-phase" to configure
> the phase offset in degrees with respect to other clock outputs.
> Add missing description for related optional output clock DT property
> "clock-frequency".
>=20
> Signed-off-by: Jens Renner <renner@efe-gmbh.de>
> ---
> Changes in v2:
>   - Use vendor-specific DT property silabs,clock-phase
>=20
>  .../devicetree/bindings/clock/silabs,si5351.txt        | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/silabs,si5351.txt b/=
Documentation/devicetree/bindings/clock/silabs,si5351.txt
> index bfda6af76..0f4e4f41f 100644
> --- a/Documentation/devicetree/bindings/clock/silabs,si5351.txt
> +++ b/Documentation/devicetree/bindings/clock/silabs,si5351.txt
> @@ -50,11 +50,17 @@ Optional child node properties:
>    divider.
>  - silabs,pll-master: boolean, multisynth can change pll frequency.
>  - silabs,pll-reset: boolean, clock output can reset its pll.
> -- silabs,disable-state : clock output disable state, shall be
> +- silabs,disable-state: clock output disable state, shall be
>    0 =3D clock output is driven LOW when disabled
>    1 =3D clock output is driven HIGH when disabled
>    2 =3D clock output is FLOATING (HIGH-Z) when disabled
>    3 =3D clock output is NEVER disabled
> +- clock-frequency: integer in Hz, output frequency to generate (2500-200=
000000)

Is this assigned-clock-rates?

> +  This defines the output frequency set during boot. It can be reprogram=
med
> +  duing runtime through the common clock framework.
> +- silabs,clock-phase: integer, phase shift in degrees (0-359), using the

Do we need an assigned-clock-phase property?

> +  multisynth initial phase offset register (depends on the clock source /
> +  output ratio) and the clock output inverter (180 deg. only).
