Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B161F63D9
	for <linux-clk@vger.kernel.org>; Sat,  4 Jul 2026 00:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124475; cv=none; b=MKi8Vn35IzZ0IUpUL31UEAeh+gWzLFsYGD+5mc29qtWDX14lutR/DE56a3i/axBk9ZplbvzyqUZNyd4vlJcYvfqG43lgJrohcqk1Ig/JTefQTUFRkuIn5JRdQYPXDmXCeFDxuhh+sNU3uGVIvpUsihLwIb5VmeWqYN+EQDsgHWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124475; c=relaxed/simple;
	bh=OkBZtEQrFq9mYM8uJFu4I9I3b9DddqlnSjpwJ6+aags=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHwTrqlTAM5gZl+fwFzqFE2jb8ceavtyf/aZ/ZDNmfA7viDoxdQqzdEFPD5f/z73iACjtuYYM2T4oooD079JPdnvfcS0TyhfhXBzD9hEi/bmu+ezOOkmXugT2dH+nD3GNOsjft5WMQu+IermSHBnaQROvNgjcR1ANul6A1p6M3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNBGEHVN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=icNq5PrJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNBGEHVN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="icNq5PrJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPYbc1021495
	for <linux-clk@vger.kernel.org>; Sat, 4 Jul 2026 00:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KecK7PxPE3CXCxkRqv9TgBWx
	1h6mEwwz36ausN+cJqA=; b=dNBGEHVNuU4eLELy7Mt+tty3ancPewilp4rMayOQ
	HTbrzr7RhHf4S2gUZED0QI0ota+O3JfPtBkOsiPmfUJ4uL1dpImzDEnjYgwuLYFC
	rcFxIYeFlFKapoHFA7lKqpOWjYJuJjstxOo0mEsRzFXq5evIXRZOop54FaKbYZ/0
	V8xIXnig+jfV9qUa6EhVmy/qjGRw98oJeabG+oXzqwS6NXeTvsYSv7nOFhUcflJe
	XsW3w8P3Ch389+PwvfIkpQswFoUTvgmXt+kIUI9iWC1OBEKWKQ4xxQbWxL5809cL
	z1hHkkxLMyH2aO2sxerKpMX33dYm5+PK2l/Sa7FKMvI6BA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u33548-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 04 Jul 2026 00:21:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915c364ae3bso88127185a.0
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 17:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124471; x=1783729271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KecK7PxPE3CXCxkRqv9TgBWx1h6mEwwz36ausN+cJqA=;
        b=icNq5PrJWo8wd3LgMgGev76PoQz8UYxLvNcWVps6qmPc/XgsHEQzRq8C/jNwSE3McS
         IFsZTb9iyw5BoA4QDRsCFAY21vNdE1ilROuTqqks7iiz2/P3YrWe5z9RcjLn0CAm78Uh
         qx8ocKxw5HZaMl3d8UKa/rTVzIagqM54XUmcvsgM/0UsOV8WRmVfxpaEX/7UZX/LfiHM
         1JtGB2yIaMUvArZ5R5F6RFTmFeNePtPprhM7Lmfxut+776jsXyU3H6Uen9DQmdXE6wj+
         C7ufv73kmQv9Bt88Y5SZDMruEj6aPAgYukCZt5/IUAy4oGKapZI8bxnxFUsPl65Q6wQK
         hq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124471; x=1783729271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KecK7PxPE3CXCxkRqv9TgBWx1h6mEwwz36ausN+cJqA=;
        b=mtkKm+su7Hhrds8yhWzwZ2+5kDOK+hX8iU+0OE+zsI9rhHp5N87+W0fcPuccadTUM1
         WzTGb2OvyZwH5LgiMg2SIGbXrrMr5jNUzgX15Snj+fWIjj07ruSGY5wn2rIkx8hlviFo
         Sf8cjY2O0fo9HvnkImFit3GLAl7lw1bJimJfL5mnEXTRBjXxQzJmwpDhdHkgPMzR55Ru
         HNMPQcSRkHszX+fU0g91zc6SetORFkh/wjcNYbI9IMX3/pRvwvBnhgDgySa01V1GwaKI
         akVRUCUuxg5Ie1wMTE3qPakBVEHxvPvCM8ju9B9StaoyWVBT6kiby5XQVrokdP68PJnW
         wT5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8pJxA0x0oWzl2xsrnVxMs+XrVNqglWqn7fLwh3eOdtyh7akPR26JN9mHEX3GNNvtr/uVwSU8lpZtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzocmkug6L3YqrN+evnZ4IsLYzJP8ezuTZgR6S/Nj5dO2T72+Pz
	vlfTZN7cWlk456M+vEA8ffO1J394m4V53TvuOSTCD4Mh9jrcLiNiQSbqqa+ZzHyElffoins2vAy
	b1MWWJl396+6kvoeBsSbohG+DBT3KZR7IS8RvIhDle5bUzn1dm/YbeyE2SfOtGZk=
X-Gm-Gg: AfdE7cl70cnnSJsghEOpJi/z304Li7rb30YzsPIODDhw3lqa4UU0NvdWpJq2V5pEvs0
	5yZ22x64Bf9Hk87hrc0Qh3FAqROyT/L6urz79/dJFHsjt4lt7zfldZUnQhEDfwrZZkhjzhJPEWJ
	hjHb6QM01vEqFykkbz8I37JpSMdC47MozecflIcnzMqdHIqHxMaomTN26l76EjTOb6wbMg2q4Gb
	McEcpi9p4Hx2rFNWAcSDoQuatuyGJ64zvNGGyjd7ZoGeb30cJXW7RpED9sqR2rGPrx7tKRWSQGZ
	RYArXqOxj/LwFAe6CdBHsnlTIsGV8mUuX2XHGc42amCUH6xGp3b2h5yuWPm2V+70oEGDLEMr4bc
	1EFe3PrQNBmy1bKAMUPRcVokOEx+VN+HtnwoKfGW8QbX7o4lvIdWCqdH1GySA4Wmae+jLbt6sCQ
	4Zpy1iwphJEyiRY2VjovTIjVNj
X-Received: by 2002:a05:620a:2620:b0:92e:61f1:6b72 with SMTP id af79cd13be357-92e9a3467f8mr236923685a.13.1783124470710;
        Fri, 03 Jul 2026 17:21:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2620:b0:92e:61f1:6b72 with SMTP id af79cd13be357-92e9a3467f8mr236920685a.13.1783124470249;
        Fri, 03 Jul 2026 17:21:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb4a6sm848643e87.38.2026.07.03.17.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:21:07 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:21:05 +0300
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
Subject: Re: [PATCH v5 14/19] clk: qcom: gpucc-qcm2290: Keep the critical
 clocks always-on from probe
Message-ID: <ko4cwdgbjoqo73vljlplsfeohe77qkxp4zj4xthtsefddlzi3v@rp35hvxwz3t6>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-14-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-14-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-GUID: ejCm2MlaoDkt1pLTL0yxEImy-77T2v6i
X-Proofpoint-ORIG-GUID: ejCm2MlaoDkt1pLTL0yxEImy-77T2v6i
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfXxF5nHZAa1hgP
 koEHbQTNN2Ruu4R1t2AXQSPvfhsedEOXqkd/zGd1o2K37lgAm4ZfU4lb/WuRhSoFdqEZFt9SEfI
 2zYydxyhQnPvXZobBEqlDg4svvzRoKI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfXxW1fOYhbQnh1
 UcMHmC/2+TN477CdiRdwwDM/H+cjHtWVhYVwfd+XGJ1lHWpPD68eO6Zf9xCRNUc10VucjjL2XCp
 iAIXxLhta6A51O1yNWy73yhdEp9MDXzCLJv6hQhHDVk/YjBdJfoMn7pYn71xPa0724HYy3zW8Ok
 rbXTXZKu+pPBWCrWOYfHFi7CXF7ZI8t1NiuPh3C37x/kjx5owsi853lRBwgYJ1YOijq+HNPEp79
 UVTNANGtKnAg2Dnyi1xhFdr2OzS651jKvS2/aHRbviVCj8Htm/vLtVsGYU1zQL4yB7Zjqeuu4kL
 rYjL1I7jiwf8EeLcxvcyz88SMoIeVMrvDvdwxK8q8gVIUvt9Xbgki1DJ5kgXbM5DC2i3DXUdOlG
 JK8R7eQlcCDMHHsvEz7ZuzHj2WlUXJ467wjrTKZ/0XJHxRPu9ToB9TK4Acv7OCaZhjMxtbyazOB
 jqMOJN0URZa/US53AaA==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a4851f7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=GABpISGgAy3S5f3vv6IA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607040001

On Fri, Jul 03, 2026 at 12:01:36AM +0530, Imran Shaik wrote:
> Drop modelling of gpu_cc_ahb_clk and keep it always enabled from probe
> similar to other critical clocks, since marking it as CLK_IS_CRITICAL
> causes the clock framework to invoke clk_pm_runtime_get() during prepare,
> which prevents the associated power domains from collapsing.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
