Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FD318A92F
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 07:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064556; cv=none; b=vFD4vGAV/+yqXALW8T1YPyzhnX6j2RZjnTFL5vNHzdwhF+Alb/A+bUqsd/YXusdjWdaepoAU+k14DHfVLaP8/oHHrXQrqVYiKhY6vgKPPEY2tUoHKjdZUOqRfnr3X3KQx7lwA140/hD/SZGioIlOEZryaOpeYvhk39s/XG/JTTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064556; c=relaxed/simple;
	bh=BzjWFRb3b9wkGzZJrhXMK19l+atse9KtontvxIdAvdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uxoN5pGU7+9jkvmcCFeX5DlDn686yVrTjr6QHKfEtvgGSu+sFVdihfxSYl32wQZ/7sTr3SS0zd3o4+VjZsHR+E/M4MAs0Ehl3oyTMfVUriqsiqyVyjWqzxI4ZLhT1MXXO7+CV3MWqz9eYpkiBhA6mQbnTFi4aewSEF3EjtjgNTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EFH3Dbcv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ba+D2z10; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EFH3Dbcv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ba+D2z10"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rjbi3108915
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 07:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vvm3bjpeCiWNxgAV/GYzQ1trc2JZpsOD+BVEOTOo7A8=; b=EFH3DbcvmeLsz2rQ
	qNyoRYSVImtQszdoukdpJcm80NL7eWBIR2UeL4A1fr26BHKXvQBfndZOM8Nr+vX+
	/y/dva1+SkSE1PA9fTDgVV/MTVbJH4PAwv/d7sh5zVmQtATSjBRODeIQarrzCpUp
	Fy3oCExCNRvxFX0GHHlb2YeL7QkQul7CbfAM8MvVhuK87q5VbyXlysyo1pvlxvqA
	9VqXH+gnn4abck+qYYRl6QZhs87+mQMY34xz1glyLhUcoceFPfWOXbT1O1wvBrxY
	cfY7VWsVhP+VZgUxRn6owp6NsEsyNd6nn9LD9+mOyuAkoTQ4edx1egpSay4xooZg
	VsDg3g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60ey9xn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 07:42:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c08e9c344so1302681cf.3
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 00:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783064553; x=1783669353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvm3bjpeCiWNxgAV/GYzQ1trc2JZpsOD+BVEOTOo7A8=;
        b=Ba+D2z109OQh4jexEBRWWVmqFXPwCoR9WqvROPcMcpshHvHgPMWfXxFE1uDCzXJn7Y
         cOz14N3sJIutYRpydXC33ZBqtI1Gc3GM62k8fYg+AdEMA4UawMMSKDd5QRwm9qErizET
         iAJqXipZrJxTBZwiGAeIbXfMK6TvpA/PdGOjkcP5/Nx7wvauRb945+wYJvyuMTkujkN/
         lrAOJLCNLhrDJnvo1nNrs2uiyTD82dedijRfPLno1IPaj8X6s7Aw6Y4ZnJO/T2gN72u+
         CbxPz76vf6ucdL1TbQW5XTGT//88PeWO0Afo86c1uxnUhN2UHbF/7+nK3jhknZ3vuNGg
         PVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064553; x=1783669353;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvm3bjpeCiWNxgAV/GYzQ1trc2JZpsOD+BVEOTOo7A8=;
        b=QWZ7/RKwfPbGtzOd2OIoHkF5ocWd8pcCBfZ367w3ZRF+lUhrxnkRQuoPCFvQBhd6hw
         ShuyUz9tPUufE8QgZSgKeQf51T3VhWvwtbBogBxw3wZ9TUwegD8MBYLxxf9PTLiRPebF
         Z4sL1HJ5rKIYaLTjgZ2HBUehMal+VWcuE2l8yhvGGPCXVJWtI7qKIVhRnVpyiph9GG5f
         wczLEiYMez62CMSAs9ev6Ndwezrh6f7wmKxbkuFLHyzpCy7xRkR8pcetCnFx/WOFiKVj
         KnXRyfaLy/cNNl4plxeRWSAhnWS/wzwdf6dysP8AeqCQ708LvU++1JBJN60ypiMdZ+V8
         GQWg==
X-Forwarded-Encrypted: i=1; AFNElJ9574lCUnox7ph+pRvRuVBTZM0PzrEjjVX48/eKKPZ9us8LnjCqKZ3kQJZGZy4SMzHtTJ13DJ9hjkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV1BuE+xI9drwZZyvGcGVeoptRW4vyVsIAsVaNGcAHsUnS8tF2
	/v5pSQGPlFmqCKX3wfpfFuPPSKllPo/s2TbajTOZJkvh1e3kjUcCj+7coB9zRrOVeqz39/Ry4cO
	A4AAPF2/42rhBLXDAvE/CS+OgLQDZkGtfDnh3KPCL6S7wb6h4U9jUl89N/HVqLj0=
X-Gm-Gg: AfdE7cllaatyfNUKeKM7gvv+xNZ+ntHZD1xoUBld53vWPyycBjvb6VzsnbsUpNXiv4l
	yGC9Rpv/UkYDFXkJF3gTkkMkxqid0S0WPbo/M3UWmEdfzLXWdLD1R9WEI+lY/WgUenOTTSLyS7j
	oorf5e/A7zzEEnf5xxvTX+Ks6ufaIe7oqYufstiPHMWI8cYjNeIwzqH4nqftL68pql1YBOqC046
	w4VF86gN+j3W2GQm9cfqtAmcHPwDj5KgX94LiO+9SxPl06ABmCAaGhhFxjqmBK7RUwpRgvy82cO
	Q3Lf0jCzAgV44WzAbWqclTNDpE6H6Bl4BReuXm0nB4qV6EpPKptFwDMjrGo8C+QFakuAFhtJ/XT
	O5VH7/WzhfnHn5bferazx00oxZv0s7RV9q1Y=
X-Received: by 2002:ac8:7e8d:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51c26a3ffeamr90733081cf.2.1783064553444;
        Fri, 03 Jul 2026 00:42:33 -0700 (PDT)
X-Received: by 2002:ac8:7e8d:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51c26a3ffeamr90732821cf.2.1783064553073;
        Fri, 03 Jul 2026 00:42:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f38f3sm246032366b.57.2026.07.03.00.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:42:32 -0700 (PDT)
Message-ID: <3788c687-b913-4b33-b105-9e10c2721536@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:42:29 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/19] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-15-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-15-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3MSBTYWx0ZWRfX1oYjuUhLdh0D
 bEUckbMpCCrhqJ6QeLceS2VwD+MdSklJz8LO/Bd2GKEOshwiYIH/WJE+0TeQFin4Hr+dAwuvs+A
 NBivCeXrjLDvY/n6LxttvVYngHADyIel0FE0x0QVMh1QV+boTCCuswSV9sYtjjLByR11PpiFPbc
 QbkrJInvczTZ4bfujZsjcObvMKWfVYHkUFhEiWLBajYl2r+/AzKlCSkFX8oalxlsN7K9BsSWt/I
 /LV5lIxQknPY7upqLajvM91iZ87u32UAOB5UW0bPMV24u6MZOVwaP1CXiDqlO++Bw7beVHsve8P
 xPZzPdB8z+so0aAfBYLPLoSHhtV/O6FrbFWnBfO8nZwVmjN0PKjfucdguS1xdo7riGhGYezSMi5
 2cQB1gtS7GxOMfNS2e6n1hIOCSD4iX+FQXSk2Yqj+uDmZnSQ9IDWvf6fR/jHg6tIBkZCkZbLknm
 CCXuWDXHpLdbTDI4ViA==
X-Proofpoint-GUID: 5ap6DLceIfq-bHRZvvVE7mfZ6byjwXZz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3MSBTYWx0ZWRfX130bWXI7KFza
 zWsNyVy8eIiydTBHEm9e9Q3d1x6LHVlvtO6WNkRoLQXh9By17ZpTFRhf5+H2b1Iz4G6sp9MAhM/
 zvdkkZrlzkrmtFy9KllURNnIseDus+Q=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a4767e9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=aPmvuzYC7OwECpyIFukA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 5ap6DLceIfq-bHRZvvVE7mfZ6byjwXZz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030071

On 7/2/26 8:31 PM, Imran Shaik wrote:
> The RCG's clk src has to be parked at XO while disabling as per the
> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.

"HW team's" > 
> Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

on a note, also not something downstream does, but hopefully
this is right

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
