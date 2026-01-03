Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427A923E350
	for <linux-clk@vger.kernel.org>; Sat,  3 Jan 2026 13:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767447740; cv=none; b=dJHCz9h6iqUwyskNtitVrowmXmOeRe7X/0fSXN/dwa1xT/s03onfuWrXZPeheyQrIRqA853v1brhcCJlLEyiJkmcF4/LHvaCFrPLYB5hjqUyFYJb/H3npfiKnTUD4AlRAVTAhN3rKY/ny+NSWzwGCHv7bZC6iDnVZRnqAjogfk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767447740; c=relaxed/simple;
	bh=bFeyXDpn7sI13hj1UQMegxwyXA4BVNRZfrb2CjhenQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYAqwIcKwmdZhp0cItSJ/VGToH/ky/xTq8wOSUJc1OZO1cWQ2wozi51CIoklTXp/hNFg1bE+es28/vabyRJUOCBhJQOILUWnj9MNOfvzLrHZsqGTlldktZ6cBJsmrVuZOtRfRbQQYheMeph4L34kL3PzqWeVhh9GoV9ZRf5zAcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iPtoOfie; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=giKo9bWK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iPtoOfie";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="giKo9bWK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6030h3CI2340569
	for <linux-clk@vger.kernel.org>; Sat, 3 Jan 2026 13:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RknnBF6iltN8X5ctZkQUvZCW
	3lKMVu0v7JV4Tc11MUQ=; b=iPtoOfie1bzgo2etJwcMI33qd3MaPsf3BD/Xzdi3
	KqvK0QXyOET5uhAra8IN4kZRFwlalcsP3Ew6t6A/AzRFKh6OlVdX5vN9kFVRvipQ
	FMMy9sXyjIKyKWXt+bWPC1WmlYJ9gZYLd0bqkKGB62F+E64PH2MhrT4W7/knoCdU
	N2S21vwM44S6XP5q/zU5VnDRIELCZ1eyOPtRLOZ3oXasnM/zUP4GEdiT33qNf4qg
	N8gEa35izIe1Zzu0X7ahUM7q/gMl5frSW/G8uzibsFKG/iuCXlScq/H8s8P05Ciu
	fssdPFSlwrESY88JK95tbDI46jftksVgaCnelwNEw79txw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bertcgu1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 03 Jan 2026 13:42:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso415048541cf.3
        for <linux-clk@vger.kernel.org>; Sat, 03 Jan 2026 05:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767447737; x=1768052537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RknnBF6iltN8X5ctZkQUvZCW3lKMVu0v7JV4Tc11MUQ=;
        b=giKo9bWKnsXBYAm7rZFPYfR1042AqVmVOPh3tcpOnr4ozKUWh2QeHw1uZYZTqtswhm
         QkBvurqq2Pr5iptnGLrYJ4WaABF71MPX8eZZcuz155XuEDzQ3NAwy0TMUDylbKuYciT/
         LVzbsGijXO3PzCjrz1/hhQfN2r7R9lHCWCyHkFGtSxRQNlCtxbcWbqBXsgEBpjQGx0cJ
         tqUR8M1Y8NTHAUjNJraIDQ31UFzZGYi5JMuBPNYoPqBJwPqDTTHzyx9Acrjm2aNcEy2/
         UXBtWh/S70DFPuwPpfhLrkXD9YwB6o8jM4TS+4a616TC/sy0LLwUAjovBqhvUterXZC5
         CBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767447737; x=1768052537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RknnBF6iltN8X5ctZkQUvZCW3lKMVu0v7JV4Tc11MUQ=;
        b=Z8t9cTdItc6j5nsOpNNT6SLsluiFxBFv9wMHd9DTQKSNECwQJyS6w1ltfZuLsjx3GD
         EhbxGva0QcF9R+DqKBUdQMckRih8CuvzY22lipKwwri/6WAhyOSQ62QtUTNzs/nVjkuo
         oMzOW7xcUHRJqeVN/IwXaAICD6q5X7Sr4qLT9lQea65AI9HwOJbLQvwzGLnAZJA5k0sW
         tKADuNhNjdXvSfTavEj8z33ghCxKONtH/KoMWSypn5rWEtDItw02uliXTNzeyVoOetxJ
         8PZXW6Ecfhaio8HVyN2b4dkp5//UVNAEREQIlhAajKka38fuRnIVbPGf8n7zvGAVnP8n
         xxcw==
X-Forwarded-Encrypted: i=1; AJvYcCUe3W5db09E2gRWRG3t0qc1wxSjtU7a47bRf/WCiWjW1NDH5ha6onXM9iRyJ1rMW4LH0QrPG462xp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwANMLRHqs87cVubd9/sKTKqDAroeKcPMnnOERK4UGhhyqKN4Df
	ppzBw7W/84fwnq8as3rv8Cm65YLOsbSKVsLjks1x+v5H8jpYgn2UAaw1DxSkW3DV3AIPts6OmXe
	TNS6n3a5HDL1yk/HaWJGccjPDxBVb8NAtXViSt1zTF9kPuPl5u/iwqwNMaVVnEM4=
X-Gm-Gg: AY/fxX7GrNaFxNHobUP6+oixwBQYz8bt+Axjte+sqeXZ0uPPnMb+aOLg8LPX9Wblyqs
	z68wNXoYb3VasB+s3eLnDORDFAtqafJoYi2Ls3wTQsvrGPJn/XzTRgpLntbIRUcDVyNdRLkgOxV
	NAd1LEaVFzHK2rt8FCjowdMcff/WL8rG6nIdmzF0Oj7W7Jp8IlRxIndHZZPmJLB87dmVKPxb0eU
	juNYaR6x7sgvPwOQRpHoEMSivwBDS1nG2iixKX6NZRtJ77CkgDKDyAr9jFp+ecUDYgqdP1qHUgj
	bNYPRDFWZfrRdqSxBzP834JoVS9htTu9S1zvpC4GEXuev4s/XxJ3rplFIv6WClcAZvby3cImyst
	IMYEBKwR+ymBzuhTP6Yk2NSP3MY0EQLZeqpKlrsif4cdyXVFnGNNsEhYl9HlDe8g/9djFGT+ds7
	qnwDvV+9waqfqenYuxiauNcFQ=
X-Received: by 2002:a05:622a:2515:b0:4e8:a8fd:e00 with SMTP id d75a77b69052e-4f4abd6fd05mr666283561cf.43.1767447737484;
        Sat, 03 Jan 2026 05:42:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDlt7ad4aiooknmq+zB6SC15sSlDjU87miC0SXLIAcaQzxXQ8IK9WD0Kr5sJ7eNw/2osj2ww==
X-Received: by 2002:a05:622a:2515:b0:4e8:a8fd:e00 with SMTP id d75a77b69052e-4f4abd6fd05mr666283101cf.43.1767447736968;
        Sat, 03 Jan 2026 05:42:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38122539ae3sm111806061fa.21.2026.01.03.05.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 05:42:16 -0800 (PST)
Date: Sat, 3 Jan 2026 15:42:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] clk: qcom: gcc-x1e80100: Add missing UFS symbol
 mux clocks
Message-ID: <bbj2tax7qb5pj4ujl33t5xc6ylogf275lj4hr52ftu6lqfglww@s6dourggzexm>
References: <20260103-ufs_symbol_clk-v2-0-51828cc76236@oss.qualcomm.com>
 <20260103-ufs_symbol_clk-v2-2-51828cc76236@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260103-ufs_symbol_clk-v2-2-51828cc76236@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -4IFaABZOLNZol9K2GidE8aq8QAI5MtK
X-Authority-Analysis: v=2.4 cv=VNbQXtPX c=1 sm=1 tr=0 ts=69591cba cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Tt4ZZnawlGJF5pWS1soA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: -4IFaABZOLNZol9K2GidE8aq8QAI5MtK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDEyNCBTYWx0ZWRfXwUyNFiI3bi58
 2aUDKSkdwpkZMHUClS2+3CoCS7JnELX6VVLUciGFbuz5s9XRzQbiZJtclQCi0liMfnBNACEbc/J
 OCboxB/CZXJiVC2x6VoAOhHkLCDg3Xxu5FR3og4E1EPrIAMtNSVEkVOcF9ELv50nlx7HtpOuAKJ
 7I8fINwbgt4aUZz3QHxkfzrSz/ia9lADXQ/hoitflP5GAnDa1IE5xZWH4l8W+xYu1h8uFmZMYjS
 1b4UlBdhXSrcmN7Y+dWtZ1WfjxHOkiyKTKzY7x4dfRavG2TG2T7D4azm347fAgeTm/IOJ1NAXw4
 rre3BeejFeMUFCSECd2mqk+WIJ7zObZmMl8jBQk2KPwwUzIh6LX6WebUgC9CHjePqmvuVOHfiIy
 Xg6LcrN4XcSGvARihHfYnGeLIqcvl/j1n0w0+n1vG0PqezoG8bvHhIryTCmasu53Ly36kP2YHqD
 zEl/fxRKnHHbpuW70Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-03_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601030124

On Sat, Jan 03, 2026 at 11:27:06AM +0530, Taniya Das wrote:
> The UFS symbol RX/TX mux clocks were not defined previously.
> Add these mux clocks so that clock rate propagation reaches
> the muxes correctly.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-x1e80100.c | 72 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 69 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
