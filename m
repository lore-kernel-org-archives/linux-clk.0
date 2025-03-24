Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7A825D91D
	for <linux-clk@vger.kernel.org>; Mon, 24 Mar 2025 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742813823; cv=none; b=oAE2zaKeklOhgGCRqtW4Lmms2lucKyAajL500twaaWi+r/8HKO+VcMauXHlPpNCrsiwcM2ui3q6HGD7EXem1FuX//Y8QDxyw+Fy2EL+7sjiofC+4Be3QV8wrwKuumbAp29PgD9CeitFMVHBD7QSqyMvD+u8Q4uNaBEyUTzAPuEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742813823; c=relaxed/simple;
	bh=w6aPWy+Qhwe/Y2L6UoLVJWUQwbIVm3ZGC63aKmxOKVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQ/1eiUSgrk0kyC7B/rgljvhQV2FajM2Q/qr///clxSEUKNmCoVNU//TRZyojqOHIfPLR5GWVsZzdIwajkAnGf9LpMYCrpm2WMbWi7/r0Uuph/3YxG9ivxs7XRFrjzUCiROTc2b9N38FTwf3f+Srjxv/NVR4q4hLuEXGqa4Znbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WMUjG97C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMUjG97C"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9PMQs025925
	for <linux-clk@vger.kernel.org>; Mon, 24 Mar 2025 10:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e4iq5ZmzgG7lLxopw43AFxoI
	iRiSXqSMGZij+vqFUSc=; b=WMUjG97CfkjZxoEaKgZvO/dE/9TejQ/XF/zAx5wS
	JOYy1QykJ5hriIcNX9mP4zYoYtCrTRvYJjOnGoGJl1ttAYm/OKdsZtPLXNLAseAR
	WPiSXc1ix9qHCn4IRAPPDxWMq51e7BtjneVfwW9tT3EhCMzH5J5IFnVj2IVdLvzJ
	M/HZL/A5UDX4bohIg9npfRnYdoAY/sDkioV0MkJvHisdxkgU93YcqSL7VR2AF3SK
	M2LdZmYxJiFhDdma840K99rgWtMLUoFh1OpOaaawpdmx1h2yY3TwVRCAptni0qn9
	E/gfYMvbR3BGnoREMkVuHvE2RCmCKmvrkJYcrX6cDQx09w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hjjnmab7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Mar 2025 10:57:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c9abdbd3so101915785a.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Mar 2025 03:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742813820; x=1743418620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4iq5ZmzgG7lLxopw43AFxoIiRiSXqSMGZij+vqFUSc=;
        b=EDIJxG1MWolBPRs3Flq+7BzDUKJITV1itlXVzO1uz3L6bwkdvz/SzUMy26/s+D1aQy
         mYSgQhwp44b+2VT8GadYKmnNQQLaPCFUWh/RjyWfsFqfOFzBYlyX/P9gIlg+yXVs94j2
         APkGiyWnMY0dUaPfWN6jNQI620/HWIfmJtp6ja3nDQAps4zEigF06i7hV9raRDxcpjUf
         euJlM2qVhaLe/OXsZSAwaqu1BsNmHKdnEAsasAxsrPoAz5/REki1xBMElZYYHkv5rzaU
         XwG3tm5FfZOZ8eLLSO8rBeUGQy9RMo6ysOIS8mljXgew9EMKH9dqd4fuYRQqqa3B26qU
         KKuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCgZVzN7ng4EDZq3i7qPxqKni2AQtOh8DnS39ChJQe7KsMoZor6S4kpImVil8p83OgoWMrubb1p3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3snAal8JjxKZ5eS0E8QCFvfMNhBHaeIjd0guTob8zjuvw87Gm
	dnb9ADvvvGTBpVyIb+13SXq33WYjah5xlpppy0i5bcas3nj/u8q/OFfiqnKUgd4gQJpnYedWH/T
	UaAE6MKGMf9svWxxH0l0Yo+W1W98Poc9iytvnfizJYGW6Y1wl6YvMebIEysQ=
X-Gm-Gg: ASbGncuR9poaBDUZYMyHgwIR/a23ZXkrHxxUiLurABBqyWYfqMSR+6rYvbzxRjn+Xsq
	dPbN/xTlCx21em9ae0N69E66kxnYP31NDfoIJki69mO5UifxM6R8eOPl1tF0X+IQZQt3qFVrEQN
	yLEGiIwNid6cfVebT/TbGCDwT0Hz1hkond9vqJxWTX2JZVI/5GUs8u56D1etYzo8yoYQlvItWqh
	DWRwolsN1zTlzQE84bSMLixxTgeoIa1SUCs7RxDvmSXtQ5Muu0FTrDWJY43sYu3yZA7cwoqv5KM
	XAn20eqdeLSiJEgjDuwgW0Ty3sl3h5/A0OYvcm/yCJFaeoAR2v7oN3reuZICw24kTAmu0bPf/x3
	sYMg=
X-Received: by 2002:a05:620a:2946:b0:7c5:a441:f440 with SMTP id af79cd13be357-7c5ba134078mr1404877685a.12.1742813819878;
        Mon, 24 Mar 2025 03:56:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT85bm2iUMTANL530hIieoil1fUEuIlPX9t3T5XtetsmXWHkoxzeE/XwgtI5CCHjlOMTf57Q==
X-Received: by 2002:a05:620a:2946:b0:7c5:a441:f440 with SMTP id af79cd13be357-7c5ba134078mr1404875485a.12.1742813819419;
        Mon, 24 Mar 2025 03:56:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7e0baesm13193461fa.38.2025.03.24.03.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:56:58 -0700 (PDT)
Date: Mon, 24 Mar 2025 12:56:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: sm6350: Align reg properties
 with latest style
Message-ID: <yrxpfsh26ymo74olbgglrgb7d35nj6owkzndfnrbmjorb7tg3k@maccic4kvlwn>
References: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
 <20250324-sm6350-videocc-v2-1-cc22386433f4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324-sm6350-videocc-v2-1-cc22386433f4@fairphone.com>
X-Authority-Analysis: v=2.4 cv=fNc53Yae c=1 sm=1 tr=0 ts=67e13a7c cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=YQ0UDAJD0Z16suNoM6kA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: o6LesqaYPME3IuteACldH0FA1dtpDCW2
X-Proofpoint-GUID: o6LesqaYPME3IuteACldH0FA1dtpDCW2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxlogscore=694 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240079

On Mon, Mar 24, 2025 at 09:41:01AM +0100, Luca Weiss wrote:
> While in the past the 'reg' properties were often written using decimal
> '0' for #address-cells = <2> & #size-cells = <2>, nowadays the style is
> to use hexadecimal '0x0' instead.
> 
> Align this dtsi file to the new style to make it consistent, and don't
> use mixed 0x0 and 0 anymore.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 204 +++++++++++++++++------------------
>  1 file changed, 102 insertions(+), 102 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
