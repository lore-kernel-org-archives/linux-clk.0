Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CFA3559DD
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 11:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768216423; cv=none; b=Ni1Af5Qxi+pwJSWr8ZKGqmyAil609FnuNkahlSprihY/nq6e3h3xHTWkQmbq/HpyznNNjejJYOsAyBjITi3nA2mihd/qvF3473wXDWI4cOwWm1v03nDPX66l2ZN7NQP4C2+KIkVMTQbh0IOADgtIVfNkBQQ2aCDN8obkn/j4MAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768216423; c=relaxed/simple;
	bh=IGHRrX8DW1rlODPmXhrgcnaT/Ed/upUX6PHNB2rA8wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FFs6DBEwpnnxEmoRJFQWc6nTrc8aUh50d6VPK8yFvYkGIE7Cbb66n9Ri9Gi2XEHldupTsOH0tUfXezy7yAoEfYJd3IHZnYIsz8KMNnXnD5gYBeO8H7WIRQfS/4B0Ags+iU4LmoRVf510lyDHKYZ1PDUvX4c3t+4dswgAfU91CWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zs9Q0Gx4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AyLip8Ky; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zs9Q0Gx4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AyLip8Ky"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8vWTq113520
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 11:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hGfsPVvvhh7LOlXfOlIDcnSnJVDnYtJjxSxs14patX8=; b=Zs9Q0Gx43hQzVPST
	wQ0Or3nfzR9h53wQLccmQpCnicT+Ddipc/dqcC/2MmAvgzmV7xWvzK67oQcP1b2U
	Aphv+OFFG6w/oY7XftuOvSCtyAp93HtddQLTumikZGvlyyouDbLz437aN9Jo8ooP
	UyyY1iSxyWlSe13YhTweoMEzyyEQ9RWoogDWfAWeDdfxiPspsqIYs0qP7D5nP8GY
	6TQ/zTpcPwZDCb5NmObSB0x1YTG1wdNbAJCXphD023tWl+fStet+2jSczb6T3w91
	8r9Rvr1QyC8oc6dVS19obRsUu1A5Z9Rk4F6XXe83SLTkoz6qSXSnm+KW1BdpQ7F9
	1dne6g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4uhghf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 11:13:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ffb8ac2cebso10749401cf.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 03:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768216419; x=1768821219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hGfsPVvvhh7LOlXfOlIDcnSnJVDnYtJjxSxs14patX8=;
        b=AyLip8KysBU9Pd7dLwj6OmICzNOXyv+tSTeS0lPnh0zaCyrA8514eVQQuzyJviz/Zc
         Xdn5nZfq8+3OEpIGqGdlSRaZE49JQEmb00CocEcpr8xkJjuETFWt8HuuEE2cSq4Skep9
         A3UWWQLMp7TIzN9IpoTtl9i7AcZApuPhMfossr/Q5ew+CmAM1kmt2lYBgIqQt//TnPMb
         WmPumA+6CyDIZZjD+sc7HVy1vRKpfxkEcJl2gbLC8mUfWO5lK7ZIl37DNRO6ggQqkGp4
         WiOtkH0bDi2EW9CTwSfEfq1tuiD5Jo1csG4YRMZCFv10DHH5I1LsClhZ4ta/rTtgq+Bd
         yIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216419; x=1768821219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGfsPVvvhh7LOlXfOlIDcnSnJVDnYtJjxSxs14patX8=;
        b=Wx8ouQOXwpap9dK4VyJZWGwgzBM25tX9xxq4gXpPif8ANS0ZqRCFU1u2gzuqFQph8l
         k1E65DOEWXFrzYKzuuXc2wbNR8q8MS7GwnFYlRst30CShM6y5+G7xiQD0rLDqjS3QMwv
         IvUwn6lLnPBpBHDjTBwbYa+yLdKNoygHkCVWKpLspEcDHh3V3iFiTdt5x8pvkroBzo/x
         zhpL+dIo1BGcFQ9hhlcMrT/hVzea1JF5vtV3zxgN3GiL3aTSLpSs842g8Xry4RC5GmbF
         0EEc/BgKCqp4JdfzVO3po7JwFEzkTQLvCJtRb1CGpM0Q6MvGc8kCY4mHSazrigEwnr/b
         2pqA==
X-Forwarded-Encrypted: i=1; AJvYcCWHLCfNwU+HKyA23kTJVGQaFRCw/y1OB2hZJKq7CrfYBRbFLBEqfxOYuRMviX2CrsJNuubTlVmNIUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaeKOJr+H+67VqLY7HWFGMmDJt8FSj433YHssZeQ3bekclBtAf
	xIsQDvtxrPXcIR9wW0sqZ3Rw5aSYrpVZapatR4QJtP47+UR0sjuRDEGbGn/GbQ2ISnmcintKw4C
	JubjDUqupR8zFRNwU5EHaB0U14YZoo0eonxS9JSJLBN4SFQ7k2HTnbfe2QPCcJV4=
X-Gm-Gg: AY/fxX5fgUv9PmU40+dH2Df+zxQGwzCa1aaPFD11geapJVjJ+KvR+CUhoLLJCIDgArX
	CpN3y4JWy8Ins7hTOAZwX4PIuRq/wENyUuSCgPlX/tlnK3JrSnF2C3C5D1mrRS3tqhOU14xLF/Y
	O9iUdfVPLsD09elE0DqfSBj2ExIK92B4OddoKIF8X5wUueQ6jML7/1u2NlFJBLD5DDW6aIoKD/P
	9za8x6yV6SXUYwwypvHOFGOVuOruT+wmt+fMW4XXHA4D74bARY6eZRYzOwAZBBwyMIb8EcaPHKI
	ukJNapRZFOAMzp5M+hRM5+Mps3NnjSdt1ghWQnaDS2acH1vp24L2KV0rGswSm4PCYFkZoq6UfMJ
	u/+sphFl4k5oWChLgPdl9Dqa0s3fDhfjIeJY6zaz9NdO0kg91oy8J0bS+LNOcGqIWfjk=
X-Received: by 2002:a05:622a:1890:b0:4ec:eec8:e9cb with SMTP id d75a77b69052e-4ffb49f6842mr188523411cf.7.1768216418927;
        Mon, 12 Jan 2026 03:13:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9XmynZpwldVTRCqPhkNbOHliThh9mauWAEO1byKEo0sIHT3QslJYL7Iego1JEJG8IF9M62g==
X-Received: by 2002:a05:622a:1890:b0:4ec:eec8:e9cb with SMTP id d75a77b69052e-4ffb49f6842mr188523191cf.7.1768216418480;
        Mon, 12 Jan 2026 03:13:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be658b3sm17106912a12.18.2026.01.12.03.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:13:38 -0800 (PST)
Message-ID: <62303d85-97ad-439d-bff5-ce113b7d29b0@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:13:36 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: dispcc-glymur: use RCG2 ops for DPTX1 AUX
 clock source
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260112-dp-aux-clks-v1-0-456b0c11b069@oss.qualcomm.com>
 <20260112-dp-aux-clks-v1-1-456b0c11b069@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112-dp-aux-clks-v1-1-456b0c11b069@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OSBTYWx0ZWRfX/C3swXBzg7zG
 lqBOTqIVvbk0ZtyejTA/c8RtEUsSoRaUvngys+Lxk9RibRHkFhkW4dfQBEMfEFQP6V7WF2evV0J
 M12H9OyfPomK6uiOtIPUmC04dnRINp9Cw0Q6aXDs8xzfwmDLuohlujqjT0AUq/kHXabCeMnvDHF
 gq2bC2hAN6/S8QEUH1xw7Gqqy15jbZmX09J+QKBG7BkCWL8/HNSRDQvsCGGkeXyhTsOctnPqGyX
 UGQSVHoJiGuVk/ccu5B/uz8hpcF8vBXAdwCISuPKJkIxwLYAcjadB59BdFwejlQMcsv4rNSxK5G
 e/PWL9e8TS782sVGDGrCoB68HXTtw29+aBfQ/62sxFMUZJ4ypMW3PZgRqN5B5z5Q7phqmFV5pTJ
 SlF+bU/9Lj8kwwLFpPfHHno2mMa9A5NuDF4d/oH29HaHCN44mSquZb9eTqTVF5wIcfgSnPH2So8
 SSy27CX8j+WBsHs+7eg==
X-Proofpoint-ORIG-GUID: p1bk4skKIQBN4FvE3O6GPg9NLs6uUJku
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=6964d763 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UIqvOZ8aP2BlQGmZcB0A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: p1bk4skKIQBN4FvE3O6GPg9NLs6uUJku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120089

On 1/12/26 3:12 AM, Dmitry Baryshkov wrote:
> The clk_dp_ops are supposed to be used for DP-related clocks with a
> proper MND divier. Use shared RCG2 ops for dptx1_aux_clk_src, the same
> as all other DPTX AUX clocks in this driver.
> 
> Fixes: b4d15211c408 ("clk: qcom: dispcc-glymur: Add support for Display Clock Controller")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

