Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760D726AA91
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 13:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011702; cv=none; b=nvHnUM3TU41SdzqJJ0/McU4oXX/OlrHHo8zANKajFCfN5NFHlfDRpc6IrsttBpDLi3hR9qE3wbzCS8s1gTwKk8ERD9l/YAradUaqSoT9uTATPbgoFFItm3eyi+vKYVrMdVU/Xe6RmCkItlTE+rmcF9EX7Eb2Yucqk8+n/eawAkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011702; c=relaxed/simple;
	bh=lh7VcJd5s9opK+qhKTvgPwy9qXS6LiR7Bvx1T8En7g0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qtdiOkzvpuSGuHLcY9Ym5uTL3JsoQT6fEP1gf+7GPOAIfryVgS3LMcvIU5aLozxZzS/hlH5phIR2DaagQI37a/0FKtLyJBg1clepbXlGmvlEnq8IMjz7nCWawGCSGPNHOVCscBfMwWzy3jwacVhWn+eo4OBdqhQk3gjvki8vFug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NU83Q0qa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gua2nliO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NU83Q0qa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gua2nliO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClGwO2251529
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 13:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PK8zmUvBTXUruM9Ga4dY+eCgp8SW/s+tzWaRTY5T1co=; b=NU83Q0qaGMsKOQ8y
	vjR3I6Hqytny9QBqb1i+qplpOH1MG8n2qafEW/cJBI8+O+Hy2MMuMlpnwD0c48oc
	FEYRpJfMz1ZoxRjhglZdSr243khOfc7Xj9J+kPh20u+VjdOEOGLNz+52sqJRN3Mg
	pLYhTA8wD2GUPA85QjD32TDu0jTyzen+sYgGqCtvQbhS6hUb5WZLDN56sNe4oIv5
	SGpx7juakN0kJSuapPq7ovhUrX9y+o6NdCcx51vJy2jqGlwWDFaV+UODsr4ZeEEg
	jibqbcRaqlUFrKD31i5zoMx8LcretX3HJfQV5I+6+oFcGZYY4ZdxCkj8t0yXBi3O
	SnrTFQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqghf0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 13:28:20 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cfd1227161so184845137.2
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 06:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781011700; x=1781616500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PK8zmUvBTXUruM9Ga4dY+eCgp8SW/s+tzWaRTY5T1co=;
        b=gua2nliOmLV9232rI28au58p9+ELWLmZxBN+EwIO6WRCB5LM1kZOol4JUa5IzpXlfI
         /hKxkgl20Ig2kZ4aKdTgy3qeWrO4d8pWN9c0wH5n5DhmkTeUiiXelwoCkFDj8XQIuV8r
         iPvf/s7He2DdBBuHtwJyamHEZHywnfMqTmypWHm+ZVbgzVGznU+TXvC6d49orn6F30SG
         BUqAYIkRQITqt28sgIPyw57EMpuyw5+wOx2MFgGpobXJegvoPTK8C+qJYwspWNxGQpVe
         ROASZcYTP6GD/4sGGTgir5Ws7xnaPDXNB/sO/56g1H1UZvQUGDLxTO8QE844GCDYdsNv
         +Mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011700; x=1781616500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PK8zmUvBTXUruM9Ga4dY+eCgp8SW/s+tzWaRTY5T1co=;
        b=YK7rbsHggxitltGsZslnmGaHcxuywj1tcfDn177Ny/ceCReAvh4OvinYybm742yKjn
         qhD9qk96H4fiznu42mYGirRl232picVe1eTf8KMiCk+XRrBizAfcdCHf7VRnf1oCMIX0
         UvUmVo2gW+wV90INGT4So79uOOHw4PP/LxOzryBeXGmle+X22P7tHXUcwqWcoiv6Rfc8
         7qt0AmW4+6OFm7ELJmVvz0FRZ1NdUv6ee/4n9kyEm1fzbQRnfHp9dQbEy8kEEb8Q9GAo
         oR9l5xxeEJyTpCC848CT4LiLsBvY5u0SNBki5KBzPY3V/kANS+EJo6FROvnT2AHSmEG5
         sLLA==
X-Forwarded-Encrypted: i=1; AFNElJ/pnn4hZ8rQdMUM6TmTanqp4x3jBz391ZY+4UgVAProW4+7Y24QhQ+EIqhIdabOB3dHRDVzS1i0TiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxchHk0lkO0OoSLJssdEmUP4eBKUhNmet6kQUL+4qQ0namwvBbS
	WXpvBiCWWLPuEi6hcMJ5OfU9LsRXCw9Nebr9fA51P3P5Vw2RieA9MNC5Au9Jp2kDqXY9uvpmdlH
	Pg42WElyFHO2bqoABZ8bdRpJLTAGJ34Ij0W/la4V6vVVAiVBbycvW/NxxU6ECsdY=
X-Gm-Gg: Acq92OGcMkQCIedLDtg/QQYGF1sBb+VsRI2LVzjr5RA9LYvBNhWuONT5sEwWZktlE8x
	VGcggb14EcBtPrsvXoM7R0BSpTj85RmVGt8Z+86SZ+olRt+y7bhxk5O95JV/jXfP6Yaddr8et1W
	jesUo9RT1rlItw3sckVcfrsOZ0bWnpHvUOuzFzqvtZXUsm7J3iInFm8BKFjKgTlmIFhE5uJ0E8C
	kydhI4T1NW80t0+0F6SAH4A8aYRJ1t7LlvJ+bcWvkvT53xWIYsdvttA2ROsK7qvia8+usKh45rf
	ZcMj7zQLub+BkPTLnV2KFagMbUCfMxwYaQ4pSDO1iXh2wrwwxnv5i84ORNsVuBWITvTd6Q5+aG3
	7coGHfhJDMJJnQ74nE5mjwYNTxJ/siP9OVYlRMPdq7KoOjz1LdWASy5y5
X-Received: by 2002:a05:6102:41a9:b0:62f:46c:40bb with SMTP id ada2fe7eead31-71925fa9013mr444765137.5.1781011699829;
        Tue, 09 Jun 2026 06:28:19 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:62f:46c:40bb with SMTP id ada2fe7eead31-71925fa9013mr444753137.5.1781011699394;
        Tue, 09 Jun 2026 06:28:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307ce3sm1038231866b.43.2026.06.09.06.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:28:18 -0700 (PDT)
Message-ID: <f6fc66d2-b40c-48a3-9dc9-bae849353e74@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:28:15 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add gp_mn pin state for GP M/N
 clock output
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-4-1522662b6c53@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-4-1522662b6c53@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyOCBTYWx0ZWRfX0ZI+tTipQ5Pa
 cNQLrtRBKWloYpO1B2/CmMCgSQL1eHI1qkzzJfnS3lAzc1n98LIDCKhgDtIR0wqv0kET1QRDkyi
 4jOr+lI8lwbk/uRn+Zz0awU4PqQgH4r0ZpQpUTy73XprcOLK/UsG3nG/yb78eKuCdAyGFzRlm6v
 TeE3EUTQCKVIKuUkG/GTQ6IoCpJ+f5S3BHraFmIf//o8yJXITdze9ladVGkQU3NCzr1Hv+ppobs
 RuPQSJh3KCN4Syyyq5GRKrs4rLjQXJ7J6oZKxc4KJ3foh6GXkdLE6+nugxKBXiu1Hr1Pgiy7ji2
 TiUsncvKLGLQJ5cCoiwowJhSWjoU4ThmxiPu+aSDc8UYl4+q/HU6eMzdIozDqTlRAmmKivmfYDB
 UbDEoyPsHRLFA6qPuZ/BrDTu6AEonq6wNYbiKBp2Fx26Emn2dU0TwAUgJ0JhwQ/9OQYVSbp9U4Q
 mruC00ANi+JUhBBtROA==
X-Proofpoint-ORIG-GUID: hMrq0i8zizcZOfTm4TST0pdpX_u1lFD7
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a2814f4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=a9V9PMWcc79cobRO0OcA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: hMrq0i8zizcZOfTm4TST0pdpX_u1lFD7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090128

On 6/2/26 5:21 PM, Taniya Das wrote:
> Add pinctrl states for the GP M/N divider clock output pin across
> multiple Qualcomm SoCs:
> 
>   wire it to the GP M/N clock controller node via pinctrl-0.
> - kodiak (sa8775p): Add gp_mn_active state on gpio35 (gp_mn function).
> - lemans (sa8775p): Add gp_mn_active state on gpio35 (gp_mn function).
> - monaco (qcs8300): Add gp_mn_active state on gpio32 (gp_mn function).
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Please squash the pinctrl addition and clock controller node addition
patches together (single logical change), and separate them per-platform

Konrad
