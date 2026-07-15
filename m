Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CC142F71D
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 09:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107901; cv=none; b=fXQQnd43iZpQ3IbMToO/4FTFpDKyYOKcVYvQSL10K17webmGuNhsElK6k5st29b5ySR/UxEehZR0DNsreNF79ouBRNsfGaWgAunyNO3+Yg7/gREX/MPyRrITkTcDS3U9ZintmZOwX7iCLL8kmfMMATdlCWTEzJh7LcaEAtWdACU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107901; c=relaxed/simple;
	bh=xPtwZi5RwdtRu4PFwA4mNzCB+LYFKWcb6NhfJw9qcfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ip9sv6rxwHmkMWbFhAcQeGucy1AqPgo8+JTCpBx5NhO1paahsR43jVRfs4fZcNO4bvG5JxbEYI6CydgFxG3E77Z1FZdLZxHItYqI+hr7gLlJMEHrUKp7QM0YFQrPPXrLW2J5tHpHITHuQZdClkcboY4U8YKLKAH0SCWSij4+m3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KH36m19v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnoULkI8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KH36m19v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnoULkI8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9SfqL2679746
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 09:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L9a+h5TbfD3DZbvHIMi092MFcSpBlC/pDu2Yq75Eu+s=; b=KH36m19vgGV5HK/M
	w7RV8ACfKQtySVJAuWLU1P62NPNnJuSJUND6v6aoFqcAHuBGroi92gm73Wrrlwtd
	EvL/UEG9L3mVgVuKW6IUxYEVdorxW2T+6ueEDXM/2qz+sgo7DJo9b35tUcGhPxo/
	4HSZQ938O+/Mm2bv8WRS0xbPq8+HwSQw0E0Sbe/PIA9aCQTZPO7Mh3zVBeJila8m
	qMfWQvEmhhNEeYXAk4k0ZPzb0OJszsIndxSqGRs06U5wFEpmb9hedHL/uTVmFf2s
	L+KCtPV5nkdAM0CqNWhaQb4JtKPTjsiUlY3bSV7iiPpricoFgZoCNpLgSwXNhgrU
	b651VQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnuv1tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 09:31:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73997bfbbdcso87551137.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 02:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784107890; x=1784712690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9a+h5TbfD3DZbvHIMi092MFcSpBlC/pDu2Yq75Eu+s=;
        b=bnoULkI8wTwnTdhpaC0OgbXEuWMxXuouFZ/nerip/j5u7G5bavXQPkhyqHYFy5c4Si
         GTMaXonvQLDv2xy+Hy6aKfBH3NQ2aFwLVOBE4HwHggJbHgZttjQw4vuyFrzdRiNeXffi
         Pe3iHr4NseoZfHDjWQsPOnJThUvOSo4mvIKRoMSV471XT11Q2CDj316cRFF6y124ngbl
         MU5/rdF/aAfuSEqx8WorqeTly6sXTmkpZOU83KjaAF17xmcAojHhCzTHPjeb4AY9MbwK
         Za7tM1HB6TKTRpgXjB/vqHkuBpwqjJO2FPAjBjPuBuFJEFJlhEDfkwjK8R7knxPGz0yG
         hxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784107890; x=1784712690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9a+h5TbfD3DZbvHIMi092MFcSpBlC/pDu2Yq75Eu+s=;
        b=KdlIq+Y6PQjoFbPefZK350tWbni7yRhcg5mWSve4kyPVjNsdsly8LCr3Mk6VXNa8eE
         ZA4ZB8y2pCiRlSEu9L82oczl9A3p2gY9ikuZFEqbwedxBdiytNob77onj1KQ1GVedbKQ
         dj/8+T+hYcHY3mBgWdDTpr9W5U61ftBZXh2g5Y1FsUHMNWxXWkddlxLx2RVrnQIB6r1e
         aAJouh5TvwhGB8Baf8VQx6gTKZOBw8u173JqvkqsYt/N/3tlFXab+33qRLi2w/GreL6D
         8kwKKcz8qMexU0KlaHc6q+SUVh80JbB2+Pm7lujIJGd/YjGmVXsaOyBNPjGbQaQ2/xWC
         wbhA==
X-Forwarded-Encrypted: i=1; AHgh+RoBeKweNlNF8xxT5bVZI/XU7rPND6exT+hh98rBkJZs+LzP0T1wWeqNUooPhIyX5dprrD2yYXWKeOE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7GP0kNrPJZIw3afEjWSgk6jJ16wBc2MIn9teSQR/YFgmHqIm9
	sEDfsuSWfIdG+B/LpunDFqikjcmQE42KVwc4jRBcZIcFHJLyB3p4IlCdGo+himb5kEiJpQXz8Yy
	ZjIZUBocQCafFlS2UQ3HOywwnO+4rT2BqOUUh8Ck3Vz/w8WN+qso66QCuR5gmXcM=
X-Gm-Gg: AfdE7ckwGF+fBJphAB/6OnvWvSVmcJKgcdaLTUQ+dsH1b8iUs5PUmAcrREFy6kePpIa
	o5UecwxX9fq2xGn0Epc32In0bpdReqyNBJPFI+R85EUbK3qaiVBchrIFo3s4HPqDBUL6DYQO4zR
	mJN6cMMBOT5135MjF+QIAfGqe00CM8qvyyI41U+JAS1sozJ49jcwVjeRBeeSxesdWEGmmytH/fR
	H+Z2qRr+o89fi3dt/RKhEZrvHrwFsPvXodKBA4g5Vh3x7XoewQXcQCQQ3yI8i/iePywRJVlGdj6
	O6DyioLCpHUGcjfAlVZCWRSc0c4EvSrb4D0g78yhfWeDHs7Xg7o8GQUqFEg6Yl8JljL4ENyVShM
	BxzJ/YnaCdSAq7JK0gsDvRR1qGhCHBiHVIOc=
X-Received: by 2002:a05:6102:5e85:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-74533b1aa72mr3923445137.1.1784107889864;
        Wed, 15 Jul 2026 02:31:29 -0700 (PDT)
X-Received: by 2002:a05:6102:5e85:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-74533b1aa72mr3923434137.1.1784107889467;
        Wed, 15 Jul 2026 02:31:29 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd288757esm2743992a12.9.2026.07.15.02.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:31:27 -0700 (PDT)
Message-ID: <40404aa6-7822-4c65-abdf-0ecf1fa073cc@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:31:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] clk: qcom: alpha-pll: Check Lucid Ole PLL status
 before configuring
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
 <20260713-sm8450-qol-dispcc-v3-3-56fd05822270@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713-sm8450-qol-dispcc-v3-3-56fd05822270@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NzpvSwGnzk7M4-_x3wzCk4bfrI-9pE1H
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a575372 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=mfgDh_fDUIA9-y0A_ioA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5MiBTYWx0ZWRfX/fOmHv3OGdfl
 G+mmGhhDwEbEMsFAhkhDeKrl3JNHUVwWOMiWChfdPjs/wPp/LtNi5Uk2cdYJjCNVFUriU1eCDg0
 SLznz/yE+VXtaTujuFq5t9NzYKIti6goSgHSMz73uuknIQ0q4CeoNsqC2cu4j01BEDOAm59P9ZS
 KZMfH8PKhaqAS/nquG5KUdkZEn6p0PzPdh7we3dA27jRYGccwOf2eAbHLeVZSSSVFOQyzVNmpkx
 gh9CWICo7aT5E7Pj1UMOv/3Tgkp2qz1Pi4VAo/Hlr5hdUbJHyCYu42ORXFew+fKqCe56iZpoKXh
 w1nxSKr9lqhTSm+SXzQm2HwLAl9bxGcLOX3IofZxd/Sv1Khu0jWyA+K6Q3s/qJrWHDVQ+B5zy1d
 5Axrkz4L0N3t9iObrqFoP7qA6X7cnwgxVzB0QQAurDVD6LDgds6DbWMtOTNpGoqI95qOI5AllwV
 dvZcNBo1rtF6Z3urGEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5MiBTYWx0ZWRfXyAhD6j4bBBwS
 cpYjxlLA02d0SnHChxm5lF3vRV14BgrWBOx9+JgZHJn1ZRIa4lG31mespGrfhNSyPmI5CDLGQCl
 E1gmlQ1h7vpmlnRRMzJqb/ENFXg1QaI=
X-Proofpoint-GUID: NzpvSwGnzk7M4-_x3wzCk4bfrI-9pE1H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150092

On 7/14/26 5:28 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> On some platforms such as SM8475, not doing this may result in graphical
> glitches when the mdss driver takes over.
> This fixes the aforementioned issue.
> 
> Fixes: 3132a9a11e57 ("clk: qcom: clk-alpha-pll: Add support for lucid ole pll configure")
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
