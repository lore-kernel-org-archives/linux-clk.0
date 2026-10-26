Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027085;
	b=vktw6fZceSRpkHlb7wcuXAbFabyOGWi0KA3gYoW3/SZtQIFh1EMLfKF8aYjpQ0a18iL1
	 aMqnYRsyMe4lCg6UMbTw98rCUSzYFs5S+3apf+XH6bsSkKwKm3/eR3sBqmCVxzm3CYEcD
	 Vb5V7NYcYJSOwhP7HujGPp8dbB98C0Ye8j+x7ZanF9tQ2bMikA1aqJ8jXXmVSsbZC+I6a
	 5GtcyIB9QJS+Vy7uFoAoHXkGzwbDYs2wLDa+RYM3K/P6mt1mbT79aT6BktlFlCcevXLAT
	 oZ5nxZinzjKJDOEZXcDQy4Gk6qLrR1SJlF8RVALxW02G8no1LR672RpjII3jgMtl9Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GcaOJI2AGlsc/iw3sTAv3zZNex+qopC3DMZYd+jAZ68=;
	b=TgtNAbY/8arZpE9MGY3r73Pp5d5MJGGU2xAwZ9U+aN2Iqr3bd2rQw6HhTR1QbWszzgHD
	 G2nSu5hksoPcrwEYvDEuzzJ6kC7V1IGPCiLq5G/XsRstpSal7HXzdOvg04rjc9moo86GA
	 TmsbjQilXbteULtRLII7QSQY5Rs6X+Ax05fo8Y/IQ61XU3IEEAaSRlY0OetbMOqMwuOvT
	 67/S0ZVh6sq+R2W0eTpQZPvUJB1frmq9POfGxUfUdtgkD4k0JawAkIs2PAFNdh0Ubl00C
	 rnPJa5lt7YNLbuMXRZDOn2H1FxZ+9WW7heeHAODgBnShYeMSBHXCCzp/r1cdBH+IiBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wp+k3qrI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VjmFmoeX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6794606A320
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 15:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6794606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wp+k3qrI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VjmFmoeX
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvrBm3268491
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 15:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GcaOJI2AGlsc/iw3sTAv3zZN
	ex+qopC3DMZYd+jAZ68=; b=Wp+k3qrIh+YaEOH3QJzYJFTiZ7PA6rrOlmzaK3Om
	g0UQtEA9Q2m329GTlC66MyOtkGxhNan8rDYhGD29qFbh3ruypWMjsWZkeB7N4V25
	PVDGMXx2FRX7zkhbe8g03lJrugJOSeokhLe+NQBkLkKWvh6ZTmhF7FVg3oz15MSe
	s4rzCO9TKJi4nRt5HmUeuZ0tN6IDkXvxQuJo4rmVXIu9B2t9f8HzvWqepL8RoPto
	DKIgDkFd4WL6Tpxvo9UD7qZ+fgYSJgdY2NTb/3SDs4Fl3wdAx9GD+VF+JXynZlfz
	97b/FgepqeH7Za/Ssajp0IW3600ju/57XVxoaytBKsXkCg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp98j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 15:04:42 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf3a0a498fso2906660137.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 08:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027082; x=1793631882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcaOJI2AGlsc/iw3sTAv3zZNex+qopC3DMZYd+jAZ68=;
        b=VjmFmoeX1gIg3U1SLoYXjP5pHsJIadjcDDRtukuCP6P7oLFt001C33ZLvqCA8ksUhf
         X4UITAixns5Ghdpj0oQokP/6kCyKxEIZC3St0NjOjOIN2QELdAddve6BGdE6HyhKF0dY
         lr/lLKpMIp4CvVmBWWByaoja0GfjFgFFuJBBtCHdX7hr1CIM8j135sK0lks7TnKhEs0U
         4pPaf6UKbdaSFLezt3uRO0yR9FX+3eETUKaZgV+5qJ7Hh8MPTN1DXQxk+jSIxx0bjvpt
         zAX+WUssAVM2kKHFHv82pedZPd6dUXhXzZP7eYkFPrBiccc+Q22zIR2CU3RSAcpHYBf6
         GmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027082; x=1793631882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcaOJI2AGlsc/iw3sTAv3zZNex+qopC3DMZYd+jAZ68=;
        b=LSNtQ4a0mDOTf0AHWNdUBjtQwiTlaiXSDLQLtsNp6MzChDZS1F7c5Vzi0LyvLTNbwo
         iCqopnrCFSotUjIMCGUn74+Zn23O4bjX3Ule8dG6dPy7gkVaYtX2/OdvGS2kydcYbkeF
         i71SNOaKASrzwD4pSP1TEpzH6eiFHVp5eYBG6CY7dLp3y4Dszjn8Q2pdFUy+ZiAVtads
         0nFQ1JOaMtJlrHzi+fsVjmlHXqXAKpngV2YgTb/PakXWeAsk3FKSpBxCbOkIBDvMWq7i
         Rr820oFt0mwsi0cHY7vWlZ/ix1ozjyzILbk7sAtzhLytFFzJnmhkDUukgF1uHVX8JXR2
         ii0A==
X-Forwarded-Encrypted: i=1; AKwUvBwDnUNGC72BOKbXvO1u2QfSu6k8pCRi9xnZZIvqLPMbA/JnSh5ljMS06T2Dc73YEt3mo1iDwACh0FU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjiPBkwvxZ+q9IL4YN+xRjdL5v8QLjeqOKXEqeXAQhoqVWh8Qu
	PJY+tBF3vOPFucg97YQABBT57r7F3I5FvCSbgnZgb+z1lEvSs1iEA5OEx4g/CoDQ7/zvWU6XFmo
	qw5/PN1h1PIGOOq2sFtznptUCTWwKRKbJw7xqvDv1PtyIcCL/1G5fAcWZ0n1eFdw=
X-Gm-Gg: AYBFou2urwn4hJSylg+n1OsS4zrDXA2PsX8KiGUrhTPkOQbRcGJvG+pjlD+Zgyt5txl
	IGUuIQsf4kWfvVH8+eWUL3XCKUzsVx3B8RAwyxcetPPeNsBLdmwhP04teCyIh6a2YS5SD5/xgpg
	gpJTtfhOTahawdthD8uPo3LIcjekKJEVuO7cyg5uIOY+ctCEZO5XqhiR1aKTOqwNWbpD2x9CvkT
	GhQ69FQNFRsx9PfOe/5YK9VF4IWI4yX2EDc89BlCvmkspKcv6d21H0vwWHDVx28P5oGlilVQH9t
	sgRTvhqd3cr9kdZ/NA0OnoGvrxF044ttfcMwhWROJ1tBgJnROujM4E3YXPJf1FP3pMgKEMgI9sI
	8HShy/+/3GYLsNBEM
X-Received: by 2002:a05:6102:1a1a:b0:7cc:a4b:b0e3 with SMTP id ada2fe7eead31-7ce5ccd81admr1188362137.13.1793027082088;
        Mon, 26 Oct 2026 08:04:42 -0700 (PDT)
X-Received: by 2002:a05:6102:1a1a:b0:7cc:a4b:b0e3 with SMTP id ada2fe7eead31-7ce5ccd81admr1188337137.13.1793027081345;
        Mon, 26 Oct 2026 08:04:41 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5698f1sm200370845e9.8.2026.10.26.08.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:04:39 -0700 (PDT)
Date: Mon, 26 Oct 2026 17:04:38 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 04/12] clk: qcom: gcc: Add configurable PDM XO4 div
 clocks across targets
Message-ID: <2zv6vf3kvlb2k5oopypae6fby72ykqyg4pb7mgiomzyptolez3@namz2jhghdgz>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-4-ff8e4bc8d567@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-4-ff8e4bc8d567@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfX9Dw8Zba2ooZK
 lIR1612g94huCr1Iv+NyRc6W4P1NCt7yLDw7J5jrtRlUe+e6sAcRejN5LeHTWtumUw3/aLVr85F
 PXcYetbc/xS3HrQDd8QW1L6TuSO+SYDvTRAHDD2xF+FqsttKYSqLa8wIqy4dcdBELaElve0fKOw
 Ext+FMaQrJ1p4+c7gdl6qmdYgJGY5zZFZrAtEfT5hzQqRrSYdWMNeFsPI3btxRQHDNfKKR4RMeC
 Kdef4CQMaK8d1yu+BTFhsFyaAdNrvc1ntCRQlkg1GeK2j0le+U47afk9WqTFmXNW2KOb8au/+LC
 9oRiVI1qT0CQy8+0Lu4XoRNSsWu1m4aEG+HnmX4SVIiVyXYYe859EcRAFwTKful4K824wohqXqe
 lVdQVg/il+lCrFG+fBU9qemW84vyFbMN8Hi7PdNJhtJRN+5GafWxQkXLlkgJprey8R9ZmMgHDVK
 JlLx978oIgv1Ulw2O1Q==
X-Proofpoint-GUID: AmluRll41FMzAXon35Mz2xLDnv-58WiP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfX8STR1bPBdgj7
 +3COGDFb84eDbr5zkknerZx4Jwo+eNdL7/Cf6O5a9lDK/jW9sL/UJgESJ5qAoj54rRn7/yDcggQ
 yXzfG2dDcc+46Q7bxFDbMTOGa3COaXA=
X-Proofpoint-ORIG-GUID: AmluRll41FMzAXon35Mz2xLDnv-58WiP
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf6c0a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=X4WHrBvVKYo2O6Nn5h4A:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260059

On 26-10-26 16:59:30, Taniya Das wrote:
> Add PDM XO4 divider clocks and make the PDM XO4 branches propagate rate
> requests to them on QCS615, QCS8300, SA8775P, and SC7280. This lets
> GP_MND select the supported PDM source clock rates.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
