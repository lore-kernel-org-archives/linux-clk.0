Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED62476079
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 15:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153165; cv=none; b=fG/cxSXC7kr2mDwAIgW3noV1zCG0ZoomqcN/f9mXux4cGNRhKW5ApWxRHzfVY/LEpplEX2t+AIBpBnYR/tuskgexNioe8kiuDBNyMw2o24m6LGZD9I4NJOWyGL2a3Tb/N59KqJAC6TVP6f2gPKeC7HeIghuE0w+93EPo5AHqPx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153165; c=relaxed/simple;
	bh=subwLL1PfykQlM6iOV+W88yItVDhQBVTOIwwIwhjdIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S+zgfVE73NDYn686QqWjrmUy0wkZeiOvGOy8IflxCw+VjHW6pYjAmR+cXt16XW3TsoF8obl3td+NPFLoV8HGqNa5xw9gOve4lbmElyIYmVYvC5QN9/n16aIWRc3IgojQuTPwJNlcUUVoHzhQflQ+a4JpF1hvjCe17f6FjWumECM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bciK6+6J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b750EAvJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bciK6+6J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b750EAvJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF2RpI3606522
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 15:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PdkEVait3/YZj6W8c3BIEGvLpmGIEpRHNdctIWV0OA0=; b=bciK6+6J6oBbxY0u
	4xg4RA9fArfL7XHoKFSi3IcQntKVYGwbXt+V3+RRTJi5HfOgyCeFUw/BlyuLMEwJ
	OzmcQcvYkbIBHWsTDDdyyGx9bGbMzXHmhCMHUM8uGYcIWwuHcdzZCjvAgyuIqgmE
	Kd4rnHsxWpS1o0wXdkjcJ/V2k58G5irPlA12ri2mkRaToKicivOrAlXoe6/7gZKA
	X/R9zMjnb/uz58h4tt0YTEEXNNFBqTNJFCcZ5VaGTWabo9+yXXJbOuMwd21iol+l
	eKyFX5meeX5F7/8p+fEtQEsWtMFCSOQiN+U61Uf5FOeKLKCShTCmHQkk7mg/nke0
	C7g5kQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esar3yp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 15:26:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7376ea4bcccso27234137.2
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787153163; x=1787757963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PdkEVait3/YZj6W8c3BIEGvLpmGIEpRHNdctIWV0OA0=;
        b=b750EAvJ/Um1g53Duc1xCJWwrmS2hpKdMzD/5fNx4Yo5r3y9r2PHh+6vzsj8SqNAeA
         gnQqN+/9FpqJLXbhWSvfvjjR4xzjaVgcD6InMcahsIY9QbgZp9+aCUiDDO5wtrh83bOp
         As9rou7/qavxR07dIyQHrnp7uCTnOKD+nFua06OTy+RDvGYUcgiQObZk5Bnw1umJZPM5
         o9PURlrPICL8c7ayeYB5bAggcroPVbQuks2wI8PHdBXhbWIujzEcWX5WiLBq+XPAhi5Q
         TmbIaJlsqxO27u0fXV/u6sQM7QSjoPIyqslCI/lfjzdjvOOy3ADb4WR18qNpktSRGE9P
         zB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153163; x=1787757963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdkEVait3/YZj6W8c3BIEGvLpmGIEpRHNdctIWV0OA0=;
        b=g9Qe40sDvaGCHt11gDYKFciD439rjKTwprqCLcQAjOk+JcCXG2RdU2GWjb3Ww7iCZI
         tKie9lLmMc3B+yq2EiS73GXJx4b3kUT3ggqu+JYcdIvP3Ozmm0pKrlyxLXvkCDf9qxTU
         zUmpoJ9LDabCALBl32U7lXsjZtPLNB78v1c3hue+VERW/gYOvtWt39Dgo5FtLPA016S7
         hxoAoS95mGEQZGWLLUHNNJtsvxuK/wStuctXwEVnZAhXVStyqrHoMLjaUEcbCWXDm0bR
         6J5A7CL1IaBcDolD+uabPN4ca7s3Eo/uu3cnKshmcvfGppz/bAzJI0u1ZqyrUbbpyqZ8
         MCzg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7VSWnx02rWenazqjnsbQKfTMw93TpuP2fI2+4VFpyf7PqTuoobo8bFG97KhSLzlkgcAwLiTIfdSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMONc/KzHC/qH8DANQvKvOhgwnS2qo6TyOuefLstBX+PaEqvC/
	vKesm4E++SYl8oMKvWaZIjm4SFda6bH1L95qVc8rNbB8gYjjOZdPyeUYZ73U8uKF8rHnMWMEgZ0
	y4hV+delGBiL7EpbEs1gPTIgvk/7izAGihzJySUyZJt9lh/JPtiAhNUHL6k3auNg=
X-Gm-Gg: AR+sD11Z8Rhs5HOLgKmqmOt2VjWEr7pWvTNFtFZ+GDcuvs1apEdxK75yWXZZxa5K1yi
	2fWD3tPhURV/s5cLrVIaexAMzaSDtjl0sxu8/AqJfNgsLYFRjHsHK0GV4Zigy/YwMsUCSnZGKsw
	zVJ1Z97u9ja53/pzSAx7XnvVgEscZVPozHbq/LEi3G4hFEuVo+jOcbYsQmJYLvlC1YP+KG/+Br0
	KnGPb1wXMB39yBR3ulqsXYJbzrthLNbHggYjtUG/8xru4bCrfJ/gSe6myPGUNQWIZn1NGbqKjX8
	GMYAYk8LYIupUHnpNZ0oSxFMyKfyzbRKsp+QtwlIECroxo3902UyXNnixXfgmfGPMtFecWxQ7Or
	xjUJUgYtTTwx0xCDN1m3Qz+0V
X-Received: by 2002:a05:6102:8516:10b0:778:5579:c65e with SMTP id ada2fe7eead31-7785579c726mr341014137.2.1787153161400;
        Wed, 19 Aug 2026 08:26:01 -0700 (PDT)
X-Received: by 2002:a05:6102:8516:10b0:778:5579:c65e with SMTP id ada2fe7eead31-7785579c726mr341004137.2.1787153160999;
        Wed, 19 Aug 2026 08:26:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c694c08sm98478666b.34.2026.08.19.08.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:26:00 -0700 (PDT)
Message-ID: <cb3424fd-15f6-4ab7-9ff5-d82e42a13bf3@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 17:25:57 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] clk: qcom: gcc-sm8250: Tie the CX power domain to
 controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-1-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-1-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEyMCBTYWx0ZWRfX3yeKMvIrX1my
 n9j+bIzjW6CfAOwMNOhJvIC8TyQA+nna4arj2AVgJRKaevKiAGEbvDz78APwjiv0uCzQ+xMaKL+
 0XYu/RKB8mD0Dec70lvVBxhVtZK4lew=
X-Authority-Analysis: v=2.4 cv=fKcJG5ae c=1 sm=1 tr=0 ts=6a85cb0b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=9JxFHelw-nvN-s8SXg4A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: _Jd6Pkdxsa8JH63ci26uvG3ZzLbNqen8
X-Proofpoint-GUID: _Jd6Pkdxsa8JH63ci26uvG3ZzLbNqen8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEyMCBTYWx0ZWRfX5+OmGmyKRFAk
 RMVhfRA0Ge1u0hzAFnqw0MGvuwDvFwIcWSzzTggIELTzUFQXBr41TEQPKg2lKSE2H2Ir49vMSHc
 cm/sVkaY4gYsfroYlTcleBTHaea5YuLJqnLzwY1Kp0r6rTcI6HeIVmp0vyDl4dZA3a7R85LBbXt
 hbiv0GK7d59/nTAowH2Mmju7Zeeib3II9i9vzBqEWkfUfNqZo6j6zoJz7o4XRNjE8T97LXKzoKG
 juXNSeIrNboNxVIbd/ZPQz0ij+Fe2hPuMxA06EjS7kRJUd6PgGfjSEYSeq4JtXtEXAqwhGYTTOP
 ef8JWziydY7F9C18wOMfPgptdhSSPxjqu64Z9tNYe0Uqmm/i8FckipJ/2mf7e9SbyxT1oByOFSA
 Ahs1Pop7qOrG1RyKzxziIHCSEMD6PJn+pMi1AxHdzdxqtGfX3af7Fcf8MJ0GAWjW3Fj9umB51M5
 KRPn4k4MobX5H3e9LOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190120

On 8/19/26 2:51 PM, Abel Vesa wrote:
> Enable runtime PM for the controller so the common GCC probe path resumes
> the attached domain while registering clocks, resets and GDSCs.
> 
> This lets GDSC consumers propagate their votes through the GCC provider to
> the CX parent domain.

Not really, this is rather taken care of by the special-cased
single-power-domain automatic attachment somewhere in the pm core

This on the other hand, will allow the power vote to be lifted if
all GCC consumers let go of their clk/gdsc votes

Konrad
