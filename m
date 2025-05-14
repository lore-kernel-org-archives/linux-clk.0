Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7FC29616D
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257821; cv=none; b=VizzhiQxqyw9ufJrhJP6xZ9tyCELvLkZQjavQMA+2gtUGa0iqUidBURNym4/2bcatZrXbBc945Z03X87ez9R45aTU6Z1DZHMQTjUXqxCP4ZNrIcHp65flK8xozmn2cScc4WnADjVAE3N8EveKRJTxo+GwzMQ452iEhdKzTLKWXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257821; c=relaxed/simple;
	bh=BUTPCdxYE0KBSr9Fr+4DkW6Crfw+tCtmVXfSMC+Z33I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSnlBn84bmwVNW2mg0C/34GgAi1su+IAF6XFoyNimqaVcQeZTafgb3j9ivxUJQ+xDZchDcFSCH02TMajtLrQnO9Lta2Zoi9+bX8JVhw7mYJwXVNY9GLJhVWtoduWUqCFawn+z/6y7xRfBINT2OXiYUzWRJ9Hg9tUB9EyqNsVf+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLebyzUa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLebyzUa"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJm7uB015930
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vaaYWPBvIHzxnTRnla3Zb3Vn
	Q4iu9qj3qxbcJAJI5CQ=; b=CLebyzUaTFAHK5pzea73BO1Vs7S5P39S5JrVgMVh
	EzzBrre5Of5EEAn2Tb/IfbwknI8g6Ar00GRkEA2JLSMWDpgbpeJP0kO1R2R37C4X
	ghfyat5MNDmBNlN5G3VdRqdf8rVU8WL6mgZ7Ax8SicF8yMwxPn7DQ+9/j+917sb+
	hN1Oa4FHKGdYE6+wMLvKFwtWdiLJtulROtQraGZA5X/Or1Ddi+K0+LLpJ/whj0Qn
	NEpvuhexLuWU10OyFxbJ1W1YLdZlwIRfZw3SCVRzw6wrQAgYqXtlHeYKfjOVGQZi
	7yDJdMUz4xI5fRFFHrI8Dy+fScc4Lhp/BJ9YAH5sA6ZXpg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmv77u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:23:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c95556f824so22898885a.2
        for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 14:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257818; x=1747862618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaaYWPBvIHzxnTRnla3Zb3VnQ4iu9qj3qxbcJAJI5CQ=;
        b=r4P0RjBAiBcWUHQO0logJZORy3sDX4iRjKuQHo98IoR85ZwvyXNNS6+6KBy5O116jn
         /PsqHoKGD0cEBf1eSS0lA2ytlcAh5BJSAs80UBgep0MbdKleOlbKwxte3HMiLnB3Biuh
         JjmCHfEcTUOfQKCvWOBSjEJLRotlYiTxXyGDWXD4PtnXOtVif2ynahKDqoaw+D7C+O66
         ZITSd950UboYDjmLy67jkHQTP8MAUdGCBJTuRBo54RyvHeWIePJl3clR6X1ZYyW1TZQ3
         VT7ofk9rp88zkVeoo37zIKykk+VGDkvVKdrg8MwJNdnN7FfSwIj76FWWRoEGK7YrFtTG
         MDlg==
X-Forwarded-Encrypted: i=1; AJvYcCXqsxISzITNcup+/xcdTyxetzbCdIL8yDrRuc+Wcq9zuDwkxr0M8mkf0w9tPRChDvWAFKT7sM/cqg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVBsJQuM5KmbJ65U4dIA61i48r2AjB0OP5kz9DIjpOip3Vp/pq
	BGgqQuSIydJYTpa7rmR6N9kBZP6CY9E69mTUeX/ZpPH1qOEBVHhY4q2qP/n/Luj3xt2mHh/iMJ6
	JXbV5kf7udSof41XObMXzSkOc2crCfhzWjAfIrIom1Ueo7lsMGnEkqJq2EJo=
X-Gm-Gg: ASbGncuKy1U7ZyLsEqBR1XrlmNHTGGDshtCscF16r1brApflD5v8N+jid5StXg8Vqwo
	QBg6ilwCBJAI/k7b8nWhEljU5w0nCqQOgOKd6SUkquq7hUQPZizrhbEmB3Gdfrrrzj2F6mKXY4s
	zKwJaY3brXnC2paFnsII3VQY5YCww5+fpGwuugFYfiI+c/AjeVf66dhOcDogIRD/MURbzqDHRB/
	SWM9QtU2U0xY/Ag3YoYbzJoUjT7tfbG3YAzhF3qnxDgRhrOqvNXFbXhDfrfQAx7TDQtuYxF7EsZ
	GkDtjma/MDnpGguzYQaXhwmRBwOYWwalssUPRhLBBNyh1ZiTzbQU4lGxwaKBQ27Rkkummz5+CIY
	=
X-Received: by 2002:a05:620a:f0e:b0:7ca:f41a:4844 with SMTP id af79cd13be357-7cd2888fad9mr834861585a.53.1747257818087;
        Wed, 14 May 2025 14:23:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKk/aEqt1gPJl+u51T5UjY95/XJdn9iYDGEHP11yzCdYiBQxpQ5KUK8fADScjUo9PVc62aHg==
X-Received: by 2002:a05:620a:f0e:b0:7ca:f41a:4844 with SMTP id af79cd13be357-7cd2888fad9mr834857285a.53.1747257817673;
        Wed, 14 May 2025 14:23:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bf8ecsm2380641e87.187.2025.05.14.14.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:23:35 -0700 (PDT)
Date: Thu, 15 May 2025 00:23:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 17/18] arm64: dts: qcom: sm8550: Additionally manage
 MXC power domain in camcc
Message-ID: <7csmi64osxghv3mkcxwfhxlwodzwvpbull36htrkmcjzngbgk4@go4wmvfvhqst>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-17-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-17-571c63297d01@quicinc.com>
X-Proofpoint-ORIG-GUID: P3KzXcDZWWXKaAtuAIrItEEE0K7lLHNm
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=682509db cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=9YvV8F1douotiZniFPIA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: P3KzXcDZWWXKaAtuAIrItEEE0K7lLHNm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5OCBTYWx0ZWRfX26uUTjhSvQ/I
 XHAPCCqTZAskD0202Be/zshV1+xqvCoD3ipgiOL9BGjzj7NiD5cj/4R/Bz0MBIXjmKjT8kmDcIi
 SMk0eH5hkZm+ndbhumqk6knmjcXRgo7bxm6UvI+AJHKmWcJi5WItCRe1MfNztFUv7ts3Q8whWzf
 uui/LERJMYzCRM1Cbphmpepvqd7BhCMWsmYzMrHnSXEY/GFBQaFZeJW62Ae1qFhVV9K5cMMBLbs
 u5G56WI2b5wdV5OtExIITB8/f08sjYWElQijpJQrlEqsu5OPenSumtqxKItxWYrFBnjPQLb66gC
 JIvFbtZdSoBnjhvcjR+YgsUvWoGKqPyl9DSAk28Zn5TccXtImsnR3C4s5GizDPSVZh7ulGZ5pK/
 FQVCIA7ZRAqB3u6vAkzg7M2bC0obZw4+cCgwyXzW+ruuZoHsxW58Qj1cbWymepRRaDSdoTZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=546 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140198

On Thu, May 15, 2025 at 12:39:02AM +0530, Jagadeesh Kona wrote:
> From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> Camcc requires both MMCX and MXC rails to be powered ON to configure
> the camera PLLs on SM8550 platform. Hence add MXC power domain to
> camcc node on SM8550. While at it, update SM8550_MMCX macro to RPMHPD_MMCX
> to align towards common macros.
> 
> Fixes: e271b59e39a6f ("arm64: dts: qcom: sm8550: Add camera clock controller")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry
