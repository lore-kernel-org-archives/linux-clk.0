Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3061C861D
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 05:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754975233; cv=none; b=JGkw+91jYZmH5C+v869500wKh45a++1KBXZANZN6OPQxhz5gTRy3syz2/LLeXTAmB+KGyAXLkBBzNRoopznPeBHqD09NgsCunz0Pkusm4rO2jOD6catKPmZGpzz3KrJ1n1PxqzEEDZSad3xKK/EW7XdiAYOdenTmPkcp8hmbHLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754975233; c=relaxed/simple;
	bh=JW8imEaLawVdDB6pLuEapa6akjqmjGy+TlVBOIdQTJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=biy+8gdMcG4UWZ7yXJ4vLX+cG4SDh9LhEbCe0gaUnFWwZWppjPY3SzN0c4MaAoMqPXdlK3zct4ceY60XJiR550SEo2cQXlFqo69xK2lY7qXkuibBV/xyHaNRnTVvySOSg1Hbv8euznrDN93USTIwGtN7dLmCgT984O2ZjlgPwYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dfj80GVM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dfj80GVM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BGU1Pi021586
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 05:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNkEVDKLytEFqjfBNwlsGmqz4UAUYa8AuW7pBH2uoB8=; b=Dfj80GVM+Y5bhCYP
	zMLeMO2K/ZFS/sru+sGIT+iynd5c/OmM61twuHzNH85UyFCbs+K4OGmJenKBezPh
	NaxmtzjVHBAWnbkQex2yJbts90kd33oFDXGvk3DhyjhIh3imS+RP/hs5LqzBG00W
	tZ8+h8RgRrFz/NH7Q0/ODt3JgAaA9gaitKs66gFt+t8YtW5a7qhX2QNO9kmTfsRp
	aFDChMzZwQpCDr2RT2fngQoCBrA7OF5dCzD6vz1kk9t9nrIvGWgWiznjfdVE+8IN
	bZHhh6lF9YrVM2D3wq7DTwdIRfB547T/+iZRUifZpjjSrNmp3xN5cijwzWfyFMb7
	/3EV3g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj46twb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 05:07:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31f2a98d91eso4857447a91.3
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 22:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754975230; x=1755580030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNkEVDKLytEFqjfBNwlsGmqz4UAUYa8AuW7pBH2uoB8=;
        b=ZgHrBdbZr3JPJniBpF6fxs6OzmRLZf+VCms+7zxbnzzhuz0JSUzF3iG1Gu8pCgS903
         5ftmfildgMUu0kb8g7HqOCkchjPQ3NdgNpJmhu5gNf1omhIH6AY37GkOApfpu0iMHw7Y
         7rYqGBzb7x/quk1O/CmVUrVyXmhfXlybuuwHC/GhwVu9xWGxbkIG/VH6vZehqfq3tMgb
         ne2XTxdLuIl5MIdzlpIcGGK97JlcYmwi+HF3tJuINGpxudRu5848/f0kDbCMqrGxDuGz
         hY464XlLnr2lEtm3+hsD579CsqUveLpSXj2V6cNutVMkQ+i5UlKMV9DIulbqTqI0nvyv
         AxPw==
X-Forwarded-Encrypted: i=1; AJvYcCU2rIVCI3yJiLUqvvaF7XqeOTj32Kd2NhXJcUxOYZ2nhQkH2hhrN0h1dYeo7BoevYhBGD59Bgp4y64=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrc1PcJr2YPDUksJZmw5WjDtRW9os3JNvP6kl0PZnWIghXQUyJ
	acA1YdEVRygStFf2otVSuBH5zLDNpmmhG84ZT/f1ejFAOJizU/jHMh3T6HJBjk9+AkOPj4eeB7w
	nXlKn6GSN6OAcNhiTHAh5dMoFm6KrKLC+iBUfKZWpFOFqeD8tLg6A8GwUI9bUFRA=
X-Gm-Gg: ASbGncttisAs9gJkXK3s2BbrKzUwskJfRXcjo7VXh0oN6my9LCjXZufxIuyB4/4PAHZ
	wA6QncVqGNwSVtmMU/N19IRB+kCB0bmxMDMf+RYkWoVJ+TXLsPLk0BXSwzIINyp4+AxS30JFUG1
	tpfuf+FymWrmmvEhskg6avlibDHAAl2SBU+pxN9PrIqMaGdPwLXY7pGW82WTPJzZJnPvtOU9hup
	U/A4s/gOTyfoBYL7bLmckQRbScQRydiN59aOR4jjKw+a4lP/ttkFlBh6fgCr091adD5cWi11kY3
	eYkSeychOnn3JieDDTm+bytlhCCOF5EwN0QWMv1t+T5rAA1dBCsJ6DT1Z0QFi+Dl57BC
X-Received: by 2002:a17:90a:ca96:b0:31e:c95a:cef8 with SMTP id 98e67ed59e1d1-321c0ae441bmr1689053a91.32.1754975230173;
        Mon, 11 Aug 2025 22:07:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUuQTvbkjznzZD3wAoSWPaV/NV4ZMjR4FA8Z5+ChKoQlXLWNgp3NjNrHW6g0TBMCJaplmSmA==
X-Received: by 2002:a17:90a:ca96:b0:31e:c95a:cef8 with SMTP id 98e67ed59e1d1-321c0ae441bmr1689037a91.32.1754975229729;
        Mon, 11 Aug 2025 22:07:09 -0700 (PDT)
Received: from [10.217.217.159] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321c2be2c2csm735782a91.12.2025.08.11.22.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 22:07:09 -0700 (PDT)
Message-ID: <7da20363-7b7c-4b98-9068-d82a186170fd@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 10:37:04 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: dispcc-sc7280: Add display resets
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com>
 <20250811-sc7280-mdss-reset-v1-1-83ceff1d48de@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250811-sc7280-mdss-reset-v1-1-83ceff1d48de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX4gVD5y74ZKSi
 PMknFFmPxffEP+0ZO1KQp1/aBwkbhUBndak01iyOeaCnx/JNFoWX93qUwBHKhgL+GeD+nn+ogJx
 xGkllukYfr7oTbhsqrJf1S6oebKkDzmu6JtIjvOIGpWBppj5PyZ8B78xIev46c3FLULEXvQkF+E
 wfzj6Nl9u8a77olLj6urVKSbtUnZ0ayQplImkAhhIC58C6WkgsXfUeG1F4T/QZX2D0WV+PO4lBq
 9Si39pXYctM8CgCixRoXHlvztKmJL0ecx24rMRsbYNLgNYBi7xAD0vousx5GSF/i1ZbSrkr0Y4G
 k11i0nVGbS9WD5rAo/fLo1dn3rZ12zUPXhWv9wxyHD8usLwz/QlXmV4OW2fPBr+b3HlHZCMFfID
 E8JjXKsl
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689acbff cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=C2TcYtzuST-dhkRVSHAA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: C5wb_eGJW3tuEkf_UlPo66wtNGh4F_I5
X-Proofpoint-GUID: C5wb_eGJW3tuEkf_UlPo66wtNGh4F_I5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027



On 8/12/2025 8:41 AM, Bjorn Andersson wrote:
> Like other platforms the sc7280 display clock controller provides a
> couple of resets, add the defines to allow referring to them.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  include/dt-bindings/clock/qcom,dispcc-sc7280.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7280.h b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
> index a4a692c20acfc954251fd1a1a59239ac62b20015..9f113f346be80b8a7815ffb17a6a6ce5e008f663 100644
> --- a/include/dt-bindings/clock/qcom,dispcc-sc7280.h
> +++ b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
> @@ -52,4 +52,8 @@
>  /* DISP_CC power domains */
>  #define DISP_CC_MDSS_CORE_GDSC				0
>  
> +/* DISPCC resets */
> +#define DISP_CC_MDSS_CORE_BCR				0
> +#define DISP_CC_MDSS_RSCC_BCR				1
> +
>  #endif
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

