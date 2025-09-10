Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C4D320A29
	for <linux-clk@vger.kernel.org>; Wed, 10 Sep 2025 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512640; cv=none; b=LD4d353HPRoiDHuNQMTIq6PZfzCqjje1f3SgjppkEPpsq5C6KrL1Zt8rCJGqnjjT5fLC8csi9vl6LqpVmninob88gx7w+HY76mdh7qXGAoriXs8YaTzf4ECvYnqHAB5R4a6xZv9pxZSfnJMb2d0/ZfAmUDuap4decG00Ab4CRQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512640; c=relaxed/simple;
	bh=/wfQDim4ahb6Q6nDJIfOnfdyp76lezfBLoVX/eGVN/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RSpwpk6uQ5C64j3ymffFdvpgzQpg/re/SKo93+UG2HGeCc6cymbFRvQcLcyV2+sdBVOUvI8rlW3LnjfLDBEJC5kKrMYKMvQtlRtO+1kjKxj4jgjAtbhiR1DeVtOPHiN/4tzTymGM8g8xT+cyOGxz3IIm//WrrolqebEs5t508So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a3WoAPP2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a3WoAPP2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgIoB024566
	for <linux-clk@vger.kernel.org>; Wed, 10 Sep 2025 13:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1fJ/7ym1FXsoeacKSkxLjPWBg3p9UzUEwVJxmblp4aA=; b=a3WoAPP2Zo4Nisbx
	ovOxDjIrrUpORZ3g8bUG13XOPuAV2Cn8KtkDRg5PknxvPkgJ8aYOsAS8+41Riwkd
	s1ogfvQgtzGaxpWo/0xMwGZq/cabDK+DOqzFCLqKAXxnMFfkzfRTcEORsr3Pmofw
	6PteGyHzEHwhA465q/9yL7dP1+0o0h2HiSrCWnjsgjTftKC3ilEvB1VVdhG2FV7s
	TrdT71vaiI4d15wSD63aCDhtTKWzKymQudYSmKHfB5TKrVlndQZ91+PHaLcUdHO+
	fl6j0Ud6371/vLoisb+y7ZgCLvAHDEcHlAtTeaRbw1kKOjN9QF7PYIAYEIT5eaqA
	5rUHdw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8m2b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Sep 2025 13:57:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b601ceb41cso16627441cf.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Sep 2025 06:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757512637; x=1758117437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1fJ/7ym1FXsoeacKSkxLjPWBg3p9UzUEwVJxmblp4aA=;
        b=fmRwenYmplyPy8XS7wEb+MH8qWxef9vl7fh8G00pZzyB2cEjHhW4r2NsICmXxIdqmS
         Sw/28Q7Z6kMLgV5aRIt/4AkCCPIKZ9HUaX9RbnMoS0HWdMT3MKK6C5uA4EAQ+pNpSKWP
         E9aUVtUVEMoea4QV+aWqUB6wTAsUBcxr4vv+V0jTCvyoUivpgbMLu5aGbZGRTKLOdKwf
         KtBIwcD3NS1wXeDHDFfcdO8J2IkDdaC51V3gwxSmrBRnOPpkZI3ejAFODz5pNPLWizFq
         fIIt3k7hUjNt5PFvPpKMJ47+Sum5cgiCfEGI/pxSbB4lXvC2mQxm3IL9qffaOB5RPbkQ
         go6g==
X-Forwarded-Encrypted: i=1; AJvYcCVhDKqkgGwDFpsrcvhD5niZMHP/iuKSrrlmS664v5l8fJdoxYf1MdO3cSHI5YFxj/6YaNawq8sY7zg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdZTGyLhsrMh0AgRiAdLof64Q42TcXs9B/CR0oq8lUl9aogNmV
	lqFfE40sRg08ZbXoNJYx62bYozpxwhNvGiAh+SSBSR1NiJ7v4yNaZi4j018DJV1kwNqK3/ouymZ
	+s74pYNEpjJxZQ8O2xFV5yvdl0x2kAzdYKGoQ/BDiogXkjTYfBqY/YMkj3Y3/csY=
X-Gm-Gg: ASbGncuNQc7MsidkGWwowGGXws5mnqc1KBRnA5lFALRgXRj+/EBJXenl8o5B8eS+sGj
	1KJUd9D3WwPTWO/8kMcr4CclWdGa5/FYvV5rG3ovElCa2Q0lfofdBn5gIvZMoY7xCamdCSst6Vf
	wRz0cR4hRmLHIOZ42k8lEDy6DUavLwNVgI3HE1pV1dFQhWW4QWSJR+TFSjnjIyrkkVVethI1RK8
	CrmbXdikAYrayh9/Fub91qYe+bPG6stT+buQeVuGv/2H8KllBr2IXwnQ/mC4iUO0ju25bmaTfMo
	GQu/eyKStOamEjk1JVKCQgft6cNgNBXHhsE+Sm2O2RMaCKrgbdacIW05lS/MP8r/1TeFC9BB6TY
	77W5boWTqJnj0JAq0KlrYwQ==
X-Received: by 2002:ac8:5981:0:b0:4b3:4d20:2f9 with SMTP id d75a77b69052e-4b5f83a513fmr119935511cf.4.1757512637383;
        Wed, 10 Sep 2025 06:57:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtPKK5PUQ+h2E5IfRB6yeYQejWcIdFPwadPZHwUcThe6XnDwjitcbDpSw8Cmgn/hL3Cw7upw==
X-Received: by 2002:ac8:5981:0:b0:4b3:4d20:2f9 with SMTP id d75a77b69052e-4b5f83a513fmr119935291cf.4.1757512636836;
        Wed, 10 Sep 2025 06:57:16 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c01bdb952sm3333151a12.52.2025.09.10.06.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 06:57:16 -0700 (PDT)
Message-ID: <10b8b0c3-5c1d-4631-9feb-c83d08d619a3@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 15:57:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-sc8280xp: drop obsolete PCIe GDSC comment
To: Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250910134737.19381-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250910134737.19381-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXzdJhSJ86PwMh
 dDKcL1NQIKLWJeREi4fX/pljdYVpXmQbkVrJ3UKFe991EdXVrqzmYiDYuv6ZBTWzwjmvPe/r+Yi
 SBbGPO4ExShncvF6oU5NM7dYLT7TXtB54sXd7cTcuTOj4bJxgciiSUz2dJRE2kMK2GB9aT3LcXU
 3up0uyUxHOBuoq5syeVixmM3/Z+Vj0646tZasP/h7X+O2pcen+nQuPKVtuyMJmcT2u2M9ShHnaD
 BZ7OP49GVIwaDH4oHvJjD+ddSVfpDXDfLAQvxv2So3+HAmMalkCAIus2u2r4JbspUXCyoMaJIYn
 YFqYmsZdb4QIjAynbfjbmRYc1473pgtwKg79W1h7w6qJQM2a9ilw0P4GNsCzLmB6M6IbZ/AmlWw
 7R3DLpha
X-Proofpoint-ORIG-GUID: LIu0ePGVRbYFuN2Y-luidKr9YmVjHVXB
X-Proofpoint-GUID: LIu0ePGVRbYFuN2Y-luidKr9YmVjHVXB
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c183be cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=nxTl8UUStihZDgUTFOEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On 9/10/25 3:47 PM, Johan Hovold wrote:
> Drop an obsolete comment about keeping the PCIe GDSCs always-on,
> something which is no longer the case since commit db382dd55bcb ("clk:
> qcom: gcc-sc8280xp: Allow PCIe GDSCs to enter retention state").
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

They're not quite off yet, but they're not perma-on either, so I
suppose it makes sense:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
