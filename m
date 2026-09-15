Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E26D3B47DF
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 13:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477326; cv=none; b=fLLPnC77U6kkjNyHmWHaKfWK4wyOl1t3sAS7PUtHNguwvs41hv8AWh55I/EVSvJOyvGj4a3chtJRNnyEnzkdsUNum5jkSVwVbHYwM8mYDsynsmUGor/G1eJFjYcowYZuakujAXIQINdVBCFeZCWTndY9iFCBzwtXmWk4h/vztI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477326; c=relaxed/simple;
	bh=iQGXphKryUmb+DAlTxCnwPtT4u12722nCx+SciMAuww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KgdlYzlblm+SQhFycxPo2WvEh/Y8j6Y1ZEfx91AclNNNypvWgsv+6dFotckNlGCUO3X49q4CVisVb6DVRL/IoKeYC5w7MVSpAjBGkw/r1C+u4IAEeTjh2SRJuXN3tNGaSTvbhnpV5wGqVIxjpoxg1T4vLNcjWdtF+sozepLPAFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aj3jLjwA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMz92pqw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aj3jLjwA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IMz92pqw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FCxnLM510307
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 13:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0TACi45iWjML+NP56x0bPRivduU8gk7mMqeeyrAStfI=; b=aj3jLjwAu7ygID7T
	vH+3qNmJKZDwABb/57fLhQ/8opZQhO+DaLSsRox2nDPpDcnrmthDhqWXNHYb22jp
	xLs1SoBIn4be9TmfFOxkw4d8qTDiZgy7/IZe5D2yk4S4E/EmleBDsZcXpdtbaZqc
	cUV5xhWAWWamEOrv+CL51filHnuj0HD+MNRbbQ8BYlN48DivDzlMA5j4AsLEK+pr
	FoZUMZJ8cdIjB/nRvV35la+weNEn86mTB+WocQyZyc4K+KAnxufMxTYm9WIpKYUC
	wbq1mWV24qOXEVeRLAAu0kUb8deVlar41fgcUqzKANnFPsbwUUJxobc7bDOYTn1G
	AWv/6g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41vqfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 13:02:04 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c97b57ef2bso112470e0c.3
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 06:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789477323; x=1790082123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TACi45iWjML+NP56x0bPRivduU8gk7mMqeeyrAStfI=;
        b=IMz92pqwNV77rhe8WMIpm1IgcmwivKq7GQTu43mqCjqHoZq9S+J9vJjZy1cdyN1LD+
         4MxHDDX4M8lC8NKWBHpoKxQDk4FO7ICRTikKsaCfAOcFWwQHKNX9N/XMG1ABRk1L+X7Z
         7bn0ADWvob/GkLn2uNgKtwOCWeUXqfhkn6JTaUD004ofXAVT50axUuUASRbWhnjkbA+Q
         Ih4zistDeLwitTq/rWeNgAkBfOwaonhsJdZe5s4qU8dwo4Lhen8r8CQ9tLEu8CBvOXh1
         zaq+0gg9cMRG2Vdqqj89jjVaGMYD0+l0zEDw6WwEv4wY2s7lpJLHlefezKHvYWuYUkPQ
         z/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789477323; x=1790082123;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0TACi45iWjML+NP56x0bPRivduU8gk7mMqeeyrAStfI=;
        b=WtPmN0Fj9VdZxy54mQ3iJ2+nRlZIn0gnl08f1VYgK+fDVHOyTSvjjxCyHSEy/75dL6
         Lx4QfM/38doB9sV65j988QMZNf16zCw87iX5bEubaVOP7Nh1Sct/PFN+P+2uSLJH0qXH
         n7x3p1B5T416v09CsjL7leO8IEul+QXsy+2mutY9WABildSunJI96bzKPTaULbUM3c6Q
         ym7KCl2j2OwShR7CP4yDXix53HgGXkb6BGFQ0iTZ3CNP92lDGbzd8RsAcq8K1ngykbTm
         jlqJV+QmJJl8lbz5nZGu9g0I9CUe2yLJ/42csysom074COyVFVm4pTVQ6Lz3OWmfCLBi
         4fgA==
X-Forwarded-Encrypted: i=1; AKwUvBylOH9Hp6NIjdqdnJ40CNf+UEWKLwueQVj+8LY5/g9WCTAoJIrCmkF7urxa2XoLDknzA6xQ70/eSmo=@vger.kernel.org
X-Gm-Message-State: AFuF++lxy3wigJCmbbCuZAxdrI/LFURRQH7VF4dE0Clec1TXvat5hsbu
	6LrkQYKoC8QJp2PiJjdXdDBGJKgQAzIiq7U13Y/yq/Xbcdzedf0JhOkTn4d5A6VPMXjvYrMk3+b
	ruPA1nsmNe5JUQwhtZ5qZs4BcaGbBw8nGmxbIzjHHzbxwHm7IRlImuft/O3LA+48=
X-Gm-Gg: AYBFou0cR487r3mV0QcGtdTZqGR4zx8G5dfNMlgT0wpU+dbBiPnrVQ3G30SWlkYEUpp
	AuMLXbeTfgcqlblxc0nYXHEtztraiI9BQ8Tt/Sn1OyyrRnwYHu28o6OqCYOlvefLB5tO+hROEry
	J6VQz6oawnaI0H7uvC1cEYzAe+1i3eLduiUEM63KkGnAlOO/louE+izEC1cWamdu+ydu3IbodXg
	C5f5B3bG2gliQXCK98G7EA6PTWasRzI7PRcQm5RHhhe/XluG/dKVrMzIJws0FDC1N7lpoqYbuKF
	rgGz1ancaSIUNNSC9R9KnG19jQoOXR9EhLL3nmgh3zH1y2wmP2dJFyy5Y6VB5WgA4pRQsXsz7tM
	yJsXdBLWhXi1oE0+VR5htAg==
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr2190661137.1.1789477322068;
        Tue, 15 Sep 2026 06:02:02 -0700 (PDT)
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr2190529137.1.1789477321202;
        Tue, 15 Sep 2026 06:02:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3357673sm33700881fa.31.2026.09.15.06.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 06:01:59 -0700 (PDT)
Message-ID: <4047a1ea-f105-4b8d-86c6-8176ed58d9b4@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:01:56 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] clk: qcom: rpmhcc: Add LNBB clocks support for
 Glymur
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
 <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4OSBTYWx0ZWRfX85aU8dU7t3mU
 F8SBIFNJbb39pajQxRW6AWUXHu+/R9SE6vOjvnXqPxYmQVCX3y8PmEjdxV84Rdq5grp+97eYSdQ
 5RrOyaeWyfcglSTFspLyanq7qgZ3B8NnzmapQVrENkb+J9p3iOyvYeJPY4jq6EH9ZYM7ca0avSk
 hOGpl+gG1O+f3K/HNqhOw0v/tEPTuQoeQZY1VqD4XnPo/ZsFgrCuvx38l7CnDZU3qGcwgDjL89X
 njDb2wRqi8ahFcVTK0iwZz8Q+QHeOnFhU83olDdGJs3Ix0BEJqUXkcn3pV3Vg2oM8fqkqmsJ1fU
 idYVoZNBdLn5BVazoUaY3ibAcuaNIr+ItYDleURI7IBhAA4tWjp/r1vFRhwu51Fw1cuIYGSuwRw
 wSEff5dy/chA33oLc+ivq6mpEZaaygz4T+GgJcXIMV90PgajytOi8Rgdyhf2ETuni3MdNS8ysGm
 ufk0CATWJmWiRTBy45w==
X-Proofpoint-GUID: n4GnKUp-t4HLp7UBJ_rDwsWTlzAj6QVf
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa941cc cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dHuaQup7kaPGrqMl_VAA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: n4GnKUp-t4HLp7UBJ_rDwsWTlzAj6QVf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4OSBTYWx0ZWRfX2aLIoRKybSIi
 pMfeFmouTgEB/kRqy/LMRdHYEoz6X6YyG7afVkUSMbfNsaJl8uUjfZjWvBC0TTtjbK6cafe6W6R
 4ThVaXbJitTLQl9A0D4evNj0etdqSFE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150189

On 9/15/26 2:07 PM, Jagadeesh Kona wrote:
> Add support for rpmh LN_BB_CLK2 and LN_BB_CLK3 clocks on Qualcomm Glymur
> platform.
> 
> Fixes: ebcb9db98bda ("clk: qcom: rpmh: Add support for Glymur rpmh clocks")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
