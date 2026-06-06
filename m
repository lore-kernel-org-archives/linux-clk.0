Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A5938758E
	for <linux-clk@vger.kernel.org>; Sat,  6 Jun 2026 11:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745135; cv=none; b=kDNOEOm70VtMN6jw24u3Rqx90EWZHyv0Mu70FO3fm4vOla0tyWV48g1D5kOKQrSfwkKixf4OqfpFh1+/AsqWMuwVSLYOWR/3owjDoduqFUUGcJmJGBcGv+8RuHYADCb+KK9vD2XuH/vN2r5AUhlZ72duWqnn2vUNfZjuyNpGEIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745135; c=relaxed/simple;
	bh=Rc5SNq9ypUEc+Gmk+gMVivGdRF3kWm5E+NzMvfynb/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fG7q/ObhKaKYK8boHvRd1m5rPJVa6Bs+brtVVMGABHZtTdEeax6B7KiXMrbgMgBZ2OkXI0Z1ZE3u9Wo09MV952B5PMM7VwI2Whw7tbnkAoOzZBkXjRIgdLrV4Mss0tYbbOBH1guCNFBWK+085Yg7MzKYt3CzLmUajloJoNK8cT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idJhqVqs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gR24Q7c6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idJhqVqs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gR24Q7c6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BHwne1252268
	for <linux-clk@vger.kernel.org>; Sat, 6 Jun 2026 11:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lYibyQhkVIdTVochn2DOZD99
	ZwEouYLEHjbrhyxnVLQ=; b=idJhqVqsqkygHD4ZgE5XvGf2qjYci0pA0yzd0ACL
	RureF0dhPWckpDMjmFSPQjp/CCkupgkHKOQhDJ+xJQbOMVAh1CWiksolhIvkt9TW
	BnBnyY1mYOl7/xmrDcNRd1dESu0hzUKSwRliE7M+Ognk40Efh9l8hy522DaSob2u
	6Sm5P6iJhAbLPTc5jb1bA6E2ao3Rw93q02xD0uW6ceNmgYiY1jPSjecr77kSVcW8
	F8ZiahQkIwU6rtocbQYVNu/Hm07Smz0AI7+x87Y2CG+6xqv1JIzP9LOqsP9Q+ots
	7NV2FYdpUtcZ1LYv4oRBXKJn+Ibc13uVgJNWcJAhvBcPcA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf14ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 11:25:33 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963d7670e38so3486920241.1
        for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 04:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780745132; x=1781349932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lYibyQhkVIdTVochn2DOZD99ZwEouYLEHjbrhyxnVLQ=;
        b=gR24Q7c6MNvYMhe8npKh/S7I4k+pDbtQHmv/AqFe71DjdMO5Nzv8ovX5rOJYezt6PY
         rBcnIaqD+fo7D3HVDjrynzY41mlW16a8E50CUwNDjrYcDK0Gs1drOnUtiQ2n+MAZsLBT
         bZnapQbr7LjKnldWHEWP/ZPNJEEfDwvVEtCBKaZ8fzmzkbZXCnvU/XAJ+45FpBf3YQlI
         JUBM8Z2HYso98tINWmQZPRriTJHFjCwzoca5EvEL0p4+8++PknnBBzqVK3JQd0rDFe6f
         qH9ZcphtVQowv+omKheWo6cohMewX0Qa4sRo51TMAIQZ6f0s/VF26s3xtP1/gokdlQEa
         YjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780745132; x=1781349932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYibyQhkVIdTVochn2DOZD99ZwEouYLEHjbrhyxnVLQ=;
        b=YZ6FcOl3XManrMUPBJ5nzvKOGWRoUAgfnxwNpwHjt2WwWaYY5ascZHQ/EDGDLcvjbH
         Dr8mwpMHu5nHGMmAcRUKCXlyI6Sfh6D4GWDi6h2cDAoR+84iKFF6MJDu5u0Lf0U3TmRv
         83rZYKev+wc4EiomWNVfcIjmDbpgyL4r9N7b+k3E06+MhnYRbzqB1lQKu9InB/Xp3TJm
         2KDh1Vr/71Q/363vHTnm7ES0Ql51mjBzB5SYaqBhHtlM8Q+kmW+Sb5C1iRGZBSsAHrAx
         Gw2lclsg5osNbyqupQbAeiwH9P+0BI3Ci4XRFB4FU/8NCkdJz9+jNGTOGPQSD/T54xyy
         cTNw==
X-Forwarded-Encrypted: i=1; AFNElJ9FKjvAuNVZQ1HP1rJM8xfQWW9IOCQSFnzcYzlmsk2y3sN6AhQDkShpqPNGfBHHs87m5IgDw2HQslQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSOOhnO4EYE2VLHDHuFee3fjFZyW6K2Xe0R8RjeRW+TYV6IKt3
	RGhXk/mmL8X+ZvVplAm66K4WyTV7rlDUdwssKnc3U5el2m770wYxlaDrIooCGoDzq28uy15DZN2
	hx2jBrzdV4g3nL4Ap/bCGsRkA3TW6aZ7Dq7HbN5HxMW87k/8sUcEQ9vXMu09kCck=
X-Gm-Gg: Acq92OHSFYzoLMu5XkzjQOa6rDzslryi1Rcg4ucjTTyce9e2SYGlsc7ZEaNfx+3Pw5D
	UrLMM9ycTIZfM41HUXjL03cSTD9qrqlbQsuYz75vLG0hkDGvThRKvEqmZ7GyHy9hy328bLMMqY8
	eFksbGRd56P9tpJOPxUXd6h48OKM28pzAqmI23msuuPjuiuy7gJPIw0CzfRZv7DJfOPp7g3tUsw
	CwmGyWsgcSs4dnUOmiZ3tfzyI+jPh0xmbnl6nBx0uzKCj3nsrF26baW2Ynz7qusyowZ8Nybj5NQ
	eW13zMo4x4I3T4xWNBtytutVXj2Lq02FBhL5Ef96iW5vU/OD7xw8MkSjVcmbTq6JHXQZfslfsL8
	6J2+ZQGwkt3f0Rqk0N2Yetcddr3wH+OZ0+cY9Xa3Dj9zrKZos+86EYXQJ8bHEIWQh5w21PB52ON
	7drv+Qe9o+Y9qtP2ETHCxlR9WyaFXtYAMpZJzJuTqo3cWaNQ==
X-Received: by 2002:a67:ff0a:0:b0:6ca:4d17:99f1 with SMTP id ada2fe7eead31-700359f5a98mr1913637137.12.1780745132406;
        Sat, 06 Jun 2026 04:25:32 -0700 (PDT)
X-Received: by 2002:a67:ff0a:0:b0:6ca:4d17:99f1 with SMTP id ada2fe7eead31-700359f5a98mr1913635137.12.1780745132058;
        Sat, 06 Jun 2026 04:25:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac34sm2415248e87.39.2026.06.06.04.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:25:31 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:25:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/13] clk: qcom: dispcc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Message-ID: <qmpaupicfg65jusajonufuw4f7262fju6hqhia5u2hgan4h3hi@ngyujlxpxbd6>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-5-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-5-8204f1029311@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a2403ad cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=g1TEsck5Q4wpR72tbYEA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: 1Lo9in6GTAqOLzjORRrbzwudF7kPlLfA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExMyBTYWx0ZWRfX0GYkzW0JA8hE
 /jAU7SqhFFs2JK5+zwPNNyAnlnRISHV4zeViVP6YHlaMvhdEUU4CC0KTtOlkyyV2WPxjn6YfLCb
 hpPppDmKW+Hk61E3OUj64FfrXZtw0ITVinpYZUzaF3HOjPEAnxjn5JKwUv8AkaokRIS0ZcV5/nK
 T9GVQ6RPNqgJD1hlmi/tmKPjjCoS3StoO3Ss/M3Z9CdUfm/2IulDSEjxCfRD38pmZGtlwSCylM+
 WDD0VO1M9NnCHmxrauYZPSomX+57DUKC1H3MVUs7CkDhK8dzS/lQMUuSofYq5L2hliJ0klBdC+G
 3i7j+r9Aecgieqp5+EzyLTstyPO3E0EfS7FF8A1UuyEkuu8A9eiqxJp3JvA6aztnfvh8xD4a2yW
 dPDk3tZSSZm3+ChSTHj6Q/8k0W1J/SkRvrwgbAaFh7Kuxr0o6KTBRI3Bbnc3+hdYp7iue5RkWiv
 jBrwtCQ8SN0dS+IGo9Q==
X-Proofpoint-GUID: 1Lo9in6GTAqOLzjORRrbzwudF7kPlLfA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060113

On Thu, Jun 04, 2026 at 10:56:11AM +0530, Imran Shaik wrote:
> Update the QCM2290 DISPCC driver to use the qcom_cc_probe() model by moving
> the critical clocks handling and PLL configurations from probe to the
> driver_data to align with the latest convention.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-qcm2290.c | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
