Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E224908B4
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 16:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849091; cv=none; b=YrDuJhK8eyk1BOxLWuCNKyqQWg8SOgl67QNeFDEdCH1JYY+gXbJULaEfuN5kRxe/vq0+WsXyJ0fvSQ0UadmtBbFH3HRPjUL+BeYYwEOkZJkDdGiZSN24LHiZZlETrsw0OBEb2afLmXEpFk8SZNnyC6RMMzWijbnKYRSDQUplZNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849091; c=relaxed/simple;
	bh=LIWudmjBuuTC7oQDej8L1/vHU4MkvFeRxy+wdt0a58A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mvlxP8zCOeGbbJPYyxWBz2BhGREl2bdDvb3S64F3EVmvf0qgrK5cMkewY9lT5BacKSZyDzFE9S9AhzEh/z3M5ACVdO15MidyNyGu3tobcLgXQkiKHdIC355U3TlWxkB5JaiPtNMY4/MGLYPz1HM2iTa/pwKmq/17bxWbUaiiRSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZInGT3E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z6nHE+6Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZInGT3E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z6nHE+6Y"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFd1G4359802
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 16:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CaEEc2AwRgBYqxtCo+TjIv+MSn3HdYNx2K80+kYCoZE=; b=kZInGT3ECVzaq4wJ
	7GaKlLA5q37fgPbHoGzEu4Mzmt4ATXsuzcwsi8TES9wCtD0j1eBYIgcivZQEoZpp
	Ve2iKcWNtUEzg7InLKOjjDMCuxN5NHN4JcoAC18N88LJ9tYPljPqmcw6WcHjt2nB
	smvuMotesHkm38LDuub+IxbwDW37/PGIMn3WagVIytlAxv1uhytou1C1H/fUyxm8
	xb9CBeZHGfoZO7QpG5vxwhhpLJkDreDDgvWTRZ+U8+XPw1bsIMbyaiPs5lDJHL5l
	V3yEw9B/+2eqDvrkcY9RorKG7jV5Q3OTioMJGsFgedg62K5FQGcDe21P54hKrznC
	822rRg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ganr68w05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 16:44:47 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28d8d1b76so147776b6e.3
        for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 09:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787849087; x=1788453887; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CaEEc2AwRgBYqxtCo+TjIv+MSn3HdYNx2K80+kYCoZE=;
        b=Z6nHE+6YWOlHBfJZMuLMCGsxeBwSVzNnDNU6BoV7VPEg+vvJ9zFMdFRxvx75cslKa+
         jLkz790Xc8pglkfiaTDtJZAxIpI6deV22AHtaCTnWISk0EjThyDIUkGQcW9mfokIdEBp
         U6JJdUD0mcwRYltgnV7nptD7RfGFBlxjbza3wHFstfQLXQL6nnYajYHtWisNSIfDbK92
         GOiJsa0QKjANFoo4WAW9V2vmD05WqT7so9HuPQT6s6wIKPs4rDBkLPyHsKQZB0Td9k7c
         ykXfDGu1zp/W6tBOW4teFo5KBeam3oRCUfN5lEj0wDKwFlXydA/1xLz79CwaDucDILCQ
         ZY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849087; x=1788453887;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CaEEc2AwRgBYqxtCo+TjIv+MSn3HdYNx2K80+kYCoZE=;
        b=bJCohFKWG+uQT/4v3+1SyvRTBegxuzuDff9417JTqUZ7wwcGAii7wk4LQR2c3zPLyp
         6Rf2X/SfEqW/PLdRyQ43EKZ8oFNJTRICi0TTHEuggSfabNBIyG28TL4Y2bS1gvjCr1qp
         0JGzgVEF4QJ3PhMcukvTW9xvf1jwnp+tW1wp55gvdOj5J1+Uw9bWd3rTAUnHWy9HC21h
         HHHnhyK0+l3pyZTCzjI2MUpHiOCOXiqsjvjPiXLosJtRfyIwHtCoTyh2rjgYCl3VlYQX
         nYn9ET4+f1+KXEUwD3DcXVmKdclhSn5594LRc8gqCiwFwrt1KLjR1iTtmmWGDJ3l7kSQ
         HJvA==
X-Forwarded-Encrypted: i=1; AHgh+RoyMQvDVpdOsSzhjD35gLU0BfMI4LSTyI2ISE0eq8g3WVl094yoCKr9VSfD6LyEDKOIs010kL+V5M4=@vger.kernel.org
X-Gm-Message-State: AFuF++nnRXhsaFJj7uZsdD9kca4LxRV9OgU6vDaj9pXzydvArWpzOAx0
	82j6Cgkzz6jSPvF2XS3LSd0V/K6KHVuqp/+eZEudMab4PCPckCa3QNNmYoUJ+Da4WRfvlbppQdL
	j0UJl/u50peHjT6muFp3xm4bFytcFf8HqV4MRtLTVxVi8afLx7LUTPRPTgTMD374=
X-Gm-Gg: AR+sD10ZMecC3oZ8VvLeMkSkbIQqJjrZlz+3V1g8oiQosPbUIKe2xVCYktdrnuYcLRP
	Ec3gpZl5FeB22fenlTW1+fTby5WPBvvj7L5ETcGA0k9WpdUB2nL3Y45M/qmuwNawYPArurmYJtw
	1tU1Kyo4YTGvYYU40Tl8bzSSGVxBrbBuAl3Ux6xAiHymjNuC5DGaPbePNpmb9N8gmkyaNm2GchJ
	x5hxCu6T6tT8jE8tFMfzhBKquP4PU1sJ2uTnsCMSKqcWX/gSOB5c0YJx9ocPz+mCPnjJIZSxpc4
	hVPpcN72HWY4Z59CmRm91rmyiKQ6R6x2RfAUje5rSXnn0EI2AkRRQVVz8EdCmeocu77pC+yeJZe
	oXolmHHXufbkiU/MLuuJOQTdruSp4bzY=
X-Received: by 2002:a05:6820:83da:20b0:6b1:95fb:81e with SMTP id 006d021491bc7-6b1a049cb22mr12410513eaf.22.1787849086985;
        Thu, 27 Aug 2026 09:44:46 -0700 (PDT)
X-Received: by 2002:a05:6820:83da:20b0:6b1:95fb:81e with SMTP id 006d021491bc7-6b1a049cb22mr12410471eaf.22.1787849086580;
        Thu, 27 Aug 2026 09:44:46 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a253d6e7sm5112145eaf.7.2026.08.27.09.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:44:46 -0700 (PDT)
Message-ID: <67819cd4-013f-411f-8f5a-77df0e3a88df@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:14:34 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] interconnect: qcom: Add Kuno interconnect
 provider driver
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-7-196e2b306368@oss.qualcomm.com>
 <mhjq6szchgrgoegi7jrzmeumlhdjr2njkh5jdyjb3cjb4pd2hb@qjvx34fyo5au>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <mhjq6szchgrgoegi7jrzmeumlhdjr2njkh5jdyjb3cjb4pd2hb@qjvx34fyo5au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfXxTRPAd/YctwN
 Dw2BGYVSUUHBrfVGaIQmOm7wYpTDBq1FRrUwyUizbxguDf/KisJBOMKXxf9whaC+LpvI6RlNgbC
 FGiVQuQ29HioI/2cDJO2K1ECheAfhYVPVZmO9qwnxfuHdA4d30w9Mr0nBBvJmVqHP6iJ7iRpOe6
 HionJxtuqSCEH/lKzcPw4lXPHx66WJ5yev/TXjxgTQ+rh7bweB/WTbH8n4Kh4EbSat/J3DUXVc6
 PEI+DYsK12PAy8wtM65MeFzHwClTVE46aFtUK67cEhyMh/KJKWbdysHwyAtM+7HoFUi0eeC7D1X
 3H9NFWvl8lN+6PeCPspc+8371764VZsurWBFt/m5Q9MWsL72qrot5Qrj5iC6PVWxTZJxUJBclUa
 Dyf2hYrjddCz2su5I/nubUT6KU/hCaJxLstN5oHG28qblISaSNMHpNlIBcEXAAGxM5r9YzmTmDw
 yIx+rwpJZE9Q060RRkA==
X-Authority-Analysis: v=2.4 cv=d5DFDxjE c=1 sm=1 tr=0 ts=6a90697f cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=WTDSa4fX56zQulHxy5BIwg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6qgGxlNUwWlbBUD903MA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: dKA2o8O7UCEOlvvPejHTRczn3eJuGK-x
X-Proofpoint-ORIG-GUID: dKA2o8O7UCEOlvvPejHTRczn3eJuGK-x
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfX5lOr0v8zNXRB
 g1U8vmifwWXFuoXmnBSf6HrCzYfC17WKlnk1iDB7N84cXQe4n8VFwJ7sA1nVpKNtFVwQIeXIFyF
 Wpd8FLFXZaHTHOAt770/NTrcQmCc+TY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270141


On 8/24/2026 1:27 PM, Abel Vesa wrote:
> drivers/interconnect/qcom/kuno.c

Thanks for review.

Corrected in v4 : 
https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/

Best Wishes
Hardeep Sharma

