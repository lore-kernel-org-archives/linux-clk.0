Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB5023C4EF
	for <linux-clk@vger.kernel.org>; Fri,  2 May 2025 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746181801; cv=none; b=fy3dG1tL32C77QHlyInOx+d1cAOGQ9qhsNfYCQs3dPTNTbRMjKQJRlhFXEVkSPkFAR8V3bNaXt6lpsGrFfYRqbFl6U+4t/adl4ZnaSiESt0yZ5GzX57dxUvYwz/F7LfOYhM7A8supblNEpaxyRv40/PpuvBcnzIovpwLyUTtwFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746181801; c=relaxed/simple;
	bh=i7lDDRucUlwhNKwX/fbh3u9h2y2t42fMvoTgrZxh8fY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EifgVQg7gYXQKKBDF7CZULJFGTo/ki000jK4N71dA5V05kRT5Cki/5FzEguuyITCvlCJXfXEbIsJjF0HI+JgF8CIbwJsUW7/jcCQFiHuQ2jazq7vTymKSI6V4CIdrM3fhmaHIwUWPF7Vp9x86m/rOfmGuT5hXOFVB8TeZP26GKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1Gai6KP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1Gai6KP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421N0TN015851
	for <linux-clk@vger.kernel.org>; Fri, 2 May 2025 10:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Dn7fvn/GQzMSROH7cCLUoBJLbxJJYWAddOeCioJDak=; b=l1Gai6KPbjpr7o5J
	Hr3ZMqRKavmSUhCNa2QUgclx25l+PA+ZDkUUwmSv/bpX6CkpPUdOCmNuFbM3jLYC
	nqpoJL86ruqNcxZs3JGPm9deAxexS9Xuy/SV9HuXQWQiG5uKQyWKapWrxJ9QFpPy
	ZDY+c8jG6YBlQf0eAiKPYzR1BuKr+MIF3yr+uJWajlMla4WlMMXx5H8FrpB60d/o
	DMn/q2rqb0V274gBVqH+aO3DM+MeXx7sxSUBkBlErL/wDKT3NrcPbwxWaMJZ3IsL
	UpbjTuMX519ima7NKU+H61fuSuCDhSqyCV4AWspkRQWHx0ClM5WPYbBCYscuTzKO
	4DtUhQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u3ywku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 May 2025 10:29:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5466ca3e9so45569885a.2
        for <linux-clk@vger.kernel.org>; Fri, 02 May 2025 03:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746181798; x=1746786598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Dn7fvn/GQzMSROH7cCLUoBJLbxJJYWAddOeCioJDak=;
        b=m3rZcfje5RWuF8qpPo4zGEB0A8edBgRBuIxsdSplhWlQ+H0Nu8jxd+sHT1Ke4Ng9Zz
         Xy0rxHzh+mzQ3YILiNMZvyPQX1IcokiCspa5PCLXC20W88KAhU9rSpNJByp1lbrWjptu
         6Uq6HKvybcv4tI42xfqxLNTyMYmVVQk/hnKrPmKXCSqc0xbTVBj00HlCyveMkZwJ9kXF
         kBPpWrNjZ95m5doHAOpKG473rZiqmVIb9uQiysWJi6TGZK74/rREHHoYy/wqj2aCg38a
         rYoUDQuJCK+nqQH39dfCSJ0AK+jZp3h8buttoJlOnIY0kdzsZf7tqxd3hnsGya8Fwl8P
         9nhA==
X-Forwarded-Encrypted: i=1; AJvYcCWvJVxNvqDMUOqncYZ3MQ6C7j7a6gQywJgS4LKDrRxMUSw7y30VgHXcQAcTXJwVrD4tK/h8UgVB0PA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeNZGGMftr306E7JmJNsVT9rk96DRamppezYhwlwblEmQHCFLW
	jeN6J22U4u9fPF3yImi5IJTCNDoeuDmB0qLNDDBMxGYKs6i+90esN+GJPvw7OKKZ/uDP37d8eUj
	blhdqZDMCepnR8+wInPpvqVWp67LGJQCjBApEwJ9ksM9vTYFRhIicKmfm8eE=
X-Gm-Gg: ASbGncvzL89meNA8t/5JBym6RTGtFjq1GAFBC2Sr29iZl4NBOh5WYsBgOZfg/qFaup7
	JKaRtnRTjY/cSgCD4bW3yensRh9Mqqfh2Qcs4OoKOPRq/8ZyQ5GtUC5o/a46W6HtYJgfcYN/XKk
	UeZ12OkOMtyL6tD6sW9zlGzdcwmJMwESNqi2/QWS5dBfwpWchG737fbvfdGy4LyIzs98VPgcAGc
	KpiFLBxa/hSv71DB5uqm4DI1Su4R+OOtTLYJ+AUxKQ9AQ3NzeVeKaU/XvMGjfPMfF0aoif7MVMO
	CX7MwU/pyU7XjJYfDOZYFy3PQAAGb6TRJhmTynmHFboY70/b+/7zTSyFnb9TNjzUqtI=
X-Received: by 2002:ac8:7f8f:0:b0:472:15be:54ad with SMTP id d75a77b69052e-48c32ebec71mr11930211cf.14.1746181797951;
        Fri, 02 May 2025 03:29:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExpZCizKsiNGnAZGjO17fHH8yFM+oPe1mErUD+l8Dx92sb7vZcW1igq+h+lNhd+1RWdEMubQ==
X-Received: by 2002:ac8:7f8f:0:b0:472:15be:54ad with SMTP id d75a77b69052e-48c32ebec71mr11930041cf.14.1746181797657;
        Fri, 02 May 2025 03:29:57 -0700 (PDT)
Received: from [192.168.65.113] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18914731dsm29461266b.28.2025.05.02.03.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 03:29:57 -0700 (PDT)
Message-ID: <1435b068-3bb9-4285-8399-81fc278152c4@oss.qualcomm.com>
Date: Fri, 2 May 2025 12:29:54 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: qcom: ipq5018: mark XO clock as critical
To: george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-2-27902c1c4071@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250502-ipq5018-cmn-pll-v1-2-27902c1c4071@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=68149ea6 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=N5ds6sLAiLYF8mbRe1EA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: G6d2C4BoQIH4wqXzFUtBlvPVmPO2-maT
X-Proofpoint-ORIG-GUID: G6d2C4BoQIH4wqXzFUtBlvPVmPO2-maT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA4MiBTYWx0ZWRfX4lm8rruhW0jF lpxdXxnSrRsD22aaB0o5eK0XpiJiS88QTvECySGWjrBmplKVD4N8dtDW3eh9Syh1BThvZbCPF2c GZzLctLqrHD1saieWeH51K2/H0H1sJmLMPZqdL2kYlcfGrI4OU+kUny3SHGkypznw+TQls3nUiv
 lskCeCRgY3TSKnBKyb6LR/c/NOUJuvMldBQZqErZO+s9K5IyTrT93RZYSZou2BdbJvLYf8Y1nXA 3mEal1fmec4lOwO9r7g6jYOD2utIcUt+sVTb0lH8Tw18qYmRall+QwbDH5kKVLpU94stoJ/XM/D gDWVDlH5FREM1SOwX+MDwqAPnGn+MzPZ55fJA8N/XdcaHeDIsHhg0bF5tdGElqP0zk3JUHtz+da
 SdP7vlB+pCsrs75p2FylUVXSS6ySHpvFCMvS0DSxc2tWRBnmey1xB9lHeCPOEk9fkn2y9kEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020082

On 5/2/25 12:15 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The XO clock must not be disabled, so let's add the CLK_IS_CRITICAL
> flag to avoid the kernel trying to disable the XO clock (when parenting
> it under the CMN PLL reference clock), else the kernel will panic and
> the following message will appear in the kernel logs:

Remove the struct definition for this clock (and the assignment in
blah_blah_clks[]) and replace it with:

qcom_branch_set_clk_en(regmap, 0x30030); /* GCC_XO_CLK */

Konrad
