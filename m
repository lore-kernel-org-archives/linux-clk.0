Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288EF35E54D
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 16:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802644; cv=none; b=H3981ijeAQLjnbSLwh/fK0OTnyplkXbKJlzBqg0paxkQmKzjN63cEBkEG/uLzR39dswSEtLB+huMFuS2FeH6rgXKpPM1plhJFRhPSHEHZnlxoqvIHeYAksN9Ihz1MibvBA40TKRHQ6Q4e7KuC6WZHHF+Ga73LAqLWpF/acxLj1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802644; c=relaxed/simple;
	bh=517oGs9FsEfTu6NOn7JGse+olEGHedN/noc2azRQxP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAVv6zTs3s57oiRJVmL+N/vErsL68it3ehUtcnJ+2QAdazjeUx1rHgWdmdyBID0sltB74dpskdqC9ukCKlNXWIepNI8AkAGzaQmyVjXI9uaKwDZC/UJUmt2e9tZxq+3DP7F/YHgb/p+6cOOd/dW35PA3hIt2w9vZ+107XYyBqCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqJT1EKH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqAHlOMy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqJT1EKH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqAHlOMy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079cFMi2877784
	for <linux-clk@vger.kernel.org>; Wed, 7 Jan 2026 16:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pNn2hydp6mFmiGWfG0RE3hVW
	bp3VHRZ/n5+RMle+1R8=; b=MqJT1EKHl9gRMK8gc0rPEEOryXVHNkKqHzOPhh/n
	AKEEjEqLEKTW2bGKBRI06bwASHx6DmgC1ikIzDdo7anBNcZ5nmByjlDBoE8wIxNV
	+qN2hpoZ7gwmTY6KSu0q6Pf4wE8zoHUNLC4X9c4L03FSu1IyrVpPQ8MJfDfJ0BxP
	JlfcRMskQheJx3n0Ayixqm/1rzn3HG8yNxshkN2Vuew7aB5yQgQmTG2ciXHcKFc5
	qZm3c85gkUlgOELx3bCYSq48So95d7h4f/ckw3AO3Myt+rakPPYY8a/OvLQAtatW
	Wz/OFC7xxjapfrQeP3diKItz8xhCoNAaIoK5tBrS5BdLzg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn1cs73n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 16:17:09 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ecf43202a3so699283137.0
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 08:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767802628; x=1768407428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pNn2hydp6mFmiGWfG0RE3hVWbp3VHRZ/n5+RMle+1R8=;
        b=SqAHlOMyvaIllv2AqAb6c7n+o6fEm8agu6XO04V7GQlhA0CkFOSIZpTlt+mc/5B/W+
         2YPqYVRqFWIrlf0Kqv7WYo5ENGt/eaRoXqYtyVV/E1+KKJZtMmQQNOvks5ihcKwNPRvx
         91NT27YeVYF7DFhiXqdDdS0vuLdHD/7WUMzFdaqZaBUIAzg6uNR0OFGF6eLvOEtruphf
         3GoOD2d7zO+MCUgzT2AI83ULTu9fOISNMxbZvs+H4HRYRjDrvmdslPu1t4R5WMg4OTmK
         fK1jJ8mDP4QAaQKjdkLoI8m6FBASeffbV6aPL7Z0IC+JIl2Iz70ddZZunO5s6+81tRQg
         TShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767802628; x=1768407428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNn2hydp6mFmiGWfG0RE3hVWbp3VHRZ/n5+RMle+1R8=;
        b=fEOqCtzohPvODkd6lZKgx4Z01y3a45luplxH0HrCriB5v/BP33HQDfWw1S0okXJ44a
         lqN9OoKDs4wOCE+u2KmVKkYvEoYwjVZVD1CPcMNGDwQ+KGQHGeWg5E15ql5nT/3o5DZT
         ETFYZIOPuoGG5+dhTzTQP9uGikGz95jpI+plQpq4EDWLHNgOWnQm/VvcB6Q9u4ZlTMXU
         i5Ybu3w/eV/vrgo2UuJDtQWzdBmynur7xw54N6fLXDN2j1igPhkavHJFsuOBxPHRcDLY
         oiT8ht4AaiD8tT6ilNngep98aiLXjJlGdX5RVi5KaXMwLUN9pDDsTwmiCdxoCcTgGVFH
         8L+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTGBLoziy3zQigJUOFsPFfRKf/gWGODe8A9wapmTW4q5TESmIu8zmmBS/0a/n9osU280NHAHsrAis=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPbfY2cSV5d586s6FJ16yPf+NppeLXyG+XEiY2lFrhJAwh0J4R
	8FYoEbLHDOUfzQLQEADz2gY4sYBlIbtdnOq4Kqgbd+Ro6F552JsM5QNqDPJKq94sNKoz/THmaJ4
	MM0cwbwDAnypxmDoBp57cFOOiwH3/0prDIUXgJaj1sNHK4nNOypxr19IZtx1dtLc=
X-Gm-Gg: AY/fxX5aVD6NszWStRNi3vJYOFenc6HS7cUQQNc5kuYgCjEiYfuC6ejhcWR10leIm/y
	W2o7KRMYhnsyhnGQ5E1rxoMyHl0wBrxlltyLljSImYg0EVwoKWQj74sU8okqS7Re/o+nN0bjjDp
	D4NKuq3kxDSDudGXUFSZ/2ycO0sL49tvvmnLlU5L575hiPbew2fZhom1hbKe07NPZ2cim9BHHAp
	iWgbcVt6St4NxuKTbFr7tS4PdaI2w0znI1bEh3UonVohH6JlVxLrCgAu9FFQJEMkYCrKNB4Aqno
	iZ9JQOdC0z13AxvrNaVK2ToVdmElr/ptI/HHcSrE83gihK4661ShEZDv0qAImuloh7cKAn6EdAh
	ZySz0Tra4tUIZOvl/CYwOSttF/V6Urzsew269QaGVWatNsw7MfsjEgf1rsQ3IhY+y/nc5haZMiy
	NGvuRHnE+0m9UOD5PnJVeJXDE=
X-Received: by 2002:a05:6102:c50:b0:5d7:dec5:b6a7 with SMTP id ada2fe7eead31-5ecb65744b9mr936523137.7.1767802626953;
        Wed, 07 Jan 2026 08:17:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWo7kmpZp++avSupk4Uz/4kHmAaLqQIgTBTPz0DzPK5KyO/RxzYBCX2g8LY9QhwFIztQxq7A==
X-Received: by 2002:a05:6102:c50:b0:5d7:dec5:b6a7 with SMTP id ada2fe7eead31-5ecb65744b9mr936476137.7.1767802626202;
        Wed, 07 Jan 2026 08:17:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea872sm1384019e87.2.2026.01.07.08.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:17:05 -0800 (PST)
Date: Wed, 7 Jan 2026 18:17:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 08/11] clk: qcom: dispcc: Add support for display
 clock controller Kaanapali
Message-ID: <3sbqfijv6b2lxvx3kwcu67a233d7xcpvc5x7ysc6ktk2o3d4qx@6eagaimfqd44>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-8-8e10adc236a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-8-8e10adc236a8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEyNyBTYWx0ZWRfX5EdJcj33hw0B
 VYDOPn0Y+DJl4TBrolX8RhxtABIoRgVPGNdXBHQ52UoeEUghY73xE2rgdBJaH6nPzMAISmckveB
 cbUDSJLcsHM99DQDu7WrlYKCwCHEmnnr1FgHAY83055SLj1+DLLOL3rnIW8sTyoVIJLdPdwlSBQ
 nJh3oYq3tLHRzcZSo4jA0XX2f9lsQTlFdNzeNqKC8GHoJXXYlwDNwmpL6XKmHD0e/BkaVnNBpK6
 Y11Wnq4Mapb43tajMunaM2ZJLp4QFquYsZVrOKL71xlevAWzO50QdJa1B5slM40MUsZ43XV1j07
 RcZbgMGuNU749jyZB2kex5Zxfw9RKYf7JWEOG0MbMoGDIXBvlgACjljM6yDySbTJKKPjzTRkW9k
 joo01nfzOArFFOW3yiTeDvfc3byX7MAHZJ6Mq7iiEKZsAZaI2QmR5Y91PQMHRrp1qN0g6hoS6Xk
 I0LMGwANkJgWrIcfr3w==
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=695e8705 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gpaIcbXCgmfx5VOTBCIA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: UujMh8kmwnojRNiXfam5g4SGSsYrvGcb
X-Proofpoint-GUID: UujMh8kmwnojRNiXfam5g4SGSsYrvGcb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070127

On Wed, Jan 07, 2026 at 03:13:11PM +0530, Taniya Das wrote:
> Support the clock controller driver for Kaanapali to enable display SW to
> be able to control the clocks.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig            |   10 +
>  drivers/clk/qcom/Makefile           |    1 +
>  drivers/clk/qcom/dispcc-kaanapali.c | 1956 +++++++++++++++++++++++++++++++++++
>  3 files changed, 1967 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
