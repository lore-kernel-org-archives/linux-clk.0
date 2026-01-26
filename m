Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFE3330327
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 10:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422488; cv=none; b=jq7rmLRzqQzHkQvx90v5DQH5HD+4WWj7RHxQvjjXzwGnOrp6RRdG48TM49UAYeoPSSpYEcllnBHAwFq0UPFntNnM82heX9zBrboDcnspB9yNOl8Jk7qwU5dxx+qcn+uXAmItjoh26DvbA55fDqUInu3Nbg7grbGBXJjdITKcHLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422488; c=relaxed/simple;
	bh=nxEhAbzUXqWnF3GtEIE6Wfar4AmH3DAFLdLk3kB3Zw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+Mi5ty/TrqIPAEfDdw8JQQfwGEcbbYfr2MccRUeoeyfkEA6Ex8a8ZvGt3p+2mRd9CGWtN2ckJkYXO36kaojP39j5k9L3l8V5aaMjGX1Tqs2Fa2V5KouMb8tdv94Npyc1T+smqZmch+aaibIKkZ4FE5nRAZCPM+0vgL5ZvYuouA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TEVY4r2p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AOoNM07G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TEVY4r2p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AOoNM07G"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q82gwI3677927
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 10:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5yhpcFu8m2C4OmsSHPsRpoVJ
	XKRoa1siTRePuREnYoo=; b=TEVY4r2p1d2thn9eDmOkpbYvk6tfeFPh1u1Gst51
	tBkqv5uz1+CeuEMKpP6cUHl+Hpjn+CXwfp1RJD1sJUWIAQp1CfUVByHLM8GotX04
	Uxk5ZosIAh3wtFuuVjmiBhnQx70ZMaMXr6ja7AJwfLCxBEVDqtumVcyxi6V9XjFm
	tI6OWfTqKIOUzUNfzEpswoX0xu1mlh8wIypa7N5CjwUeFrEedFWyfxQ8Wpjuv5jb
	Ntrvyg/sFW8YUpsopwp9/plNdXpRJMX8PXXgfFq1m8IVLBihjIpOy8mOedtAemy9
	H4/0un9b958F2Khng5QOHBMeyT1BBEkGPS+vPjLHYT2fqg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq24m5yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 10:14:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a2ef071dso241474885a.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 02:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769422485; x=1770027285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5yhpcFu8m2C4OmsSHPsRpoVJXKRoa1siTRePuREnYoo=;
        b=AOoNM07G3wP03aQ3jGVYW0TlF6vRaMSERQl1No2warLJhnfUwZhfHKJaC0RMg7Zn9j
         0qEheroaWg8YlPtn1vKioIaMpi9oEzZOOU61YJUay8gJ47AkqDg0z9yfPlhdAKIqxmYA
         iq5GR8G+i7igijfFUFR/ahua4JkT2H4npLmsgB+L+gwPmFZ7k+r6MVVsCy6gB4u16THH
         UAMHnbJM9mhc7bl0lGdHWxSgLwZdISq9QM7bfVjuhM40ub65rBm3i9p1U9y6SVl79NBz
         wofLs5mW2ywobo7S67Ns86CYDo9JuMO4KCHt7OHALydRQbZ3bNpetlMwPGdHk1MdSAzc
         MtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422485; x=1770027285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5yhpcFu8m2C4OmsSHPsRpoVJXKRoa1siTRePuREnYoo=;
        b=t/luUKwDg/p2d8fcCYyDHemSZlVdgFiWCWhzI7ykTtgZ3kp2tQLDiHe4oH2csZO7u0
         Npfe0v08WJQ1mcbhMtZm9zjVc7IHSO1i9T8dlnEwyfhw/9eVT3L5QlwicIFA+cdAdU9f
         aiiwjv8XHh9DGDbFG41Lv/t0SsVjYjDN9cVBSeTRWjMMK7yU5hlM1okmd1A2bxZb0EMB
         X2GkEn4s8tXhQdICww3IaoFgWFBnAkyF+RSjpRNnGrA3hnKo9s7KvVekuIUHri0WU7YK
         KcIrunSh614ySHoHMvp8zxt48RmcuX6CPTEYgxywUc4iDTs+tetIEgWA3ZfSkESYXgK3
         wDpg==
X-Forwarded-Encrypted: i=1; AJvYcCXXDObDw3pDn4DzTmVVJcDLB7RrdAeyehGeDLBzF4W9gD9T9gZ5DH7Jz1mZUVBgIO0SQjeydccRZ8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI0LgSrkcu0u799QAsMQmUHcPAue9o19Y2gtiJCUtMs4qbFFi+
	QlagOkY+a4PggDm4QWf3Uoko834YfT0qs6g03wizer4gxCXNc2t2BajQJ3n3YXp8USvReOgpbuH
	YEWJB41UqYCvCzsL/xOFxFP/6gRMP8Mv07LBwfDcyF0t/NnfHJOiBVeuaswHMvGI=
X-Gm-Gg: AZuq6aK2E7TNciiQT0sujMovbzJ1sTge+TT9ZhCznzIQ/yGMi3PSv+w615TMIVW+BM5
	23OZtZM6qKo/iMywzDJrTiUP5gL00ZTzwGEU6ZtVqgxP90HGWm7O4B6RuZdKZ2j1e1TYhYv9m1o
	cLElQzLbU3W1UoHzOmDEFVH2UPh3Y8j/0tIowgwwW5cyua1Ug67JkSvNkfuA4N/JbllZ5SZBZoQ
	WkTutsU/Ll4wDoWw8+mgIji0gTOZYqcQVePJmme4+BG7ssqjOaQpkjnK8Exuo2eIJ9OLZA01uJI
	fpkxKq0v9/HFtcWhLJiXTEqFopgQfUzsBYLXH2VSXPjVq/4jIXP0oo/qGeFHDkZ9TGUWXJTwFo7
	PoMuoxMmdtBmEeKMBcUzIo7qa
X-Received: by 2002:a05:620a:1911:b0:8bb:18fe:d1c5 with SMTP id af79cd13be357-8c6f9572c3amr418713985a.9.1769422485498;
        Mon, 26 Jan 2026 02:14:45 -0800 (PST)
X-Received: by 2002:a05:620a:1911:b0:8bb:18fe:d1c5 with SMTP id af79cd13be357-8c6f9572c3amr418711485a.9.1769422485002;
        Mon, 26 Jan 2026 02:14:45 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d85206fsm266606285e9.6.2026.01.26.02.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:14:44 -0800 (PST)
Date: Mon, 26 Jan 2026 12:14:42 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: imx6q[ul]-clock: add optional
 clock enet[1]_ref_pad
Message-ID: <uilxikzky53j7sg2barmsu6fkco2fiwgak3fh6eqc65iggmbge@7oogboikthae>
References: <20251106-ccm_dts-v2-0-12fa4c51fde7@nxp.com>
 <20251106-ccm_dts-v2-1-12fa4c51fde7@nxp.com>
 <aVwV8/rg2h2x4OwN@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVwV8/rg2h2x4OwN@lizhi-Precision-Tower-5810>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4NyBTYWx0ZWRfX8ysX73n74iSf
 G1ZQ05yATODy63U3exmQ/whZm5DQ+ZOcPF4WVUlhWQsEfler+cI3osW/Ojuwq4kd7SduxVpHy80
 YmKeT485XKBVgFJbyiAJmmF621Y9qk1K5zay3KTErVU6ew3k8JJVRe6xVVhqfmnupjA7jryl4sj
 ItLzflviIp/t2HdFLn78+to4GXFD+svh1oF1kzF0NoRgsOmYs6E1U/nt8m+dJoZKCQrUScPV8qC
 dEIwAeMsImpkiDwJznsVhSd9kYaV2wzC8ni+IRgEYbv6S3RL3crWNNgYArMs5iY8QzNIvfPkMia
 +sjjxrw1PieHOq0AdBdkuc8ZnGhiGa6OfEStkTTp5V9hdYUAr9vdUu1UeVluJhMi0UNYGRLGr40
 rUVRB99Efn7QyMR6AwW6sb40wGXDPW6nbQ4z+5OHxHG2sZPm1XObW3aIqlPob5uDCxD2n4CKWKG
 KZaxwoJIGo+WacAyS9Q==
X-Authority-Analysis: v=2.4 cv=EsXfbCcA c=1 sm=1 tr=0 ts=69773e96 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=XYAwZIGsAAAA:8 a=8AirrxEcAAAA:8
 a=7OV0ED95LoZXi-xfo7wA:9 a=CjuIK1q_8ugA:10 a=QYH75iMubAgA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=E8ToXWR_bxluHZ7gmE-Z:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: VWxG-Vv3n61ZcuuECb9TzT8Bzba1e8FE
X-Proofpoint-ORIG-GUID: VWxG-Vv3n61ZcuuECb9TzT8Bzba1e8FE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260087

On 26-01-05 14:50:11, Frank Li wrote:
> On Thu, Nov 06, 2025 at 02:57:21PM -0500, Frank Li wrote:
> > Add optional clock source enet_ref_pad for imx6q, enet1_ref_pad for imx6ul,
> > which input from ENET ref pad.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> 
> Who will pick this patch? Abel or rob?
> 
> Frank

Missed this one. Sorry.

Will apply.
