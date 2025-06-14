Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA421E520D
	for <linux-clk@vger.kernel.org>; Sat, 14 Jun 2025 19:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749928080; cv=none; b=X4qZJS3tInC0G9ibf9F5QDL+xgAqIQ+oeZh5kmt9YwqmRrnq2ADo+hS2VuyIzdk6hfsiNd93if2mIURswNAOs1hm+H1uPnLrTiNji6mGlSHCa85NHaeJyjelrrssvs0/WS7nJ1ByqbajP5qUcQC4Pvr2I5B1iShgSlwDwTT5W98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749928080; c=relaxed/simple;
	bh=5fGCHQhY/8CNoHqiYwK5sKJ1eRamWizDToJSxLRvSZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KMKzTsBWx4OI08jGoWxz0Eb4CxMbnPFVbSnkD9f1cNGy7rcjrA3Bn4T2bYBJbGn88XsCAMz6e6mKsQP/2SEWISq+DPQal8oYy4IwpLl3rhPO2FgIFwAR/88TL8ezLfmz9gnSPKEc+NpvO3FwnLG8yjvGlncrAVXImW7oBbMga1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UAfU5rwZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UAfU5rwZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EGX73U027542
	for <linux-clk@vger.kernel.org>; Sat, 14 Jun 2025 19:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czK0+r2bU5CFI56zqbiiRnlxJxdH80DDV95cNC/UIGI=; b=UAfU5rwZzqvcNtFl
	jaOdBi9vtGH82J7QMOexumQzZJjregDTM4Llp23N1DQQ09PJEQdzf2F0+u4vjioa
	uDxK/3WvNvHzFl6qjQim55lJ0209N6n2IUn//8d9ZcxmzuZw1pIxOYPP2EmSvb9M
	ISCw4hkbEojzykIbX+QBR9ntqx+W8PWgtjDIaarqBprKmSEycwwgeNo3OQ+BKSKb
	Pu4PJqTc2348jtZtTd+Ao7moK+IgZWNShQyBxj+RnVg1EKE1yN7Ir3vq5SRu4/Se
	Ujmyid1faE4FuSbBFhLp8CA7by4JLfWhqGOTBc1LbMK/ltlq5BwBmcy5cSY6eJsL
	rgD2pw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hf8x48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 14 Jun 2025 19:07:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0976a24ceso99063085a.2
        for <linux-clk@vger.kernel.org>; Sat, 14 Jun 2025 12:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749928077; x=1750532877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=czK0+r2bU5CFI56zqbiiRnlxJxdH80DDV95cNC/UIGI=;
        b=kIxlcxuNxFUawuKtpKJXrPAhnNmzDlhhNmxMiUGjm0t2YnFqtU1iGD3pBpArYw8Q7w
         4MK8uxa24P02SRlQ5zIYN+p5HvZ/HnzAa4OWSd8s08En29Rao7O0+KPmgrWuNuzAwTc4
         zSl+RoQWJ79vyC64Au8f3WPvl+1bhNN5j6JC8zuJVgfVwxb3M8MNPjskRgCNb7Vh50Gr
         zHjyL/XP+0EzHatBq1qrMV2LcvwJvgamslMuxVufMtHrc43uHnI42dTNanw2uyKsKXbH
         R4n8rMHnLRTgjex3l4LsH2IMXWEp5WCeV1Fx/EMYaMZP3EF/NkIrh2XrFn80He+5QnvD
         E4iQ==
X-Forwarded-Encrypted: i=1; AJvYcCU73lxdhL9fiKw6uzSpPQEoWjb9KTISlakeYoepZcsHuucG0m88jb2FNe+V2RfyeR1o+gY1SNuiw4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuhYl3pWDtNB2LbvwLVcM4YbZe4qTzEe4P5/65dLhKfIK4YdP0
	7SDFY7zX2ZGNirWbmPDlA18oYPU2xXN9BTjvwNx+6LswU83DyNxg5gCwux2VXsKa/X26DC3Zfcp
	NV7VMUfe5k1DZ1PqxfcTSTQbcOLLcxy7x9wAnhkFWVPuKJT429Axl4G+C6cC8rAQ=
X-Gm-Gg: ASbGncvw5S/gzNyNuvCMuwARzaOBgXzQk5sPr2B4CraHya7pY+InSKOnAMPhgGkH6Zb
	b/JWuQTZ2QtUqOEw5AEf4ZhI0RGepfiFOLn7P9Z+r0Urn/Tbk/e9C9lGlU0PuFUtJulUVpEIWiy
	SP4d6OQXlpSKwdDtOa6nnqVWYTPqL90xsAT/hC4KrveaRfKzEYHVSjWoLLVdFqbaWJzETM1am0T
	3f/bbhJiZk2YMhrYurupAWUvG7Tu6SZjN4tXMLVSSeXdyKOB0dogWI2HNXtP88EO4lnhjiD7ocs
	FdGuKwZkwAT1O944AexhTcPhc9hPcp9yR6OhgkrrGLyDHVrxtVdxkly8fH+pCXRcgkjFL9FgOKv
	N9GM=
X-Received: by 2002:a05:6214:2266:b0:6fa:c46c:6fa9 with SMTP id 6a1803df08f44-6fb4779e607mr23145376d6.4.1749928076548;
        Sat, 14 Jun 2025 12:07:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI5J+2Qhz/ZsAiL1MBsakDRbis6CARe5oJAazNWsgg8FGvV/1N59kDzEJiBk3ROKzM6jr0ZQ==
X-Received: by 2002:a05:6214:2266:b0:6fa:c46c:6fa9 with SMTP id 6a1803df08f44-6fb4779e607mr23145106d6.4.1749928076097;
        Sat, 14 Jun 2025 12:07:56 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a5e6f0sm3268359a12.42.2025.06.14.12.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:07:55 -0700 (PDT)
Message-ID: <b89c5809-38c3-4b62-b26f-073869674b95@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:07:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/10] clk: qcom: camcc-qcs615: Add QCS615 camera clock
 controller driver
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
 <20250612-qcs615-mm-v9-clock-controllers-v9-3-b34dc78d6e1b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250612-qcs615-mm-v9-clock-controllers-v9-3-b34dc78d6e1b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2MCBTYWx0ZWRfX5zknuslFksf3
 kFrUsvWB/bQ3a01V/uuGukiX4qwr5XN5y1vxsEmdq+L55/C2Mn/lJ1Thrve8gmj8fY9BJEnNrjX
 /YH0zKgFH/9uwYuq7Ef854k2/fpQr+J1i7Lonv8oofPFtcgZixuyeYw32xdgsykxOWoOO8rpfIA
 iQfe9B3b9FMBkZZI7wL9LeENmtdkYPW+x6ZNk1diebODAQLqLiVuPs7LESgZXQR8LDjA4j/pZjK
 P+Rqwjyrc70a9hy4Gyf0RcJKb7jK7AKHIgFI5bQcL26nDSIE+K3xe8H1lLDys6gcpLPXum7l8Cd
 hCU8XLnmXOitBs3LbkMniwNxnNqlJC3kPzzmeDyUGwsv4utMEGrhLZnxQZ0+GPJucZuOPUkeGCN
 blPxvLow38PrGWlPVbxq4hT6VE8wbmtg2/6IVmMjqnIpyLdXQJpcXDGdrWmV3UYoM+k1E0gU
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=684dc88e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Bfq9QhnQsXqFA3cbzqQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6aTKmoj7ji1eX0n8mMFppKIaajEKfy7U
X-Proofpoint-ORIG-GUID: 6aTKmoj7ji1eX0n8mMFppKIaajEKfy7U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140160

On 6/12/25 11:55 AM, Taniya Das wrote:
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on QCS615 platform.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

[...]

> +static int cam_cc_qcs615_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = qcom_cc_map(pdev, &cam_cc_qcs615_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	clk_alpha_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
> +	clk_alpha_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
> +	clk_alpha_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
> +	clk_alpha_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);

Please convert to use Jagadeesh's recent helpers

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
