Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1506833890A
	for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 10:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761906590; cv=none; b=RK7Bu3/zbmXGNv4x6j2LCeTMTtKW8jIhoUb6oQ5a2IMFqnNDh0Epk0LAnM1/lRI7J1Pzz78uPuFQ5GQhmAdcr6YKpgeCyt8VxAX1+66h3M/T0LDORiQVyHhbvfJV94VKaaqleKupe6JkuI3rwL0ZyznMvVddHUAve2oshPQJMBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761906590; c=relaxed/simple;
	bh=GmomhQWu5eZuudMLA/J+HdDfI1qwJFEMPLFFfhzhn98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XUtyi8Ilgq9ulMzmERBYptdy9jDql+uds6qvCKJxRgcpB9YXa5H8EX9j2bUHMy1iARfeVjzvopAKgZZMpj2/x1WoSQZChu7KNsSrtul9mMTPpQJJi/u/hnisV916fJuq3+U37JmTgvzGXcWnIMhIhtdOMdmRrnHE0zOK+UgLw5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EmFhZUKn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQ+tefdk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EmFhZUKn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQ+tefdk"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VAS3YI102861
	for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 10:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y1jTND6/HmyqJwuhZfPw5RfQr/zkCEiCnZ5cJtmao/s=; b=EmFhZUKnBb2EF5RU
	iCYu22xSaHIXA8pJjOfr4WXzQ31PnHj75+xAWX0dHgu986On80CP3XFgg+xubKdv
	IlPXc4NwKrfxebfmaI0nGaP+9q9GgTYydYRB06UoK8HfT9AMHhV60XzbkicEnTMJ
	QODM0MqEGqXypry78ByYQy5+dvSUMTusnxIcBLndnWc0AsTuLmibbHnYrX7Ya3tv
	ei4Ds18XnddjxrbYdu3b11RlCPR2WQba+tQaWb2YcTEe+DGbD1dZMwgBxBV0kQ4+
	MdfjwKRPjZf56IzyHbKLupLXJw03UK4WL4Vuct5lE/sx+ew1AZ+M74ZHU1HHU6zT
	8X87sw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdju8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 10:29:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-294fca58e78so14690965ad.1
        for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 03:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761906588; x=1762511388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y1jTND6/HmyqJwuhZfPw5RfQr/zkCEiCnZ5cJtmao/s=;
        b=NQ+tefdkBR7F/D/uM36a5n7aywSsyqVoLKk/Wcyv7pjP+tA0owX5Y5nNMf9OycRYGR
         7qEwdm5m+JBrgOaAzzLheNaPCdHJ1oB5vZpLBxhwWsQtFDi3z4RCTbnHFqQlJAFaRNHY
         bndCOPuntrDQtLrUGhUN3SGwcMG0bLlp/aoEi0MlHzdyo6DtyE9u7mKQkqmUXEFYj4Rh
         jJkacS/Phr0jBdjlmdMoBOEw4ZE5hVFNCkU0CydnFq6HW66d0ylZr+A1CJ4/kXccCY2u
         y5HTavDQv6dyUv3PXQXwc3vJA+rQU6hKNmpkk1sEjWuXzCPBYERZ+AhdEeFiyYozWHN/
         9img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761906588; x=1762511388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1jTND6/HmyqJwuhZfPw5RfQr/zkCEiCnZ5cJtmao/s=;
        b=QMxrjVrZNEYzQpIBjnVAs+OvWkjIKsblJHfAddAWY8IUTPCQlpHOAcQBvz6Dx9nVzy
         fPkJc45ug+npSLSo7Q5GJcvlOVcMAZbL7VcanH6suV5OZXcJZbhCACqbHD9OQFl8Vfxq
         VfXdGRIZ5tGl5/nuUq2DsHPmvlgz7jIpYvt/FJRcADbN/9NzibfIHEzFtQxqL3W0Snli
         3qH1/16GcG5tEP+b8b19kaBTRdP8f2U3RBs0Ib+hcfsEQSXeoQS4ryzNaDeKWChieMgw
         YclKB1aEJyF1qBJu1LrbxCYG56nr1uX/ZchWJAhNzRmpsMjqypY5+OJvEy28Nimd+tGI
         iE3w==
X-Forwarded-Encrypted: i=1; AJvYcCVG6YqP7SO8kDES8gkkRIHbWc0PamogzMRFG46Nohd6/J7MNZr7BL8unhvAn6hKmfCc0R6PERLsuK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUqHkFdYrJ5D4eNDsfh0+b0/n0LlW2H/yJJcDkIp2fws7gLt4h
	Ro6r0XwgsYBNTU+U1H/ID0ihzpeA/gvM1Ki4y2jdm2vQ+6HQemLnK2/vfrnaK5EDmoHI2wrvWq6
	/mjnILr3KV301i/rW3gWeqJymb8cpd2eCN8DCfTGzSyLX5rmCICaVsHl8hSFrbQc=
X-Gm-Gg: ASbGncvrZn/oDlOE2cHH1YdDU5wqIL/OAgTj6sfCEsgtBvuYl1l9pwqqwebB5DFa/R/
	ualBv4Lq/YmIODLa2FyQnL8WiNP8KA5X+19vdBcLOE2H8nZdTmBIkWfM0CPV5yYwuXGvIAlB3qM
	LT/p4eMTA2MqLBwxSvg5+PuE2jOsBdwH1iwFZjet8YBm+SKYt5d8hCV5q2GAYeaKp8BCAKKVNX9
	1inxAiKwYptppV/r1xmMdUSawYSBSHYcev1YNDBX4fMLrNHeSDx7TDQpY6EzdpuLQmQWpwu4V4A
	xxG0ahOFnesTiQOYumTJBcNgf/PvsZvGVcIz3Fk6cKpv8jpAEEz0mwp61SHvtvd+waU0mw3qSAZ
	73LPAF21dQ7q7FWjMp/WKkz6Fwmwq
X-Received: by 2002:a17:902:f64c:b0:292:dca8:c140 with SMTP id d9443c01a7336-2951a475500mr45451755ad.44.1761906587654;
        Fri, 31 Oct 2025 03:29:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAz5IcFrme6z6y4aSHIYgc1QcS14uv3B7ta0DOwkl958FLQrOzp8GsnimVMwXGTTWGIw5Mmw==
X-Received: by 2002:a17:902:f64c:b0:292:dca8:c140 with SMTP id d9443c01a7336-2951a475500mr45451265ad.44.1761906587018;
        Fri, 31 Oct 2025 03:29:47 -0700 (PDT)
Received: from [10.218.50.9] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699c62csm19059985ad.74.2025.10.31.03.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 03:29:46 -0700 (PDT)
Message-ID: <f6903eeb-76fe-472c-974e-21338e07eeb5@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 15:59:41 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: tcsrcc-glymur: Update register offsets for
 clock refs
To: Abel Vesa <abel.vesa@linaro.org>, Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251031-tcsrcc_glymur-v1-1-0efb031f0ac5@oss.qualcomm.com>
 <ievmorxn4cpwx3xnlr5m5j7tgv4p2ixfbgr5bojsetzmdgmid3@764lndl3yqpv>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <ievmorxn4cpwx3xnlr5m5j7tgv4p2ixfbgr5bojsetzmdgmid3@764lndl3yqpv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA5NCBTYWx0ZWRfX3K1fHZ7VnFON
 E+Xhz2GoadsHSce8AZIvigZTn9k2S10+0QsrUfFWNyAsICW5yW4GNMFboYOgpJvz9Zohot3EnoJ
 jFaXvZSso0goEfgqmQbcfjJ/qp4o457w4IaMCrB9ZwKJ41v10SNWmWEHKqSO0j1TJ3fVMZTU+Rr
 kwMwl+r/Tn99ru1ZbS2meiO1TOd+8X0cNJfRuROScNZcH/sTib7G4ScHjWh0IvRtJVES77qOjPP
 vaHzjmHvwIYpD+C0vqVdSBHtMGWdL1Yzeh/nXZDgIIOxJiiqyG+fDCOZryH/gwIgm+hE3h4i+Wb
 JI4c9ZGyFr03HtUEc/hhbQBtQKz4vNwZBAxwJPfNJFHgUIzJH3iyqeVed7BRzKGUyfTptZvOGaV
 8PkWVyM9n23l6ztxS+Ecc74PVDMSzg==
X-Proofpoint-GUID: PTJR5sEI_apj4ixU49e8727rkYcJM49N
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=69048f9c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=p4WGWtBPKAh2wfn3LcUA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: PTJR5sEI_apj4ixU49e8727rkYcJM49N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310094



On 10/31/2025 3:44 PM, Abel Vesa wrote:
> On 25-10-31 15:32:25, Taniya Das wrote:
>> Update the register offsets for all the clock ref branches to match the
>> new address mapping in the TCSR subsystem.
>>
>> Fixes: 2c1d6ce4f3da ("clk: qcom: Add TCSR clock driver for Glymur SoC")
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>


Tested-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
