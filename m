Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB4E1EB5E3
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 18:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777402586; cv=pass; b=jz56QaEeXzovDHntSHMz/nEVJ3xbhxMeKMpobJxuDmgXHufxLiR+iSYdWuZ2XGJ1b3YFXwFQ8BPkqWOlF8eM8MGnYAhpKkgLLcYSJrMwD7K4KadXXpFRmdEJnePmmCmabNbR365nRpB78zuKaB59aAPoI1IZ7jSRxYNxuuV1+oA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777402586; c=relaxed/simple;
	bh=yKuWebngPDM8HW0Nj3aqA+4MhRfylS3ZXpVa/iXF1YM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ef8W5qtI7GaZalHinD6LAdWWWKvJXEAy+5JhyV1n+A0z7C0Dug7q6XbzbADkhw+9E7jL1BWzYLv4naV3g4fcHP9XHA43uB7D2yXwK+EHwrE8ziRpwiiyxAhcQGF3oc+UVj9YY86is/RvEBfqndnkkDBL6Qttbfmhj4A/cdlvvn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEeHPa7z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DeldMT+z; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEeHPa7z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DeldMT+z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsR7X3705142
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 18:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Sw99fhCz6T9miiYV4+iKAQ965amMwy1/jcicnEr7aU=; b=lEeHPa7zUwSxOxWP
	sUIKv7wyDQjG80Be//owhNDBJ9XkXQ4r/5URCOhyDSc2OmdK7ySuJYtkkO2bSKnF
	HlbnncYb8BzDOEF9PXeFc3Em9yxN71DXG9cTVonCB8l3zQlZ4jcsvCShd4PNXIds
	j+blEcN85+ND6+cM2iwU1bL25PqU6jyXnuobNJh6u05A9rhPji9QB5eHZVYm42qG
	HhX6ZdpeMYZ0tSVQn69UJ2o7w4zcW5Ku0bzcZrpFV/PeggvyMhOIZECbuFvYYHiL
	8ggHJXYHUqtxKyi1U2Dul0wL8fnhrYhR4Kyl66/6GEieqh+5//bRPO9X1w/gX2vd
	eVqeTg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttxha0qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 18:56:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6097ca315bso17727290a12.3
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 11:56:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777402581; cv=none;
        d=google.com; s=arc-20240605;
        b=EtlZ1r/Y8x7VRMxHs01USHVCa4Ugr9qtd4HsorkGe30IvLUnkFV9lfJgIJ+claLaFp
         m69MAmiZUPqgmBUFVJmZGKSpRhnSzq/2iEIc8C7cEeOm+eQptbgKFzcfPWBk6osWI6ow
         ITFbOeDxHY+ZiewCJNJAtOVOU6VnOWkp7uz4qkY236tFay7MFEefMkE7v1oB5lGblLqm
         mn771rTFLVXjGdcQdiYTv8u9QXoGWVV+L5CMEuYYRMQ0xAak/33HaEZHVj9qmDeEAp4H
         9FPpDkwFf0a+jVI8RE3JnpMAI/WZS/nozgcjmQJvnUfgm/iOPBtmlq5xXqQ3hWLLzdSM
         nEZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Sw99fhCz6T9miiYV4+iKAQ965amMwy1/jcicnEr7aU=;
        fh=gOmrjlUIHScbe0NOaY++FMHZ0+/LN8ysutrktzMLZxg=;
        b=LDQ+3YKHWLBEygnSd6ebu0IUJfzw/FnhxfeRzgteA64qEqci2o71gasFDZ3fbGz+Fe
         c+SqV775mONKB6i0xRna2XH0VV+THCC7VP/0+IYj+3eiSWLyj2GN+k7gV3DFLMhWaKMX
         hQ29g9kHG5E+SXAkVEWVrtN2thEgvvLE+8xBCXZXzZGKJ/GS+oGscmM+99tUCX0aGhLE
         iHFqAZeOoocagAzEgr0jCEbkNYjv6JcIAOXxBf1koWAPguS3tiENrkmgsbOCZQS3hpYQ
         Az/KG7Ai1bKN4Aw5/driKfl8o3AVuoZ9UUkRUya1KusBd9/khF8lODwbjK5zES60fyXf
         p/DA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777402581; x=1778007381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Sw99fhCz6T9miiYV4+iKAQ965amMwy1/jcicnEr7aU=;
        b=DeldMT+zeW47QDq1AT5ezqbBuJxA9+Ok5Ymm/BGlH0dNXaWGvPBwgLSM2qvXbBYh8Z
         HyBUDhx8SlgyWPY7U7QZ4EDZkqlXCWeMYDugaB21xDwCIYOn7gVGj5cPmq4nm75QnlZf
         H2WppzcvwMaAMTqI894LCfFH5gF1E9fm3tSLargpVJmC1mAohA2Ir0lmoG9PPl6rmsER
         veYf3h0zMCFhMUO9PjfNGAVmTZSv7fHRBQXFEnxHswUquGMtydB5p9FxFAf37ZYMdZy+
         Ibef5v2fjNSTaAGGbMWsuGg6u+iZFxhRrfuLw1Vmfbql8Kd901aE7zK70Rt/nbu+Uxga
         SyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777402581; x=1778007381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Sw99fhCz6T9miiYV4+iKAQ965amMwy1/jcicnEr7aU=;
        b=PopZwTWpcjGNGQ3mAN2hcSMY/7QWvLWHcMPtMTwYg0gSbCNKztEQG9UgIuYnmhNyO8
         GPHEV5z6mLLFWki+YI91VkLlehGwFiwRsJsoKykQjT42kn8RElKKQfLbJHabMCgSQKTd
         k79ObPKYxi3gNVN/s0EwYM5B9g1C9oFt+R/WCKtIna8L+QYnPGIVyml4DgCn3h2VNMWu
         Ex9YIx8Y8zqewj2ERPtFoE1ylG6En1wpN2O2SLBOxL9CxIDxQAqHczS7nzm94Ll2QEBb
         /Z/lrBiJvgZ5nv5T3Xv6Gnkl3lggjo/yqABALsH1PBogaIOlt3GFPIQnPLg+EPvpeCJz
         vh3A==
X-Forwarded-Encrypted: i=1; AFNElJ/AHUihEeQOMUBPqmREcni/kk59wrrMUXV8g3G58kzjDnQtnQ5q6Sq21VXHmdMoaLq/IzMX45NDBNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwyZr0pGLot938wM3OPKHAakeBV99rrYu9d/l663CKfVr24X+h
	TX0S24ZUAB4giUdwW/u9nd/rBTP4JtLHdQ1feoolwQflgoD/ZCLrM6K0ryreYdBDTTHrFQjnhGW
	n5s4bNATIikPtKvxzcQCvzum/x2p66QDUzmOgjL5LEmyc2/JPYT6C7ArwhI9m9/AyMNjorQniO6
	d0RYjC+yjsjb66yI8abyEqrA+vRrYAdQg6ma9mPg==
X-Gm-Gg: AeBDievFxKCJ8M8BhW9R9YvuJgtkkSN363/LFvdyVR60QkR0Ag1UJeiJoWV9G2q835t
	Xmx65NXXZxy2tHoVdOhycqK6IgNPZ1fCaGjbGfLU1Xtn5QRFiBK1hrI7Sp7u4bws1xAu7fas39x
	qsBmyhWAKO12jEB58/xlp2OxPm/CJ1Iw8LCH/IS3Mr/LanVXPJRelg0ddrg61Jpg9ZpHcmeGXLP
	xfPXoypmBgdPrzzNXweXXbdcucdxcGKHPnzSAoSCBaihHms
X-Received: by 2002:a05:6a21:e097:b0:3a2:7ef4:81e3 with SMTP id adf61e73a8af0-3a39c402e6dmr5239408637.51.1777402581387;
        Tue, 28 Apr 2026 11:56:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:e097:b0:3a2:7ef4:81e3 with SMTP id
 adf61e73a8af0-3a39c402e6dmr5239371637.51.1777402580845; Tue, 28 Apr 2026
 11:56:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-2-eb27d845df9c@oss.qualcomm.com>
 <hpun2wdw3lnthjfwmycufzqrwl5ssiohdjf73kxcpm2reuyqqf@oc672sww2pqe> <3938070f-5be7-466c-8967-6dc32b5ef372@oss.qualcomm.com>
In-Reply-To: <3938070f-5be7-466c-8967-6dc32b5ef372@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 21:56:09 +0300
X-Gm-Features: AVHnY4IbRVOi8SHlF5dYFobt0wvGd_aIyg0c8FWOdUh_XxHFt_x9BmQPJgUIi3U
Message-ID: <CAO9ioeU-B1jpmR5-x=BrWwdTnNRyORKtQ5aShzf7NRFfLfM8MA@mail.gmail.com>
Subject: Re: [PATCH 02/13] dt-bindings: clock: qcom,sm8550-dispcc: Add display
 CESTA support on SM8750
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE4NCBTYWx0ZWRfX8XehxlpxvwXt
 51Tv+QzbPo6F0euZ+0kJxkth06r1CUm+otT6BEQWSkZF3YRlZQ5hF1iKO2RtZJ5iIP7n6H6yhn0
 kR2qw1i3cRYybXdGUzPhERyZ1KWDyEyd24NxHqxv+GGfygiGU/Q0GW/gNR8M0hbbxb15rBxxDRU
 ZMHHeI9PRhn1z/MwDIRmRe4Flf+toMUM6dhbzlH0Ds8rW9KfBFgzBAKwX6VkoUu1HMNcwJHY4UI
 AyZnbnkU4SRrK5ZDPAdSIvdQ0XvmH/7MfRCiATZoVwqLHEVwB7mvhYMOtWuqI+t/nf6QpfA2BmD
 0K2QcCkfk4tukpvhoVqaX9qmMNLMVSOty+e/P1GPKbIiHg8AOexAB9hOKLYReZ6O3w6aFVacGkv
 WHsUaUMu/xLhiNN4v+Zohz2xnDj7sSqkVKXHSZ1dQsOIrbwjSafoY0hrezRPvBbf+YYQIDmO54X
 zXRYhNrzfTXRNCEmYvg==
X-Authority-Analysis: v=2.4 cv=Uu5T8ewB c=1 sm=1 tr=0 ts=69f102d6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=gA42fc11l1rYSZANlQgA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: blG1RFKG-_68zACSK9341bI9hSyGXu7Y
X-Proofpoint-GUID: blG1RFKG-_68zACSK9341bI9hSyGXu7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280184

On Tue, 28 Apr 2026 at 20:21, Jagadeesh Kona
<jagadeesh.kona@oss.qualcomm.com> wrote:
>
>
>
> On 4/20/2026 11:15 PM, Dmitry Baryshkov wrote:
> > On Mon, Apr 20, 2026 at 09:58:55PM +0530, Jagadeesh Kona wrote:
> >> On SM8750, a subset of DISPCC clocks is controlled by the display CEST=
A
> >> (Client State Aggregator) hardware. These clocks can be scaled to the
> >> desired frequency by sending votes to the display CRM(CESTA Resource
> >> manager) instead of programming DISPCC registers directly.
> >>
> >> Add bindings to allow the DISPCC node to reference the display CRM nod=
e
> >> for sending votes to CESTA hardware and the CRMC syscon regmap node
> >> which is used to read the frequency look up tables provided by CRM and
> >> populate this data in RCG's frequency tables for CESTA controlled cloc=
ks.
> >>
> >> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> >> ---
> >>  .../bindings/clock/qcom,sm8550-dispcc.yaml         | 48 +++++++++++++=
+++++++++
> >>  1 file changed, 48 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispc=
c.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> >> index 591ce91b8d54dd6f78a66d029882bcd94b53beda..3e049b2160a1781c866bb3=
0b29f0da5c9e156b61 100644
> >> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
> >> @@ -60,6 +60,18 @@ properties:
> >>        A phandle to an OPP node describing required MMCX performance p=
oint.
> >>      maxItems: 1
> >>
> >> +  qcom,crm:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      Phandle to the display CRM (CESTA Resource Manager) node, used =
to communicate
> >> +      with the display CESTA (Client State Aggregator) hardware.
> >
> > Is it going to be shared by several entities? If not, can be make a par=
t
> > of the dispcc and get rid of the extra CC <-> CRM API?
> >
>
> Thanks Dmitry for your review.
>
> Yes, clock is one of the consumer of CRM, but CRM can be used by intercon=
nect drivers also
> for BW voting via CESTA.
>
> >> +
> >> +  qcom,crmc-regmap:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      Phandle to the syscon providing the CRMC (CRM clock) regmap use=
d
> >> +      to read frequency LUTs (lookup tables) populated by the CRM.
> >
> > Why is this coming as a syscon? Why isn't it just a register region of
> > the dispcc?
> >
>
> The CRMC block is not part of the DISPCC register region; it is a separat=
e sub=E2=80=91block within the
> CRM(CESTA) address space. It contains clocks frequency lookup tables that=
 the clock driver reads
> to populate RCG frequency tables. Since CRMC block is outside of DISPCC r=
egion and DISPCC driver
> doesn't own or manage the CRMC block and uses it just to read CRM control=
led RCG's frequency
> tables, marked it as a syscon device.

Why is it a syscon rather than a normal device with the normal driver?

--=20
With best wishes
Dmitry
