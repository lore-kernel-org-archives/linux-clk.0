Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2C126B095
	for <linux-clk@vger.kernel.org>; Tue,  8 Jul 2025 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751981727; cv=none; b=lh1lCcKZt1IjpHr/W8MYnCcqXWCE0PHMaKnqIHB/p48TrX01f5Xx+PUiwPdVMtOg6LYULnFeaWyy5hKM5hxO0/ms/YJwpqP9+JKiFyVXkNsURXOGu3f4/gdydE6gNVYWw81tXWoZTZeZAqhU2JuFUYbbmI3NXFd09iPu5plxSCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751981727; c=relaxed/simple;
	bh=sdwE2TVMETQv0lnaZK8FIqzkA22DNUIr0KqoTetmc4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVwMNTpXELNthzVwZuOSAPSAEsY7n82170DoxyCIK55jJ/KGd3lxEWV8bv4hQdYkkYxl6lL8mACMHewD4ageWwkYCbMJLZpknuSmawf0KSKXf4tZ9WK9jXw1xAcjpHYIaOS8nSYwObum3xSGnlpPxI8rsBfGNqJpqzS/OnqwOfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxpQsEDs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxpQsEDs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAZFQ032619
	for <linux-clk@vger.kernel.org>; Tue, 8 Jul 2025 13:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	au7Gd+bh35WYq3bg+QnE4G6bdktpjK9eW4ZKsorDzos=; b=lxpQsEDsgkgHIcp2
	nBDQhPovOPOmc//dR3UxhpWsvKPQhJuAQps5rKJeX1W1c4e/Oe90WSJbR1IdSp3C
	Xi8G/9kuQtX/0kHYQhYiwGWDhwmysmqTc+cCLFJn0cPmCNCJtUf4qeoZyVfFxvEf
	LwyEVuf1aYw5XfBIpWgsNgSvTJuqPkHuYUMp2Tf/EpDG9xxfHPXeZiyHJt34rUbh
	AcbCB5hsuC7mg0CAP4OtdRfdL4lQ1w6lNvVY6ISP1MqoAEYP/2h6T0Fq7cZ8nZfA
	M6ta3Kj/X9YGhCWxjlQGU86jSPQXdrCAaM4qad4qvlyAHgSoxGCa6zrCXd2kSx1D
	1XSf1w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47rfq30bh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 08 Jul 2025 13:35:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a78573c357so3544341cf.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Jul 2025 06:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751981723; x=1752586523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=au7Gd+bh35WYq3bg+QnE4G6bdktpjK9eW4ZKsorDzos=;
        b=IA0ruUxs1+/SqdTPR9rs6AAYB8YduS5QSPlR+ZZfxQZzFPVxrONX9CgZWv5XLg/lEv
         hMPsN7hv4iVhqQ/JUkhXOErdY0d9qFklhbgRIXL3QOFLSyACE1cl52uC8d2D/I7Id0N1
         ySm0J1szQXdlKRXhdLURqYYYkU+Oz/s/aarOZVQkzbYr1JlkK2dEZgYHuTZbIHX0UE3/
         RMa1RJZ6pEuR8H2f+siVcYgDL8OqenhFgnK3kKQ2hP55giwwQbM2A8BJSx8zwQMoO1WP
         +x4n0Ir2lde1BDgIiF1y5OfzKURpyEa4NZm73AuKd1FlosRnFmKfvd02P/kRzOgiFOLZ
         r5Ug==
X-Forwarded-Encrypted: i=1; AJvYcCV+v1dIY1c/dqy/vk5O+pPk14MbObxkwwDPAGj53Nj7AI5PTmro1QjGwM8/SyY0u5cSeNuw5JbT9TA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx8Gh7zpty9hJS+9rwU/NdcYWP4ZfdSOpghJtaOd+sVS/N+Zsq
	4COf4HNXAXwt7cmCC1R2eOuPG/4Umhdr/+64562VU4Fnpbwv3zhlYNwpMHLg9dghfL7Ci5ZJ6pQ
	fESYWiIpsxAqpbHAJTm/Gu9sQKo99dMuewG/yTpxNJgBRNjiWx6Njn/yApUIImQk=
X-Gm-Gg: ASbGncsaDCLia3CrcppOS6yXZuCOUfjIIhAjAKYCAtAbxWyzxEtdJ5YB7AeqeDiVKXn
	7QkVkqF53cOGmgun8fWyNoFJcwKihX+5E0+u+LqLN2Cy0guUbw7EFYFUW1dvh1yS9LWVhgPgMnb
	gjl9Aw8vXGQc6toHDReaW2JRUgsW2OB7MeVOVqQ99wzy9hzOheBYS04XhBAOOTRB+05BZArO/y6
	dq7GWdpUYrHafRSU4B805Lfymj1wSEgV1O1kV4f/hRNAafT3WV9y/aRCaebbp8fYAOh2xxQ3Ee4
	0C8hssgkT8MG1tOMscsq9Y6aeyuo0D42YUY5orjiHR4hYuL+vz7lMiznAKGG79V103fX1MRSBSl
	YuhY=
X-Received: by 2002:a05:622a:13cf:b0:4a9:7029:ac46 with SMTP id d75a77b69052e-4a99779aa26mr87767011cf.13.1751981722801;
        Tue, 08 Jul 2025 06:35:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX1XpFgWzBh5b3kelydKCB/xI5OEVjo9gU67wYMsPaB750Y8UR7hb8TdcGBNORBgDHXBEW1Q==
X-Received: by 2002:a05:622a:13cf:b0:4a9:7029:ac46 with SMTP id d75a77b69052e-4a99779aa26mr87766791cf.13.1751981722380;
        Tue, 08 Jul 2025 06:35:22 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6958586sm891855266b.72.2025.07.08.06.35.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:35:21 -0700 (PDT)
Message-ID: <048c4cdf-8942-4250-bbfb-3f6a255a5e30@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:35:18 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sc8180x: Add video clock
 controller node
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250702-sc8180x-videocc-dt-v3-0-916d443d8a38@quicinc.com>
 <20250702-sc8180x-videocc-dt-v3-2-916d443d8a38@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250702-sc8180x-videocc-dt-v3-2-916d443d8a38@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDExMyBTYWx0ZWRfX4/UMO3qDxhRK
 0DVRL2zsrMdHKMmAOGE010PuILhsP0eZmRw7H357BYkK+1X8qW/Jnjm+t54T88aZcUy+AljvCky
 jHVqJjwbSCLcR0uO9XLV7SQJh0q6vuXVrOSTSiISdCA3Kfx7/BOeAs4LSKkS1EjoFWUFyvYbdU+
 SS1Iver4jA6dcNyyrc0s4xfSMgLnekeTIkdLir2T97lH9dojdOrweRCG8HsXNJLczEjvvD0CjDA
 DLuX1ZxhkeSvz5Nmm/xtyFpJ37UFVKMCVJ4GH2smUibiSCrHWS6RBdxrPt1s+GR8gKqMZQ6/3eI
 veLsawT7k0S+bcEiLKkvc/Lc1/it6XpcgNILO4EAH8zGXd3knpnLLNpGHHj0XfYUhP1ISRNiajl
 MH+XiIors/qx8VIRTK2mwe/goC2m2bBjf9A1dA4hBlyq80a+4JJl661OmFe+W/qwzfcIR185
X-Proofpoint-ORIG-GUID: 6m9GOMAS-tt-RMqMa-vNyZeRWdlc3Nmg
X-Proofpoint-GUID: 6m9GOMAS-tt-RMqMa-vNyZeRWdlc3Nmg
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686d1e9b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=gRvX9a0DaF5FQXGff3AA:9 a=QEXdDO2ut3YA:10 a=pgX1na8PQfsA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=852 spamscore=0 impostorscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080113

On 7/2/25 5:13 PM, Satya Priya Kakitapalli wrote:
> Add device node for video clock controller on Qualcomm
> sc8180x platform.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
