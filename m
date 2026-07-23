Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A3F47CC7A
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808032; cv=none; b=JlAP7+sgJoD6Anh3kNEctprf5YazkyKnIuHIv0wEVSZXWhV6FDUb1irf2QpS8tAlz1c81ALcuiJzu/fx3aSGuxvxJO55S0kIJ8H0eNtxsfTUVCjcw4nXwtKKHPMlGwuxMMVFi8rQ8QZc+8tX+W+RT7fYW7EsEynr8x3FqVaAn9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808032; c=relaxed/simple;
	bh=ASZ5ohN5yTy18gTwjj32uTj76XxMTu8kKaZjkY0YGlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aj85x47HY2b0pnMmNAxoEhfJGpDTJJPfj7fcDwAGda1qzw3aC2rmleuos21t9Q1m5f0i0w2iWpteFUuuYIHeFxn+nojQaZL/OAFnDcEPIZTNrwlIE1fGDi4qB86zdBs29TlQOA7NeS+Q9up5oV/e9os/rJ6en7bvKb5iDpHwoHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CFHKGniF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLla1Lhy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CFHKGniF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLla1Lhy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qakE3668011
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 12:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mZ09E1o1UpWUHsx21y+X247Kk7xKrNwhco5CftwYIBY=; b=CFHKGniFpOMeFwy7
	yxYXC4PkXts/zp/F2RN0nu6eRVB5cPisjXTPjmh8CDEJkeLhoMQUIx7gvK5RVjC5
	qR5j5ughCuGka/SQI1HP3G6zV3ByCqqZbytkOr01iiusi6t/Tj9KwlHECKjMXgB9
	i0M7cQ7smTOacl5pG8Rl6ZiS3Vpra2bUPHJlTN8mgLumwC6NC22Xo8kRTecFHO/Z
	ceDoxPaT/4LG8C6XxPiNTNB5BoK5JJzshhpw0EVUftNPvUv4MKbz7F5zAktvK94L
	258de8AxvCYYoIHu9IskaHmJ8UQZ4GC+nHFOTCySMw1TwQ/t4La5M6GRnBQbQ56D
	E590Hw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc32er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 12:00:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ef4a54f86fso2217846d6.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 05:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784808027; x=1785412827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZ09E1o1UpWUHsx21y+X247Kk7xKrNwhco5CftwYIBY=;
        b=QLla1LhyRpUuB8rronp01uC8fessn9FFNAAmVAn5BSZ7UmfrlaiKKHQIeJcwRYDqy8
         wJGeJHBvt7G9u14UgFxY/2lj/+bg6m8gIzrFQhEbmpFTQO7g1xhG+iwLH0pFd578ou87
         wRUlTsLW0k1fnuMPJxJ3U0LwV9iiyHgqzG9zXSN69HlI8g9EqM832WE1oOLNE4EJEkSG
         4wxhj4Yg+C9Ze/EI5L/HJwT7woKfp5zPYuAUCei3DylEKPRKn9kHfCO5kPomONsqdtdI
         NLQU8yQO3dfDx3Qla9Sn8uCiO6yPZdqh/s/fX5igcUZCX4A4D5iOLb4V74YjKI8QSH3d
         xj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808027; x=1785412827;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZ09E1o1UpWUHsx21y+X247Kk7xKrNwhco5CftwYIBY=;
        b=L+GgovtZVi648rB4TR8G8epXyutcKha0XRZ3rluiTjQWhEskVLlJufz5eEeWf9/mZg
         ylZ87vTfZuZrxvj5D5R0niolmz6yhxDanV6Q0vGCgcJ9KvNoO1QYmOy1Xb0dPKu9IpKG
         f1YOL5UU5g7U7hx8V+MrjeEh4LcxqZXtI/zKSvzqzVI4vxuBvgrmVKAew3zsmGiRadhj
         hCVtSZ+UAiMZTwxBF54LcE/7UnAEzBF6m/r7LnzSE0oHSHQgeRjT0CcS4B4yP6nJF1eA
         q7CYrWi+VlHwCkssbNVTdyL05GC1OhSsAKLY11tyV/tEuk/Wlf4oECM0o2kF3bkF1I+5
         Kfaw==
X-Forwarded-Encrypted: i=1; AHgh+RpLWx+n7uqqh2AODOkANhaifFU+fWPjM/pQlOZ74mDzJboNUNo5ugJSRtwOs5rHxD9VtgJLkSpT5dk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPrMdoLH3Cu2poAAKnJzXC5IQqKOqIj38TsWC4TrwDnu8jnPqm
	GusEX8diEOGEglpIsfUwaPLvy1yiKxwR6Q3tNHE4Cbl+IQcM7GHUMjAtHpnPtBwH+8dJpfNVhSn
	WMRiPqm81bSG6vsI/+qsO3f96VcHJ46HcG/P4EBjuhDcNzLmlqvmziuMm5iLNJto=
X-Gm-Gg: AR+sD11BoNQa75z5GXmW96vN6DCDs1toVOnWtSmxjXmgebmj3gyfLSxItTZ+QXE73WI
	D/Rqdu9poNWmc90CvjwiHTlGmhtBtToWdnmy3aKSr2rS7vXGKFdCUX9FOtAVth0hKb6Ajo9e/un
	+s4EIGRf1rj8VxlJiyQtxF4bEjsTidWKLI+WNIBaDJITMN5NEofucQ6kXxLOiBAT+eGxNS93EPx
	FyVGsZw0xrdTgLokOGKDFFIHOzKpQVnbEeNJIp5VtjEioyo/3HeSbWkCYzKcV55ELowpglA/ljK
	x7+R+ZURP5CPviRWT/LMYaztG+y/vkHmoOcbUuvAATlK5XufAHk6FEwFADU0NQv1mhuURNyRxd6
	BUOSm1/95sJB0UhJUd+fBxIjl
X-Received: by 2002:a05:622a:1f0e:b0:517:6162:daf5 with SMTP id d75a77b69052e-528470df736mr1838411cf.3.1784808027441;
        Thu, 23 Jul 2026 05:00:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0e:b0:517:6162:daf5 with SMTP id d75a77b69052e-528470df736mr1837651cf.3.1784808026841;
        Thu, 23 Jul 2026 05:00:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32af243fsm226702966b.26.2026.07.23.05.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 05:00:26 -0700 (PDT)
Message-ID: <51e3ac48-d062-45bd-b20f-c3fe29e43aac@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:00:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: initial MSM8920 and Motorola
 Moto E4 (perry)
To: Aneesh Pradhan <aneeshpradhan2004@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Catherine Frederick <serenity@floorchan.org>,
        linux-clk@vger.kernel.org, Aneesh Pradhan <aneeshpradhan@acm.org>
References: <20260723012431.48499-1-aneeshpradhan@acm.org>
 <20260723014627.63310-1-aneeshpradhan@acm.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723014627.63310-1-aneeshpradhan@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dd1FBpRMbZHSJO1xb-xE0WEyv5BKAAoC
X-Proofpoint-GUID: dd1FBpRMbZHSJO1xb-xE0WEyv5BKAAoC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDExOCBTYWx0ZWRfX9H4MQ5++SCl+
 Kc+xgBNxqqitfIHIFZgV+jzgqqu47sGMyhpH+79CdzQqcev0UYR+ZEMVVqlLc4qjFS6LVtA08Au
 hbaFcIUGdS15g3ot95cu4GZ0J+an+0A=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a62025c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=hLbMPmW5DWU4JABURqAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDExOCBTYWx0ZWRfX7XXkglScJ2V1
 SWcXQUnbz4IFqW00ecgLFHAo6ez6AMpGflLYHzpoyDt39pYy8Hd7nbKueoXkPiCgr8xFInPap6D
 t20g0uWB+1dTicl7K2mKiyl0Sa7JGOY9DB/ouVPpF+Tb4lodRcbnoWC86y42IDUtmYT/aIz7B9r
 C9HaDd7T6HNAC1KoN2LXKiP80H4UtvoTjI3MyBI2ecRT2suh5/Iscz4nTHWiAp57nWqSg0XqscK
 31aWi8QurZdx5qnRETfBCK59dTgrvlP3rjsqyQbmXJzNvWMP4wG7mLEF14h1XaopUEKuw4x946+
 qobifpkhY/sfhNYW22Ca0VyyMO9XVsPVHCJdO1Q8UA0eyxznlE7hG9IukbuKvtnxxfo16vA4urK
 mzKicJ8yUNSMuT5wL01HajAVd68vnmytWRhOfy4F0r0LNjMW16/h2YmL2z0/O9wgH5D0lRgGatz
 WSDuqWZBqcv4WcpplmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230118

On 7/23/26 3:46 AM, Aneesh Pradhan wrote:
> Initial upstream support for MSM8920 and the Motorola Moto E4 (perry).
> 
> Depends on the separate qcom,rpmcc-msm8920 clk series (binding +
> clk-smd-rpm) for the MSM8920 rpmcc compatible used by msm8920.dtsi.
> 
> This is a trimmed mainline-first subset of msm89x7-mainline/linux#48,
> rewritten so every phandle exists on qcom/for-next's msm8917 / pm8937 /
> pmi8950 (the fork DT assumed richer SoC/PMIC nodes that are not
> upstream yet).
> 
> Included: regulators, eMMC/SD, USB OTG (gpio-id extcon), keys, RMI4
> touch + reset-gpios, BMA253 (i2c-gpio), WCNSS (wcn3660b), PMI8950 WLED.
> Deferred follow-ups: DSI panel, IPA, QDSP6 audio, FG/smbcharger, modem.
> 
> DTB build verified: msm8917-motorola-perry.dtb + msm8920-motorola-perry.dtb.

Please send all series as separate threads and all revisions as separate
threads too. You can use the b4 tool [1] which takes care of that and a
couple other annoyances

Konrad

[1] https://b4.docs.kernel.org/en/latest/
