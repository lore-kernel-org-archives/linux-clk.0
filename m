Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542D33D7D89
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 06:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781591483; cv=none; b=m55Gubtz22Lhn4iLXnSCfNuRkdqmQrtwC4H+SLVRrsYBTbTEJ9TOp4lOHX+mRjj92fp6tLSykP8htogwpQygZG/ffK9dBbKGTJ/WHEqxIFq6TwFvjf4XMroxm9jELRzkl1QkBGQvb+apr8Kkgpb73uxak6V7P0akNd9RjV2dYoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781591483; c=relaxed/simple;
	bh=Z3e0bPPQznJKnX39huZA4pkckZ33HDN4xXmZ1W1+BLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EQfCsE7y0kRuZjy3oXkAgj25OQXeoUSjvbQfqVuygIr+CL0wEB1pOieqcB6lB0fTGM8RhchERGSJ6nJFgE+vsYftw5VqkQxcLYUkqkZ+0PQNK9vqrquXqJXK+WUXPI29LC8cp8O7ef7vp1qMWDy6vd5S2JgBVFh8igdbTncCRBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4E1uGa9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKGhLgXN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4E1uGa9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKGhLgXN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G64JYb850400
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 06:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+afTUBDbAZT38BV8Tfa0k61XdJA619HVug0gOl4LXSI=; b=Z4E1uGa9F5rkOQDC
	PQ3A8daXDvRcbnk8ALP/AnW7KuB9D0u9lo0WWSoDsPyPqJ/VLKlBWL/KtXbsXwrj
	Do/7IKI7mR5XtP7AUHUFn9yYNxvAg4fpFwWov3BzVzkxCUs4p7TffcB5oJPfgzYx
	VRhcdTXyQb0BKsx+lU3rh3rlNwVCFBgSFTCAvr0vTjKKZMoSJ1MfLHeqjyA0cx5y
	KjjNt29dEHF0oxNcMk/mVh/scMlBpNEY4O9nuzFFGfj5iqMYEeypID8gjrivYori
	HnOrmcJp3z+cxZtsMaKt1kAlibI25GC91boLFomCL1PhX/hOCGVNvMaFU20dYEaw
	5/+P1w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete985cp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 06:31:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6a3ece0d8so790725ad.3
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 23:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781591481; x=1782196281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+afTUBDbAZT38BV8Tfa0k61XdJA619HVug0gOl4LXSI=;
        b=AKGhLgXN44OSPXOvwTWKvlJXTO0CZm3ryOkjeR5qUEAx+fRXso5rufINxzUJUtKQ3S
         xnd7BAralz0Z6TJ+cnnS5w6/I7ew+QaNRBZNVMaL+zyMLH1HMF1f+VXZpRHwv+1lt8Cm
         boRsjjE9j+7eC1Dpcz74UTq/8ONoKm1FPpEP8TYWZ/meCoxTv71gCnj6H+x9qt6FL6Oe
         vyWe37lZ+SsYQ7NxxUwfmPedU/d4CW/+IfMzCsYPVc8Ap/X8X2RFYyuWtnbFkJBMOHLE
         pV9N+7XaC65BkdCVRDR493Xa6uWW700rTqdI+b/68wBSJCtD2i3ny0pMSswVfJ0x2UGj
         yHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781591481; x=1782196281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+afTUBDbAZT38BV8Tfa0k61XdJA619HVug0gOl4LXSI=;
        b=A/2Xb20lIY7XLatbDDXSmJf1TExSQBfrmB8eRBYyJtWkBCh9EZsXfwN8Kgb1tJbncM
         mjqm956KHdVNT53SQn1zhGH91090eYUrgx3xIy27qpcyjRQ4OK52rSv9Yd5yFob3eaAX
         1GkGWJP1WETm8ZzhG/fnT0avMTRF1xxSsPYaetg34V8+QF4sfABMvW9UCBZQDbGtiCB7
         pK6gViMw4v70IoDgSkLWBOj7PIikloZ/EZ6NNQ43xkU08H7lkkzt9bVKIBEaQbG92V3F
         uOk2cWhr58qCaqm8xrSAiHIlsRj4BjVbJkv0ZWIWfk5ebiimoA3Ds0fIMRo7Eqj5+0ao
         3dzA==
X-Forwarded-Encrypted: i=1; AFNElJ9gLlRXo0bmN9U4NbxTEq9bk6vSh1x9B0I6SXyjXhftCBKNzq06fDBIUVsSGnPKZippjKKs0IR1Q2c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp+gWKwh/jQP3KQVCRqv/lTkNkFRNpQ7TLJyTcqRLRAJymASLz
	sy4nl/WkJlhX5M27ofcWANBtGX19GukCUZHis1VhzV1KQyhULqsYDBsafoN7ywqKmEXcE4hM0r/
	kHdl3fSJcjbd5obzC7ItlD4DYcH6YAdBL2IQMOa9LO7L63wbtUzdQ9v82tspiuaY=
X-Gm-Gg: Acq92OFcL4gb/m69U0F69r+yIwEVHq7kopjtS4yTscjncR8DG/uGK0yES27t5xvnWGO
	h6KC9H1+qOmVep403CicIHgm9jYFb+PifFrVJD5v7FXphlWc4rVYYmmlXhqOFZMYQYep2CfC4KD
	OxavryqxFn1P4tzmUh8uW66+7EgtRm+3Wcim+ul9QGRpzCLrxKKOLh44zjT1RhPccTqm+lJi4jz
	IWvc9A830qqsyNjiH5lvJzlCNQ7jOUUkLkN0otJVWNK35oYSdMBDzhQjtMyLyn/JF0LyJPnxtjw
	Y6z/X1K4/9hnj+qIVa7QXIbqmAODiLI0dZlemsmiBgxlNBT21oe59GQAWGzKA3zlRyermDgF0SD
	/Bq/nCmGF/Vq07eWLKCmNiQKOslWkD17X5SQLF32DglhDD9PvYQ==
X-Received: by 2002:a17:903:15c7:b0:2bd:606d:b339 with SMTP id d9443c01a7336-2c69a186b0dmr24362305ad.21.1781591481027;
        Mon, 15 Jun 2026 23:31:21 -0700 (PDT)
X-Received: by 2002:a17:903:15c7:b0:2bd:606d:b339 with SMTP id d9443c01a7336-2c69a186b0dmr24362035ad.21.1781591480606;
        Mon, 15 Jun 2026 23:31:20 -0700 (PDT)
Received: from [10.217.216.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519f896sm10860067a12.23.2026.06.15.23.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 23:31:20 -0700 (PDT)
Message-ID: <15d5bcf3-6b82-437a-beaf-7a392179c117@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:01:14 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Add EVA clock controller
 node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-4-b61c7755c403@oss.qualcomm.com>
 <b926f503-05f7-4d9b-98d7-0125b106c512@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <b926f503-05f7-4d9b-98d7-0125b106c512@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a30edb9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=WANKC8lrEroQgd0tMjcA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 1hvRU4_A8eG2yl3QjRbDOXrEA-N_XIEm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA2MiBTYWx0ZWRfX3jW4zkmzoEZB
 PYvoHMGOg5O9WQGH4yW/egHryInxHeVVZlg2kEuVX61haBPXh1FPXoDuvYt7GWC8sLLY+9k6CdZ
 n8DFzqMfsyr11gZ5/Jhenuqtzgldkfg=
X-Proofpoint-ORIG-GUID: 1hvRU4_A8eG2yl3QjRbDOXrEA-N_XIEm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA2MiBTYWx0ZWRfXwOeLzp4mrxHP
 4Xj7XzIC4TZcC+fu11de8xzaq63XWoLB/XxmbEnHXJrDHszITkS6ePC2+QUkvEN1NrZpjx6/r7T
 VOkqNqlFds+Le7MlPm248nbjg9AA3fOQwoU4Cpz9kivLgqEs69uHY4fZrLr/G+eHPHrAkzKO0va
 B6hdxfNc6ejTfcTwNo3Hj8sno9jgGSvQv0s05ebztWi8n/qTyN3eLL0RLuDmen+Vh8J65s83iVV
 5tL0k5Wjwvmmm+o8TkfWFP1GmF4n+1EQpWwpnOL+ShwHAWHc0rB2pGYF6TwOJw8wmjyf3B2zVYh
 hJyz6VdxVEfA77WnFT5avNp5s5ud9EYPEaXrl6hDpVOM7tEL1ualQMkAaGIvba3hCy9GtZjocdA
 42r2WViKxcr/vhMTvVNSpN7GMlcpYmNbQ1mLOr+7iFc7boti4o+VQT8AMm//vjC2gaAGQj/hSYL
 Kx5Ya5oXR9iAkjI09+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160062



On 6/11/2026 5:30 PM, Konrad Dybcio wrote:
>>  #include <dt-bindings/clock/qcom,glymur-dispcc.h>
>> +#include <dt-bindings/clock/qcom,glymur-evacc.h>
>>  #include <dt-bindings/clock/qcom,glymur-gcc.h>
>>  #include <dt-bindings/clock/qcom,glymur-gpucc.h>
>>  #include <dt-bindings/clock/qcom,glymur-tcsr.h>
>> @@ -4804,6 +4805,24 @@ videocc: clock-controller@aaf0000 {
>>  			#power-domain-cells = <1>;
>>  		};
>>  
>> +		evacc: clock-controller@abf0000 {
>> +			compatible = "qcom,glymur-evacc";
>> +			reg = <0x0 0x0abf0000 0x0 0x10000>;
>> +			clocks = <&gcc GCC_EVA_AHB_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> With the XO_A situation resolved:


Will remove in the next patch.

-- 
Thanks,
Taniya Das

