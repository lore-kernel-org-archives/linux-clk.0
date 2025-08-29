Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139C02609E3
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 08:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756455354; cv=none; b=MiOgwx07huBiS+MQtHaVlDBJRTFdNeOp0/DuqbugW8JPd2wKWi6cAbSsHGjmCWmeuFWgtlR2omwrvApb3GHBlH7nNBGDY5mDvtq5LTcTBQtAqmQhf6NpRxAvYxw7BGjW41nMgnA35OYHEK9lQLeY5W02RWIHJu2FmvR4P6ezvpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756455354; c=relaxed/simple;
	bh=JrE8rTg0mogycbu6/gTDLoIOWx412mSSUvbfqKnx000=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gp6mrMHAfAsCWTj+MbN6fKzS+7JTeAZeDc1pVNybmXpWTKl8fcd3HTP9LJ0+Iu7iBWUUbojLjONZDlb0c/SfqlYb7hAzVBHm2oBVCjFY6yp1G8a5pnolQNGaCBpM2slBJxha/CsgW5NPTd42kxKWsujI9K2B6/87787gGVuK/wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTCnqjY7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cTCnqjY7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T85Kpe001956
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 08:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Sa6+BmSTVQ/SHN0N7L2jpZkX
	/bOZEoJbiAzVVSiaj4s=; b=cTCnqjY7nC+ZxpkGS4jhKDvVTEK6XsdAfqh+Wlcc
	rBzSon9ls8YXlvBQ10LRW6K28X1cnX1495nuMsRSEkNbqaO3pASLIvg4iXnL9WAL
	fCz6u6dug1iNEPA9xEajnXByJ59WvNd+Be62g0mcDimjP8tsu9K79RnpAwtrW9yE
	y2eNT6ySM2o2bkbmDqDTSMUPb/MZzSxwog5uZM921EWSrvT6pp6prPbNNxJlu9HI
	4TmjKJq9YDFvIvFQR0qp6dvmD6OZmshsYYROpOd13fDa8KGxAZOhJmbsDmdGlDUV
	Eb9hpfIHhcDu5iVXe+SIqxeLHlg+cNp8jyz6cPTaSZS1CA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se1728te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 08:15:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b2ecb8e64bso23698991cf.1
        for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 01:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756455351; x=1757060151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sa6+BmSTVQ/SHN0N7L2jpZkX/bOZEoJbiAzVVSiaj4s=;
        b=hAvmF0r+Wi5Hx+N63TodxIhNq/pl4UTCOM9Zij7fbExsYPqj2SV9rlgT3Ocd9j7kxp
         hU0vSnAaRX9MVpO7dvUuX+UEH1eQftEynOG2JWOQ3XYM218J3dsezmgC8wcgd2xqjfqy
         lynI0kupiHr+64/EGlmU7GHran4IOb8sdYsb5u5kTPms6Dx6q3Z1YmgW0f41c258ivCK
         /mia4Ip4KeISY57SPhyk5GTzt2O4R3AAuRUMrDc07wU/onBfuLsqY2y1tkpjmgdxiJy/
         6O2BT+99ykNs20xSyhA3tffWJgumEqkFwsBKNEgPt0LefYBiLgjIdEQW0hidC3q3Xf9X
         Umag==
X-Forwarded-Encrypted: i=1; AJvYcCUuw3G5ZbeuZDhGDLHBKc/+pTGi6CrwtUlP4NBBoUgrHfXmAQCerZQ2eQwmOPTsLhWP5dGtCWC3u0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT6Usyv2R6AtTdhNsH2SRAXww19DKd65NHVvjmz4fkR0sIDNXY
	gqzEn0iGCrDfnG+BSHSmB5awepoMJPRh0SLw4kTxWCByl7VGmqjVmHBgFIJk8m9Jdgxu2it+24Z
	JxHKpGqtJ1xNvuMELl5mxgOIHGdNtNK8HVc7KdYk8XAca8nf9Lb97ktjIGRmhM9o=
X-Gm-Gg: ASbGncs3k9jaSLrZbTJyMbqlCdtxiOMD4Zzptrn8Sl24uVIYZg3lTOi0NpcjjDzKkmn
	xSIVfaxEoU65QWD8Z1AjJPZL9AU5gI247GXiqdLwnGiTf8KyA9uEKS+tsqD4BOkIcTJP86vWIVC
	qSDtyvCRqChEVBDc5DIwWpWi7bZ1HV0SREl7jgvp80WBDTNNN5GwDi8PBUYkFE9WxJlIBXSIgqq
	Ajvw9HrRFHu+wZnF7Jr/WNtxwB0mtF+7NN4L5mNiIdrUuXjvNFE848oV3XQm//4Pgwr94Q1WJi9
	7TzApVUeH9e3dhTRBLMRmK4awKGyn0NSFbRaAck2O/YABrCK3/7VSKQY3x2yG45MJNxbpBH9+Zo
	T+vW3CDWVKsO6Byp0y62dnE1UgJ7wW0sM6EfWwqmFTDbQlaKS2VR8
X-Received: by 2002:a05:622a:548e:b0:4b3:a73:2d5b with SMTP id d75a77b69052e-4b30a7332a3mr33990811cf.11.1756455350898;
        Fri, 29 Aug 2025 01:15:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2K+f3QGOXMzVuZ182apan0UZ0FGuT2CzVC7IkNGuxO5ayQO7W28gftKE5/UHpSe0BD/Uz6w==
X-Received: by 2002:a05:622a:548e:b0:4b3:a73:2d5b with SMTP id d75a77b69052e-4b30a7332a3mr33990531cf.11.1756455350473;
        Fri, 29 Aug 2025 01:15:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f67a41910sm434735e87.130.2025.08.29.01.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 01:15:49 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:15:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-glymur: Add support for Display
 Clock Controller
Message-ID: <lzn5tn3a7sclqp3bg25k7tf4l7kosoww67bxnvlyazdrtblzfx@p7i3rycihtzm>
References: <20250829-glymur-disp-clock-controllers-v1-0-0ce6fabd837c@oss.qualcomm.com>
 <20250829-glymur-disp-clock-controllers-v1-2-0ce6fabd837c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829-glymur-disp-clock-controllers-v1-2-0ce6fabd837c@oss.qualcomm.com>
X-Proofpoint-GUID: d4C3BVonwdDg5oGjHnA732U37i1JxFoA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX45NXt+2FvbN4
 OtG+hsoW/sWi2vDk78Mejfd2S18X8gaS54wbZdX7UubP9ppeb5mF9R1KD2E76kW7NU3EPNTo3yh
 Om46rX/cnNgo7FUH69gl5IF+nu4xS8gUC7qmDM+u4rPopsGGlhHemhLoQwmc7HSuDiZz1wd1XRB
 gBUJ4BO3WrhJVtpqd4V3j09dltapEa1N4AI6M/QniWWoLcXOC1zN30EQoGxfq5zIQJdhIEoLIb8
 XSMkgA4LD935ISQzoYzxKtxALQGOz+ztRZMLJk7m4utQuS3Hu9SgYb/xnzoN+NjYaFVcemvu0J/
 v9Orid4hYJtyQ5ccyShkeANjFxZZracn1GJ3pRa/+p+hNV4kkb+7n1rf2jZukBxm/zJoZoBpV+7
 IEmSYWRx
X-Proofpoint-ORIG-GUID: d4C3BVonwdDg5oGjHnA732U37i1JxFoA
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68b161b8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=0pr4t0U7TAZz76_aorIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120

On Fri, Aug 29, 2025 at 01:28:04PM +0530, Taniya Das wrote:
> Add driver for Display clock controller (DISPCC) on Qualcomm Glymur SoC.
> This would enable the display sw driver to enable/disable/request for
> the display clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |   10 +
>  drivers/clk/qcom/Makefile        |    1 +
>  drivers/clk/qcom/dispcc-glymur.c | 1982 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 1993 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
