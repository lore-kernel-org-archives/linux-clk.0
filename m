Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF7D7262B
	for <linux-clk@vger.kernel.org>; Sat,  4 Jul 2026 00:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783123984; cv=none; b=BGfHq9atqLXWmY1HpRgZZRUWQMP0jeloKfolMrXs1SN5CAQPwTiGQkJfEtxQafZ2/XJx2ImMeWMQs10FJ/lBDQ/BP9/c4fiEN7MFGC22tZdXR4cHOVkvfge147rVIVkBAgvIGbpaD/VV6DXo6eHPCUzLIxVY5cvX+9hfD1ijhEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783123984; c=relaxed/simple;
	bh=hruM/PHaLAkCf7zVpK5xJEGVufHn72WbxcVPSze9Lqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDtnyKT3kPB5p5fOb3FQDdU6mtcQq8POiWgZGHOUlLc0BtWHTBpI51jaa+nCgvLYEIM95b1Ff005IljTNPhBSAS1SvxUDyrDvYtKNj+HRECIP9RbloMR5M9zun+i4wsipr9rhcaJHgC9J3yHu1QB8hCpvYFuUIt0kE1GukqOdjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVTNoKVl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dRGwGgSX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVTNoKVl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dRGwGgSX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPT4M837450
	for <linux-clk@vger.kernel.org>; Sat, 4 Jul 2026 00:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YtnHongBjsDZcPjVpSHCdUSm
	qjDL/oyRnfo9B+6G6+U=; b=HVTNoKVlj3+uziHECV96on/XvgNtzFa+AKqfIWq/
	nManMxj/WiV/09hkgU2KDVXzm6tBnSU6NHVOnqaRxp8JFigNZntLUWtcAskWcWm0
	Gvo1FdN/WIQBeVpfHlWu5DRFoYvuvbE2P0ICoGQpymXMJTtvRmFB3mM4naGLeG5V
	0LYr7d+3+dyFxvz9SkZSTh+kvKtvuX+HCCOBe1pQO+PLU2pXMziTVuJXGcRIVDI2
	Qk5Dduz2ww+SzPpdgWAeLx3Sl3eUl8oCzjn2wU4QpXgwFggew4xXQPxW330C1ag/
	MwvObTRpjSeDaXBrVvTVoKCcz4qi0/2tIIOk69FZoOW5nw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyu5er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 04 Jul 2026 00:13:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e820609d9so71275885a.2
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 17:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783123982; x=1783728782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YtnHongBjsDZcPjVpSHCdUSmqjDL/oyRnfo9B+6G6+U=;
        b=dRGwGgSXrDJ6HYPswWhXWvmHBYST+ZiJM0t3t674qq4Cw+Msz1vVfmqvUCrZy4YxNR
         xYnFl/xTaMiD3PqXzvRJyclpLWpxKXDvfRHrhU7QFp/RjOMVy3mWkp3QqfSXq4rsGOhc
         KO9InwNjwXfHPwbcCfm4yr9ffVWma7d34VhBinM5I8c5hd0JiQ/Ci30K0EIwnfE1JIMv
         fv76Ifmch+tzEYl+YQ6SC6OlJPrKZep4oaAOWArhuZTospPDKYwh+DaXbidAt5y+1Lp1
         kbsvj/9CkBBqq5Z66O4+7Se8eHL5z6ro8uQeuUxddHdux6lKAv+KwCOl9p1iFdVCPGdk
         H7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783123982; x=1783728782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtnHongBjsDZcPjVpSHCdUSmqjDL/oyRnfo9B+6G6+U=;
        b=ngzJt9ge3pBmzAFXe+FArbn2GTC7Uii8MMwQETf1Oq8Il2qwH5IJL3p+m+kKSc6Qok
         qltdvUyeJJa4XX+I4BFYY906Pmh3qVGJsdZkhLweW8KFec29tikOwZOOZO4dgTCqsG81
         3oo92KeV+H+MfvErDRpWEuTVzeYmpovLQjs4JGJ0HDW87uQHc04vBle6jEXCW/S+zevU
         EUc74gzoDwKgsEqW/o8eHvmY7pjX6FW5x8qVfvC1ZYX/zze1FWAvBtu0q6GsxiOCahgd
         CywCwvlY92g7BZ/4/+bEPYlytjdCc3MBLJIcaLcusaiV+1J0yiaPX9avwVDx8HJ1xhjl
         e2cg==
X-Forwarded-Encrypted: i=1; AFNElJ8tdmHWjkD+AnzpIXru306C6q/eLy3BbyI9N0bCO9tCe4S7ZUrrnP2c7g/GgKltqpDm+o1Yu1laiOE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb9AD6vDd/Tq56sm28xrIYirNPnrqSVLETKVFNz7o/JhPqkq8L
	KximGUW9gFXlyL+Xx7IYpwUQXWXI9ltZxGcwmpEUD450znSszu1zQjyRPzMUQ5l5GNySUuaGyNy
	0SHZtsWcSnPr4RG5oCkXc5UJ4sr64Rr3cIzLqpZymj43E80PEVmo1FALHcqgj8k0=
X-Gm-Gg: AfdE7cmhqLq4QXXxhC9g/l+rjDO+69euq5vdgSv+dPddJZo4L03Ozl/hLQfaHY0ssEY
	iG+0b1yRIRR84vKnLfuEFBtdvUJ/Hy+twWS6PSWh41zfwVQqPiF5ok93oIO7DBMZwou9wyhggeY
	yCozU9LNUyRr+KTvI2qO8/FlhLIIF6VOvgqPNNaLgxumpX9hGm+0L7L1inat2/uj9C6KSPCW/fH
	93NMVxYTQ8Wqh8gJVDKq5pd6oS72ufKphOFBMygivm+71F7IlRXVCihugh+cB9NcAF2vhLwbQA6
	zeinogU4WaFFDT/GOJDIbv2K+CELKEBtSEY8RW/4Fe3niYzRVoiYSVxZsnvVhNAM7tKlv/EFkYo
	V28b9nK5LPZdyiO3tjwFr+RfuJ15iHAEG1taKSk1KbEnCck3hnqtKZ9FHCsnt0iQl1XLPp1Li6v
	i+b5iIAEdET40+KPrLY36HllH/
X-Received: by 2002:a05:620a:17a9:b0:92e:4927:2002 with SMTP id af79cd13be357-92e9a4a5359mr223197385a.39.1783123981541;
        Fri, 03 Jul 2026 17:13:01 -0700 (PDT)
X-Received: by 2002:a05:620a:17a9:b0:92e:4927:2002 with SMTP id af79cd13be357-92e9a4a5359mr223192685a.39.1783123981070;
        Fri, 03 Jul 2026 17:13:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed137705dsm867257e87.32.2026.07.03.17.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:12:59 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:12:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/19] clk: qcom: gcc-qcm2290: Keep the critical
 clocks always-on from probe
Message-ID: <2yegefce6tymennwlrarvkdirqsutsvhz5k5sbfeon3kyzvkll@vj2xqbiasuci>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-1-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-1-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMCBTYWx0ZWRfX99tv7i1JJLsM
 mAObVCUAOzgYTJE/P5jIYSSTkRDqzTWnOuPMrLvHuHnKwla/UHI/wzQihKABr9oXP7PytSs+OqL
 8528DnrSUdIQkJo+mqYHLtQSxPXk+khdg1lh2kP5L6Ulyzsfvt5QIdP1iPB27juKiMsTsnYj5S8
 kkwsFKBfQP4Ui2TfhzX3dwxMYslHy9KUZ9hinbV62Mzt9zZZCJIaTqSp1wd9/CA0boU0gwZz0wp
 sb0Bkf90FsewAoGeDvIDEww6G/O2uqExL4v6Yw2VUDYlexkLCsdrotNJap8I2uuknIEU7XScRsQ
 zpd5wwO9zBS08TGpnPVhBelte1chR18OIYTsFDyMFKl4s4+8WwPr1cJnF0p2PXE9ZQfcJCOO8cK
 QKe8/TZ/+tcmC903dG8tj2DyGd4tHtZcCpu8/MMpkQcWr1ndnFpYdL9RXg7QAqXCgCQ//MqlWU4
 uyNfuVccBHCgJMEVQ3A==
X-Proofpoint-GUID: o0reiPtn4h2aGFavB3wxqmsFe1mljywi
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a48500e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=P3Ave3MFjIR_A1ojsb8A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: o0reiPtn4h2aGFavB3wxqmsFe1mljywi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMCBTYWx0ZWRfX8jmlmWHfNoJB
 klf5A3YBjBBRKyc3sLZodoF5p6nO2pTKdiDN9TSVY7qw0+hfeEZkyABqQfxjZVWeBX1kgmN6YjG
 nwEEgqu85QvTW4mWojENKfPLVFJ/OUw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040000

On Fri, Jul 03, 2026 at 12:01:23AM +0530, Imran Shaik wrote:
> Some GCC branch clocks are required to be kept always-on due to the
> hardware requirements. Drop the modelling of those always-on QCM2290 GCC
> clocks and use the latest .clk_cbcr convention to keep them enabled from
> probe.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-qcm2290.c | 113 ++++++-----------------------------------
>  1 file changed, 15 insertions(+), 98 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
