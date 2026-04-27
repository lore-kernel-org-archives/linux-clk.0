Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546D830AD00
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 10:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285168; cv=none; b=hOXh602U0XeBKun4CBo7VcjleVYgivf22Uc+ttS0VnUHtux3fsgCrc69hqqsEcuQJk8G4WjqPaKghYYSBfQiA0yt9oUeqhIihOvk82cqs5NTaU64UbSkud7W12YAE2IdX/JlYlr52vWz5cLEPHFNjpe5f1VLIvP4JUKzU98GhDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285168; c=relaxed/simple;
	bh=q+PN25Yvg4Ok8USmVhfqsDHkq7AJ6+ao8HG4QYjNvvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pmjUnxkrTO4bG1BjgNfzjkWPH0cmo4RUOTX+JICT6vFGvJm9cBtb6U71Y1Fci6R8Oo6rC2ini8L6KgyTIEAtoM9x0aDLni7MJLq0H9fkk4biLbCaLjUd2IE/6irGTEGTeYX9qQTNcXC4Eugyh2efKVg5mxCN9Q+ar/4yN2Iw+ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iE5EtpGL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7lj18S3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iE5EtpGL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7lj18S3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TApj1501432
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 10:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	geeJ1PgRAUITajyl5+KfQOhgNzb0SKv4DzQGaAN/Ny4=; b=iE5EtpGLry0peiWr
	vO+bGTkpXwRb6jmdZsZNiqGCqRlRsRR/wf4CuGR2yNok296j+tzHPqfeIupvCvjL
	qzo+wbGTisfMaP1G/WuSsoOj0exkIBFwcj0lKotP4NnbOWvwjTl695jhpVMAF0yp
	5G9rfz5hsNqj0foTKpws4r3o4vAqxDbsGlakNyASCY8bpTzFHWW+CV6XhKKQJ78N
	kIC1UDrk/w21YWmsXFZWiUTZUWg8nLWyKiZrB8hpNfLBsTYVoAliMG35xLyeVWWF
	yvNNi/yCTk/nLT3cB1B/HZhpfKQwXqrRPtXo2ZYZ5zHNXlyCZWR+3+irpBQaix0n
	y+pMaA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrnm5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 10:19:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e429ba4dfso17238531cf.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 03:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777285165; x=1777889965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=geeJ1PgRAUITajyl5+KfQOhgNzb0SKv4DzQGaAN/Ny4=;
        b=V7lj18S3EMqqXaOUx6T23ySw8kQIT9CxakoAlvuz8DRrDnkX4Idlz5aqDAADX+oytu
         YsMk6TU1Z3DPkBim/ZAAbooZxVXdPe3s05BED1LqOYH2Ft/ddbwKPjs6IlJU6wS4hh6Y
         q3uYUWFn807FwTG65uxgS7RIjJ+d9Gc1tZUez+wqCZgm9W/VJx4eV916F+CDLC1al8V2
         QgiAvWcMfXb8zZityTpcActUNjokQkKt40rz/FNKZXXxy6W6BQTE7+1Eu6I3zUlq0wM3
         jhRBkjzflYRmtbe1xAlUxpOpIjaMVgw5uvY6YD1bX7k/NviWPHiqelXw8hhXjvHfFf8C
         68ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777285165; x=1777889965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geeJ1PgRAUITajyl5+KfQOhgNzb0SKv4DzQGaAN/Ny4=;
        b=JpWfbRS2vadNHfNc607ObRekJMccbLY9Fq6BZ3U8XV8jQYFCBjAJ4qHu4+Lq6X7Q59
         9aYJQnHtc3qZdB/HefZdbv2a6Fio+7tUoU+kUq2kgfqaJT2wAGq460AB06+mN5YaT7ll
         6PSu3yOTkaBRi0luBFf6jZcEYlZdymAdYpjV+MnrFCHW04Ba6v6h6UdimXzCOrV6IhZM
         YhBwbsD8Pa4m0R1ivXbCzbFMaCo49xsiDevIZ/70RuLvCmyq+rS7NGZWEwhCenfQlIyQ
         7MWJ8w684k0tHqytt6nzOwfQVoctjLBjoeSaeR/eikJzPZxMe8N1tv7Gh0DuATMK6hqe
         tnrA==
X-Forwarded-Encrypted: i=1; AFNElJ+0ywciag61pquc269gl3SyOhOzLvpcDDuM/jQlc9JsY/9cJMTQKBXumRV0ipUF6uWOWLt3FpQSEKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdUOWpUfD3GiKaQXjY3cr3h5JwzSF5zaRHISGkwbB9cFEewPr6
	b+fW+eBKOGBtXpZwKYHGy5ZqHCGNwFbVTufoLJe3y59DhEFsr+0wZaEF1EO+aBcg/ArLFjhQv4+
	fu/rOOTRSiGcxFYWwIZD6m3VPF8kpZEAsMiHua7UJMraK+T+zwZsylQDLsd1ptNQ=
X-Gm-Gg: AeBDietpuUzo8doF2hSrGhuljGYKxgZbcsedRrsqOersGRC5FcYUK2n+PM6rKf8JRfT
	xp/DgHcF8ZcRL8ceOK8X7C6UX6FHnKSyP9kE8kYlADEdohl7102HM4DWM5lxmOt5t2BfQbYj/FE
	k0URQOSqBOT0Co54woURoSS3qtQxryMgFvkb+1nzoe2OaTGNR5cESbnkxjrUWv0TrybUhxd/TQC
	ha9uggXhwhlnjFkpAzQ52eKxgrPQbILcnwRbWYRn2jvouTisGVwjb7+/WK7FDrdj7nKxzUTg3Ok
	YUoyB0hiTatg82gMAEcZtvzXeJjZ9UHAMdK0CWHBhjwreM5sqldhvn94MFCK8au+465rX9hfup1
	8FbS9EgL41i0D+gBs8/ZbU9y6F6mCST7lZ7wjN5vTLtvJAtIJ8TBdJe1RJUFYpksVYCdjyrY/sX
	PSW/KOVwPIeHPYgg==
X-Received: by 2002:a05:622a:598e:b0:50f:e5a1:29c4 with SMTP id d75a77b69052e-50fe5a12b4dmr98356621cf.4.1777285165584;
        Mon, 27 Apr 2026 03:19:25 -0700 (PDT)
X-Received: by 2002:a05:622a:598e:b0:50f:e5a1:29c4 with SMTP id d75a77b69052e-50fe5a12b4dmr98356271cf.4.1777285165235;
        Mon, 27 Apr 2026 03:19:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e3dsm1092021566b.2.2026.04.27.03.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 03:19:24 -0700 (PDT)
Message-ID: <547f620e-905f-4090-8ebd-eb9f010d67c5@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:19:21 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8650: Add missing CX power domain
 to GCC
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
 <20260424-topic-sm8x50-tie-gcc-to-cx-v1-6-4b6e09d532ce@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-6-4b6e09d532ce@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwOSBTYWx0ZWRfXyXIFlWGE+kgw
 2uNSODFg0B7uCT2v5yb4BDobKLsEBT0QTccAawnapg+kaWBXq8dozLqAIIWuXpuYxNMU8Y+TyJX
 w8BvXhgBYtNghmyrm8tpzTX7U1AZ9O3MLcHLGOd6X1NEpr39lrK8rRMyP8gonMK8PIG1G8vrwde
 zJ7pkLoNSLy9fCZ09IM2x2s0KTouBWHCfTMwBXn47Nqn1alxdL+QFL7iCHsm7/ZtBHZQVDblD32
 /AUDDfL/FmERvYHF0umcL+vGXZcdQF/nQWsPVht/VgO1kh2DihVvTL5WvucZ7qWzkm0PmxntE8l
 Rq2cVxMxA8gx9U8SftzeEb83SjJtJbLVf6p5azsFvcVwpxlZ/lOs+O37n7/AotWRvwhYby0Lucy
 AgyH13ogMjPGuytE2YWGI5clNcNB+uem2NEvnIuRElz2H176TjoeY4HPNe+1ZmIW97MFlcWqQZL
 tRxtoI7MvwqK+uWZClg==
X-Proofpoint-ORIG-GUID: V6C1voyroR3SKVTgG95DJrlD5g35dzla
X-Proofpoint-GUID: V6C1voyroR3SKVTgG95DJrlD5g35dzla
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69ef382e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fkf1F6wwXAJK7cocUXQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270109

On 4/24/26 11:08 AM, Neil Armstrong wrote:
> Unless CX is declared as the power-domain of GCC, votes (power and
> performance) on the GDSCs it provides will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
