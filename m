Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A7F2E2EF9
	for <linux-clk@vger.kernel.org>; Sun, 29 Mar 2026 09:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774777963; cv=none; b=Q6tH9dtQ7JZDdOm81Nt7h4o+CyNLzMHi0CsPwGQxSEoYNBpuw7P/qFJ1BQg4/5I+I0N+NeGDKZcKA2mgPEzFQxF3HSL6/UYkjV81Vtc1WamJ0Jn/bW4F8i7uazFtaDnOH8k/YZC1cegtne4+7Z2j1eH7nq4jB/xp4Otd4wgDEr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774777963; c=relaxed/simple;
	bh=7I1eZDkRK/wdoYxZ7s+Ps63Cn8C3cZQaKdTWPLvtd8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2W1wndfhNM6vp8O+/1wQvuLs0mWUZLFuklLb3cKNGUxseI+2YZzha7OstNMW9pFBJyh+vNA2tCDHpWnEXOgPXR4uaI+7OMLN/IHo3AME4M7vJIpWUDkLwnP9Ear1d9rdzF+SelLeR9DQFn+aaVIyp3A80HQ71OjckVBiEUb0cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgBXDthx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dnXl+ouP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgBXDthx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dnXl+ouP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T4ktkI3152749
	for <linux-clk@vger.kernel.org>; Sun, 29 Mar 2026 09:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hAyNkY+C3fVpD3lC1c6+6VJB
	YgiejZKZd/p+VA35QAk=; b=DgBXDthxv5tldkiJRuVhdhJOm1JntCp8ib32vvFd
	RoBiF+V/tECzgqQFTGzs9azaf3Kb7oG6v0MhZzhdQGzhNXEC6b7ubvFu+QNZ+TUt
	N+tVoeifX6wP6uTT3yhnPvxuXtNw2UV/SNnqhAiIcjk5PA1HwzB6n5XMycT5Z4Fx
	cOcTh1lVqwNYqbp0UJdo/qMTZeeTPXm1RwtRmN8oYkVW9ufbYq4WbkneiLkTuiQx
	OufqQEIixd4QVQsZuGxRhqWwGp2Nok663vnGN4CcncCmNxzvFj6hIhSBpTJ98c9Y
	cyAmjXYZk2XxDjitYA4Z/t64eOC74HPnFcFbOOs9o6UU/w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64bm2vde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 29 Mar 2026 09:52:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090e08dcfcso102609191cf.0
        for <linux-clk@vger.kernel.org>; Sun, 29 Mar 2026 02:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774777959; x=1775382759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hAyNkY+C3fVpD3lC1c6+6VJBYgiejZKZd/p+VA35QAk=;
        b=dnXl+ouPVigFEwqbh2pAOGlvFbzv/+T6ea/PFG9zJhKr3bSLktCImrQvBJt+b+U0HE
         Y7gPQ2alC8JUaluNfdvvSipJtiKTtDh2feUz5vpTypmLTjU5BnkC15neFXdjvKdFUXBg
         50EBgUJcir1xyih6Ju6AMI/PXwo+wj/tp3MB4EywvgX0fA9TYCbt/2lnvnPbrnieHFX2
         BxeogZcOVZB94yD710xJNzrLYwZ5ZZuUPy5j5MAw0xyqQVji3aUGij6EftjOJGG8ifTC
         Iv2mmBp0kadMF3pR8dQCrjYJG7ecg0coMpDgkP1QmMvrP2/zrqLhveKglJwSPANd71DQ
         i1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774777959; x=1775382759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAyNkY+C3fVpD3lC1c6+6VJBYgiejZKZd/p+VA35QAk=;
        b=IQXk9cVUJB2VOiEYpUdGUqX1SNpp9ttkwuU+ZoPfA8ESFV4B5TlyEbWF143PKYbHpY
         vXfVVTR/vq9u1XNgpAnZ+2hwa3Bi+8cFT5eKjvtwkUHatccG5pN8MYMOycfVSU26vw++
         eMO5jKceg+f7v9M1ddz0Iz258FddXk5dCXPYyvBri7kCwYWeDX2WTYBM4N9icn/Ipy61
         x2VoEnFWrKcWRP3461ajHIPpy1eFBB6KNCrAalJ2pHrWHdwEyYlqf3EgV9m4UiNVDERJ
         QAMWYoF9CBEfG9Hr2IsVcSAuWtc45wDEnDOMIscZKZrpU+DiaB1x8rBi38DH2Rk0ZMdR
         H9pA==
X-Forwarded-Encrypted: i=1; AJvYcCU88bnz7lP1v40uoZPmnSNtbdbqSGkaNoa23kI1piCBWeM3a5ImLw5RNWhGWlRJRvsJeQFVP2KuPyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSaUNePYAnR71gNMROl77ZwZWJvMc+Cy/pvwDWAzoSc9OkcXXg
	75b4cr3k7Wf8YcOvdJQ0LuDZd4q0paOBg/AUO+Xnif94hjps92XAQQ5mxGSzEpBqnc/kmwaZ3ga
	Sr+zkb/H4EYLC715PDF0k2VANVFjJjrQPohkBqQrFI10LP3KVgR2b7zczHiQ6ZU8=
X-Gm-Gg: ATEYQzyGawsStms0SE8gsGetY9eNsosgNfHe5FPM9Z9/hWNNkm12Zva5bWuLVJ8/Sso
	VO2s3AfSE+PEqp/Cauvs6vd5xnA9PkOyQqhgtHXdxMB5oKGhVdaAUvD1PF3bUGFdt/f6ZuPMKAy
	HalpnUodRSegT4B/h4lBRDxVhMPzmDxADMdfFH43ONy/TI1lfOVJ6ZsEJflkbkgvK4FU30vX11s
	eiw90iB6oXAm+eKmsoLN998TuN8KbIUK96imauiIdVZcfYRoHbelC5BNHN5VpnNuLqJoN58ZFL9
	d7QN/PJv0+O/3vDkd879kTwcnbi4TTl2NBKkvAbGVQIolaosmpsBPAin/gukLDafeCYBc6rXk0/
	uhCrq2K4gpsHqaPrQ6yV8h82ln2imeAW5zxcBJi1LJ26nReP3KgLFSKDZsXUTapsKESwCzWHgjj
	C9UJchmgqoD01/1932QGULS7q9WOa0yWBs9lI=
X-Received: by 2002:ac8:5f14:0:b0:50b:532c:2ab0 with SMTP id d75a77b69052e-50ba383e5ffmr110867811cf.4.1774777959409;
        Sun, 29 Mar 2026 02:52:39 -0700 (PDT)
X-Received: by 2002:ac8:5f14:0:b0:50b:532c:2ab0 with SMTP id d75a77b69052e-50ba383e5ffmr110867571cf.4.1774777958955;
        Sun, 29 Mar 2026 02:52:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8391fe90sm8782231fa.42.2026.03.29.02.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:52:37 -0700 (PDT)
Date: Sun, 29 Mar 2026 12:52:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add
 PMI632 Type-C property
Message-ID: <raecqyz4r7je5s6ecyclffwoi7kqt2oqwctj6aevj5tsfuxfkz@5i2jb5i62thx>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
 <20260329-ginkgo-add-usb-ir-vib-v2-5-870e0745e55e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-5-870e0745e55e@gmail.com>
X-Proofpoint-ORIG-GUID: 7hDuNjOYdGbP3gdSwVmb2SdUmNg2CqQ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA3NSBTYWx0ZWRfX/LAFiJGTh8AK
 rPIBRzpeX2OJNjovHdkWlHO5lpIHrss7kZynKPSB65dsPKSxkhYSO+C/eOhEg3cNCBKQ3h0LZ1V
 CUU13JClsPs8aVj8mdmY4v8aeoOpQx7k7GBI6sW8R0I7WW3AM6hTHgxeprBbW4c4tug/hFZAxrP
 XEqkMSmnIT1k1DIPaB+bDjO3WuP/4U+CkIq+Z38ODPVRt2tZ2b/e4TN2ymjO90eSng4F9YxBeuo
 4Zy3QLevU+UiQdaNOP0x8RpRigzXTCihQ/a9g/BYr/uVV3M7+GyBPTbunKP6AS29gPIXqYl/c9L
 TLL4ZgSINX2k3fq2Wvdp9oVVfIKelzBSh95w5zSus2kAkUDbsk4w4CNAE04pGO1ZYSaOIwsR01t
 5rOu2/h6E7CkUZ8h5L7TyWEt24KPQnGYCaxzo9C69udfbcAXIIrHd+HWxJ8XMenR+Aka6PtqqSo
 Nn2gZnes8T4Jj6PA5Eg==
X-Authority-Analysis: v=2.4 cv=eJAeTXp1 c=1 sm=1 tr=0 ts=69c8f667 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=4paqipjyf0t-I0uxfbgA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 7hDuNjOYdGbP3gdSwVmb2SdUmNg2CqQ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290075

On Sun, Mar 29, 2026 at 04:48:00AM +0000, Biswapriyo Nath wrote:
> The USB-C port is used for powering external devices and transfer
> data from/to them.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
