Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D77420899
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 13:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342962; cv=none; b=s0n4mbL7gSVur13JrtycJqTKE/Q8Dh3wvLiZKtvQBXKlyOkx4ZxsEiNS1tsa7fOBTPv1Qy08yDGYf6YDXpDytnLhzD/gaFiT4TFVCJ34Fv+6H5IX4tAZPWznv9/p/LquRpADG7AGMA/oDnNSIzulEck5svmLra0BZX8eGdImk50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342962; c=relaxed/simple;
	bh=p3CG1Zonxb2OflphE4a0BdEYd3gJ2MfWN5WFks8BjzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6mRhtOnj4pM47ANfUuMMRquODFaNQbCnKB0Qrk0JuhE0P09+w4u0iCeM1oxNYon7hCTMjdxS4RFlkiEFVys94Or81kp5fsrMnnNgYPzOvvI7C/bUo6B33IExc6tb4/3+vNgjURy2Uv/pMEPdN3gLGoMJQ5GFjC/540xeKEoKM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3ZlMb6M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UTvjlq3m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3ZlMb6M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UTvjlq3m"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxO1r218524
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 13:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HfL25x2ygpCa85pWEtKxsyGE/MeM0+yiGzibLmSqsIY=; b=V3ZlMb6MBVCGEzKQ
	mF5EdBrhT8g+i/UukXHh/eczl1Kn/WduvT+58ONUVnIp5WLDimGeFava+Y6ys+We
	MJadqlAeABUP9bBBqffSehTuMPJALBTcp++Bxqqp2NJiYh8HCi9NcGC5TigC/Kgl
	5tEhH48StT2N8Cb2p1TbrMXe+PbPziRfVnUHGLYDhltD7ph1PS69Pgl1f0T68L7t
	eoami2jja75qb1b6RkhLPSVh/GyYtbB5cqq6mVg9TkE4V7tFfA5WzY1C380fQfSh
	lWANYnJW7E6Pr71jOqh5WX/qnHkj06UJVNguXijIh+sCNRv192pKCmpvhOblKGbA
	vbus3w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs95p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 13:02:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-382befb9555so263917a91.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 06:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342959; x=1783947759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HfL25x2ygpCa85pWEtKxsyGE/MeM0+yiGzibLmSqsIY=;
        b=UTvjlq3mAl1+TIiSloqtqMbeLabn2OGMNKf96A4ivaJDUQmjAdIvltJEr0PnqvHFJ0
         2uFFIk9kILo5thsvAczhxVIlc47Tazyfx2y2PCyq4NgGYnR900etKr+zxlN9TvnMTS9/
         s5NW38Nc9dXnDiCur6uLxIUOdT92qvqwQsWpOdtOqjnByOyBc97I8QDhKDSc3XoSuqvE
         AMoo36ZTTRBt8qDHXCLoW6PpzvpbDsmW9g4Niq2TdpXcyL7loPjoB0VvnNKWrR1nPWjw
         xfrRruzjDdgVqOJFsoAV7MPCbaoXQq7Fq8ZHRkde/Bm+aCy2oj/L6zYwcPgEjrzKEBHN
         NO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342959; x=1783947759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HfL25x2ygpCa85pWEtKxsyGE/MeM0+yiGzibLmSqsIY=;
        b=qYxK88UfUuYf964rjt2Z4x0HbCj3zMOuepRyq4VCYrkpvepuE58pxfnqvBUmxFLOhB
         2Ut68/edHIzZRN+C2d6F2EaUuF2znpBcHqQ2UXM9ZgAOuWRJ3ywzzYO3YakbajnW9Tq0
         7WuNIqdxVOZQblB4GwXSrTqwYkmUWPTd87HpyfLZZx6QNv0JJS1670cJsvLr5onzpNJ2
         aG7W3wyNv+Z2TDn52vwyeN+X9McfrcwXrKIiaKvp0QZ2qyqorIjfoFacXMaWDhZHYrLm
         xVHxoM4qrzjhQuoBTiptCJx8uKTx73kwEFpLYJRnB3IcnbBsGO+79EjWwulNzCgjxsyJ
         0xtg==
X-Forwarded-Encrypted: i=1; AHgh+RoNMqAoZqmxBOQamDfUCBttU7wn7Idmb1HqI5FO37Etu9VYr1Nf/NXCWbVotyD69FIbaJeLHBEKYFk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yziw9IpaGMvSQu5RsBzv0V8TL3347FO/hehSHmcuK03dOA1tDXX
	hDjW8ueSAyndHkQDpxWXrfkTFbCrqlKmI3hdOJRWEHco/8CMvki4iCQL3UeELjq7pDIO5npjaqk
	R54Fcck4ItrL9N56Yx6KElYXka3pAAi3+iepFQdLhiMibHmhi3VEEz/RqveOtqQ0=
X-Gm-Gg: AfdE7cmhvYEeLIQYvxJmV7Gnn/dKm6lYznhYNh7XHFsFg4XY0XimISMNzW2RGjem2Fr
	YpmHNRPkWpkZwys7GtQ8JvfG7dWlHk+iAyWOwKpwe4UqyTUNxfOiScg5ewPRpsXJdGETFgTxhhl
	yIEMQMvzVFba144cFTi+h+q3slwW+oZdm6Vs7At7i2WBy+ZpMFUC+Cj/ODyfqk8Axliz+yBrg6R
	q7afdHM4lhYcuQW0FQlP3X5J/VPySY4ez9WTeTOrYBHMnbOK1/bRTYl8CUbiqd0Rt6+w/Xe5zm9
	chlV5c+3Z5W962sISJLG96oESCYAZFKd946ss7GCCWsTa5LlcUmNaYYKx9qlVsm9gb2FyRtR+/t
	+87E=
X-Received: by 2002:a17:90b:510b:b0:36d:de94:f31 with SMTP id 98e67ed59e1d1-382a05aef5bmr5830401a91.7.1783342958677;
        Mon, 06 Jul 2026 06:02:38 -0700 (PDT)
X-Received: by 2002:a17:90b:510b:b0:36d:de94:f31 with SMTP id 98e67ed59e1d1-382a05aef5bmr5830305a91.7.1783342957847;
        Mon, 06 Jul 2026 06:02:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b629a1d4sm735844966b.39.2026.07.06.06.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:02:36 -0700 (PDT)
Message-ID: <fa75f61a-5bd6-4002-8f8e-6d63b1f94222@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:02:34 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/19] clk: qcom: qcm2290: Add RETAIN_FF_ENABLE flag
 for DISPCC and GPUCC GDSCs
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-10-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-10-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kKWO9UK-_ywQd9MFIXNSW5WemZNBZvtD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfX5nehACymLuSF
 A4nGMaEK9TdgjTbTvRvef8B4QcsxRbcg5jHvf7VM81RSkWnfAcH7KXutuP2jGxU6aY++A5ZOXZQ
 k0D3tbjQB5o5N3sD7sar0dnmFE5QJp/D2ZLLqrAGW07MZMJEyIMX+ckmBhpCSPAV1IyDe8ijt69
 8Afq4Yb+khtvaD//3ajkfpLs5NFfm5U/Loenp9fN9ac5jIcd6Rfpj1l4iSTmGtSDQU484U1Q/IO
 3SmJRXA23ehhMD0CIW98Rpf7LH8Jw5Kssu2oQ4YRGYaAbn5cfAycAuFPDgLtqGiFRxcztYV8fCb
 DUJ1Trvqye3lSTqL/3gVzPRLrXLmDe29YHO632OS4vrpOmvY0BTvgQFOUDNvdbUqK79E2prmQJN
 pYNAIxm9iv4qG0RLQguZeGVN7cLgFtIp/TG363T9HUDfgfgp7MlAmFDCXklCKlTl5fE8vSyiyFl
 QkbUarYCBiUeYSZH9Qw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMiBTYWx0ZWRfXz/lsBvGlMKvX
 G2WAYjW0mNjAtUrCL+INHV0Ht7HdrtcTooQ0OmnKCevQbEDUJrGLS8VdE79zaaA1D9lIvFrqk5T
 orV27746cLnh9xA0mnwgLx+17bbFXEk=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4ba76f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UNExni0xwCPDFZk4GtsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: kKWO9UK-_ywQd9MFIXNSW5WemZNBZvtD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060132

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Add RETAIN_FF_ENABLE flag for DISPCC and GPUCC GDSCs on QCM2290 to retain
> the register context across GDSC power collapse.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Downstream doesn't set that, but I guess it shouldn't hurt..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
