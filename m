Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CF7207DF7
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 09:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752830602; cv=none; b=PC7EC54SEZugWN2aL6Fhvl8VHxB3JtG16LXuVOlMInzY/3nKV1d7VGqtNmzZG9AMskbaWUv5DzFf1q83veyzpylAsUfLuT/vR36IyZfIhqiImxQT7st7faw4ugG2KiZbBohtiAJPjmgkLjQuFRVVr2mD40RF7h9IhM9GKPplO2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752830602; c=relaxed/simple;
	bh=RcdS4qXRNHqoIFtflPy8p6xxpU4RVnQO+PYcwJzQfzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtX9gK7UGauOootCWpdWBSrt2i5R0l9uamhGunKOsWm9ZjjNFZwx13pU1LwUHu9a0iNfV5U379LUblOUGPYard/eIgICPEjhZO+SAN56DNQ8gdUKwDuLufbPuQFPudUjvprwzBGVEenCY1ycNJlLAPsP9AT0eaZ1TkubLQogMGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMa3nh+j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMa3nh+j"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I1knH8015953
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 09:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9tbdwW74cZEyqwu7Rui55/J0rnn4mTkIqlUTKDRA+4=; b=MMa3nh+jnbnhJj/n
	qLQLWRiB8S65cc2Ewc0lGtk7lveJn4/SBE3pbMdBizMtCXuUyixMc1OkNBN49KTg
	nZ2nREVccb8OVDQpqgK9wlOQzuN3Nf2BvQ0TRg0R2Rn2mBmRxSIcxhMhGzpisIjt
	nB7dKqeET01QFmvtrzYIznq9zZ9/ZCDczjvrnHLO++e8lONjZZP2sFNykCgKnMma
	Ixi2/NtSYvZAnKU14/XT7d6a7oQB+YWRG7OsJ+QTB8LVZC6euEmaZlwiWK1GiWc+
	mwLdpRPLgROVQm59wwns/lyozmb5pEi94KDrerDGy5uFiHm8xmxM5cuqN8dz7swz
	iY3WEg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47y3tc2t1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 09:23:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a9bcdc73c0so5179571cf.1
        for <linux-clk@vger.kernel.org>; Fri, 18 Jul 2025 02:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752830599; x=1753435399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R9tbdwW74cZEyqwu7Rui55/J0rnn4mTkIqlUTKDRA+4=;
        b=G/5CJ3vHcFOK6IAaEvLuvjz1btY/hZaJb4rO6xE/kJsLy3Q9h0JiuOhkBVpoouBr8W
         ag4yO7DbJoaYkmRbMEYpHAeQ8gsC9tV/+bNJNG7f1PFViSihdujnN2zSPkWOWdkvdEOj
         cvOwe8L7htlIfhDpeCi/QoPhKif9hdkbjEuuNZbkgazh+oDGvayOX8UHM62m54TvfVmo
         qoQzyuErfQg2ur9YCncFSyBLqdzpcmKbvbMS76aht2T8gYxHhhP2DjZ3K+zc2DpWarnd
         k/r/7Qm/6Fg7DV8PYHdONVqxJYXtLOUZ8hDLdxGM3PGmSS2TrYsDGPCWq3hBeX2M/DZy
         eNjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOQmF1zYZ28jDAYt3JdqOqaN1fVDHN7fhGIBnvEJ2kiz3FOYpcB2NI8FAt/vz5JN+Mc5IvpzCv5H8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIURjLFG4iqsDmanpbariyR96ExCH4YGLEedbqxfUCTOeH2TBQ
	s/7a8wGkSR2EGMAmefhriKEluZReyo+zfWC+5z7pZGDRhHNFnHTNcgPOCrYyNsh/RkjZYJZ/elJ
	XPcdXv1Aiob1WFLCbdbImOYG5wya0F7MjhXcjaeWclFz73yzygeUGZgEKJrbzgp4=
X-Gm-Gg: ASbGncsOoRffL1QfZ0lIbcZXgF0BryNQAAadf/DIpbhU2EL1NFT2iID7kiaUbUbijpX
	1KvwRHGK8ybU84YwA1Y3/6OMWTLOtmaj0/UHw+S68aUkLDEnAX5D6Wp05GDr0dchjq88SALlFIw
	dyEWfgRf8SWIb1ixCXXSZ7/58PWaHf9P2UoEGgyOhptUJbWuh7464riNgHt+8iOf2wbG68l828+
	YHSTtViu97LHR2Wvmiou12DIP0AMAZDp9UClptiXeWzcn1EjIdf74Cqnf95qeFUlNa037q7v/KP
	wBeBwwc3q+nAB+QoMf1I6QrLJ2owa3oMBzVOBHRLDPXtcL8LFrTynBwjNImWM8RoLuNhJQHlTiX
	P4GdqW0zZPsZaaTAUeAKn
X-Received: by 2002:a05:620a:27d2:b0:7e2:1609:a19a with SMTP id af79cd13be357-7e342aeef45mr582359385a.8.1752830599137;
        Fri, 18 Jul 2025 02:23:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp5OpRRRlubBf4j3XB9hMRhuiSC9XEu5aCviHEU07bToJoCBMGtr/bqJyK9a710HZLckzjkg==
X-Received: by 2002:a05:620a:27d2:b0:7e2:1609:a19a with SMTP id af79cd13be357-7e342aeef45mr582357585a.8.1752830598696;
        Fri, 18 Jul 2025 02:23:18 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d9941sm87211666b.56.2025.07.18.02.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 02:23:17 -0700 (PDT)
Message-ID: <17ea4f08-daf0-406c-8760-23a23417ec1f@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 11:23:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: Add MST pixel streams for
 displayport
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Danila Tikhonov
 <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-5-72ce08285703@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250717-dp_mst_bindings-v3-5-72ce08285703@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z5PsHGRA c=1 sm=1 tr=0 ts=687a1288 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=biz6BXDC6RXR6m6nPMoA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: h13zdGBsidvHrY_2K-BkjRIWeTuZF3y3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3MiBTYWx0ZWRfX9wtugAHTp2rb
 6ogR75Q8cYDlJ3OEjNVQpxX77rP6ui0CH7s2lE4d0eh4BwuHCIdAf7KRfA29Xc0GiTJnRGHKLVu
 pK+8E8VwatT7egIsOifKb8kKdfe6wBv5drXqCvBUxTFJK9rJ/Wl4tpCdHEopZlwDFLjbkN9JfJs
 f3E6Q5qKxBHI5BxI8RTfMAMyZn/9pszA65BJUILh1rJvAsTL3KzNx82A4tJzAvUO6matQwI/dsm
 Qk0rzfQFhzn1abfWuKcBRB/PtD1LISi5GTdanQnHZQNy80tAlSfIcgt2u25MjjK8oCftwI8BHnK
 vWUNPWtJ6kN4hCn5TPEojLR+Xc1ilIEm9yTC7OYnH5ICmAuBdZZ5ehB3fUHkEAv7bih6q7uWiYl
 06WKBuwjOBPBII2UTqFRSysFSPB9QoAEZkLMQHJG8a5iBfqbOJoeO0ACxbUko+Gtb4Pz+Lgm
X-Proofpoint-GUID: h13zdGBsidvHrY_2K-BkjRIWeTuZF3y3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=577 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180072

On 7/18/25 1:28 AM, Jessica Zhang wrote:
> The following chipsets support 2 total pixel streams:
>   - sa8775p (on mdss_dp1)
>   - sc8180x
>   - sc8280xp (mdss_dp0-2 only)
>   - sm8150
>   - sm8350

I think 8250 can do 2 streams too, no?

sdm845/sm7150 also have the clocks for it FWIW, but that doesn't
necessarily mean they're consumed

Konrad
