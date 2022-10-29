Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CB8FA3745
	for <linux-clk@archiver.kernel.org>; Sat, 29 Oct 2022 09:11:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbiJ2JLh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 29 Oct 2022 05:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbiJ2JLg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 29 Oct 2022 05:11:36 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714A874DFF;
        Sat, 29 Oct 2022 02:11:35 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id j7so2915633pjn.5;
        Sat, 29 Oct 2022 02:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XGovVwjV1E6BtwAiQsNOA452MnQdQNOQG6D6vOb6hjA=;
        b=p2QpFFF5brhI4B/eXe+Z4xKQnOouzEpVnsR2XVDcm6l2MYNVqlTciLf4+nBkZxvVnP
         oFSWEV1VNijYMeOfawxJGLATxCcZyE+2Ep5EkFwnGqACwpt188YeIlh0E/i3wPBvtwcQ
         6p1hfuLM/TBc5AvXxutguyvUN4gvjjV8zvXSq8YqEzyiJfxZwSMvF7pSe5TTJuuXS5wy
         vuLc60YIxYAEYtYjEjGQwsmjCIPzvg2e5WPgD4KqKhrtuyMw8ETHzKclKdrbZPz+5HYW
         hInjBTHcD+fAYruoqy00HDYWKdsBiKLgfQKI+jqNeHCWdgEpjazZVUMUP+K96RgWDNoa
         2kFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGovVwjV1E6BtwAiQsNOA452MnQdQNOQG6D6vOb6hjA=;
        b=VBzXX0IgS4L2TJOOnHluohLpeXjon8mIhQeNgTdjoWc/XPS203Q5sbpFQBb392AFV9
         AuTyxmNTTv8i+mqb+mUllZiC0BdoHpe/iCoIPPsGl6ATVn4OVyEoQlcwxJHenQrlTbVV
         DynqjBuI8K9y3pMTskxu5/xZQkQKXIRnN3P7Sm98XFIs1nAtf4oFfXkKwHoTToMGMmc+
         daazj/oLLlJI5b34Io2yLHSLFCbexnnqcJUpuLVJ6Y3qNxW8X8PpmW8LBtIqKS2e/wVf
         aXqxyjcrg0b2mFNferbNN13tIbNlCQPPDnUjgb3McpCLRvReKCWbg+Yk0NOL7pbzwlDb
         w51g==
X-Gm-Message-State: ACrzQf27OWUudc0s3/fhXad6B1751sc/x6ypBddN2la8qoI5K0mbSOyM
        MNDiC9Pp7ja8XoMmLK8iXBA=
X-Google-Smtp-Source: AMsMyM4OatQFYqVqmKwLry/ueQrrTE1Ary//IAEG8r6UYYkfBMVy9IEHCtjpLWqjIXaf33tEae5evQ==
X-Received: by 2002:a17:90a:9606:b0:213:aff5:e537 with SMTP id v6-20020a17090a960600b00213aff5e537mr1690450pjo.183.1667034694859;
        Sat, 29 Oct 2022 02:11:34 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-1.three.co.id. [180.214.232.1])
        by smtp.gmail.com with ESMTPSA id i66-20020a626d45000000b0056b8e788acesm789333pfc.82.2022.10.29.02.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 02:11:34 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 1AF4E103D6E; Sat, 29 Oct 2022 16:11:30 +0700 (WIB)
Date:   Sat, 29 Oct 2022 16:11:30 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linuxppc-dev@lists.ozlabs.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 4/9] phy: fsl: Add Lynx 10G SerDes driver
Message-ID: <Y1zuQvkyqtHOPGrk@debian.me>
References: <20221027191113.403712-1-sean.anderson@seco.com>
 <20221027191113.403712-5-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9mhS4nfECiIf9yXH"
Content-Disposition: inline
In-Reply-To: <20221027191113.403712-5-sean.anderson@seco.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--9mhS4nfECiIf9yXH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2022 at 03:11:08PM -0400, Sean Anderson wrote:
>  .. only::  subproject and html
> diff --git a/Documentation/driver-api/phy/lynx_10g.rst b/Documentation/dr=
iver-api/phy/lynx_10g.rst
> new file mode 100644
> index 000000000000..ebbf4dd86726
> --- /dev/null
> +++ b/Documentation/driver-api/phy/lynx_10g.rst
> @@ -0,0 +1,58 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +Lynx 10G Phy (QorIQ SerDes)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Using this phy
> +--------------
> +
> +:c:func:`phy_get` just gets (or creates) a new :c:type:`phy` with the la=
nes
> +described in the phandle. :c:func:`phy_init` is what actually reserves t=
he
> +lanes for use. Unlike some other drivers, when the phy is created, there=
 is no
> +default protocol. :c:func:`phy_set_mode <phy_set_mode_ext>` must be call=
ed in
> +order to set the protocol.
> +
> +Supporting SoCs
> +---------------
> +
> +Each new SoC needs a :c:type:`struct lynx_conf <lynx_conf>`, containing =
the
> +number of lanes in each device, the endianness of the device, and the he=
lper
> +functions to use when selecting protocol controllers. For example, the
> +configuration for the LS1046A is::

Did you mean struct lynx_cfg as in below snippet?

> +
> +    static const struct lynx_cfg ls1046a_cfg =3D {
> +        .lanes =3D 4,
> +        .endian =3D REGMAP_ENDIAN_BIG,
> +        .mode_conflict =3D lynx_ls_mode_conflict,
> +        .mode_apply =3D lynx_ls_mode_apply,
> +        .mode_init =3D lynx_ls_mode_init,
> +    };
> +
> +The ``mode_`` functions will generally be common to all SoCs in a series=
 (e.g.
> +all Layerscape SoCs or all T-series SoCs).
> +
> +In addition, you will need to add a device node as documented in
> +``Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml``. This lets t=
he
> +driver know which lanes are available to configure.
> +
> +Supporting Protocols
> +--------------------
> +
> +Each protocol is a combination of values which must be programmed into t=
he lane
> +registers. To add a new protocol, first add it to :c:type:`enum lynx_pro=
tocol
> +<lynx_protocol>`. Add a new entry to `lynx_proto_params`, and populate t=
he
> +appropriate fields. Modify `lynx_lookup_proto` to map the :c:type:`enum
> +phy_mode <phy_mode>` to :c:type:`enum lynx_protocol <lynx_protocol>`. Up=
date
> +the ``mode_conflict``, ``mode_apply``, and ``mode_init`` helpers are upd=
ated to
> +support your protocol.
> +

These lynx_ keywords should be in double backticks to be consistent
(rendered as inline code).

Also, don't forget to add conjunctions:

"... Then modify ``lynx_lookup_proto`` ... Finally, update the ...
helpers ..."

> +You may need to modify :c:func:`lynx_set_mode` in order to support your
> +protocol. This can happen when you have added members to :c:type:`struct
> +lynx_proto_params <lynx_proto_params>`. It can also happen if you have s=
pecific
> +clocking requirements, or protocol-specific registers to program.
> +
> +Internal API Reference
> +----------------------
> +
> +.. kernel-doc:: drivers/phy/freescale/phy-fsl-lynx-10g.c

Otherwise LGTM, thanks.

--=20
An old man doll... just what I always wanted! - Clara

--9mhS4nfECiIf9yXH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY1zuPAAKCRD2uYlJVVFO
o0lFAQDAGPql7PsJtgyOHANd61r9QA5C1NsAs7p1z2APtWtn7wD8CZbEagXT+kX1
GJMBh0UPc1fhpUiL2ln6IRYVs6nfRw0=
=CfkV
-----END PGP SIGNATURE-----

--9mhS4nfECiIf9yXH--
