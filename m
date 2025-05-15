Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56D0218E8B
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323296; cv=none; b=hTDNgBRdMpaINXGOXLQI0HDXzn9kcPdgTcv4EzZbqG6QfF/XEVQ/0bPHcne0sy70rEJiL8BIwdzDsVvXMmb155c4+wIxGf5Xt7CsXt5cCraB13ZjWBW7X6//l0XCoP9lX7vlV5/36bnzgzFE4p5Oi4VWZABCM9KhIWKtBUpOd3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323296; c=relaxed/simple;
	bh=ixVP8pcTpJz5v3f3CERMJ2iDXMg23OMY+fwNf7RKcvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVmnl2UmGsoGtSf4PQE68cK4b6GGG2erpZFkB3zKI8MXk+iugudqhq6Kjzs0rSkPzrPbFuWaduF2DD3MBtNxewgH+AgUI6M7+q62EWVYbtnbc1AJoKnqRsdW9SVjaDbrOs/zFBvjc5CBe+FA5S471MU3Bx6jZ5Qmg2UKM07FsBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W4+44zPr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4+44zPr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFXmY009374
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lA9ROa+Fk96jm+RavuSIENPK4Ma/Qw8dY3SARVyTTk=; b=W4+44zPrmFJUOxF/
	czpMNUl51CcT3hnQTqrrBvdxEbXdOCejmvSrIRDIbanB4oBwECKYLtPESVUqSBbC
	0EmLRKZcNc79jVRTdP7eI0+qPpdIRhQBAIuVGYBBr12+NTb0OgfawUuFeF36hVhF
	MG/kr/39YPtCFD3e5m6jn9KqIlz3gDvTQML9OGQFbU2LAAmYsa0vkoDXGfHxtZgT
	tCCfsHtZuBFbFti8OYo0X64ix/CjnVEImunXCfaKOWsWKqscK074hcap9RtDfH3u
	wnsfwtgyWmlOvcZORlEAN++RAzw0Dk7XtjTyWkdSySHAPxr1+Dpn+QBmSDWIyFIh
	pgm0QQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex6nsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:34:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f899d02307so1914216d6.2
        for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 08:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323292; x=1747928092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4lA9ROa+Fk96jm+RavuSIENPK4Ma/Qw8dY3SARVyTTk=;
        b=mLS55drkIZVTqD3AkjNsPfU/wihHoqy/r0M1atK9BN1PII+yG8Jmm/Hxd5a8P7WVhG
         rb1Td7vhBdyhzxY6Yf6Si2Pl6pfmdwkVmOsUtQs6VlITsToEg7uJx9f5e05pPQ7keUni
         hpj1Q0425KC6+2gZC4vb28M9F7JIk1qrQtUniZkfHS66OJ28rs6Ig8P1ZuicsGMOnWFT
         jKsIQKFY8by0XPw5Mi6g5TvZJpVPYdIIBQ/pdDj889VvXVYqAqVvz2IZUc2whGZss3uR
         B7TCwq9w1VkMLLWvPBWAKjBvSpKiICmRl3JZKD2k1cMRZXqsJRysi8ChyG9mJH3Dbfej
         2OZg==
X-Forwarded-Encrypted: i=1; AJvYcCXLiHSCCIkJtdJSRQb0ht6kvV7LS9Fm/nKeEwX115f/orpUA+Sy4tLBN+7jMGC2/MdGgcSJDW1ax1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtexKQt6pBNKjrLoVAADONbzt78h/F2hxi4W/q50Pl0SLDCUme
	zFIhYHzLc7GFI9f4eissYkoQpqZ4Z2wOl6jiLvwCBGq8q3txxp7TGAMsJ66EE9j81rq2HYjN8iq
	nkodmtOCNLJONrJVyLDXzDrbMgNBNINnuPcq+VDYfa5ASat1lATWfdAHMb+D9flo=
X-Gm-Gg: ASbGncsjP0NPyZ5T0v3mE0jD2mLFZXJzI7EVlp3S9NPqv+7dd4lQr2lpQxE5Tfi5Olc
	bFZurNdwBZrrvBqlH7FK65r7O4pfkAXiXoLcoZuqRSgOzOsglHyCr1RDETsuZ/3y3Yh4skDvn+j
	3pnSzQfwh1ILfu0IWeJwBzyyK4Fwk6AeLEbV4WbzV+ht5uAxJ8K4Csd7k9hnbv1aa8uN8s9pS5j
	9u8AOCPjTK4eBV3AT5yYHp+6mJSweVEROIUflTYT2uYn4QSDwynjtjKg1uJKtMUlzJOPutskXyS
	TazWNC7Ur2jH0RbrNyNQgLKz7k7DkpZ0wkKzvQvvkc/YTH8T55G7T1GtAOe+zF9r1w==
X-Received: by 2002:a05:6214:dc1:b0:6f8:9c21:5ad with SMTP id 6a1803df08f44-6f8b0864435mr966926d6.4.1747323292584;
        Thu, 15 May 2025 08:34:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjj2ZZDhYRB2enJaHEsOmAOykmUWbJUBTlc1NNsNBnxb+VMUfOdfTnLIoB9XZCg64ElxHH4A==
X-Received: by 2002:a05:6214:dc1:b0:6f8:9c21:5ad with SMTP id 6a1803df08f44-6f8b0864435mr966716d6.4.1747323292181;
        Thu, 15 May 2025 08:34:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04ef59sm6102066b.36.2025.05.15.08.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:34:51 -0700 (PDT)
Message-ID: <4a5cd51a-b88c-4ba4-a8fd-d065f9b9f113@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:34:48 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/18] arm64: dts: qcom: sm8650: Additionally manage
 MXC power domain in camcc
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-18-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-18-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NCBTYWx0ZWRfXwiIeAt4HFNWK
 RcbbDzZllf5cSoBMMxhiNDJG4uXBPXjOZv8g9LxLgpp/WNu3BRkb/jEcm73o+HB493unK7iNnVi
 pHjfZjuA/1Vu15hmXDAi7qHZhs5beoB2em03kp+G2tf28wab1G329XSXxVnq2IzmIRaWwVFe9qz
 YMp4h0qlqGsMT2+qVDIrn+Ko4nYPBwuP4fzZH1G7rFcyAsJDafQ1aQY1vOLmT9GjZmzDOGWXJNF
 49lQBQTk/xybRElBrSNtiNL4HD23RnJ9dvzEm0qf6hkoLtPiyjHzSQTXyebWGf8UUc7Sh5BEnHG
 IJ4Mq5bHujEYZ5fA6Fct9kAQVkrvCCoXJKvhIjbUsFA6cJU4qtYZ174JkBZlA9a2Wj1aQQif79f
 YZvLp0CYC4FGYp0/sMBIIzfF57d/H7W1zZc7ugGJbEQ+jyyoRQeR3ef6fLsg1OG5645fVrN+
X-Proofpoint-ORIG-GUID: f7t-aQCBdspGG7NGbt7KtAS-SqNHenon
X-Proofpoint-GUID: f7t-aQCBdspGG7NGbt7KtAS-SqNHenon
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=6826099d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=l4YKJxAlfa9iYSc-yQoA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=660 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150154

On 5/14/25 9:09 PM, Jagadeesh Kona wrote:
> Camcc requires both MMCX and MXC rails to be powered ON to configure
> the camera PLLs on SM8650 platform. Hence add MXC power domain to
> camcc node on SM8650.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
