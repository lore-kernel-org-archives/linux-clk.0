Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A347048C8AE
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158099; cv=none; b=sPQiRjleuPtPPCxPaPzOqoFck/VaVQxbB5xPYabQEogocUP5ik9aUReDYqrp6Lso1telwtImFJQJ0lzdOUA4RDBs2bKEpjDWPkxwy4dQ+BIWl4OAdruTrydZRLRzh5SUyWkpqfoNE5fChScQ0LxyRd3OXr/MYJOUEJIPER+9si4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158099; c=relaxed/simple;
	bh=BLvf00UtNzx1Q8OgLRxZNA9yulqs3sNezxSotsJsrhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HpWLLadW8Tw7ZTsetsB0ib+zGCwEz/AVGxALiBIAKrW+vLnbJveoKij/epIUBVoYyirJZkU/jSd6FFci8WBqHhSrotRuw7aYi9UBOtznvoWNs5a6dvkBSGlpDYVlKOoal9x74Cqw2XmVxnaygG/r/utnEZ7nLFmo6rdQCK0nKqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKfW7CGp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LK9riPWa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKfW7CGp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LK9riPWa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF2JDg3606485
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmibFEIIw49ivCvhUFbLNM5g96gOBCc8eFuIKSPykPw=; b=DKfW7CGpTlpH01Mz
	tzUVLVr92fMFbLyAoRYztIhzUn1D9bMmU2pdiCtG9mlAtmshakEUfQNbLT9MlHDz
	f08I0QqCKzWpOhZERJhbJIwJxN45h52AUYytlkD94243bh50rpmN/qMug4K3MBRI
	GJvB55ToNJl25xhAaqEciyLW+3SkkVhJY0ok+gUHJbjPlWnIn4qwOvtVEQy1Pyqf
	0fU5SehtYU+TsLrVQDl7e1a5nfgLaUzKQ7r5/e7Bi4438N10w0qg94crVxsqB3zB
	nO7SQK125pSbaF2wsQjhjtyzazdnP4ZcbzO6JX8EhTC6P0aX45AdR+xt5akEi95h
	+kT2xQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esarjr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:15 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c39b4f3229so50678e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 09:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787158094; x=1787762894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmibFEIIw49ivCvhUFbLNM5g96gOBCc8eFuIKSPykPw=;
        b=LK9riPWaNcZ+Tj7wR81iHRcNS7PsJf4aAVhUOqDtfhFeB21my5zb0lYDxN91LMAZHt
         AeLCZ81LlHT7JJ2iOjiJqMwkmtAG4XWaOLyglaySD438EWIN++vOSTD+b3j0EbKEx0h6
         d4fIFbSMI+ettXxMBq45R9AgThK4hIz9k+rTfP4KRWI/6QOqhGXYJOVLdcbrFbpksVF9
         lhDBHFz9lgaAGr1nqfRmL32ifLqGfRPbpW6Gh7YBNe7k2yoyn+0ve22RwOJbEJ7GIG8s
         zxMOc5+E6LGTsWKoxFWzo+AFbMLg9uk/XR/F+XDd7CVWT1JwFdU+VD47JDJpgV+ceDiH
         Vz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158094; x=1787762894;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmibFEIIw49ivCvhUFbLNM5g96gOBCc8eFuIKSPykPw=;
        b=pKUqzwMjZaLP7ArlJO04P5Bs6hQygxmw1Ba0r8eAZPHlEntQM+HhoeeYuxu6btfydO
         3r8PNhlruU1O40/RyUp12/zuMlIzW8woRJKDVDxeloLv0Y/qzTO+kNOfGruhNzU/ZWZx
         7FUGuAWLhKee4M43t0rjl+jVgxwG9aySxAiuQwGengAQTjx7jxXu+DUKA+Uutp5rEnri
         VsSIwB4kymSNqiHIFG1ms4uDGO+1wpob33Esif4N/EUQRiuNibyPEMvA696Tdswe27mz
         MKkveDwvg5OWErbA/2AUAR63Zu0Dpc4cZuW8yhlw0uzfxHpU++yh4FyNFXmiim82AK4+
         lbKw==
X-Forwarded-Encrypted: i=1; AHgh+RqenLhlS/8QRyciCxjUnoWqQ7tZ+LGR//UwGpUI++osOYEFxF9TLmh7rFF3AykJyKt09TM6qA2AvVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOooVbtg295euK60KHW0jmOWXKRCdZwa881A2z+GQPtTvFO1n4
	ZzZbxtDVVp6X9SHVs3pGeiCfdyaiInXg3rYri+VsCIA9NWS6N2PR+weLdfIPTkMQHbBjw/MX9sK
	OCq8+to7V9I7euQtmqUssg3Ftiwu/gH3P2UX0KFrBg8JeLvLRSkQxq9oqkTczdQ4=
X-Gm-Gg: AR+sD10obKrjcDv4r92EdW9HhBAn5bbf7rqSGd5YmQwzsdY8xFrxry0Om0mmISrRyQr
	jeQf280fmzUS6KK0XuaNYu4j+1oLkzbogZmR7YE9jXPFo6NqX0qUt1zBPK9arlM0zmZDyW0q+bf
	G0K8FmI2yNEdIAjgXUK1TpXgGY9BsViWjPkAgXK/b7yODOdAD3REnz9eRkg2gwVMHmw6lDpZ3z9
	kvD7WnOHcQ8vPsps+T/BSppPbO5GUbr45o1deh6ZiRMYKvmvX5PlvNy7gmhKW91i/3NCOuZ+YF7
	LWqjcuJ4vRlsXZ6bSjlNY/EprzBtHetu8cYv5hWZmPfb/yS6cT1kcRJEvhzEy52kuGvuwbsj1Mk
	m0wo8ySjeoh8LnRyyz+yKSFkQ
X-Received: by 2002:a05:6102:8024:b0:772:cccb:f7eb with SMTP id ada2fe7eead31-777fb1adaf4mr859242137.2.1787158094439;
        Wed, 19 Aug 2026 09:48:14 -0700 (PDT)
X-Received: by 2002:a05:6102:8024:b0:772:cccb:f7eb with SMTP id ada2fe7eead31-777fb1adaf4mr859227137.2.1787158094040;
        Wed, 19 Aug 2026 09:48:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0d5f70sm1234818a12.13.2026.08.19.09.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:48:13 -0700 (PDT)
Message-ID: <34c4fcfd-d436-45fc-91fa-db3d4d030c62@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:48:11 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] arm64: dts: qcom: sm8450: Add GCC CX power domain
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
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-11-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-11-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfXzkc481AI0Qgv
 j6zyVE3L3mq64XZKGaCVUicIaBcsj0w+NqzfKLIJyfvkN2J9V34NVZx0O2Xld92laX6pYJtwaQD
 S2f2AzX3HDQJb6xJAv/0MJinJl3dZSs=
X-Authority-Analysis: v=2.4 cv=fKcJG5ae c=1 sm=1 tr=0 ts=6a85de4f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: kqRZqSDLdlc6sXRd0sizKC5-cT_ZYAwI
X-Proofpoint-GUID: kqRZqSDLdlc6sXRd0sizKC5-cT_ZYAwI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfXxHbT/Z7aLv5E
 IxEZONNh9581NqJtDO4oObpB2YU4IU5KVCHbKIGjvGa/zfHzxMOp/SKox0NBq7d2XptYueySK7b
 htm0K3uRKwkT2OLyQxh2AHw5ELfGUa8y8Q6Bd5w/TFiLlfIOSS3Lk3vbIG5hxUyh4Wvas+80hd5
 nC/r1TBnX16TNYZlwpgvsiVQhJqWQ8cS+M3m+lKvmwi7NxI4FFVeFuYzwNuH9+FkE21HL2gpZ/6
 oPPzw3+zpN1PfIoqQooT+aEEAwF6954+SoIntrtXQh2NQv91DZbas4xSqVcyjgmrHzyyYsDHGSx
 +D8T+9n8Kj7o/HIvnmpbKBHRKWHJGBifBWlSV5lnLWNdj1AtIPw26VRPxd8IQhcE1v9FMLkHGjD
 loTMBTJmgzK/z+X9aCL6EuDJr6nAEk3B0JXOOstg7PMySqJ4KxMzNQyiuFH1U2C+I6sGbJRJIsM
 IhrSFdrK/BMaLlTxt4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190130

On 8/19/26 2:51 PM, Abel Vesa wrote:
> The GCC GDSCs on SM8450 are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
