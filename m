Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406163D349E
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 22:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768946615; cv=none; b=qgLlE1/71sxN4WSc7RxkjA/4wokZRAj7lyXa9P8h13TleRGg/Vn+OXe7gGksyBTDnUbq6DCN7Edjhr2pwpg85D2TRfbVyMWqIClBPlj1Qno8GAL2VZkC8FhCjoKYCfNuAzKPXivO5VBRdSJqBk/sqtHJb17J0szgDK70Jk5/JME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768946615; c=relaxed/simple;
	bh=IsjGtIkDgzUdrN6ePwaBEYZlrOJK82ZTG0kUiJy+FXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icuA/6xBi/kbqIs0TO9nyBGMDxpmRnDUue4VRJZaKdfQe7scGGqQozw2CmZhYSDfYbrD6WHHk+vqUDZ0Fef9H0ahGLuuPGp7QhvHxsT0NCHbxBG6lcH+pEvA35Bu05Bc8dAfyxT33MO1z0RKUwLJ48ydSRWAjqXK6D+9MPnjE9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mhqw9naw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LmpXvcVP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mhqw9naw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LmpXvcVP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KLbUbZ803598
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 22:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y6CYv7Tl4oV6DXKYTi16x+4R
	G5JfzB9SKqpy+LoHMFc=; b=Mhqw9naw1Ds8ZBTAJEF6qglZE+8T7pA+pw/yPEJa
	tAckAWNF8Q72rLXcbmyN4GkHArstBC9zcugY1/vzm6c+cJb4BKb/1h/UGo28gQC1
	CHCrz/0nzxPIKOJ3BPEfBT8MT/XztdjEackVfTYGqq59TKhyJQLKwhzmEc2ZDMRn
	10lTeGMSXD5vJlSvSuDMzM7s6TjCuFfnVPP0wraFbisy67c4MuH0ZOguM2wBs5nr
	oikQvvr9jCoFrfH4nEe70D3bNd2wJ7jTh3GnVmDN5zDiYa2EvGKue4TKtTnvtPqn
	aAttcia7HYa4CO/VH+87DpzNtAIGsFtwM7ooOop1g6hcwQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta6q1t2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 22:03:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a87029b6so1130638685a.1
        for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 14:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768946611; x=1769551411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6CYv7Tl4oV6DXKYTi16x+4RG5JfzB9SKqpy+LoHMFc=;
        b=LmpXvcVPp/e5lhpV9AVlA+UkEYD0mGrju+MyESc8z1f9BJBFv+KgWMhEjrRZYQs6r5
         5CgPJ2vtbtBm1lkVaCVcyKi8RahvsxYoe/Fnt/pPpjO6FDsPJ140+huY23aLxs/I8jTL
         xqMtPL1o5ozPeflcmU3/WvyZ8I1OrPNmYm19EUQdOd1ibL4+xqoIbcj6WDvohApHMJtn
         T6Um8k21fvrBfQnpcEb1Bu8qkXk4XLl/8k9gslnGA+yxCsQ1uyc/qc+v68larhPOGUsO
         mHCdto9iCjDk+LRD2XW5I4DYfrecqut2mpUI9RbAOBl+AkZnsS2xc5TvBv1KhB/BC8kx
         l3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768946611; x=1769551411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6CYv7Tl4oV6DXKYTi16x+4RG5JfzB9SKqpy+LoHMFc=;
        b=hElNyior4rr7ql74ukyybRDINNU8hxtgdGpopwM7PDw/s1C6LBFUpWADcHNGepHR1w
         mtq/Ek1yB0eU2g84gLk6w+34AAUcWrj3q3VEgrsebwu/fowl1d653lDoa0hfvp/jXKUd
         8MTy1pTA4BRagWEBV/YG3vU3knl3Xoqr0BuiITr9ogWpYdPaNvTiX2tQh5/htawhk/Ab
         Fzd8tmEm65XVTs3L35zyF+hFI5nyi3j2ijvBiGRicOc6ZPMnIX5EF4hLNMdFrj/K4vRR
         b3VrGsYFxRm9dFBgHfaoNtsD0LGA95WhH9+TnyxmWum0IW/C6D4xP3sfC6gADc6NJmJt
         O//A==
X-Forwarded-Encrypted: i=1; AJvYcCWkxPAYs4H2miHE6jHLis7htKRE4RDeMgMJQ1HEfnR4zAZhztzozUQlNPblP/Npia2gf/n5BrwBX8s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5MtW+7Eom4oWlFSHSBmRXjRhUnb8d2wbE+UEYCqNr6m7CnmMa
	h+gFKTD5eCrRde0/kNd3Bd1X0GAy7O0t246DjxAPwTu8eq7sOgh3mi11H0PpzYcFUnxGKV7a+1N
	m5zPoFvBG/oK5ntV1hTHKoT3j2ZPJp0QSMJUNTG86J+HDBLF+BZ1Z3pcz+8/slUI=
X-Gm-Gg: AY/fxX7QvHRjdLcqmd4PRC9aKpsqCeN6wzlQuEbiCP75MBa/MR/5GOYmeahN9h+Hb49
	wdxy8R71JnQnE26TtIAkdPsw0TQR/Sd1etCWhbl3jvwLlLHY2og7bJdxKpEH4d9JcKpgjDFPM8D
	l+epuh5zt+9xajzJ5rDulGOcVnrbzIkJoLE5iPs79vrG6x3Cn+5v6rNINSLGLpf1bHcV0czXv3o
	6HZRPMrNOJC0AUbG/y+lgUjGd2lZFTdSal5b0Oev+YKd9+Pd2TnJglGPsb0kITlPKNjH0E0ULxg
	8gdiR0gQRQhllUFablmAHhNWQrS31Yr0BC6xfYaCV9YVkTGfZNYgpisL7DSaVW067P5amzHS883
	9tcSbYsd7RvwXrbq1Ns4utbIxp2g7UEvsz+0XBoAah6Pe5Q2WNF2hAAaoFv/i7SQ2uk8CAskk5o
	Sp/ca7QWZhzk+dilA70r58deY=
X-Received: by 2002:a05:620a:29ca:b0:8b2:e922:5282 with SMTP id af79cd13be357-8c6ccdbf247mr448372985a.26.1768946611070;
        Tue, 20 Jan 2026 14:03:31 -0800 (PST)
X-Received: by 2002:a05:620a:29ca:b0:8b2:e922:5282 with SMTP id af79cd13be357-8c6ccdbf247mr448370085a.26.1768946610648;
        Tue, 20 Jan 2026 14:03:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d8e0e5sm42321881fa.17.2026.01.20.14.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:03:29 -0800 (PST)
Date: Wed, 21 Jan 2026 00:03:28 +0200
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc7180: Add missing MDSS core reset
Message-ID: <xdllt4b42d4srxaqszlk5tadjvd5zyj5oae43sgwllvzcsva4i@2er45lhhfwij>
References: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
 <20260120-topic-7180_dispcc_bcr-v1-3-0b1b442156c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-topic-7180_dispcc_bcr-v1-3-0b1b442156c3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QohTHFyd c=1 sm=1 tr=0 ts=696ffbb3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=HRRn__jHw68NO7zq-skA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4MyBTYWx0ZWRfX05woABeGyKpS
 DbZe+0Izv1ncg5xL1KKyKDMMsCUvexK0mxVO3P3JF0ceW9UIACz5sXl/5wkuz3cGkhoNUP5VRrZ
 b4CrQP23UKREDpC+J3QSL78gYW3olreG8zI2feinRlm0+HynRtvpdz7TSD4YNCW3WdhDPBhQuVe
 wsTiQsp74pRxp/4UNijlKiEkd8H+WiVJhhPhlR8RA8klQZB7y6fGTVDJcNgpUJbmsWIW38G3KqT
 qHdY+P822YdxfCzCdrep+VOaAs2eCYmcJ78a9mq0KEDFMz7dywM7WXmEsuAuUDMIAj7wnGMtH8a
 VImGHsv7VOGMaAHfkYaQxrqte40o2RNoLSRRzttmjNSz0CQSWNqSA2gFulfTASg/MAEMAkNL4h4
 Xjpl9MNEqONnjC7QaE8JdjKcCEG0+fASgfQlpuk7Yl2Yluh/uY+yiXg4PxTnUUzrB5qRZsK093P
 miQRmNZp2QW6IjxLnNw==
X-Proofpoint-GUID: 6I6cmtpQkI3Qt5dixk7N4qqH1vSGCtjb
X-Proofpoint-ORIG-GUID: 6I6cmtpQkI3Qt5dixk7N4qqH1vSGCtjb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200183

On Tue, Jan 20, 2026 at 12:19:27PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> To make sure the core starts in a predictable state, it's useful to
> first reset it.
> 
> Wire up the reset to fulfill that missing part of the HW description.
> 
> Reported-by: Val Packett <val@packett.cool>

Closes?

> Fixes: a3db7ad1af49 ("arm64: dts: sc7180: add display dt nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

Let's check that trogrod users don't have anything against it. Doug?

-- 
With best wishes
Dmitry
