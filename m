Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3400721E091
	for <linux-clk@vger.kernel.org>; Tue,  9 Dec 2025 15:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765293292; cv=none; b=oMSMR4xjP0R1QvrDaZ9vwEb4vt5+yGnfD4sb3l1O2qqnhqj2R7+VK6W64A+OCySk3FrDYylP9GyfRLUXlKeEmG1vFPdL6bLq11wszypl2O+lT5064rEGilwPTyMRYQQINBZ6lzUr1TPoMTmY6aQy2j7hZjenZxZwDoazfqGSQYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765293292; c=relaxed/simple;
	bh=qAGe2O2qpy6ZBSJ4NW8hsCBg9Hedo84B/WVPGhj/+vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsJC9Hzq5DWovpDNmS6MepHAdnFb/XvDCbih77YtDJK1/sQZ7obVPR7s8T5D6sBhncZwmKQ0pvM1tRg/OTg4tSsUr/767VFS5n2EXdVl/WmkR/qWkZneYl/kH+6LpCZD05710kX4aJ330j7cnQhaZVJgxTU4MIqgiPKhm8w/+7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=knpCpBwO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DPbEufWx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="knpCpBwO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DPbEufWx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9F9Fdv030050
	for <linux-clk@vger.kernel.org>; Tue, 9 Dec 2025 15:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ozMgZZzoOlMa9Tq6myF/RZJR
	lUgb3Mcu/KMxieUEEik=; b=knpCpBwOhSIbGOWjFPqvig7foVKNvjLerAvrk9zi
	AsKnV2g8ZvjVbATe7sr/VQhGGFCmeKM9Yk8YmXok4drMK/3ZhikuMqylnKMSTQsD
	x5X94GgQmfNYp0mWYtp/7sYBAIZqt/Hu/a16v6NB0NTPnt/mrRvvgdgNwWLAWsWs
	2Uh/MfpjpOtyLg6fRqqzzU7cHUGGIFYR7QPrXf1syrb9sjkxiWrrUuwK55iTYQyA
	aVOtAr1pzRAlaz4j5DWLPd9U2vt6u56PmlTq0FnfmTNnMHE9rV0Fzfes4Ivs6vjz
	zUd/8a5t5cB4bvt79VHDS5QErEg3mDBh+2eBTRbeaAv/Rg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp5p00tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Dec 2025 15:14:49 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-55b16794625so2858119e0c.2
        for <linux-clk@vger.kernel.org>; Tue, 09 Dec 2025 07:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765293289; x=1765898089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ozMgZZzoOlMa9Tq6myF/RZJRlUgb3Mcu/KMxieUEEik=;
        b=DPbEufWxoJp0slGZi64/1dSabMwXQeLAOevOq984XH/xGT6M9TjLucosxh+x7jnj/2
         oSegH76jOs2hWSM5RFSBFFblcs+sjhZq4PpElEUiRMo/pPHUBN3aSF8w+uQQryC3NWPZ
         4uT3NWAVD0BeRGPO/ZYmU5QO9VHJKHHsnvF389ChOQ4q6YkUUAc8kIEzlUZQjf4J6fzJ
         4G1YG9hWBYqeiyEO9IZJmL1yw04U0Bvf0hWahM4qMscEWXJxlfEI5IyEF2RKis4CMJIK
         sD4+kESmTKimGM/IycY7gATxeRKQTCs6dQ0TVsqJkXSZ8n/A7iXzutTpmyStzBLZD++7
         Sfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765293289; x=1765898089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozMgZZzoOlMa9Tq6myF/RZJRlUgb3Mcu/KMxieUEEik=;
        b=BGwPGpV/sJg1t9oCCET4OX05tUylM3AR+DosAM8fWJ13xRAzH+D/YSP2vb3TTptSNM
         YWEE8xxog+YfYG5xcvnrRIPrAKhz6SFyATSzOjPMaB+LuYZ2fwhj1ZP550kEHHIdSwdN
         VsxselOeq0EQVc8IEjBIBarZXOW+B/oOs80iUSOMdb40d9Ipw2S/tf8u0c4Uy67mpYqX
         //Eo3c1ZtZg1uSuqWfIzu4Z9d9kM/Kud8Hb0VmK0m3Ee36FgLNZ28y83bL1lKKqbaYXq
         aeKtpGxz6dIZGIzGEb629QOhbxHGs52vC32sTXnRB6NlXqgc/gwlhTmrC2R+NFTRnE9c
         piNg==
X-Forwarded-Encrypted: i=1; AJvYcCXYqi1xrrfhcRF1nQoccqqW7uwY8pmKSWbtmVIVy28iR9yUo5e2AiFmvZSQhdBjlNv71Z33naDH4qc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSq8AKG9R0HkrhYNOTcs1zMg/LOGr+u6f0lDRr3fJlI/1cR7IJ
	OvicA6jc6enHx0hrlwHQpcavVUd6KdP0PPIwYLnXuW79nCDWVsSMDr6bNCbh7Zh5mI2NT6UYzv3
	Qr2X4K0QDYPMLdESufMHpYa1qlMBu9ve5e9HsQzEK7m5gNYZ/Y5GcvEV/oAuEMSQ=
X-Gm-Gg: ASbGncvN+g8WD7h4kSTpQ+MTlBR66cZIpqVU/nPofs9b8ImNYsxockzOtG4LSaAdiLa
	ucFRUnARa2jvGkngtircJR2F0F1BiKNXnElzQeTkMbscxAPlgZGEcepwaHeAwSt2iySg6ActREN
	ZiFIs6wXUkBBCVn+cES6rQHOCHolZyaAmzO+HfeD4Kyb9Rp3GtJxK1Mghceme8CDJ620S7UtqRP
	Yx5ZTIfMeBlAhA8guTeqUy9kIRBaEGmqtjGkNRuP4Q2987wnIQZmZpDZVfE7pN75MhUESOCNWHy
	qedoiVtskw+zMuNnTmi71GSycHGIqaoAvyV11CtyX5JTWTOu4/89NcalmKK1dGHwtKvYwN197z9
	PQ2qFpyQe3WGsGY/NtLSPPzM15nElfXQ+KO0VBkJr5gTEN53ZkTI4aLir6Iee96KQv0o0udgs9n
	8P+aoEC6IO5Lmw2HJl6Qy2iu4=
X-Received: by 2002:a05:6122:1799:b0:55b:74ac:72cf with SMTP id 71dfb90a1353d-55e846d530emr2938581e0c.17.1765293288919;
        Tue, 09 Dec 2025 07:14:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9M8JZbVA1dMV/09RyxqBOyLUyWQsBdcFok11K77e8eS19RHj0RBdHTeZO0gCwNRV+kTSK6w==
X-Received: by 2002:a05:6122:1799:b0:55b:74ac:72cf with SMTP id 71dfb90a1353d-55e846d530emr2938564e0c.17.1765293288414;
        Tue, 09 Dec 2025 07:14:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597dfc536e8sm3629912e87.7.2025.12.09.07.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:14:47 -0800 (PST)
Date: Tue, 9 Dec 2025 17:14:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/4] clk: qcom: rpmh: Update the clock suffix for
 Glymur
Message-ID: <fece6e6hun7a5kikkronyzphrdbrl7owimeomrhddt4zluqkld@cixvhiht6xy7>
References: <20251209-gcc_kaanapali-v3-v5-0-3af118262289@oss.qualcomm.com>
 <20251209-gcc_kaanapali-v3-v5-1-3af118262289@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209-gcc_kaanapali-v3-v5-1-3af118262289@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8dxlYgCuMXbt355pDveCz4wNDfZMTwQY
X-Authority-Analysis: v=2.4 cv=ZZYQ98VA c=1 sm=1 tr=0 ts=69383ce9 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ytHSg5rVBPlbEvibhtIA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDExMiBTYWx0ZWRfX3VJ/5BRz/NBK
 daLKJVSqeq2+cPYdLl2kxakuei757MaBEIwFBZG3l3yNXd3EbnAAb3p5qvUlmqI5fDwNMpP3sNq
 uIjmJoIPwCVLUw9dVXq9qo82d1B2TN2jue9EIYDdSqh/z/AzCrAeL3WvIxQKf3w0WpF66wDHIIj
 vUcP+YOEKQgWBTSH2OZ7VgHv2oRQ1UqGLLjZsfAR+wVrUmDSnimr38+RA8W+hFiAzYE1/Oe+plV
 5117IXuiJzRXI1UVJSuJx1FIGol2oR6a0UCsvrqoGkz4FEfwzTpN9A54OZF/3uo6vVmrflDQMm4
 KooZXgLcmvQxsDpdG3Q9lmSUjzRiU9FQ4fu1Iz1/AxbZavtKgfHPnUBsfsiy4yEfJualKjrq05i
 I+CFJxGx8STNAhLZusa4ThxnQ54YNQ==
X-Proofpoint-GUID: 8dxlYgCuMXbt355pDveCz4wNDfZMTwQY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090112

On Tue, Dec 09, 2025 at 02:19:24PM +0530, Taniya Das wrote:
> The current RPMh VRM clock definitions do not accurately represent the
> hardware mapping of these clocks. While there is no functional impact,
> this update aligns the definitions with the hardware convention by adding
> the appropriate suffix to indicate the clock divider and the E0 variant
> for the C3A_E0, C4A_E0, C5A_E0, and C8A_E0 resources on Glymur.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
