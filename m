Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DFD3B442F
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761385; cv=none; b=o4oGejbttIsigogZKBDuYGVfALEXK8GJnzt/jh7BrhsUKEPIkQOQzW0l6kOwclQxS8zRj1UnuIfVXHyDzke/P++U9t36RYeTk172jMy59Doq3UzRs67VWiCBBJzMkf+zd4VAsU6OosUllE8ex2pcZrlyupc+6AAmb0atPacXXAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761385; c=relaxed/simple;
	bh=F61vfpCLUs230+Kga6ah7vN3n1G+Njimcu3inI12qr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jPZJabDt7ZZQZ36Mo6m2oKS2+ld+Bl2GyhpJXJOE2BUQpd2hb33Z5l1A8Y4Fs1A7jbcrfnlCnc37/WHktltgcCeBLyHW9JciJBv7aTbWud6rWvddlQ5ZcGIevgbOVv4fP4bvihcLxIHR68EalAjBmw02tZfVrasQxWZaumXNO44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcquKj9N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VhnncA/J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcquKj9N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VhnncA/J"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U97uNQ4151940
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 09:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Ff0K97C/PDgp13TGJrhCjv+N3JCxrJHQbq4bZUuBrM=; b=WcquKj9Nb25jIoOy
	3e9y30+dQhDIpJE6EqEi4IV8LcWXoiLaX1ntxCOQhRoV8ov4g6+fomzoxzqJEPMA
	TiGwSQY/zuMeSelcR7P/8k+w3O4tU0zTMhPrJ+0XvQEPfS1Oyt9NxdkUdtEl6R6P
	z14d9ppkf/wIi8BR89ddG2SHwi7OCAjE3qtejTbO32NCKR3F+IrzNlCrDxQCa+D1
	ijD6y3+W4Wjo51csLWZzX+BMg1DAHyr8OKRmFnRcJH08RFpPmMxGZeqh2AIDcs3Q
	/pN87YR1Y1MVIMbjaw6EilslAedsCxuSowlaeUETzZ9cjrRnF2J4/No1fehYwlBu
	Iws+TA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh8053c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 09:43:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9178ba8eb30so2712006d6.0
        for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 02:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790761380; x=1791366180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ff0K97C/PDgp13TGJrhCjv+N3JCxrJHQbq4bZUuBrM=;
        b=VhnncA/J1/kgjMd/8Y+DO80ok+52i1QGeCthANMbRKhy8EQ1cOgYRMd17dk5PbGA5C
         yADeImIoNuc83j7frVb6hMGLx82z77ikAoWLss7vfLoT5z9bx+TYnm4BQsEornsnR+Z1
         SBnR/3+hp5bci5Wxo4b5V+Hg7mM7LHmNx5ulUU6Ghbrguob2YWhXObIga0JsqVrNOZZA
         eQJHqbnoXqtOc+Lar1HAWEMjGy4IhfjfSCTjAWpbDJvysMXmz0TpI/kNrVw/KDmm4psZ
         E7ZqwDVZVNbHXLuV9plEaVvSKCIzU7vZo2itx9CpWgwLKEQx/ygj+VkIE80ICKZeHmEb
         NrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761380; x=1791366180;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Ff0K97C/PDgp13TGJrhCjv+N3JCxrJHQbq4bZUuBrM=;
        b=xV2weUGvyAurFP+vrjXDHUhDetUkwpcvXfgKyClusjSEftoVd/VZeVS/3PHOqH/sGx
         +oYfcsv+/PdVUGk3xl4Z0Nftbms3XHHdL7oWZh3TqHtaQ+wgcinImC/L0Sk+rdc4102x
         vsGRPMUfhJUMwasEIoGMqnbOCgPsTPVxMujf8GeXvw6g8d29iDx1sEcHLbArQI+QNYOB
         TrwhOQAUFngQtjNnUIyAlzMuIWnrKMyyCWQOcHEvHC2cs7EkBA3V7XzEsZ+SPRAbg+Vg
         14EakoJHum37vfs7+wBzWvqSXoNdpCvti1zEf+prob9PQ1gpyUFi4bWfdEMquVldEwZx
         Nr6A==
X-Forwarded-Encrypted: i=1; AKwUvBzmacQTr4qpo7JR2GHYl7pIYzdWnbTajRzRgFLVkUx3g4MGXe/kISojjO2lNxxrRrCYelO0yytGYpU=@vger.kernel.org
X-Gm-Message-State: AFuF++kQz0c7lRyLDqT7GABi8F9utV2WX4vfT9STItexw3Bt3diHJECe
	vh9NgChIw5Ia0Z2hkGLGEXmKRPVu9792wsbFRLEWpnzoCAIVUrbF3aZfXYZt8JPTirUuMMI+AA6
	7nVCKPwsidoJ9wXoGKIK8pqCt8YuclRjTh4+jDV8rhYgSKOmSTUoXgtIclUygEV8=
X-Gm-Gg: AYBFou20UKBBmozw1Tl7lwP3k86FuEIms4OlzL2468E0wDtR6kM2qZWe5Bx9lXvUY+u
	EU2iGtDwrD1m+pv9Ao27926+K+VbNGIDf1yw8ySKoVuM+NlBvzYzbMwVlhxoXFSRBG/CqkrJsfz
	k0vJTto7C2bYqHwoTqZXw4Vau9f5E4I+y+4iOkS7LSIFfG64qkYCrgSKsdBZPUFo64tLvLG9XIx
	htRZjbqCoVv5hwwZUAWK09+CMudIRorGoJUnKi8RjQi+E6G+Ifcot6UsLEDMXNqRo7S+j27A8yu
	Yle1crzyLNJDO5lCbKpbp2aXdRt0ggkhiPrZ5UB5ExUWonRp23bEIkvFSGt15tXJ37Bg9/z9LwM
	vv2mRoenmyQ7M8YfC/XiBNg==
X-Received: by 2002:a05:620a:19a3:b0:93c:80d8:5802 with SMTP id af79cd13be357-93ca96ff8d2mr113845585a.4.1790761379525;
        Wed, 30 Sep 2026 02:42:59 -0700 (PDT)
X-Received: by 2002:a05:620a:19a3:b0:93c:80d8:5802 with SMTP id af79cd13be357-93ca96ff8d2mr113842785a.4.1790761379026;
        Wed, 30 Sep 2026 02:42:59 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f42d25sm36994466b.13.2026.09.30.02.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 02:42:58 -0700 (PDT)
Message-ID: <a1f90a3c-1ec5-44da-9260-46186a4b8838@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 11:42:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-sm6375: Use common clock controller probe
 data
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260926-clk-qcom-gcc-sm6375-rework-always-on-clocks-v1-1-28f581ab0289@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-clk-qcom-gcc-sm6375-rework-always-on-clocks-v1-1-28f581ab0289@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzOCBTYWx0ZWRfX4OE0/mEiMrce
 g2tlzoRNUa9HyOJtV/4G4/wqMeWnD/wnzUvChmStr3BQxY63MKT+Kyp1dv3jh1oJnjxoiY7PPgM
 cvEKqJdx/4m11bwMfB5zZC3U5QB4YP05D7oAut6V/vueRzrbnFpFZUgpUcJqHXbFRA1M2KRRz2W
 Qg1ctrH4LD6p5FsCNq3ZJkHzcx1JsZIEPR1nZ7UM709Xi5R+SArHDFNhfvGNTFgylKqn1lgoT/w
 6HMyWyEDViiymE2YSMzC30o9jwXftD5WcZ3429faNl82QiFSeU0Ta2Jz6WC0zbfxDey+aXlCjq0
 W84MgcGXVQb4XTEKXjhB0UNJqrcXytMXDNkrHh33NdG+aXpXB4BSQ7iN1CKd3Nk/ZesljdbE1+W
 /V7u335n6XdoOj1FPbRhfgFCYgCaJzPyKPnBs9ww7mZmjC8w9eyjYwSvUwOvafOkAHtieRkjYl+
 Oq4CYi3qaCAK78xgIfg==
X-Proofpoint-ORIG-GUID: 4b-7accrKS0SAGmyC0ZEWePxzMMQ-T1D
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abcd9a4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=XUWX-FGXn234V1AR_7gA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 4b-7accrKS0SAGmyC0ZEWePxzMMQ-T1D
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzOCBTYWx0ZWRfX7nVrCaCQ3/zm
 t9LgOFfzCAS6t45aV8sU6eI8SrIasgf3BGwOf27Nir4YMwF2kkbBurCYbhY5Mii42lkEth+lzio
 jSk9/WKWbC+whl02NlXzOOmbhX6a25M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300038

On 9/26/26 1:16 PM, Abel Vesa wrote:
> Move the always-on branch register offsets into a critical_cbcrs array
> and describe the DFS RCGs through qcom_cc_driver_data.
> 
> Move the configuration of GPLL10, GPLL11, GPLL8 and GPLL9 into the
> clk_regs_configure callback. This preserves the existing ordering of
> enabling the always-on branches before configuring these four PLLs.
> Using the alpha_plls array instead would configure the PLLs before the
> CBCR enables in the common probe path.

I don't think that's a problem

Konrad
