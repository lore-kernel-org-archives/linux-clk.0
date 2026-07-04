Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8504317D2
	for <linux-clk@vger.kernel.org>; Sat,  4 Jul 2026 00:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124388; cv=none; b=fu0GeOU7hq17813+Yl5W3wEpFskD/L07I4KYlbtLFl6FlepeeOidPP/jook/Yyz6FhS4jx0xhiKjJ6t1B63Z4KryPDwEVRwBDVQmGjGMYsdbu5QULPlLv8T+KtXBNYG0lAUc6mDA97FqwQM/85gxups1Y/7Rmf611O1jP2Z5dqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124388; c=relaxed/simple;
	bh=FkkpdWAUNraBzi5dASDQ+g+cQTyV0v51VYQVWLrqPPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VRDk/rwCXv9DJxXwkKZPAR9g6B5biuGcO3ij4rbjuzwFcGCwLfcW2NtAZNGi0lQE8GU+wHe1iKvn2ddBcVGCNT8tB+2Ko5O/nINCzzdT2Pa+5HHUy6Pl4ts2fhCFy4qAX3dkg8hAkmH1bA/J98MADtY60RB7iSpVoZiLzH1fyQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pu3uGO+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UrnWi+mZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pu3uGO+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UrnWi+mZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPrAs1031312
	for <linux-clk@vger.kernel.org>; Sat, 4 Jul 2026 00:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jsHH6Scg4UFpqoXTrp/Kx37w
	2IUpCuCyL6VPotB9fko=; b=pu3uGO+jEWzmn8T02xYDZ9lWq6CTktfPa0RpjlEN
	9ST71WrcrXSofMs7IXSquKebgHfa3vHcimoClhdO1I0bwLN9uVyVeOT0gs8jeS3O
	dOugmxHL436/wAlExJLqcOSG1imLSk5rL8C+jnloxbRdhk4+D9X9vsH68M5DEJWI
	lS5iI5FP2v3Jy6Ln1pCvJIW6m72UwfinyfhUMPRFMaBDIe1uphV+GOaeKvoX52Dc
	kuFADmgSav9oHGLUqLk3w+iwyJWwIxPAXdX+44YBtGV+rf9/r24VTscdlTHZ3lYG
	7vC0ebtF6x8+8aWa1FhyjlqE9OKaHwz6H8GgAWUbKHHOyw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5cauy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 04 Jul 2026 00:19:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so11740996d6.2
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 17:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124386; x=1783729186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jsHH6Scg4UFpqoXTrp/Kx37w2IUpCuCyL6VPotB9fko=;
        b=UrnWi+mZh4y8nr5RGq1l9hvuNxDWbW31++/hzhYlSW+C/GuaXsImrefXS6ek45UfkT
         CLTHqeBIVt/ao0uWa/y5nW7ZLwdPwYPYqMhGY1uTzMTDLzDlCsaFbBYcXpNvMn/xsjPw
         aT731EYBmQPoeR7fALo9BF43rG0odIbQdcpjfxXpty4ljx81wgc6nzEUNvmzSdnzcGm6
         gEtmSN7SRMdoeiJJA/tfrtnwpVi3aNdTAgR/ogvhNGzEh3mzAipwy7qooasICVtEnZsy
         MjFiVNcrWygfvgEAkGJX0Rbg3ZBiX5G6c1n2EIv9FlKF95qL7cmb8GtScrBHY3fqbjdK
         xfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124386; x=1783729186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsHH6Scg4UFpqoXTrp/Kx37w2IUpCuCyL6VPotB9fko=;
        b=V9aFScpke21dTgM6U3+8PS/4fKBeM2z4ezW/kgMh+yee/A40moVpi3XTyzIpvou5uF
         PxWQOiFNcvAcQDeUJtGNs54LtrhyvzHVD09hsd01Cfhe27j5AXeKO3YZK2khOgqczu9m
         9Wsbc4m/cmfef0ODUfbITzENvfZkKV3puFpuiL8YgLYNCCgqC+dd177jh6JV2eWaaZLW
         MAVNiAUCCHQBbdc+ANHdqmG/HvjXb7VZdN8lt+eLGMDLj5TyuCgqm4mIQIYY7TXZcAp0
         6UTkJ/VUzHMDTs9c3XfolNBQsxz4jxRVMf6qbm36P/SrG8nvsJLBdvnQVZ3XCTZxdkZr
         ineA==
X-Forwarded-Encrypted: i=1; AHgh+RrPZkIULdojwZk97MNj2wiOWMMcw0q/5Hoy5SiMWPr5okF9c3yNvPjsttuGmg0yyc7rS1WlUllqkSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOa22cVC0eDcnY3AS8N39OXupYOCABZLVfYZzYsFY6aeNFL9XG
	LO6d0qUyD7qg41i4PjWOBJPjd18e//b/kgPIQPMAuyH4O1cakDPcVr1EeS1yXCAlSWY7OC3zCe8
	tlngdSSdIHX9u0YaZ3s8i5JYCV5tW/Ml9KCDRymq575/C0CV/2ECOEASCvVAXYd8=
X-Gm-Gg: AfdE7clAakqZxkiSbIsjXVu1Z+rfRFN0UVbh0GxH5bjGawnf2cBB0UYa6FVgxtYwUbk
	sH8AxwPjpkxPcHNCOR+aDaLCKocDRQt7l/soYgLvD9gD5I0bNmC8BC3Zptl1Ye+8BEpaoXLLL9Z
	r8jccJbKcB7ifvHZontyX+WOWUyFESx5vJfd3MRGwxzqtwMhdn8OQOF7hoBc7gWdfU/tkAjGQth
	z+uKTg+CBEgIbcZt2b+MhJE3StCdsqHLdnFONMIumsqSCpw4VNSTsUn9Dn0clFsPhVVsq+60iMt
	PadrL941X92No9BvN9WXI7S779BYD7HyvGKBekyHtMV9C0/V82Wo7sLou4hrPNIpkwusdy0V9Md
	k/73YdZUEWeE5vLnQ/Fble0EpxI3zTHIgqgRG+h+IWFKCs6EMuZBSBNHso4sFH8l/gd9/ArHK5r
	3f6XZXXfINN22bzuFRebTIgElJ
X-Received: by 2002:a05:6214:459d:b0:8f0:9d9c:52c2 with SMTP id 6a1803df08f44-8f74997c5f1mr21234266d6.5.1783124385802;
        Fri, 03 Jul 2026 17:19:45 -0700 (PDT)
X-Received: by 2002:a05:6214:459d:b0:8f0:9d9c:52c2 with SMTP id 6a1803df08f44-8f74997c5f1mr21233776d6.5.1783124385251;
        Fri, 03 Jul 2026 17:19:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb7dbsm864403e87.45.2026.07.03.17.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:19:42 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:19:39 +0300
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
Subject: Re: [PATCH v5 12/19] clk: qcom: gpucc-qcm2290: Drop pm_clk handling
Message-ID: <yetssi6x6buxvjeanwqiigtclvr26djkm5j7kw4cdqsa5k7iol@ygnl5723bjvb>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-12-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-12-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfXyFrLOo1Ei9eX
 DqRUw4pTtzd16kdJhk8ybRrhcqq2eRcQeqm71yXHvp+eK0QiIH9kHfoVZl5DXcbMYOLe7HVIAJd
 wJpY0EwkWGANY55zkixsa558vCxYpHk=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a4851a2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=slVkNxoZvn7uzNb-wxkA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: w5eA3Xo3_LWTkzUXxOwyGoqPwNYiOwiA
X-Proofpoint-GUID: w5eA3Xo3_LWTkzUXxOwyGoqPwNYiOwiA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX1Wnz2i0eru0O
 4RZaK5LNO3diezgrJU47IZ1ZDZAHVCpYKhtxGZrg7VOaLe3WsiomQn3/4mj9AckauzF1dMF/VkX
 1+gI6KUPo95lgrbN2ag5riwUcKcLl0X7UwVHNAzf2gW+Ylw7Eq0LPpqD5uUD9WLFgZa/ewMFVQX
 1FFMlJaZ5ir2f3l5SMACyepzWjGzlo46rsXI/v5HG2ZR9tCuQXoDTIZfYSYq3t1/w5iWkTvnqkl
 HFgaJYllqIHEaHnuNyHjbFBpuL+5XbAyGYlY45ZHFwO2mrP1bMRhuT7mqjxJQiY6FbCsBTh1y22
 tGXBsO4h7EF4l1HIhQ0Fd3NJNNHdSIUwPAnrM9iZuOfdX+ys/vGIrkN//G8tAW5KMh/2pJyzkok
 HcqwlaqLFMj/xP2T0qACp18zzWSkU5LHQ4Bnd6NMHdDewZhF+Flf4RE605fXorvqw3BW9terVxT
 XxnT6vk3ipNBpWKBZNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607040001

On Fri, Jul 03, 2026 at 12:01:34AM +0530, Imran Shaik wrote:
> Drop the pm_clk handling from QCM2290 GPUCC driver as the required GCC AHB
> clocks are kept always enabled by the GCC driver during probe.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
