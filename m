Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DBC2F0C46
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150254; cv=none; b=K7EugvrYiYwDC+mLp4wNNRJyvXhcJfLdMgthuy4bwo6hFxSFN8849cbSY5dM7HOuCOp2+xCgdZfPLZICR9YwobHTsJxQTkDy7yLoCoYQ4zq5B23uObBkDII3J41xBHdYYZEBks5WJvtOwKBuEvrFyRBDamFEKgB2l7lv5Vrp5HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150254; c=relaxed/simple;
	bh=BWHiuphdpAexmKsF6SSW4GFqGYn1FqdQJ46cfzoDqYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rozLuKP5bknzKvyHmTyImR8JRCqjT6aLn2ZmD2iEfp3S4kRsF2hyyoqyZoo3Fk6ayZGOuTIt/dM5l2IPPjCXk5NOcu1x4pupoN9KPyM9lhUJmflUsg4clsjuWqwtPEWYDxKlvmSKvbkv37FBk4MONoAuhWWqXB9jw/hKsSvcc8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LpyDTyJK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RI8DTVTs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LpyDTyJK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RI8DTVTs"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ9F8BM4049007
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FV49zdUclFTYoIDSy7+nc3rNkW1ZPs35b4lOm70gvag=; b=LpyDTyJKcSgR4a+V
	EEREIIKNhlzN9CA/SOXgQ9d7oodHTZDTM3ZkSfPTOsSez3bkXXtoWAqk4JNm3Qdz
	3hHDcGSf0cKsb2FvWri2RNHC2eeGfIMzAD2vyKo1/dOopT8zvu1leEFBCubckyjt
	5S8uRMQWhBSjo4kT5Z/fNrYkrGmd5Efc+HqIKCtcJmN4HDXnjviDBV5WPrxqtups
	0dh+KC6oZ7iugeOYCsvnaOyVLg8zUQN/xbas2mhbsgsOpU32NLDBtc/z1IUnTZ+l
	ibcskHYlDeO3tdCLW8setCEYvbSpoxczG0pZ6YizureXo05SX1pGq00a035qhEj7
	i0elQg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2nhg0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 09:44:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297e1cf9aedso156796335ad.2
        for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 01:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150252; x=1764755052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FV49zdUclFTYoIDSy7+nc3rNkW1ZPs35b4lOm70gvag=;
        b=RI8DTVTsMHcODBu5obCIxktP5EVOt5lDxJjIVJUtr6u0YWGkIaYvMST3Fe4olCkKGy
         xI9mn4yt6LOZwU7lg8mbrKsEanJD5w5CnYgkcSnO3MeIK45Q4hGiAwkKBrVtMIHTYFw6
         lVdxPibzbo6Bw+g6FvnhvbWE7d+CwLGUMCM4y6erS7LLCsGjja+ROfpb562wnVrjWExg
         tb0TiOE4i6vFF5A1+6Toknx/uaMqJivg8BSHF2CN+/amPDEUgEDnZLH4L3whQJ1F1YHj
         E/l+MirPk30HigOoSUP7CMClxc9u1QoE791KIope4050I/3+Et7xliInVE8o+QmkE12q
         +D1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150252; x=1764755052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FV49zdUclFTYoIDSy7+nc3rNkW1ZPs35b4lOm70gvag=;
        b=dSyBBwqvV+oFfVSmwhQmFRLXPtSRGceoTx2O8DFK1n3sZHRTi04rimXdsgBxuoQUz7
         LmAR7Z0t59byRxBuIThIsO+H/SJPEwYgHlB78X1qkyiWHvC1lu83S3BNtArs8M5HaDnX
         IlcFgZBNS//Pty34zKG5EUBpDnDeiL63Ch9UIvefoDM2ftSXsoPGkSWsZuN4Cg8fGie6
         3hri7CmTaWKsxt4cFz9ZAtBcCGBZy314o+IEqO8ZGOVjjCGoF7j3fbNGNa2Z41hE1iQA
         6Z6OiRkxaSJ5S7ifYefBdoiNMSm9fJw0marR8ZwbI+A7u7LFfuFD3ffC8P4wbui6AjKk
         hsGw==
X-Forwarded-Encrypted: i=1; AJvYcCUtJxoszK8FTNvokDpvQV5kK/Lv2B7Q5gzgskTUTiDH1MKrKYnCM+3UHwdhTQKYI8qMMoP9Ecxz70c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6k21IAMPvpG/Lv748jAeeuNsdrujx4ERO2VLjzTMa8ele1X9/
	1Iq0jnah8BfC4haiTTBrH15RViK7vISxJSOdUWWgqLSG+pFzdOzvl+jh3bzyrnBJu5ToPiSYdo7
	bOBlApXz/VkRDbWKUe1x9K4PmDuagM67QhRJo10fWjWFuQn3yN+dgONSE9G4EYAQ=
X-Gm-Gg: ASbGncv3v7MUTKfNkFzkoKHIAMk/5YWJKr8r8Gl93v7+pL3ao2YhhDzoojr/M1b2Z8X
	ZVdcT9v4xdclsTmIy8nxDI+XZ/u+ftvsD2OA+SogKVMOVy0Zf7Wxq2l01LXy4pJb8KPV9BYVE+U
	/FYPSuL5JMx6cLgHzJbmS2K37+yvlaOfU9rmUgiWzDIJoWBxCoilOe7ZcnbPNTRtvlsZGwHU01X
	2/LpXqnu4A1q1zeOhFqzCgzVh3gl8LMpa7kmpWijWXMXlqED7o4xfdR9H3iQqdU12oJ4NuZ2zxm
	c17pAOThyolkCubXDmCAxPuYZQmaHS3SJELD/Ynj4u4fNR4fW6eHyObpmHn9hYW6quxG4VMjEJb
	HIzPN/IYiw0Xi8LFHoWOCMihwdkC8Ad0JPLctoA==
X-Received: by 2002:a17:903:2302:b0:297:f5ad:6708 with SMTP id d9443c01a7336-29b6bf779d0mr183254655ad.43.1764150251839;
        Wed, 26 Nov 2025 01:44:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHj4MMXOnSQSQwzFgEUop807lde785Y1Qxxt3b0PwjWziBKli6ohViSjGFD1vpUwDlfYPzwXQ==
X-Received: by 2002:a17:903:2302:b0:297:f5ad:6708 with SMTP id d9443c01a7336-29b6bf779d0mr183254465ad.43.1764150251388;
        Wed, 26 Nov 2025 01:44:11 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b26fed2sm195028175ad.69.2025.11.26.01.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 01:44:10 -0800 (PST)
Message-ID: <d17232b4-4b80-42a1-82c7-2508b5072286@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 15:14:04 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: gcc-sm8750: Update the SDCC RCGs to use
 shared_floor_ops
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-2-9038430dfed4@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-2-9038430dfed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=6926cbec cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BxFOA6ydGOS16N4CFHUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: BKRJZw6VbnJvEjTC6zqsmDTdDSedoji3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OSBTYWx0ZWRfX1d3As7lQ891t
 FaacBibrot9ztpAL+/bClPvuWSg+EDNOaZBQmxwlK0SVWnPsyPOSx4oTRu8FeKs4+1BBxkaq10y
 CT6ROOimUXhqqzdzxG66ZbRKde2EWp82veM6amDjWV6+0hoN/ct7RgZ8MfycHYS6pGWA61HQa05
 dWBeygfetrrVPoeWJ0thTyEm/SFzqg7543v3LmU0IgqTNqI0ygHpjskoBRcakhzDsR10SIG9UDf
 XkNKCyWLg/gft87exx+vQyn7flSLW9bUTkdcykTyagZAX4LMJyXTTdMJjiwUJXMk3MbnyJ9J3bc
 kTw+S2kF27Q3CUjfp+2m/42ha1lXYJZX6pX6qej28MwByhmNnwhEPKHN9Tt9Y8KpKCD8r3vzys1
 Hk51SGgBen5Mezz73yH4HN//h0gE8g==
X-Proofpoint-ORIG-GUID: BKRJZw6VbnJvEjTC6zqsmDTdDSedoji3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260079



On 11/26/2025 9:45 AM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm8750.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
> index def86b71a3da534f07844f01ecb73b424db3bddc..db81569dd4b17de1c70ab5058d4ea186e08ce09e 100644
> --- a/drivers/clk/qcom/gcc-sm8750.c
> +++ b/drivers/clk/qcom/gcc-sm8750.c
> @@ -1030,7 +1030,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>  		.parent_data = gcc_parent_data_8,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_floor_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> @@ -1052,7 +1052,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
>  		.parent_data = gcc_parent_data_0,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_floor_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

