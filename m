Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B877C433E0
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 18:39:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE39B64EE8
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 18:39:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbhBEQ40 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Feb 2021 11:56:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:47040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233510AbhBEQyp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 5 Feb 2021 11:54:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 872B964E51;
        Fri,  5 Feb 2021 18:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612550186;
        bh=zu4EkbIsCr5MTTU2ofXyRKe7qoxT3wFjKeei8Yx1as8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=G5H/U+fMcu/j4CI5uQL9h7JReZuu6xBLT0bFOdVPv3HHEshrGCVoGtxUBK4+siEQ6
         M+6qWAcf5GoEU7N47TyFxEvJZVMtD/YCxUWdesJ6nYEkdcZwL0E+Rbdv7z4mCqokj9
         EtvhPfEQg8bF6oBFWebjUrQ6ZNvEa3LK8bUvxHXXa5RVeR1YqNf0C3XtGl8QcIQTl3
         q5xjDHZhLAm1zMiFLXHq5Ti7vWkTfWRw793OAM7BxppYHC3X+8R0ycLvsYTuyURBRJ
         rW0jms5mcHEQFcpYQEQbvEdTiOIJhy/v/U1rJSF4fhJ/loShz3CNBCMCQuI01X0J7f
         nqHutE9q+w+nw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1612446810-6113-2-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1612446810-6113-1-git-send-email-shubhrajyoti.datta@xilinx.com> <1612446810-6113-2-git-send-email-shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH v8 1/7] dt-bindings: add documentation of xilinx clocking wizard
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, shubhrajyoti.datta@gmail.com,
        robh+dt@kernel.org, gregkh@linuxfoundation.org,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        git-dev@xilinx.com, linux-clk@vger.kernel.org
Date:   Fri, 05 Feb 2021 10:36:25 -0800
Message-ID: <161255018501.76967.17834510006330406420@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2021-02-04 05:53:24)
> Add the devicetree binding for the xilinx clocking wizard.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> v6:
> Fix a yaml warning
> v7:
> Add vendor prefix speed-grade
> v8:
> Fix the warnings

Please run the dt binding checks.

>=20
>  .../bindings/clock/xlnx,clocking-wizard.yaml       | 62 ++++++++++++++++=
++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking=
-wizard.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard=
.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> new file mode 100644
> index 0000000..579bcc1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/xlnx,clocking-wizard.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx clocking wizard
> +
> +maintainers:
> +  - Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> +
> +description:
> +  The clocking wizard is a soft ip clocking block of Xilinx versal. It
> +  reads required input clock frequencies from the devicetree and acts as=
 clock
> +  clock output.
> +
> +properties:
> +  compatible:
> +    const: xlnx,clocking-wizard
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  clocks:
> +    items:
> +      - description: clock input
> +      - description: axi clock
> +
> +  clock-names:
> +    items:
> +      - const: clk_in1
> +      - const: s_axi_aclk
> +
> +  xlnx,speed-grade:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 3]
> +    description:
> +      Speed grade of the device.
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names
> +  - speed-grade

Should be xlnx,speed-grade.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-generator@40040000 {

Just clock-controller please.

> +        #clock-cells =3D <1>;
> +        reg =3D <0x40040000 0x1000>;
> +        compatible =3D "xlnx,clocking-wizard";
> +        xlnx,speed-grade =3D <1>;
> +        clock-names =3D "clk_in1", "s_axi_aclk";
> +        clocks =3D <&clkc 15>, <&clkc 15>;
> +        clock-output-names =3D "clk_out1", "clk_out2",

Please remove this property and auto-generate clk names if necessary.

> +        "clk_out3", "clk_out4", "clk_out5",
> +        "clk_out6", "clk_out7";
> +    };
>
