Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2497D2E974D
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 09:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757582953; cv=none; b=oFydRSGbP8jfynH6A31R5JsE7GBGr2aZ6AWwnAaqnpwiRNmHTLTJQAJLLVJziZJ0TBJE6cBw7OrGhiqLAyJWDd7UOQN5PGSCosOvIG7cBZkCyQkcij9rE/+gSMi8I6Uas6vT5taWz9D+XViXJrhB5yAhWEVnnqFLJQpiGvqYzLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757582953; c=relaxed/simple;
	bh=ipXS9rVBQf4wsqYin8oB1mjXXUmA+Ac9XDh9G1Q0gWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbPQits8z4rx19oGPzrq1JDWhF3mxcGQMf7gve1PtDEiLMwBpfE8vvOSxlXL0azD3nGoHkduO9p5BtbjN1M38Vh3hdA1Ns/w5Ql5wi3AppNMkCLOtsnjZd51O+D6U8PSjQpHT6ItNCZNTFsZZKDJNy72dSSc8rlo59hmo/gYn9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+1GRRRU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+1GRRRU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IjKG031026
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 09:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7JL6ZwC7GKOtZo7eA8lk+WbkGf11yCi9JngNpI6M704=; b=S+1GRRRUAZLrH58L
	54CyqAMNeeFDmjGNuD4C9Fo1eHAQdESsMeqFzlmCYZ1FjnjykIQYQkRKWVcA9Lek
	hvVYevnaRGJd+L6sCDlkURHzk/NgtaRejd4wOmaLkk5bPD24NfPXCg3uloUqmgPD
	vJiWPxdFr/cwqSWhcpotGc2QR3tDB7RyiPvzm4nzEYB1CPaoX9Yo/kY9H/dU4E1a
	/yJmzxCG9y5L+FrMCGzTX4sk+mPzNC38NEw/Pr90BZXRbAFqrhSsmjsrhqcNnVay
	iiUW1tOUEAXUTdVNAwezEgPGTVOLtn67ivqRzPpld87YLJV2F4lChmAZa7NXcB+Z
	khLY/A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg6v44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 09:29:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b600d0a59bso1698201cf.0
        for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 02:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757582950; x=1758187750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7JL6ZwC7GKOtZo7eA8lk+WbkGf11yCi9JngNpI6M704=;
        b=oWgDC1JD/ISfTnPNOAYX/MSgIBEg7C2TcpIGcsoLfivD6pRM+Lz5s52eCmLOQ3P263
         tmhFZCL99cmrwQ6r4Ltr75sVuCIPHhwLTzdO9d8DhdwhfaV4vWZ/zmrr9TYXLzojzwVT
         xKCebGEWolQbchRrYcoCI7L1zr4jWpMyl62/o9mtqxfF+ts/jx5sK5izWGmErZ3u6zfA
         fw66X5+7osJ/he+JF6TluR+DyqItWi/reZJmqnRugfdY7LLvrcZt3D3R0rZqH2tKIdxc
         DOZqnFy22o3p48CegWyn8BdQSKrI5FoRRomCf/2EIRLLvG5NtEr1YRSoemnQnbiUiYjB
         ZqMA==
X-Forwarded-Encrypted: i=1; AJvYcCVQjaMDU/t7hLH0cJXLtayjygrnJ0Qrk3iA54GpGsJkWYMWtZQ0UFpbvl+6VVAUAkizh/9o3yOx7WA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfTR3EBL1No+YQvU2P1K/t0JoQEV9F5iyGBSn7ZDykpq3WrEYI
	5+grOg9iAGlohylXLBnpeIbkKHoN39mRgzZk+pOZdJV2uFUbVVOcedzXtVzkOYTx4V7qwidXRTi
	rCFF7kvCRu6cXolwDi7p8osfAvW4pT7aLhGbikzPlBXm60fihPNi9qcRThNwgX78=
X-Gm-Gg: ASbGnctOzg0lP4Lksn3wNUnQcbdWI/vuyoDRbEE/ViHRvHHuFe3o6xWmVKCcJ5PegJ9
	sZHPh1MKIL9F/inMgmXEHatb1hT+bjgKgB9rCNmPvlCuRVxIs2ltWprq9eDqHOm23ds9zwgoS6a
	rgRrDe3W8AiQVmHV9tSPRhhW3Q8A8Rsl3IpCYWGqsdDVZ+kMFPjn0x1SCO4lhOSvGwwap9xIIWJ
	j7RDW023qBpZzy4B9+AbtbdiWmYbCGXxJv3YvQ5+hMIWX6+k2MWUHbaGz2s6NQA8zYDS1fi3/R3
	zEmzJ81wvdiceBX0UmeyLWFGkTsuohQ54QDJJthKApPO4QETZBg2TOiyEAV5FIQbgtHVvNambFc
	k7iTQPcM7X/j4IYT9lY1hKg==
X-Received: by 2002:ac8:574d:0:b0:4b5:e4dc:1eee with SMTP id d75a77b69052e-4b5f84273c3mr133403311cf.8.1757582950162;
        Thu, 11 Sep 2025 02:29:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTV0m4toGz7+xbdgA/U5Fea5/H2PZYRmfWsOyBhCLZpAb0p8/1CkRX4GCGdlGibx5cQEGPZg==
X-Received: by 2002:ac8:574d:0:b0:4b5:e4dc:1eee with SMTP id d75a77b69052e-4b5f84273c3mr133403121cf.8.1757582949666;
        Thu, 11 Sep 2025 02:29:09 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3128506sm92707466b.28.2025.09.11.02.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:29:09 -0700 (PDT)
Message-ID: <90526e2f-17d4-4a37-80fa-60e08440d67c@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 11:29:07 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] clk: qcom: camcc-sm8450: Specify Titan GDSC power
 domain as a parent to IPE/BPS/SBI
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
 <20250911011218.861322-7-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-7-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -a7TW9S_DyypYgXocL5jBFdhHAgaFJFT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX5xImEsnzF8k1
 Ky5OoYc1tw+pjuO29FbkFyzR/aktoji9vF68VY9qXNI955MvlkFlRKKgfrYshZrQPlynbcDCjdo
 F7yXOau+IenCXZo5AbplIkjCK4lpjmFT/bJ6FzbKhHgrxvqKhI9m266qy1jsxk9u2TGV8R2jib4
 N3Wfh0ZFdqkM125I/2m14OGK2NEwloc0qElK8+Gv7zXPSVgV89EUhQnXecOrBFUWJNAE6i7sPIl
 QU0xktvqM7RGmwEzmnlrahcXZ01em2Ic1lGbTn5VzlIxjE5qq/MrAmE7udiObqUjf587LNq723Y
 E36fFGuPBoIw6j9Ib359Afqb+MemVoS+6n8TAK4jumBD8mTgOajnhKDiRVhiYHk1w005uq58yFS
 y7n/hLMW
X-Proofpoint-GUID: -a7TW9S_DyypYgXocL5jBFdhHAgaFJFT
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c29667 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=LDDDIuMr0XRAt-0CmwQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

On 9/11/25 3:12 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SD8450 camera clock controller, and it should include
> IPE, BPS and SBI ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
