Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B7532F764
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 12:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525638; cv=pass; b=mqIDnc+uGEgelEJR8tMULMnjhwuHObisc5EspwwuhHplIoHkPD5ISccuNgTUNMPraV+GqyjQfxndR0atvZQ0c4gQD89q4N9yggl4huc4aHqPQAGr8t3OQQxBy1W0NF6UM4dze6cMNtt7pQKt+EGuko2ljokJfIp1hA6pxrnLXyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525638; c=relaxed/simple;
	bh=tlSwqxAiw604cpb1dgd/H8C/UkaGdvxpywU0LdEuBW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iCa4QcoDeIZP+ggy//rrOdFv/Ma5Ar/CoXbmYNh01Tf9eTdf2K9BKA82D3B4rQkXOojVSpzIdrM998jF0mg1NvwFtnSihs13ke+OxY5IIqDtpcbkLwqUGxf82+EV1QG682bIQdp0vD7ShbJ5IhP/3wxOpDSnwGo1m4mIQYeDljA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+XeAnzc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E64j6sqB; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+XeAnzc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E64j6sqB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AIFk23442519
	for <linux-clk@vger.kernel.org>; Fri, 4 Sep 2026 12:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j0+GeMl6zOe/BFRxRXazQ5C0aLdugDFg6DqX1FNOkk0=; b=a+XeAnzcyW2zl6jE
	UY3r8ydj+u+BsEl/DKXlOKXvLl/iAfayC+PwBPzqTLuYa5rmvdHqY293PJK9tWWd
	Glyf15PS/3SszWklDQ3g+ELtYfYXfUVk3dZZfPAzo0oMfPHz92AHb52eDEpjBApn
	LkSLbb7k1ZZIJm4/21qWDRB0L9ZarRTzsJ5m2NDSNbrC4GuYFQOlVmSZ5UdDtyyu
	3uxC7uR4ICIKvU3kWlmQXAVmjJm0vPKaE7P0naEJ8qhUMoc2aF9rUUG4B0lgLfPp
	xzwBwJJk7QmMeDCqU75FBLiEsPqWUdwG7cjnm8kKMXHpWsIKjQfXp0/fDTM52aDs
	Iz6whg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp781ngm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 12:40:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so186282185a.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 05:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788525633; cv=none;
        d=google.com; s=arc-20260327;
        b=ZIWuYNrDAklsI2PPjv8/EFp3GQrsNjTxcwFPv2qmLPWGad8BWh4BmEaw+BUlSrmStH
         HzRlcNn/Esqk1noOKEOBp4WPfbWnUoQwS4e9Z9hoY2fB62gEkaKrMODHg7kpqMq3e2IR
         st4lJoIXDKTz0pPIR6EBjvu6QpGxtxwgmdDs9YwlGsmv80Hi/plvFrF+19fUpg8tiF2O
         U14wlNUvVvp9gkWfeQ9kIS0OUUnRQs5Gb4gjweMwWPfD2oHx/x3Brjz/O1/VC+BoT+kb
         K1bJi8Qp5XcLk7wUMRW2CCIS3Hc++b5MFmSykspNovF7UXBHXzb3qqOF9S8QJ9K24IUE
         EoWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j0+GeMl6zOe/BFRxRXazQ5C0aLdugDFg6DqX1FNOkk0=;
        fh=HcPrdw2lvVCbbo90tzIc4HYeHaKOCPWsTWKU4EHnrIQ=;
        b=Nw4Yqlyh9av0XdzbutYWmGXQDcCc1vX2Jm6/RtU5bLNQ1FW+unJHMt0zsCBiENgVfQ
         ESCpLHk4BuinnPanW8enr7oPbI4V5ESdK4AQ6LCq0N8LTRjJYRZL5yxx8kJ4hlf0rNYs
         MRE8w21rtiSczxNqDWQb+hw9QvzPa2dwDHjlI1tDr0Nx1fcKndYhkkSCQuXhMNJB9UOh
         sPjYKqimDurbm3L6hSKP/W3hFW2KF99wK1etpcqRUZqE3XJQSAfsSHjOKHVbY7H2x+GI
         vE5154aEPff47ttLs+5z3Aq2ud/MtZk24YTjIO8O6GVT+LGu7VPYpmwLqrGDR4N5qI19
         7kyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788525633; x=1789130433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j0+GeMl6zOe/BFRxRXazQ5C0aLdugDFg6DqX1FNOkk0=;
        b=E64j6sqBghW59tVlAgxDk6N3kHk+qVnlgkQPRjdj2kW1QmCefYqSafeBFMFKQaZEat
         8E69pBkAr78iSbRefvLnx60Xl9CgEadokn6LmDzlvV9wGLthf+Aj517uwbo9PbGklWHV
         Evg0bWXYXBd+K5cv7NJRBSPSeqWGAAsy64cLhuxz3CfrlRV7S1jVrZuc4KZtETeBrH1D
         JzqKQY69J7nWtm0w7LYOk/eF/RYmtEendVMiou8Wgg39MrdkORLFjdeEr0Axa14pvG/o
         G1kV4zZ3jGTeS9H9Zr4YME+VACHFRVcwWpG/RPtwYeYMmQLzOBopGHK46PHCYvxQ/cKU
         fGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525633; x=1789130433;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j0+GeMl6zOe/BFRxRXazQ5C0aLdugDFg6DqX1FNOkk0=;
        b=qLhiB8tIEnG3kbhbfP1LY6p4fUcrOVtyLs3JnafIdm8dXcKzNxsAuwg5zh6LstOUFV
         tHahVfIREw8xY09x5an2XhfGdAIplP2/jswrzyteGGzvqGByepRgzPOImicXcVmpztnh
         S+W9bUenOu0ywwveGMcfYhWiSVMiQGJms2a0jeuvNTsNgQb9BHbvqwbsGp3AmQcLpqm/
         glk4IKd42VPip1dek6NH4GO8gE09srVj0oe5GMDZvI4Ax3bYPAz0g+kGNiZbQmee8Af7
         eCpjDfDeukcTrpfwkuxmiGk8Ln+rBxbaWEEQ6XUokKWn978STyeGxnFE91I1503RRx1Y
         akUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvTlVZqkuQqXt5knp3O+m9EmHJMCFDOmmsgVkocJJCG65N6ojPfuUdElRFOfvbivA3UnOcKwd4a/U=@vger.kernel.org
X-Gm-Message-State: AFuF++n83NQwF+KnKBEc7dDXNm1tA2qpOVN3b5v9txymBuzLntIlxn53
	ntZVNBXx1Aqbe1XJCByC58Ig1hOSX83cNr6m+fU2QZ1B4aCtUI5Xg4aZBSkSwfkttoz0ueE5UNm
	jjCi5cvftAIlqHzPdaBdmUzmTOcLBjebQufjNWWbRNw9p8aIvxZwIm09UYImYA+2kGmNjv+7EDi
	MC+5LlD0jZDbOWEaGmws0w9dpDkgBzMe14RyE5Nv9hAg8qg/bo
X-Gm-Gg: AYBFou378MY6WMo3Hrnu9UzHhuCm7v+T09G5Ku6BVMS/W3ZbQ1uaDfrfkIo25Mo92zq
	CQ3ILvxiyMbVQQtUOY4umDyQUrFK4n67MTo4mjyEHkfaeYWHmgKqS5vaMhcIOZwUZWTmMnGioVm
	UZxV0GVZAs6pSaUVpXRPtxz4TaluhztaznPDHtnPHk0YNh9n6ZsaE3hIoHGU3OeCKyQGonuBG+J
	gMiHBZdItBA0sVOUv8OeUeFlZAinZIoAOFSIFBw6SkQa3fKOK4rcSHBQDW1HWCdzQ3RGWbZTquH
X-Received: by 2002:a05:620a:690a:b0:936:dc16:206b with SMTP id af79cd13be357-9398043f64fmr553876485a.26.1788525632530;
        Fri, 04 Sep 2026 05:40:32 -0700 (PDT)
X-Received: by 2002:a05:620a:690a:b0:936:dc16:206b with SMTP id
 af79cd13be357-9398043f64fmr553866185a.26.1788525631793; Fri, 04 Sep 2026
 05:40:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-0-68b7916e7a3f@linaro.org>
 <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-1-68b7916e7a3f@linaro.org>
In-Reply-To: <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-1-68b7916e7a3f@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 14:40:20 +0200
X-Gm-Features: AcwNN1UPiDdyGKcq8V93lMRdj7jZ5WTUE_ubspKx3Qn_j0cuDTBr-ZQNMU5Z3Uo
Message-ID: <CAFEp6-0NyozWY7DVoFbNNuDkVY3nmHsvys5=84mM7OVH6cHfGA@mail.gmail.com>
Subject: Re: [PATCH v15 1/4] phy: core: Fix use-after-free in phy_get paths
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExNCBTYWx0ZWRfX7EsHMCNANFmC
 fh2jHikqrjQ/Im4KJPtTNftH4sxeH3MKKrNOL9FfTaK52xaxR/XXI6KM6Yy6gXAcZVxlI9GwKX9
 AoiM76rkjY/JXFsNs2Pj8X+PMhNzXZk=
X-Proofpoint-ORIG-GUID: VS4XH0ED7KW7-i0eQceUoIT9IvVtl7ZF
X-Authority-Analysis: v=2.4 cv=ab5RWxot c=1 sm=1 tr=0 ts=6a9abc41 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uuK-gh7oNHpeqQh_G3oA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: VS4XH0ED7KW7-i0eQceUoIT9IvVtl7ZF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExNCBTYWx0ZWRfX4v+piNnVrsVA
 jcDEN+T3ser7WUMKug3PVrZtVhqLJeqP3uV/kmhhpVlWJMOZNpGX3cIJ299/DxgBET2mKs/c1Ku
 zadWxXoWBdQBeDE6RkewMnmHC8ukr1x/QvqGe5baVrBCWbdWlMev9QlpqNiopXpu5gcOMDidoFa
 sXyVO3FlL2LdLJbg0QdyTHXJ7Sq42eBU8Cp/MdTuR7Yag9u3HgDsIA8HDzjfldWsJ/UUnKd5G0L
 p4AovsJyb9xu2LaxtssMzSbbKwWjlhiEx0rCE4/NB5YYOLLDrPkawssM/5/rMC96aYWWrsowjRT
 9y2r8LJZAj9jelymP64enKIfBBUhUqPXNz8tN/cH4R4w/UUL49CJO+IVxLGjuPvVrlgzTFnD7Mw
 WlHk1QOOuN8Xw0jU4kcdLsjfpBfOC+M51NPh2j8NXz3bzS8qEpb/Ec2Zt6NMmz+9oI3ypsdD7aN
 YkCyRz5/9A4OyhAEYLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040114

On Fri, Sep 4, 2026 at 1:53=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Sashiko asked during a patch review if the existing usage pattern had a
> race condition; specifically in of_phy_get() if it was possible between
> returning from _of_phy_get() and running try_module_get() that a module
> might be unbound leading to use-after-free.
>
> Looking at the code this appears to be so, there is no linkage between th=
e
> phy and module under a synchronisation primitive.
>
> Using the phy_provider_mutex in phy_get() will ensure there is a link bet=
ween
> the returned phy pointer and the module_get() bumping the module referenc=
e
> count.
>
> Amend phy_get(), of_phy_get() and devm_of_phy_get_by_index() to fix the
> same usage pattern.
>
> phy_provider_unregister() must take the phy_provider_mutex so amending
> phy_get()/of_phy_get() to take that same mutex guarantees there is no
> use-after-free.
>
> Fixes: ff764963479a1 ("drivers: phy: add generic PHY framework")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/phy/phy-core.c | 45 ++++++++++++++++++++++++++++++--------------=
-
>  1 file changed, 30 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 21aaf2f76e53e..89addd732bff3 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -124,13 +124,13 @@ static struct phy *phy_find(struct device *dev, con=
st char *con_id)
>         const char *dev_id =3D dev_name(dev);
>         struct phy_lookup *p, *pl =3D NULL;
>
> -       mutex_lock(&phy_provider_mutex);
> +       lockdep_assert_held(&phy_provider_mutex);
> +
>         list_for_each_entry(p, &phys, node)
>                 if (!strcmp(p->dev_id, dev_id) && !strcmp(p->con_id, con_=
id)) {
>                         pl =3D p;
>                         break;
>                 }
> -       mutex_unlock(&phy_provider_mutex);
>
>         return pl ? pl->phy : ERR_PTR(-ENODEV);
>  }
> @@ -624,6 +624,8 @@ static struct phy *_of_phy_get(struct device_node *np=
, int index)
>         struct phy *phy =3D NULL;
>         struct of_phandle_args args;
>
> +       lockdep_assert_held(&phy_provider_mutex);
> +
>         ret =3D of_parse_phandle_with_args(np, "phys", "#phy-cells",
>                 index, &args);
>         if (ret)
> @@ -635,11 +637,10 @@ static struct phy *_of_phy_get(struct device_node *=
np, int index)
>                 goto out_put_node;
>         }
>
> -       mutex_lock(&phy_provider_mutex);
>         phy_provider =3D of_phy_provider_lookup(args.np);
>         if (IS_ERR(phy_provider) || !try_module_get(phy_provider->owner))=
 {
>                 phy =3D ERR_PTR(-EPROBE_DEFER);
> -               goto out_unlock;
> +               goto out_put_node;
>         }
>
>         if (!of_device_is_available(args.np)) {
> @@ -653,8 +654,6 @@ static struct phy *_of_phy_get(struct device_node *np=
, int index)
>  out_put_module:
>         module_put(phy_provider->owner);
>
> -out_unlock:
> -       mutex_unlock(&phy_provider_mutex);
>  out_put_node:
>         of_node_put(args.np);
>
> @@ -678,15 +677,21 @@ struct phy *of_phy_get(struct device_node *np, cons=
t char *con_id)
>         if (con_id)
>                 index =3D of_property_match_string(np, "phy-names", con_i=
d);
>
> +       mutex_lock(&phy_provider_mutex);
> +
>         phy =3D _of_phy_get(np, index);
>         if (IS_ERR(phy))
> -               return phy;
> +               goto out_unlock;
>
> -       if (!try_module_get(phy->ops->owner))
> -               return ERR_PTR(-EPROBE_DEFER);
> +       if (!try_module_get(phy->ops->owner)) {
> +               phy =3D ERR_PTR(-EPROBE_DEFER);
> +               goto out_unlock;
> +       }
>
>         get_device(&phy->dev);
>
> +out_unlock:
> +       mutex_unlock(&phy_provider_mutex);
>         return phy;
>  }
>  EXPORT_SYMBOL_GPL(of_phy_get);
> @@ -786,6 +791,7 @@ struct phy *phy_get(struct device *dev, const char *s=
tring)
>         struct phy *phy;
>         struct device_link *link;
>
> +       mutex_lock(&phy_provider_mutex);
>         if (dev->of_node) {
>                 if (string)
>                         index =3D of_property_match_string(dev->of_node, =
"phy-names",
> @@ -796,15 +802,18 @@ struct phy *phy_get(struct device *dev, const char =
*string)
>         } else {
>                 if (string =3D=3D NULL) {
>                         dev_WARN(dev, "missing string\n");
> -                       return ERR_PTR(-EINVAL);
> +                       phy =3D ERR_PTR(-EINVAL);
> +                       goto out_unlock;
>                 }
>                 phy =3D phy_find(dev, string);
>         }
>         if (IS_ERR(phy))
> -               return phy;
> +               goto out_unlock;
>
> -       if (!try_module_get(phy->ops->owner))
> -               return ERR_PTR(-EPROBE_DEFER);
> +       if (!try_module_get(phy->ops->owner)) {
> +               phy =3D ERR_PTR(-EPROBE_DEFER);
> +               goto out_unlock;
> +       }
>
>         get_device(&phy->dev);
>
> @@ -813,6 +822,8 @@ struct phy *phy_get(struct device *dev, const char *s=
tring)
>                 dev_dbg(dev, "failed to create device link to %s\n",
>                         dev_name(phy->dev.parent));
>
> +out_unlock:
> +       mutex_unlock(&phy_provider_mutex);
>         return phy;
>  }
>  EXPORT_SYMBOL_GPL(phy_get);
> @@ -961,15 +972,17 @@ struct phy *devm_of_phy_get_by_index(struct device =
*dev, struct device_node *np,
>         if (!ptr)
>                 return ERR_PTR(-ENOMEM);
>
> +       mutex_lock(&phy_provider_mutex);
>         phy =3D _of_phy_get(np, index);
>         if (IS_ERR(phy)) {
>                 devres_free(ptr);
> -               return phy;
> +               goto out_unlock;
>         }
>
>         if (!try_module_get(phy->ops->owner)) {
>                 devres_free(ptr);
> -               return ERR_PTR(-EPROBE_DEFER);
> +               phy =3D ERR_PTR(-EPROBE_DEFER);
> +               goto out_unlock;
>         }
>
>         get_device(&phy->dev);
> @@ -982,6 +995,8 @@ struct phy *devm_of_phy_get_by_index(struct device *d=
ev, struct device_node *np,
>                 dev_dbg(dev, "failed to create device link to %s\n",
>                         dev_name(phy->dev.parent));
>
> +out_unlock:
> +       mutex_unlock(&phy_provider_mutex);
>         return phy;
>  }
>  EXPORT_SYMBOL_GPL(devm_of_phy_get_by_index);
>
> --
> 2.55.0
>
