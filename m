Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D4C40D595
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221797; cv=none; b=Yr5RCbKSgXTwiJoFZO2mxeoBPuaCcL2WVVXquizv4bfV7OzApaqm2qUezyAbodiBMB2So6DtrFKedMwtKjPRB48k1exJGXIBgV8GjN7GUsxBbwk0ztwL8eBjIpwCPUsJw1mvPm6jn3tevFjj+s0CQWkBR8YJUPNnOg4TYYL/8xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221797; c=relaxed/simple;
	bh=HPv9hQ1X4Qdl0VjYTO2v3OjAX3zC8AUQvrpeQ27AzV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwpUDJRoLfc7tUfIEZKZfI+AjGFw9vAp9qLGGfASMyWYuVtK8T/bxoOTecZfibnv6Jy30D37HNgoqCFVCEjqpk1IBKELNmxWfc1oHAoUYvoSwdJ3wihd67l1+noUsvDbXAgFT4zfcNYgor+rhrsRkZoHq5ueDwQOEty3eLXBn9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/xCpyS3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WhBNkOof; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/xCpyS3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WhBNkOof"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8jhMa2529703
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=; b=m/xCpyS3KVOHIpXJ
	lmSTJfjnTzWSLFRGCqHwQ3U7pHJOgKmUtOgJ2my4afssaDbmEBW/137W3kG8vNvs
	aVBhH32oHrONZrBRusBdwHH51JXzg5/kCK6qz+cXlkLyp3wh7C7eckt3oXm8Yjpy
	tixAlNMUiCaSSxMwuMNoJhtjPS6gFteTq6D1GHnP7kcltp2EQopkTiv7XH6MD3Gq
	S+GoSbCn1Qix/GKMsi4OUMKloJEYhh/Wxc07/b3mKK3ta3Yt8cHEf6fATRKi9Ju6
	kDroXsS2ew0+tcCPY3jT+x+DPFI9aGpE5dvJJKpOQVI53s1vd8Ms4nINfZzUP6SN
	mVKKNg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xbv8dbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:29:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1e777a15so3379921cf.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 03:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221795; x=1787826595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=WhBNkOofThNNYBnE1wtHZNgm0HrUuwyXs349GctORv0qV2SheSvg2umOCePWVaI5bT
         AY5hWbN3NF9fq7kKdw7COZAfrR7Ly398NlWuRW8Qh5ctjo3lXAcAzwHJngr1A71VjJfH
         ejU3HqKMLI1wZ4U/PBs5CDgf5XHdlxD13YPwkkoPGDn16Re3ZdoCHVFitokn/RSvPwGW
         WhTTjky7wNAnOaUbRc3jcxuut2I+QQTw9S3uHXdaGvm+k+pJPFOvMYi52z0+1UMd2syT
         NdXSgme8TQY7HBEPkAbm+YOD+eoLa25CWIkJOoxFZx9yTr0Lm+e92Kz4Pnv8MNnasPqc
         S3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221795; x=1787826595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=Ehsi4U5ky0Ua2KGqL7iMPrfvHn4VzmZK2hfI75FRNbXz2DdHO75eKNkgjpg562yao+
         t/7kzjzs9sAfHZCcp64VMIocTQROGQVk4BYAWgkapDZRtmw0rW+nl+cUrLD4BLGpZNaJ
         /4n/r78BpgM7C+0ztLKJXLsE/qwEJTGdRABxpwozOGalBJKjGuzsoqT1neShmNiXzsbA
         LIo1taPEQa3NOKWqGJO0uFlwP61H7CS8GMAeW8safFl4atwgvPe/dNG+zfLqZlMHm2cs
         8eo44SqdHh+n0LW7IpAyFvFtGt3UZYMULVaWUdiBy7Ta7Zt6iy62Wxod9dvsMF4JueEJ
         Q10Q==
X-Forwarded-Encrypted: i=1; AHgh+RqCDEOaS6kXvh6DC3Zrp8Ed4kG4SUW4MnT6Vtug60UIbwLESKnLen8vj8F2Kc+LU/EfRLYLRnnGWMA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk10+Kmb0XBjOrPWaOkjbG8RsPdYfC6Fkc6pXPOYBaiv3RAiYI
	RQF0OUox29yqXjLk6pxcw1uO9qSWxPNZwP9YWx0vW7RaQ2CrGKPrhP7GWSmdHqooxrPfJQFIq2v
	W9+/V+6ZJQ18zp83Qh5zulUJVZLFx3kyApWN7N5PZs3anTvB7gPdS4BY2qxbmHCc=
X-Gm-Gg: AR+sD11qizKXbHeLr+Wy+0aN1LVZyvebO9cmDrbOiXyGnwCdmMeHg7W8pXqTLOcxiNC
	rdenasUyJ7bevtlXxplO/PE5Yto3Hlq0mmAfuSqLZaUnI6I14UH+TzJ331EEzHKhTRf5cTUM6GP
	3MuIn9qx9jB3NahIRl72CWh4BBOZqZT384CJeRJY6UuQMO3ohZoYZetVbRjP48Cqnk96ebnSQbs
	qboUYqqdmi7IcKq2jOm5OAqQtASNnJJ4qb+iA0HnoHT4ZKuHIfwnavk5d94oClWcc1nww4G3/lM
	2E2N+0rEMjCeu08hgzXCSrFJm1MOx5Z1QBQGqppW8Ao4ChIKq0S2QbRyLH2BxH2wmFrhMsZxeuK
	7myN22gtyuHaMtExyGewyOD53
X-Received: by 2002:ac8:7f84:0:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52dd57bc734mr74504271cf.1.1787221794654;
        Thu, 20 Aug 2026 03:29:54 -0700 (PDT)
X-Received: by 2002:ac8:7f84:0:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52dd57bc734mr74504081cf.1.1787221794237;
        Thu, 20 Aug 2026 03:29:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e224dsm52452666b.2.2026.08.20.03.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:29:53 -0700 (PDT)
Message-ID: <416405ca-5b4a-4f6c-ae73-88c04d4a506d@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:29:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] clk: qcom: gcc-sm8450: Tie the CX power domain
 to controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-3-e67ea30d8b7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-3-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AMKAkK6n c=1 sm=1 tr=0 ts=6a86d723 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=8AEooqP_IvclZvvwVwIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX2woeS9fOSJXx
 GNqO8l3wzBhHrnjjnBZMt6kaTIULFNocFvG3Pknhip0skqEisZUHR+mTDk7lNiuXcrX3M6UGogm
 NMMM6FDxuNe19QZ655WIzXQ7eAkLPS92AGuFrplmpAYOFtVz8jD2a1MwokDGychVwEQokd3zAJw
 k52C3KTP+6YE/lPzk21irjTUAe0BPBNS+gaMtTJWYx6BiVSp+69RtlTSZuIioKf4DzbeW7nkPyW
 ZmUGIqM4A1q8O3QJD4qgZ2tK4sRWxDglIxe3y2hD3TW82fy9mRJ6aN3HomhXB9AYPmoYFofIDI7
 6wxDUajUq6L7ybrlrC4qnxpTVDcRvAZueHlVtQcKsc3OGUQK5QdWb+AffiUBlofM/+QzddnRVuO
 0fe8E+653QReZ/11AifF+T0w8qQMA7xOmmgZJMfx4uat+mLkAb7doT2vy1V+qTmoiXJ1y/wTxr3
 m1ADzyLaeRcaclLhx7Q==
X-Proofpoint-GUID: ukLT12Dl7EpMxQVY-9ozRGZoBqgkhsMU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfXzeKA5slM6NDJ
 yLlJAVe9TMLIY9diUdcyvHA678i9FdFPiESZD/Shrs4k3Cu9hytjqHlHKdqZW2iTXQoWIXPodxj
 nCx4yPp675XR9neTTN9wr2hGNzVSa54=
X-Proofpoint-ORIG-GUID: ukLT12Dl7EpMxQVY-9ozRGZoBqgkhsMU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200077

On 8/20/26 12:07 PM, Abel Vesa wrote:
> Enable runtime PM for the controller, allowing CX to be powered down
> once all GCC consumers have released their clocks and GDSCs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
