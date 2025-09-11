Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BCE313555
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757588955; cv=none; b=PX4+6DoEDogbULDvWmWAheRHTvUc7VlRrwtvuB5dZacAshjlyfwCGn9GPm3/m6JVG1D2NPJQTxFmdd5SHq4mvsjX/o2jjOKeXvSj1DjQ6o72bQbjK2QzWWpXl43PS1QAPJeM0Z/xHkdxG89vFVWcq52zTFzoO3OWyxK7IJ2Nnqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757588955; c=relaxed/simple;
	bh=7fiPv+Ac0qIbvN+XJL3bTlw/OXGpfDXTmYhQ6twZ+Sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OfKjhC5Sv5FI5qvv4N4F3z4FRsx/KSD271DA/B0StgQeNmRnTXVJw1fIxGH8YXL1TfqBaCr/KKhC+5/AZSUF34wex80PCJkEQJl3gSxIv2bYJEWXn41iJc2Ozgi94UodBxl7Id9sN3NU714EPNUbMJ2WS+HIxo3NKi8w+8MqQyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXDI/OXu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXDI/OXu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BB1jR4026249
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/cKGnPVRnMvhgmxQl1m4aIDa5lnkW4kSybxoSBX28WA=; b=KXDI/OXurfeCzfiT
	pAZeGSqZJBWJCYLlkdfjj202SQncUoNlxH6fND3oA6f/3mcSeBnJq9EMn3CSUHfR
	aRl4BsMD1huNlrMBbEDY2wlqDGWbVVTRSOSUfPPkt+714TsomVQNr+bY6+bH/Xhf
	SxjTz35VDGAW+RPVqk/QgDsKpkm36ce/NmjSQ6pNtj4UqlsK3ohwmv+/E2DfAP7v
	RvU3TXjJtkX+qjzVq29VuSyryneEvhAnW8RCj4HtYPsi/ESWzsfoGoXeHxlqO7g/
	beCMrkdCirrihCkYL7k4/U+zBmXL5fyeuwplXIwgEk5rLSxiTE8RQZB7EzBypMOO
	BJWQDg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h2ba1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:09:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2507ae2fa99so12310175ad.1
        for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 04:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757588951; x=1758193751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/cKGnPVRnMvhgmxQl1m4aIDa5lnkW4kSybxoSBX28WA=;
        b=lQpup+qjsmurVbwPl/6Entjp/htlrm/NM1u6clAhALu2rCdAU0V8DvwFs739G9jsvj
         UwAhjAsr93jgRWoGASGAneHsyKkOc2+JiTUbaVFLZxEHFBK2pOe9pTtqHlDm/76hKKSJ
         ZVQMuGVltVJu9DdRbM1tuOG2L1CFt8NphWCOZN94Ll12lGjhq2AzxcXx8QVIN/r0QMZu
         jww4oRbYlk8HatSCaDmG4GNPBTyxEsl0Zrl06pYKqSimTe+NgrCA6EZqIzd2w4w/O1LB
         feCitQyg78VEaNvi5vef483LeKb4E3FhLBn8ScSq/d7Up+tA+9eaIugp4rZcwcRKQXut
         TTCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZf/iEXQElBel1VJzG9HQAX8X95Ys6PXCv8tXCqURdN9TBdvrG+MJysUEbRrwN9EtkAdzQQ9BX0KA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlbPcHBAe5cBlmkeD9dE1zDsq+DA2VTSCrhUneNZUygmLJt8KM
	rkN3YhKRTzwRZTFF1Gu+hhOBgtM6NPSJyvgzjpfc9phrhMFurCOn7uj+USNLF8TMAoIDKvQsDdf
	dujehUUJNkhRgQr6/wYJs9yNozvGDh/Jb01HlQQ5Yk9ayLX+xFK0/Tkxlj8PmTUs=
X-Gm-Gg: ASbGncv4Tj/7vvQY1GchJNZHvXH8Gyi6MqcVTkvW2FJc5VQ7Kx/vcAlsLf3OZJQCjHk
	yiIHdk7I9GYEJG4JnjQfOY6Mn/phiy4LwVbslOKrKW+/wK8T6NPLjdVNJSZl1H63/7jZbNLLySg
	CwNfTlbeElGGdoYbseJ8HBVacrGnS008d3FW3lxO0YLWdk86VCgB7vj/vrBOdV4vH6ykDJXNr9s
	T6KgNZo5W/f8oXhxec8+63X0cclSWUtmSDSI4iSzFMKb1c1kCdRosH6umBxYarXzxEmfoVqQljJ
	PUk+cTQbL+goDadvx19Jb2dOAzuxoNcNC3gNs8tvJKI/MJejP5G6kOjPbTCmp263q4v2ID8=
X-Received: by 2002:a17:902:e542:b0:249:c76:76db with SMTP id d9443c01a7336-2516ec71a4amr294330585ad.21.1757588951044;
        Thu, 11 Sep 2025 04:09:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELV1uqPskHNtD+xDUEWcfJ097HQ6nqqcRjR3sr2x/h9KyHfRA4L6yogbn5XFF3+ZUIVoot1g==
X-Received: by 2002:a17:902:e542:b0:249:c76:76db with SMTP id d9443c01a7336-2516ec71a4amr294330155ad.21.1757588950621;
        Thu, 11 Sep 2025 04:09:10 -0700 (PDT)
Received: from [192.168.29.198] ([49.37.133.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc6ae8sm16362305ad.15.2025.09.11.04.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 04:09:10 -0700 (PDT)
Message-ID: <3894cff3-97e5-4b7f-bccd-9f733c5af874@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 16:39:07 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: qcom: camcc-sm6350: Specify Titan GDSC power
 domain as a parent to other
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-3-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8k7FvIbQdtckmCGR1__TBKbe6wRUN-JX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX05p9g1z9fwIT
 j5xNzxQay3ItWyzyaYHcJty9/xdphevmWkHdSiOtA9GKq+QhkgqlMeouE0LBMGLvIBn6izO8ZIc
 33hRUvIsZOwEJXRjMO6gg22G0q1qL8m7cqzfhx6Y79cuiKTsDpGgsTe2u9Z/dC0uWQQRkmm+S+M
 EwHaMMlk2igAmZAEDsNRIhRCe9nCgbqXWfsqjycjaJDNCa8Zg6+ZbhZeeDSwP6gA/2K5Azl0ZQd
 xnZ7ktibTjVQ6D3eXb9madwvwVffnPzlIkjG+t0V7LmzwJOjrzNQSDREOk+G2/haTI7DQw59fN4
 Bk96QfTn+8EWqYuJ+E4eEVczTD1FzXPAshEc45RZ9QeGGf+j3ylflO13mnHduPxUaIEa+d/m7mz
 n2CUvJ36
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c2add8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=l0trHdaATao+Pp179813Xw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=N_-oEbGzrVbpv_w9NrMA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8k7FvIbQdtckmCGR1__TBKbe6wRUN-JX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177



On 9/11/2025 6:42 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM6350 camera clock controller to enforce a correct
> sequence of enabling and disabling power domains by the consumers.
> 
> Fixes: 80f5451d9a7c ("clk: qcom: Add camera clock controller driver for SM6350")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sm6350.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
