Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5E42222A0
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 10:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753786177; cv=none; b=OJfY7hbx6NjmMSyYtfE535ekcTjKDsExYksPHZiYE6S0jO8FL1d+3ejOIEhCFy8DbK8cFoNFOOJUBK0MOHQVUNv6q9vpg/1/wzzFWwbua/Yc13SyRKBeenlntqJzDUQht1AaUWlh5/LXiG4XP7xfEX+qDH/n8M9SEwOSfID5AMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753786177; c=relaxed/simple;
	bh=vUdyfTdjbF+l3su631l5cooBtaC3WlleYouL0ydx3Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jG6AEQTiD1nTi/FANzT37dIpomQOSsHizDRIW08H9aURqECR8tibNnszffQ6gunJgp37FhF0jG5iyDnzL1qtgg7KVfTg0SA+etv9SLaWrdHxaPIXcMjapvfTby6I12pqx/hOJNAgl0YfPvka8CkdzPgCvQo7ZxrlhpyizP9n+/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQ3J8MGM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQ3J8MGM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8p1nR023457
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 10:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lo5hcIj++3t+Pk5CHCpA6OOx
	qnwkB/ZqQgNwTp/vi58=; b=KQ3J8MGMx2ou2NCU7VYBeXt19vAJfMqVfNj/9ypd
	0BSOxe0HgLgumZ30klRpZzBfzJseh00YNBfVMOWXaGMzug31SVQpplld+hMP5Uka
	uGYWwjbAo490xmiLjPP4jcWVFxrFvAtTXNsVF+ByODS4UdCK7jnVer3hETec86Ia
	SZM2tgeHDGPmp2MQMKXwuw/SJqk82PBWFqKO6JFewh4tExPUtqcAPYR0U/eHbE3x
	QOe5WyFTVd5wNGvJIGEJJKdRHCvwR0BnAhjQ8Gmh8bqZahaL1YYwnOu04LKO6/sq
	cRvW4xo0AAdT3SiUecGZwezPtUkICm9XzvHUuVshydv7TA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qqrfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 10:49:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4aba439b4ffso131005631cf.3
        for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 03:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753786173; x=1754390973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lo5hcIj++3t+Pk5CHCpA6OOxqnwkB/ZqQgNwTp/vi58=;
        b=dlIbdbL/bERV3vstPMolCPecArC4BiAx4b6aK3cx2dvD/oMbSxMd6U+YkDGVgO2zRo
         fp9chVgHvrX5fe9/p/taRRFGDZ3+b++2EhQAIyIE0lOEaxkwbldVbEEaDgoPPasEDf5J
         EYQ/xIS8g0VA9jtWt7ht7pyYS+RvF5zWEV9JxnA8a28sqrUJ4p4uIrVMdutVH6jG7pbO
         F2IhkFN25sFvQcdP3XVHD9yu2qP34nuIm3TounqEOC2cNm9ZmlMZ+9TgEtNMXFh1XcKd
         z2DNJW0riqvgpdVFH/psHTLQVu/ou2MGPZ1lWjNRqxt1H0zNj/P5wpjogbZW6UWHW9dU
         ay9w==
X-Forwarded-Encrypted: i=1; AJvYcCXBcD6H5kVUSX1MKEpFUNK10tQyvrp+HKYrgViQWRXPcn7zDAJ9zhhjUb+QidLINFD8h3GAi0W3B3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFq5sjTabdHYd3rv7P4uV3NFSm9gngZyP4v7Gxfa8UnpgqlqPi
	cpp3KH72LSnYztN47ahQljk9h+Rv+AEr9RQBNhubNsGRVgd3bAHYTl5FmQmt4L1wIjxvt2PXF8g
	owfqgGwTAaoVk/qaXPcbmIrbQrWOs6vhyEZgO4MnXuVu0fap72qyMzgi18LkAqRM=
X-Gm-Gg: ASbGncv3XU+CvFFMc+vZgYnjdJlUAUsnEZjFE/kP8jQ1CoMMjAMox2AStcyEs/b6KDj
	6Vjio3VAmkeMxjcWtfUnwfGg6J7lCGTqeteWfnS96tSP63xs13Qb54ySCHs18pheFHlwOjseha2
	FOKl5QNMIg/yGIrrFloLhYa+dNtu5fD4S7JLJznAH2L6E83X0oQWlTs+4S9rZ0CIG40r7xCn+96
	hdL33xHc2wIsh0BKnjgW3KXguNZrTrTcFE/Yt+/KYMYjpXGlCe3fAGHzjEYwat2MivVMpI/7zCb
	dR3FrvqnRuk62+/W17lG5kt7N5sXAGzrugM+c4PgTiWxwR9ec4QtHzuvbqWji8F+8vbq6Ag/bem
	XgUZzzEtPI4YQmpC/cDWeqIQAVo5S3EuWSvFLErdXo1G0u0wySoKo
X-Received: by 2002:a05:6214:300f:b0:6fa:fddf:734b with SMTP id 6a1803df08f44-707205aeaf3mr174250166d6.24.1753786173202;
        Tue, 29 Jul 2025 03:49:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJD7qzRsibNuXaKYj25dTlRQLHEQU+p+3CjeKzyh+6IunNWCn9ZNOdwvfaAwF05to0NXbu7g==
X-Received: by 2002:a05:6214:300f:b0:6fa:fddf:734b with SMTP id 6a1803df08f44-707205aeaf3mr174249386d6.24.1753786171940;
        Tue, 29 Jul 2025 03:49:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b631a1b6esm1645910e87.77.2025.07.29.03.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 03:49:31 -0700 (PDT)
Date: Tue, 29 Jul 2025 13:49:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] clk: qcom: Add TCSR clock driver for Glymur
Message-ID: <63iuccupcdhzlo6u4j66vr5latfabjpbvtvrq4gx4lmxqsqskp@4yamwbuv4ct4>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-3-227cfe5c8ef4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-3-227cfe5c8ef4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA4NCBTYWx0ZWRfXySYwahi7SCAG
 R1Cdo4oEHGulHo50v63+n0cXBleap8x4sMvcW/kV1Z0tTfmawnXntoOii867nLdKimyZS0pgo+n
 IP8d7TKV50QY+W+bNbF0/bTO1q07wHEszXmAu7J+5QjZRENlIgRLqLB79KZUxdyKsmsm27x0Evs
 BCNUPwa2BNg4V8zovS+M3v05jXq6CvWFdVjgGaH2a+k14DZ3gZK9sfEOpqeh8OSf+T6lC6XUD44
 Sbl9q7/vWnaFnSedG/NpbRAgrJ1izPAle8jlNsjOXQ4gV+jgPj+1hSnU4knA/QKCMYJm2rgB3PZ
 ZEGQcst3kyiRHRk8KxGiMut5KUCxcP520JdAFGNrVUFkbx9WQEb4e4r8ONg5PeyNsNMncZMxeP6
 H135qzJjvxltstKt8HDIFk0VANJn8xnOcocVLpUFH0i3A3HdgQaT9bnWkcV4o5+8HbF+nW/T
X-Proofpoint-ORIG-GUID: qhz0omb0D6aU5-x2GQAWH-ERVa_XQmyi
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=6888a73e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=CzopthhaEyFBFQvfYY0A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: qhz0omb0D6aU5-x2GQAWH-ERVa_XQmyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=756 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290084

On Tue, Jul 29, 2025 at 11:12:37AM +0530, Taniya Das wrote:
> Add a clock driver for the TCSR clock controller found on Glymur, which
> provides refclks for PCIE, USB, and UFS.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |   8 ++
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/tcsrcc-glymur.c | 257 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 266 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
