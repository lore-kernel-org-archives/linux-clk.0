Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEAC335553
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 11:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329103; cv=none; b=MS86Zsa7Jw8fXupfRtC6pHUXpJhs1dAZ8M0A1MxpzK/vHFJcOYhoBCvUV8ilaETfgah1wySLP1hzaJQ2zLYkJuNRM1cFcSe2TnBwVCQlywOxfXWsgC9ztCnku/DEuVnbUbqNJI8YKy3N4tVEVj2kHojlYLHUm77JwoFDtb5Sy34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329103; c=relaxed/simple;
	bh=fTr5O3C3gyG1GEXD5hRz2rzuUHmMOHtghcbKPoae4ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gd7podwsCjrfn7ldn5kHYplylrP2lBWA2pnvh+uyc/41cDvhGP6lq/3V30lwKAldvxi56iotAXkhuXS3GrJ85PNDbnQUCXVg7AYFCwMpc2l1rWYR1PCT3An0jziXEUaNguc/tJAT3Rak3FVMJB6vlQ1SiqFDKk90oR6ZJQWTqoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZimxVwtm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SdINO7Mr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZimxVwtm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SdINO7Mr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H54MPg2111517
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 11:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RkeoEigFEkq61Hzx1HfUblX/
	RJEa8RLEq/5l5Q8F6ls=; b=ZimxVwtmV0Sj7ARYGVucYVrRXO+xo76ekptgrrWb
	q86uqKyPBPxRwE4Jwdf5j3eav+G1kFKbEwrq8d7jxHDtTSIV72I9CcUYuvcPMQ8e
	4z64NCAZxFZ+ttznkuJ5XlQ76tYA8T6kj5vC2J2NkngKwl49PTZMtoPVRHlwucpQ
	8SRNpCnXXlH0C5fC1aFJDVo0tlibcBUJkBnKwYNiWij9c+KAGtouuUP7Xyr6olmv
	Y9BWd14cXjoFXsj2I6HaMR4V+kWrjiA1QzeuKn+7OVt4wclyYfKRESJphclf+coq
	deDDdPtp5tqsnpDn4Tp+ZYN6QXTt1cNg/OX3XsYGdqL8nQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4gwad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 11:51:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3a2eb984so4390217985a.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 03:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329100; x=1771933900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RkeoEigFEkq61Hzx1HfUblX/RJEa8RLEq/5l5Q8F6ls=;
        b=SdINO7MrDB9DJ9l/PO9KDRDRNT3bHSlTeENLJ/6OTVS3ZnOWQcszuXkA3G/Rb1ZlXX
         bcSUQxMqb/k2zbMNZriBgFbRlrSOtmUW6U/YncF8Ej49YCaHlgH1N+ZvAzIJ0Yl5ut0/
         4vdvIdJR54bd5FhOLJVT/pimWslr3urqtxDEinT+pMIkR0duwgkxMjHzOTysSOWHTI3r
         fwseS5PZFL/YLmFzeRbumh0JcFSZ7gPSrigTC8y+dIcOZn5QT3KVWkvDkeN0jC+kSeH8
         OnPGHTi1VwfeEZQ16QFjyR9xjxxkvXIbSzDYenO9rN4DiS0/e973y/XX+K8Nddqv7LqY
         qgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329100; x=1771933900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkeoEigFEkq61Hzx1HfUblX/RJEa8RLEq/5l5Q8F6ls=;
        b=UKN5BnYQ00uB/TUYhCwbB6DBudvqWFcWjXTqKGVHQLbaGiznK8VXjTA1ZCmI5+Zz8B
         CJ16mVpCM1Q1kkN8RPUbo+BlLpob/ro1EQbdcby8L7cXWdE9nNr4JBOFWT+4l4/QV+xN
         747LzAbL6pQLvTFzwhl9QCxzRShEd5JncCICbmdBkMeO2xas38QdduZgmZR3Jefc6FA8
         8YW/xl5PDgyut9vf9I2crkEx1HJS5NcPericl+JiM/7ru4PVV/S9ZHUe/F28mc6bp+E0
         6+KfLskr78hDF9P1Og6Yfi4oEo9fieKjQ7l83Mq2MmzAR80nLEaDjR5Rn5M+ApKjs2A6
         smuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSB3lV93lxpUuJfhP9MkAZuyMVSInoLfQhlNoOigaZHAP+TORXG9cCdtQGzYaWLJ+pNwN5Ln8B3ro=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuy6lH9MdTH4XTA+yxROAwNmLGr+gfZ+wrVJJ2bPKxArRON/gi
	tz1rlFGhBpdgwmRVq6f6MCN65y1cd5mmEyw2eEv16V6S9d7bXQFq9cZAnvI3xv7+4LJqZALothH
	OxRRlFunOmJg0OIWpArnn1MHroMCmmMwc2OFxiBiDG8VNew/3BmrMSEHxApy541c=
X-Gm-Gg: AZuq6aIT9QtM2Xt1kKZYnGR9lTXUFcPpkxarp326E7cDyEIJALkGDQ4wXuqsNSN5kq/
	+Q1nky+G8f54uDBmxv6XypIqQ+dnsVq/NzRStNgzY7r74qB45fIpgwZpF+dqbgjcI7dYG45nubv
	a7u/jzFM3tTm+C1UkODudZQBFobsyXDXMuJqi05EaWGlbBS3r3n0kA9pQfoTBAWZK8tx4wrY2yn
	/JgsscSZFYk2YhlrFKZr3NQX5vRxToD48drvLk3MVYs56Jiwqa7iJiHLa387PYYdH0DOTNN+QB2
	TfrxTj5od40WVEELb4YNR2f1d87pc77WX7OrLuhWTOhHfwqtkgZJuVP3FbFQbRTNq3CCMTxHvDY
	dmr+v9TbZhPmd+/LuMqFm5yYCHMUpynC/PPJc
X-Received: by 2002:a05:620a:3944:b0:8b2:f269:f899 with SMTP id af79cd13be357-8cb4bff2a01mr1339160085a.56.1771329100538;
        Tue, 17 Feb 2026 03:51:40 -0800 (PST)
X-Received: by 2002:a05:620a:3944:b0:8b2:f269:f899 with SMTP id af79cd13be357-8cb4bff2a01mr1339157685a.56.1771329100065;
        Tue, 17 Feb 2026 03:51:40 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a3f835sm104875305e9.25.2026.02.17.03.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:51:39 -0800 (PST)
Date: Tue, 17 Feb 2026 13:51:37 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 4/8] pinctrl: qcom: sm8750: Expose reference clocks
Message-ID: <h42urqeyp3njwuekzer3zag5nv56z3tdvckssd7tepsr76ozwk@2uwt7yqamkmj>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202-topic-8750_tcsr-v1-4-cd7e6648c64f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-topic-8750_tcsr-v1-4-cd7e6648c64f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=6994564d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=kBfrMkYwO43iJOCXJAkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OCBTYWx0ZWRfXzsd0mAxgH/n6
 uickA9WDcGlGAE095gV1RG+O6ycc3N7MSeYM0S2U8TICX3iIXC/ZWOQEfjNjuxRssDT8MQntBOg
 6kj2nkVi/kMIL9NlXjgM7S7GDuVqLjL8ZXpEwzHkRyceOkgxlN46bHkbgkNyp9k5A2Zx0YRUOzt
 NDzSh05PR985Zr7PnHqyHnm5qW92zIiT8g68zR1AhlRwCjPcbGsggi5QF+tqFDNtWOfmIYNUN+R
 vuTScOKe/wudwUNH+bUC6WRz1TDynGb4MtYuzRdEfMns/XGWpyPwTbriST7mopCNhtt4faf0IkR
 7PvgXxmp4GzMARXTh2corR63GIck5iVdMF/cF2RlsU3ETitdwETcgw12JX/xE6Sz0e1T3eZYMPs
 gBlTTsA3vpedQKI1w8pFqpnqxUNmPbmXMh0AQVJlV9cvkQ3+y2emEh9Um/6V6i2ns2IxxXItwb9
 3aUBDlmEyVKuEhwTucw==
X-Proofpoint-GUID: YK4aXBXlfJPmHpyYs8p_L2afEswgWFcG
X-Proofpoint-ORIG-GUID: YK4aXBXlfJPmHpyYs8p_L2afEswgWFcG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170098

On 26-02-02 15:57:36, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The gating toggles were moved to the TLMM register space on this
> platform. They lived inside TCSR a generation prior and are back there
> again a generation after.
> 
> Expose them, so that they can be consumed by other blocks.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
