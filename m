Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FA43B636E
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 13:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775570362; cv=pass; b=cdKYg4wpVSFYBvYlXCWEblvPk9k1zTD0LNefYSv9fTOCXm4iBXJ5rwWrKJb2eFJp68lPUhJsOLWqWUKCHHDSzrVNIvU43agj2/Y5OtUWfrMY0EqI9J2zHx5yHDB+GaKFz7Thex9dJ4spSS1GB/WervLOuU0MvA98JgQlnWqEbwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775570362; c=relaxed/simple;
	bh=+n5doLzOFi7ZKgFPZX/LE5Tj2tXEj16CUUf+VmgJ/WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FO3snUtNrKXDwJadS19xMyMOgtVj3VJUmIZWcuCOeryBe35k7QlMCqqe0WaE4XKraJQP+ZIuTspH2ixoL526VYaqILEZ/AX9vfsUU2XtITBtfX1Ih77OA3nmfPmMzE7iqyN/9YQOUi8Hek1p6byGLy1zmvJnfZsUOI7I33e57/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=US70F4Ie; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dKP0xK6+; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="US70F4Ie";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dKP0xK6+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637D5jXL3402354
	for <linux-clk@vger.kernel.org>; Tue, 7 Apr 2026 13:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5wwLRnMPrBmfeeZTx0oik5QwI8hZXsXAmq60o8j4/sk=; b=US70F4IeoblYjB0X
	FedEtZ94wXfHGR6zhgWh5PA3Qm2/RbrNC3kSUk83Nix4x277d7b7RJKiOayP32u3
	T23wWA4fQ2CswbO/TMSC/Mzs7I00W/H6EIMlih5m5igB01wmDxKhfiLGjnbfuUC4
	dOWUwspxQKo+G6c6YSCHoaPXssHRsH3iQ0ND+OEILigJcayO2tR/KWQOsP9gcVAJ
	eJppLkEqdbcTiQSsxTKJXBuQ06mxMFfGU3q7KER6uDKe422Jso0LHP2yGCJrxejT
	skQ9af8U30lvFgPSVYtD+DjrdJRTzeMVcCej4P87tKOnrsPeCCH+tEBlCxWiYICz
	prK0Uw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrhtyjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 13:59:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso83574661cf.1
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 06:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775570360; cv=none;
        d=google.com; s=arc-20240605;
        b=J1lqbpURuCdpBfXLTZDp4InQe040u5kMOm7GMxP49FGDK2p3HJCKgWM8u+iyrOHmsP
         Bl19VOndtzrlOSuqJpNP7RTEOOOR6a1kySToI0mli8KatZJDjQZ81GP1IsIVJJiCNiB+
         jyzWJY79zMhFWmztlSBXv30OifTZgr4hNxn7Tr6Ukm9gFPc3fxOxUjTmvIdH5q6EARuS
         iemyR6rZ/xaP7Uw1MsCSaWssB9sxrDoDohSf+qOg6FLjidtRIxKFJ9qnnfKo/yoPu3xd
         HTGTvrGTnYtWv0bCH1+Sj9+9rEplCyzzn2JZYQyYX+KnwjNwLtMWCNQxze8J8NQgrbL3
         NNsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5wwLRnMPrBmfeeZTx0oik5QwI8hZXsXAmq60o8j4/sk=;
        fh=554UJpCGU0F4187z20+89c2iMKtDUNI484T8iVNWt70=;
        b=Piw/PeCzSJ9uI2W10QrEpNM5Rs5U7DsS+oS3AqoLWKOfjy564AHNjqfwFs0uHq0Vdq
         8YLxOXitED1hmlFrAhbCl4kXzVxJlvX2K57DGwQvHCdnwlH6wdFJXRItftNmonyE1Vm7
         HyFOfNgTaYvnlKiy40u8A7CdW40rNS7h2U8V5x5PNpukoRiO3mR3m+9GEpKsnQXpQmtC
         QRMqLJA/hkke27lNCoRQipy8UjoFDfK/it4Kw/GcKFMAmtihCG05wV16QWdHcxAyCuDW
         H8i58LpKvN3w7jZ2Wjp70F12Ey7D4A7Z/997Beq/NpT6iFwY3aFeAiU+nNXRuVnMoScQ
         66Sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775570360; x=1776175160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wwLRnMPrBmfeeZTx0oik5QwI8hZXsXAmq60o8j4/sk=;
        b=dKP0xK6+2IVJ0VLC0jG/FUR6viEx/ma7uvian5DbAD5jAatE0RlWkCQGAkWlmwgHw3
         M9Z81cz1eTj7iL4aWl0DNobhtF1VHJgyeI3ILyIEDhrVxVe4w0/FnrpQeLQk3/pIXNHF
         9VopBfHCBqiX/3wkS9kXK9uNF/wK61c7iikUW5Y2N9JLw/0E4mn+Obkdm/HgmDdO8+sS
         7RnYdejpKKAA8IPcs7utHS38V/WUGb5bSwiu/VBFYYdphgRbq935PbqGEKgeJe6AIXE4
         FYIA7TIIu0mUBDdQ0VpNjTr0R2rMJn9o0Jg91rtY3HrTrD2hbA1hg9bLBl/FFYsWMwLK
         tp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775570360; x=1776175160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5wwLRnMPrBmfeeZTx0oik5QwI8hZXsXAmq60o8j4/sk=;
        b=kA6JE0lK1xOqHL6zD9A5sd80NpwOEZLKJdRs+oXczY7XiVJ8roBJtZTaHQ4qJauHuV
         iOgVJttSCpE1EmwqbTjV2QL4dNRb/ZB0zCJr0eHTlEjFQWkldfa6DxCFhUoVgppXkbcu
         UMzC+i8xTYlFlkJo8w2kjkxAZzlhlXWUDjUeW47cMYlQVj95nAPlww/ckfBKA0IJeKz1
         IO1ijQ3SS17mNeNN6kPBHOQ1bUTnW4JhT3lti1TGZw1qWPqBKHSsP4Zg0L4qboUWHhdq
         uu2DkUmS7eSIx8vqKsTv0wVpoEm3w6R0+y80kvmaypWzOnW/MsG1tQssmq3YBZTtF/VP
         jN0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjfnS9VH2QeH/Ya3SWabu0CEfHhyDHkTJc5rL1CV7Vl594PN+PypFEjIwn9T5/wVesNpWONowDnI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQkCrg3G5esqFeseHA1F2/BS7BepAe98pBH0n/rYEzGHilelIn
	nllJ3R9dgIYYXnlzVunGKhiCCSOqXk72lb+X7Cg1GurvKgk+T+9AdB7TFS/9mtbv2qi067qLNek
	peekPO8v0BUuyPuJyk3Tzf2/lKmueCpbNRDO/J+FSGE/ccFaruke3kiLkKCK4niJqNGTungDqeL
	F6trxiBAsf6hvPxS/07Ys/+ycN0akYWbsTqNFHGw==
X-Gm-Gg: AeBDieu6F92ZGDWQIFetJbojau12qL9Yaptk57XXqUiQ/r9e376mkbLEa225MvKjmyr
	2A3ordgp8Py8PZNXJS+Lp2r0CH9b36pghGachIufKiIvcKfWNVzRlZvfCt8Q4OFlfqnODro00rU
	v2OydSjGIIjF5uhxzKq4iJ7cUn+Ac6iwvMi2KUBGhw4lvZnydA0nTtHE1TX8d+NkmHHJF0tQ12Z
	kepAm8YCQSsmTMxdCuv3Uapx36Hu0EU7rV/z8Q=
X-Received: by 2002:a05:622a:229f:b0:50d:7b0c:35e7 with SMTP id d75a77b69052e-50d7b0c40a9mr186001131cf.43.1775570359655;
        Tue, 07 Apr 2026 06:59:19 -0700 (PDT)
X-Received: by 2002:a05:622a:229f:b0:50d:7b0c:35e7 with SMTP id
 d75a77b69052e-50d7b0c40a9mr186000641cf.43.1775570359192; Tue, 07 Apr 2026
 06:59:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-7-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-7-5b93415be6dd@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:59:08 +0200
X-Gm-Features: AQROBzBZogzJhWGuTj1SVy1UDtblAmXk85UGkr9wH9qtEaCpzQ0Senf27mBKbGs
Message-ID: <CAFEp6-03ZCUiZ-_bjK1cxoCOWf=GY6V0cntZ-DYrpKM+zpPAVg@mail.gmail.com>
Subject: Re: [PATCH v11 7/7] media: qcom: camss: Drop legacy PHY descriptions
 from x1e
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
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Christopher Obbard <christopher.obbard@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyOSBTYWx0ZWRfX8LA7DeqVoCQo
 lrS2+Z/bEU2R3Xehhf903wVlrzT6JeLwuyG06Yks5BKl3YhW6Sq5ibJpVja1xaDSM2q/5JKdPrj
 h+oIilNUiF0C4XLICybjsZn2ANHKTg21WhDBeMFuXzushKrohFGQCqBlLRn+LRM5Lla8Y1o0qGa
 GCNgyO9/Bh64r07r68KEWYdeY+/SqinKfpNJ0nn5dv4Xn/+iYpv34k3FLKVWi7IJKeyjv7+uLLk
 aKyyo2fB94Ja4HwWKwSzpT7CfGzbsYxlAgF2FMjEgf0xVilrjE8yJpoqnq0u7F6pb1i6GXmYqYI
 23RShgJBAKSIpJu8WiJWbV9NYzQlyBrlkNw2gOUf3WkJSTg0VBofo1RHNSjoY/RhnbSS0aRj25y
 xyNusZrsniKvF11VjCzgqNPG9o9fwimaqVmLXEG78N47MwtaLHP6hDmOrl5FUiZxtmiiI+9IJvm
 c8kmq1eiiGMk1gPa9IA==
X-Proofpoint-GUID: zHc8_woLe2BOE1RcJk4XezcfRvtlDWl4
X-Authority-Analysis: v=2.4 cv=XPUAjwhE c=1 sm=1 tr=0 ts=69d50db8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=EMJHxtQxxZhPlACdTpMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: zHc8_woLe2BOE1RcJk4XezcfRvtlDWl4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070129

On Thu, Mar 26, 2026 at 2:29=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> x1e is the first CAMSS SoC to use the new PHY interface. Drop the redunda=
nt
> legacy CSIPHY descriptions.
>
> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 37 -------------------------=
------
>  1 file changed, 37 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 224b5472d7771..3b092560b5df5 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3896,15 +3896,6 @@ static const struct resources_icc icc_res_sa8775p[=
] =3D {
>  static const struct camss_subdev_resources csiphy_res_x1e80100[] =3D {
>         /* CSIPHY0 */
>         {
> -               .regulators =3D {
> -                       { .supply =3D "vdd-csiphy-0p8", .init_load_uA =3D=
 105000 },
> -                       { .supply =3D "vdd-csiphy-1p2", .init_load_uA =3D=
 58900 }
> -               },
> -               .clock =3D { "csiphy0", "csiphy0_timer" },
> -               .clock_rate =3D { { 300000000, 400000000, 480000000 },
> -                               { 266666667, 400000000 } },
> -               .reg =3D { "csiphy0" },
> -               .interrupt =3D { "csiphy0" },
>                 .csiphy =3D {
>                         .id =3D 0,
>                         .hw_ops =3D &csiphy_ops_3ph_1_0,
> @@ -3913,15 +3904,6 @@ static const struct camss_subdev_resources csiphy_=
res_x1e80100[] =3D {
>         },
>         /* CSIPHY1 */
>         {
> -               .regulators =3D {
> -                       { .supply =3D "vdd-csiphy-0p8", .init_load_uA =3D=
 105000 },
> -                       { .supply =3D "vdd-csiphy-1p2", .init_load_uA =3D=
 58900 }
> -               },
> -               .clock =3D { "csiphy1", "csiphy1_timer" },
> -               .clock_rate =3D { { 300000000, 400000000, 480000000 },
> -                               { 266666667, 400000000 } },
> -               .reg =3D { "csiphy1" },
> -               .interrupt =3D { "csiphy1" },
>                 .csiphy =3D {
>                         .id =3D 1,
>                         .hw_ops =3D &csiphy_ops_3ph_1_0,
> @@ -3930,15 +3912,6 @@ static const struct camss_subdev_resources csiphy_=
res_x1e80100[] =3D {
>         },
>         /* CSIPHY2 */
>         {
> -               .regulators =3D {
> -                       { .supply =3D "vdd-csiphy-0p8", .init_load_uA =3D=
 105000 },
> -                       { .supply =3D "vdd-csiphy-1p2", .init_load_uA =3D=
 58900 }
> -               },
> -               .clock =3D { "csiphy2", "csiphy2_timer" },
> -               .clock_rate =3D { { 300000000, 400000000, 480000000 },
> -                               { 266666667, 400000000 } },
> -               .reg =3D { "csiphy2" },
> -               .interrupt =3D { "csiphy2" },
>                 .csiphy =3D {
>                         .id =3D 2,
>                         .hw_ops =3D &csiphy_ops_3ph_1_0,
> @@ -3947,15 +3920,6 @@ static const struct camss_subdev_resources csiphy_=
res_x1e80100[] =3D {
>         },
>         /* CSIPHY4 */
>         {
> -               .regulators =3D {
> -                       { .supply =3D "vdd-csiphy-0p8", .init_load_uA =3D=
 105000 },
> -                       { .supply =3D "vdd-csiphy-1p2", .init_load_uA =3D=
 58900 }
> -               },
> -               .clock =3D { "csiphy4", "csiphy4_timer" },
> -               .clock_rate =3D { { 300000000, 400000000, 480000000 },
> -                               { 266666667, 400000000 } },
> -               .reg =3D { "csiphy4" },
> -               .interrupt =3D { "csiphy4" },
>                 .csiphy =3D {
>                         .id =3D 4,
>                         .hw_ops =3D &csiphy_ops_3ph_1_0,
> @@ -5365,7 +5329,6 @@ static const struct camss_resources sm8650_resource=
s =3D {
>  static const struct camss_resources x1e80100_resources =3D {
>         .version =3D CAMSS_X1E80100,
>         .pd_name =3D "top",
> -       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_x1e80100,
>         .csid_res =3D csid_res_x1e80100,
>         .vfe_res =3D vfe_res_x1e80100,
>
> --
> 2.52.0
>
>
