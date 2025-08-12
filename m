Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6811F37D3
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754988513; cv=none; b=qV5pFF5vCV+9veLX3+YawK0xKgsCpcduz8kZBgSRR9Yrzq8Ow2eDf+Zu7ZvY8M5G6RSTDj3YFYGfCVC7mYkn778vM5X3wnlqlYtTU6nolx7yPACQBZnGoypKMgzINBqf3FwnjyRChIQhWZt27Dli2WHQl4hZrFOdmGZsfWtMwz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754988513; c=relaxed/simple;
	bh=bIaw2FNK0aavrRb6Xybh2kRuBOYiqlu0QUXQh1nDLb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DA7y1wLuDDltVJ1iwtGP59wfX8Vc1jUdDEMSQyoDDNW9tJ2gibUEp7hMXSW8KTr0hIgH3lxa9dO8AEpPlkM5w3N0ilMmG2rMS0IiK3Q0UPebxehwkNMRCaGsNXTfY40rNMn5Hi8cBD9XkU8/gsGjlJEmKrSAUZfILUgEX7ER6Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YLEHxVhM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YLEHxVhM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5G8g2021589
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 08:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3yei4bAWRTPlfjD9mJuCaf7V06gKwYYP2mn0nNjJIEY=; b=YLEHxVhMXGTLrKTB
	6inOCxhPCCG+SwslG+L6YC/DWarJSjoQ3ARSNrHSqqKcvuBuVXbGdY0Fa/w17uQT
	HdkJNrP8nK72Bktbd17izgld1oWf1sBqeF0kgAU2luxubb/nnEAmC3gg7IIinz4n
	rsEIYDoA9QSlOFVI6QkUJ0VVL0+rVu0gqPykJkxR51+Dbia/SbkrkycmHD4J5Q8T
	IT5MywbWbgzHKUZM+rlhbgDYihBrNlqiSyiUZhxCY1nlsylhYMPsS0r590Uz6p5S
	Dk2VKu9bpysH/7OlXpLPUwI9Yu0THLgLdKnAI8zw/y1KUpYlY8eKLSQtlB/CNUkK
	xUEO4g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj47er4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 08:48:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b067cb154eso11859811cf.0
        for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 01:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754988508; x=1755593308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yei4bAWRTPlfjD9mJuCaf7V06gKwYYP2mn0nNjJIEY=;
        b=UrEkfqhyIWdi88q9qWxA4qEUBLi5uDdzPATf/8IA6nhxlbpT3PujHpyPEWv6KbK5cI
         oYp1dOb7Fl+Mi2hIQvLSEdBBCIIA0C08ACA4Bwiyi9BwHnbhP0z+ixyaqFne9RLK0nox
         TEU7cnXI7BlDp188faB6O//ouMKJtwlqQRFKkE6PYVT57cDQy78lWmu5Y5RNSxjFYBAC
         0y/Ss6I/rBAmx6uF54dykRIJKBG/gNz2Qcyr+20BFz2CZ0qlQrUwOCuSDquGHuIAesuV
         0WYFkeV3kk5cpzN0jGoYp/2Xbr74hfTsF/e3h+iR+4w60zFONItd3CnxDrWwwGxJ9Sh4
         D5mA==
X-Forwarded-Encrypted: i=1; AJvYcCXlReYyVhcUyV+6/86YMFTEiaf0fjKwwowuGZNCsBaaB3+aVO2NzzFElhvyVJ8yyRc2FEC6MLpNvOs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7U2w2ko620c1gvH3CvQHTEHAxys3xbNVDu4edMU7Tw+HiJgSp
	HWLHLDIVg0J6os3HON55v9J7lx/2ndoeo322VmxAgyaNwPmkNP2B9vQ1UnNuAuC8Qt3zGiThKtY
	FO5p1DkFReJYhTS8dZ3u5Dw57x/7hcj8IwZExVwHEQW7WHxAPWqhmk2VTCtxYtRc=
X-Gm-Gg: ASbGncu1BB0o1Q25CLxLFx6R0woodZ45kzzG1odRopMR39pBh5LGqSN1aJ6g0Du4fd5
	+tZ/l19/bYdncsMLso3Pxq5diirUCJPvYzAcOSRvD7WwSooOwDD1yv1RM8LH6EyqLX538xVgStj
	h/QEH2TAVaFAntuIBIeCi1m3fjeFHq4NEnMETnwj5jKmz7GDRf+IQKB2tGmgkx197zWkpQXfut5
	YWd1N978ygze/vjK8jxFkfsI3oqljlKKtSwGAxgdjWSfhU17yn+XbSkYTrWdlv8xUINhWKXHtjn
	9hMmiyqP94/saUzECxkWRC7/fdFQaO5F2WKQak92YRVJyXV6so1DTZaRRECRKH/WawpNYlJUORv
	3pgWfmDXLDBg5QFk6OA==
X-Received: by 2002:ac8:7f8f:0:b0:4ae:73dc:3896 with SMTP id d75a77b69052e-4b0f4abde25mr1977271cf.12.1754988508361;
        Tue, 12 Aug 2025 01:48:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG49SlooCoq2QbTSVdsPIBo36eilKODoBGFzeYr2YfN/S4e5IAMokZikrVjfKkfSBp8TpMdyw==
X-Received: by 2002:ac8:7f8f:0:b0:4ae:73dc:3896 with SMTP id d75a77b69052e-4b0f4abde25mr1977031cf.12.1754988507544;
        Tue, 12 Aug 2025 01:48:27 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0753f9sm2178410966b.20.2025.08.12.01.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 01:48:27 -0700 (PDT)
Message-ID: <61a781d3-eb4f-4c56-8873-41c95999630f@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 10:48:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc7280: Add MDSS_CORE reset to mdss
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com>
 <20250811-sc7280-mdss-reset-v1-3-83ceff1d48de@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250811-sc7280-mdss-reset-v1-3-83ceff1d48de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX/DHkjjtoncEf
 NNp3jipI9zjF10fr5LxaZnqQCOFVG7PCPpJUDrt00PWgLS0HQztO9eFSybwPxsihEbaUsrU1Izv
 eCV1LA5ZY9DqaCJKC5Ef+n4K4a82iLI9yEoPNC36WnLUOTFICY5Ky5WUIremiiqnB1hvbb5zBNg
 3U65roeeQoWmZLpu8BigzCBrhDtVNvL/Tp8sy8sjc/bdLsBfmNRMT/ppg0N/N9Wzt1CYeZFyMjk
 MFQDqMyMxSlahJ/bX0iSzV6t4vO0+YW2QOiZLE4dy9v3beLhDT4eHtG2IoM8px9Xwd3yfQcjXns
 jbp9ysAGlRp1xBSgLgGsA/31C/7oILt3SpgEVl4oO69cAdLI2pzCZF+DH4H9Rkk+HionRcmVRzS
 f4nr+j3s
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689affdd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=S_9igCkNjxJcElqm350A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: _HciVty0NBhe0OHVzrgsvW1a7xcpp-BV
X-Proofpoint-GUID: _HciVty0NBhe0OHVzrgsvW1a7xcpp-BV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027

On 8/12/25 5:11 AM, Bjorn Andersson wrote:
> Like on other platforms, if the OS does not support recovering the state
> left by the bootloader it needs access to MDSS_CORE, so that it can
> clear the MDSS configuration.
> 
> Until now it seems no version of the bootloaders have done so, but e.g.
> the Particle Tachyon ships with a bootloader that does leave the display
> in a state that results in a series of iommu faults.
> 
> So let's provide the reset, to allow the OS to clear that state.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
