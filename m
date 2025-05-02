Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A2A28F1
	for <linux-clk@vger.kernel.org>; Fri,  2 May 2025 22:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746225338; cv=none; b=ssHrkHyysCWG29Utex6xfDiOokij+Ld/C7rNVEH9HYIdoJR9dDt9jZ1MFVqm/IN0N4NY6/ua3KwtotrR2iHIYjlhQWkbocUtvZaMCvoi4V2DiP/R883L/oDbmTD8Cdl/ufpr6wAamWnjcR0a5yZYNXUpqF5V9E7QbAx3myUBUXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746225338; c=relaxed/simple;
	bh=HIvoANCYobIgEBaeF1o0L3N8Y/liT74RM47L1xXFkN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQMjktYwCgNx2Os0mBaSwgADTflXGkAvr0jdsRis3wmVco1tFxtq4m9wTpVH/cGiU0xDXlUnluPy3TvDRcWktbnIay4f1fuhuN07sEM+/RF7BeGmbIZohZ7fyexuPQ1JlnEjqCRtMTXVpjDQFy/K9oSl6y/m00VAdh+FwcjduHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bQ8JLnKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bQ8JLnKN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAnrt015703
	for <linux-clk@vger.kernel.org>; Fri, 2 May 2025 22:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SuCVsDN6g4TFy2W7M3iJ3Plk
	T8Xwqrsi5URWt0X1wqI=; b=bQ8JLnKNZEpvENFCL6angT79ippzHBQMcphYQ1va
	DY3KUzWc1BJbIMfVp1kqy4SdhEe/n+z5BS8DffimnnB+uGh5QIMsztMXGbz/d7H+
	P2TeZn23s6KCyTl0ExHijlsMe12COcBNSRH3BDygToDHUc7RT8VhLlp8sWrLB2wz
	0ZiCX15HoG1l+igrrqS36JLkcIqlB2IvnPIFN3RyTD/Zblhvr+hQmDvz6sMPFHZI
	+l0i2oUzLgp3xnHLzM1QBWWMtXIUwRRK0CjzkOFQwKUu/4NgF1y3x7AEfWQ1NVhs
	AyzgJ8bouC+Y1D8TA2GrU+BvvCzKoMzp0Nj2buVE9SIkuw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u79jgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 May 2025 22:35:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4769a1db721so65577001cf.3
        for <linux-clk@vger.kernel.org>; Fri, 02 May 2025 15:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746225327; x=1746830127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuCVsDN6g4TFy2W7M3iJ3PlkT8Xwqrsi5URWt0X1wqI=;
        b=QyHb08A1fcWnSC+bKYUivX2Jo7YoOy3atidxDYkGPlYYC/1lSK106HPMsUdqvhUHT4
         WSLm7uOH7x1DenG2sUPyCuun8YIxRaBKGleSZ7Q5rxE7W0vHeb5GfEZ9aRLawf7EUrnd
         HXOS5U7V2+PWAi39KPcwwKk1DM8fdWYgKX2FRcbuj8EiIOfN8DtUFeKMYzXMtToVCkq1
         mgIUok+fWMICISz8Uuc3TRSMxXYnxuex1bI9QAf8LVS+do+EpnmLZL0qt1zzoftxDqyR
         IExIS1r7a+eE9175uWcuEa5J93yq/057ZInkKVOA9trvgCjWE/km/0JdTgKte5sKXPJw
         nA1g==
X-Forwarded-Encrypted: i=1; AJvYcCUZtp7aQvJGpO9XUMl/g5HE3VpVj8R1E03EgRi7Lee1ykSolxbgbnz/euN7Cl62PFAOBiY8b1fz1V8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUgyTUwcga8kL55NjYFYOqcK9s2aY6bW5ScYxj7MYT+l+snqyt
	YaMRgPGQV+w4NyOJk7X8kaczAl7K6OKKo6OCffMaKLbSUUHyOnT28jVSzrpnGts/kywQNRGMbCC
	lyFrNL84APQDtdh+vKgoKJ7I0phKi92BG9J3a99KJ03Db+CAnB2dBwRzqgGY=
X-Gm-Gg: ASbGncsBjBL/iknUZB6diti2QJ1RZu3XCtcUlWh65JLaIYKCii7hrCQ3LWyEHz6GlQ+
	BdnpZ3r+bEIA9rU5qwD74/2y1VdJ+FSvs2e5ykGKGlhgZAwcRV4ENEHIL6HTLmiKSgIj8mH6o/8
	XKVJx4jQcUavsYfXrmKXIUOu2MTu8Pq9ue0s9taPJCBlWRkTglEXK6dvnH+bvqxxTOKhGZc43wp
	rhQW5q7bSp3ykzAXBqnRNPkml4Kf/eeJ1T1yIrQv4kTdqYjP/zXvG/XTskL1yE38Luu1SsAg4L+
	3chKOy+fAy0eAgdKwR6umkCjMatvs70/IINLEwQLbndidzmvpO84E5OGR0Q24izEasuUgU9DiwY
	=
X-Received: by 2002:a05:622a:5516:b0:47a:fb28:8ef0 with SMTP id d75a77b69052e-48c31a23f65mr71764431cf.29.1746225326988;
        Fri, 02 May 2025 15:35:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCBMAjKkyCR6eC9CmEoV6+y+5w+kEc9kjQxO9VMh2wrtzgWX679IWlyC5ahNpaQha1KzNuUw==
X-Received: by 2002:a05:622a:5516:b0:47a:fb28:8ef0 with SMTP id d75a77b69052e-48c31a23f65mr71763981cf.29.1746225326656;
        Fri, 02 May 2025 15:35:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202901770csm4948771fa.37.2025.05.02.15.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:35:25 -0700 (PDT)
Date: Sat, 3 May 2025 01:35:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v2 3/4] clk: qcom: camcc-sc8180x: Add SC8180X camera
 clock controller driver
Message-ID: <xyvuctx5w2cr6pi2ddjd5m5xqnirloflwkewpg2bcfn2neipe3@mzkis6iklj7o>
References: <20250430-sc8180x-camcc-support-v2-0-6bbb514f467c@quicinc.com>
 <20250430-sc8180x-camcc-support-v2-3-6bbb514f467c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-sc8180x-camcc-support-v2-3-6bbb514f467c@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NSBTYWx0ZWRfXxMb2KhKBryoT nGrEJzzYBIp4sTlKrKMxDcBOlI5aLTTSxgAqRmpKWvKfLkl3f8dIwJ582AEWISm18tIzvNMmAaC POyr4pNKyzicrai9GArDa6boYePvoYm9Ap2/hb8/Pi27hxPSKaEMZe6AtxDshvvNILxf+cyE+cI
 xrOjkkuxJvrAgUDWp7Py6ZJ3i7ZyQAIcVjbIdwXYgQIzS+iHo3oZ4cc4yygzeFWFX+W0lIjv/dF in+/8JhJ/scR9cdzZBhTdzvxuKrD2eCggXgpSrLY/YpyxByZhGSVK1iQy9JGY86oQ1vbGMwve3m 98OOH2Lw+oy8AERjB/ealEMsjNSUB9BPSFYwkLbezEv2iXFc1tmszd0f/lPdjIzPLEZZu5u9uR9
 th7UgChBN01JCSSninyfW75TQMtRDAeQg/0CuQba+NyreSE8iH46wD05Y49tpZQqyJkv9mvd
X-Proofpoint-GUID: ciB1wcD4WLxxCXnnwdDQqqKMXMTNC-RT
X-Proofpoint-ORIG-GUID: ciB1wcD4WLxxCXnnwdDQqqKMXMTNC-RT
X-Authority-Analysis: v=2.4 cv=b6Wy4sGx c=1 sm=1 tr=0 ts=681548b7 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=XyGygVz_FukL3ZPvZxcA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=829 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020185

On Wed, Apr 30, 2025 at 04:08:57PM +0530, Satya Priya Kakitapalli wrote:
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on SC8180X platform.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---

Would it make sense to merge this driver with the camcc-sm8150.c? It
seems that the blocks are pretty similar.

>  drivers/clk/qcom/Kconfig         |   10 +
>  drivers/clk/qcom/Makefile        |    1 +
>  drivers/clk/qcom/camcc-sc8180x.c | 2897 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2908 insertions(+)
> 

-- 
With best wishes
Dmitry
