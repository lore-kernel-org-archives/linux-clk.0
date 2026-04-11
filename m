Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19953A7F5E
	for <linux-clk@vger.kernel.org>; Sat, 11 Apr 2026 16:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775923978; cv=none; b=JdfA8d73M8ATFWsPpDNEbO9n8pQoNxeEnyDVg2tGeYSAyCCE+rlTU0uPH80oO2RwVhSV6gOeFfjIITMpAMc6ZJQt1jN8mEhT/80nuBMVZb36/thqgXrvqzCGD2/Gv4kB/IS3hN24IKuJJ8USqIBDDJEolDJm4yDYcCRrAFYovbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775923978; c=relaxed/simple;
	bh=bofRuFQP5HiDDbmWiJlGOW5pFcZI/dduhU8+a8uHpFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jR11YlHwIsR66fN+J8ktAvBCRtBGYCVyDcKezSiCGAcY+k5cW/EvZAHsECaYkbZ7s9i8JNK2yYx670xfuM7StPDT0CBIivXGIvwmLozN3CY5i8tnFga3dwoH1it/AcsJH4YHprvRO9ToBq2L+yjL/wodP771xeFU+XcfrMNa8wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eUkYjSH5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCfdOBrb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUkYjSH5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCfdOBrb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BEpWV01035602
	for <linux-clk@vger.kernel.org>; Sat, 11 Apr 2026 16:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uYcNzzxm/hI+gu2DC/7bHmlR
	eXhCbsJGa7eLMlz2hJQ=; b=eUkYjSH5f6r2Pt9BeR8E6yMPRai0wZO33gdP6zAx
	n4LbAV1MVkURPxtXMjGZEQ1hFRWP6xX4MC2WXUyrd/diZZcJC4VTCD2+MIJYJAXe
	7shGgStiF+YgLV4+WIcrmOFAbXrRlrq2I7Z3sTZu1xZWFU/k7yEX/tMCh2a0IdCv
	YgzYavKi4NwtQyjZOROuJd1eH4NtlvvfL7IjCtD2LfiJv3Hkvx0xyJyl05vvwEFn
	1P4LeQ79RB8xptAFD3ruuvtQxyjVRHqJVTDsQ2xOQfMtU99JnQcK7x+9m7JnTOpo
	/uPz99nNe2YfLCqPm5STlcY9983bveh7McNfDmb1xLTdfQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew010v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 11 Apr 2026 16:12:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d4c2906fdfso315816485a.2
        for <linux-clk@vger.kernel.org>; Sat, 11 Apr 2026 09:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775923976; x=1776528776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uYcNzzxm/hI+gu2DC/7bHmlReXhCbsJGa7eLMlz2hJQ=;
        b=XCfdOBrbpdZbYNbwG6xVF5FX8T4jSyey7V/FAAJRFaFJuLGJZ8d+zGS+SdG6721zo8
         KU2b4vCO8/D3LhuW8CRyqrhyxoGJt1uQnf3TdRWfNcr24rueyZu+3bQcXcm00McyR+O3
         FADZP1uG4NSD4ghewQs9pS0ZQagIqITyJEbE3s4L5hZmaR+N5eh46qbv4C76qMqUxlV+
         iqtPqc22/sdc+0igmG5ul3Z1FckJBqtbfFEVPMHcaDpGIfoVLY34tcLmr+b15UE1DGO6
         7fZHpTetgDlQaPIDdwYwUpuhZ07/EFgfsppfTe/zAzmSWM79kE09i5Dk0MYni7p5lF5l
         b2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775923976; x=1776528776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYcNzzxm/hI+gu2DC/7bHmlReXhCbsJGa7eLMlz2hJQ=;
        b=YqZBhJhLLALyN8p75S/R5RU8ODhf6/TWePCWhHaJDs/sfFWmkh+9X/AlXd9ZD5tb9P
         oczwic5xgAaYHVpoi8KhslK2uaW3gurngHvr36BcFraYAmVOn1zRZap+A9iFOEsUV3pp
         dKKTVnmU71eA24trIl0vuRseMF+RifOz1fc+ImNM6hyRv5ewRoG1tgYchU4r/N3qnkAG
         qfa4yxD/vHldBYS0GXt+9nRydcaNlYx1YD6SF1Sys/Xxo84yoSNenrhIvKhjobTYQK2A
         DiOF0HmLJee3akgBsHZmBfW5DbD/mE8KCpY3+dE4o1I+oFna6gL1J5dThQhqn+ANB9AE
         FfpA==
X-Forwarded-Encrypted: i=1; AJvYcCVtDHtLUUCNXM0XUx2lEiSB7d+KH7RqFmoCkdKZr9o26UDEHt668DAjwM58muV/R6wIzmekjP04CfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwE17vCEnS3Wcc9OfStq6qhzv9Zpb1JI+2u38vBti6nGQ4kgRH
	NsamninWi5IIR1h/mxHP4Xdlw1LcmhqRJU49Bi9cxaECIlvRJfc2yR8myRn4SIdJo2m/PiwdQHQ
	E1wBQ3cqob0yPkbcCaGgchbGCXCgFG4hgsTuIxPMw6laFAn7/D7bBoRSCADcLYkvpcjkprUE=
X-Gm-Gg: AeBDieuPgHZJV0MDLJlwJ69m2C6Ybq4foh2yu0i2DGPcf55VXwoORIUJIpFZVRFWWZ7
	ALDE0Gueb4xkwlx5YZD44b2aJgCC4H9voNJI6BBr/remSvZ4Ff5aIMQycvaHVNc4JOfvcmc3MdE
	ajYmqNv0cZYqL+i1qP5gbPh/Jz3hZtdayCCazaiActgHt4C8ZbKxXY/lFK1qClSov0ydgY5Nq/N
	r4ixckn1zVIj+MRGXU1rmrG9LEKoDDiTPTBWIWWqPcsaZ53p1FuzehOALzJEgktSEungl3ngBhb
	WBJCKjzoEAQYtHktBithEox5gGPd9QE+GLXwNE8cUMuzNlRT0A+M1Qy3f5zEP0Tg52GhyFbb5Bz
	nz1pB/R68eyLaSyunOUOUHsvXHJ33k/vQdPf6FAeQ+aHa80c1S3WfMOTkNkBV9vKtuRcJRYw/99
	DixG1Fv336nK1zG19W3LTLtQntlSjlD1L+A3k=
X-Received: by 2002:a05:622a:90:b0:50b:4491:a2cf with SMTP id d75a77b69052e-50dd5b007d1mr110761141cf.27.1775923975735;
        Sat, 11 Apr 2026 09:12:55 -0700 (PDT)
X-Received: by 2002:a05:622a:90:b0:50b:4491:a2cf with SMTP id d75a77b69052e-50dd5b007d1mr110760601cf.27.1775923975265;
        Sat, 11 Apr 2026 09:12:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee1315sm1477003e87.53.2026.04.11.09.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 09:12:53 -0700 (PDT)
Date: Sat, 11 Apr 2026 19:12:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Constify qcom_cc_driver_data and list of
 critical CBCR registers
Message-ID: <7aevdufcxyuzlhw4ddia2etqcxwio4qarnyit6ms6w53tncqlf@uazoklj75rvd>
References: <20260410163326.566093-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410163326.566093-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE0MCBTYWx0ZWRfX531iMcdXam8a
 o3Wsk0SmGycVUn7wPj8mEYi+S9Xa00501Xea6ofHVnOOpkdu1H43M880fdUNL/iDy/nRwyU4/s3
 qDM/GKpFmXoSqRP8e7TwJO3xr5D0ESFZ/vLwn/bfns46uk2oYQIUOVR9NBLObYpsBsbiNvLCZoN
 7a3FM8xnDOgLJyQ62iNyT/eX2lcvWJsvRYTiboiUV5cMAwVpKnMm36INR/TFFl2pB0hXY8hwXGC
 6jKID743Asjhpi3Q+flrZybrrk98hmhckYvs0VCGRSZE9Mzo1sQf7q8iCbPdZy2ucsmiDJfmjsB
 wOYXaYkSpJKmTTBWCOM9Rs84x+UQx1TQr5NX8PD2eJHfCt+lFdtm7/M/oeLeCoaAHhPVqt/0wbc
 UO20aouOOjspYVHwtZZdj+p/RyfQhYDwrVPqjH80WqWAQJU//Eo56RDB2SYI7aB1ll792zWjaVE
 fF6BcB1jBZVz2O0rFmQ==
X-Proofpoint-GUID: 4kbnZbZ8m61NZr3R1ImNSZRp92FLskZf
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69da7308 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=-x_MtF83Af9THDvFyf0A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 4kbnZbZ8m61NZr3R1ImNSZRp92FLskZf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110140

On Fri, Apr 10, 2026 at 06:33:27PM +0200, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
> are already treated by common.c code as pointers to const, so constify
> few remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Drivers introduced after my previous series was merged.
> ---
>  drivers/clk/qcom/gcc-nord.c     | 2 +-
>  drivers/clk/qcom/gpucc-sm8750.c | 4 ++--
>  drivers/clk/qcom/negcc-nord.c   | 2 +-
>  drivers/clk/qcom/nwgcc-nord.c   | 2 +-
>  drivers/clk/qcom/segcc-nord.c   | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
