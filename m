Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF7723BCED
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 17:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400760; cv=none; b=a5g1kWxhDhmwY2euB+AiDbm+SxUzJiVCeoFfUkVaTLJZ7Q60U3ok4skIdVPOBryutN2QP1Er8SEM+e9IdUniec9XKWTt/iRCnGLB20k2Z5Rl0dU2l55pTqUfYNZb+g3oBsAxrWhIcjATEoDDbw59fXv8GOgBHQKg1mISMR6YxhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400760; c=relaxed/simple;
	bh=ENanSwtYZcoz8KYaIM85EFldyWqROkPS8OsAy3dMyd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gh7Okk8k1N4VvyaH9WbZzJll3utScA8RajgSvaJRPx2eJ8m28AJBG2Xp897QwJ00MR9cQ1gfC/rLroWWZVPnDiBN78CJ4RLtMb1f3df7xDMBXDF/DpFPLxNLkTGIgEgWfSYE+l/GJm3qR9hHzm5KKES1Xs8T15pvuhCGHQZRDA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TrSLYx0G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bEwiWg6U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TrSLYx0G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bEwiWg6U"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAC8DJ3571621
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 17:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aJcNO/Q/v2pybd2I7RyIKugmxZnvv3/dh37NRc7/cwo=; b=TrSLYx0Ga+KpNPf1
	FUKKoOpEOFXo0rO4XqEVQAU02qA5IPUnJ2rshDb0EPE5Mk5ciPfyopHojxV9X3ET
	oPw9sajmsKAuDz/WvRwhOXg/e0e2lX8dGXbp8eARj9FouR7sNag9kxcwSj3ikSuW
	FM6NNQ9jlOHmXxbzZMgFVbBd+A2MXFt7dhVckg7XPTAIPYXQFeynCYMIQ7W3utDJ
	/QBRrpIvH+7gZIiwr0O7VnSAhYSYiIP3uog5/yU6IP5jX3tOslAt0gkCFsyn1lEY
	zEPTQvwWLQA3w6QvNka3pGNOU9Tu9uxnrvyJ2O9pU27P/oFZbJsJOxCbXLrt3Tcp
	9WP76A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1rbs92t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 17:32:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee04f4c632so51057111cf.3
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 09:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763400757; x=1764005557; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aJcNO/Q/v2pybd2I7RyIKugmxZnvv3/dh37NRc7/cwo=;
        b=bEwiWg6UGT+tQhg7Lfp9ChqfBO0+9E4jEcQwpW91Ush2ZbdSfZFEdY6nBKy6LZYey3
         93tJhXpTwyvRl31XeWok0G3auXlmFtTv4bDQa/QiqSyv9C13+c/ceBvp5okX6UZqATpt
         hVj4fsvMM8nbqn8aDaG7h/0kYhBafJTZwf4SNcPHhBgjZermojTv7JmsvoFM25dRiaeM
         ewnBj7NGJsKmHZVySey72CFtlU/bwkqWMsPIY9/gnZa5d9YaakwVYuBStdWv5ZZzK4TC
         SXGlaqaywl+cEZUnBDDHDEkrx1jIKPrNTOLV9qxVInT6wxQXSl0KXjMOQnB9VB2Tamt1
         sy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400757; x=1764005557;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aJcNO/Q/v2pybd2I7RyIKugmxZnvv3/dh37NRc7/cwo=;
        b=uGH6W7dFQd59IfhWkZ+5yw4NFO1ESkDaNrICNB7m3kTX7X0gmY5J2xGC0ToLqWRJ+W
         /kpfc9SnB4qN05DQQXXGfSkcvlwJV1KpHyyVidtv+X7s4w5y3eakMhM78HIA18Cfz4Fd
         853FA3YzpyOepjpB0ocvYvr0SC+D1o0AaRM5o+Y4YTluQBULmwMUqWw97vVTdMwVmz7S
         soXBfYMLoHdt3Ey0H5tBjK/YzntfFO8HLxUHYXFdnX17HmABMzO1JvEjHvdrI2XEYQKO
         J9m/fZSN6e9S6bXmcEvGnpW2zTE4bpu4fEWrE0En7NNEGgF1uoliY1FvJUQwY3Z9gmxy
         ZEBw==
X-Forwarded-Encrypted: i=1; AJvYcCXN7ce43hZ0P+fUMcf9hDNJKX3aSlgyl21XRBRkJtuI+w5IfufTZF0kP42ehbIQiaVrvMGWEs1cc/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxZ4HXPTWj5CscNvMtb1XP70W3UbyqlnlpTfLgo/QbSFY+u0yq
	j0G29Q5M85DT73IP+pTbitxzOgpfBVBnPW4LvvP/iUDUcAiBn1SN9UIzniCPgHr3UHJeGzE94bd
	fu3cb83D1KpjY2Bjb612edC5i+a9VFjIydXL+atRYRIhsad1uK+/hH4b1FOIm+3o=
X-Gm-Gg: ASbGncvUWteuOTX9nzxpSdIQGOcnSYmAPDRThSMfpbhMNc68UjYnsyrvsyUbQC6HR/S
	2+gd2XKoPhnMmF0RHlb+Irob3C7VW1NPCiHXt/tJdMe6iYAxF7LJYS7I/GNo+tLk3eVeXnrbUdC
	z8YFcT3SH5yvdN9hDKHNnXMnuQPZIMdXjE5+WlSWjwrj6/UVmcfRrToyk7OhsRkCFeumpbwn/99
	75pYMK68bOjOCUPl5hSC0NajRp82d65Xn9ScuyUHrRgvJi48xWhALDMFhabMEh+N2AKzUYIx+7V
	wV0Gqt5inAeEPR5ZCjLVWjhfKPPDrOTzBpSbzRQqT7ZLyv7lu3pxsoL1tFjdT8ZcS8JSjTspsVY
	w/Vjis7CI+zX9zPy43WWnKQDG6PpHFOdjiM3p0vws5gGY22DaQZKCaHP9suaD5ovMB8Rrc8I4D6
	O3jB2oSqhHnQaj
X-Received: by 2002:a05:622a:2d6:b0:4ed:ca4a:f51f with SMTP id d75a77b69052e-4edf2173db2mr191443851cf.72.1763400757175;
        Mon, 17 Nov 2025 09:32:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGT/nR1VfS9lJVDvioCNcCcSmGfxHYtTTdwQ+tY5rNTdR+7q11s8KtgeREig25AF+lCS2bBbA==
X-Received: by 2002:a05:622a:2d6:b0:4ed:ca4a:f51f with SMTP id d75a77b69052e-4edf2173db2mr191442671cf.72.1763400756007;
        Mon, 17 Nov 2025 09:32:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b30c4sm3315205e87.31.2025.11.17.09.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:32:35 -0800 (PST)
Date: Mon, 17 Nov 2025 19:32:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] clk: qcom: gcc-msm8917: Add missing MDSS reset
Message-ID: <qwonj5w45jb5bmbwwqt2f7msgjzrwllvuxwbtyl4uiwnuvphxh@bgeasw6koh35>
References: <20251117-mdss-resets-msm8917-msm8937-v2-0-a7e9bbdaac96@mainlining.org>
 <20251117-mdss-resets-msm8917-msm8937-v2-2-a7e9bbdaac96@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117-mdss-resets-msm8917-msm8937-v2-2-a7e9bbdaac96@mainlining.org>
X-Proofpoint-GUID: TaYOfi8taK8UiicRiVDRJtPpu6Uy4Plu
X-Proofpoint-ORIG-GUID: TaYOfi8taK8UiicRiVDRJtPpu6Uy4Plu
X-Authority-Analysis: v=2.4 cv=FPAWBuos c=1 sm=1 tr=0 ts=691b5c36 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=wV13qoKRaYsQ4mHf_eYA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDE0OSBTYWx0ZWRfX/wBpBm3zqG9L
 X9/F13TUeqaSDq5BugyKUajokEUNYkwvT8xnj4t7nxhrcNMvV9U66KKoCJ6Gd8M3iEJZmgAMhGs
 gAB52E17nhm/ru+ePmZxSqUc7yRBZ5b48Mccw3QP+xIxVCIGvVnHt+QHrTQkO5LAz9ndR6Y7+Q/
 i1jSEGOLfAZdXnAPEruApSCmIDUMkLoeixTQQsiv86xlTxhXAH8JkACocd/8jfZriGUmIIA2wNb
 SKeYD3QFJkxem1Virvr0QpnayWGOKuX7G0MFg0R6FnuhIXWqFRweJXujvYzoFQUGZEVDtprVZEK
 rcNCZbEYWqIteed3iRfnifTV1+jb+poAXP6ygHz5jfu0Iw3th8sj1wVr51uTMqZ+Gfp9c9njxKm
 /BBE11O4vEZ4Ve5A8DznSWcAqv3dMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170149

On Mon, Nov 17, 2025 at 06:17:53PM +0100, Barnabás Czémán wrote:
> Add missing MDSS reset can be found on MSM8917 and MSM8937.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/clk/qcom/gcc-msm8917.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
