Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447FD27B50C
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 17:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178499; cv=none; b=V6oyTmTYCTmmcwG5WBg+4BDlmJJ1l/T/JZe8GLTvODEQyiC7oFbRHf28xxFUDMP0uuyjo/waBE+2KF6d+OLIA5VfwSupkR805SgIObOnES2EYLIU+zv+vALY756EqB1agQPyuKc+f8N7zKg38CCIS4j/QUZtKe2PST8zzhvBuA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178499; c=relaxed/simple;
	bh=aYf26yclBpU0W0OI36KWcQYEgzBrpPhalYGhwg5ECvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LKb/5jPr5U062HOINZcdUWQokJAkxXPLQwTYiW6sKlanpMMjB9q7KIx4m5mDcnDnF4dIzwYa0uK3tuDW/xKaJUimYT36Xm3X8GvL9TtBL9koYi+x0lYX4tyBOnO2xCxNPsB4R0dIxGWBpnA2DMTRrsw5gCE4v3n13V/yIi3Icok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4gBdTtc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UKPBISvl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4gBdTtc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UKPBISvl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQGCxxG2855086
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 17:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rpjYolbjS4vunxVJ2dZZFzYQTvEyWd8Alh2O3vaKm7Y=; b=Y4gBdTtcTXVaP+A1
	sMvbLaZVuStEDUkZTwCty87p2SMVDE9x2l4fo3Tqh0nOkjMklaJ+WE+U3Rukik9v
	jdb7AGz6P70eM0GxSHbMpaDYvCDkhwq3rIpPkL3/FYRw3jFowYFhsOMFv+38O4YH
	uF3lGdfU5bizWszZd/WEA1gpP0dcjTo56VwzuJS6193O7E2uhu9TNQpOnYQX3RjN
	tQY6wEtfCsgdgcx/+ypzF/v6ozqM0sDY84i6zeZV/aqZ4gxMMaJ5glPnS22LxBp8
	/xuZ0rBAaIfBhMwVetl2O64oUsS5YCKHhcYT6Zw2kZnv7Zh4m5b4CG6uilQ6gu2m
	MzXGPw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap4vh87y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 17:34:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso7565404a91.3
        for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178496; x=1764783296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rpjYolbjS4vunxVJ2dZZFzYQTvEyWd8Alh2O3vaKm7Y=;
        b=UKPBISvlJ/ms3LjE2ePelsXjbU6ZrQkZYxeK8XUPKOG+Gs7vCCPpQd9sQ21Tcqn4ip
         T0aqdIiDO0pFG5ADj9tKGBQsiQP14I49EaLWjyfbgDCsd3QUyk+p45dX1RsjpAjkD4yw
         2QuFnHheRbdXYoDWjjo4qIBslNQQCi+zsGEyCBS4DLjxLRkDouLdBhSChj+Gr6UR12uM
         lIgcAve2hUuE71MVZFRRwZMhgGfyfAZqymCMrZcfGloGt2lXRlBr/Y+w1KEcviARbukG
         p6nJGIOT+kGi1mBWzrUYeYstoMiGIZpxr8tlEbUcsZgaxWCcxYM/dUPNUsBkeyNKtHoR
         oUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178496; x=1764783296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpjYolbjS4vunxVJ2dZZFzYQTvEyWd8Alh2O3vaKm7Y=;
        b=bN2uGZ5h2puTTu6uwiqGUMCsrkiPbPEo3JFXJBOWn/hDKtvfA0yLb6xc1Q5oPLBVSs
         FqKiS7maVbTRbJmDw3n3uR6Auz0vnli8DKtYikADCdvS58Pn1brdnNZPbDS9oMBkg3iZ
         7kViKmiVenK/PppjN2gSRTyDMdGvmD26rn/E8a9mL7BajYYkinN14HGYs2pngugeYx8C
         i5eHjA60pYMjp6UGP9ZN4MhfARh8zA7zFx+akZ/OkXIC6WtpAAgRn0zUm/c5IcE8zeY/
         Efj/lB59Cl0NmNvQRCKbdBvi5xBaYx5HbOcVt74Psgnf+6VWwVcaBqB2ZAvlbx2fmObE
         HfEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0JDD/43ZrliY/wjcD9ytQNTjmFrLqaYPB+RAGJsJC7v5xCb9r6md0uTyI5XBE2iRk760kEyoxM1A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4XzG88ABodiSMwf22HtzBGSfU5T/67zGdB1xIKLWo17pNqkZh
	X3vgcBilOYwk3swAXxS1oTUnRmmbmu5TEKcjCUOv8x6QXCf+PVkmkUDv82oMcQe/8u3/G4lY12s
	OvTHww6XQCEt5ydB8R9MAE+cKkR+ZHrt0eEuvKb068/YXcTzVZydPfnXLVy+BoEaE/AJfdtg=
X-Gm-Gg: ASbGncuv6KZrhkDCumWwzjKdg/oFH920/sLrjJtwWwCVIBq6WX9ShDc1LZLYusX4fr1
	k6VCb/mLFyAeZDbZrMaDDIrd0wl3iuMxzGIAfBexQODAcDkgrlYa6F+VvLdEI88ZhOAAlJ1aU0q
	DLEpcCTa9MRCHN86Eo7oyZc6uD1vhSSNjEAGAWiYuGLRFzFGeSy2/CmSlB5zVSbbz1BEyuU7e8s
	Mcp1phzX7FhB66LIVys41hHlKUI6Dvkkljq+fxmN9osLp7nabSHzUpUNmMvd4ENDMqHbdAakbPd
	kNOB0L0Bf41NgqGrfAhh6aVFgMCzAX3ONzbP4+4KovFNVN19yZMQ9HSyyBNV2XLbmjK65BK5J7i
	hV3xXZl+0G+cy1ysGldSIJFlKoVk6al0EWPMUO8MDhg==
X-Received: by 2002:a17:90b:2f83:b0:341:194:5e7d with SMTP id 98e67ed59e1d1-3475ed51453mr7919492a91.24.1764178495613;
        Wed, 26 Nov 2025 09:34:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHp5mCdN9f9LFiefcsSriDXhzKm7ugs3IpHAqPHcQDDWsl8AfaEfO8/utu17ZBzu2FzrtVCbA==
X-Received: by 2002:a17:90b:2f83:b0:341:194:5e7d with SMTP id 98e67ed59e1d1-3475ed51453mr7919455a91.24.1764178495041;
        Wed, 26 Nov 2025 09:34:55 -0800 (PST)
Received: from [192.168.0.100] ([49.206.43.76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a7c3f1asm3232645a91.16.2025.11.26.09.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 09:34:53 -0800 (PST)
Message-ID: <7eb0eb2c-c011-486c-b41a-3ac8baabe2d7@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 23:04:43 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] clk: qcom: gcc: Update the SDCC RCGs to use
 shared_floor_ops
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera
 <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <daef579c-6289-433c-b1cd-0a8c182f4b8b@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <daef579c-6289-433c-b1cd-0a8c182f4b8b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0MyBTYWx0ZWRfXyrjSt+6vpVNF
 CA68Mcv9KnZDAJd7ydnMwVoYk1YoJjEQr1aqesPwls78lLm8bvg/R/cwtkaPp7entGKFwG2kPot
 WRgnGfHvPe3R2TS6mWiyosEOm8/nryQdZ11AC+YqJElMUQmw5OtolF/k5NwdAFANdM9Pcz28kGK
 aFRZvHSNuz3v+yW9vs12ITrkghNYlktZPxGwbAyGtEVrccrBP9gEGbqeBZVjCGNut7cSvI6Eg+5
 CwhcaXxKWSCkFEG5+w444f6Z5bdlt8WrHwahg2vYty7stwRpVNwkSqqC9wRl2yDCOvmiLZbjoCd
 7NBjbtcvZwpYm1xzVmIa/qoAzYkGlV9yZfObMKDPL+wM11l/GUAKRnWo2cr8hm25+/pgUTpbNUC
 XKkKohsPqCIC6pjxSWCO271HZQ9tLA==
X-Proofpoint-ORIG-GUID: Kh8dCvX117QtmE9ois9vrwdW3iEdKA2Q
X-Proofpoint-GUID: Kh8dCvX117QtmE9ois9vrwdW3iEdKA2Q
X-Authority-Analysis: v=2.4 cv=Lt6fC3dc c=1 sm=1 tr=0 ts=69273a41 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=qGQbs1vc2yhDUS/Kx3M+Dw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FvykduKxJR7RWhW4CT4A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260143



On 11/26/2025 2:20 PM, Imran Shaik wrote:
> 
> 
> On 11/26/2025 9:45 AM, Jagadeesh Kona wrote:
>> This series updates the clock ops to clk_rcg2_shared_floor_ops
>> for the SDCC RCGs on SM8450, SM8750, SM4450, SDX75 and Milos
>> chipsets.
>>
>> This change is required to ensure RCG is safely parked during
>> disable and new parent configuration is programmed in hardware
>> only when new parent is enabled, to avoid cases where RCG
>> configuration fails to update and overclocking issues.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>> Jagadeesh Kona (5):
>>       clk: qcom: gcc-sm8450: Update the SDCC RCGs to use shared_floor_ops
>>       clk: qcom: gcc-sm8750: Update the SDCC RCGs to use shared_floor_ops
>>       clk: qcom: gcc-sm4450: Update the SDCC RCGs to use shared_floor_ops
>>       clk: qcom: gcc-sdx75: Update the SDCC RCGs to use shared_floor_ops
>>       clk: qcom: gcc-milos: Update the SDCC RCGs to use shared_floor_ops
>>
>>  drivers/clk/qcom/gcc-milos.c  | 6 +++---
>>  drivers/clk/qcom/gcc-sdx75.c  | 4 ++--
>>  drivers/clk/qcom/gcc-sm4450.c | 6 +++---
>>  drivers/clk/qcom/gcc-sm8450.c | 4 ++--
>>  drivers/clk/qcom/gcc-sm8750.c | 4 ++--
>>  5 files changed, 12 insertions(+), 12 deletions(-)
>> ---
>> base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
>> change-id: 20251125-sdcc_shared_floor_ops-722ccecfe787
>>
>> Best regards,
> 
> Can you please add similar fix-ups for gcc-qdu1000.c/gcc-x1e80100.c as well.
> 

Sure, I will add fix-ups for above targets also and post v2.

Thanks,
Jagadeesh


