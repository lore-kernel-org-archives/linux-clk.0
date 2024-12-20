Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5330A1C32FE
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 10:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734690522; cv=none; b=LMDdoxeVPlcz7mTru3JBJ0zFzMFySzBLhTccvr+7WBrOZzk0EIQaP5P1KDpsMH+FKpzQO0/NVfrHI710i4n/n45YFXPb5hp0mDDT5dzoFlIug7Vfp91naRrgEEmktHxG89ECsikRraB/JJEB62O7YX6KHU4URT7pQE3X9v5+iYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734690522; c=relaxed/simple;
	bh=5QWr8KiK0fqKJ2BcZIva5mJXwGTB/TaTgOD7YAkLkD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iZLIeMtjFUMETZTb7hUsbNJeB3cTUrpHG/7Ilukjgzxo2fc07B3ncw7PZWjrwNml2V/387IS32HPTjOfCRdlr0gQIyyaJ0ZGuPa+jPN1lN3ah2oxCeYaeKlgcYU46ue4CZEnp/HulvcXtTz/hoqK31K6qeqXegfluBtEcJfDcGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gmjlEI1/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gmjlEI1/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK5egjs004935
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 10:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B0LK1w8USgsUPXw9o6UhgF0/OBJgHQXzHotizFN7BT0=; b=gmjlEI1/IWZYvFCS
	s2TrItx7xzF4NNTQ0SUQ1wQ/ICLkdu/xm/bxSapsBQD71mfrEcndIp7m4uIVh/4b
	1fVL4GhNLbB3x6Kbryt3Rdj88zz8yX+wfNE3LbkiEqEt1kjqX0tAS1xj0ux6dEWl
	DeUUDBJH5smvKi6iBsGfHNoq+5G5L6vGnKCWGam03vdkVNNWI+6mWMV2hI1sV9YI
	xsGRzmhKvYXsSwWQJjp8gT/zI26VDx5HCwGa9ZkO0HRttABgXHyiuw0EmwnnBKL3
	4/8E/UOQ4AgG0gDl8eFtN/Zu4SZDvVQjgvQMSz1QjAGGN4n3UceCg3R+g+7mkMZK
	Fx4jLA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n2n5rrtq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 10:28:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4679d6f9587so4598011cf.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 02:28:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734690519; x=1735295319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B0LK1w8USgsUPXw9o6UhgF0/OBJgHQXzHotizFN7BT0=;
        b=EYsUG+4iC8jcttt2h0uV2yhXqqviSLbplSJ+BYTGaiscpYgi3Qm63XjOhrgHYSrp8I
         bK4bi3H6QRWlmxz3e0B+7W5gipJJpnjSwezw7jX3OrzkyntZf0JPNX+qTBUs+3mv32+I
         H7VHsyIW2trQPQ3XapJpUvL0gjfXqz9OWxKITCWwrZAv8dccnb9a37u6FRmzOaAatjQM
         1QBgQeowg3iIxh+y2IOlCFzjY89mYpZkEnDVT1kObcS4QFVqGyZAMcQaNpQ3eYKlXeM8
         NH3ueqWOQ3SYca/8ucNu5pYIAxgXKVT0o4B58qfVX1i7YaZFEhDbMf+1DLSesocvL/lD
         QhLA==
X-Forwarded-Encrypted: i=1; AJvYcCWsxyA/otzHFNNk9eavTYAOI/UOHMNwPeXEUtruk6mQvGaa/FLFbA19iKsdoccHi8js+VAXJJbiuos=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Op0Sf/4JOP2t5+xpx78M6RxM0+uK2supPpoCWili74TD3OWZ
	krsAd+BtOjl0o68HsJLzLgQtt3FQDWjZ1KC4mVCCeF4jHqe7L2LF77RZjDw6QH/cJgZc6Ucvlgu
	J/Cb5ZT1pTXg3IIg/pXGVBr9fFeFTkA3nGUWvtpA9X7v6FSqvs06p3Ypr2SY=
X-Gm-Gg: ASbGncv1gZan/qI2XTFOYfgOYajOOfpPPApTyM3fv0N7Eo9onE7U6RAJcOx3vcAYfQ5
	kdlZwihJ0L1/3JHv+tP1M93yCEpIh6Q1pycgCtPks+Sa6ARe91kwJnXWhUZ92aDaqYnRagWv9vI
	LFYhI00cwwvmhDXBEomC8q84lCRuU3H8+7f4EE05uew7iB2KJXszVHocgjZzNkPoyVu+gHCb/Bl
	snqKp7SzuTCRug2c0tAm4FbqkeDUgZOUUKX47H7VQdO9uStGDQvBae4rOyA8GUrF+7Lmtmol/DC
	durzGL5DJmOGX54TBlDh8dmpC5AZ4Dzuoo4=
X-Received: by 2002:ac8:5f93:0:b0:467:5eaf:7d22 with SMTP id d75a77b69052e-46a4a9785cdmr14547611cf.10.1734690518997;
        Fri, 20 Dec 2024 02:28:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEnO9AJSDDgOGm3ytySndEK+tdE7dRdZ3crkt+on5jmDGWI0kAK+1MGayLMPEHLC1GlL8+sQ==
X-Received: by 2002:ac8:5f93:0:b0:467:5eaf:7d22 with SMTP id d75a77b69052e-46a4a9785cdmr14547501cf.10.1734690518633;
        Fri, 20 Dec 2024 02:28:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0eae4345sm160775866b.84.2024.12.20.02.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 02:28:38 -0800 (PST)
Message-ID: <6220744e-8e62-475f-a1a3-3b7c2c888b3b@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 11:28:36 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sm6350: Add missing parent_map for
 a clock
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241220-sm6350-parent_map-v1-0-64f3d04cb2eb@fairphone.com>
 <20241220-sm6350-parent_map-v1-2-64f3d04cb2eb@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220-sm6350-parent_map-v1-2-64f3d04cb2eb@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lMPKGoWJqSeaM3uoMTw6HmaidxcyHJbs
X-Proofpoint-GUID: lMPKGoWJqSeaM3uoMTw6HmaidxcyHJbs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200086

On 20.12.2024 10:03 AM, Luca Weiss wrote:
> If a clk_rcg2 has a parent, it should also have parent_map defined,
> otherwise we'll get a NULL pointer dereference when calling clk_set_rate
> like the following:
> 
>   [    3.388105] Call trace:
>   [    3.390664]  qcom_find_src_index+0x3c/0x70 (P)
>   [    3.395301]  qcom_find_src_index+0x1c/0x70 (L)
>   [    3.399934]  _freq_tbl_determine_rate+0x48/0x100
>   [    3.404753]  clk_rcg2_determine_rate+0x1c/0x28
>   [    3.409387]  clk_core_determine_round_nolock+0x58/0xe4
>   [    3.421414]  clk_core_round_rate_nolock+0x48/0xfc
>   [    3.432974]  clk_core_round_rate_nolock+0xd0/0xfc
>   [    3.444483]  clk_core_set_rate_nolock+0x8c/0x300
>   [    3.455886]  clk_set_rate+0x38/0x14c
> 
> Add the parent_map property for the clock where it's missing and also
> un-inline the parent_data as well to keep the matching parent_map and
> parent_data together.
> 
> Fixes: 837519775f1d ("clk: qcom: Add display clock controller driver for SM6350")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
