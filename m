Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F22E4B1475
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347441; cv=none; b=IDxWBdksSM/IX9bN83avp7dtyH4+hbsZ3wTwwlzWY8LWomV3RANm6RiXiZXW/7S4zXM2mD55UGmBz5Ln+iW6lGWYgdlO7STilr+33HzLruS5AdCBiUH1X2kYpYBumkbYBTi6J+0I1qKbh0aP8+MWeCYCm3GKQL/N+yJvEuG0Dqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347441; c=relaxed/simple;
	bh=s2tP4LuXG6DitbJlb4NU+9ieo9q10zgjsECRa7Nn+zo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fD9y6cO3uOAeZo2qzy5QoLwPnjpbHzk9908uI7kp1lZGY+nERxAihgvUK5wNS0WH5QKVOVSUDtQVzGMhOW9GQnvOnjqE1OXUgC1pndJ94kEJ8uN/Vdvp8abOgAyUdKSoIF8EgVoKfbqV8SORGE0VcVcl2U2d+2XhLjMoAxjklDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=IApszyH0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="IApszyH0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369d18so6876105e9.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 07:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790347430; x=1790952230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DtEfZGf6pOZoZKp7BZybV8NV7US5hG1rb4KkghHs3uw=;
        b=IApszyH0rgyC4GkO6MAkId0rbPwMzvK/8y6/2cqShaoWCeQ8QT7rYGJq60/UFcOojd
         veasg+HsVcSBPzuke75fWJgfwHcws4zyhTx+TvNBRyZaPvgoy6nivXgU/YkQVCz64AUr
         w9qNn6HuCUZp4yfrxzV+9whjxBKi55GZjtlRQ469lTsecEwpyMMRHVTcpWHCZUrL5SiK
         8CUB7Xn5pz8ZX3rdzJLqn8BZWg2Q9FLHC9ice5UoHnFN+Ns3Nbt02ZenjS5ljdm9AEkm
         I2BLVzXJ0YFg5sURuvZ4AUlcWhAAWLS6RnsGD/qHTtg6DHdxDFxmst+msC3pl9jzpyN8
         sKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790347430; x=1790952230;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DtEfZGf6pOZoZKp7BZybV8NV7US5hG1rb4KkghHs3uw=;
        b=iiTSk02r96ZD9STNjHxbCjt0UtXirzscpX+YqQs+YpHzd/yHx/60Qv6rxDb4y+r3j8
         oiyJ+eUR3o0PO2jFleDFp9LF3kvEhMs92Xls/2sBnLPv+Jq90j/d7QmWYGQiwo0RwIYx
         EXo9VfecFjUK07yjAihe2s3ffvRxUYJltyHts9+90CzHxQElr3vpZQDPkKLuSX2NdaN4
         vzlu5Qbe8pBEp4EdA8oByTA6C9aV0u+4XqEMtuVVVDCBYmUZcXnKJ2RM8sbEjL/YBLxs
         cj/afuQM3ciYz/yJV+8+TiO+CRtuKw8/zqBflpgo4E9BlOtSiba7WYjkvmWJSdIs4+VF
         t2Tg==
X-Forwarded-Encrypted: i=1; AKwUvByE4QES+CZqpR4vSI0zynu1T+4ZrWjesZXfvQ4z2X5yy9DJKfbPb06wqfUq/N1iHEd505VoX/OyaCM=@vger.kernel.org
X-Gm-Message-State: AFuF++lMAo/TpurpEfvPLYn1tkPEz+Hkb8mT8GoeVe857wi6sT582HpL
	N9n+X1mRbSv0d5Jh/G1C3xETrp1vA99qa35M/50lr9p+0sc7uUTInBLChO4+LrFKclI=
X-Gm-Gg: AYBFou1L46kc1838JwqGeITh0zSdFz0Gl0X4KSVSi7/NZtXVz9nwwAmvmErw2CtvXZX
	Etgn9EHbuSCHX7O6SGbHrotbTIfHI+0aZrjRFjAXX8ZRh7tFZZn3WQkBsAhYuDTt+yNP2AmYrpD
	X3SIMcFEpRTX+aNPXyWRuXPSFEjFLMPoYgBk3ygyZcoSRFdDdoLlvHpFmeLaLbV3R4SiDVJvZXJ
	rx+CgBTRLDd+rFneOp4KnRripgLOMwH8wlsE9mNmVF765eUnUuVyS3oQDQBYfE3iVRRAHOmCPq8
	E8jN/HSQtUM0/QtWhNKgGjZHSqwFtaJjZavstrN8MZRSv34H/QMjIdcvIX9SKHkR68pgl4dJZEX
	fbEfLFuvFywhOIen6xnTaRR9+LWO5Q/BHXWFUAGkQJd7xV6SaI7urx6ss+dOCcNoF6IWcNRHZqg
	xslsUyTRYO/4/eA2j2x6RJsYzWDK2ZadyhV4R7zoUj1slnKvpIKYyMjJnFdHbzEgDVLAvU+YLVs
	D9/JM6clp079DbheQ==
X-Received: by 2002:a05:600c:c8f:b0:49c:dc14:d681 with SMTP id 5b1f17b1804b1-49fe66bdf3bmr105928135e9.3.1790347430286;
        Fri, 25 Sep 2026 07:43:50 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a35607bsm7104435f8f.16.2026.09.25.07.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:43:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Cody Kang <codykang.hk@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu
 <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, Guodong Xu <docular.xu@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
Subject: Re: [PATCH v2 06/17] clk: spacemit: k3: parent eDP/DP pixel clock
 to the PHY PLL
In-Reply-To: <20260809-k3-display-v2-6-327d7910bf71@gmail.com>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-6-327d7910bf71@gmail.com>
Date: Fri, 25 Sep 2026 16:43:46 +0200
Message-ID: <1jwls975nh.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dim. 09 ao=C3=BBt 2026 at 21:14, Cody Kang <codykang.hk@gmail.com> wrote:

> The APMU eDP/DP pixel-clock muxes were parented to a placeholder, because
> their real parents (the DP PHY PLLs) did not exist as clocks yet. They do
> now, so point each mux at its PLL and let the pixel clock reach the
> controller through the clock framework.
>
> Signed-off-by: Cody Kang <codykang.hk@gmail.com>
>
> ---
> v2:
> - no change
> ---
>  drivers/clk/spacemit/ccu-k3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
> index cb0c4277f72a8..afbbbd797826d 100644
> --- a/drivers/clk/spacemit/ccu-k3.c
> +++ b/drivers/clk/spacemit/ccu-k3.c
> @@ -937,13 +937,13 @@ CCU_MUX_DIV_GATE_FC_DEFINE(ufs_aclk, ufs_aclk_paren=
ts, APMU_UFS_CLK_RES_CTRL, 5,
>=20=20
>  static const struct clk_parent_data edp0_pclk_parents[] =3D {
>  	CCU_PARENT_HW(lcd_pxclk),
> -	CCU_PARENT_NAME(external_clk),
> +	CCU_PARENT_NAME(edp0_pll_pxclk),

hidden behind this macro is a .fw_name. Basically these are your DT
input names. You can't change them at will like that because your
bindings are supposed to be stable.

You should not use placeholder name, ever. No need to make the
name too specific either, from the beginning it should have been
something like "pixel_pll" or whatever your doc refer it with.

"external_clk" is not declared in your bindings AFAICT, so at least it
should be fine to remove it.

There need to be a dt-binding patch documenting the new name you need
and then you can start using it in the driver.

In the future, please try to document all the inputs of your controller
in the bindings. Even if you do not use them yet, they exist.

>  };
>  CCU_MUX_GATE_DEFINE(edp0_pxclk, edp0_pclk_parents, APMU_LCD_EDP_CTRL, 2,=
 1, BIT(1), 0);
>=20=20
>  static const struct clk_parent_data edp1_pclk_parents[] =3D {
>  	CCU_PARENT_HW(dsi4ln2_lcd_pxclk),
> -	CCU_PARENT_NAME(external_clk),
> +	CCU_PARENT_NAME(edp1_pll_pxclk),
>  };
>  CCU_MUX_GATE_DEFINE(edp1_pxclk, edp1_pclk_parents, APMU_LCD_EDP_CTRL, 18=
, 1, BIT(17), 0);
>=20=20
>
> --=20
> 2.43.0
>

--=20
Jerome
