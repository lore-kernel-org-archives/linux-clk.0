Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D73B26E6FE
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 13:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758807674; cv=none; b=Umg8kevO16d3jM2uPDC2sFEmu8Y3xkqC+ViTDZIDDkBcCWCnqGRg1rk+VPi3EuW64T8vQqZvAQz1/+iNHtrPm6Bzpx6PZIqEvhQfENXqmbvxOIUt21gKn5zLOB5+Q0W67df1b81GYiF/TNKYhzYVd4Kl8NHcpSbLinyLfWEkA5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758807674; c=relaxed/simple;
	bh=k24TsHdSWeGcrDakZ5ZxZ4u26blxOVBlucfWSid3ZFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=StXHmF1Focb4DZBfRi5iDcuMB5HgfoHQIKBZwS7UJEumC+32EYZl6WJSoNImjCr7WrydcrwHqPJC3QUsLYpX7473vzby005anZyV9EcmwQF3YcC8urSty4eEhO1q1iXOOa2xIa84YwqzBcnrJbNEoi4ovwpbPBQd3V1mgIy7t9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eucOK8fH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eucOK8fH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9AZvG020144
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 13:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZxuB5kT9QhvZV6VcXA7vRyRC6QPVlvbL5ixfpltHdps=; b=eucOK8fHI7HhgVa8
	3u5MMOZiHNnfVdURqAECjRHKZ7ExeVIJWHEeuEgxep4LuXhlBlpEnBR/EzmvXHos
	G+toHPzHRkAvSTEjqOR6LPGI7lyX9jRU+xkyzGAWPpjft6e/IrBrSAm0ITnqYaKq
	LPatB8rXP17OlhaP2ZtlEMZOn8bOnNE5ge5Z5LAz489BTMA60jD55IayqazRGlYQ
	pExZvl6BgHnu6QWVPnuvmj2S79PuMxVKuEWAm+xAKn/ROSbKzXsqLU7f0hFpCrJL
	myLZ+lrmcge1zbiBij+sJh8YKadcHFkKoMs5HsIrCuNkSTK93Zv9dF4YJXwWUY3j
	lpV/dQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpe1g41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 13:41:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2681623f927so10449335ad.0
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 06:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807671; x=1759412471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxuB5kT9QhvZV6VcXA7vRyRC6QPVlvbL5ixfpltHdps=;
        b=vDYjs4byq2LV3gjsbRpJ3qKu3XEbegadD3YqZb1/VqyizkUCSnQy/h3Cz+30yAfBNn
         Geoi+t9iQrHnadK9wZg19BZkL2DGo+TMm87i9KCcje/u/7Qc9b9A9xdRos5KOZ5kYbw/
         7N5xpFh8DTdk8XhaKZHm1DdTsCSxljvuD0adL8nyFB4Ltw3bzlRJBXRJWNqzVQWmsp+D
         6OeFxRx7iwaPR5sgtL4lCEOcHro/dhNrqjdm10EdFMZjv3PaLaESeIoftQGKv+31fKPx
         RuOJMuCFBq2jYZWk7kQVMGPW77XcBsvmzTLuH1Xj5qJG3xHdE89kWMAraaaIWE+XgnPg
         67hQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5TfiyW9iKGCeEv6WIDyj0Zz7IxicOO1MLrJSEEN51J/BsJo9HIBST7++u9cdZDdEN8w86GgKFajQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqZJImEsezuRJitKF3jazZBrImx386O5uCjq9BjUvfOHzq9lIR
	O/XhBfnI4xKKWDmv66TxjT6VE5gfew9nC78gzgxWS4pQYm642Xyegv3f2hpyDZX9WFX8HwHdxyO
	NmaUzK7xA5YyQQ1UWITynHrif2RRLGce+doejtPEV2j3m+mjXprPYKMtN3R8xk28=
X-Gm-Gg: ASbGnctVlaJSpEiRIb3TZMhTsKGJqEjogO2c2G8Z091snmY8AxUYGf4s9HiWk1AWoET
	8dzdwoSR+9h0WSTmYwOiEGFsab0KkFeZ3yFCnSX7702nfOIUUWJ7mmTrZcuUCiynfiHsl+ZzmP8
	B+cx/tOWwpDtspXWo+hQyyI8u5pjgD4SLKjSlpnJsZE0SMmZwTCeiv/HBNtCUaiB/Rq+eK7ERx4
	wyWILpb/ePy5aqe+mmobJs/ckepYOnk+dJ8+u6gjlSVBcGqwn/hEMefrUQOqcBoDGet+d9u1wrA
	pWmIWiy27Ko/2XT/WUFlZNkbX6wUsG6ydaZ5CzDeoAXdTy/ilHe1ak7HyEfkWSVmIhcN
X-Received: by 2002:a17:903:8c8:b0:269:9446:8e45 with SMTP id d9443c01a7336-27ed4a7ebaemr37331145ad.34.1758807670524;
        Thu, 25 Sep 2025 06:41:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc0Iz3ZnWQ7KLTGI1sXvRmOPwr9wL6X2M5C7upUNaBrMM/aDz21PI8yG4UpXaXxAe3VMbrYg==
X-Received: by 2002:a17:903:8c8:b0:269:9446:8e45 with SMTP id d9443c01a7336-27ed4a7ebaemr37330445ad.34.1758807669493;
        Thu, 25 Sep 2025 06:41:09 -0700 (PDT)
Received: from [192.168.29.198] ([49.37.133.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d3df7sm26066295ad.1.2025.09.25.06.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 06:41:09 -0700 (PDT)
Message-ID: <9066c8b1-bf25-4ce1-a0ee-16e9ab44dcad@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 19:10:47 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: gcc-glymur: Update the halt check flags for
 pipe clocks
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-glymur_gcc_usb_fixes-v2-1-ee4619571efe@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250925-glymur_gcc_usb_fixes-v2-1-ee4619571efe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mmW7mZ2lADpY9Pvqw147Nz1Aq6pV3y1v
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d54677 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=5wqTxrHxgjUWVXd7k2kF3w==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=encx6hSPGTGxlSLovxUA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: mmW7mZ2lADpY9Pvqw147Nz1Aq6pV3y1v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX/wCY7l+8I1Gf
 PqPjd/0jwqDRaYTt/AudV/5/FvYBdY1nSC9DupR0Ma+kiMO4J3IzSTNqe7XD9kzi8pFg18ZKUm8
 d8D2Jr1vw/wUfvw2uswcUBDeeMGeRyNIgZZKjVXTwj4e+5be4ZI7ZLo9VThK0CxGxJNN8jVQF1R
 jNHUfrYehQycH+AoRPH8vAYzprICCFTQHILDMRkSI6lxOxGmI2eh6zfTEFu93BzoIHL/FyNlavJ
 Y43f90LSC0odTw1NxHAplGexXgf24ORytpgPXyBgjlaScjKmb4AUtLGeJ0mRV0q34VtozzoLfVj
 +wUO3QJMUPpBNVL0Ig8Xiii7dgN1V7iV4p5AOlqouZRGSrB/buti1CmVKQ+WNkFrbtxSDJaWXvZ
 xR7M2rtW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020



On 9/25/2025 3:49 PM, Taniya Das wrote:
> The pipe clocks for PCIE and USB are externally sourced and they should
> not be polled by the clock driver. Update the halt_check flags to 'SKIP'
> to disable polling for these clocks.
> 
> This helps avoid the clock status stuck at 'off' warnings, which are
> benign, since all consumers of the PHYs must initialize a given instance
> before performing any operations.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Changes in v2:
> - Update the commit text to add the SoC name "glymur" [Konrad]
> - Update the commit subject to add more details [Konrad]
> - Add RB [Konrad]
> - Fix a typo [Markus Elfring]
> - Link to v1: https://lore.kernel.org/r/20250924-glymur_gcc_usb_fixes-v1-1-a90568723e64@oss.qualcomm.com
> ---
>  drivers/clk/qcom/gcc-glymur.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
