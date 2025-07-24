Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608DB2DEA8A
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 14:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753367023; cv=none; b=rlcZbJEU+eiPKtgqKGrfETvSgYK8qWaCG1RzJculZpp5sPP6gqRcTeEIna0RHlNO2UoEc8cUJrColvi3WKBb+tCNlJbPmXqe2GgeCJ4rSncqQh+i4o0xsKt6X7gvNp3Pu+pc/BCb7dBNPDkCO6OPBx/frBdzU9MdPKmHifLMVAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753367023; c=relaxed/simple;
	bh=WvyN6qjNgv1yPDJutX/kmce+hYMmWcbroxxMeW2zB98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mazyvgyHvlcyr3WjcEW1ORux6nqsm8vXPNzIJLPX8UE9Jbxwsqxpo1wEUgte2qrcAQXtPgiqy/NH06pNIsnIyc09UvwxL2pyN1jrbWZ8iTq6C3uZBMpbF1gBX4ZXKOqVMSchtlrZGZ8W5HLXfdinxd6IHojhTvI1mhYLjbke8/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILfxjR15; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILfxjR15"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OA8BI5022037
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 14:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EFOidjaJx90ia2Zk8m3/+Y4Z
	rTzQKZq9KqbiuEHtDDI=; b=ILfxjR15jwCUi3M1R+fDS5ml1CNV83noBUt0MZs5
	byh6gmEMOeSC8koxy+Byaev3OxYkJHmvxHaM1o2oEAp4SgxJW3susPClH6bPs/I5
	63KPEE9thB/uFCitK0IJ0e8Bv7yxwgtsNiYDnlaYRFYTI/UHuG/WtbfuP7UD3YEX
	CdvA2Qzn3ozZ0xZW3DWNDM+NLp8rdAVwYhWqTvOf8B9Y/KnsUy3uzbHzNjijDZDr
	1iyq41DeRXfaraNaAkJOGWJqIVVeINHRJsOVnr4MBNzcK/dc0o1yvum2RRtIIBn+
	n/JntZnMc0rM+73i6qVLMwhZNLgFVSn9bn7kAmNE5bgI6Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044drswa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 14:23:40 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-875af9a84d8so78265241.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Jul 2025 07:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753367020; x=1753971820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFOidjaJx90ia2Zk8m3/+Y4ZrTzQKZq9KqbiuEHtDDI=;
        b=QMgrLR9SDyNPwgYLpW8VZHU0CjVRYXSU5VsKaRG3p3tK/zFgM5VhVwC0lUTPZIT9mT
         YmCLIBFMYoypC5jydoz8ceyQRO7Y5cjwkE5Bo610F7jH6RQr0vhD/Ow3uHTcIYSmobLq
         AR+G1WDu/LFmAH82N0y7Xs0+khseinaoMxozik3R7LStaMOQ/3Pz88mq197iPDCmBogs
         pPdPE0tHE271OG5bLw9SRF4Cyh/0W/YJn4ZVd2tFLvD9W+28Xu47YId+YzBG/s1+S1gA
         vvT2cuZFigORPrQqroT5OCb18ULOXWXjUaf+V5Sk7Qv5Jl2xxnD4jKEICAIDmGhr7Pvs
         VFyw==
X-Forwarded-Encrypted: i=1; AJvYcCXUC6J5TdCYM8D6Hl8PD+V+qZTqBs5LjdckYYRLbfsAkozV09pN8KXidqGlWXq4UViVtCFUYftZGHM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz83aJkUXS2160WpFMLJC2CyetD5a2Wm/7nxpOpLjgqefrIrBn+
	MsFmhOyVNWuQtF0mtDPLQl6L+Afe+PhmUK0TMVukUulfif7gB1f/58PEDZ/reB62PZUuShep9tB
	Zkld7qmI0Gs8KbQS8b4G9/OHglNchEtJuxZlOeYgm+IvuoLHKfTGAAAiYXiDDFgs=
X-Gm-Gg: ASbGncvdWTpOyspAsZ+lb6nxn/J+wTeRdvrRA4lJS9TGJi1jq89bgfY+1cVP6cNNQtu
	/S4RrVk62ro+zfkFmiNZX2VweQYOLOqLfT6M55CTwkP18eJKVl22zVq7f9DpU5ho02MW1VxtHgT
	YJyna3MR9yi51xeUpz2r/C+RW1W+4vp1qToCZ6ARRfxwo8CETnoeSBmEFzBT2LgbD7NS4/v4nFv
	E2/bgPCeoH9bV5HDorc7gXE918NElMD1OocyY6ZDQFTlWZka73aE/SDaRd/tZa8Z63bUHzqorK1
	kCbtMgdC4KFe0Btw7B/nJaX6EiXckSvauIWRvhfHsubcqBXm/0+YuLUeJz6Xk0xVPyBjmYuT++C
	77yvfdUoO+mI0stDu+6ICeC3wTWEEyHDBC9Q8SA7Qal9GlBCLnSAN
X-Received: by 2002:a05:6102:50a0:b0:4ec:285:72e1 with SMTP id ada2fe7eead31-4fa14f8c61cmr3317694137.6.1753367019192;
        Thu, 24 Jul 2025 07:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrZKK7zJvgusO6fy75bTCT4/4c02uD5wEiU3AAJ6v0c53WXnZcDPmknMIWu2XnG0USllhMnA==
X-Received: by 2002:a05:6102:50a0:b0:4ec:285:72e1 with SMTP id ada2fe7eead31-4fa14f8c61cmr3317642137.6.1753367018745;
        Thu, 24 Jul 2025 07:23:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53b35cbfsm383014e87.70.2025.07.24.07.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 07:23:38 -0700 (PDT)
Date: Thu, 24 Jul 2025 17:23:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: andersson@kernel.org, sboyd@kernel.org, broonie@kernel.org,
        mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srini@kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 2/2] clk: qcom: lpass-gfm-sm8250: remove unused gfm
 driver
Message-ID: <updct7763epzqvs5xgs37xsokb534vhefvkmt3rtjqvaceu2vw@jqsd4s3nbuyk>
References: <20250724134229.103001-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250724134229.103001-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724134229.103001-3-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=688241ed cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=U1RUb5vHvPbtf-jDBY0A:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Fdd5-EQK1N4BFUNG4lswXeNwFAXYoEe9
X-Proofpoint-ORIG-GUID: Fdd5-EQK1N4BFUNG4lswXeNwFAXYoEe9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwOSBTYWx0ZWRfX8IkKeAUlE+Sy
 nein3Si12TKzzYBpqJNtuIcmRDLeewqvYxNwVvIpzPYvqjJBNU46MfvKeqEDwNMR9a6StbvaRBb
 8pgDs1VaCI6ihJFu0HmPrutAFJXn+sV04DnaQaGJHa0g7zV8sPa4VjsaX7NuBgErG2OqNgdFvt7
 AOupxbcXBN0JXpreV2qiuJ90ZyXo/VByjmKNv3oE+oXy56ZZoQNNj+1sQE73+repVy0uYHqdRTQ
 GQqhYIquTh4wDaPBiGifQQPbyk2Erdr10vgArpZEGnXDotb8ZAaq/l8qhlfbcvTVA2vU4coL821
 hjz94x0RhdPWaHXFeYVYkx7g3gpIrp336Sb1iqD2OXXudtUezhaJidsX7SdfP7CdxPepD0kopwj
 f5qzidZ7Vxz8omCi1bTy7sneTbX1iL30GRC4L57b9xziZDRazl5LStkvqoQ3Ha9WNhKUuLdH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=848 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240109

On Thu, Jul 24, 2025 at 02:42:29PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

I think this should still be @linaro.org, especially looking at your SoB
chain.

> 
> GFM mux driver for sm8250 is totally dead and unused, there is no point
> in keeping this driver without any users. This patch removes the driver
> and the dt-bindings and headers associated with this driver.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/clock/qcom,aoncc-sm8250.yaml     |  61 ----
>  .../bindings/clock/qcom,audiocc-sm8250.yaml   |  61 ----
>  drivers/clk/qcom/Kconfig                      |   7 -
>  drivers/clk/qcom/Makefile                     |   1 -
>  drivers/clk/qcom/lpass-gfm-sm8250.c           | 318 ------------------
>  .../clock/qcom,sm8250-lpass-aoncc.h           |  11 -
>  .../clock/qcom,sm8250-lpass-audiocc.h         |  13 -
>  7 files changed, 472 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
>  delete mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c
>  delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
>  delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h
> 

-- 
With best wishes
Dmitry
