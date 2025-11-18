Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650DC347FFE
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 10:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763461921; cv=none; b=hPrvg9OgGBrsCfKEKYsX65j9BBLo1K6yWiBUfwswEzpdx6fYtM1tXaN7EpG8DHVN5/zTK7hT7vkdDOsuC9tPwy/nspKehiA+fMyNeL7zpD4CKLilRFUSSji99SudDbHSrEaZ3z3S/FgXlVtYr8KxFAAPrutgojqwHBRYqiHNmHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763461921; c=relaxed/simple;
	bh=RfZm9aKl1NjMxKyOCQg+4SEjvwVpRMYv2mrcH4ZNFDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8j2cBQBO9WpaPY/+Vo4003OlZsOQvUPkFCTExSRpxhMBGha/MZXanvyVkIcXBsAiWkT4KHVcmAD+k2gGdxbGDSA7r9ty+SZSN6+dJuWQq/ZaJBe5w4a923FFQcJ97nI6Fp1BdXjusWHxUkQphryRIuFEUS5FmLebqGKeRPCmSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NyTfH/mX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XmMbQ+Tk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NyTfH/mX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XmMbQ+Tk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6fQHD2272050
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 10:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fR7x0kFz0S+JBP4vbyeBal4hny3WSPiyeEcYELp4NhM=; b=NyTfH/mXnnzRlUpW
	/8EaVfq2RmAGxcf9s0qkoKmjM6ILtC60bPNjradasrc4K2wfRHi5qi2GKC8FUUv7
	nxpXN8WyX2NY0u8SVyIGebNFg2QFtEFdpdittsjjDl0KH85hn76n49TRtHCeThis
	ZO6a56ekneI+J28CyLnqX80coK98h4s2I+gNuDOlquGI5W5QtCJOqr4/ri/5w1ng
	YHmBobxjgx0FtJDPz4tp8TYHbf1uJq009wk32chcO89l4OYzgY7awOunVORoYh5H
	h8sClrJCNqb758q3VmtDc+HNw0ZuhQjp+L0feY83ualA16aDYZQkIaog8DqoMV8k
	LxnTcQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agkrmgpeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 10:31:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2982b47ce35so61904475ad.2
        for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 02:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763461918; x=1764066718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fR7x0kFz0S+JBP4vbyeBal4hny3WSPiyeEcYELp4NhM=;
        b=XmMbQ+TkdjSg7ftZ3xxejMO+y46e4/wLokz2PQnRONy+DJeMP3RpTgYj2fNanZNK3u
         T7UJeRZaQD6C9WLwiRSyTQZNEsfMpFZ7f7O05TUnDqB4r8aD9I4kf79I6flLk6HKi6Sm
         lfVjXqTWVtkrMDrWCv78FSOHW/7OGGQAKE1xfmX3Mbo2iEPuYCpbTibiSGI2QVRfGt7s
         zm0HWbiyJI5zsZOANtb0MEWMmxLMOpQYxF5i2+xDpH2nWsxY3qpR+q134PF5SpGCRhdv
         Apcv44flWniIYsv56okaM6PYuxyPuWVpGsq/mP9dpT00YrzrX2Gt/0LsBUYBxMFSQbtI
         Wm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763461918; x=1764066718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fR7x0kFz0S+JBP4vbyeBal4hny3WSPiyeEcYELp4NhM=;
        b=oOL2af8V3juJ1l0D0DAS2BH1++FmOCvBoOSAKKfaB/bStagG2rnirWzGIIFZ4U8Pis
         cwnOC3detz/oOorW+AEYmQVF3z5jaokFzT/H7qiqL/XmrqTHWIBl0ww9DBdfvnomKHKq
         0dJH5JSHw/+k0o0ahQg+DW9XBw6ZuFEIUQDbDEm/eb8S7tpPcQW9g48/qEmCVY//piq8
         IfZJggsmp+ojBtCq+wI9e2yXzl8vH++7239KadaMP9nSDlFudV4Sw8/9hQt2lsSRWBNq
         RowmIP9HwjN41+emUK6hiB+f09EW2i43bEXDuDXgOY+0JQyj9S4XNZj912gYY415Oa4y
         5Vpg==
X-Forwarded-Encrypted: i=1; AJvYcCXpg39Xh/3LX0m9p02UoRyLlchCvnWpZ7cRwo59gxBknlPm8j2jn6aMkCT3ZkNMqj+dAMY0LcRVvoA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRclDuS7tloJvF0YsFA+UXOUfjg4g+SFYolRB+24/On6uyXFMu
	owrmsqFTXRgwARAGbHZ3Sy0RPYaVx9eLFbKcYPMuUoDhmB7DqjOfi3HO4i1iFfpftUCSMWV222p
	MNwYRNszXRr1VTD/dtaUcV4H+x8RZJ08f6aO5Yfwl2JbBAVDanVXj/iB1IVfqzfI=
X-Gm-Gg: ASbGncsH2AqkfoY/gy/holiaJ+jK3B1x4tARq2j4E3qRz4IgaXoICr17KMrp07MXzbZ
	J//g7A+5BaAfqMMSttKB2UNIF7K97GLjhTuT0+F/dTiM6XYvdqrnaWm9t7zPT5cg4WE6MNvDGs5
	NpsTzQK2UI3GYK8wVDlDUgR6dCIeW7d0hWyp0s1vFEYGajsErNy82igXR8Ds4BvE8dEGYyWOQ+3
	mP6u/59x0kl1M98RJn1kapeN8xtMTLy5+F+kbUr56w+/WdTIadnEaxjoLzyIrOFs3GDT+XdP5Bb
	s1cYFRk0K42ou90cz6HcvWFGcvbCHMmcZDRWYVWD0s0uOlsQ6mtFh9NRThKh/EIPYvNv6fila1I
	txZtcRWA5GaCChhqU+RcNE2+Zlg==
X-Received: by 2002:a17:902:d4cd:b0:299:dd98:fac2 with SMTP id d9443c01a7336-299dd98fe08mr99139225ad.54.1763461918311;
        Tue, 18 Nov 2025 02:31:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzq8B2MXbl1pPxPLemh3fklf2/A5DSGVm1kKDAvo8dNVVqRFeNS/BF0AI+yuhX93bBja4Saw==
X-Received: by 2002:a17:902:d4cd:b0:299:dd98:fac2 with SMTP id d9443c01a7336-299dd98fe08mr99138905ad.54.1763461917819;
        Tue, 18 Nov 2025 02:31:57 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d91sm170294015ad.63.2025.11.18.02.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 02:31:57 -0800 (PST)
Message-ID: <6fe09872-368a-4bab-96c3-c34492255599@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:01:52 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] clk: qcom: branch: Extend invert logic for branch2
 mem clocks
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
 <20251118-sm8750-videocc-v2-v4-3-049882a70c9f@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251118-sm8750-videocc-v2-v4-3-049882a70c9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4MyBTYWx0ZWRfX26gm2N2SuZ2E
 lmygvmjKf3Au2aqpYH2mgwntS4OvQGiThQ9BsB1cSS/Z3ifuvhCtYz1kzHfp4HlSb8jeYOIcpGw
 bJgPsJzOh5ilKmq+XXyDteks+VKI4mZRa3y/tDtYnNAe7rToeKDEx4WEtf/N9g/zof323E1uh4P
 90Z1pbyrl1sYUynp0iVsreoNHu2FpwgWVGaU0Ua7KvTYQ9CrHZ+OQOxu28zuwZKH0bz0GdXt3ef
 qYR6kJtZi7Zd8k6jRJ6ChBWuqmMzLs7ix6CNN7HfwV3+DZNF6bbIgM0TJzz+EcNyS7i9fxu6/rv
 K78C2hHgtkR/sWpGCVLNRXMfOfqoxh368W8cm+2bnW322UcA6l3rf/MD0JJQR9arhWOqj7PKo8l
 0GlrSYT0dd9qNqgRNs0bqBkm8keUUQ==
X-Proofpoint-ORIG-GUID: 9jApQigd1bsqAtWaae9LFQyeOopgF1I4
X-Proofpoint-GUID: 9jApQigd1bsqAtWaae9LFQyeOopgF1I4
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=691c4b1f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8EbF_sMYILjvT3iq7EYA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180083



On 11/18/2025 12:47 PM, Taniya Das wrote:
> Some clock branches require inverted logic for memory gating, where
> disabling the memory involves setting a bit and enabling it involves
> clearing the same bit. This behavior differs from the standard approach
> memory branch clocks ops where enabling typically sets the bit.
> 
> The mem_enable_invert to allow conditional handling of these sequences
> of the inverted control logic for memory operations required on those
> memory clock branches.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-branch.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
