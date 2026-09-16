Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2C63655EC
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789530784; cv=none; b=szdrmsWE6TY54huutaf/rFvXvj7HqadT1bw0FLLSg1zzss9vorURUt0JmZmh+k4M+ykawbWxKu6g6DUR1kaYtbAlAWZeKO9thIlvVJOYcyJYijS5jlSO4/9r/61IfZy6KDPv31nIYGesQ30+WK5v6phdLgPbbHhyBwXlFQSDDrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789530784; c=relaxed/simple;
	bh=VJz65x3Qa/npKeJHJ2IN7CiyFV2ddyK7uhK7sfPwoYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oOZ7TTV+B2wMo3n+IArPviYueyPxe6p35YyKScQKMl2sI/rgC5arRAit65ppXaa4PkIdjqnSqka4RrvJ3VTOyF2lKaH9IQoynMQ2LiDtxFAGVUyfUk6zDgQTfS6fJR6+m9vBbYqaJ4o0F/rbn7ImNkjl76L3neVnzIwDSqyxFg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GkZo6Xyg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKlA1NXQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GkZo6Xyg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKlA1NXQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYduZ1668137
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ECDGRHu2xEKIgsBwocttL4lkqcolB7eASARKeb0MA58=; b=GkZo6Xyg83XFDfJX
	Jt0/FvBFeRaQbNkk7b0ufOO2jvMJHia1ARqn4EOP5Y5wbh9goq7xIXGFYnk82f2R
	29WJrL1Q/M7vGg1CcBpYk50e8yuXJQwk26lHsttQHebdL1BsQj3YBsgLI8eEdG8f
	GHqkZRVOzb1gXmjIcGIvSPCoGKBacyXocsqAeq43t9+VXO7qhUSJaLSOQ5R2apW2
	eDr9fcqlW6cDVn3qFq0CdpBCtGTLFPwcT0sDkX48295mIjJ9jEzNlAJOTzFcD8J5
	cCK7wiqSQJAEWjqwzi8z84vDWtMMGL/PXcmDMZEmlw9pfPqgqMcMGfD/UcROezC7
	LA2x1Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq6kc3r4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:53:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so10303371a91.1
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 20:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789530782; x=1790135582; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ECDGRHu2xEKIgsBwocttL4lkqcolB7eASARKeb0MA58=;
        b=CKlA1NXQom5CvvMteRJeuIMPMJIgvEX4qiUPNg7dSJnJ0FZXYAWM9jgT9i78QMdaPN
         AT03A1x9Pu6BDJvHnWJkcL2vIlnSBfkxspU4p98yu6XOCkVtesNSwHMct+CBOI9c1b6t
         4hDHZ7nLhxiFhifboU0HOIWxaiBOu6vzIBn/0kIF3C/dS/N/cW26FbEHymr0JoQxaQin
         i1dbzGul8e/nkIqk5sfA2idds9hgfmi95BjMEAnQY8H9scFpNkOS5fJuiLtXyMP56Iyr
         LvG4c1hByVfQkPJDxjWMNxdhNaDBR35hBbSjZ2XJ4gDlDX2LV2gUP3GX2RrzsLRJPUBQ
         P32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789530782; x=1790135582;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ECDGRHu2xEKIgsBwocttL4lkqcolB7eASARKeb0MA58=;
        b=Z8CEHyAQ5CVnXSGqUw/p8vuWvtvxgTWz1Aw4fagfPyxuxePeZWJiMOKxlBrruEVAzp
         +yBF1ZyDjk1UYm9L8PS10ZIQ+g0Rf4u7UpZxYBeIv12IIzqpm6POt9AzYzL9jkV9lE8c
         1qiX6+XEPLEG7scKFqBzHSM2gfCKDfZYaFUE6w2qkzaj5mXov4FtafvcxNNz7taqfjPR
         hkF4/nsiWI5akBBtvYoIoE75JLwPJ8cXVO+4WSnrzWwv8//YJ0UufQB87LSXhBk+K0As
         V573c/LWIx+nyLE7uJ252/6bdIJks9FemzXAO5pt+boa2alYw273LvpBdHnlCh4AKieA
         DO5g==
X-Forwarded-Encrypted: i=1; AKwUvBzMpK1zHVpTPqG3mL3oN50NOa2litjq7+QIfifONvDV80x44zCtJpFgXs10F0aYHGyDCfUwRd+t0Sw=@vger.kernel.org
X-Gm-Message-State: AFuF++l5mmuTkzmVvj/Nncwg4rHnXSBX2RaFz39c5I1lAxN7yrBXNvW+
	GHBhPPhCLUVXIrt9P/b9dEQtlUbUcfh4QqhyiHLROljKT6PFSRLSAgWoJ2AEcE87SRbQ8xUkBbH
	53Eu9D4mAxUoSctttRI7rhe6JjtntRzNoJX1MTwCpiWtmqYWb4fEpsOUpTpJ0XXk=
X-Gm-Gg: AYBFou0/TIXYNzC0hpMPviFO9oUuPO4y8zRUBEmMBbsnB/vVw7rr40S069qoO2ssfbD
	aCcpoUqAzDGYLD1z2QB9BmyT7XFjKF/2AcNF0Wb/zTQdeJ+eFrCCe868y45064rgC26ccGyZcMa
	jChEGKEdZy4lC7NQrxP+2ufsfoYGJUu6TfgTWAJETqve//Ftobh0lBx47AHGY4nDZSzPqZzd3rM
	mOl/HHp1p2TeyujIF6llw6SQP0cKRN1HHLh8iBkrEYvSwMxS24dGszqOtNyWdXHdbS9bMS3n+Tq
	FyUQrkjLnYHyTyEWRZ532xjaC9MDKwMtKJd8pOi0JjgiaMaMjFHLMcSFrU6G7A/9fk2vu1t/rz/
	OlW5t6VhUKalx4GReMDEh16KmdAo=
X-Received: by 2002:a17:90b:2ecd:b0:39d:f770:774 with SMTP id 98e67ed59e1d1-39e1e4e534dmr2447668a91.20.1789530781957;
        Tue, 15 Sep 2026 20:53:01 -0700 (PDT)
X-Received: by 2002:a17:90b:2ecd:b0:39d:f770:774 with SMTP id 98e67ed59e1d1-39e1e4e534dmr2447619a91.20.1789530781492;
        Tue, 15 Sep 2026 20:53:01 -0700 (PDT)
Received: from [10.217.217.79] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b1d335sm3727655eec.28.2026.09.15.20.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 20:53:01 -0700 (PDT)
Message-ID: <f6a8c3ce-4bb9-4d2a-940d-ed897ef97a98@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 09:22:55 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Don't poll the status bit of
 GCC_USB4_n_SYS_CLK
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260915-topic-hamoa_clk_usb4-v1-1-5d8d5225b598@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260915-topic-hamoa_clk_usb4-v1-1-5d8d5225b598@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA0NyBTYWx0ZWRfX3gHskRSR+h23
 fopgoGzZI4WGThcwtvVLNAJqgrSt+u+UIB0OLTzd7kULwaEDHo5w0hpoxMnAa69rinq4wpKgUh6
 LQ9G7oWh9hDNHEKCNBCNCFDVHRWiFhU=
X-Proofpoint-GUID: f_8xQjDaH3kCZHFmkutIb8uZGKaeDbaC
X-Authority-Analysis: v=2.4 cv=ZINCCn7b c=1 sm=1 tr=0 ts=6aaa129e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JazkAYohBdqz8DtcGZEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: f_8xQjDaH3kCZHFmkutIb8uZGKaeDbaC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA0NyBTYWx0ZWRfX7EaBFcr0Z9kG
 Q2cg2pCWoublvdrgPudYbg7KiiroZCNTFPvQiLz5s1eL2LZ+tGK7NTsHWAwpP5qIA3VWQqeilfz
 2aI960LsAEaGzdAwyPOdYdw/ZSvnEcHuG5ixnBaZ7Z4vKAw1WW7psIYeYb8AyKjdvTKp9LjfI+f
 fLwaAg6iGcZ1IZxUDsgg8jwt5BeojI1UBrEwWfENncvM1ikelrbKo56Bf4GmjduPKNzSzY6OZic
 wOTWUzyDtXCqq5C3p6cMmXLnqy0MWu677/OEJNbR+8kH+s5jl8ZJTX2cw72pO94xJLni/nIkMBo
 uc6I1Ai6iL+9yUPu4STd0h1/vrtcxw+FtiiIJ99miQy13Iw8mt23jFgP1dFuJayRu6xE5HxTgww
 7RGadcF+abZ4vy5QoCqHhBy8QiXaenc13QG+4Ps8ZE+jKw/uLQR61UrhUnjvRdsi72qBXV+HuOC
 oDNF7YxTZ6VxUdQhyZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160047



On 9/16/2026 12:48 AM, Konrad Dybcio wrote:
> rom: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> These clocks are PHY-sourced and their halt bits seem not to update
> reliably. Ignore it to prevent spurious warnings.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-x1e80100.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> index 8c146d62c077..754d1e03c2fa 100644
> --- a/drivers/clk/qcom/gcc-x1e80100.c
> +++ b/drivers/clk/qcom/gcc-x1e80100.c


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

