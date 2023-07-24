Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61874EB64DD
	for <linux-clk@archiver.kernel.org>; Mon, 24 Jul 2023 18:48:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjGXSsD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jul 2023 14:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjGXSsC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Jul 2023 14:48:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1935610D3;
        Mon, 24 Jul 2023 11:48:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8A390613B3;
        Mon, 24 Jul 2023 18:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC878C433C8;
        Mon, 24 Jul 2023 18:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690224479;
        bh=yNYXsfrJNmdeBVeobNgXJb5DYEPDojoHSpYt2eGHkrM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qOpC80a7EI6QAbjVwFLW9ucgFLuTW5lyDY7PIKIl7BTbEDGCQ3dtoR1oORKBX7iuJ
         h+o3GVs4Jkx8w7QoQBX7apItbu96MAwzcLR59woUALEWdCMlA/dMab4xhLwKZi9zTZ
         vbSm4HmqNgG+SlKk2ReZoEaxJbFxpBasi2R8IDEJDXbtZm0OyQvdcJlbkaWoBQgVGi
         ZNuEX5R/nhxMSITVlBvtKvEWbSU4mSn+FeDtAKCZraCPOsxj+Subi2hzN3lM31eJHe
         PlrXLiOavV6hP6r709wjoxDFyZWP9D1C+vwBA+x+MWEuGKv5DgicHX/KcrUXLwooOD
         9DkRFWQipkAZQ==
Date:   Mon, 24 Jul 2023 19:47:55 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc:     devicetree@vger.kernel.org, git@amd.com, linux-clk@vger.kernel.org,
        michal.simek@amd.com, conor+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com
Subject: Re: [PATCH v3] dt-bindings: clock: versal: Convert the
 xlnx,zynqmp-clk.txt to yaml
Message-ID: <20230724-direness-syrup-14c0b50c8018@spud>
References: <20230724111843.18706-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="psi3FGxcR9HgJVHS"
Content-Disposition: inline
In-Reply-To: <20230724111843.18706-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--psi3FGxcR9HgJVHS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 04:48:43PM +0530, Shubhrajyoti Datta wrote:
> Convert the xlnx,zynqmp-clk.txt to yaml.
> versal-clk.yaml already exists that's why ZynqMP is converted and
> merged.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>=20
> ---
>=20
> Changes in v3:
> Update the min and maxitems=20
>=20
> Changes in v2:
> add enum in compatible
> fix the description
> add constraints for clocks
> name the clock-controller1 to clock-controller
>=20
>  .../bindings/clock/xlnx,versal-clk.yaml       | 78 ++++++++++++++++---
>  .../bindings/clock/xlnx,zynqmp-clk.txt        | 63 ---------------
>  2 files changed, 69 insertions(+), 72 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-c=
lk.txt
>=20
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml=
 b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> index e9cf747bf89b..deebbfd084e8 100644
> --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> @@ -19,7 +19,9 @@ select: false
>  properties:
>    compatible:
>      oneOf:
> -      - const: xlnx,versal-clk
> +      - enum:
> +          - xlnx,versal-clk
> +          - xlnx,zynqmp-clk
>        - items:
>            - enum:
>                - xlnx,versal-net-clk
> @@ -31,16 +33,12 @@ properties:
>    clocks:
>      description: List of clock specifiers which are external input
>        clocks to the given clock controller.
> -    items:
> -      - description: reference clock
> -      - description: alternate reference clock
> -      - description: alternate reference clock for programmable logic
> +    minItems: 3
> +    maxItems: 7

This doesn't seem right to me. The original binding requires 5 clock
inputs, but this will relax it such that only three are needed, no?
You'll need to set constraints on a per compatible basis.

Thanks,
Conor.

>    clock-names:
> -    items:
> -      - const: ref
> -      - const: alt_ref
> -      - const: pl_alt_ref
> +    minItems: 3
> +    maxItems: 7
> =20
>  required:
>    - compatible
> @@ -50,6 +48,59 @@ required:
> =20
>  additionalProperties: false
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - xlnx,versal-clk
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: reference clock
> +            - description: alternate reference clock
> +            - description: alternate reference clock for programmable lo=
gic
> +
> +        clock-names:
> +          items:
> +            - const: ref
> +            - const: alt_ref
> +            - const: pl_alt_ref
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - xlnx,zynqmp-clk
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: PS reference clock
> +            - description: reference clock for video system
> +            - description: alternative PS reference clock
> +            - description: auxiliary reference clock
> +            - description: transceiver reference clock
> +            - description: (E)MIO clock source  (Optional clock)
> +            - description: GEM emio clock  (Optional clock)
> +            - description: Watchdog external clock (Optional clock)
> +
> +        clock-names:
> +          items:
> +            - const: pss_ref_clk
> +            - const: video_clk
> +            - const: pss_alt_ref_clk
> +            - const: aux_ref_clk
> +            - const: gt_crx_ref_clk
> +            - pattern: "^mio_clk[00-77]+.*$"
> +            - pattern: "gem[0-3]+_emio_clk.*$"
> +            - pattern: "swdt[0-1]+_ext_clk.*$"
> +
>  examples:
>    - |
>      firmware {
> @@ -64,4 +115,13 @@ examples:
>          };
>        };
>      };
> +
> +    clock-controller {
> +        #clock-cells =3D <1>;
> +        compatible =3D "xlnx,zynqmp-clk";
> +        clocks =3D <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>,
> +                 <&aux_ref_clk>, <&gt_crx_ref_clk>;
> +        clock-names =3D "pss_ref_clk", "video_clk", "pss_alt_ref_clk",
> +                      "aux_ref_clk", "gt_crx_ref_clk";
> +    };
>  ...
> diff --git a/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt =
b/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt
> deleted file mode 100644
> index 391ee1a60bed..000000000000
> --- a/Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -------------------------------------------------------------------------=
--
> -Device Tree Clock bindings for the Zynq Ultrascale+ MPSoC controlled usi=
ng
> -Zynq MPSoC firmware interface
> -------------------------------------------------------------------------=
--
> -The clock controller is a h/w block of Zynq Ultrascale+ MPSoC clock
> -tree. It reads required input clock frequencies from the devicetree and =
acts
> -as clock provider for all clock consumers of PS clocks.
> -
> -See clock_bindings.txt for more information on the generic clock binding=
s.
> -
> -Required properties:
> - - #clock-cells:	Must be 1
> - - compatible:		Must contain:	"xlnx,zynqmp-clk"
> - - clocks:		List of clock specifiers which are external input
> -			clocks to the given clock controller. Please refer
> -			the next section to find the input clocks for a
> -			given controller.
> - - clock-names:		List of clock names which are exteral input clocks
> -			to the given clock controller. Please refer to the
> -			clock bindings for more details.
> -
> -Input clocks for zynqmp Ultrascale+ clock controller:
> -
> -The Zynq UltraScale+ MPSoC has one primary and four alternative referenc=
e clock
> -inputs. These required clock inputs are:
> - - pss_ref_clk (PS reference clock)
> - - video_clk (reference clock for video system )
> - - pss_alt_ref_clk (alternative PS reference clock)
> - - aux_ref_clk
> - - gt_crx_ref_clk (transceiver reference clock)
> -
> -The following strings are optional parameters to the 'clock-names' prope=
rty in
> -order to provide an optional (E)MIO clock source:
> - - swdt0_ext_clk
> - - swdt1_ext_clk
> - - gem0_emio_clk
> - - gem1_emio_clk
> - - gem2_emio_clk
> - - gem3_emio_clk
> - - mio_clk_XX		# with XX =3D 00..77
> - - mio_clk_50_or_51	#for the mux clock to gem tsu from 50 or 51
> -
> -
> -Output clocks are registered based on clock information received
> -from firmware. Output clocks indexes are mentioned in
> -include/dt-bindings/clock/xlnx-zynqmp-clk.h.
> -
> --------
> -Example
> --------
> -
> -firmware {
> -	zynqmp_firmware: zynqmp-firmware {
> -		compatible =3D "xlnx,zynqmp-firmware";
> -		method =3D "smc";
> -		zynqmp_clk: clock-controller {
> -			#clock-cells =3D <1>;
> -			compatible =3D "xlnx,zynqmp-clk";
> -			clocks =3D <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>, <&aux_re=
f_clk>, <&gt_crx_ref_clk>;
> -			clock-names =3D "pss_ref_clk", "video_clk", "pss_alt_ref_clk","aux_re=
f_clk", "gt_crx_ref_clk";
> -		};
> -	};
> -};
> --=20
> 2.17.1
>=20

--psi3FGxcR9HgJVHS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL7HWwAKCRB4tDGHoIJi
0l7NAQCUufc6rxZuGJBFBuhZAx6wTkRV2NWgtF3lXDqEsBYwEwEAmqjn36lCBs+a
7ub/4Vbn9ekWZL7s7m08ekW48WVKWgg=
=RoG9
-----END PGP SIGNATURE-----

--psi3FGxcR9HgJVHS--
