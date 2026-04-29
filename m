Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D3C39A7FE
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 11:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461370; cv=none; b=GpOax8IYVOFASneN6ZhNHRTdvGadZIfB6/8yYmTk8z7iL3VZ+idJM3oI21C5a4m3lrmoWKTH869RYP35ttg6P1Zo5qUF0QYvIQPgk/ikQ/WjdJwdiPsz3rbuDX0EHfMpVBlgOh5w3EmTwH3cOGcZPMska1ubOQcGAGHPfctnb2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461370; c=relaxed/simple;
	bh=r7g7Tm20OlslBUQU3g/4Mkg6hUWZfO2i7ABor2hIzoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDQymsaFdZGUUABvqZeVYMJM989j0LSvx1ksv1lwDiY3M0yKoYpib2DsnsodXTuu30lTRiXitrjOzeuZD6Q9Y+j+SAJ3cQOcWj6drvoETTvizHJWw50ia1qQKHW4Jt299Vt1AIUKLUVEwajbvxAjKimTT6Vuim3kxz1yqH6cB64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5rB5OFm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TpIUi8GU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5rB5OFm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TpIUi8GU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8ppoA2094109
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 11:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DnnyIl7TvFweDB2FQ98uRWoiR/6/z2AgxM6DCJdfXXg=; b=X5rB5OFm1ATf9N2k
	gsp4otHkHwPssJEQPg84pB5T9XUhNfTcnv/7LFbt+nZ4MiNsINpMA2qYCDp0iVVh
	QgaUmW+wtEtpWmKHjzh0h54E6HbYNTS96h1QfnaojPM+bRxKQZ8ybT2hDZcBVUB5
	+o7cA+132KZkoIDB8w1n3jj/nOE3ePJRTkczHziV9vYGIYnBX5adY0B7aBig8dQT
	GdU/vUgwgehDIkkTokVefUI/AJ8blEwGqwwqEZHWHmobfAlJTIhC8Vu6OtH6b+OQ
	tD7MFdKGGIv7ruSnAuSC2vLAin6w2YS5XnLEBHKuENdz0QmMP1qZIB+h4RrLUcUt
	+BtXIA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3s170-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 11:16:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3594620fe97so27741716a91.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 04:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777461367; x=1778066167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DnnyIl7TvFweDB2FQ98uRWoiR/6/z2AgxM6DCJdfXXg=;
        b=TpIUi8GUghqOGhnjPLUDdkKEnk+AHTroL+UIz5p/Fr2EAECMsa0W0QCqvelimOHtD1
         b1DVcpEeNOn2nNF4+iKiXN70oSHjuDlwY3ZP6nM0yxk9zOVEdRk8W4Kqyur7hLQi44sl
         f+hp4fXz5KY8w9qimSguT1iZeQwiwFZLIQybv2c3VrGPITIkFaubtCdb0VG8RfmZyj1b
         gkKwvutUio4G1PxZhOv9tQMS9c8IZU6bZXHgvY29/0LBQTp4nlYyBMA4gYXHNzDfsDrS
         i8Kt3HXo7ZDt+f+aqbx33m8HXWdjqeIdJn5tJiAIqbi8f8LZi8VCwv+OZFxFpjbHVb5/
         GEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777461367; x=1778066167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DnnyIl7TvFweDB2FQ98uRWoiR/6/z2AgxM6DCJdfXXg=;
        b=EwP2coOM+mo88D+TxBD5hGcMzYp+yWB9DUnxHrm0KhEzTuoU2gagYXATsTd1d/yw4/
         RLWr4gIfPYTyzoK8tZ7i5aI2QJmaED7oJYoqImolbzumT/SOKlUaHI290dYpebw4eW6G
         WJb9LLb85OKT+sOSdZZ6/iXfZL0D5jhcE++vA3WVVRhgpYmNUoksn5R1lyK8RWhJsDet
         R/wlj7x/PyxFWnsqLknxojjQK5GVW5vJOmXy8mfjV3G1nYH550ueg1BVFpJ43WPvu9jL
         CglEq7CjFlXOoRMJnGgBoYu+YVZysOPeMNR0Qq3bbg43VaOOFGxdjv2d3dORYnPVvgKr
         xJXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KDKfGT8I6Jd0cFsU/O1SJkhsdhNdZSK9tdDLMC4HVoCggXjoNFtNo2xJ6CjO4S063V05ti5lDmzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkspQKx1KEBVMOkurS/Ff+H7uXVAtWEGkOIw6y1bXWtAUASmg1
	MfSKLqk50jArybmLqzZxMoDe4W2zU6HYAJrBjCcSLkDDcYUJXdQL1s3iAjpkUdjw60nKBlU8lNE
	GcU//HrVyR5lYIELVXYSaSTjPH9GkXV2jaiF6Yj0bkZG0+GDwqWg1rYSYqKWOms8=
X-Gm-Gg: AeBDiettAizGde1oJsVEbH5zr3vp88UGcFh82uUiVk6/qFJ1+C3sgjUKR2Bqos77ZhO
	eywt4024IKI/8yXW5ZA1tRLhphSx2z3mrVzSKq3+9dzx6RyMpbz4y+LBnHmC2DY05Om3CtyAPHP
	HPavMcqC1b9bJb5BGx5inLg83Wbk6F3o051wPCBo11pXqn6OSjOZqtB2MYWQmCnQxhUcYXjo0kE
	g6jl4P25LW07uf3cEHvmfVxq3DZDnDBPFFZPVrz17Guv7AvgYnBnoz850kVteFECWwjH90DBFqW
	vCXYltcgc5b/Fkontv4GhgirQQwGKz0dM7ArkKbI2MhiP9nxgaBTxQqm1D0Q1cKDzqhoaJDW5N5
	kF3m1lgKAApJfEy5SVTo1zTMImJltmzGYIO34kGglI4POKF9F3rUUVB6BD0Mo
X-Received: by 2002:a17:90b:4a10:b0:35e:58d3:329f with SMTP id 98e67ed59e1d1-364920a5a75mr7888707a91.13.1777461367009;
        Wed, 29 Apr 2026 04:16:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4a10:b0:35e:58d3:329f with SMTP id 98e67ed59e1d1-364920a5a75mr7888676a91.13.1777461366535;
        Wed, 29 Apr 2026 04:16:06 -0700 (PDT)
Received: from [10.217.216.225] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a0303f52sm3481185a91.16.2026.04.29.04.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:16:06 -0700 (PDT)
Message-ID: <6213ff0f-b904-4d52-890d-69d453c3db18@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 16:46:00 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: Add Global clock controller support on
 Qualcomm Shikra SoC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
 <20260429-shikra-gcc-rpmcc-clks-v1-4-c3cd77558b7a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260429-shikra-gcc-rpmcc-clks-v1-4-c3cd77558b7a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UDDBFsb7SZ5rtyI7OykBuYeVzlEBfp4G
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f1e878 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qXpo7wsCot1G_wR8kq4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: UDDBFsb7SZ5rtyI7OykBuYeVzlEBfp4G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDExNCBTYWx0ZWRfX3IVrjaEGeex0
 lx2AK2/wSBDQv/i3BPfaJ+47noBLRS/JoKwRgngYMXlsv9562LlRBnOgP6PzhzhAcAGsuiIooMQ
 7Fabaa2oNnd5apefgLVm8ie5OYanLUGSOuyeMl0wCtmXzyY8CUvpEkHR+2KNc8iity0wh5+45DY
 7NAuxIQBupVNW4CNHR0ZD5DGZTHJ7rH9EEGmdI1LSEGHiJJeRwLKq7bL0uoH+Cf0jEo+0L6ScCR
 vZcG5sNKJTePKRsMy+bkjvrobsctEbnUfk9fNossXpc623Wyg8nmK87ZpYkJpvC8EckbSV2keKV
 d9/lhu2Dcq9f2+fQQdUONgCJ4mbabf0GclcckP8JPCwOeCKBUuCpCWnmI5vBXcYgp3RerYhMsLd
 dffJDEYyVET4NWWKKRXDQrnwyZGnJlJcEREu4KLbaB8BptYbkgfO7/v2Twjp5k6bEfFGeER9t9G
 iab1kc8qh2YRB1mjRbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290114



On 4/29/2026 4:21 PM, Imran Shaik wrote:
> Add support for Global clock controller (GCC) on Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |    9 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-shikra.c | 4428 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 4438 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index df21ef5ffd6862bec26e3a77ace62ad935ef44fb..a2c7751b091a482f22baa633d658cad0e52139fa 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -155,6 +155,15 @@ config CLK_NORD_GCC
>  	  SPI, I2C, USB, SD/UFS, PCIe etc. The clock controller is a combination
>  	  of GCC, SE_GCC, NE_GCC and NW_GCC.


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
-- 
Thanks,
Taniya Das

