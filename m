Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAD2282F21
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 12:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338650; cv=none; b=q5yAo9XkBJpkCa08YeP6uODhJMAJ4kKtJ8bhTLQj294G0MMqdBm8GVI4PCzqaU8BlPxoS+XZWXJ9XXkpca4g5VVI/rDkF6uLJzibpTtIlgMVoaoDvTXNP0bIAmow49FLcQk9DdKcb5sV1UNXE6HHDrTqZVIQtd1MYZGZeU1VN5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338650; c=relaxed/simple;
	bh=pOTg33rrGv0PWyC/4cqU59Cnn4egrKff2SvU8hNM1Gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iSKluY6bjsac4FgxpObt4BcILIhHlo1w+yL2WF04li/o0tpeJh0ny94VNTNjMPJF6dYfzZwmFqMkix3NczUxq/7ajtgpaocmmz1ry0aAr4DmxJbHVA+R408wH6OI5gnMRizIJ9qds8CPs+w+NUyWleW0UHLVoAAkYhF5gOMeLB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fZlYqEs5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aiJOeB7R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fZlYqEs5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aiJOeB7R"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBLcGt900204
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 12:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dvum8f/F249YZIo0q2vmJCMhfniVn8Gm1B/edD2cHpI=; b=fZlYqEs56Fkldity
	FfYQxfvmhoz5zHTvs9OMRfXABK5iLRBRWD45qK1pVAh7BzQ8sIGSrIt54jZkSHt4
	RjI494lWcsLYzcTyso4KhC+7xJCEOv3MqNglOMDlFiso/Ulqx61xVgWRaI0gsIMc
	3GXdAa6IQGoMo59pULdj5EjLvFhNBBTG85gqrHIsWDcbLbMTbklssDVYJw+pN7fV
	UtbMkeip6g3Me8ykv+5I4mFPRPIELWn3aBIY/SSdWbRcrl9ruxx5eR787gzrIvgT
	WpBr95EfDSL1gDdS4ROWLh3aLYU8EMV189Wn+5UoisAq1Tnqlv1LjWBXKzVGhRom
	AFf7RA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr1004xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 12:17:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934a8cd3a8bso7089885a.3
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 05:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790338647; x=1790943447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dvum8f/F249YZIo0q2vmJCMhfniVn8Gm1B/edD2cHpI=;
        b=aiJOeB7RrHKLd5Y0A2tvKjk5WNm4eRvEvg68y18ZszfEdFofcOOfWcz/FVJc1pT3xF
         H8M3yMuWuyjZp0S9Yws4/t00r6AuYDpAhstfTxxkfIKpd+B1j0eOhxCHdctshdewlaZP
         3VB1vlk0JhLdcNgjI/lVfkeavgG7d8vdPTSnwJ83uav8ZaZ/kQZcBueSQjnJNSbMvwHk
         LkcAEFG+/6jYZrB5VmMA2P5WY7xFpMDQGpUgbT02EuWusPywqcNKUYhpyvymYeTqRYCf
         LT/OO8PqYz/MsJDYvo6ZqbZulk89sXUGFhhnlb+mYsiK/9m59uGAorFd+wUNI0I4Mhdq
         jIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790338647; x=1790943447;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dvum8f/F249YZIo0q2vmJCMhfniVn8Gm1B/edD2cHpI=;
        b=I323sP539/l3HCG0RxGT9qbmC9tTArkHcRQLBX1EhyCE5sT5CCp92p8LzpYtk1gEsp
         hSaBE9MMhpH3hsQKHmhyXi78hR7BJJOPCmI/cGCEG7D8KxMtpYuVTyF68fLqZnDoB9d3
         B3XUnd7XUhQNfo9lo6yEEMsJ8rbUFZIMatpw0sHJZqM3NoPQqGGhe6BNrNmjcrBEHwRh
         EapRKj+hkBnQxbKsesTTgaoZw1LsN8T/7duz1MXc3hZ+icENUWS/RP1KWViaZDHRODev
         N67P7MbBZcDQOkkhlgoPjehNqx0LkXpUCpXFbtXr0m68jjr1dw4VPamEHnXLK0u0irf+
         O7mQ==
X-Forwarded-Encrypted: i=1; AKwUvByVDVZEB/u35ruQNJEqGFACJr38hL/fkXdma+kuCCx01yRG8byzJsq9C30i0nYQhvkEbsG0QU8hL/s=@vger.kernel.org
X-Gm-Message-State: AFuF++nPyVvDpAxlJ9hpb4EIOSuwsXbtu63orty3bixJsKUAnsSW+5FP
	34HCdAervpkhRD/YeScwnbibfdcZEaqdAyAiYFBSTTcSoRul7AV9d7Phk92VWQTX6AuYveNdc6U
	3GHeQYnuD3pXppzTLQ764+AQa0TNyTSAo2dMpD7IBqx83+jBHKQzP2uKjz2TipwY=
X-Gm-Gg: AYBFou1YzEDQ9cO9CRMjf4t1rSfRlISyD+QOmFjS4mHKsGSRQAK1oTIpxOCitUm1aK4
	pfFLhi6SseeZfHIH13qDj3WfBsllcD5zglYrBbTtF/F1h1UL+i9DfygL2EvuOmVuHpz3zSCyWCz
	MgxL7111zEn3iEvsFfudihMFAHxaP+ezD9KjSVGEtu0WJlXHqNPdP3yhGLy3TR4QUb0elfhAbwR
	9ggzZ59uk4IcbjZ/n+e2pabevA1tEpslhcoA7K+ZTfzRrlHlpAOlz0XSX+O8xBJ8sMQv6zWkZ5q
	Xl4E6jRj612jDCkGMbAmcU11bhItI6xi7YbXpxS9RPyqUUKTEerC6NTQ7ZUeLSFw9B1e+66i/y3
	17TLifn4F7a9QlWjhrOK4xw==
X-Received: by 2002:a05:620a:370d:b0:93a:14c:329c with SMTP id af79cd13be357-93c43b93796mr401949785a.1.1790338647349;
        Fri, 25 Sep 2026 05:17:27 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:93a:14c:329c with SMTP id af79cd13be357-93c43b93796mr401945985a.1.1790338646907;
        Fri, 25 Sep 2026 05:17:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae7357c17sm106318666b.13.2026.09.25.05.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 05:17:26 -0700 (PDT)
Message-ID: <f23837ee-340b-455c-b3ae-1ffff2b49237@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:17:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Fix GPLL enable register offset for Nord
 SoC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260924-nord_gcc_offset_fix-v1-1-230ffad2dae9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-nord_gcc_offset_fix-v1-1-230ffad2dae9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0OCBTYWx0ZWRfX2l23V44hKEHl
 kfztTEU7ItyYTrHo5sqT+3istm2hW9xAG92QKdB+9hOII0NV9t8Jl1Y5qxPV+fqlkAqrx1pB2Zt
 AgZWUKsRaKklyowKa7cfIuNrWk4dsD/uQenA5jgW0vv8zKwoBGJ5tcVwc11j8trZmmiTQtw3+F9
 OxiqeFXD8SQm1mE4dIgOWB6C2iH1Ca5gPGVeJ+8/7NPcqGDg9yJfEaGZXjY+SMykvygd487apnt
 jtemr0CpubdB3Rws4VWwdgYAs6eL7jWApJK0htE+0R61fLT/1ZaVyDfhtRY4Zj2vltA3WHenUVz
 hFNCwferxQKbZdPXKL9DS72TzbbiaRmKgrGzrIyTAClnIfgIaYoEsDv9JYWKUMbiRrfu6TlKbEt
 HMX7Zk/B+ah79kJfUvPcet3GOFJgeGbQQaol05QFXo1t5Yjz1ta/D4peYUdCuJUE8LGrqtVpXL0
 jDNGR4Z9XOOUnZhe46g==
X-Authority-Analysis: v=2.4 cv=ZfKIpcVA c=1 sm=1 tr=0 ts=6ab66657 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7o7Fz_jXMTEYJjNRgMcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 2YP-7haN9lN5pxT2RvSI6xylJDHLldlP
X-Proofpoint-GUID: 2YP-7haN9lN5pxT2RvSI6xylJDHLldlP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0OCBTYWx0ZWRfX5IXs/PW/DKpb
 BeYJDQaycwzZ4b5ZU34K2WIGaxNFjDYJv1jsa28vB5/o0V6oG1gt2P0z6wMNJkiqerbgGuM8uIy
 LxTCUb7JNKgy30mJqHSSX+D26lASr/Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250048

On 9/24/26 11:39 AM, Taniya Das wrote:
> The GPLLs in the North-East, North-West and South-East global clock
> controllers on the Qualcomm Nord SoC were registered with a placeholder
> enable register offset of 0x0. As a result the shared PLL voting register
> was never programmed, leaving the PLLs' enable state uncontrolled.
> 
> Point each GPLL at its actual GPLL_ENABLE register (0x57010 for the
> North-East and South-East controllers, 0x76008 for the North-West
> controller). Each PLL continues to select its own vote bit through
> enable_mask.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
