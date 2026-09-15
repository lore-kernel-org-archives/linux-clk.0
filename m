Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACC74457C6
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463738; cv=none; b=gbj1DuMkGbzZA8tr089/Naw+j6TaqLFQPPGQOhv72ajiKmZe3jAbpKhwcnBXzI/zKZPIf4UFMKeUW03I6Ly2xWDddN96Tomld3X3kuc3eF/GYt2pmycvc6oLUMGRPg0RNV5uMd7m2hR16jUgdX1SXkaP/kIlolqDGeF6SNFYOQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463738; c=relaxed/simple;
	bh=ZQjUpbvPNMZwfic8zaI4fhkcmsRJfcKo65tVhd5bCBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JkiUFcAk7/IG1H94AACOmX4XHnswJJq1JpRy7JaKCJzI7BwBhKw99ZK8F2FNshO0wfE3fKSpoIjR+7AQ8cDlbmgAXwfXPzV1Ba5DHrSp0cBqKElG21M2s+7b9zsJHn5DGrv5Xed2iWsD83mizUNnt8GM30BvqubXpFSuEUjRuew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zr3QNWEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBvjtmc9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zr3QNWEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBvjtmc9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZHGO2249819
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 09:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QlrYwvQRqmwFO+AM5q4m76fOowfyDk4X6RZEHpgqDyo=; b=Zr3QNWEv+0LPVA8J
	0NC2+9zU4cWHw7EGdcDRJYnttjGmB/SyQO3QhRU/pdV8lo6b6nR7v8AwzQdOOcZ7
	QvnpHLkmoYkQ+lj40Q53RrT+OIPvHLTirKRV5d3n6Yw5juIGcfa0OTMassLTQ6Bk
	Q0kMd8uS27U8z0duz9vqvKQ+UmzIC6odLt+dFSxjujWffZhhkgMhZI0tCjrxHtvn
	8d7LZar/sQfYrFJgORQAG7iQGwnS2iR2++mur/9IA0W7H70j2y7NXwjV0I4dktUf
	m/OLvdY/8V7tcJqbXwCsN5bc4EGkh3X/p3hWaNxykD01ulHVxIB2gEiJPG9BuVHA
	e2h5TQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye710f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 09:15:35 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab4f652f9bso2772866b6e.0
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 02:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789463735; x=1790068535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlrYwvQRqmwFO+AM5q4m76fOowfyDk4X6RZEHpgqDyo=;
        b=TBvjtmc9fyUcNJ9uuEILGDtzk+q8eeMgjWSa2iEc2QinBrj+10ShDLLvIam6mU/0oS
         u6ly8Ze5klasUid9/DpHvI9Mj4LLTs6EHvTEyuIVvcFNyTFhCpTNvTYwzUbPshPiZVwv
         OiGNm9vxGm723TqOzUFgYmFm4nUmm7Szp7JMk00cyoMXAACQixyckYMwQSXQvRtnDReJ
         ApwnyOkYqOqZnB+c5bgfPRSVsZxopXN5ON3xE9Qpj4YrMee6q+7HNLP0Z8QeU7/QNRHm
         +Kf6hu95Kc28xs2Z/ff1O7UT8zhTlEkpLX5Sh9i/OXF77g2F0/bsbVIyiaXtX+ofB/Cj
         JGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463735; x=1790068535;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QlrYwvQRqmwFO+AM5q4m76fOowfyDk4X6RZEHpgqDyo=;
        b=Q7Wcb7/fp+edA/X9AcOgsKmwo7nlpbXNywuKRcgZdYQuy3ceHMEDR7iILXHwrhZJLL
         HTomtpspxEcKuUiNzzLvOw3M4+l7cYeYKzyJP6DHmU+3/UD0l4mMgnDLkgg/DSEFagku
         rt5Nh2WRxDuPqqnx7MOC9a1JupF8xgsCHKX0dQoCuosEXxP3VsVBYvWemPtb8ecvTrbz
         0qa2HfWORFu6th3pOqYu/6ygTBMLbvLscKPTm9s5NXKK/oXAU7SeMavaijhz9w3rCVPj
         6kqlKvgQ5xvIRzHHNeim11Z9sou3iFVJNAn2tID3sL1M1p3j8/Yc6MFb3kmKQ1kpVEbD
         pYXg==
X-Forwarded-Encrypted: i=1; AKwUvBzvuUVvSzFeZoL8oBZusstfAZJiNaFsaiWkXbr49gAuHhLI+1Vc7BrfuwmEYiQVx7lJnvleIR40ows=@vger.kernel.org
X-Gm-Message-State: AFuF++m9ar6jnMDLeyECcBBUAOCC1MAq/h0UeTo050RmGz0K+Q7Fm3yL
	jkXi0jbCAV/XKsOiLJTU126JYGOCcS+YyQi6DAWPdy7QVnQo+9BxCRh8i8kmnbeQv3SG6TbQYzW
	kZ0ye88hikM8u26BCXPnDnmCprL1hRwpJ15iwsa/bte4UdZmpl+6wCvZYWcsc16I=
X-Gm-Gg: AYBFou1a0IjhI89RrLIlWDnXbR/7mW9V1OwmE1qhFuD5iCngwFI4QbMJb2CjYyI0MGC
	JMHHYVAFF72H7XZBH6dzb76N+z8d/Bh3zWFkuIlFvJcY5AY+vxiYp7OvY5v1tF5SU5SDIxuX0au
	N1cGaauI9jixvlRjBv3FBAX3abmNSLNBIFjfvjYfRzBZgCE/zhVzhfqImHqH9B/OoWmBca+ds2i
	aOWELtlMc4r1u4ilxjkCUWpnPNqCs8rgnsGK9fduxa0Hx63YJCjFEGaoKueb4Vc1ZGT8LGwmHR7
	iUgJpfu0z8Kpb778BLnPweDAmDK9HjpNps9BZNTTRUq1DEc1dG8Du0fnzCdBd38J2hX6BHK6qlV
	zFQhVSmhr1+LWnvN+bi+euTLibJZpvA==
X-Received: by 2002:a05:6808:4fc6:b0:4c3:b3e:4e72 with SMTP id 5614622812f47-4c7b37d8de2mr4884099b6e.12.1789463735170;
        Tue, 15 Sep 2026 02:15:35 -0700 (PDT)
X-Received: by 2002:a05:6808:4fc6:b0:4c3:b3e:4e72 with SMTP id 5614622812f47-4c7b37d8de2mr4884074b6e.12.1789463734770;
        Tue, 15 Sep 2026 02:15:34 -0700 (PDT)
Received: from [192.168.0.195] ([124.123.194.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c85a621db0sm3015261b6e.6.2026.09.15.02.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 02:15:34 -0700 (PDT)
Message-ID: <b86bd3a4-ed4a-4c7a-8cfd-d3e07e5808a3@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:45:20 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/52] dt-bindings: clock: qcom: qdu1000-gcc: Add CX
 power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio
 <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-13-9d5a606ada33@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-13-9d5a606ada33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzMiBTYWx0ZWRfX57YjUvBUQrFd
 QWiTbWd9ieYBKB74vzreShz9fo22Tb3JDr8KNw96v+SnzPrvqP+/sELbtF3n/ACaxBP0z4IxiNi
 dhRrwz0vZvTofj/bT9i3UApzVIDiqEn9LFo5dOsdbYgcWtTPAwMJ6QEcErPfLIrjHllNirAmotw
 MR1bl3e3m2P0JY8bsXsn2FRtZKebGmvQEhRdm9CVdmjH2yWoO1CTiqWEjoXQ02HX3ub147B28Bg
 AE8uDyDExGMKhd5bowIW1BscDpJUNJGpxCV7TiQSQLy+RoDF2teR6ijLqnrMXAV3lbK64Q6gtzL
 wKui/B9goptaUpDLejLe1HLuqN7yQHvDO2zGjy40A+6aGhHkJLEl6kc79mm6JEpVzLnQPgapsNm
 K0YZBmT++EkundHboFc7nr4C2/PdH73nSRwellqtr9xTb3okbStIXVtQ8gu8AFJV3Cgf7Sv+3rE
 NJq5JPh2r+dK+txyfNw==
X-Proofpoint-GUID: bTeEcRBzmAng9YJtEbCyGDj6wLhAGEC1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzMiBTYWx0ZWRfX+EJhZeDW4wPb
 MxRhVKI/QWtzsKHOizcS8EZdmvcxsK245srhgUqN0L17/XyyVFQXXyJamGrxTxloPX+65yRpZVZ
 GreNUGAWm4vqF3UJYdRN2is1gdcdo1s=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa90cb7 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ZurMxzgV9Xw1nvs9fmaK6w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=3nyXIwnAc1TS01hV9xEA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: bTeEcRBzmAng9YJtEbCyGDj6wLhAGEC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150132



On 9/14/2026 6:17 PM, Abel Vesa wrote:
> The GDSCs provided by the QDU1000 GCC are supplied by the RPMh CX
> power domain. Model that parent domain in the GCC binding so the
> provider can describe the dependency in devicetree.
> 
> Add a single CX power-domain entry to the binding and make it required.
> Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh
> may undervolt it.


This is a always powered device and the minimum Operating level for this
target is NOMINAL and does not scale any further down. This target does
not follow our regular PMIC for the CX rail. It is better to drop this
target.

-- 
Thanks,
Taniya Das

