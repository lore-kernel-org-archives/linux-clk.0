Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1C4288C8A
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 10:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753783308; cv=none; b=BJ48rU4089ptRlbbyawXZzqpcK91zPwo4d/LWhDJmeFzmAh1rWvWDGK0J4aESOplO5jU8ujYYzWCs4ZFFGFaXySZ9N/YZUhcfYegSJbVkq7j7DFNoluMj9EzQbTvxwqjd+5WkzpOtdyJ+QHfJVzH4m+BMcwZnUOH/wQbeGCfWEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753783308; c=relaxed/simple;
	bh=b5/AbWh4VGYvJYGMYEoAI1yd9P67N1DcHHSd8SASrxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=adLqTcugxGL360so3Mj3RYdhvhfaBPjSTfUgYHIjpEVrcaM8Ho9izgyftch7mGBTm/HTxBxSmuVX4K6Y2RgjPj9qsciW+orlxF327HC7DLFQBEHsASl6iaWtS6Dh2e5ecXr69ndDXJzK7PzuyErPyt1ZQ+TF3lZf5cAtaspw5TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EYMp/aMg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EYMp/aMg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8OR65018159
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 10:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i2L4H4k8qNpD35pJiHRB3w3KqGWKmWWZOUOqEsCI49U=; b=EYMp/aMg0TzTTDne
	dpd18urBhEYRJPpeB2NpnSWxOT9ZqYwOolDOaioOPBqUqXpDK8gkO8YH+UUoC9Oc
	boxbDvutROmAIo5KZwst8IopwV4c/zDw32G7flXz0svyjA58ujXdnuujZGVQ01FJ
	o+VU44pTGP+i8LbNJUvFrda1xIicD11+SgcJUA5VzVZc/A8uVfmbDYlq7p8wAN7A
	MdMBiqpCvREE6UevLbG0yKmIk/NWyIcIivMuaW0ZEepd+klZJXuOU1OYhn8BgKk+
	5QYpSqeowCDUO03zAuCIc6kx8vodxC36CkHwTY6wyNLn8yUMnc0bbjgnO2YkWFdl
	yFFysQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbkyktf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 10:01:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab65611676so19251131cf.0
        for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 03:01:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753783305; x=1754388105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i2L4H4k8qNpD35pJiHRB3w3KqGWKmWWZOUOqEsCI49U=;
        b=Fh9FPzOtxVM0qfVVgh0d0fWHIwy2BHMbMeDZdiWPiBbWsGc3CErxL8d6tmfUE1fYZi
         LYKonY+RU8fYHIKtrc3eAAXPBG0NTapLNtdpMv1ZFPPcgRykN/YNWA9oEYRKNEdGAzjc
         lfS8rJao1v+vsxYgJY/HspMl9KkHvqnsvYAe2YPrEw+EIV/aJheTozyIheEJlPUQaUeb
         2wbQoa6lroKV1xRHazK1KPCLXv0d1yCnQyjcGZqllivCJw6O2KCd7QbYzuiWgSsNWFt8
         HTp5xIbITdgI316eMI4BFON+FGdlIP0u7oZyAndh8dKBzlskQQUEsX2l9RT11c4ET7q5
         Yh9w==
X-Forwarded-Encrypted: i=1; AJvYcCUaVWRZCNdjNY11gDCAb19WWPIiGdsZC3BPJv34UoRXS6dHyQhRJlZaLje1PjpRIpEUpfjgcenf/Bg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE0CU4Z0CaCVvrfU2FBfUWlFZBhM6UjqPjMoMOd2zqjIR4e/aJ
	4ATvaMa/OSUTU7kiPXW1LuZsHCLrKjdQsLx9xydUI6/gm+PrFj+4CMZe14/hr1alkTAmq0REd21
	VtdM0cpl7xf5kehcRJ8sAv8WZNt9CqLmdUMlarhVMRpC2LO2KPVH1Kp/LHf9ga1g=
X-Gm-Gg: ASbGncs3hvnpVRfUzbzHRT5OEv7oMLnLKixFRw1LUD2lhv+AnbJcaW00RdHStFMAfF6
	xMEkmReFip0vhkDeMWBFrRroEdoEZwyimrdk6KX+hYIVUdyLjZx2xuIFXt0AFLp3W3oJslPQHEd
	fl+PilQQHZA/4euuGGP/96i9t1fElkKwgpwaOPXu0ZMxYfQNExUvwlTAt3SZFNqizQk64u3G7nk
	54AtDDdylGEI7pH+1LxfKTOsxJmXmLjcPB77WXryCN1PLGlXcM9Gq+ZrCa5C/q3e2UWvQFGTcKV
	dRfLvlBkkLxEGBiNTVJu4aS3oOGDlADI35V+5f7UUMHui9JP0fUtZek6ry24+vvozJZyqgimft0
	NtviTOnN+klp9zUtXOg==
X-Received: by 2002:a05:620a:d87:b0:7e6:23df:a465 with SMTP id af79cd13be357-7e63be3ddecmr914838185a.2.1753783305114;
        Tue, 29 Jul 2025 03:01:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiy7mRTlkTSBHHGFfxJGJ7ZmooAMdpG8CLF6Bxy/LBKUaWbfUoweJXi6ZBpw/4Kvy3dj7t0w==
X-Received: by 2002:a05:620a:d87:b0:7e6:23df:a465 with SMTP id af79cd13be357-7e63be3ddecmr914834885a.2.1753783304592;
        Tue, 29 Jul 2025 03:01:44 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61500ad0451sm4462352a12.33.2025.07.29.03.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 03:01:43 -0700 (PDT)
Message-ID: <23f37207-fed9-4584-b92f-7142558473b3@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 12:01:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
To: Taniya Das <taniya.das@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-7-227cfe5c8ef4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-7-227cfe5c8ef4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=68889c09 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=sQv67BsiESNKl3dOTAkA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA3NyBTYWx0ZWRfXw5AMNEafuiNu
 XDDgKH5KIF24C6OSIUO506W3xT1W5f/yxBbO1GttfmVVjyvAMZWJTZKaXaI9U4AaGRfeG7Ur6w0
 rK1a9UoP7UIo0JMlImLfx05UaFfj/A45NUGZY3nygfSgUPuWSJz9XC5v4iDaLtuVn663gZvZ4sC
 kN98iiYEwm6dnrWJB8uY0iCuWY1i6jMCYko7O2WIq8PTpli3ubUPKYX/5kh1lHkUvvbjmIivmSh
 F6wLlFS6WblZ8e4u0ITnsrgWjGK/BpyI03gr2Lu9xsRolQXJiLNeb/DgTrcQx0PjO1v/V+UkAhr
 Fl9NkYhrKIyvs+kSI51H6VS6xq54L4iABFre8TuiUSGpqY6OZmZTYrjT5+OOm6ROcWerZ8Hw5Ga
 fM5XEoKk6xSfjonFGGcQY5w5IMP1aoJGcreB23dKXsp9aN06iA8hKrSsNDtjObOfwqEkICQa
X-Proofpoint-ORIG-GUID: 7MOMUqQ7rPioGwFkTvOiZi2HVPhBDVQQ
X-Proofpoint-GUID: 7MOMUqQ7rPioGwFkTvOiZi2HVPhBDVQQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=953 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290077

On 7/29/25 7:42 AM, Taniya Das wrote:
> Add support for Global clock controller for Glymur platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

I don't see anything obviously wrong

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
