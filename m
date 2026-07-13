Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FBA40756E
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 12:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944893; cv=none; b=tfHXPzHxydFt/YOpXq/ds91pYpiuVgdBZM3nQRgZtFGPGIOFLGm2QyZaLgROXkuU/42uqG1cscAo37H+N8pThpdzSdr7ekuX+i9E+EGB5IVfL+mrn4LNd6JVR9DH/SxEshmKJxJ1A5MC0+Uusv53GK1XbCxsGo0ktl5fvnIeAN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944893; c=relaxed/simple;
	bh=b5cPk/8TTFRh8c69aoCwpRLmg547F0aWw9DtTVQXef4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qusxKqjHObV/StxaCDdJdKV77fAwxYA20QoB43yzn9U7gv8eNozGIasGP/QZdV+e8hjFewaHjO8EcotCe/Rx+DMHG05HdLpHF633+2QeVoqkVO1msZg/CVf3hJKwluBZxBhAjqT9hS7CzRdiu1CMc5JKg5ohvDIYizK6conIvNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TK40pqQi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqy/QHWN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TK40pqQi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqy/QHWN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEHQF1516682
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 12:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JyxSXEtF5jsDzlt/U5zJMxAHTaONNDF+J4xpZtkdAOE=; b=TK40pqQinsRDQ9B8
	WUGGrb4qX+0zlMucwIBNV6/edXG3PF9zN+9PCtFjZWxzChQEl5jUSwrh9iJc3e9h
	XCTFbYxB1IcfCBTuGAzWDgdgNKWRuIclWZVkDw+FDTu+TE/DYoqTSUMllOwm680Q
	BnG4A+to5fmZx63ljS9hk65zMHXG6qiIgYWQawsk2NDW7cqwRLdXa2SmQdSOS5ZY
	DmeB4aH1MLQiU4Jbux0BxIDcoKPni3LdQcgiHkOpwS1gXyUwZrA5+/F9YONuSq75
	Ngf0YALRvBjxX8n6ZCQ1ipb0obrjn+yirMGYEKyyIoWrQE7pkHyLdim8hcjmWhnm
	LAHT4w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubss3v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 12:14:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee1ec30f2so3710935ad.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 05:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944890; x=1784549690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JyxSXEtF5jsDzlt/U5zJMxAHTaONNDF+J4xpZtkdAOE=;
        b=iqy/QHWNq0347Cv5x1phYaGrCBBDEAoDVgPcYKP0H12CDjT7bH7ULnEst9vbJoxrdz
         gUUXfmEaNBAVJTcEof9Eo5/fHzhx85eFam3mkNhlRFZXp1QUpV01m6rKSKbzPNVqRahz
         urjA8B/m7ZYpf06vfvw32QKMM3usJ5QkSV0dKHgcowIWrgPjx5XYYQrGKn3B1H3sBBr7
         fqxWcVgAfrIVr4X0BXOaTbA2Zf2stSu8boULtvD7orYGjUnZ0F2Wq3qP3kjqfcZzUpOa
         IrLliMWiGznPJQ2YgdTxJZP0B9eXVQZNTtHcGjFAwxEMb95G48t+twA9dDa20MJNabuK
         TLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944890; x=1784549690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyxSXEtF5jsDzlt/U5zJMxAHTaONNDF+J4xpZtkdAOE=;
        b=eGlPpDvQ3GuaPs+z8520qMpxFyYWRTtIYIbbQe4HK6fAk5SlfA4r/2Mnnt770M7TF3
         DlBbRYtCupHmnQVjQ0EYRMooSpDg8Y3yUaywwA3QVKmOEs1t+7THEvBGLJvBQ2wrjrJY
         JrXRCI9MGgpqxDrRTdPFbsCEBFNY8ctsd3r4iVt48x5M5LJ0+Bbq6LIeoanSn4Leczsp
         lZ2HgJJfYnaENjK6X+k5XAUX8mSBGfTKZFHnDhvlDqRDfqorkChTaXs8KI/q0KwVtiI0
         UxMsp52Xww1QGlCEkJwonLfod4wu1PkE40CUMQdv+44CNc++mOuiz+a5bA4t9KUeggJx
         5bhg==
X-Forwarded-Encrypted: i=1; AHgh+Rrwi1TzYCDUzQmUWXm4IcNuMUOJXGLeJ7stJo+g0jwhyP2r7ThUIFKwCsOEaTniZilYB9eZPpeFYEc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqvr3XjV4vODJ8yagOcBlbYX7H34yMbJlaX6r8semmnXveD17s
	Q9u2xnb+edKAhrcbv5sLpE96fujwBMKRHsgPZE4pTkHfV4jsF5Ax3ZZ301YljhlyotFSuMWApyc
	EEcNjsTmCM9HAifBCqlU2t3uXfj9dIUxk1K1tEU+D3b4HZqxvD6k5zzhhtO3LBgw=
X-Gm-Gg: AfdE7cnvf7aZ8Uqb6ALyXs+c11zGkcQYDPtWtFAJaaevxXl/UG25ALxVtUrg6G8J3qa
	NT8YVuxD7SJLsSS2BxH7+CZVArRvGChVhl09W9o8vZ9FCbSVgPIRnTdPM9Frx74PjVQa+KCCoim
	1txiifpE1yJjRvHfKsWdpYO6R3OMcRhRMNaUe9hLmOSuHBUfw1Ffhhrej2QDsEqZz6OMq3fk7Qe
	TMxX2oeKKkM8Ll7R3ZRjC+Hb8Hz3NfDYDraUtk90wTfsy/kJuX7T5tctIj5IfDbWccdHfbwSUaR
	4XurfIdfIRO/Rg4C0X091n+xKU2i4DO3KTiONiOwFeoDNx22nZt/On2iFB7EBX9ZrcTHDuPMO1W
	PJbxObeApIMx4DKyMVXIRCp+U6M4/OwEw+/6PNA==
X-Received: by 2002:a17:903:110f:b0:2cc:aa36:c04c with SMTP id d9443c01a7336-2ce9eae29a7mr87590485ad.1.1783944889575;
        Mon, 13 Jul 2026 05:14:49 -0700 (PDT)
X-Received: by 2002:a17:903:110f:b0:2cc:aa36:c04c with SMTP id d9443c01a7336-2ce9eae29a7mr87590135ad.1.1783944889099;
        Mon, 13 Jul 2026 05:14:49 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1ecfesm98917475ad.47.2026.07.13.05.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:14:48 -0700 (PDT)
Message-ID: <23f9caf5-d992-48eb-b41d-75833770f4de@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:44:43 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/19] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-19-cc13826d4d5a@oss.qualcomm.com>
 <3ad818c6-39fa-4b8c-ab82-f5cce6743cbf@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <3ad818c6-39fa-4b8c-ab82-f5cce6743cbf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54d6ba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Kcuzh8V2oFltqVObT2gA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 3pnxoxs1PcDM-3L114VK5SFrNznSFc8V
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX4yIxw60CrMks
 H75Ey+YsxLC7tYjcZAPSnlfPSUTXqNqNVuE8xUsTDp9E+7AVaz9E442c80IlfN2GQZj4fXG1em3
 9WYUDXqghcvi9b+NvemLseNwMhdlaLA=
X-Proofpoint-GUID: 3pnxoxs1PcDM-3L114VK5SFrNznSFc8V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX+ehw8tFp140t
 hMiqdQrA1qfW34PwFUZpJyxmF0E4e79w9xi9IzM23n1pMjgcsF4CO/pgvzNjqE9jyi1X7zsT6NU
 v0DJxXeLE/H9ZPeIW5WPfdL0JcWwB1eb1FwhmPQl5HUvcuMQo5zDTOtqER00mM7uSHm11mwoAiT
 HjzvCbrgaTqixVelVSqS/X9EelIJMbQdbZM2/JtxpFw7TJPu5YgQit2UABkcW/2rkMIkH+V2dx/
 UjB9SgkDGM5yZbJIc/QxOqHGwZzYomtyxaPwnPUXHQl0jYoLsex0eQQCvnrNpdHwZPctN+lvnrP
 jJphLGaDv4YQtUNgACnlBje8zwgR8zLORdKS5GRT6nMQLvjl6Puvvvl5HEl+F7/CC+5mz350ePX
 NLE29CmZDgdA5/3ki3LySs8QbztjlOdHIuGm6lni0F+hp4xvUI3SuQooaEdbUwmkSreiJ2gaoTS
 4w6lLGzl9AsiN7MPDBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130128



On 06-07-2026 06:30 pm, Konrad Dybcio wrote:
> On 7/2/26 8:31 PM, Imran Shaik wrote:
>> Add support for Display clock controller and GPU clock controller nodes
>> on Qualcomm Shikra SoCs.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		dispcc: clock-controller@5f00000 {
>> +			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
>> +			reg = <0x0 0x05f00000 0x0 0x20000>;
>> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>> +				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
>> +				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <&sleep_clk>;
>> +			clock-names = "bi_tcxo",
>> +				      "bi_tcxo_ao",
>> +				      "gcc_disp_gpll0_clk_src",
>> +				      "gcc_disp_gpll0_div_clk_src",
>> +				      "dsi0_phy_pll_out_byteclk",
>> +				      "dsi0_phy_pll_out_dsiclk",
>> +				      "dsi1_phy_pll_out_byteclk",
>> +				      "dsi1_phy_pll_out_dsiclk",
> 
> FYI neither Shikra nor Agatti has a functional DSI1_PHY, so
> unless you're worried about some incorrect bootloader version
> toggling them and want Linux to clean them up, adding them is
> no less than unnecessary
> 

Sure, I will drop this patch in next series.

Thanks,
Imran
