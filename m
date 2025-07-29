Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED6C21ADAE
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 10:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753786143; cv=none; b=a8sT5eKSrzXCoLQr5Y0bQcZqmnuzDVbhIoQRv7V+UCIb5d92vAfDm2xbTT5qeRG7NZDuIdh/mG7UuPmQyjHvLU6S7qZ6J3jMR4MALV1yu3oaoVnasU/EwXo29zW6jyKMw+Fzm3KPPpmXf99jAZ8IHC56LM2v9CbzxK3PCNNu+/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753786143; c=relaxed/simple;
	bh=C34G1P0eEB9SxiCuqdA8stqbZ3Q36ewqbLLMaPiYE/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTm/qrbTXFk/mtXu/RE9Oky/+Qeht/qHlzterpHC+ke9851uIoKSETBUOdfcGcvFy+TjxWOPkBPZnNOD/Vry9oKnM1Q0c8nSh6Z/8BFa+ClLD7g3NdP2x+7xAL3fcQsqsSmueUd18nYiNyK9D7mdiX9o4WYAArgEJ8KJuFw6bbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=loqFY7Bm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="loqFY7Bm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T9QpHM030179
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 10:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1gZCla+PC7KgPMRAN+a1woAP
	P0liPJQbm25JcENNdXs=; b=loqFY7BmrCJYeVDVc6xMnBSuo/ELUNMMfhK5vphh
	7F/FT3iEYz5Tu82Nt/dvO3epT7d423WV3PBOWNkSBDJmqpgtx7iH1GgWnxZ4NGju
	H2X/jR7u76EWIYs1nnuF2MRzDOHIoXEnJjVzwmS1jIH/02UZT3VM+WP0c/+rvfjt
	IZ4bnKnUNt8NCeV6JaWpbXc1UMBrHLG0eNGRjhajDe051v07nEnuyfsjjRHKF22w
	POg5/vmaQJTbiwsQVc+AgTYzZYbErc7Q1Z+ccNstICCvWC25uVHUtApNYPDYxxjN
	8CYjtOqnsRSicepIAWoWsvCM98RgqsNYfE0PjmDX610kSQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbkyqqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 10:49:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7074cb63bccso27283966d6.1
        for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 03:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753786140; x=1754390940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gZCla+PC7KgPMRAN+a1woAPP0liPJQbm25JcENNdXs=;
        b=Y4TzrBxNtDXFG4IeEm8jzm3f68B9nvJdLAY97TkhIAXCd1/HOD5jZSJGr+PIEqiOpt
         LAgOZ0Lug0zpppquuqk8XYSyE2mUp6cl1EcwiPtkuLq0dSnGFIuz40mbcJmqG/JJGDMd
         AegcbaQlaXu7eQTx6w7A6BeWFm0M4BHyG5wRs2D4M4XFwz6rLuE+uyQ2r29Hqfz4JED8
         2hz1YmGc673Cl7W/brRQjVpnlUmmZqwnvVsaYz34t4axx7aOmd5/FQmRfN4XWMPPI/QT
         mtgklq9+lPqrscEzlp2kNk2n8wkILqi1/p871umLq+bhA2XQzwy4BilySnRniy8ejqd0
         Pm3g==
X-Forwarded-Encrypted: i=1; AJvYcCW0gVjNujgWUJgCfgALbDQGtwe/xMeCRSpXm9FzIE7kaYgLgt8BTL0n1mL2vJS8gmC9vaCzS+SVuc4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Soo4esnjl27eqPK9G2jJICwRYV6ZPS8c7p0U5xycPpnwvG+J
	WzJCpNI2/qMXBsbCNgJ6yIziR9T5QBvzb28k/7zOJtT/xvNgTj5EnZaEbN4a3OApOo03NiA0qlm
	dZHs6zT7HCWvxPFzpkP3r1zwynSMaSbp1pO8nmW1oM86DWI87SGRwhSJj4BvRObU=
X-Gm-Gg: ASbGncteSm337iKvy2VruKgqyrb6XflFxOga36Myp+Fp+qnzL4fSSf+bsBpviLaNDVh
	q+4xZFWq24c6TkS5XbvkNe8BBIqZZL+hnJ9FYVsFo9QstIWwc5dot93od0praabRmngrZrpzPEA
	X7cQJqkY8dW98gzTIMFz1jIflsuM1M+HNiSECvrwzUShydLVVBIeGVITxv6kKzEXMNL1zNSXk3w
	a0BNfY7QzRdsjN6KWP+vTiCvFcuoMp3hnPeSKKzCT68iLb732brBUicFNYMKrbRUaXoDRhkekVz
	e4sqyGpkmH5/tf1Kz9ms8zK97qrDVlowLS3BvmOeGSKeaqFMx3MF8yU+Wf9z4rxvAdahSy+ZXOo
	bm4meNmvbLf01rmp+vVNzTbWrO22/NSnvmfyr1B2KPSw47mOkRz2E
X-Received: by 2002:a05:6214:5294:b0:707:611a:c7af with SMTP id 6a1803df08f44-707611ad0a1mr3722136d6.6.1753786140447;
        Tue, 29 Jul 2025 03:49:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOF6nNOAgWT75o0XQd1gv4X7CrFSmPeC7FXcrYQvNIQQ+mEZ3Xm0poc9B4mIvJJW3s49BzIg==
X-Received: by 2002:a05:6214:5294:b0:707:611a:c7af with SMTP id 6a1803df08f44-707611ad0a1mr3721946d6.6.1753786140046;
        Tue, 29 Jul 2025 03:49:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b6336381csm1639826e87.96.2025.07.29.03.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 03:48:59 -0700 (PDT)
Date: Tue, 29 Jul 2025 13:48:57 +0300
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
Subject: Re: [PATCH v3 4/7] clk: qcom: rpmh: Add support for Glymur rpmh
 clocks
Message-ID: <dph5azc7mrdmsrau6jb7alkhntkziwfhz62r6fwsiaq7ra44ta@qokbet7yue6l>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-4-227cfe5c8ef4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-4-227cfe5c8ef4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=6888a71d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=EB8bpfT8cBTzwKD-FZUA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA4NCBTYWx0ZWRfX8MQESwFhtDxV
 oklNJmyGkAojZrbmpfQB9698YkOdZFGZN8F92oyyND5mqbfgOyb2JKuU5TEmQMwc2KhEsw9YfFt
 LkjxlxqlNTZO5L4zOcLWb8MTyTAEK1n/hrDGGWJsg46g/LugXgR4xG7I98Rh4vT3V+r57MtZYrB
 260zxPDb8OnjrokO+SQX052Xfy65thmp9sJR9OhJQrOtdJ2fpgrU6P7f3C6GcghC7YP7VrsUBMx
 qi9tpGajRGG0WNqrriQvOSh9JGrTskfrykEFAsim7MT9XDDJZFAzlHSHlY2s/umvgyHHQko1Qhk
 M/IkAjsMtGebfeIE6f4x4WbC8jZaGHrLRCIRD/gA5TUSthrax0jGYDAvrJ2TC+pimdLgR4y8un6
 HOjjWtqqtBwnfbZ2BIyYW1g5i4Uno/Q6G6Xqp/oNXt5gTHupI+zZmRoxdW+mgK1ltcMVAWeF
X-Proofpoint-ORIG-GUID: vQc9FZ3dgCcuP8bxMebkuLWj5j8P26ql
X-Proofpoint-GUID: vQc9FZ3dgCcuP8bxMebkuLWj5j8P26ql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=703 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290084

On Tue, Jul 29, 2025 at 11:12:38AM +0530, Taniya Das wrote:
> Add RPMH clock support for the Glymur SoC to allow enable/disable of the
> clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
