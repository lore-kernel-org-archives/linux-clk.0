Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9BD233733
	for <linux-clk@vger.kernel.org>; Sat,  2 Aug 2025 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754139005; cv=none; b=kQms9T+iQfUdwA5xewDlMZQANtuUSSI2p5HRCBgh101N/OHSXhIu4xCkSRmFmsNCWq1M4tpQ/zmK70Bjtrr3pYOuFowngt8ThQ9sHFLfglHafa/9KeSsDF9axORr8v6ZescNGbLx33aQjXGMWKQ5t3/mT+gmLolr+WLM5krGe6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754139005; c=relaxed/simple;
	bh=DDMxBlOpeXigU7SdNlj4+9RZ77YTA2Gt3b2HP27L7dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRgRhZQNE+TGxHg7ZvtKC8yLpVG3G1tK+tmYmhW3yAOWpxvfdTtf6hoqt5qP+Cwk8ALUQjBcTUzoh0H1RZckGX1fN6fLQh8t0DSYqtywpt5QW+c3fL8xBnWVM4cI2oYRyYXLgqjIvW9bNgAsyXljNb5KL8GuRtLUbQNfcvKdXKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEWjyQz2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEWjyQz2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725gCV3004293
	for <linux-clk@vger.kernel.org>; Sat, 2 Aug 2025 12:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=shOOynL8Ccw5asfZKPoZ1X7+
	Lw+OuwsF+Sk8PffaCnU=; b=AEWjyQz2hvb5rWPynNineWgSEZK/fr1jF4IE+SL4
	z0gqtSCLUozdo4OnnS0C7mIqXPNpDCA8cfnv4otHy90lH/iLlYICv2KHev50N1lC
	gF8chnEef6WBTLezUB4Gwc8GAtLJHK32q+dNTRGRMOt/wWJxREh+GDG7zeh/NrPS
	KhHCfML0n+e7oc+AhPxpDk/d+2NJtnie+P7OoSqriQXvrI4u5QezcOGlkqW46Ymw
	vja6NQCtHdF1byJ1aGvgbkNCgRUtTWIyKPaexBvVujf+9UEgXs+CAwSX0Fd7cFFb
	MJHyV/DIqnd/s2wXGv7x+n0o6emUrHAiSyEGM47W9NR8Aw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489aw70s4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 02 Aug 2025 12:50:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af0100c03fso39228041cf.2
        for <linux-clk@vger.kernel.org>; Sat, 02 Aug 2025 05:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754139002; x=1754743802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shOOynL8Ccw5asfZKPoZ1X7+Lw+OuwsF+Sk8PffaCnU=;
        b=m/G4pQ1cwdqyzADRMNAlDckhguQuNmpCl12lQFhuEopS7XUzw+hadnMkzEm3Q15k11
         XoeQyjg2nlgqBW5l0iwzaoy4TwB6QzhtUP/tcofDvDfY6xnBndTM6AaZas2e/x47i5j9
         46Ojiouz5lnHEDYzdwYel7Yf2BNyaBuCxD4zI2kXWzH+06eQ8FXk4vZ5/F1n7vnA3LPF
         BpJ8e16429ymJA31ihB8Wge1OT+qEWGQzDgAxuo9qapp8zoVliTKA7WYOpaa9OZjAtxI
         yuaSG/AeWxeL2B3H6EIP0OtvAulQ3NLSLpDSTF+3Ek/FEYMnDmjUU7rz2LdZ9W0pAmNf
         EXXg==
X-Forwarded-Encrypted: i=1; AJvYcCV8CEjqF9jXvGd7j1aq7A397ICbauuoOEo28ek/sMls+cpWD2rT+BP2T4H4mUo5ROyaF0qHDqAbM6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqcNqjNS1YyU29D/0qJIA9g+Je8U7Vwni2Kz9a4F0aRKbwhB19
	seQEsXtNzSpMjVfCn1bwDUWv/ak1cVpJfO73R4EGowxijywMp6SL6VBoNmNbOD0rslQkTP3rf2w
	yoRKcMAisr7uCBhiPJ3R29WpZ1C6lgOJiwGMnUbANCM8Ut9xWQ73GKpiTyfxZRdSQ9sYW7I0=
X-Gm-Gg: ASbGncv6Y+EPui91zUfZTyzIJdKhSxab/KtCzR7wtriGSmXVru//wP2HPj4dZOzwaH+
	9g1zzqBtB86CDoxAncVvyCDqdDAOCfmkReupRfG7mZsvdvzA1m3WGfFD0vpG8QRY1PTNgSnczZB
	0J3a7O7OsCfemwN2Gs3wTFCTHoikyPircHUsQiMrHopBB61RAX9i2uTBrD8GjGbekL66mVzHMdv
	DPnLxdrJ2YlswvxL2wSYPileYKbDzgQj9NEdIU+qEs10w5AzXrx1CzAetiji5duJKLjCP/ufOzE
	enHTpEvWKdvkNDFy1NAI0E7drE/xs/+hDjKxluS65XB1x0BJG2Geb+v/r9baTcJu8Lv4JeEpRNW
	pUE7HEJl6NbERU3IFZizNxU4PKLUyspRe2aW+AX0UJnR7aDWN/XQz
X-Received: by 2002:a05:622a:1ba3:b0:4ab:3b66:55dd with SMTP id d75a77b69052e-4af1092f38cmr51204861cf.17.1754139001849;
        Sat, 02 Aug 2025 05:50:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkTUAPmdqW3GA3NPJwI8LqzCsK5Fu9z5hE49dbLUGEiD4djuJtZr6faz2CbncWbE7dsaBxlg==
X-Received: by 2002:a05:622a:1ba3:b0:4ab:3b66:55dd with SMTP id d75a77b69052e-4af1092f38cmr51204371cf.17.1754139001330;
        Sat, 02 Aug 2025 05:50:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88daec97sm975399e87.189.2025.08.02.05.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 05:50:00 -0700 (PDT)
Date: Sat, 2 Aug 2025 15:49:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: Remove double-space after assignment operator
Message-ID: <dnph3mrkujlutt3bqvahvby2fmmmyfzxk7ighvx5kqqfbbctuo@akernmcqntdb>
References: <20250802-topic-clk_qc_doublespace-v1-1-2cae59ba7d59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250802-topic-clk_qc_doublespace-v1-1-2cae59ba7d59@oss.qualcomm.com>
X-Proofpoint-GUID: 6LejzX_HWHCu6Ay9xuxigQE9RmQTUD7q
X-Proofpoint-ORIG-GUID: 6LejzX_HWHCu6Ay9xuxigQE9RmQTUD7q
X-Authority-Analysis: v=2.4 cv=MrZS63ae c=1 sm=1 tr=0 ts=688e097b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=wXdJWVuGbmjov8BqX20A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDEwNSBTYWx0ZWRfXy7CAoV1hWtzU
 pqYfkzkO4uoz33GUdXJfjdR43kro092lULX3WkCx6qmexKUj1l9+Kb0af04RXYJRHjfrtWbPpRk
 gkyNl8SSbuFi6Xyiw0W5CCDjQrC5zsrMQF8rcaTSeHJH+eEfpjpaR/MPAKi6luZLBgAi4vQXlc5
 ISIseZP4DAG2DNIMByt58ePSDlm6PQr6eKhzJhxHHm9pZktuStAb9YOQYPRococFW9qwOP0+Kil
 ITicOqpp0s2A0Ajix92QzJRpgBWMHB8Y2oAdZYZYwXE5QVGH/H9wO2ul6z6UCog8VYPdZUTRKd+
 vUfxV3gASmn9SvTKh1VdQmN4o33NNrnALbhxyF1elHgtK1PfzKBcijDtXOa+XMF73tpGTsfdvcm
 If06l3DKspEczXtq7ZfN8nkhGSIWU+EScyccx1BB/g1qm+LhBM9O0wsiVqBJPcz/RQYgMSmx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=928 priorityscore=1501
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508020105

On Sat, Aug 02, 2025 at 01:44:44PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This is an oddly common hiccup across clk/qcom.. Remove it in hopes to
> reduce spread through copy-paste.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/a7-pll.c              |  2 +-
>  drivers/clk/qcom/clk-alpha-pll.c       | 26 +++++++++++++-------------
>  drivers/clk/qcom/clk-rcg.c             |  2 +-
>  drivers/clk/qcom/clk-rcg2.c            |  8 ++++----
>  drivers/clk/qcom/clk-rpmh.c            |  6 +++---
>  drivers/clk/qcom/clk-smd-rpm.c         |  8 ++++----
>  drivers/clk/qcom/gcc-qcs404.c          |  2 +-
>  drivers/clk/qcom/gpucc-sa8775p.c       |  6 +++---
>  drivers/clk/qcom/gpucc-sc7180.c        |  2 +-
>  drivers/clk/qcom/gpucc-sm6350.c        |  4 ++--
>  drivers/clk/qcom/gpucc-sm8150.c        |  2 +-
>  drivers/clk/qcom/gpucc-sm8250.c        |  2 +-
>  drivers/clk/qcom/lpassaudiocc-sc7280.c |  4 ++--
>  drivers/clk/qcom/lpasscc-sc8280xp.c    |  4 ++--
>  drivers/clk/qcom/lpasscc-sm6115.c      |  2 +-
>  drivers/clk/qcom/lpasscorecc-sc7180.c  |  2 +-
>  drivers/clk/qcom/mmcc-sdm660.c         |  2 +-
>  drivers/clk/qcom/nsscc-ipq9574.c       |  2 +-
>  18 files changed, 43 insertions(+), 43 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
