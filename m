Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B01341611F
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 14:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348851; cv=none; b=Ot9VtOGkhAmwiAg/Rid/AwX6MnHaiNdMubWISNZT4wJAI0hUFvGuCcn9tu81vsbFXjOZ5mInYK9enXnAhpgzCmcqfe2CDUm2WV3Gm8KKfEwza4TMTLqy/4IoYkeTn34IqCUgsoii4gf2ppxZPcNxfdtr8kFccVMXf9ML9IkBiUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348851; c=relaxed/simple;
	bh=c8ATsYZUarDFeBqoYlDvFG/Y5KQ0FdsdVPsvH68dptE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyeLspaic2Hxg1DaFKfe4LAfciLYplBi5Mi/acNVAKPxSTrT3KQOVE9SGAK2y9zqWEfCUAwC3jvR4EkzxukMlGER1w/aBo63cZxAxdlLoDnU4x0yGTRbVJ2Bgi1K15NdCI5EF0tIT0bJKTEUbkLfojJ2E9XgIPAE94kUbJerfow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o65x5f+4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a676ZJbM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o65x5f+4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a676ZJbM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EEJUZ828740
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 14:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1YXelcpMQyjjqfxAH5A3yTNz
	T1Wua4sYEO1lqx6kVXs=; b=o65x5f+4NZPanmYwqNS94I7vdzPdP9qW60/M3cVn
	os1yKG92mdOmzrsV+lhvRobK2pIITSb9mGgYFcXeKzMei9fVuuencaFw4tiBpW72
	y/TPARkcA+iPAdnx7Tg0SzYfH5VTjIrOG/m1IUM9+NgGgOf6OOKoq9CfNedxO774
	MafP6ONjIAvAWS6emjWRLzReOssZuhk1Kq6Rtl1rRxdU8yuVvty3153HfT3hJecg
	0n7JtbONr046VR3i9jcOwSGfOFGVyLMYHjZvzVq3Z6kpYEXASDynkcHcHGRHnZJ6
	6Lb63vHqd1kB3ugvhvBXM8oSFb3k7BzbpXaRNQIunClPrQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r16n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 14:40:48 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9693d1ff66eso925993241.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 07:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783348847; x=1783953647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1YXelcpMQyjjqfxAH5A3yTNzT1Wua4sYEO1lqx6kVXs=;
        b=a676ZJbMRPKXCiLxKweawh4RKZFRhFFSO46ciP4iBvbenxdmr41YePBvLXytbkSTik
         kUqCh7gc++hC7K00vXS0IAmkSOM5lACPJKA9knXgJfF+bZ+66vtNYSXNdTL9ULjmIYD/
         fmNFw/zrK/WoDQUvIMQ4mMe1KwkqqVA7XkjfZ8SdKV/bF+81TQtk+AmHrx00yB77k25Q
         Ck0isJDOb8rrJSMNAKtfZ2K2eaF0HGdsQ6ri157rQaoP6j8xSriBrm5f3p23yj8jhSly
         X+uqyLfxc6OOvYGi4mEkJYIZieaAMSFvRAtQARdNdGEq0wxr2C8Fq/Ofqkhkv5PT/npO
         JNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348847; x=1783953647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YXelcpMQyjjqfxAH5A3yTNzT1Wua4sYEO1lqx6kVXs=;
        b=pfR8t+lTQwlJvAl0cNMoPDBaPvW0me23L7MX/QyOLoP/YDFNCmL4MOQq8M00szagOI
         xKv9hb2GW3+fsQBfMJDzxUaIB40c98BNa66zqCt5sqbOk9xGKCTEcSBnWO4gaeyVoNjR
         vp8SgUm5+hIP4iPX1IuI9rNQBo7oxGdvH+3ASoUxsCj7aVu/VpilsARkEOJHvLLyLUn+
         +8jL1qrbsInnFd8/bgGgKnafBF1Ny8J+FDO9leadKB1QZYG6Z2SRlgsxzRc2ydEt98Bh
         eXGRsYJ/gTqxTIUP3/Teobhnn4N1Tqs2WddjZQAEexqpY8voYbeH5fuvDwYAQgX9vO6o
         NeUA==
X-Forwarded-Encrypted: i=1; AHgh+RpRe2NnAbEj/0QyumhGYSHjqaFIZcy4+r+MUA+IUTGEqFIzV4y+jwKFkznLwe/gWNdFfOYo6s5LVms=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR2DfUuRZxR3zRC/e5XbfIVOVfnqCm5pjmXOrSRZJO48slyN6y
	oHlCc9YiNLIQNSTJYuoCH1R2wBKHu6/x4vCA5YWo5oErFIfu+UzfW/NdsxoHBaFfIUwBSbiCVgk
	vjmZlwccK0ucJsLVldgJQhuCvKbw2X9biIHdr2a4TxbFofHPjUESoockRkCqrRTM=
X-Gm-Gg: AfdE7clcCkDj8esAuKIYBLMHu3/aCMmuif+cB8hEQ4NLiyRSl06he+eTdYJQPqEjK4e
	QRcqZLKf79E7AAXWV8bGCBqCnoAiz/At95bT8JPhk+KsYKEAm/faXVldzMAUSs7gUcAKShP9VD/
	suz2dx8ktkKU7C/DNGbl2IhsRqmTRncAqfyhCtoJbK4N+KjdY68QE3oIE8a4Lki66pldPbLr9pG
	Y1mwHWN4Muyej71Wv/X7m9M7VXgP6nHrEZ7MRA3iA0xe4gekVTUNnS5zZJArurtiAyI5l9TOgcT
	qNe4IgpcIzTum3Ok0UdKbBavNjM0GRpKj6k49WAtVlNDndQWZby2LA2U/EGn2up74c4AEBo5DgH
	71WJJuJy8pm9Uk20QIvKhevSlnMkQHAX72f2LBHFJyzwQe85QC35U/CSBAbi/CG7V2pZUgrCvRP
	8jmsG5z6Ok60fOZOnP7iM6TEC3
X-Received: by 2002:a05:6122:219f:b0:5bd:c11d:ecd8 with SMTP id 71dfb90a1353d-5be8c624393mr453076e0c.1.1783348847439;
        Mon, 06 Jul 2026 07:40:47 -0700 (PDT)
X-Received: by 2002:a05:6122:219f:b0:5bd:c11d:ecd8 with SMTP id 71dfb90a1353d-5be8c624393mr453050e0c.1.1783348846933;
        Mon, 06 Jul 2026 07:40:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed136f908sm2893565e87.8.2026.07.06.07.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:40:45 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:40:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: qcom: camcc: Add support for camera clock
 controller for Nord
Message-ID: <bokzk3fqi4mvlx5bhbmrkeqc6rfjpjmcuswdkji5g5si2x3lxh@ryshvgru2mzz>
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
 <20260706-nord_videocc_camcc-v1-4-bae3be9e9770@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-nord_videocc_camcc-v1-4-bae3be9e9770@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0OSBTYWx0ZWRfX/JOcjn6y9uT1
 iHQBCL7Nck0Ix3F9MUTmUct3cfDbk2MIvDbPCOZOnPHJdmCFIjWgg1fcXMo0hlgpJ+j913GGSpK
 DhzuKymNgcPy6tQxlwy3WFU9DIr2OkjUsJXpEO3tesjkHjcgTocRpP3C2yYHOT3a6Z0M139anLW
 1DneATFAhRJrM+aCUvpsqmy+yV9RDJdzBdORhXNUZ2XDvNMGAp+05HWYjtFGjpdnLitmv7zl14y
 8cftJhLddwYX2JN3nP0axtm/SIJ9pnNTc7ZjbH+J1gKtYsPVVY0QFchaavcqvY+gWAwo8DkVwNC
 9DqwfL3a7l2jpxU0nm96/GD70ugstVlv4mdRxBkHQWHMF3UKpn6juhAFsecrQTJvLF6GcFMyn7Q
 srrlDxYqrpqmnodtISd3jKt5hCsfsOYlo7oV0qhZWAfVfgIXzG8iBa+F5uba6Y5b0ysubsVCdsp
 3nuDgqj5NMNmi3vwl8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0OSBTYWx0ZWRfX26pASurBzcok
 nZQUM2TjKlRKQNOwMQWwSPjx9LQSeb6+da9E4W/d5CYZgXoV1/lq4aTuIulb8Q2d991DO5CPw+t
 j49mRFXMPafjnUyWNsu+RgjdBDlGvYI=
X-Proofpoint-GUID: NXeYjab8HeUsyn_nCF0orrO9WbQZV3rN
X-Proofpoint-ORIG-GUID: NXeYjab8HeUsyn_nCF0orrO9WbQZV3rN
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bbe70 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=7Mhvcmd6cMb-wOCvpSkA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060149

On Mon, Jul 06, 2026 at 02:27:16PM +0530, Taniya Das wrote:
> Add support for the Camera Clock Controller (CAMCC) on the Nord
> platform for camera SW drivers to request for these clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |   11 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/camcc-nord.c | 2941 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2953 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
