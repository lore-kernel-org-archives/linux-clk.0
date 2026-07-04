Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9131A5B90
	for <linux-clk@vger.kernel.org>; Sat,  4 Jul 2026 00:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124654; cv=none; b=qqtvvmqSrJyqh0tTPRIvMAT8U+G2hL6H4zC3rjCq4rTqpoIzBWnlwy9aJLlmnb7FfAtJjNWyeOmD4zkGmw4bAYF/12jHSkhfZtW6deTKugTMEPA77lF3WkFJTpIQ/Vk9LEmoXqsL8jjx9QapJXPWPOc6SljjVa00aGIUpktQdbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124654; c=relaxed/simple;
	bh=Q8XLJVd31a4uqkHo70kNzZRqRedRGi5J3rgHb1sVHik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=erM0sCrwViwXYPmgWrzXBUTRAHt0j5Rv0fbkcR7FOEGUmcSFC0CpNgtebQUplxCbe7hsCXsMuvrUPvy/aztLa6mqD5gZYVWBWKF25BdtJaOR9UItvg8xPw49CP3jFmiEanAWUyyht+6L1gl0AiSVJfJQfElIbRgNXq3A2h2SAHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mnuz4L13; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FNdTXdzA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mnuz4L13";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FNdTXdzA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPZMP1019664
	for <linux-clk@vger.kernel.org>; Sat, 4 Jul 2026 00:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gPghQLxdklXsOaeUo28LNs4A
	s5M6v+8qzGSOyFIOr2g=; b=Mnuz4L131ip0X9LCSp5EOrMgvlOpNVwG/jCPeEYy
	geRG8JB5Vre37VsjEuFIsH5+Ccd7zuozj+nwSaiupWKRLxdz/2YdfZjXCSgqYovh
	Ly+DYYoVFF93p8CMHcBRD3UAxKKUBSg59MnwDVEcDEN28xfLIhbfrQeAE3EKKvUQ
	PD53jQY2pG+LKAbSZxrkw5/6BH9D9GsBidQ2b3nPGY2JUDo6ugjsLLStCkksSQsy
	BeZ1KwhDI6cft29phBT71qjB4uLQV9YIEwEu6HjIP600bV0Kjmoje8vVZIhfjhqI
	OBYO4MrOJa8PSRSW3cri9gmG6zkZvCmIBi5iSABHCiUF8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj254m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 04 Jul 2026 00:24:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92d1cae5740so117903985a.0
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 17:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124651; x=1783729451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gPghQLxdklXsOaeUo28LNs4As5M6v+8qzGSOyFIOr2g=;
        b=FNdTXdzAIdFGFoTlqsVdXB1Al1/2FjW5/gBNweFaV3XX+N7mc/kyZfozOkU5NTDqOD
         Ia2f7fVAwwMJMRkumur3kajtXnL0Yvpr/IO9m4XzfyJZH0xSfl7jSRSdhPbWIAIPsMTf
         m8nQERleZ83n2FC8DWPpQj5JOZWRL5G1UKCnLyK+DHDprzcVAQkQuP1DBuiVj2+OP+lQ
         kTvefQJKsIDKkSozRSdbMZwM1oR2478Dt7m7jRTcPop8LgWVH8dOff8ASbaWdhrxkVSE
         I2xvcffdV5eNLK9BWnNOjNlxnEvY5PslFIOwtjnY9Nyj/VybpIby3i+DSXnm6dV2qBYx
         FYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124651; x=1783729451;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPghQLxdklXsOaeUo28LNs4As5M6v+8qzGSOyFIOr2g=;
        b=Mc+Ug3faovFY1l8MDvgoCulXXvuI8LSjfzYWXoF0royNkb4SygTz+4T2BqsGLFsOc6
         CoQIemcmQVJd2iEujoAWTn0g8/37WxbQhSdXtfn5jPl85NP7HYCvxeOm/htVLoEtg+L/
         le+mHQX+tlMgGd+COlQ/a99wvus/u2P97gR3oV801DQeVDtXuRE+GuSOF4E9BqzicAc2
         aUU5EKyr9dothgH74Wwn1+R6//Egd0q+M0X8Anz7XzmUCXCiuxd0JW9wFK9SKRzLCqJv
         kdRtanqsEgzcprM3N4qt3GFLzAM3kJF6ttJEVAsbdJ+PTEHt1gSTFUKdz8hOXTQRlCr1
         RTJw==
X-Forwarded-Encrypted: i=1; AFNElJ+fK73Hg6wfYFmdkfPUSbkBhLodxu0aJEjaD/DZSd5myq4IzVZl7Cr9opFWte9b3AYJ0/B2Jgi8OCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdeIlzqv5qJFtRiLolA0q2I4jMrmaU30IiLNQ1eeW8MupH4ety
	hgD23YNos6TUugnMsinKVbwNuqegBhOaXnoIfJKuj0mSuxoSpa43Ppzn99KnWJUGTy51LC18toD
	S9EGL5Zt764CirUP6l8WNyE2xX3p3sobvmWXbsYIDHSy0A+AKZmP/xENJ5Q6QcO4=
X-Gm-Gg: AfdE7clJI8K1TcuFIQpm3/7IbRsrwcKXLNdnKCFBymJ2QQgbgW/wHOcjj+Sa1cGPUCR
	DU41N3HPBd4ken7Hdi+wlxORTzwLmdwo+1UmpTfiDJybRz8hbLOWIntGjNKOtyzk08GxDBrrFyj
	Yd2MtxryJwPDe+xYlNzRSS25tjZp3iXH0a+gf4XS3KzpkpJUP5AZ5VUy1NWQXGmLmUIuSQ++lh+
	91ML64kmMwLhu7gdPjBq4TFje/G8fJHya+my/k3fkoz3C9BlvFwFREZlZ2jHxLmvIFRkR0Dl6iF
	U73ezTLExEIx3flPefvMvY8nxjD8OZSyYee075kmd9316JOxlX8ibyp8nvzriJRgWgP0hJa8/P6
	prOzKZ37zR7QMbzb/DoivsDMmNkArPBHUvAAycpmJSvOu61+gRXv+yTey53+fN3JchpwiWz4+33
	ovpVZk1lG1BZMb/NXQGxSRsbon
X-Received: by 2002:a05:620a:4626:b0:92b:67e6:8ac9 with SMTP id af79cd13be357-92e9a52bdcfmr234718585a.67.1783124651278;
        Fri, 03 Jul 2026 17:24:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4626:b0:92b:67e6:8ac9 with SMTP id af79cd13be357-92e9a52bdcfmr234714185a.67.1783124650766;
        Fri, 03 Jul 2026 17:24:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbc6sm870438e87.41.2026.07.03.17.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:24:09 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:24:06 +0300
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
Subject: Re: [PATCH v5 18/19] arm64: dts: qcom: agatti: Add missing CX power
 domain to DISPCC
Message-ID: <4pbaiqofyb7jhujnftyog4idm3gu74kdwvrzod66zmtj4dbxa7@dovnrielmv3z>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-18-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-18-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfXzTYEy7XQuGmr
 VNWgRGUUDxN8CcCkuD1urvWrv92hYmXxU2QqVc19DQYzPMbODp3u41sVlI7yvwNk98br4w+TNyh
 fKRWRTP6G4XYldodHXat7NRWvb+Ybfg=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a4852ac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=QOFLiwY2CebeDMEKwNAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: snPOcjGOh7eiIO4YgdrNnY_SzOEryZSw
X-Proofpoint-GUID: snPOcjGOh7eiIO4YgdrNnY_SzOEryZSw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX2cXkcqfPe4S0
 mWwKz8h8zrQWCu3HIYsszTvaJpkiZ9uD2A5yzG0IwcXDAr02lSBBwJ4uGgpE2HVRibl7h6LYiIx
 tKTOkSi/A1IpVaIiWEs4fF+r6pOxaWqV6xUAigbcvX3MrYuLtNrhHamqRTm7vwch+Vvq1PQKu4X
 myxUZYbnXE7gcNoewO+6RQ98emU3Dg8m28GeIsUxBG6q5iyHSxsXtvcXxm8bx9p1LjsGXyvWNhY
 dv/2HpbIZoPnRGWGZEKRYJTO4UFKSHv+135SFXwylu7BLbEqvR+Ann4lyMFxDxOgYUZwgi68Mwo
 SiugqTGbXvXk5KLCtZ2GerXKva1Yar8lCITdNggbKs+57+gaT+3kOMehu31FwnUWJGGO15W3xnU
 GD9irshctl/XjoEbudaU4y4PZ9Nl8cEVV3EIe5GfnXWNAX3M49SDFsF16N9FMtqobiBQGmDMwBz
 yOd2F78zk5GVJTp/UZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040001

On Fri, Jul 03, 2026 at 12:01:40AM +0530, Imran Shaik wrote:
> Add the missing power-domains property to associate DISPCC with CX rail.
> This is to ensure the genpd performance state votes on GDSC the to get
> propagated to the CX rail and to avoid the rail under-voltage conditions.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
