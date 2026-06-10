Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CF93B52E6
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 09:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082448; cv=none; b=XfcJQWZ89+46+SOClQQ2Ig4Tb3yt7FSd1TFHepGPQ2A/AWapEdbHUoBmHNAl4t7TErpMvDeUhIbKkXGnO+GbShBjxLToAxUVpG9ZEFtYXu38v0ppX/TU9yKk3yFOnFY1ScrckwcMfdmGZ5Aalk3LPrNdZdJELaKEW6War4zYAYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082448; c=relaxed/simple;
	bh=CVCOsrRWxRuKP37DNqiaGnb9hcJ4TFwAJ0rFFEr3zrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C8WTOSKphCeiH3uSz5Bmqlxc8vnbuDGyxa926mJWkuqpJ1YXv4hJ4OXjc/DHEvbwddxtoavTssz12xs97oCJPpU2gKuIgCb0/3PY9S5LBWOZ8l/wdHMzJBzEcSS8H9cTFacxABUPymCRd9zuwLqIi/ZP8EPkppdGd90tNTuIKKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLtFBx4j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BOZXWInx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLtFBx4j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BOZXWInx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hrHY530925
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 09:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BQibd2wtxQ5ewlVOIxOvKR5n8ge1nvsqrt3PVQvMLrs=; b=FLtFBx4jFf9TAwkQ
	jxRyjDHEDXAvL5lqHoYobIGWqNN4AkH14u07971RY7RYxj9OLQytXFlQDWik+c8r
	mFWwLaQMr5Q85XTs8XtP4qHiomH+29mXqQQSkJKaBHErH5TZdwguaKW68JjwlDqT
	Iulr8tvVEE1S6zOq0ZkZWbM5AuT+h3lI5wQ05AYL2Eh6mA2RoivEU0NbAWT+py08
	QjvFq2h2YGW7TYhLY3G93zIeulE4jnP3i6uyTVxZF1m/aIvjlF0ndatQ5YQkJnJo
	VPyxICyA7VyIk2BUuwuKLMTNJTCR5136/iYnBIsww6uHo3o9DNWECmHSWD//9TAu
	9Dvyjg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh1pmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 09:07:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517796be724so13180461cf.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 02:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082446; x=1781687246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQibd2wtxQ5ewlVOIxOvKR5n8ge1nvsqrt3PVQvMLrs=;
        b=BOZXWInxg7pxy7ka7xhEBTQT3XH8hpn+TakPUziyFCTOf8LyMw0C2ez67i3ija6W8I
         yUnJUd/MNxag+n05o3VUycUe61eEaTcKRxO0fh8VmMsZN6leW2+yl9vqYMp6TCcCQBKk
         O0euAfuFd64RSen6FJCAgMpCfaMxqPjdD69wc8a8fttyX7pnW6AvbPNFN+1JliW6gReK
         BX8J+pHgRAKadK41CKuvwRdN7KO3/fkY8N3qe/9aMk3VoFlDA8yPNw5aoqeQZvU45rjc
         pL0YtAJn3n4m7hdjLOcl0kU6NdZ4TU1x102WQC9YbbpcfrhT2lgldlqjFAh00DkUL6BA
         OzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082446; x=1781687246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQibd2wtxQ5ewlVOIxOvKR5n8ge1nvsqrt3PVQvMLrs=;
        b=ovvQJwmbMeAQ9DihdCh9EyTJPHEM1Y7qviXwVXBfDBdzrSWKI5m/eyKJm+Es9hkssB
         KKL0FcF+ROInw8MdZoBEP3xud3qg+kyP2ufAg5XkCsxht6vTrVUl/s7URjL/FNcgCkm+
         IRHX4E1MNjN+8ywXJnbX0r0RCB5/tdL8wNtvj/jdeE/Dx0ZJTJXJRlrwxh9yaStBrays
         1EZymV/KTO8ef611u7j2U/lceoA0+RT/CHO6A+9DRYk4bB+Qzzsg44MBhh6cGHfuGx2q
         19c0TEVxEyNB4sHbEX3mb/6twcTk2hslUSqUd2d4OA58PlAM35m8K/ewJHaIwaV32l9P
         W7RA==
X-Forwarded-Encrypted: i=1; AFNElJ8Dpp59159ji6GbzquX9ctnxM49RPTIKY2ymThnLdVISUjK0OOqyxFW5IGXlAphLlfHF/q5nXT8oXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaO+YFreHc5bXl+ft4o0GGFLEGD2mvyPvbMVmRsMSOkZLew4HE
	S5GBaS0Xl+s2HL1YHR8vXyDfNnjY418rxFNhMHfVA2nw3Nk+F9MPVq+D8nMxXoIRM9q4dAkBQir
	axYQpTvVu+9Kd3C7hQyFUjKgvfqZiuGMmaiZQUd/zi6SJTWpQDiyDaetHK8KgW3s=
X-Gm-Gg: Acq92OFNDN7VNcnA31PFRxyp+cpchXEbkCEShRVUygkPt7V9gS4IXBt4OItRS4u1jTK
	mP1p9SZnwf2e0qM5wJgrKcOdmZ8cTuoOs1a93N1m01zqtnpHAwutvGkiBLt3hX3Z1xpxfwT7FoJ
	PH/bX10O8NYpWD030kkWiccSEpFWp5Xtezk9QdzsPuq45CYyn5ECOWQkvXeI2zZU7EFV48Ugc0D
	u17BYXRSIcgvo1P/B99txisWxgxNwWK8yw7mZOIaRDorO1Qk76benZoURGhTk5w87DgrmErPPwg
	tpLrB+WbIT1/hSotjz5UMKjxTHRp0F1D4et8Qa66EPyS8GUtlcB2ujW6i8qObyKFkPFSlaHD7ue
	h95sOI8DAQ1etKT0/eLAxUH1V6YojiHgiYSEQc4fkjqTSTTYGIcy+Lgh2
X-Received: by 2002:ac8:57c3:0:b0:517:5cbe:515d with SMTP id d75a77b69052e-51795c4a9b0mr211515001cf.5.1781082445789;
        Wed, 10 Jun 2026 02:07:25 -0700 (PDT)
X-Received: by 2002:ac8:57c3:0:b0:517:5cbe:515d with SMTP id d75a77b69052e-51795c4a9b0mr211514711cf.5.1781082445307;
        Wed, 10 Jun 2026 02:07:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0558f3885sm1149831566b.54.2026.06.10.02.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:07:24 -0700 (PDT)
Message-ID: <02b45c77-200c-4e1a-b84a-e18cd58d9530@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:07:22 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] clk: qcom: Add defaults for desired arm64 drivers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
 <20260609-clk-qcom-defaults-v2-5-0c67c06dca11@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-5-0c67c06dca11@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NCBTYWx0ZWRfXw6Lo1d1855kY
 V1xrc4fcVVVUbF+t/RgmSItkxaHexI3Xd/i2V5fYS5S7mtE8UrC/jZEtYiW12ugOr92KVbM/QJC
 zUVQW+Jm++aN0KhS0p7Ng6SNsInhxvk8jYm3HaQkTuGJrP9NrmGqipuMguAd/bVYg2F24RgdC2h
 WeYuLf8Wuv7DZfn4u8iVajrGTWzspLeNpFFu6FNSrOLb74GXyXR9fxcqxqMkw7z7OfxG1K9keNY
 8hM3/DcFe/mprOuJNtAkTfiKwgSP4E9vtVRAv2LSSDk8gRKtOdF/Q2cc53FKEDkkT4Ro5NVVu/L
 YM3X5pDBU1qsP9vOgdcQtux2JDg5B9SJTKHADlP78orAg/H3KrvZJza1FivYIgdK+FAWXO4XVjP
 I7dnV9m3ki+RSSNqdMVVQXwGF2Gn0AXfMmtAU4+XbI0wUgnEJKyFa0WqwLfSEhu4izCiY4IBt1k
 e4eF+w+lMKMNzrKpFFA==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a29294e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=G14gXSJJWdPwksqYDHwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: SLAGStgLIFJu1Oeig3eCDzxqr9e1eGk3
X-Proofpoint-GUID: SLAGStgLIFJu1Oeig3eCDzxqr9e1eGk3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100084

On 6/9/26 5:32 PM, Krzysztof Kozlowski wrote:
> Clock controller drivers are essential for booting up SoCs and are not
> really optional for a given platform.  Kernel should not ask users
> choice of drivers when that choice is obvious and known to the
> developers that answer should be 'yes' or 'module'.
> 
> Enable drivers for upstreamed or being upstreamed SoCs, which are not
> yed enabled in defconfig: Glymur, Hawi, Nord, MSM8976, MSM8998 (GPU CC),
> SC7180, SC8180X, SC8280XP, SC7280, SDM660, QDU1000, SM4450, SM7150,
> SM8150, SM8450, SM6125, SM6375.  Note that main GCC clock controller
> drivers are usually already enabled for these.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Add defaults for: MSM_GCC_8976, MSM_GPUCC_8998, SDM_GCC_660,
>    SDM_MMCC_660, SDM_GPUCC_660, HAWI
> 
> 2. Drop the Konrad RB tag, considering above a significant change.
> ---

[...]

>  	tristate "SDM660 Global Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
>  	select QCOM_GDSC
> +	default m if ARCH_QCOM

Drop the 'm'

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
