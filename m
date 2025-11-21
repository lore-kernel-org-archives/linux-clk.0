Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E132FD1B6
	for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 20:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763757685; cv=none; b=n9fA9adQoKu4+uslz3RUYoVTj/6YhCNIL20PT7SmAWyI5iQ7qwHgMhz7B6V6oes4D7KPNF7Xzc8rEaucT3eHwaO1JyeuNpfVhKQBy0qaAbtmgmmINV6KIk4lO/IIdBTiwrZI2h1UWzA/dJVyFY3OmuUzDA0bPdq+IGu2tUbVID8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763757685; c=relaxed/simple;
	bh=CmmeSLsFKbFQZSkOqeVWsKGrurqZ3lvuMhrIbxz4sBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzgg7cpJQ93H1MJAuAEquyVVOfrk5DVDUC8hXpBtgEub/+UPO/6s0JB8Jk07WnJH0M1tstgp0fTTDJCQXJL9fGxWaD2KfFcXlCtCX+ua9tJStG5aTqd2W1aoxR0X0/sZS0rYUgohM28YkAOT9UPKVQDPVpQJ2A0mAApk+OgXwOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCnww/aK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hihycIHh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCnww/aK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hihycIHh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALGABf23676619
	for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 20:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ieNwCDZhu6Y4SfAYX5S3lcIt
	DLJrVAQaTfFSPrD3B1s=; b=cCnww/aK1AZe6kzrUMwy7jK4JxADM1yl5WJJQTGu
	EFd0cvohSsfexIzKE5dFGeGNY1Zfh8u5JgPLrghiYCvo72vNB2UIrk8lfoqtl0Qq
	P4idfouXm1tlBVvGZ88j0+d9/di9qA+tQnhAWmYczwMmXQlR8h8t0mvyMhOMfLma
	RKMGjxbH1RwTraUSWI5e4S2QA8wL17USpbE1yXLcp0FoGxuTvsi/1t+iQjgGN2Ch
	FgyOiXUNkhCLD9EHXzHPBwe2A75Dv83+eEyVEf83OgUiGd3m+wyV8OjDkD46ABXb
	AYJH6sSsk14/4GB2pvEgwS5xgMcgU7OVAcwBpHy+Ow8zzg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmyja6vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 20:41:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed69f9ce96so100909321cf.3
        for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 12:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763757682; x=1764362482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ieNwCDZhu6Y4SfAYX5S3lcItDLJrVAQaTfFSPrD3B1s=;
        b=hihycIHhfWiylTS/FZ6ZAeQoWmfWRGIfc2uaZ1NXowtjFCbVIc5EWyaa1cDnaVQO6J
         +egKrCTY0lQpbRDxynEWupd9jyJ2xGYuvJ/QzWM3pqW3x5AbdGjA2Bfu6CNCv9aIEnFJ
         vKma11cITWV4skc8MX/KjbyUdTfg8sfuT8vrYZj2mlegsaMFBG62gzFFHqQpGghff+S3
         vUcsV1cv3o8wjxCEDmpMfSFVT0Z0tLKJJ1cVrEAnrXzSbwDFUiCGrBH5FH/hx0g6zHvX
         8Q96C0/4vZZkKct+q3SgNmDikrAmAqd0Y9ELsYtY4IsGSLZeWP1R+kInB9tsgAiR3Iih
         P+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763757682; x=1764362482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieNwCDZhu6Y4SfAYX5S3lcItDLJrVAQaTfFSPrD3B1s=;
        b=SZIDxnJg5F1mlRe4KpRWuJ57vP76D1dCWDIZmr15pRcsL4hJsblbK/jIBP/r9T5ivY
         DFKDm318lF9mblTlMmjkkywSy1PxvQGMwKrcFx73SHRyvRdXj89s5HxOdb40UcQfu8YJ
         zljijsO4en3kcyw6I5xCm7YZBZVsvnCOTYAFfi/yzYzr4HEicmCCDovKmzGO6orDnStS
         1GF9KJWD22X8nZFbkP8Vunt91lPFlOrhjcChbTagVCH9E7mcRrd5KMGx8u+bxy/DWht9
         yv5iF6vLZQ1bj4SgibkwGzInz5lx9tHHQz2FvC+bKF+nIZJBKzUKBMJ8NNxwtATbvtqA
         +znA==
X-Forwarded-Encrypted: i=1; AJvYcCWs5Jtfqmnsxe1gWJJMSvVzId6mLVmYG2mKtS08bHMLQZtFglGskbptVMie59jS6GZGeOBSbgV+Gls=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/kM9gVGFFjwaH2PNw9Mzm5SMTPhm0ot7uucqa+kpOmMweI3Yj
	K0d5LA9w5W1g/sOtZjNph+TMIBUTSHCg2h07aM0cau2erYIbk0Kw2a+alLwVOOs33cFsNG43jSM
	wA8/xF1bHhlPPzyHYJtFlkgdRzGLiaR70K5jc0lklj6XkeR3tJnJyEYmHil9/6sA=
X-Gm-Gg: ASbGncuU16MxAK3IsYhYTE0pf58T3YGMhj48GqHYiMFQK9Uwdif1VBuCMgG9a3krXIL
	Tc3DkTrWSyykyWmmGEji+tJMvSz4oAU3/Zo1/Yryt1IJ8Q9cLcs21h0KtH8U83+o+ybXtOikOF4
	FV10ess/kBZqeybhry5kgITGTfjFSvG3K3nphGmOCn9i+rooor6Bkxu1Xx8xGuAN1/x7ZhPevgn
	qKSChMUvk2e2QuR60dJ1BRqwF7UrhMKsqYrPLcMtFycQ3dcZSuWhGxn7BxNypPVVFSPvYl5Dn3h
	s+euEWBtnDsl6fKzlE+UDLgHjGrmgdiFT3QHylf8fQrGe4C0guiAgdF+V/pMojW0B9WIa7wSg7i
	g9URUi7K3d7II0noMI6JtQZTMeqfJhIWHR5qjyqpGiT/SWDolD8Vy+G4kEL9BKG+HBnRspx0TFy
	7EBclZ/OOVJUKtSBOY5cn39zs=
X-Received: by 2002:ac8:7d91:0:b0:4ed:5f45:42bc with SMTP id d75a77b69052e-4ee58a5777fmr53734761cf.19.1763757681678;
        Fri, 21 Nov 2025 12:41:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqn8R8lGjlhJb4SJYHDZhpjmLvFJGX3Q/WRA+rLLeHvGKobFdmQcgTkow66H65qDcGebN/sg==
X-Received: by 2002:ac8:7d91:0:b0:4ed:5f45:42bc with SMTP id d75a77b69052e-4ee58a5777fmr53734441cf.19.1763757681271;
        Fri, 21 Nov 2025 12:41:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b48f7asm12478111fa.9.2025.11.21.12.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 12:41:19 -0800 (PST)
Date: Fri, 21 Nov 2025 22:41:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] clk: qcom: Add TCSR clock driver for Kaanapali
Message-ID: <sy7f445onhmuwm4fgislqki2f6tmxkfavajwvdmp55vowmeirs@ve23n4wocvtd>
References: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
 <20251121-gcc_kaanapali-v3-v3-2-89a594985a46@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-gcc_kaanapali-v3-v3-2-89a594985a46@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=6920ce72 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=25jd_95BLNFA_-C9sgkA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE1OCBTYWx0ZWRfX9vo2qRYSxV8C
 yH3243DY0tmsY5P3NQUXkotui9SUtLlKCyDUyTuZC5YpSZtnzIysW6RrjJkr0FwMdzAXF5pEnD4
 g9h6q/bgDTCxtaMzLs0RtYsomhZ14LfN45GJHB9DXieULRQ9bjroVf5aI/kRDnhrnXbUZhkSqZp
 Bn6MtmivETOwvm9ig7o79b3j/iFcWXb4akTtskf2D1+vkdwMLqq/i+zkCv/UxXyC4ECh/XD0x+1
 VjD891AtNRBJ4E/jRbuK6/XDYj56z/nRZIhVq/A61b3Z7J1LeLqeNaoAa2xSmGD3c64SZDgeu05
 lcP2Gj83jYfWWzG8HprE8dxfbm96Y/TlOz52xBlqaVk4YczuU31DejvT7bhF1vIbx5ohKdtNFb7
 k8M9azN1GqyhNN5W+EG2zug5KXetvQ==
X-Proofpoint-GUID: cbvEOyb3iwCaM17RFREN-MYbMCo5K3Ee
X-Proofpoint-ORIG-GUID: cbvEOyb3iwCaM17RFREN-MYbMCo5K3Ee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_06,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210158

On Fri, Nov 21, 2025 at 11:26:28PM +0530, Taniya Das wrote:
> Add the TCSR clock controller that provides the refclks on Kaanapali
> platform for PCIe, USB and UFS subsystems.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig            |   8 ++
>  drivers/clk/qcom/Makefile           |   1 +
>  drivers/clk/qcom/tcsrcc-kaanapali.c | 141 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 150 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
