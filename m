Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5A03F0A97
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 10:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816096; cv=none; b=rFrK7mcsIu1MFTfOLGbpX8SelI+JRSt6w3LA4fulHa6rV5aZ59oEBapJn0XHMwi/FZKxty3a2s85zxWx+T2TjlW0Ce6yppJWH2RH3i1+HOtrb05VOVd9nvgbIGPi7/rThqdmi4bL/echMbrIJDZ+I6/fFp51u6s4Y+VGP4BrTJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816096; c=relaxed/simple;
	bh=iWaX6WVJMtJ7ws5WZItaEewccN2kytFmN/OJzKHIaDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BgrIne20ypVdH7oMXxs+nxmA3lbC4FIPlFCgHTV8h75ZiwMQLSvvGnUI4Gq1Fwc9nCxRD+dn5IOFBpdIQNmkqfnq7QZLi14yXH/7QkCAVe93c5D+WyfXR74u27A2kKCgX3OjjEEDbL6uDTWgeZqy+svsY5BfanwAndg6shKFi0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDVO8bDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdwf0RBt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDVO8bDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdwf0RBt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nDmr1542087
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 10:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vlnho1IdeTG1KLn7QJL1CBhFhZtKcEF/ADpgXwZC+rA=; b=LDVO8bDApak8l7hU
	fMlRTaHm4R3phtr5MmG9HVCNzXCrW8jm3wlzf+Gkew6L/S1pHL4nYkRdZYDj7xdN
	HXoBPHCTqCv0WTJ8t/MShp7I2hL0csuKcGtrZPQerDDn1/5ZKymkapEH4jDuhpsh
	lOJXLCK5+MqRu58n2C3Q134mhS/SGAFelwTYri7fYpj4DVPejqhhbGgcYQjQOOzA
	EJiWklXg5KIZSVPFXbzl6hYRe/V7aN52+4dUZYbsPQpvxsDWMg2ei49OKkUMMYI/
	pHcAIWuKZuZ7x78Ioim0rEHs8CVNjr99OYvQPiX+KBoarXuzZnP3O/Y97VvFMvNv
	kitwmg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp1y6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 10:41:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e21552dso31361685a.0
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 03:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782816093; x=1783420893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vlnho1IdeTG1KLn7QJL1CBhFhZtKcEF/ADpgXwZC+rA=;
        b=fdwf0RBthPC1Ad0nB5WeLWH1gziOWRpknYUHWEIwSQzPX4SGf4JIVRrVnm78gRhcXG
         8mbOfBvKkA3KJIAr9RsFTnfz7Ay18VsoiyQuZSBQiyb40dFK+8lJjOedJS6IfOXgfJSp
         CqmJdsbhOUHQSgJoWt6IIy/VVIsyzX5u6inMNtg3e9SUjvTbr7Ki+qTI3sQsvOt9oRr9
         cdKdMLKuO25P5jhKOXBqKAtjo3tD4dPWYVkXY5BcFcsXKRCwWYsFg+SQ+i1wODjBD64n
         ngAj329tv+gr4ThVAIiovUQTIAz5KyamzWGkzbSM7ciec6ozSJzCzVkdxaQrDyzgKisa
         T5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782816093; x=1783420893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlnho1IdeTG1KLn7QJL1CBhFhZtKcEF/ADpgXwZC+rA=;
        b=bSrffMAGz0Ocbpny7l2usK0fENOSnaghjPKJv5o46FZMAmYgpLm/W7T5ivbhkst6HO
         OMfqRbgRD7GkR9c34aZaZf4RS3FNg3EyalCH3Kuy86kTtew/XXKziwIK4QlshFHoQiQD
         IyNfCX28QiYlH1TlDl+9yQfkAgNEEkS2I82Tn0UYQYiiFatnJwWeufi54vKoR8pK/Wx9
         E5bgAalD7hHxPjpok7VVQRcN2HvwihCupdym3mIHTKZZCOnHN51c6qpXCL9sAWyrpTQP
         3CnCg0Xt2mmLzCZKhROX8Nqz1+KtzhBpltHSGJ7ueQfmCTXukUCDfigMEl5SXKACYq+W
         NScQ==
X-Forwarded-Encrypted: i=1; AFNElJ/pLoIaqK8rvkxcUwv5GSZlND3ctSlQH7dQ9OnRLdIA/Gp0X70RKaAI5uO0K5bk4AGLFQH2C4KcL0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNh0b8f8XU4ZTiCzPrfZu5FFiNVpjYeix1Zh2AoAvA0IV3iUGx
	LlmIKLNl6aD9lbTUIu5qs51OAHIyZeXgczRId3TpLvpt0IXCttt+WKp8l2x0Rof/z5Xf1P5+H6U
	onjorIpDDFTxi4SI73c01pZx5DGOULSxawt4sfbFVFQZ2s2omiYI6V7q2+m4xKEs=
X-Gm-Gg: AfdE7cntFXK0lH/4e6FiYwFA9Im8LqXHI3fKWK2t7G+xfl9WRVh508RE/zVR8cBZTjZ
	LSP4yLyxuVKZWa5X8HGAbq3O+3yIrjouibxuWBz51ueHUyjiK5HV6Ju4pZSGxAIYMTpcw0wE6tY
	wDDmwOkX9aTwZTHDhk1ma6ajmfxVEh0ltcVbOAILQNjgjVrbB4YxExbueNfkGYHKRYzEzb4turo
	4H06uO5Cd6/QSETbSCM8eheK9rTlj8AyLSxsC0iCsu5znRfWy3zIEw79cynGCWasP8n8KEzpd79
	WMmqvvbmdDoaEKdvZNae62f1ILEM7MRyMS4Ih/3DytTeyN7asJb8jflWatlhfmfbZfdQYr3tnP5
	q2d+gfj3SRmddV6hD5UEGk8oaml4zWayB65I=
X-Received: by 2002:ac8:5e52:0:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c108197a8mr23758821cf.6.1782816092914;
        Tue, 30 Jun 2026 03:41:32 -0700 (PDT)
X-Received: by 2002:ac8:5e52:0:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c108197a8mr23758571cf.6.1782816092497;
        Tue, 30 Jun 2026 03:41:32 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d694dasm102858166b.17.2026.06.30.03.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:41:31 -0700 (PDT)
Message-ID: <75c83eb8-ec57-4ced-8733-94e88fc62902@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:41:29 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-qcs8300: Use retention for USB power
 domains
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629-monza-suspend-v1-0-b601d8a2f2f8@oss.qualcomm.com>
 <20260629-monza-suspend-v1-2-b601d8a2f2f8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-monza-suspend-v1-2-b601d8a2f2f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UnHZ-Hi2VTbPl_CnywDTzLWum3KEhQyX
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a439d5d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: UnHZ-Hi2VTbPl_CnywDTzLWum3KEhQyX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NiBTYWx0ZWRfXwk4ooB9I+8zv
 rafDKPsvSEOsNL0pDlV3M8nmSYuLU4fwhPnSjhiG3t6wTaKwk3+mxu1JlALcOwUsDexmemPKEcO
 6KwI9z3nFUjDw4TTk4A/ZP9SNcGWKuBoZeYBwOf3ER/cpD0LuSoIuiFTGyP9hs/fruxI0yaG5CV
 mDBQee60h1kmlvgJsTMLJrbwlAA41dqsi95TZqaAsDOX4jr9cKyuTyT4iewwn0L2x5UdMte0y0b
 M+MSrK28wq00duF1xFUjUGCtQT4zHEdv38r7IgXUFsdIe/b7uPMH9WGDZi4yfQgVti1LXWlCRHm
 fwRukFFIglC5ehcOAxGTsxAR8gSHPa6zYlk6zxrOF+mMLRi1lCmD23XMA5GaUMphLgrtfe9oBi0
 9xQo/iWrb7ND0MjI97M7s29LAZSDyVib+EvFHtN8civuoPY/JtBWofZa7pXlSoB3uThIclET6lQ
 K1uQ5X3I78R+rqr6krA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NiBTYWx0ZWRfX0Fxry8Hl3Cmg
 0PaoxCaZ8KwdlZyjspK9XqL/s1Rlm0SVI8Wq5LcitdofrvgVvCnwDJM1Amt4AWwa3tjnqOD/tQ8
 DQJGhd3D2kFZ16Nk2foo4ow9sg2hllE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300096

On 6/29/26 9:22 PM, Loic Poulain wrote:
> The USB subsystem does not expect to lose its state on suspend:
> 
>   xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
>   usb usb1: root hub lost power or was reset
> 
> To maintain state during suspend, the relevant GDSCs need to stay in
> retention mode, like they do on other similar SoCs. Change the mode to
> PWRSTS_RET_ON to fix.
> 
> Fixes: 95eeb2ffce73 ("clk: qcom: Add support for Global Clock Controller on QCS8300")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
