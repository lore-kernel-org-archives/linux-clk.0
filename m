Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D926E2DEA63
	for <linux-clk@vger.kernel.org>; Tue,  8 Jul 2025 13:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751980132; cv=none; b=sElR37BBemKcV78zxonzhO9JJwOs4EFj1oFOwCWXGMZyH/B5136p9qHJNOSPz6x8D0MwWl2gZ73yKgxXhZz0N+SZ0J+U+ZaK3SABesQ0+HcVZmo63+mh1QhjGOzkhtkZFjbdG2/4Wy3omF0ApllNdR7sO5v/TLI+L8OwkOht7yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751980132; c=relaxed/simple;
	bh=WzAnNBoWqDOEgWIAvOrUUm+cPnnAQsDqlITlF4IdpJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=POrAdOSHk9ze5FDoZf8oItfrRZh3+Q0Aitlqzoufz05Tl7M+TdNBHtJV1Maxm7Y6yQbGNgXmrS48ubIurxXVZ1WD1ijGbBziEyNfnc+4GakexJH1fM8EBghuyusRckVTLJNmip7pEkge3mSywcVSitoJrngkQlNbSCevA8Cb7A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PP6LPZ7J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PP6LPZ7J"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAPZv012171
	for <linux-clk@vger.kernel.org>; Tue, 8 Jul 2025 13:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=; b=PP6LPZ7JgWREVlGz
	xfOB3FpIVnYll1AYnAcFtC/DmwaJdneoFKAds0rkDurunf9pH4YLir6HsmEf4de9
	HcAb4L1GmOdV5asQHAXWWHVSYybzZscWrdsAnruQvX7JKZoWdGwgOp91+6ZrIWQX
	YUre65nGE2maSnxdnrutcHQbULUETjK2S+d+a2CpRm1GzVKb36THIn0oNrO3edvn
	EhkHEL/TwV7aqGGErrPonLag+kMrXl42AS6mV7ArPdePlVFgIjTmLDTZcPQ9ohiD
	20G6VCM78LPNilAxjywxwTnMG2XzL+304fFq0SgWTulqm1zX1uARzTyBfJQBNETZ
	rAGD4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv97nbm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 08 Jul 2025 13:08:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0a9d20c2eso50801685a.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Jul 2025 06:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751980128; x=1752584928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=;
        b=jVEZHe4rJOfOgmYZruKhomPpwOoUmRVRs3tPCcTkPHn6p8tNEPh8BC1k+9DLBLJ4RQ
         IKdGn3Btq6J+Ou8HCOi/h6sSO342G0FbjP30Oi6Mr/0cjadElSLMDX890d5iyuxcK71d
         Bjf+x6D4Zn1ex0DyjOk6rguOa8G4+XCbJUNiWk78tku9ToF7VCCKLnCt2hlfREvP8+n4
         sIHzgiB4fv8CAKH9ipNK8Zc+Kle1DXe5BvuDM+WwRcjZ5yfZsdXomOX+Pibwjg3WLW12
         uMxs6mJavXsDJ4TdkrwwKhcI100m3BbN9N8R3jqqrtmG4r7e+PnZkSwu8A2klMtHFFgw
         IrsQ==
X-Gm-Message-State: AOJu0YyBjrJKO5wNKUJN/B75eMWfSRhY+4f9znCoHb0tYbJ+AZul4+2P
	mqIw1fVEWcLmaIlYBXx7h35g//+lE2/kMkIDboAc5PUMrqOp8t+RHc5ab9A0njXESeTj8HQik04
	eMFJUo+RdEo0CEjvdlfbORnjXY8rQjWF4pRmDfbNyyCTKIOeFceW3w1bzagpRubk=
X-Gm-Gg: ASbGncvDJcfIzej/eVTnMlpObvY+5CXOuy58G+4f18z1zo600oKjhsD5aZ3bybz2LjP
	dFyPLQgppQ7iSmY4Lj8BqTt/7J3KLO/MOQ+0r9d7Dv3gf6MZCdh7N39uqwjw2CtbuTml+mFWj7t
	03U/m1hD0V1jxBgge/ZAweuEoLacGq8XoZJpTMDMJAwsztpk+N4zb1pItSluwvPb5mvSpXl1zwR
	p8tP4d3jwph4kYFKsPL/Umbg6vsufsRE7yhM4D/mM2SbX6eaP68bRMDvuu/5Nwx4SYwv//Mlfrw
	OwE50cqk8+cZ9vMq83xm6eQ8rkzt97wbP6OanGIvIxC1NUKIprKHE2OUBIMBn0fyx5mpVI+RXLy
	nKS0=
X-Received: by 2002:a05:620a:4710:b0:7d4:289c:884f with SMTP id af79cd13be357-7d5ddb39d6bmr894185185a.1.1751980127629;
        Tue, 08 Jul 2025 06:08:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBiGS5COZ9Dfk9VqBJ+kMTORiJffjyBCmhWeiZXp87B/AUtfoZjbT3vyAV0W19xiv8/+LqXQ==
X-Received: by 2002:a05:620a:4710:b0:7d4:289c:884f with SMTP id af79cd13be357-7d5ddb39d6bmr894183185a.1.1751980127166;
        Tue, 08 Jul 2025 06:08:47 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1edfsm883127366b.180.2025.07.08.06.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:08:45 -0700 (PDT)
Message-ID: <8b473da7-5e6b-465e-ac33-a114a2b6f673@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:08:43 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] clk: qcom: rpmh: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
 <20250703-clk-cocci-drop-round-rate-v1-4-3a8da898367e@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-4-3a8da898367e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686d1861 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=oBXrOfH6mq4iYN50PBoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEwOSBTYWx0ZWRfX9LBhcvSy2AUi
 QOHERS5hzDyqJpWOn2RWvEHNXuzwTpbA9NcJmhHOqQpVsJzdAXb3ZLcC8qVTSUal4pL6oJln02D
 /edGaG1erVcCFh//pwvE8Y98M4JU+8s+NetvYDrLyyu/83gLE4abYymBtY1gZndVG1AZvyEZl7G
 nC2fkseg1HgriOqdVyWFyl3KHkCvjGf2Q3ashRX+sPIrMRE/w656ynK7oGBZ91lp4dIpZnOaVTY
 FF1XyH9ype688AsMUEDePFyepqGZf+7oDugtHGuZtpE/AXKCCNlWa8MkoNTsM7O8WSo0E0sWkpz
 ZI624NLUNHmfk4hRz357OVoVzhZM3ET8vapJGVW9luuowVeYFrVx2loMDA3cEXSYh2B2BXd5r/a
 MqpOnIHYg0URi/d8PtPTGgC/wL09SBW1xmvihhcBY/MTIJOkbRcUjaAboX6Gw9mICWMX6t0G
X-Proofpoint-GUID: vf8dGm2acXA4NhTn83l7KIl24VMlk8jG
X-Proofpoint-ORIG-GUID: vf8dGm2acXA4NhTn83l7KIl24VMlk8jG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=798 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080109

On 7/4/25 1:22 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
