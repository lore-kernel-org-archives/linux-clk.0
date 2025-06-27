Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54992279334
	for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 21:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751059797; cv=none; b=ArIZsvHJpVYxRKHe6Dys/CQOJkXr6lvzl6gblM2qWs5sMuCKtGVe1hm+zchmVe0ssLx6S6qrNzA05ZdBpVjUGB3gFcZ1JBYq/gzNvOtOucc6x9pPd0ZFsiojFyPuP7jP706xI0BsFEtBEklimefnx1GJYYWxXAYKPHKebaJ13Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751059797; c=relaxed/simple;
	bh=DDrlIsBowQIoYj42JBQiuKWXbnIzuVcfTZ6WW+6h26k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rlE8VT0K7SpqdkVELTpHaFwYU0xFTP6arS67NeIJCTG32ZdxJQ3uWAZ9Zu7ezmN1/VGUde+87NlD2jTA6bRpVD9I8cZp/dx6nrPRmVZCYoroH/KObBHbwKl6pbcEv5KCpHLDrD/6ZcamaTar50Jomyk6KznGY472ooSIwDHoy9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=koGqEnCi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="koGqEnCi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBOQth014370
	for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 21:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+VclKGpJtOMeG2/CBYjO907O4spsZFF4G3PlFZVFvU=; b=koGqEnCim5hP7+EU
	LHS0XQuPw/A3zDmAwwWpmZcjPaA1rivwkrl4wCpl4zGemNcPKZ0up794iytwe8sv
	nMYE/6UBcZxT3HS1deXpSuawI/QwHWGCaqYypHhxEfzmxrQhiPWyyRAtWiZw2aF2
	X2OLqLQSCKYxR1CYo3X+xmwrcjA8smYtQuYPIPNd+0wl+bQMAtAnhggqUarWrESH
	pHSa7s5oOF1JKtI9WQ/E4B+Gftsq/J+AWMh39c5L2L6LEd+xyXyeSaksx1j1dxjZ
	Yq7VmeTYHnylnhlhiMIgLp0LsBBWceQKvMKCIwzKr/REMwPNRkTusclbPXXcovwH
	SrvWvQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcn1u4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 21:29:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0a9d20c2eso49056685a.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 14:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751059794; x=1751664594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+VclKGpJtOMeG2/CBYjO907O4spsZFF4G3PlFZVFvU=;
        b=UCwwSgPRaXEnraye0bHr9kTs82ZYY7c8HEZ6y2N6v8de2pP447aJCK9Ql7YufjSp+q
         7cQ6WJhNEm0Hnvyr+Z/MTCmOTC6RedF+AHPYKn1VZau5N9R/FjGy0v4UeF46bYco8+oV
         UKgylZEWeXMA6jqoZj0pHXlQ+ma51KzIcEioxfVslnvmBqeupXJOx3LEvNxFtuxRXxeU
         pDhyxOdze5zSKwOqx1iM7SaeGLAGT2PDwGnWYUXCqs+C1bia6uCQm1r04USkE+Kw21Fl
         sFT/gzvkMP9iOXixuYo+SmqF4mPXLFhImrIwQ3/U3JFmSV6pJgBdz41NpZ8CE0xBeEF1
         FyIw==
X-Forwarded-Encrypted: i=1; AJvYcCX9WHr2Gqno4gz3+fV7SZd1Q1lXnTUruMzZq4hXTOI01S24IDcnw0v69z4EE6DOl5Q2EUf+5ENSbBA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz3l8A0hJ9dzFOAklYIblrKZxy0DaTK0tncbw6izRzt3/s+co8
	FcmdrGd3m6DvEXdT3dPY/J09M2qITQZw6ey1MXdqVnk2PnfTCBnllLJahxofw9ZFXqX2wBK/g6Q
	ToHmPQrXnO9o2USlShZdqRxO3LV7pXnn2W+jjFcLOGI4tiraTH0fFsnbVsNkJJB8=
X-Gm-Gg: ASbGnctOZxk5iHamWD+l+qE45Ic6ty8Rg0xr6nIRFv3jFzqO3UPWbQ2h3buTm5vC1uG
	neUJKXbUod3tVvwDyy3fXERxs2i9nSvRIRkxIkDGafmS46R3eWb/vEllBR23BycZtjmY/vBv1kv
	diOJrVhtIHHhqLA6g/bgBYFwfOSVvRoMdoEe2KyqFs/bnKypO+JQ70n2w6p4oz8dYhlwPDTpk8q
	obQUWb67r+gry0AIBd63k0AbOnvC4hZ7MuIQES+rboQVsAfcDmFPif1V3SX9ediiFUAq6Z5jKGM
	CxK3il5Luwi2/XHeqhwKWj00gNObr3zMhvsO2hwr+UaKw1z7J3uBRxekbjhMgY2BQ8Fhyt4fIaV
	ai4c=
X-Received: by 2002:a05:620a:26a8:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d44c27a0e5mr34980285a.11.1751059793918;
        Fri, 27 Jun 2025 14:29:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6O61YOi4A2FE/HAM5495f3Lx0kZsOuxdmkU5HT7ZQwhZfq27mgtK/+v+5AKGJA2+aDJAuWA==
X-Received: by 2002:a05:620a:26a8:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d44c27a0e5mr34978485a.11.1751059793400;
        Fri, 27 Jun 2025 14:29:53 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a95esm195682966b.59.2025.06.27.14.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 14:29:52 -0700 (PDT)
Message-ID: <6e4854e7-1bb6-436e-958b-382e26beee04@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 23:29:49 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: tcsrcc-sm8650: Add support for SM7635 SoC
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
 <20250625-sm7635-clocks-misc-v1-4-45fea645d39b@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-clocks-misc-v1-4-45fea645d39b@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OIhOAaI6rtbt34ZrAMPVfkFaLv5YVnZt
X-Proofpoint-ORIG-GUID: OIhOAaI6rtbt34ZrAMPVfkFaLv5YVnZt
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685f0d53 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=vTaQQWYYi_PMaXEYf6cA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE3NCBTYWx0ZWRfX+m5c7JhE+uW7
 4yObtxdAZJvMmJCo1Xi113g4gV0Uu2+9lOSdesq6oFCUckEwYgULiig2HkVN4ovAxW6JVxe2Xp0
 H/D9txDZdwt6H7GCXP4STK8iD3psklMBnmAzwg/2PvRq+fBzowUobhw3ImWcHZQmvFf5Y0bDF4C
 yfPR2GzKVUA4vGNIrmGHJQymoVPwMS1JuMn1zHrIUAEZJXgYmmpulddzmF4I6rrfEAF6uJS0r2e
 PlKOrcHDUtwaVpX8J7seNUT26xvKHXfkqMUaBWS7XGMZwbXAzAecfuPPHwsNj1fKU5SzyxO6s9n
 D/MKaKBtd/oS930VWMyy1+aMFhGfM/2KDdhtB5ElahxBff1r+u/6OYjVyq126ti6wqRHfyXeKMT
 gj4C/Y2rsS7+IGhzfRALtLuRNxKhKZa0ni8Dtm+i+og4MZOKGIidfzFMrDZfaNCRPAZzTly3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=836 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270174

On 6/25/25 11:12 AM, Luca Weiss wrote:
> The SM7635 has a very similar tcsrcc block, only TCSR_UFS_CLKREF_EN uses
> different regs, and both TCSR_USB2_CLKREF_EN and TCSR_USB3_CLKREF_EN are
> not present.
> 
> Modify these resources at probe if we're probing for sm7635.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
