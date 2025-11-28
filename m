Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9527A30E85D
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 11:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764329634; cv=none; b=uXVHxA2R+mBSehwk8rhGe+KAK0mgnVDWCYuX9YazbNf9OFfS6O7CVEKwGxKH8Gvffe5+JvCkw2oif+8sf0MDulHnMQev7WDo70c2IIUOmSf9fNkMx4c8Ke8PJyP39W3GM289Ircxlxe+2bgyidiKI2AfnzMK2gBQ0OlhK7NeddE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764329634; c=relaxed/simple;
	bh=4kkSnxG+m4digg/hpRN0h8Q83kFbQ1ZkOzxmrXAtCho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ajbw85s4h27xTtnK8eHY9XScOBhoNnLzZ2Ga1zoGSg5CGiRtJF+1Wq4m9cG970VmJFbWl1o3jRNsYQOVS/XW/uqpl81qxqoZGUVbLeWLx3cxyvM0UMorrQpeEln590RvKHW9Y6s6VUy2L1x0ZhRYERUnkrDeKbwy4M5NWyl2YNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmPToKsq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BCON7uAB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmPToKsq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BCON7uAB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8P9WJ2986616
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 11:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7qnvNSY6l++wxUOc+tnXplCDf2RQMm05JLxYRX0NE3g=; b=XmPToKsq0oXNIpqI
	7Yf5m2W21ST2sprPwUrM1+9VN10j54OxR5nNbsI8sy6bTu5C6ypGRDKejX8dUmOj
	3RyiBA5o4/ehca6ZhXTNNjeqGpfkrg5V/b2EaCvtCRqcXqFrQ7zkn3JTD44qM4cc
	ePh4aID3mdqwHokjA8Yz0Dcw3KqJTLRG4mJzU2tvPRkaqJTJyCOtNOpLIW/zFff1
	H4E+Q5LfqWUW0eymcItPMkiPiNYNAhUpgyuf57r9RiwRAiw0UkvjUnSiLk/Zz+lM
	D+kbD/iyeOEIQUvCDkUwfg4QpHoo1aQE6UCIMvBMIGKGxZ5wzO6tx1lNTQOEPhLE
	A08ICw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmvxk4mj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 11:33:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2fd6ec16aso30990685a.1
        for <linux-clk@vger.kernel.org>; Fri, 28 Nov 2025 03:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764329631; x=1764934431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7qnvNSY6l++wxUOc+tnXplCDf2RQMm05JLxYRX0NE3g=;
        b=BCON7uABfMYmcp9/SH63/n+bO4yHQBHNpwpI4RtT6P8Dxypj36yOIRk/+TL3QlxQ2h
         ljyBZVpxWxxO/wjCtwOPfTDLY879NC3IxPLXLSxqsbaboB7m4yNhUTRfvm14djlGhk0l
         jP4eR7hFacSM7FpwpyXXtdL7SdgxLwBMlu1rqLUOvSejSWDFJ7CQC8TCThJDouW3QuR8
         8c0403mOwp4+Q4zYLyK9/inYBfMxOuxDUDKBnAtgppL9vC11k/zKlZ/rEecBA/SyaJC6
         D8fKYuk16wUCt/eAEe+dgyJs+VbFIFDWX2U77M/mdpawz/dRprvdM9GmF1s+xo+0NR5r
         PCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764329631; x=1764934431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qnvNSY6l++wxUOc+tnXplCDf2RQMm05JLxYRX0NE3g=;
        b=ImNdAdV2x4Spu39ZbAFmbb2Uamf4kV6LWaInI8b26CPq7MeoWT+PbCfnVzfA/yjOpx
         ZpqRMU+DYx5+ee7R90KSUYCqUFvnUQM+3lrdDkBULcuBlWqcjttGOnvL4aB5AG0yavdX
         yDduhaK5P2AqOFKO4Fe+RTELifxnp+TZrV4gVGmUxhdGXHGS6Z198PAHYNZXINBqiCST
         e7kJyUKlPjGzlxLi15K1r1wU/3IUmuhurqE1gXzOFKkqp2+s5YS3XSSI/sgR2O/q4exK
         FInzTUzPXx9F6oCnVw6kULgJxtZ9XWfLeF/BQ/ou8LRdN1eIeBiVuWAVFUWZfm+B7arC
         ksaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6yYn8JNnqcez6ylgtVzoDRLBkYRgQW+Eify3woAgo7Hf6S9ZqdzcFbJdU7GOznnCm/xSAcPE+CpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaL7Jc7GJD+jzmdj1da4RccDBxteoNEPutX4OliuqyCkgzlM9l
	OZy27Rmc7xBTM/XdRVtkH5eYZ/g19bKM/Z0dS4AZwZp4XQa5OaRQxttgz8XqH3V0lr8S6SSI7DP
	Ec2oJytMnJMCR3j2bNN33ulaiKP8SFWOnXGg2fRgQDwp7rvU/igDMCv/axlx+blk=
X-Gm-Gg: ASbGnct25FnLwixFWh1e8JwvRlKkVXbFp4GUX806cUdDuyn2746MYZIjahVBvVcHjMP
	/tsJdBGShLHD2yL0EXVZ6im1mhi9oT8u3XBm2InsV1XEoHcocYCByEl26l+Jb/MgP0TOrngmvCg
	5R0sBUA/1N8VaF7ZZOeoqgsmjAUTadtW042Qf43RhQYfnL19WSEO6VeLwPY+dSTNcExfiqANEwp
	zYh8YYznjewsv1FBCApUZyITNILe8gbuVmxG3NXXlwM1LEAZ3bBYgZPdAykpCFXJkQ3zKGDuLlH
	0gQj+C+hOvBRTwZj0CLCziVp64rs6ReG2y6Xu8eYr+4IfYK3MTNw3OHpIiNmvvembat06u7qtKk
	xAg/cdeqQnLHBHagbuJsp4HJSjgDFttfEA9DSxflrpD7e9tJ4mwtbA7e3aiau4DyJCwo=
X-Received: by 2002:a05:620a:1a24:b0:8b2:1f04:f8b with SMTP id af79cd13be357-8b341d19712mr2575207385a.6.1764329630762;
        Fri, 28 Nov 2025 03:33:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEv8S6uIv+QwZ60lOKqrI5e0iazvmdLm3BRp5BRT5DnpNRUvlat/SlDud2WU9guvzLSXUU/g==
X-Received: by 2002:a05:620a:1a24:b0:8b2:1f04:f8b with SMTP id af79cd13be357-8b341d19712mr2575203685a.6.1764329630342;
        Fri, 28 Nov 2025 03:33:50 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751035c2fsm4119499a12.17.2025.11.28.03.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 03:33:49 -0800 (PST)
Message-ID: <2edea260-076f-46a0-b2f4-cd4193011167@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 12:33:47 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq5018: flag sleep clock as critical
To: george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251128-ipq5018-sleep-clk-fix-v1-1-6f4b75ec336c@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128-ipq5018-sleep-clk-fix-v1-1-6f4b75ec336c@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=6929889f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=yoN80CkuiwKY9Z6PWDQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: _4nXYQlaTqlZw6d59fc2J7rc9MqiV5ek
X-Proofpoint-ORIG-GUID: _4nXYQlaTqlZw6d59fc2J7rc9MqiV5ek
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4NCBTYWx0ZWRfX5eqFgz79n1q8
 FmWrwBfd9brJxa+NeJpPcTMSVBrNrbNukSAtrmlLbvPqwVFvKWlsKxEPzVGq047WlCe83u040KN
 Q5bkXCMAPV3uduTgXJaWxJm3ec9lJUMU8EVMSDRGYy0dDgv/XZTVAntM8vLkRL9I5776fL8FIA6
 MX+ZPF6S+xKzedy82Y14VrT6+NGRTd21V64aQXZ+NWK5jEc1/F7oSfjkq0GCGK5V8eYMnEqeblt
 ey4aV1eZWNZ9/qVA0WSBIPCKkrweFwAHy69hQ3Wk2a0uDzCEsiG8HLXiFDg3uIxmuM2VIFbgWR7
 0RSjOr4xl0KqrWl8Ez5WcvdU3k+8dKOIDvfkeCU+RZ/MRp7r1lntz8+9BOarQgT7M6PanyL3yzf
 hf1IfJw6RrHcI9dHwIuYZW9IR1JQMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280084

On 11/28/25 12:03 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The sleep clock never be disabled. To avoid the kernel trying to disable
> it and keep it always on, flag it as critical.
> 
> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
