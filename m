Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF4F346E75
	for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 23:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776469247; cv=none; b=dw2gRWtqnXs+K12Ajna805rc0u/mpwSjfjUmDfNLBMyNBYsSqKTHvL2uCC99Tupz3cJm7plIE9HiqkL0FncTlIcqhCrpUcI72D6ps6leyijD9H7+9IPun5gXZ2ShSNN6EPs2qKFLGgc88J6gpz7Qnqrhs+3Zi9gtazD2QlblNPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776469247; c=relaxed/simple;
	bh=QLwLIyybGbuhb41Lgyr1BzNXP2BvhlqRdi9W1FpKYqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6gEbBDmFYGjbKPARcJieaubrPYA7XTEu0/9rwFRb+NZUg1FBc3y4H2hGog4y2wZsdiF1g39alPrOBnWQwf5a4U192ZWcKz7pdvhJQcWOmHVQhcvcmJcL2fP6zqLdBrg+N86Gf1liPI/ckY6NsN40vQf6xAYWt69xMfuTIFVs9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IR8r4Cnh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EG2x6Wxm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IR8r4Cnh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EG2x6Wxm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4HAb4068739
	for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 23:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vqsleupIiijc5MZBwUfkwuWc
	PF7CundACXwuw1EL1BU=; b=IR8r4Cnhs/pt4yc9JuNn9TtnARDPergZKPLO8E26
	zk5f6A8g0IkEw65cHK8KVBWDYsdXjtwqW5NUqu2xpeDXoCC31IriX6D3rSCxziXq
	/6zWA1Jiqm53KpxBSp6HXSOt75Ni5C5k5GUjB81WWydrtq153+Be7IOwibzm+edV
	K8gZgXjPnaCxN06hMv4CF4eBf43Pgwy3iAdjcZsvQ7r6zv9IiJEXK6UmUoTtbToU
	Z4sqT+09V9r7VS3CLUCX36k5M1WZvBEIdhxG+RlfiEJFb0JoiNEHrWEUqfz04iHl
	37x/FvYuP3uw4UERu+JATakFw6cxDxXn3mh1uupCAWM6AQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkhpu2mxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 23:40:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50df4c130dbso35122571cf.1
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 16:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776469245; x=1777074045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vqsleupIiijc5MZBwUfkwuWcPF7CundACXwuw1EL1BU=;
        b=EG2x6WxmY8+h1xq3/34/Igd6BhET1LB9A2JrlBei59S1377NOHky4oqUxX9olyYhB+
         eiFFSxnaPWoiTK+k6F3jwiT/6H1RHoZsxzTtxu0V1ImhtKRRJTHhPGjdpvdoLgfIS0x8
         EjgEKmss2ZqlSC749kdTV4/MuTv/z4nO//kkCt+HqzoYSKXNQbzdRPm5kJ3+I+WGPexp
         km+JrxW7Ym2cQV5f5wiHeitx362pyZFc+z4Ve911jMhnbI3fZTZM+J9MmLeLrFbfztLM
         lxPtfTZ0RosgUDYl0LEme8vdNprfwcRAIpE857WIMdhuNihA3+ch1DxE1n2P+4KrSMKD
         8A3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776469245; x=1777074045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqsleupIiijc5MZBwUfkwuWcPF7CundACXwuw1EL1BU=;
        b=l1RSGPYDuW0Z/M15h7wdfJucZISX71jXEZ/DchNl6hUIh5+M0S03h6qPdiCD4nfqUK
         5zoXndBKgjRZKxCAZfhwzPu0EWceiWKMfmXg23Bkq0mkL13XdZL6+VI+3z9ijARi87JN
         Pb5E+Dx4EwOg57XohQ1+XfXF3xKZkT6gLJlsshOT4jr/2A+eiX8Rig09QDC7DmURw2/T
         wZv+UY/SVsvQIAf+EGHSoUKOibFlT342NVXu0UqpjBY+oHx22DNAGirLzNOkB0f7xsq+
         nChGmhM64S1PGT7paYaQ7e08yqB23qG47C3M2eI+eIoFCf9ck+F6BBCiDvPEtMimd9nK
         8QxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+L2UsQJo/Yi4fj9IOC8kpACAWqjOnQ557UK5jAzr3JKFrCNFPgGp++ewwXoT/6OMPtYFBLSZhGkS0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1AiS12W9B4cA6sAaG9qCejfku6UxgLWW5HBoI5/um4Eow6a5Z
	WEDc830pZIprvOQ/W+CxRjlRtr2Fa/kq6xlFZInaqr7gLkeT7nrH64SI8Y9ElX40o+TyYG3zndd
	RHRfRqD2tR4rha6EFrTq3WabFI5ijLVshUc3fVcjkS8Gn3UrNSQCTrZLksMsdLl4=
X-Gm-Gg: AeBDieulhGFJ33hctYUfNVGEU+4LSXrw5KndZprFDpO0m9NSWzTlbC8eakb5M6IrM5K
	7uv6+FQe2wWFrDXt71PeJdvcEWO6RKAD57cnvrJjo9Vzpaa04CkftBGCUppUibOQGCKgqQS6fPn
	TESErM59OAqpDTDP3PjM7VGiS472cydKuCYChjVAu+lf9BpqndvWX745fKrHbbx/uUtM3nGWUlX
	ItF4/eB7A4lOnbxkNqENkwKP+4NodNcofrSSvgUvXwHqkNvK3KhBijixRR2yzYf949UyXWelOWT
	nvsvbESV0gS2FheidurV/8lco00wj97hNEfTK7jbAU6hzI9U0qKU6Clb/TDDoUHWZEp2sYyZVDj
	p1X4iCcBNKin0liSSiL99zQ0NoM15DhcHSubSLRfynITw9Gbi0Bktut8manix2bbIuKhHPNvWGw
	pJdXP3t8+5YguRZOL9qQBp9D0MooiVvtR709uZR8zyEC+Svw==
X-Received: by 2002:ac8:5f95:0:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-50e36738d99mr63423661cf.25.1776469244640;
        Fri, 17 Apr 2026 16:40:44 -0700 (PDT)
X-Received: by 2002:ac8:5f95:0:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-50e36738d99mr63423301cf.25.1776469244210;
        Fri, 17 Apr 2026 16:40:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e10e6sm816761e87.40.2026.04.17.16.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:40:43 -0700 (PDT)
Date: Sat, 18 Apr 2026 02:40:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 06/10] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Message-ID: <37poakqgqhsuavvrm2dyzwk36syyq44o4cfdsylkzwsupbh2yt@ycdvyrxgnrcs>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
 <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
 <ad482bdd-2fb5-432f-be1d-dec25d9cbf5b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad482bdd-2fb5-432f-be1d-dec25d9cbf5b@gmail.com>
X-Authority-Analysis: v=2.4 cv=Kd7idwYD c=1 sm=1 tr=0 ts=69e2c4fd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=OHVz5xcZLeuoOJp_SuAA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Srwa85RVS2IRaM6ndRgHxAymRlEOCNmO
X-Proofpoint-ORIG-GUID: Srwa85RVS2IRaM6ndRgHxAymRlEOCNmO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzOCBTYWx0ZWRfXz2kNdh34Olv6
 xSEK+eByZmr0Plxrx2W0F9U5tePrsrBARRheo18dabgYLXkivzP1wTTrlaWAw6ssYJMdKDDf983
 d6Az1PIc2/cP00QgwH4ILUs1jVxhtWA2sxLNO+iR/Y+xK26FqkbWjvTFu9gJi9UY9ZxtdgDRv+R
 XKdCD+7Zm36ewkYPLCMZKygwTyH/e0AkmZ6JjcXopCfc+9nufvzEcvEO0QZG6gbNVdu9LhbNtRV
 +U27HFtacKtXzKSrgh3wVoUQ/p0PyEakvfM76lpew8IE53WhZhAt7uYNs/VlK66DKzuoaEN8cwo
 T5or1UOh2vlSwoOJCD7TJCyvYIV/W3kKboXt3538YoXM4HgTl/xW8ajn9SCh953bpEyNVMcO+wh
 m8FJ8NVm/qSEyjVLD59tPHjnRUbv0gzTvYtVen1uGbyaSHIr2dT7UVZvhNcmJsi4Okg6et5IwTO
 KxOoy+ZVqfm4WRSYUPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170238

On Thu, Apr 16, 2026 at 07:57:30PM +0300, Erikas Bitovtas wrote:
> 
> 
> On 4/16/26 6:17 PM, Konrad Dybcio wrote:
> > On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> >> Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.
> >>
> >> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> >> index 90e966242720..231a3e9c1929 100644
> >> --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> >> +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> >> @@ -267,6 +267,14 @@ &usb_hs_phy {
> >>  	extcon = <&usb_id>;
> >>  };
> >>  
> >> +&venus {
> >> +	status = "okay";
> > 
> > You need a firmware path here
> 
> When I tested Venus on my device, it loaded without one specified -
> msm-firmware-loader creates a symbolic link from modem partition for
> firmware. Additionally, none of the MSM8916 devices seem to include a
> firmware name. Has something changed since then?

Us becoming more strict? Or more caring? The default file paths are
supposed to be used for unfused devices. So if they don't work with
yours (most likely they don't), please add firmware-name:

firmware-name = "qcom/msm8916/Asus/z00t/venus.mbn";

-- 
With best wishes
Dmitry
