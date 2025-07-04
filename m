Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D23517A2F8
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 14:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638417; cv=none; b=WPF5pri2hhV1KcGe+6HNAB2O7yL4j/Dogpc5yGXGOUv+l78N/FHhXr+ODAByUF7BEp+9X/Z6ahZU+//Cj18yMon5UBHuixw9Ov0Re+78EnvFz7bKu9P6j5mnj6fjRodV2rFrdwMrc+SzkMuWbjlMX1GX3l/mjbktErgmyheuBck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638417; c=relaxed/simple;
	bh=uVBajTT2lSvw+Ur1hq0WlQKfumsobw7ctdnObFVhF5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEtynwZU0AbtZCzdbeSaVOHu/67+h5PwjOEVzY2Ryl6uSSOrtWxzaLmNKhrZ2gUxls0ecBW4xxj5Yg2rv6pcmiXwaKZOojv60HiwdOAAR++3BlDwIbNuPPrYK4EkJ5bQ8Ss6DA/kQXOSMMrqY2VdQwHhoT2DUz/pCsoOQv8c3jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PeyDfwkY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PeyDfwkY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564E6M3S007067
	for <linux-clk@vger.kernel.org>; Fri, 4 Jul 2025 14:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YD7pRGBpQkYgS0oJMpIrXcLP
	EFNPQFjZEJbaEoDadqo=; b=PeyDfwkY5pNipDMJLyYuhrfBfNdPTq+52K469xlq
	5AEgLviN4MGDzs3DzMGJv32AvMOr2bfd2UqikCHIdMjfwv7exWdHlZp1hlVTsXWZ
	t6S0SEle6xMweRqoxr1dvyf4Vv3/q7gO0NHQL4zFAXptQEORwGZbcsrpV0X1r0+9
	40s04kOXjRNvIrbMwgXioCPR5DN6l6hB49tG0SHNZSpqvyNl6py8yUTSE3JjvBlL
	ENohqWGpN4Yc0B1RkDray1q9b/Zsws5ojYE50zCIjeHak/rr3UQ17HNvW0nkd99z
	U5/fre07ag215bQX1myuuHmgoSfFKyQ4cQinMXvhrP9HOg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jrr99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 14:13:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d460764849so349889585a.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 07:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638413; x=1752243213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YD7pRGBpQkYgS0oJMpIrXcLPEFNPQFjZEJbaEoDadqo=;
        b=jxLHWvNYbP4qOaxOFyQty/g0z/XoYF/n32fNhs/6XVoHMmyxlnv1eLsCm61cPIgr1B
         WjAeQa5VxH8v250tFTL5kQo+MkpakrIxof/0W8ZgEUKXjyT8BEXE/EYrWBT3Zy0Ewkzo
         nVVog5PWMIH0ttVLxxIISTmfIlNcQI0fxfEX1nu+KX58QtVjuMAhHNr//gAuwuFb9ZiW
         FtIBoOpHsehTBoyk956i6UQP+82UVZY/QNWTbuyOwb+3c/euonmVrgpaD4IUsHCPBiF5
         Gl6387Q4MlVt+3P3T8djf2Br5NpPTxPjXgmpCly47s/JBtd4hRahmDhhh+m39dDy7BsE
         P6FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWokc7ukUra86DC70/IxTeBzvbQ7fyzL5RnlUe2NE/uDzXHV9M4GIDMa3dK69wTiCmtP4H9qJ7ivSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYJlZPpfQc1q658mahXM510ld9e43nR6TKDWVNaAJFmKqquFeu
	SeyDo5P6v9JAWLic5pl9gR3ALR8eIBN7y6ukhyrGfihSYj7ZkD5Adwos5IlrzvQisf23uztEpEX
	EH7r6VtaC6C/zcniaG3OsSMz3LFVkfdmKdWn/VK5RewiVV9N+8VfiFuSrVa42+i4=
X-Gm-Gg: ASbGncv9E9ddAOT4ro7ZvbhZ1+J5QlQOpZ58/tuyc2EORFKVYgZRcC64rbWVkjkFVgr
	UrmpwcrWuS0hVBat9SghnwLmkWi4dez6CSV8Ymoc8h9jdZhMRQ2UlWfXknRLmIb+gz8Z8mgFiix
	uwzw2o2vYGRL+TqC+g1SZ0tctDSV8YUNB9hYZ4a2sJTD2DV5d3TLqPUbG1RP4N3ax65TMfEiDRq
	O0xBBA98Eb9p3x3seRBKZKxR7IJJ9EIlhKDPRUhIiAwU8ykzsaoQgYCQi2Wn2QHVG9zrPa/oSwD
	Kma38MlvLdLVZOXth5wBw5nSjIqz77x34fWEU2wlPO/xg3bgRh9flAxeL70cZnA0FIDByCVB9g/
	+qX6dd60DqN1H8rQ0yPKg8W7wE+D87oAX+fk=
X-Received: by 2002:a05:620a:1a9d:b0:7d4:4b12:a39c with SMTP id af79cd13be357-7d5dc6b8a4amr450023585a.16.1751638412485;
        Fri, 04 Jul 2025 07:13:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu4sJ6opy4orpQRjMYZ1e4zAyxiuU2Gx/Jb2naX2Aa1H9ZNaTc56q7JfZ9aa/NrAcO8+wGkA==
X-Received: by 2002:a05:620a:1a9d:b0:7d4:4b12:a39c with SMTP id af79cd13be357-7d5dc6b8a4amr450012485a.16.1751638410869;
        Fri, 04 Jul 2025 07:13:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494bb0sm261178e87.104.2025.07.04.07.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:13:30 -0700 (PDT)
Date: Fri, 4 Jul 2025 17:13:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/11] clk: qcom: Add Graphics Clock controller
 (GPUCC) driver for Milos
Message-ID: <22mwkfbddaqrmfnkccn4ogjxdiq5hvbkiieebcbjtyk34ihmov@cnjp7c57ij3k>
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-9-9e47a7c0d47f@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-sm7635-clocks-v2-9-9e47a7c0d47f@fairphone.com>
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6867e18e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=RwypAz-qddAaXUw-r8QA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: v-EAtRVD4K0pfYrZgkQHWCLkqEAL0qH6
X-Proofpoint-GUID: v-EAtRVD4K0pfYrZgkQHWCLkqEAL0qH6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEwOCBTYWx0ZWRfXzZEcMspsUdeq
 iW3T29CX8GZYJ7U6tF08H9js4qMthI11ma7FXEgmybWW0l3d/OfouFIihfbBp7VxlM1DDR/Wo+j
 Uc5yBsngojPohH2Od1uytpd1niOt8RNpnXLmYA95h2cPwQsbBWRD6lhNI1ezlabUHwzdvLQwrQ+
 7LNdawdW/eIdg9cfsL9B8gZXI2UyEoMC8vvzDAF+zqn4135yc4Ru+xW8nl6AN0qHMQkxHVjQLXk
 yQWj5nyaWKfgp3L1Ag4j7WA8q9azBCjFOmrCIpvgiRNYKVSxamDjfKOr4IYhBVH4ynqBgS8QGbL
 Fm+zSx88A6tPjKFyvjyY8iaxely3fr5iD2wR3DeCtytFzuXEfnhDUstUCT/tg6nwOtMib1C9HmV
 9usxdGauKTYQ5prPjKT1buoa9LcZEvdbsagNdOsINd0cS258WnM1RXsjIs4GZzXVl9Efersv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_05,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040108

On Fri, Jul 04, 2025 at 09:17:01AM +0200, Luca Weiss wrote:
> Add support for the graphics clock controller found on Milos (e.g.
> SM7635) based devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/Kconfig       |   9 +
>  drivers/clk/qcom/Makefile      |   1 +
>  drivers/clk/qcom/gpucc-milos.c | 562 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 572 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
