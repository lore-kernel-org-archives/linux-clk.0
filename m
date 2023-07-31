Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D24C41513
	for <linux-clk@archiver.kernel.org>; Mon, 31 Jul 2023 16:47:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233351AbjGaQrI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Jul 2023 12:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233118AbjGaQrH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 12:47:07 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744FC1722
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 09:47:05 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d0728058651so4963964276.1
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 09:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690822024; x=1691426824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h7ZXjsSf6tAx3asGVuiQEd3Ci5WeA7f/UBUv+GtyjM4=;
        b=Oi1i6jM8nzX93JTx8OvFmNPBz2M9Gio9in1+4mGVdM6m5tOmiSLU4ou38JSDnA1Hps
         t90ZACmussYKUOhQyfuuJ+YP7A7T3MnjOO/ddJX6s/h2HQmSns4AitIW1HJgp0YvPHtz
         3NxI0u3ZDLAl3bTHm8uSIB56qpp02RMuh2INWYYexoINldBbCWnpM/BFCRANlcONABod
         Hq2l47f9857JKBTDDWLZR9o3N9ON1hV3Dqbo/u9/DBpiwlCiFH4swxqHgpAEBhyfFWmV
         kngYR7FEeKbDMgSdCJizFXgwGFoCL0sNGkAqVUNEoDUmBULn3jGXWIwEAjp6KD/nE3f7
         gzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690822024; x=1691426824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7ZXjsSf6tAx3asGVuiQEd3Ci5WeA7f/UBUv+GtyjM4=;
        b=IVJ2OhF7HNFEdWsnJi6Bhl5tJwBMOdw9HMjfC6aDym+ZeEJ+whZkdv02vk8ojQjq0o
         Gi7/31QzTUaq6NybDEgnV195b5guh0EuQuf7ytvOrSMLTp8JL+gFLLw1pjf3FkaQBLM/
         Rw+9NDVfY0e80D8em8K0Ul9CCDzM2N8YFAmE+3g2Ra+8IsmLfi2SqMVTM16YZp1MdZXx
         1ZZc0ERrwjuDlfmVlDsB2v8NZ3/TBfPDX8TXAm6napzxQI4+6mP65gToRBFOKu/DozIL
         Nw631o/tFABXftEqJIKPiylSRu8xBFOIqVI+kDrxX152/shCBLMp4vpplv7e8ZR5UrtV
         KQyg==
X-Gm-Message-State: ABy/qLbqpxogTTkc0E5dVkPnjvDAt7abTYe24Jl8tMpv+V5wH5rBRBYh
        8QdZ2MOqLc+YBWvB2yzC/OeQ/g==
X-Google-Smtp-Source: APBJJlHVe2UaaJO5B3mXn0KZ2J3l9/YGEMBEIweiAfnQG0XXkjGfV3tG9f+7QAVSm9AamtiyGtuHzA==
X-Received: by 2002:a25:734c:0:b0:d00:bc21:a504 with SMTP id o73-20020a25734c000000b00d00bc21a504mr12166149ybc.40.1690822024631;
        Mon, 31 Jul 2023 09:47:04 -0700 (PDT)
Received: from fedora (072-189-067-006.res.spectrum.com. [72.189.67.6])
        by smtp.gmail.com with ESMTPSA id z13-20020a25ad8d000000b00d0c698ed6b6sm2509866ybi.41.2023.07.31.09.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 09:47:03 -0700 (PDT)
Date:   Mon, 31 Jul 2023 12:47:01 -0400
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Patrick Whewell <patrick.whewell@sightlineapplications.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-sm8250: Fix gcc_sdcc2_apps_clk_src
Message-ID: <ZMflhQubbITCBKlF@fedora>
References: <20230728191423.13837-1-patrick.whewell@sightlineapplications.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/rOFXeJeJEPIpyxN"
Content-Disposition: inline
In-Reply-To: <20230728191423.13837-1-patrick.whewell@sightlineapplications.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--/rOFXeJeJEPIpyxN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 12:14:23PM -0700, Patrick Whewell wrote:
> Set .flags =3D CLK_OPS_PARENT_ENABLE to fix "gcc_sdcc2_apps_clk_src: rcg
> didn't update its configuration" error.
>=20
> Signed-off-by: Patrick Whewell <patrick.whewell@sightlineapplications.com>
> Fixes: 3e5770921a88 ("clk: qcom: gcc: Add global clock controller driver =
for SM8250")

The error appears resolved when tested on my Open-Q 865 SOM.

Tested-by: William Breathitt Gray <william.gray@linaro.org>

> ---
>  drivers/clk/qcom/gcc-sm8250.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
> index b6cf4bc88d4d..d3c75bb55946 100644
> --- a/drivers/clk/qcom/gcc-sm8250.c
> +++ b/drivers/clk/qcom/gcc-sm8250.c
> @@ -721,6 +721,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src =3D {
>  		.name =3D "gcc_sdcc2_apps_clk_src",
>  		.parent_data =3D gcc_parent_data_4,
>  		.num_parents =3D ARRAY_SIZE(gcc_parent_data_4),
> +		.flags =3D CLK_OPS_PARENT_ENABLE,
>  		.ops =3D &clk_rcg2_floor_ops,
>  	},
>  };
> --=20
> 2.25.1
>=20

--/rOFXeJeJEPIpyxN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZMflhQAKCRC1SFbKvhIj
K9WPAP0emuG0IfFbFUcbSGg1pjaD2RVmEmR/aMnY01eGm19zWAEAs+swj1y6j371
lccbKAQk14M5ORRzmO+997ZF5u5uNQQ=
=LLqT
-----END PGP SIGNATURE-----

--/rOFXeJeJEPIpyxN--
