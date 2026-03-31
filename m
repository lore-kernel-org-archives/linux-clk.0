Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05302BE7BA
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774949444; cv=none; b=tq9SIXgfWWP8IiYCITgB04Vm6iI2Aj97DMRbdTIPqzi1ze896aqF49cJL7vh84cgg5n8Tgliqr9BdHDXGQSwa2KF+zoJtVTJLZQ/I4/bJnwL6alRgkwFtLzP37Yr903cNLjHl6D/ViyDXIx2u9NZWKj4xu1bgEVICKKvDJzFhaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774949444; c=relaxed/simple;
	bh=8M9y2N30To5Lr2+deWpaIvEJet4IUlwh5IdXUd7GB+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KMlocBEbW4CZvFzrmbXvJRr8HkurpDtuZeKKS7FYzW5B7nu/Wz1e9faE4PrWnMu/GxHLmAR1B0UqfbyKbGJCcPO9tWl2oOo1ysAHpDAek/oVpBiKVNDHZdH6rQ70KTFgcOuxP15wA+A6nSE5dKLyZ/bRRkVecSsnL2DxNnUVmsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cqJ+blb3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ftKnBqdU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cqJ+blb3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ftKnBqdU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5QZcP2410022
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l6hIJt4vRVNIKdR1Ny7pJjCMEd9wk7RkRYpFUUYnL2I=; b=cqJ+blb3ibXuyvwb
	bnVhFyNPDY32amR96u8G41Thf73MTJky0wZkq8LM0g+bRxpjoGd7RS9QPvrHl0/E
	xXl8Tn44KZxUedGitkXlZ9uO/E/0DeMbcKRmdkv8Sp+Aa/CCycqgKDkYRThxoFZE
	7CI70ZrXZjyux25UAaklKENh7/tEyS6AzQ1zt+VcFpxva+LODCQ+BeSlEA+D2G6m
	HVpEI/2dk8wRYBErmBlNv4X/CE/jklK43YFBfYuFdUYy2TdU3Mp76/fTKjpPXbj9
	LPZGus2sbRKmOnl82pVnqswI8c73N1ExPP6v/8tTX0zvIwWqu4kjZLSgHgMZO+Kl
	fx9g2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80hetdwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:30:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfc0719a1bso114348185a.1
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 02:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774949441; x=1775554241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l6hIJt4vRVNIKdR1Ny7pJjCMEd9wk7RkRYpFUUYnL2I=;
        b=ftKnBqdUvxnFo4nOMPoc9GOqhPJPCn7XMI+JYvy53bcwSt+n2xI8H0tY/U3h7KeH5i
         0Xv5guPMzVq3Rfr4l8aQ67G4ZDpHEH5rDCGO+/rXfXzWxw/KMA8nH+lFJP9OKg1puMif
         SDVgIH2Yl+jGE/dtCWm/a+stAO2IBRNCULn6pQxz0J633oujFoVbuerHVGyZr+lYoQ04
         xOpnBqZQQ4DxmOYSluRJNqHdsiqBwpyFuW4dnyy48MFb5tuVcMbZh+WEegpMpEi1RuPa
         ssptQF0bILflWtkN3GhcruPaHyWpSmhe7uh0wqQei2tT9dmxWde925g+nQ6pe1HSZFyH
         Pb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774949441; x=1775554241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6hIJt4vRVNIKdR1Ny7pJjCMEd9wk7RkRYpFUUYnL2I=;
        b=gWcdO8IMdK6KZPn7oWtClHuUwprs9e9txvOCC1OVJArhy/OdnjErQl7WFha5QqYxNB
         os/CiCBRrJ0LEsMobcvkxrZvKdDiIGvdlvXCei//3KmOgMQQ+GUKYgYMy4z85j+Eoqcg
         aqP4oY5TjPlknZl6dUlQNL2NWa2EITwzSZ4TcnHS36+pmrzwEsp8O6BRr1wpWfJYOPqd
         /QapP8y7ROC/Mb5onF1+YJhVesxTdWblUmc8tFneUM00TcSzRNeaVAh5ZvPaSeUG00l+
         2iNR9gu2q5tlJB/XkDHz7ArlMaTBS4eeRFny7XF0wW0lb2YGpWXCxM5biM7WzUeK+zUE
         TBLg==
X-Forwarded-Encrypted: i=1; AJvYcCV+tBMJTvDy3ljCMg43+MWndyJ/SpjyiTTC3/LlrE9bKryFcoUCMyfAF1SFdsYUOJ7ADDx78lM8LFw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXc/KXCmpvO/MRDVUGWHhcpNU6p+0iPkROxI4f5CxsNO6xaDJz
	0dfXk5lKkx5qnSylqbXqCa5MGRZ8APGYUd9innClnWTdsy6wW0bfKO0xZbPO7QU9xTMqsaRRBiq
	tw7CrFECLWAPLewAck2FtXCKXn1/c2zyeb7rrPPt5bJvq8hGQbv6y8tXcRZsGxiY=
X-Gm-Gg: ATEYQzxmmMcKZe/zKgCPPurzJMoZDp2VbFLMQc/4A+6HzjumQv7/gmEl0/qA5Rys/OU
	t6jXWm1i3DfCxYpBwDChebLAxS3sr2IPUSrDrZViocqARs3TrXKvqoXM2tJ420tHwQ8TOMv1Y23
	pWhpx6hWya2TAhLIgSMQ1Zg8Dqf5PgWdC3kYzV4L6cwgAts+zEdWjrxd8tM0FAAcSR/1OlfgT00
	zSY2H/Io4Y1O/ZorzxmxwsSbtu+cGJWLRSV8jYvk49p08uk/DyyQVzEv6tjTFN8s6h4gKb7Zv83
	gia1PifmuuzXrTLhVsB17n9vLG7XUL+oXntftPJl+JGYz8Ak+OlAsosYvJjn1UTX3d9gEXC8W6M
	a0X019fC2TNKlIEBEM1kZWsgm003l3TOLf9QGajGWTMzjWPhw7CnoKiiMj2gX63ftpm0BM/NJsA
	sMYmM=
X-Received: by 2002:a05:620a:4491:b0:8cf:db7b:6229 with SMTP id af79cd13be357-8d01c7e3733mr1459685385a.7.1774949441165;
        Tue, 31 Mar 2026 02:30:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4491:b0:8cf:db7b:6229 with SMTP id af79cd13be357-8d01c7e3733mr1459682985a.7.1774949440675;
        Tue, 31 Mar 2026 02:30:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b72963f48sm3445325a12.7.2026.03.31.02.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:30:39 -0700 (PDT)
Message-ID: <0055915e-4ac0-442a-adff-a2c854cce474@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 11:30:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] clk: qcom: rpmh: Add support for Hawi RPMH clocks
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-4-c2a663e1d35b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-4-c2a663e1d35b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gb0aXAXL c=1 sm=1 tr=0 ts=69cb9441 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VI5jTiJbDvfuYzbrj9AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: nZ4ddk2-q_Nt55S99AeUjyuX0Brse_Yp
X-Proofpoint-ORIG-GUID: nZ4ddk2-q_Nt55S99AeUjyuX0Brse_Yp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5MSBTYWx0ZWRfX1TA+wASW3wkS
 drO2uliXNxM3hmupsaBFNPs9VAzbG9N8duhFXgVRxHsf4KxOkPlHw4ucRuu1De1eQYaY6+sLG0t
 roWKoq3dtYVpGytA3me7pTDg4nSuBeb9YBNjUZ8HndEbIFwLJcd/RqJq06FaM5nhCa7ztNi/zEi
 ol2cXcduO3ZvYN0BEmH6Y2VLkF+I+EbmAqwSsxPeHmCH9RCCRN7cwPbWWoIpPavpXFAY7GFHavM
 qeZdGdegCw9awW03nS9Mi1fZSb/g1itLm60gMw5DMEBIgquXVSi5JRWapmFDqXCpglDJfPGZT/c
 Y7pH+ESYjCHOayqmqGwrkOg/0U8uDSfddZUrz8TL3Nc2DkzCvkbzpgfDMHFPbTReRHZ0Atqwy61
 O2s1DuUpbcJcJNLCN7/1vp9WTezrtnDuVK+NJD79tnja4+QyhCIMbx4VskOdJV+ITxOm+8Nd+wH
 nlhkZH6fG8VPG0kSkLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310091

On 3/31/26 2:34 AM, Vivek Aknurwar wrote:
> Add RPMH clocks present in Hawi the SoC.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
