Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA8C261393
	for <linux-clk@vger.kernel.org>; Thu, 31 Jul 2025 20:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753993897; cv=none; b=awQZ11J4a1efu3wC3Ny/VEhpz4idLROJMWG6wtLxGckLvuhanK4znASdqYr9UDmwdWSYUcARciWl8AiOjuwoqEYTfowEiR9NUqcJaCVOjUm4MwptdRmOV0IBHRFhCrt1y5i3LL4kfEGGeTEzEHbyKPuIJ69X2c7IQ9c5cC1pw9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753993897; c=relaxed/simple;
	bh=xTvLJuW/ApOSDzwWfLExf2bQhoNe2yXXWNBZO3mi21g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/1JhpzLoVWhVeT7Wa6633GC3Jwngaf6Oh6zjrFjzXj+6Maa/TlqR+vjAyVgfp78R6yFBXDr4qBgdWIMZKmz5nZg/4iZHist8CfGxGC/tGdeEIEIRfyrBZpkLb6giEW+DgbnObdZNgpYKbsAOLfzM3SACzObtdGpxiOeTzu/EFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fZL82j+C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fZL82j+C"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56VDffjA010230
	for <linux-clk@vger.kernel.org>; Thu, 31 Jul 2025 20:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QoS+iD8VaUIgyzaqV2nW/wnh
	QVOn+KPVj5CIZuJUF/A=; b=fZL82j+Ci6kud5KtKv4vtcFoXel+2g4Crv6XPIQQ
	N/jcSiuABaqZxlEt4ogI3mtZKAo0tflGcZW6nb8S0IUHClc6hBafk7MBzpYl7IZ/
	McjEmYuaQ8xG7QcEwii7+KBVPtWPidFn+n0CpufnoAOBhTjOjEisdPmxe/o4FTjT
	RQUyLX4voRfXUmK1CBAha9vUH4alBgnMxML8cm8JS0OJSbJfgew9kRTMb3mQm/kb
	MFRqRrAf9+SFX+1hHUsL9fEbFU5N+UEd8bdFEeERDI/oqm9SPYBFcEaYZvkB8s4a
	U5OM/43kz92D66QO3m9JidUD53JmQ5WrWC9bn69P29/Bhg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4860ep6pmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 31 Jul 2025 20:31:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab44642abeso2367961cf.1
        for <linux-clk@vger.kernel.org>; Thu, 31 Jul 2025 13:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753993894; x=1754598694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoS+iD8VaUIgyzaqV2nW/wnhQVOn+KPVj5CIZuJUF/A=;
        b=CQo1Hh+kdOrNXKWVQGuYzwS/9QutCskp47rvnaiM88+kpCl1aLJT5dGF4tbTMzq7MW
         Q1rniHS5fAjOuGx6zGX5nhTFngrhbr896eJfgfJU0VAt0TH4Kg106Odde6CrXRxC0dzJ
         UblNYxoQVnAPYqcTJIcoxYlxwBb1udGEq1floSH4wBKjFrPgZh/pfLPwctJuiwzAFkww
         im8g9bZSGEJo4kVdKfJww6UTYoOTf87fU8H0V+rRGbX9vpOR44fxsUP2Xxm6NdYYrSfz
         gENFDAjlhcYiYrfl039iJvk5K5X7H20AoVhm0InHM5FNgGQuKnrSMMbvXjV+59e57MgD
         18yg==
X-Forwarded-Encrypted: i=1; AJvYcCVJpwI0F7WFhxrkZfP3wBHTZqahEkKBzojEnF7c7kFDs/ome6iCnk5KiyD0ka8MQsH1TYgnKonIQ9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP5khzEaHFh1gizUn76OxvwMBfopdIeue74TjBC8tiYbVdFcbg
	WER84SYPDz5QsmMlbc0/beYVf/3jdCqJQRGshZj1G5zmHLbhUMayqVMTOSTLLZX9JHC3wdtpCeK
	8pFlFK+vHkFJ0AaHdh7DIJBGYQPmBHwi9ARjZCbMITGiF9Eqo7/MQtMtAg6pO73Y=
X-Gm-Gg: ASbGnctzPFhYRx8toOIjQk4W+/3XatV5h8edTjDRdZJsZV+iVp24XvhYWNoYgA2a82F
	zYobFXNHdMDYJTRiHgJ0xin7s2mA+y/yKBntsa9wFq0DKc2yTrYk+wqUcZark40WaKKpIEAGAz4
	R+skO4pI2MiY7Q3uS3Q6edQLqFLfpTpDWW02rpxy/Lgls3NoF9sahW2XVXXmo1dhH1moAuAIx0f
	7P/YYXL69uUEyHe5WDDNWiRiypztxB8Zp4vs58XYQLOWYGhIIy5uXUmgHAVN8Jki1BiwG0BUT50
	T9YXBbrn8bBklnvcdUBf9QpZEFRtBDnVwWY1j/RItBPPj7RMQFKGdigVFf+Qt4dpeArF1etVOyG
	+pT7EG2va/Wp7TJhf6eG7afCZsg0/kbOVpODuIHUisVsS734fx3CK
X-Received: by 2002:ac8:5fc4:0:b0:4ab:3b8b:9ef9 with SMTP id d75a77b69052e-4aedbc469cbmr126720321cf.29.1753993893954;
        Thu, 31 Jul 2025 13:31:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjG4KR8sIlrrwmey+SYNZ6lZ4mSTtNpoyvhRvxc6f1Wla9QXCimOwryXTNV23PvNWNId87eg==
X-Received: by 2002:ac8:5fc4:0:b0:4ab:3b8b:9ef9 with SMTP id d75a77b69052e-4aedbc469cbmr126719751cf.29.1753993893446;
        Thu, 31 Jul 2025 13:31:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a81d2sm348386e87.59.2025.07.31.13.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 13:31:32 -0700 (PDT)
Date: Thu, 31 Jul 2025 23:31:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Andy Gross <andy.gross@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 02/24] pmdomain: qcom: rpmhpd: Add MXC to SC8280XP
Message-ID: <vebgxvaxfuohpy2ilwzquupezzg2obaekylk7kaiyroosrelx7@dzd2f6bpgkmi>
References: <20250728-topic-gpucc_power_plumbing-v1-0-09c2480fe3e6@oss.qualcomm.com>
 <20250728-topic-gpucc_power_plumbing-v1-2-09c2480fe3e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728-topic-gpucc_power_plumbing-v1-2-09c2480fe3e6@oss.qualcomm.com>
X-Proofpoint-GUID: Gkrhxl2ro0RgTEOKwwFmiA7zlSc0T_X4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDE0NyBTYWx0ZWRfX8dRGrH+W09Ey
 5fLrxsdrgVhGP08HDPRpVWtJx3Zq0FOgmRkFhP1yDxd01zAR+w5VEQKUWE6OvwclwvnEV0rEajL
 nYp5aHyYHVff0BfiC2ijO2NvA7X/1x/RV3eWbW/KLVAv1+PwL7jb/yGwjaubbHhPI5y8yZlF4RN
 ASGswOFuwona22hQvjgS+7NPAg6CRQ7uqjfXwUnYWsG7/n/PSH+l2LY6u01upUDk06H0+ntZLuJ
 LOnmcqkDKYx+WMyDCGXV7kZq5GUVS3JUSXgcSFh342+BtfibOvqays+tBVX1a7aPJ8Z1rt+xKPg
 MYOaXguykV0Mj7i2BYGzzas6s1aSmKUXlW67Th43GGoB8PLvAjetoJMu6TvFnTcjtIXtpAm5PKH
 /3lfUQ/d+/eraqABldB+Op/MDpA3VIoCiWT0ILyOq6I01Do4/l9+5OhHPH0PBNeRs09lW3+G
X-Authority-Analysis: v=2.4 cv=DIWP4zNb c=1 sm=1 tr=0 ts=688bd2a7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KHzq8nhu3g8-aHLh-moA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Gkrhxl2ro0RgTEOKwwFmiA7zlSc0T_X4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_04,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=917
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507310147

On Mon, Jul 28, 2025 at 06:16:02PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This was apparently accounted for in dt-bindings, but never made its
> way into the driver.
> 
> Fix it for SC8280XP and its VDD_GFX-less cousin, SA8540P.
> 
> Fixes: f68f1cb3437d ("soc: qcom: rpmhpd: add sc8280xp & sa8540p rpmh power-domains")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
