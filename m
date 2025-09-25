Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712B22D0606
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 21:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758835596; cv=none; b=XDwd8d5v2jw07+0JxJt+SoCR+3ZNWf/amDXYmO39G+0ujZ3LMkgN97q85Ueo2U3PpngnIXI3gM2w9ko1cLrykl8QHj2rzSDEh1P+SOQRK4ldIj3BQ2EMfIYxZPigDpor9Tmkp151SZbPcvuKSVRj21s5OirOuMIwBUDdYUXVbFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758835596; c=relaxed/simple;
	bh=k0yjSh2ANN6eecUIqxnDtUriloBzJfvWyMx9nup5pZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPuLUlQxjNhiw2URl9EPSGqCUpJlZQuRRwRssMD7mxX/4HZjprT5toF2hH51sfmh5iETQfNb8zO12E5LsSJ9oZrjJ56ciqDkdgs3KTwbT6GIcL2Z5wJi8nO23VsNyGhPry2onSDAlMlQC81rUXWYgqIHtKpuxitMrjJsd/U/72Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rdh4RSoD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rdh4RSoD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPd07027596
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 21:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LNofiBLmX+3scjm7ESiysXbi
	J9+y7g4bNVHA/dL9wFo=; b=Rdh4RSoDuySpRfTy9imujpPKVMr0+/f+/vjmsEVf
	HnrhSNPCiLvE7k7sHTljl1qX1Ey0TxQtJzc23QhRNgWDhP5E99JRwsABIwiM8pBk
	I98IAZbXKeZocyZhWmK+T0vtFsDQYHW5VIdR08MtvzuSZ99n3e0zdkxSC8LPfCWd
	2Na39j9GFgmtb4EnJjmRgUMJT5TS0oN/d+78RRAJ74kRKvqca2hW8SSfI/iFvqrr
	3J8gjDySCXfCF+kjFHFH4iYjfGYdNraazRCvt3BnjNHp4EeH15clO7DDtN3B1eNC
	vCDvs3pufEoSfTWpO+0SjMVjEF1O34DvM1fga4mP6prMXA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q0egs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 21:26:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b633847b94so34244031cf.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 14:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758835593; x=1759440393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNofiBLmX+3scjm7ESiysXbiJ9+y7g4bNVHA/dL9wFo=;
        b=vvyjm/HjD2bm6ix4Z6MKw/48btp5KpvksRhN+4SfNdJNWpSLMe5zlKm+rQ+4yQO6ue
         +wRw90VJ/1GMLD7Q1AZnowaHU0ajWWdkH1gFBg0q6y2k4nX5ssks+Ax/+ES2HcAA0ERn
         KFeMrCH8orJqHvAU8IJEtKDNlb9SY8iRtKhcA+7ADIIFAA3YpkntH9ACmNfN/00wGK8s
         NVHG/CAMKfvvIBe6u0HU7yVwuzrIlOWgdyUhBBcidzAcUOnYbVZJxTqLpEdZgCo89Fs6
         BxYmg6oAHChrjhEmxuWLJifpT6DYumoNpw5HIbzWCNQmeW4iPUpRM5LW574mdSVp6DUE
         TzcA==
X-Forwarded-Encrypted: i=1; AJvYcCXeUm+uO+ijV3pOo/WfqB3vfJWBsmNx4szJs4Nt4rSxOcUF2I9WR37xw0AEBQFHBO8/iCeajmPYQx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwGo6fceCKRpKmd0w85Cn77afvYGomm8n0jmdUjq+PjiRnuXoI
	TdZ0B9TQdeVFK5X+54z3CMMA51+i3HNYJlJpfETG7715JXP+/AC8B2VnL4m0iJrnBVlfuuIC1kd
	mCvJ7spSSbB2xYRguCyvDFVgSXxforkyIRKQh3q5aDQHbbu1X1Tecx8XIcVjm/4Y=
X-Gm-Gg: ASbGncu8Z/f0zDFh3l3uL3cOjorI738m/KXnZQegqU9xwSNWhXGgosy2j9tsIaREXPs
	2GlU9/7RpldZEUklRevY6SsK7olkCwaq+KIn13tOi6vROrCmCA7PquoGbb1blPjX53BxL6sy/F5
	lCQdbur7NCAV+NMOi5Xj/1sejgxQSIO8SCZ2Ttlzj0x6V5oJRQG2KLxKRu5opjQybPFyfcwPq9V
	3rm/nfxFYrgI/5tMfMo6sV4iIYujYk92mcP7zrwH/LlcRE77AhBpjIFBh2MjC4HpdsDP9EPD0Y6
	raCP4k8dw2oFMEj+zqt1D1C0rMQHKztOT4a4B73LaN4xv4ZldMh7Gnuod7GAinSVYZUCWYMhHvF
	IwaxkuwRfGZrerInl0wPekWgJM7gjcixjg+WiEyadNFNUd/z00DTf
X-Received: by 2002:a05:622a:14:b0:4cd:fa3d:9c0a with SMTP id d75a77b69052e-4da4c39d3b2mr69916621cf.63.1758835593365;
        Thu, 25 Sep 2025 14:26:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJSdxhuD1dfzzIzvxJqoo52XPqJp9hoPrRGGFcB4BT/HealsuaBlfh5g8fOW/NRvXrmYui7w==
X-Received: by 2002:a05:622a:14:b0:4cd:fa3d:9c0a with SMTP id d75a77b69052e-4da4c39d3b2mr69916241cf.63.1758835592884;
        Thu, 25 Sep 2025 14:26:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139fb60esm1142055e87.47.2025.09.25.14.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:26:31 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:26:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 6/9] clk: qcom: Add support for Global clock controller
 on Kaanapali
Message-ID: <jfcnilahauqhinz7mlsyjcqpovy2bspithahhotqayfxjqbtlp@fzkqchygd5hd>
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
 <20250924-knp-clk-v1-6-29b02b818782@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-clk-v1-6-29b02b818782@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX1IrmDzr3yoSk
 NH2dPrSYd3Y9XSkrKTTOaqq+Gfj0gXEtU7vIGd47rsTGz1MOGgiKTWEHSP3cAThYTBsV+4poQJt
 lKgSjRvpHKsCnFIo6dUamD0yE085VpAkN7JXwrDZlegrp2JPbOFzIV3QCYZcH7bE4BbDUOPkWvA
 8f8EroSUut0a+vDq6xzd3WErsVtCZCUA7ji4BnULVjSYFIu3EkE9Gn46jtNKH8IF6Y0XDbDIr1A
 lXfY8EJyyoSFP5Ris6vTfgUc1tiQbyqmYmCtXkuha71Wu0V9MKefHBUHs3LtZBI/qKzTO3eNzIw
 sSVcfhuEldaqbhyQMhdEvFw5x0wThz5gvVexslpS29JUX7sy5qGzWjO/vUrhNX87apoiD0O/6Mm
 HYeY2vh4hXU6kM6RLyn0Bj0984WYfA==
X-Proofpoint-GUID: J0RnRfuy0ZsNUAQV78Zz2CU0NYx2xQZG
X-Proofpoint-ORIG-GUID: J0RnRfuy0ZsNUAQV78Zz2CU0NYx2xQZG
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d5b38a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=F7eGajQwVCTwq7oO_cwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Wed, Sep 24, 2025 at 03:58:58PM -0700, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add support for Global clock controller for Kaanapali Qualcomm SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |    9 +
>  drivers/clk/qcom/Makefile        |    1 +
>  drivers/clk/qcom/gcc-kaanapali.c | 3541 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 3551 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
