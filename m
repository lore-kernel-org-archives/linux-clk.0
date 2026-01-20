Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4CC3126DE
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 22:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768946530; cv=none; b=HdM/4/ZlkNxQSojd6eTaRFOT7Fl9dp/qbdFJruip7XzRgDn8mYcUcV1NzeF1jaUsKiI0eJIV1ECWtSYPc7P35D8IH3SjQVF6N2j432ush0G7t3NJkZjRyeiLNTNeEtuL3140SgZ+a/u1LbejKjw3ceHzt5dZ7jQEetkLnKYQU1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768946530; c=relaxed/simple;
	bh=VafLE2LsMSEMxe/8SoZIb+i5nLHEo+tX5wmA6Yii4yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBTHuhbEPDQz7aN76fXzqd/MhCCGF5i82J7SXFHM9hkhzdGKqw/xAQeJdWrIUZuCirZyhveq9OMhjKeYuKCsyeIFvJstTBq4Nz242Ro5HwCUi0uiPWgA6EVX79XkSSrlsrgWMwntuJB2r8f6Kyqnn+KhR5uHoNdwFEV6kO7OHSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cgJOi1Mc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ab7EQ3Lt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cgJOi1Mc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ab7EQ3Lt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KDxofi428970
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 22:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9crKbumNaTveQ41rktS41EDf
	zqAitvWbjmLVxdNQRjQ=; b=cgJOi1McE15BRnX/3Iqw+pmpEoef8WZ3PboUuFAv
	7Z4gjsFQp+6e4KqkmJYDppx7dvKrPqinEvA7vUSsok0BzzZKdpBfXLwbnkHSivDD
	Uv7FVyfHbXjeB7aC7jQSMDar+0zseL8fhxVWivARDvbpvyCVl4fEdlQKm1cRMo6r
	aMCm67kmIuikB0yb+ujnSeSHH0rEhwKPV7iP/HDAbz4Bgec1HoWrOVnC3Cim46vW
	Xw72jk6J598cW5txqC+hD/wHVVohB+aSAPp8VopuM1WEATi1qg7SRzxuR1Ub7meQ
	Bytl5AaxaFQC+WedhNBYObOqRjyON8jE1l3H+Nu9k2fekw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4ps2vgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 22:02:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a341ac9fso180526185a.3
        for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 14:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768946525; x=1769551325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9crKbumNaTveQ41rktS41EDfzqAitvWbjmLVxdNQRjQ=;
        b=Ab7EQ3Lt4Iu/xOOlZ3dAFgTyfGnxeZNl3+Gxq/eWqcD7qbODx9uBplK8gX3R+aEXmu
         ASlt1s+G1mftXO+qvNV/uSgdqmZp3hw9h5crrUSoYn8LwXrxcH3P/hVo1+TI5sQ3/Ojr
         VXzaqAb5flDySmFGdHhIPIbpFr0TmOZrMiMxFN5o9YXvpo7ivX0INqtr6lkL12Ci4aJb
         XrL0nI3Hk9n9vzojzjRoREd/3sr3VEPrukFlwY3p8Pq7yhv3RKKN8sHq/gfDUcofOtYJ
         XLnqUxLnPFbkZ0nDGmohuN1cSx+RWj07yrvctA4DenjrdeWHQdFschww7tkQpep1uPSq
         wWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768946525; x=1769551325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9crKbumNaTveQ41rktS41EDfzqAitvWbjmLVxdNQRjQ=;
        b=WvnTocsIwpq6M+k8Y/kxx+1QvwboIoB9AOQ4piGvVRJwdREOfMv/qhkJuEs72AhbLu
         d3NidqPBz7TUw1d39BbKM63G+rVh2JRN1lE8hvjJ1v7tlD65sMlRAAfq2x61REhGXLn5
         Z4V9WoF1jvrfrYGG2SLqI0eBrtpr8gXXC276qRX6jheR/NlwzclmU3Cdcip4RBN1/oRJ
         2San4VisdtH0tqbrh1f2oS8iP/o7BPGD3tFggXuph9jblYLd/SZDI+yca907LmSthPXI
         vJQ55aNL4olrsRni8bgZadQUN5L34OD1VnGyoztU/U9FyI/+jrDP3Ap4m5TpD32MYliK
         ozfA==
X-Forwarded-Encrypted: i=1; AJvYcCUOX9UQL02Jjbp2ObyO7jqNg7yIVpP4UyRxUmOcyLMkB39u8j8PM7MKd4LKvAw+SHx/fW4hhZ5Jkp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCeLR22Ty6l26/ZQx3NNr3PTex90FuIdbiwhzcccbfYn5gEqCW
	cteBDvq/mBLjESfUkE1ZLh8DfQAwB9RFDRN/TqVuxLN0w+1po/hVGeTd6oTCYdatI4WhkdnIhL9
	LSgBHiN/wArlSKBRjcJn913fCfk4EL1lcbaI2gv3bpLo2cNWihVUOuRgN0FvOc7I=
X-Gm-Gg: AY/fxX5IPAvueVsuBP30f7SfirWHzB3KtHOc4MFbSddq1vJ/hAioKmjijgYtUwaH/Fj
	C4jwqFu3Pbrom1idbOYrVFkkugaeEXTFLbEZV1LT5y/jmVbvzxRtzNJRXr0u6u5PRhEAMSUUIXx
	QXdqa3eTeMRp+FNPE63FioXbaTRH1y++jICEJlR56UucE/aqn2NPJdkgz8F6kGrlPZ31mHUz9tc
	/SuJhdqvyV9f8YgCW2FS2gXM+ocw6OfFGsHuoh4aZ8G1rqWuUd7TRYIlES/iL8eP7VtMse4NauG
	qb4NznaXFQYf/UlRhnLwGsewnNLhGYXO4V/L2dCgZNOuLLoFdxZ4VqqgxnC8CYb+D+8tiAeeiEH
	kGdHEf7b+R0trOXG4x7wr0R1Z1k9dxs1b/DuSYY6ueMqxK7oO7dQ3HJEGadiY6k/lIFDP8O3q2T
	OLhvy/l36TL7C7Gt2BUXzQ5cs=
X-Received: by 2002:a05:620a:4723:b0:8be:64e5:52ab with SMTP id af79cd13be357-8c6cce3bafcmr409214185a.60.1768946524852;
        Tue, 20 Jan 2026 14:02:04 -0800 (PST)
X-Received: by 2002:a05:620a:4723:b0:8be:64e5:52ab with SMTP id af79cd13be357-8c6cce3bafcmr409207385a.60.1768946524180;
        Tue, 20 Jan 2026 14:02:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384bc471dsm40146081fa.0.2026.01.20.14.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:02:03 -0800 (PST)
Date: Wed, 21 Jan 2026 00:02:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        cros-qcom-dts-watchers@chromium.org,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] clk: qcom: dispcc-sc7180: Add missing MDSS resets
Message-ID: <b7yt62rylzcu43bu4k7haj56xltyg7ejj6nfloinmiyjfg5h5e@hhh6ewrslff6>
References: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
 <20260120-topic-7180_dispcc_bcr-v1-2-0b1b442156c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-topic-7180_dispcc_bcr-v1-2-0b1b442156c3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: niF1ZkXEFysU6_GwJP6jKzNIOBB-mJWz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4MyBTYWx0ZWRfX6K1fCVdXpIBN
 SSCpJbcywDtz8makocW0pNEbd+4vj7IDbmP9EmslswtamK/umu2Fyczi79KOygNeDvo88cvA9RG
 3sw4TceV1dIFGBHjU4SLSDDP5L1H5HbLF3FLlLaeRJVPRuHOtyWE5PAXBpvsNnctFoMVq4VPv2k
 nDRpcW1QRWFCvroHFcYWnJqLocrR5R/RZWQIjN51plBpSYVPa0RdrEkCHRrhSSAByyXPlX+KX3U
 Q/2b4iDA0+nmohQc01416lxbORO/EYENfaEvb+CdUbun96rnt3RvcK/hOMZpisW3sz7ZLofVA0Z
 zr0j8e2MhqJ6i4hwYQ+WvtRvpJr8Gz2WuRFER4myfExJ8UGuwIb+oH+9kJ0oaetDJg/ihpWxpdq
 eZV3vKk5XqShrOcbB2nYKUwUwsve6OVrO/PO6yb/NqBghEYoeKDdE3ERa5M5HjfICK7k0Ri32HM
 3W7xfE/ELzkVJoboLfA==
X-Authority-Analysis: v=2.4 cv=PdfyRyhd c=1 sm=1 tr=0 ts=696ffb5d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=nZ5XTfsJM_D5RP7zCugA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: niF1ZkXEFysU6_GwJP6jKzNIOBB-mJWz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200183

On Tue, Jan 20, 2026 at 12:19:26PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The MDSS resets have so far been left undescribed. Fix that.
> 
> Fixes: dd3d06622138 ("clk: qcom: Add display clock controller driver for SC7180")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-sc7180.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
