Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A182628D
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 08:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632127; cv=none; b=huqd/CjlpCeBko1W1PuKBCwSVIVVz9A3LPNKE2KnvFm8OTGQl/N8Lp4tdqiyr38dcmuJi4XYMeuM7j6vkemp4CHjDuGIHqCnL4fSD4qdFK7DppAkn/8isiGQDe/IGttiP9BypTOGXKBDvvOl4ZH/Y/qkaPEgdo4+Wa4K8Nfl3Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632127; c=relaxed/simple;
	bh=O4McYQ43yAF3+S0C1n7WeGagveQomJ7h/JOsE63xDK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PYUCXH038U1wTyCB8SHsHuCYhP/EKbYTvtJdt7h1TYkKi7lQi//rlo+rbJoKr2YNQcDmPxjD4T8OalrFT/7UH2wZ+hdqN4UHzIUw0AcRCX9nAt/laB3ionIw7s6N1SAZ4s2k+DflY2LQ8JLBBQV1E4Q2JGtLCE3XmYtNaCrDa+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sjj0mTgV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kY+cbo8n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sjj0mTgV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kY+cbo8n"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60t1h901860
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 08:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Z1Yk65M75ZMuhaO9XZ5nn/CYe56pjK6jrBHgZjNvt8=; b=Sjj0mTgVD9gTeH6F
	ga1mpK+Kwjpovj4ssnHA6scntUHLa829nowjeQNApH6QgZlrv1e6AM+hnw4Tf0vu
	29gJza8PBqOidjg4BR141JtuT/oHAiE+Z1H0En1Mo5WUCRgXxTawhGggmTQOVTl8
	OlRMwGxMqfOY3qNWjoTvSScpUZuWshS5/O474GZGPclFJ87wwhbmynJ6W8BjJODJ
	ypzajH4Z/+JUVIilW19dN4ezdlHvTAlkqQJ5+ej6jjQwhY4VJFxnZtRiHuBy9n5t
	Phm0oLUkVTknCNs+IuF8mcX+J1ejcmJ3I0cKTjSseDKSVR7uWFYUxy9O7Aqe/Oe/
	MHkafw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d39qr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 08:02:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9106a836457so1228126d6.1
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 01:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789632125; x=1790236925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Z1Yk65M75ZMuhaO9XZ5nn/CYe56pjK6jrBHgZjNvt8=;
        b=kY+cbo8n98e0VSK22JY2TThPrZa4Vx4xCYLv1aHamEy4bmORZ0Wz4fQHcG5v+P+o16
         zIOBahGscfw+z6nyh44z8k8M3/AQDkO5xA6ZUhoem/tXXi2jV80bGCG5W1PBoA3vXWu3
         8XAl1xJMABNGFuHgTpDdo/Ab1+mKns6Yl6QvbOcMpX16Yx1gFFn/D2KZ1xKPZcCHh/0+
         UBXo6OYJqAvi7mitv/CNqC/6Wd/XIwBJj3CdiO6pxIp5TZsoZZUhItyRonzKTwS6nx1C
         pi6SgkoeQdzj5CvywSINAQ87rbHCwsyMSeTUFfPCXkbUnym0S9mJw//scmRRnqCZvxLh
         CG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632125; x=1790236925;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Z1Yk65M75ZMuhaO9XZ5nn/CYe56pjK6jrBHgZjNvt8=;
        b=wHF/tDaY8GtB4w5ebOMP47mMqOuueHTbIPUZcAFDN3MXH38Fy1jHYB1nYRwPvluO1z
         A1JepaLSxj+tSqmR/sAi//XzaRw0/7Fx3rs7aVqSWOTw/jo6xGfe/+CQ9pyLsLo4Sq8U
         upbjnoQazR/lHFYm8/0tX1B1SRZ4kEL0Zhw9S5ktNNdWGCSdJMfSGg5ZKCwlKUUylhaf
         M44CWTnoZoH9Ti2oSYuwCb98e0d5sP6S7/Y2WiXxwo2dtxesrg1+FpqAQv/rlDZB3+Ix
         hRkXrEjPN5PBhIO+GvT5A/bzS7hrzEAD9RUQDlbtGIz+CjERXAJeiiKjuLaACaONHxY2
         xp3w==
X-Forwarded-Encrypted: i=1; AKwUvByMLsG+0iXXaQ6QZV3uqmwt7cc7O4dVIrTCKBKSxO9ns5TTXVpx2tkp9PAv5wDjbJO3X4+NKDpJ/xA=@vger.kernel.org
X-Gm-Message-State: AFuF++lM7Q3A9fKxdWNoSkRguzLHaxLXGXmTeacnflZ7jSVQh2YXj+xv
	QBe25E++RNMUSyJzoGcmLS7vDHIStUMO5l1ixl8L7BpBEPBxDww0d0YXa2c74PccUb0cgK66aUC
	H1j7Cc4D9TBiJhLami02n/VkkvCBppl03eBvxE5GtuobDiCZKn+UFyeMA19/7pOs=
X-Gm-Gg: AYBFou1j13ivCyE6JhfbqHhstssdzke1Cp/HnwESQqXNfCddmNhMmYqYiI63HadDi1G
	WT5IFyuDRQB1AobosFxPxbu7wto+8fylLgZwPxRKYRkCJcrshs2kec0LlUiHnml3d2S9ajVLIQ3
	VgCpf1jwqvDlWaux6DkYmpNuOkfLc7FvokZ7gvZHtrQY9WH/gQB8fKdnEnO1w5renpjprKJRSnB
	T/jOSmNy+EaGM9PlHv5+d8oG5Ph1LKwmCP3EtTobDTJCFg3St8GaguW3Dm+0Pyt4bdAXbUEcpJ3
	TyupYgR2vR+lF9Vs8BZQGjtoPvN7lJBn6eqp74+lDtaJD+9XIK1/SzBsIN8zTgemg24mAxZtKYU
	o6QZezpeewLv/QxeNQXhpeQ==
X-Received: by 2002:a05:620a:4408:b0:93a:19cc:107a with SMTP id af79cd13be357-93bb7635c63mr857708685a.1.1789632124789;
        Thu, 17 Sep 2026 01:02:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:93a:19cc:107a with SMTP id af79cd13be357-93bb7635c63mr857704285a.1.1789632124372;
        Thu, 17 Sep 2026 01:02:04 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57c3c34sm1578796e87.17.2026.09.17.01.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 01:02:03 -0700 (PDT)
Message-ID: <8ef3b02d-b682-4eac-b129-df341b230449@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:02:00 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: mmcc-sdm660: Fix MDSS AHB clock HWCG register
 offset
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-mmcc-sdm660-fix-mdss-ahb-hwcg-offset-v1-1-30dcf09d907c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-mmcc-sdm660-fix-mdss-ahb-hwcg-offset-v1-1-30dcf09d907c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -Yd5oCM3cDVo6qj6lOxMxDMHu8jWN4eN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEwOCBTYWx0ZWRfX32/dlA1Az3yE
 8vvi8R2S76zfWen1a/XMrlZQAMDBgYzxgD/hEy2Y22I9dh4+BY2XdKFTE4MDyTIhebIdoIVDEjk
 fLhnzih+KZo8jmSVTlNsB4naI5WRUhc=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aab9e7d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VxEonCoOErEEB63zS2MA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: -Yd5oCM3cDVo6qj6lOxMxDMHu8jWN4eN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEwOCBTYWx0ZWRfX59cuJ5fqJuV2
 iY4JeNjy0WwXWPkX1nCuehAhIo2XzX7B5wSHV5pblPknCi48msy/bKrQZDNGaD3Qn0xdKzYHYcq
 3YmJ1KgphHHFQbCcDIS5+GYTl/p+4OAD++ffhDwmJpqJfBifCitQv1Nhpsj8sG6vfTvrQkZU1uK
 DUF3DkIrYTpzh84yGu7oc7OmUN00H99/km4IjbQUm6RBRX/oV/hmJw5VWrawqz4S8kxqEXl/eqb
 XeUyWEKGWJOcQ7frn96m8Vg+unDKClB7uHkMQ7AibE1CRzN/4ubARtRbQL2vuV6oVmB6ShJPQs2
 7W8AQNoa90p4vddjgubP770LmHz4jsK33kYs0I9irctBvk30pEQRIZo4i+GNxkBbq8T65vRirU3
 Zk+LFUq/9Bu86YRFczE9c3XbwfEenJL43nUnGzcvl3mwfmqFJ5fpHJkn8gzRaytpFzLPyir6GgP
 5QBsxdRAEj+MSVLO8ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170108

On 9/16/26 1:55 PM, Abel Vesa wrote:
> The MDSS AHB clock HWCG bit resides in the same register as the branch
> enable and halt status bits, at offset 0x2308. The current HWCG register
> offset of 0x8a004 exceeds the regmap maximum of 0x40000, so regmap rejects
> the read in clk_branch_in_hwcg_mode(). Since the read error is ignored,
> the helper uses an uninitialized value to decide whether to skip the
> halt status check.
> 
> Correct the HWCG register offset so the helper reads the actual hardware
> clock gating state.
> 
> Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
