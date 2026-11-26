Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681338;
	b=bRbQUBymAPOw2GfurmQ/xyysBPYtfdXV57Sf44AoZAMy7sQDJK1rI2RGhxA8j+d7kFjt
	 qHvM4MFB6J4nhT0CQvfqjqv1QedHw0vIkMfvpuYC/l1qdTbZcYI04on3tezU8j+jmPhwf
	 DFrbh8wVoOB/OiN42NL0+zcog26R3jTeye7YLspLr+spTNDsGqXdqbTPVpDa4GKeJ5lNo
	 +0UTLTUsyoEbEgS5lTQzUW/HnfeuZ/4I4nZAg2kAD5ahIeYxOsimveYW+YHl/OZ8hbyP2
	 vTMcXFPHNMvYcpd4JyoQbMiE2zjOog+aYAx+tfkXx/WZQntlM60v81NZK/VaQ4gwegA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681338;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2HrrrNBgzbWtkSpe+9TVW44m0QQJQ8DUHceGh1QnJJM=;
	b=dUkOIAN4sNbQnyP+3PyQH4ksnCoZA+yt0oz04AJ8O6vkI1SXnbOgMBUhvVyLGyIf641R
	 iKzSBLCxMm+zjAenG3I7U2eZyzBB36UQOQ5QPh1ctKTMzYIw6/DJa1YVOA+HowKHdrrdZ
	 jEfaUpnrVrFiTV2lRDR8XSo1te6ShCbhNlS9UXYT+0+df/Lb6NaXUDVtLec+zeT02lfM3
	 N2zPSaVAYd35yDgpVpm07sXi35NafzQl4Osp3F1tboAgMU8OK5MGaMlaUyg8HbjRykJEV
	 gSbGv1rO9tJQCecULjwB7cFCfiFF3KA2PekNzMrYEOqtOFNIQCSnjRNhAjH9Ql2nXAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WIXojQRQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GdoOoLRL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5374A606A688
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 08:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5374A606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WIXojQRQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GdoOoLRL
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BH2m2700727
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 08:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2HrrrNBgzbWtkSpe+9TVW44m0QQJQ8DUHceGh1QnJJM=; b=WIXojQRQ3Y5WGDbj
	QFZG/OOQ2BOqxylQTkThF6nZZN+Eji0XrvxkpwQnHG+2hRcbMzRGjSFR/PHFjEaV
	TCBFhEPn3K3YuG0CIY2q2vNEuf2CzsgLeSWWxsyKWevv3EEFwMjtsbyuI6dFG0fm
	iQqQc+klHA8LN1J/wfwVWhu7nGmzmTDkMwFETNjmQzvDRhqerbzk1/oBB8g+esVH
	Ajcx3eLDtQMfo58kgkgezgP7UJ/U8c3ClLjEj+1LBh9P1DN53tkpolZDIqnfHgbU
	ItSSaHZvMBB46u6C5mblssvKyGJQZepfyEUVhdWwv8g3SDWZt6MgkpTdkp1H46e/
	eSBHbA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhvqfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 08:22:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3960dca5so63688585a.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 00:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795681335; x=1796286135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2HrrrNBgzbWtkSpe+9TVW44m0QQJQ8DUHceGh1QnJJM=;
        b=GdoOoLRLgf+YLCleVYr7Lla2mDo6hari6tI1o/TIMWbQhtwP87vfuWJ4OnC+wcUCFo
         PDNu4BAIudswnZQ9QT4ND6w97dfxKRG67uk5hr2yVkhtCE+yv1LE/dSP/FonK4JBe6eb
         5tn9pnXOZIjWXAssuQCKzO0mLp76sQPyjwNV+fE1nw91+0u2gXDJiKZ0lHaBg35P1CoA
         TqQvpLwIUrCkSZJw/kxgjUcXoTXv7uIF8FWKN/ZbckWLHxtjlzzn+NBEomJQlylDXl36
         zAjUMfMvR22Wjx83IhiYT89sSPv/fxFF1YYrZaTDcgvP6yND6IgEV7mWGe0tvV6p0uUV
         W+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681335; x=1796286135;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2HrrrNBgzbWtkSpe+9TVW44m0QQJQ8DUHceGh1QnJJM=;
        b=dCb1sp1RThNuRGZ+Ve2ydsKh/qkCkI3alE7tp392wf2+GJZI7wcXrr2bMUFAigWLRy
         PtrTBRgVI+kqn3why5kEMXhE6Rb7f4OLIqDo+Aoa2Fe8Vj5gn36J6S12ZMKpYmWzYcSI
         lagiRaW08cxnIDSr5oL2AwknYeK7zGXzNCCgDNyXg0nMcvallEJPt1+gByPNQVcYbZox
         JdiFuDKf5kKATiXK4vx1K0OG/wyQxKOdMLOt6wVyR0W4XZLLu8pJnUhOBBo3ssl5N3k/
         UUYfZwUFETeODpvB/XAcHtbxyu7MOK8i+4ILNT/j9jVV3CjByiZRwlvWgximJEbf9VxD
         O/Jw==
X-Forwarded-Encrypted: i=1; AL+hErEGdgtuieJtpWA7Ofn/PFxTMOQMfrpb4kVOKlEgpKHN9vwASA9oLWP68j1Epj3j8nVOeNY1FiP8N6M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mMRj0P9+epviFZ1RZAuWsl0sb3sQSDQAYmrgODrny6cOPJA0u
	iRbMCNWioPhAPuVu6i5WcJrXrqssTvH9Q8VYbE+sp3RA2FD5XXddstEC9dE3ftZxIZBsMh3YLH0
	JhHfeKjON5hrPRzu5ZuT3EUd/P9vbnrHi2mphSFpeHFyICMshUpuYqux5gE2ZBANm0hHc1JE=
X-Gm-Gg: AZFdTZcOKiuPJz4uL2ZsYiOLot+9vAJKxjYrPAoLuAo/edmkHIIdInwyhp6y6hy4Vto
	IimSvXS3AyBStNhsQ8oAuqSTlgg5jJoa482AnUJhuwh/2EFNaRZFqcRuBs1jIkhx22v2rRbKQ0Y
	DQo4lryKZ2+CcrmNhqbkJtnPIuXHVt1h4xK8HZsirL7jRjjk2HsqzrDQ8T/zdRSq9NDgDl1GcPL
	ulT+fZVaSezTCYDikOqiqz6uptxg90xKiBZnxqe5fE+uy87ocPjfV3EL+VfcbU3QEq76lnZRmVu
	rkvZ9KHiGZVxSDojmdttZu6m4scNIxzvdecuIyxNDPxUGxhe2t/ktXbo+3hju1Y+1CpY1LHddAx
	l73afLI6sY01WeGDP8IAqdRp9RrzWR+JhXSy8nVzxhUADog6C5Kuff7eB3qysFeWz8UOFKrQ=
X-Received: by 2002:a05:620a:2310:10b0:944:12fe:c8f1 with SMTP id af79cd13be357-949ba68ae5amr3525910285a.0.1795681335521;
        Thu, 26 Nov 2026 00:22:15 -0800 (PST)
X-Received: by 2002:a05:620a:2310:10b0:944:12fe:c8f1 with SMTP id af79cd13be357-949ba68ae5amr3525908485a.0.1795681335036;
        Thu, 26 Nov 2026 00:22:15 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cb764sm9672071a12.12.2026.11.26.00.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:22:14 -0800 (PST)
Message-ID: <1bbc9b09-44eb-4208-a260-9c6b5fbc2d3c@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 09:22:12 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-qcs615: Fix GPLL0 AUX2 parent of CPUSS
 AHB RCG
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261126074024.1440367-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126074024.1440367-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b07ec38 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=CvmSFNv89NKuAaQCPNQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: I-raoGKgm_8g2qsA02QR0fpIp6ExtscB
X-Proofpoint-ORIG-GUID: I-raoGKgm_8g2qsA02QR0fpIp6ExtscB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX1EQ18t5hdWTX
 jx4rIDSwzL9307apI68c9YLaapMvTNWnpIM7Y0SXjFwsfWX8nF8+H2AjnXLSNF+Nz2qanAxBpUP
 hLQdXyJUdrow4vSCUE1CYL+t3HXudqc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX2lkYpZjD02jO
 M0bihsLKMJPFtxAYyqDLTcAo3Fo0RVFnSkD7ivgUjcXGx9vmIhqZK4wElMAPiyPilmD50r6gJI7
 vIXJUNNMcem3PCQtoNOXBLiPBbHItV6RG3/7x+ifWlduBJUdd+6GmShoja6fhbKMjEHLs9fnhOw
 SesIkq+pVCIq4trjwXNVJgaN5fWtZSHbok1pji8RcX+nNPI2zjCyYDEikIeIbBAFS/waVQZxqE4
 kYRuQHwH4oixFnyg4ynnlnrbXgIZrZ43CTLQd+GMC+GfoKV+StdWB4g0TtubvBno+xK7dakBHvu
 i3GWe8+T9SOV+xgQfL1ro5QZObEIALqKz0X2/3d3iEYl5+nMcUtcY7SKp7ZA5q3CZbY6o/HTis1
 ETGDttGPIYx9uCdfGOzJb7icl1GjhgBR5V75U8DwxgRbtnLWzMMvG9v6yw9tmVgHsarv4CIdag5
 QoBGyD9gxAomNBSxmhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260032

On 11/26/26 8:40 AM, Vladimir Zapolskiy wrote:
> The always-on parent data of the CPUSS AHB RCG lists GPLL0 twice, while
> gcc_parent_map_0 describes mux input 6 as the GPLL0 AUX2 output, which is
> modelled by the gpll0_out_aux2_div fixed divider clock, and the non
> always-on gcc_parent_data_0 refers to it accordingly.
> 
> The RCG frequency table has only the XO entry, so the kernel never selects
> the GPLL0 AUX2 input itself, however if a bootloader leaves the RCG on it,
> then the clock framework takes GPLL0 as the parent, and the RCG rate is
> reported twice higher than the actual one.
> 
> Replace the duplicate GPLL0 entry by gpll0_out_aux2_div clock, as it is
> done in the downstream driver and in the other GCC drivers with the same
> parent map.
> 
> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

It's not used anywhere but it's a nice find

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
