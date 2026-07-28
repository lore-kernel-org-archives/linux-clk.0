Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211FE31F989
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 11:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785236590; cv=pass; b=L2nsi8NBZlV7SdUax633tDIPcqv1IF94tjbDXoAnNM4DgSPPiiIWfxdJwnQCJmobPJvRxr1dt/UAAZstY6GeH1CG7G7iwxtCJttTI/Fgr1KZzKVCvY2SFwnOOuBEEWp1pCXjzdSN3SKK4y9VywqNdZ7clA8ZD7AzAn4p0v21CBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785236590; c=relaxed/simple;
	bh=ms3FsfMQl5pt2bFlLZQJz3ObTnfNGwSFWZ0COBLXibo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWc8a+fKbmhxDcFVsh/MnpcZ9F5gJ5PJjf3H+PItyVKyLzDUrsu6Zg1EeyN0FUd2u3Tfdbf42BNyJKaYWORcfMEB0bomHq6y+DEU+FcL9A/a79ddIL+nwsd8ZGe/Ml7cyUUiDG2Hr+72JzBrZP2ZTjHzdY8yQ1+0BXBLCim33p8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6/cl7GZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ebcCccd7; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6/cl7GZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ebcCccd7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SAga4x2527782
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 11:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEo90+ufTyVzDZ/DcNd96ylgR0f41XkgBnoTqwgNH8o=; b=M6/cl7GZ4xHpEI5b
	yiOGkKZMzzWa33Wyy5d9w2e2ATGlLWv7CeN19xFJFkSrfXh/ku0hCLYN4+JB5aE+
	GOEgWX9lKEGBeKIyLHvUIFsoM7SwCz91uQI6hstdby8y9BLkTT7n239ULNeDjBWf
	vvmFK2DR1Eb7bn1ti4n110Ab5ff8w09WWPek6kNNECD4xqHd+18lcASpVux/swk3
	Hy9LTXX8SnYXgHvdTSJSaPFxD9wKl/Td9/lhRT0Vu0Vl3xxE95h7AtSZJznI31zp
	gmPcY2HI45MZBSMTtxYE4S5ygnFqqO2wIG5/JRRhXJ9RWJ/z9bEHSV6kxPFmIMow
	Jx/IlA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn19hmac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 11:03:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930edb4362dso394497385a.3
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 04:03:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785236585; cv=none;
        d=google.com; s=arc-20260327;
        b=rWnmbln0Hm24cJqTPFW94D18HH0Y6wEx27fhDyBovS95lebx7ZKhtpuUAlxuFM4rPA
         pfptfeKKgAQF7K8mRUw4vxeBtoJFxvlhFBsj8fHW4sxV2lnO0F+W0EamPkoO8g7oZnlH
         XGxFrCZ8C9Hg31r8TwQ/pJY174uL+gf/2fnlcoJVEk8lrQbdQfFnDaY1ok5Wv/mReCxv
         MAhfeXd9ml2pMR3kr7J0JK1qWYgQu2bIlhp0/s3Lw07297y238P9Q9skb8nPYywYUuqp
         F2XVMrbXOsmjlVajA+nkq4/cQCI/ynwAZKB0TK8sHQTIKrjyUSlK49ztLohNnZ8gtESx
         lGUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HEo90+ufTyVzDZ/DcNd96ylgR0f41XkgBnoTqwgNH8o=;
        fh=8mwGxww7PzJhwEomCMcRB3h4KP3V8z3xV10m9r1EVPQ=;
        b=Inabh66Hq9vm2RTOZoqbgS8NWsC7ltiQFrTn3Vn/JpsSpEp2tMkW8fCK2rRSf4LYO+
         AGK/W+3K+QZ2klqCOCyWrp3fdHEr8lNbM6hln/MBB2yQNyzPKEQYlFyqoQ0bbDDA1+Ag
         5gFu77xdWr1FPeXc7Hf7034lo01CQWx2PTReYGtvPujDw46rauO64uMyVN1RM2FASYeL
         oWCyS79v16+znOtA9qQy+FxTos+Q/hKLOstdciTLunbJ/NbjpOkBNxNYnpNQMuZmRaxa
         0OeAkgaVrZNyKgskSg/X7MlFZP8+aoy29qYO+rO8IlVVRHFfKeEEOJuEx3wC0NS2X6JV
         zw+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785236585; x=1785841385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HEo90+ufTyVzDZ/DcNd96ylgR0f41XkgBnoTqwgNH8o=;
        b=ebcCccd7dz9kefolw09BfJbTPNaJIa6zK1OPuT6FEd6mFgQE6RuvxBytEPAlszNpcK
         07eidwp+wF7VaFK1gDDvAtX77Top89rWR10R9joYQaC+HkwXEuJwpe88P8G/4ZBZ2kiO
         uLFi1C1d9AYBJBvkPgo2zxac4PVLrebnporQ8AaN3t4L44Nbprnk/lC6Fgs2FoeCSQYU
         jCemVuKsBjkzkCs8B72j2eKl/I055RQTyvC6QrWeDBoo2qpVf9Y3yTYDL/l9IMUhrDQk
         J1Kuy6AtP6TNJoaPhDkfFN1ihUAIMK5DdAy3MeH00AbVClgrArrziJRLWARYG87PhWp5
         TlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785236585; x=1785841385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HEo90+ufTyVzDZ/DcNd96ylgR0f41XkgBnoTqwgNH8o=;
        b=O0D2qdvxE11SagzXD/il9vVaC8PnCGOUIeixcd/5xkf8WQYeWcqfupKljTB7IeEcFb
         JmNWP7BqQsnngzNc9yKsESGHVjQGfr6tTkavOKCUEqK2yGnl5ezfjLW7B7e2Ngk+KRun
         Av2kzth1JWvXkq0GGb3MpMry8aXyeBp9EXCFugQycXDdaGrTFMMFQeogpGKmRT+bOF2a
         oe5g55gLWumvaUs6LfAE2q7xtW3vujExdqIdYUP4ik7cw37nqmBRyiABWdqkgwEdMV/i
         /9HyxrGzIXlim6St1lXKG/sywYiOcOhK7tXfxsj+WG48FLoX2Gi0QjU0e/ltIe4erXtV
         YM0w==
X-Forwarded-Encrypted: i=1; AHgh+RrXWdmu7DFaL3qAM8raVEjQgrlhVeX8u0FkZJXHCw1fLnB+rIRENKh2iO00HqJAqZkGTZsnVdr1cgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCf21TQsgL2ZDLWbxgnIPSfou6ya6xbEG0X6SOLEI+L78+IGwO
	aQyMSHB2mHAB2+7WTkMbWYIxxCxsN92Ls4CKd62SDe9JJ9Aq6ZvPyR2sGN//sYjhjV5Fl6rs1GZ
	e9ZCotCgmpftB0w2RsLu7Il1PnwkY7nBjXMpSGKpQB4/5oV1OLCWFiLZJw2CwIwr5rymFWuVCCt
	WY3YXMMl4ClvyIc8roBpgIGPnHZtGy/ee1Ge8bgQ==
X-Gm-Gg: AR+sD12M6UW0Q8Jxv4NFxF6Wmxuo36Bb/Yu2pzbnIBgE2CUIdXSrxxnA/4tm5RRq0h3
	vYwx5jFKHsdkDuZ7icAXHicaccapH2Epo4iMeTiQHiVwBL5s+Nv6hO9Tsv/WaNibdTOSVS+1ova
	ea/KkSO006tv/sNm2yjhTYPz3Wu+RuAfBdT/0cG2zYQyKSgX0+nzg0CyseCSLeO32ZDo3DFkVQv
	lanQEH39K/XFL/qpfLKtdz6+cZvby9CDS37bRpEcZQC6z5vp52k8hLpKOghAKxHj1P1Y1MWOKo=
X-Received: by 2002:a05:620a:261d:b0:92e:c116:bf0e with SMTP id af79cd13be357-933027cb17emr149042085a.87.1785236584509;
        Tue, 28 Jul 2026 04:03:04 -0700 (PDT)
X-Received: by 2002:a05:620a:261d:b0:92e:c116:bf0e with SMTP id
 af79cd13be357-933027cb17emr149035985a.87.1785236583959; Tue, 28 Jul 2026
 04:03:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 13:02:52 +0200
X-Gm-Features: AUfX_mxzPf3RUGkchE_wbbm2kdz3L_JjYCt-nFSpy8HDx1MDQybRMBJNEWByLfg
Message-ID: <CAFEp6-1hsyWr0KJah=r44aXK_cKuFM-k2k4hHK4QP=iu_CGBVA@mail.gmail.com>
Subject: Re: [PATCH v13 3/5] media: qcom: camss: Add support for PHY API devices
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=TJV1jVla c=1 sm=1 tr=0 ts=6a688c69 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=1bk27lSsA0qbyjSzzSoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5NyBTYWx0ZWRfX+zhyQVOC6BFD
 +gQAO25IihQgA/htV+TtkmRfCNEhiB7XoYwXvHWvtBiqdJIN2RVxWD6rVCoarfkoXAXHNz5LUjV
 5tBCr+xJXhCJ8lx7x7/L9jFBCH4pbJCbgeD6marz7jDETf4qMUUqJ1HGXlgbFsdsPGaOE+vhQPM
 FgqXf+zuLGnb27IyzmGzVzle4JTLGgTWp9ZMPfbEG7RyNQeLLxU9P33hDoi5WjFEURYOLSWvVG2
 IYnQ1DzxrHeswIytzaLXLPeI161VqaDt0+hLdfv+RnUZ/FTf/ZaWhHqX6iB6QsA5zH8XaF0XLg3
 lvJRgKPQkOlTyezvrU9EUIJ6fsroyW65sRWvuX1Fd1EkAnfor8Df+yY1+UEkSZmWRzSlxGaylpm
 XSfLe7zdflQkQyFrrdBjrNDXPbe7bDZMfvlN/itDxzy6fNyAVmtfsvSKZVjgkPG/+3oLK9QIKL8
 mAnHu0iQB34MEDJCkGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5NyBTYWx0ZWRfX4GHhqcqgXJwp
 WyrXp/qhnzs7/E+tQJaLkZ4UgTfuSQQv85oXPhYcS+BgTFllKiPrsLu3nhV8k3bq/quZmZWo+Su
 ABvpQIxdPGfd27INmaI+EybFo6PIm30=
X-Proofpoint-GUID: D5pgenZFt-ZRFm6OmeVk6zZGMWvtvE9_
X-Proofpoint-ORIG-GUID: D5pgenZFt-ZRFm6OmeVk6zZGMWvtvE9_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280097

On Tue, Jul 28, 2026 at 11:35=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Add the ability to use a PHY pointer which interacts with the standard PH=
Y
> API.
>
> In the first instance the code will try to use the new PHY interface. If =
no
> PHYs are present in the DT then the legacy method will be attempted.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/Kconfig        |   1 +
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 177 +++++++++++++++++=
++++--
>  drivers/media/platform/qcom/camss/camss-csiphy.h |  11 +-
>  drivers/media/platform/qcom/camss/camss.c        | 104 +++++++++++--
>  drivers/media/platform/qcom/camss/camss.h        |   1 +
>  5 files changed, 263 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/pl=
atform/qcom/camss/Kconfig
> index 4eda48cb1adf0..1edc5e5a1829e 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -7,3 +7,4 @@ config VIDEO_QCOM_CAMSS
>         select VIDEO_V4L2_SUBDEV_API
>         select VIDEOBUF2_DMA_SG
>         select V4L2_FWNODE
> +       select PHY_QCOM_MIPI_CSI2
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index 539ac4888b608..e00748dd83b02 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -13,6 +13,8 @@
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <media/media-entity.h>
> @@ -131,10 +133,10 @@ static u8 csiphy_get_bpp(const struct csiphy_format=
_info *formats,
>  }
>
>  /*
> - * csiphy_set_clock_rates - Calculate and set clock rates on CSIPHY modu=
le
> + * csiphy_set_clock_rates_legacy - Calculate and set clock rates on CSIP=
HY module
>   * @csiphy: CSIPHY device
>   */
> -static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
> +static int csiphy_set_clock_rates_legacy(struct csiphy_device *csiphy)
>  {
>         struct device *dev =3D csiphy->camss->dev;
>         s64 link_freq;
> @@ -200,7 +202,7 @@ static int csiphy_set_clock_rates(struct csiphy_devic=
e *csiphy)
>   *
>   * Return 0 on success or a negative error code otherwise
>   */
> -static int csiphy_set_power(struct v4l2_subdev *sd, int on)
> +static int csiphy_set_power_legacy(struct v4l2_subdev *sd, int on)
>  {
>         struct csiphy_device *csiphy =3D v4l2_get_subdevdata(sd);
>         struct device *dev =3D csiphy->camss->dev;
> @@ -219,7 +221,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, i=
nt on)
>                         return ret;
>                 }
>
> -               ret =3D csiphy_set_clock_rates(csiphy);
> +               ret =3D csiphy_set_clock_rates_legacy(csiphy);
>                 if (ret < 0) {
>                         regulator_bulk_disable(csiphy->num_supplies,
>                                                csiphy->supplies);
> @@ -254,7 +256,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, i=
nt on)
>  }
>
>  /*
> - * csiphy_stream_on - Enable streaming on CSIPHY module
> + * csiphy_stream_on_legacy - Enable streaming on CSIPHY module
>   * @csiphy: CSIPHY device
>   *
>   * Helper function to enable streaming on CSIPHY module.
> @@ -262,7 +264,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, i=
nt on)
>   *
>   * Return 0 on success or a negative error code otherwise
>   */
> -static int csiphy_stream_on(struct csiphy_device *csiphy)
> +static int csiphy_stream_on_legacy(struct csiphy_device *csiphy)
>  {
>         struct csiphy_config *cfg =3D &csiphy->cfg;
>         s64 link_freq;
> @@ -306,11 +308,88 @@ static int csiphy_stream_on(struct csiphy_device *c=
siphy)
>   *
>   * Helper function to disable streaming on CSIPHY module
>   */
> -static void csiphy_stream_off(struct csiphy_device *csiphy)
> +static void csiphy_stream_off_legacy(struct csiphy_device *csiphy)
>  {
>         csiphy->res->hw_ops->lanes_disable(csiphy, &csiphy->cfg);
>  }
>
> +/*
> + * csiphy_stream_on - Enable streaming on CSIPHY module
> + * @csiphy: CSIPHY device
> + *
> + * Helper function to enable streaming on CSIPHY module.
> + * Main configuration of CSIPHY module is also done here.
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int csiphy_stream_on(struct csiphy_device *csiphy)
> +{
> +       u8 bpp =3D csiphy_get_bpp(csiphy->res->formats->formats, csiphy->=
res->formats->nformats,
> +                               csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
> +       struct csiphy_lanes_cfg *lncfg =3D &csiphy->cfg.csi2->lane_cfg;
> +       struct phy_configure_opts_mipi_dphy *dphy_cfg;
> +       union phy_configure_opts dphy_opts =3D { 0 };
> +       struct device *dev =3D csiphy->camss->dev;
> +       u8 num_lanes =3D lncfg->num_data;
> +       s64 link_freq;
> +       int ret;
> +
> +       dphy_cfg =3D &dphy_opts.mipi_dphy;
> +
> +       link_freq =3D camss_get_link_freq(&csiphy->subdev.entity, bpp, nu=
m_lanes);
> +
> +       if (link_freq < 0) {
> +               dev_err(dev,
> +                       "Cannot get CSI2 transmitter's link frequency\n")=
;
> +               return -EINVAL;
> +       }
> +
> +       phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes, =
dphy_cfg);
> +
> +       phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
> +
> +       ret =3D phy_configure(csiphy->phy, &dphy_opts);
> +       if (ret) {
> +               dev_err(dev, "failed to configure MIPI D-PHY\n");
> +               goto error;
> +       }
> +
> +       return phy_power_on(csiphy->phy);
> +
> +error:
> +       return ret;
> +}
> +
> +/*
> + * csiphy_stream_off - Disable streaming on CSIPHY module
> + * @csiphy: CSIPHY device
> + *
> + * Helper function to disable streaming on CSIPHY module
> + */
> +static void csiphy_stream_off(struct csiphy_device *csiphy)
> +{
> +       phy_power_off(csiphy->phy);
> +}
> +
> +/*
> + * csiphy_set_stream - Enable/disable streaming on CSIPHY module
> + * @sd: CSIPHY V4L2 subdevice
> + * @enable: Requested streaming state
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int csiphy_set_stream_legacy(struct v4l2_subdev *sd, int enable)
> +{
> +       struct csiphy_device *csiphy =3D v4l2_get_subdevdata(sd);
> +       int ret =3D 0;
> +
> +       if (enable)
> +               ret =3D csiphy_stream_on_legacy(csiphy);
> +       else
> +               csiphy_stream_off_legacy(csiphy);
> +
> +       return ret;
> +}
>
>  /*
>   * csiphy_set_stream - Enable/disable streaming on CSIPHY module
> @@ -572,16 +651,16 @@ csiphy_match_clock_name(const char *clock_name, con=
st char *format, ...)
>  }
>
>  /*
> - * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resou=
rces
> + * msm_csiphy_subdev_init_legacy - Initialize CSIPHY device structure an=
d resources
>   * @csiphy: CSIPHY device
>   * @res: CSIPHY module resources table
>   * @id: CSIPHY module id
>   *
>   * Return 0 on success or a negative error code otherwise
>   */
> -int msm_csiphy_subdev_init(struct camss *camss,
> -                          struct csiphy_device *csiphy,
> -                          const struct camss_subdev_resources *res, u8 i=
d)
> +int msm_csiphy_subdev_init_legacy(struct camss *camss,
> +                                 struct csiphy_device *csiphy,
> +                                 const struct camss_subdev_resources *re=
s, u8 id)
>  {
>         struct device *dev =3D camss->dev;
>         struct platform_device *pdev =3D to_platform_device(dev);
> @@ -709,6 +788,56 @@ int msm_csiphy_subdev_init(struct camss *camss,
>         return ret;
>  }
>
> +/*
> + * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resou=
rces
> + * @camss: CAMSS structure
> + * @port: DT port index
> + *
> + * Return 0 on success or absence of link, negative error code otherwise
> + */
> +int msm_csiphy_subdev_init(struct camss *camss, u8 port)
> +{
> +       const struct camss_subdev_resources *res =3D &camss->res->csiphy_=
res[port];
> +       struct csiphy_device *csiphy =3D &camss->csiphy[port];
> +       struct device *dev =3D camss->dev;
> +       struct device_node *ep, *remote;
> +       int ret;
> +
> +       ep =3D of_graph_get_endpoint_by_regs(dev->of_node, port, -1);
> +       if (!ep)
> +               return 0;
> +
> +       remote =3D of_graph_get_remote_port_parent(ep);
> +       of_node_put(ep);
> +       if (!remote)
> +               return 0;
> +
> +       if (!of_device_is_available(remote)) {
> +               of_node_put(remote);
> +               return 0;
> +       }
> +
> +       csiphy->phy =3D devm_phy_get_by_of_node(dev, remote);
> +       of_node_put(remote);
> +       if (IS_ERR(csiphy->phy)) {
> +               ret =3D PTR_ERR(csiphy->phy);
> +               goto done;
> +       }
> +
> +       csiphy->camss =3D camss;
> +       csiphy->id =3D res->csiphy.id;
> +       csiphy->res =3D &res->csiphy;
> +
> +       snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy-=
>id);
> +
> +       ret =3D phy_init(csiphy->phy);
> +       if (ret)
> +               dev_err(dev, "%s init fail %d\n", csiphy->name, ret);
> +
> +done:
> +       return ret;
> +}
> +
>  /*
>   * csiphy_link_setup - Setup CSIPHY connections
>   * @entity: Pointer to media entity structure
> @@ -743,8 +872,12 @@ static int csiphy_link_setup(struct media_entity *en=
tity,
>         return 0;
>  }
>
> -static const struct v4l2_subdev_core_ops csiphy_core_ops =3D {
> -       .s_power =3D csiphy_set_power,
> +static const struct v4l2_subdev_core_ops csiphy_core_ops_legacy =3D {
> +       .s_power =3D csiphy_set_power_legacy,
> +};
> +
> +static const struct v4l2_subdev_video_ops csiphy_video_ops_legacy =3D {
> +       .s_stream =3D csiphy_set_stream_legacy,
>  };
>
>  static const struct v4l2_subdev_video_ops csiphy_video_ops =3D {
> @@ -758,8 +891,13 @@ static const struct v4l2_subdev_pad_ops csiphy_pad_o=
ps =3D {
>         .set_fmt =3D csiphy_set_format,
>  };
>
> +static const struct v4l2_subdev_ops csiphy_v4l2_ops_legacy =3D {
> +       .core =3D &csiphy_core_ops_legacy,
> +       .video =3D &csiphy_video_ops_legacy,
> +       .pad =3D &csiphy_pad_ops,
> +};
> +
>  static const struct v4l2_subdev_ops csiphy_v4l2_ops =3D {
> -       .core =3D &csiphy_core_ops,
>         .video =3D &csiphy_video_ops,
>         .pad =3D &csiphy_pad_ops,
>  };
> @@ -785,10 +923,15 @@ int msm_csiphy_register_entity(struct csiphy_device=
 *csiphy,
>  {
>         struct v4l2_subdev *sd =3D &csiphy->subdev;
>         struct media_pad *pads =3D csiphy->pads;
> -       struct device *dev =3D csiphy->camss->dev;
> +       struct camss *camss =3D csiphy->camss;
> +       struct device *dev =3D camss->dev;
>         int ret;
>
> -       v4l2_subdev_init(sd, &csiphy_v4l2_ops);
> +       if (camss->legacy_phy)
> +               v4l2_subdev_init(sd, &csiphy_v4l2_ops_legacy);
> +       else
> +               v4l2_subdev_init(sd, &csiphy_v4l2_ops);
> +
>         sd->internal_ops =3D &csiphy_v4l2_internal_ops;
>         sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
>         snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
> @@ -828,6 +971,8 @@ int msm_csiphy_register_entity(struct csiphy_device *=
csiphy,
>   */
>  void msm_csiphy_unregister_entity(struct csiphy_device *csiphy)
>  {
> +       if (!IS_ERR(csiphy->phy))
> +               phy_exit(csiphy->phy);
>         v4l2_device_unregister_subdev(&csiphy->subdev);
>         media_entity_cleanup(&csiphy->subdev.entity);
>  }
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.h
> index 9d9657b82f748..7a357044b9fdb 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -12,6 +12,7 @@
>
>  #include <linux/clk.h>
>  #include <linux/interrupt.h>
> +#include <linux/phy/phy.h>
>  #include <media/media-entity.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-mediabus.h>
> @@ -97,6 +98,7 @@ struct csiphy_device_regs {
>
>  struct csiphy_device {
>         struct camss *camss;
> +       struct phy *phy;
>         u8 id;
>         struct v4l2_subdev subdev;
>         struct media_pad pads[MSM_CSIPHY_PADS_NUM];
> @@ -104,6 +106,7 @@ struct csiphy_device {
>         void __iomem *base_clk_mux;
>         u32 irq;
>         char irq_name[30];
> +       char name[16];
>         struct camss_clock *clock;
>         bool *rate_set;
>         int nclocks;
> @@ -118,9 +121,11 @@ struct csiphy_device {
>
>  struct camss_subdev_resources;
>
> -int msm_csiphy_subdev_init(struct camss *camss,
> -                          struct csiphy_device *csiphy,
> -                          const struct camss_subdev_resources *res, u8 i=
d);
> +int msm_csiphy_subdev_init_legacy(struct camss *camss,
> +                                 struct csiphy_device *csiphy,
> +                                 const struct camss_subdev_resources *re=
s, u8 id);
> +
> +int msm_csiphy_subdev_init(struct camss *camss, u8 port);
>
>  int msm_csiphy_register_entity(struct csiphy_device *csiphy,
>                                struct v4l2_device *v4l2_dev);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7..84097d82d99c9 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4799,8 +4799,43 @@ static int camss_parse_ports(struct camss *camss)
>         fwnode_graph_for_each_endpoint(fwnode, ep) {
>                 struct camss_async_subdev *csd;
>
> -               csd =3D v4l2_async_nf_add_fwnode_remote(&camss->notifier,=
 ep,
> -                                                     typeof(*csd));
> +               if (!fwnode_device_is_available(ep))
> +                       continue;
> +
> +               if (camss->legacy_phy) {
> +                       csd =3D v4l2_async_nf_add_fwnode_remote(&camss->n=
otifier, ep,
> +                                                             typeof(*csd=
));
> +               } else {
> +                       struct fwnode_handle *phy_out, *phy_node, *phy_in=
, *sensor_ep;
> +
> +                       phy_out =3D fwnode_graph_get_remote_endpoint(ep);
> +                       if (!phy_out)
> +                               continue;
> +
> +                       phy_node =3D fwnode_graph_get_port_parent(phy_out=
);
> +                       fwnode_handle_put(phy_out);
> +                       if (!phy_node)
> +                               continue;
> +
> +                       phy_in =3D fwnode_graph_get_endpoint_by_id(phy_no=
de, 0, 0, 0);
> +                       fwnode_handle_put(phy_node);
> +                       if (!phy_in)
> +                               continue;
> +
> +                       sensor_ep =3D fwnode_graph_get_remote_endpoint(ph=
y_in);
> +                       fwnode_handle_put(phy_in);
> +                       if (!sensor_ep)
> +                               continue;
> +
> +                       csd =3D v4l2_async_nf_add_fwnode(&camss->notifier=
, sensor_ep,
> +                                               struct camss_async_subdev=
);
> +                       fwnode_handle_put(sensor_ep);
> +                       if (IS_ERR(csd)) {
> +                               ret =3D PTR_ERR(csd);
> +                               goto err_cleanup;
> +                       }
> +               }
> +
>                 if (IS_ERR(csd)) {
>                         ret =3D PTR_ERR(csd);
>                         goto err_cleanup;
> @@ -4819,6 +4854,29 @@ static int camss_parse_ports(struct camss *camss)
>         return ret;
>  }
>
> +static void camss_detect_legacy_phy(struct camss *camss)
> +{
> +       struct device_node *remote;
> +       struct device_node *ep;
> +
> +       camss->legacy_phy =3D true;
> +
> +       /* Find first remote-endpoint and determine if its a PHY */
> +       for_each_endpoint_of_node(camss->dev->of_node, ep) {
> +               remote =3D of_graph_get_remote_port_parent(ep);
> +               if (!remote)
> +                       continue;
> +
> +               camss->legacy_phy =3D !of_node_name_eq(remote, "phy");
> +               of_node_put(remote);
> +               of_node_put(ep);
> +               break;
> +       }
> +
> +       dev_dbg(camss->dev, "legacy phy mode %s\n",
> +               camss->legacy_phy ? "true" : "false");
> +}
> +
>  /*
>   * camss_init_subdevices - Initialize subdev structures and resources
>   * @camss: CAMSS device
> @@ -4832,14 +4890,21 @@ static int camss_init_subdevices(struct camss *ca=
mss)
>         unsigned int i;
>         int ret;
>
> +       camss_detect_legacy_phy(camss);
> +
>         for (i =3D 0; i < camss->res->csiphy_num; i++) {
> -               ret =3D msm_csiphy_subdev_init(camss, &camss->csiphy[i],
> -                                            &res->csiphy_res[i],
> -                                            res->csiphy_res[i].csiphy.id=
);
> +               if (!camss->legacy_phy) {
> +                       ret =3D msm_csiphy_subdev_init(camss, i);
> +               } else {
> +                       ret =3D msm_csiphy_subdev_init_legacy(camss,
> +                                                           &camss->csiph=
y[i],
> +                                                           &res->csiphy_=
res[i],
> +                                                           res->csiphy_r=
es[i].csiphy.id);
> +               }
> +
>                 if (ret < 0) {
> -                       dev_err(camss->dev,
> -                               "Failed to init csiphy%d sub-device: %d\n=
",
> -                               i, ret);
> +                       dev_err(camss->dev, "csiphy %d init fail\n",
> +                               res->csiphy_res[i].csiphy.id);
>                         return ret;
>                 }
>         }
> @@ -4917,6 +4982,11 @@ inline void camss_link_err(struct camss *camss,
>                 ret);
>  }
>
> +static inline bool csiphy_enabled(struct camss *camss, struct csiphy_dev=
ice *c)
> +{
> +       return camss->legacy_phy || c->phy;
> +}
> +
>  /*
>   * camss_link_entities - Register subdev nodes and create links
>   * @camss: CAMSS device
> @@ -4930,6 +5000,9 @@ static int camss_link_entities(struct camss *camss)
>
>         for (i =3D 0; i < camss->res->csiphy_num; i++) {
>                 for (j =3D 0; j < camss->res->csid_num; j++) {
> +                       if (!csiphy_enabled(camss, &camss->csiphy[i]))
> +                               continue;
> +
>                         ret =3D media_create_pad_link(&camss->csiphy[i].s=
ubdev.entity,
>                                                     MSM_CSIPHY_PAD_SRC,
>                                                     &camss->csid[j].subde=
v.entity,
> @@ -5056,6 +5129,9 @@ static int camss_register_entities(struct camss *ca=
mss)
>         int ret;
>
>         for (i =3D 0; i < camss->res->csiphy_num; i++) {
> +               if (!csiphy_enabled(camss, &camss->csiphy[i]))
> +                       continue;
> +
>                 ret =3D msm_csiphy_register_entity(&camss->csiphy[i],
>                                                  &camss->v4l2_dev);
>                 if (ret < 0) {
> @@ -5131,8 +5207,10 @@ static int camss_register_entities(struct camss *c=
amss)
>
>         i =3D camss->res->csiphy_num;
>  err_reg_csiphy:
> -       for (i--; i >=3D 0; i--)
> -               msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +       for (i--; i >=3D 0; i--) {
> +               if (csiphy_enabled(camss, &camss->csiphy[i]))
> +                       msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +       }
>
>         return ret;
>  }
> @@ -5147,8 +5225,10 @@ static void camss_unregister_entities(struct camss=
 *camss)
>  {
>         unsigned int i;
>
> -       for (i =3D 0; i < camss->res->csiphy_num; i++)
> -               msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +       for (i =3D 0; i < camss->res->csiphy_num; i++) {
> +               if (csiphy_enabled(camss, &camss->csiphy[i]))
> +                       msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +       }
>
>         if (camss->tpg) {
>                 for (i =3D 0; i < camss->res->tpg_num; i++)
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 93d691c8ac63b..ba3d51d9c0bf8 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -138,6 +138,7 @@ struct camss {
>         struct device_link *genpd_link;
>         struct icc_path *icc_path[ICC_SM8250_COUNT];
>         const struct camss_resources *res;
> +       bool legacy_phy;
>  };
>
>  struct camss_camera_interface {
>
> --
> 2.54.0
>
