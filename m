Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0258034D3BF
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 10:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398791; cv=none; b=oxN9Rz2FvVmd1AQzCW/RK6qp6GxwRWbeX1V7WeP9kY/kjWyIaUMhJ8NsuhBK7Fxzn/RK7FtPvBYfaytUv0hjtGeMqmIk9NtfXo/LdXyAYQGAna9XlCtUTLMhrxbc+9+PuPOIFgD4qux/s9W6we5xbd4gEteOfqfgOSiZhu8sQAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398791; c=relaxed/simple;
	bh=Q4wE2D/Z/Ep+mMePquJMAr1ovxZ6c+4Ub9tu0h8wEuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n163D2EM+EngtJc8FrWWCQPtf1upYbSVJ7iTH4f/awHENEmeYGSDiNEexVdf9t7AJ532QRnbEpKJYXgcS4408rivQ/k+xAyH5pEyFG3pRb4PkespcoOMWqVFuHHCtDsutnyY9dw1G3+tF4u7NRclQzfhXfc5NGOyizuH5njoh00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SzYYXxiZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LIUM9p76; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SzYYXxiZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LIUM9p76"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7iLve2262548
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 10:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ga5XM4ig7X1yij/1NcuFJ+hcBYWphbWpSNqJbDsqXGE=; b=SzYYXxiZIfSySzdo
	hYGezxV9hYbNIAguWpSnB/Rkhl2t3OOYckliZjWVmBih7KP3RDcoSlRDLc5AVAvU
	fPNn3iqi0jgKQmgHZEybPnIpiBw4ECB43LqZBCorAXSwA1FWdY///Lpm1uC3dUA4
	kazSeUZZ+FwdzWu9MvXN1hhYAkha5tsQOM1i7R6QxPL0w1jwCf8IjhXBAizOVPwm
	BPrszsVP6ANfIYulME7SjMko/J89oCDbCeJMoFI6Q46TTfI8Ap/ad/KPnG23uym5
	Px6cVdjntvhc3FQb1awzOXUIMA+zfJwxmSHFZxAa7UpJHmDRuF4NGuBY84EtRS1X
	bHvu6w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4rn50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 10:46:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd8198fe16so128659085a.2
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 03:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773398788; x=1774003588; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ga5XM4ig7X1yij/1NcuFJ+hcBYWphbWpSNqJbDsqXGE=;
        b=LIUM9p766ImOhc/GYMzyiAIj7oHMQ/LfolPK4el6LLwBo6gXton2m2kSrZ4zPaAWqa
         35itTPfvRBGwN0lML1tsvuo04xWatwOqOu+S1qv3/XJx5u1sxGudhzhx5DUWmNTXM81b
         VkEmRKWiSStG2aYEx/sBQOiuA7TIidZgG3pJ0Fu2YTQLpfdVYnh3/XNvoZ5BUg6vwTnf
         ZQWoq3ELg+OJ9942Y4qMQ/+9PubfMyuESYwvFqy+BaNZ+K4kAvkxU9pmbOehECQuGxOR
         6EaJPP+qKZ3loG3ZsiDZd/jsbK5SyQ+NdpXHwbQQcr+nTy4noApSvcuLw9yz0EEc73a1
         HnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398788; x=1774003588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ga5XM4ig7X1yij/1NcuFJ+hcBYWphbWpSNqJbDsqXGE=;
        b=C43i5vc2DXquX+iKeb/T9HC/4a85jZPAqjFI1lOcHwaTxSGlwOZX81Y4GUDRE87KQb
         MJeeqwQR84q6d0qvEKzQW/7m09NEHWA5qX3Zfe77shMnD3Yt+BCn7te3VVVAPcZPgRXR
         565dphNWSHLxWA6/lAct2xqpzT8W1YcUHh1VoHM5WDZntZAxDxwpIZ6mdmnBRaqMCxV+
         xpGmTPYSfE7gL0Z9c9cKidqJw/fTp/oXtRkQCI4mhquMqCKoEDu0zSoUspWjk+Nm1Ana
         GaNiYHxMaTWmWOjNUMhhJeWZPi0WEmEv9tQC/ahFR4JlmXpe2sN86u+UyYOVx8Ziqh+J
         db5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWc2x/A6DAHUB87PWrywP3XnrhsIBGDx3coHf/xj1Jc78PEq0RXfuxQkKI0vKLjeY5wUHWE+KVrRqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNJCSL6fdIOpzLuhtEb8RIuH29q9OWpUusE8p3gy1VkvOj77Xf
	xtsSGWr2jZyvWXPIq7LEzpjxTUFKwzjmTGu0EjJYwsqs6k5o9E9mIjq4cvoBXNyTJEjuruUAlA9
	Hr5rvRPgeIoDa91R1Fd5LFwaFHmLs8ezBnrRbI2gmCRLivbtAWCIm+ZJJxWXB9DI=
X-Gm-Gg: ATEYQzxO061RKrKlfHAyFOrDWGHjRy/f9pbaseRwKOoBQZL2d4zy5G0RiJf0ugiYVhP
	Z2UPgO3ReWdGhLa8dOc73dE8WsP/RSDhg+KclF8A07zEdqSV/chZziFVp+u56z2PTPCtbhGFrRa
	eAjUObNqdVhKc7HDYFuijZPhbRl4ZljbDU4RRtnxVfSnhWxtVxjR/8wIVLcZcYMti9vCI/S+AkV
	i3OqGN3RamfNAR5E66W+ClsDTi+cHK+4YPDmN+3m7ZgTgV7H42f8gISCz9b5GNvJV/4EL7fxvs0
	kOYBtGvDx+0KVnS0Ttv9wpKs3Kqf6AdccffcBTBLrbDoAoHX0p2hReLzTufFW+w44ALVM2KcHgI
	IXAbMHDie/NHkPP56ypLK30B92y+wqWDQdqzkGlx7RXwt77h5CZgK3EHY8uyyaRYSzejA3QTfUn
	u4EvE=
X-Received: by 2002:a05:620a:8e17:b0:8cd:b6e4:81df with SMTP id af79cd13be357-8cdb6e48634mr163544285a.6.1773398788316;
        Fri, 13 Mar 2026 03:46:28 -0700 (PDT)
X-Received: by 2002:a05:620a:8e17:b0:8cd:b6e4:81df with SMTP id af79cd13be357-8cdb6e48634mr163541285a.6.1773398787898;
        Fri, 13 Mar 2026 03:46:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66350b85f3bsm1144968a12.25.2026.03.13.03.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:46:26 -0700 (PDT)
Message-ID: <189c2ce9-cec4-4bf2-bab1-9e05b9fccfdf@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:46:23 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] clk: qcom: camcc-sc8180x: Refactor to use
 qcom_cc_driver_data
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-12-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312112321.370983-12-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0IIdr77Jvesuxzl7920rBnipLlT251AZ
X-Proofpoint-GUID: 0IIdr77Jvesuxzl7920rBnipLlT251AZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4NCBTYWx0ZWRfXz01g1e0aS+3R
 FvPW5ctFVnScz8Mz/thZWSc8Wi+A7jnc1ONQhxmgXrnBW1imvSSjWR7bWBsr7Dv70tTJOCca5aw
 KR1dll/XsFR3lrJSjHNmR9g28HMAVuYwJrOm64M4ugg95LaKUprRFS7VHVFnCsPGCOb5gKQQ7ZS
 9Lb0mKC1g/lGogjNgbW5fYCNHuGRORCa7ICwBxmZN5u8Rh45g9tyXFb9schW5Lr2TBYmhTeZABK
 YftpCBOWAXtg+to25Yv8tHGdckq2nYL2tg0BvaMbWgtdQT4HroqUwxE31etzj4ghT3lvL3YmFSw
 TiV0c0Onu3KGmbppLMfQdw8beXuhG77sN/U+VSkm8k9kEM1dj+fCDMwFzILSD9Sxtf2DbN03XhZ
 nZD7QDtQmI+2LxAByf0+EqbWoT/QMexJOmHvLq+b3pb9yHcKzldXdQiXszFh7cQuBSBJE+vxio+
 0rrSwvNidMuNAl1/w1Q==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b3eb05 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ma-uBWqLQOsuroI5m_MA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130084

On 3/12/26 12:12 PM, Val Packett wrote:
> Use a qcom_cc_driver_data struct instead of a long custom probe
> callback to align with modern qcom/gcc-*.c style.
> 
> No functional change intended.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
