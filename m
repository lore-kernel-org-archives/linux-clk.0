Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1446311C1B
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757588968; cv=none; b=jnYXknRqdZAHyJYukBMVPagcJghJQGAz7YTscvgLsaWfQTtw708a4sVJN7JmTxRPw6bH7xwT1nOan9IxpMcMew1GJz96jEmr1jqiTmLlc6Pi5WYPpwjJqEr65JrPXKG+8DcLf5Recc/QknTRVLmkUALbrio2caMLueSc6jkW48w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757588968; c=relaxed/simple;
	bh=6+hW6PzjWDgXMyeBzEyMR/C1LLoqI3u4XGnzS7ZbQy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=citB8xoad5K+U+b2DtYjMFQF2M37RwendgeSdaxi+vdNQXHokJ6+TlIdcNxQAIJGnXD6gBakHfdJJ1iwbfcWxdPzhsjiHjD75wJ+WOh9aT9AaHy6SX0dqmmnJB5Gsz9DfGumyFVmc9k5TAm9KUEoK6fpbSIRuIEu/G2WKrv5ZCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MCo+FZed; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MCo+FZed"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BB85sN005479
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pfepPxxbAjL/Co1tZK7XBqJiEAaPkOTL9NAiSIvz4T0=; b=MCo+FZedGVKGP143
	3Dams+1DlvrflP7FZZF1qUyAOG8C98RDJBaLOSAQk4Il1cbpdi/3RpHMJYt5FC/x
	QqHtj3GFSej9AhzW5YTGBP58cfgf3HFrHY5tfbLsEFiXfCfG3NfOFc5Cy5ScrCpa
	wBX6YZy2NDdbPb37fhDPQXtrkx2VrYI/V7rzfH9GfDqhZSQY4dZa2OgRvtz4D0mA
	rALaeP6Rctzjdl7zsCmTyMLhQLxb9VwbUzad89LbeftwTZL7zi/B3DFhhfW41Jc1
	50E4r3so44xW0zT6LOBBncG96+fVfIhYMXDaKB1eQNiuQg6uth4bZTt1GA6QYczW
	LhYEGQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2bds6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:09:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b54a2ab0f2aso395378a12.1
        for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 04:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757588964; x=1758193764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfepPxxbAjL/Co1tZK7XBqJiEAaPkOTL9NAiSIvz4T0=;
        b=dieDlGil90Rp+WvoPYSZGIydZA2Q501SMHy1p1Zivddor3NBogEFuw2VbkFf/QmFNY
         Ap/iNdZHkFvf6p4CjHDbpnho2uNrmXPGbUV79tstImuy8v1lDAZPGQavCR8iWpr03t2j
         beloJOL/NcD0wEXkiBEB/Y9vADLCgCAw5Y1s4W8Qw2LhbggU8yqbT9ngHEQyTYM8MXzy
         XPQM2d1zlmx7ll8H1Swlt2L1QYaNdqAuWkZH32IIB9IIvMuMJXg07625eRF5It8tTjEa
         mAm77n69IMFhklgtQswo4e0YykRyV202xPhI/m/hEalaKxBBydtYwBdCMDNeGqn1XCsU
         09tg==
X-Forwarded-Encrypted: i=1; AJvYcCW2Dxe9/OFt+Tezvjeqf/Yy9kYKU9P6TdtHOcIEW15SUs52LN/X7RLKSc1W0J8fIBH4RET78rnLUDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEjNLld3ROR/7MFqBOX+sIMCggbDdfvc6rpBfCGiO77o0E/wWz
	hDU95h9d7DH2IAHeJPtpN54fiOICN1xJ/aTMCgSTBE6LYp8WuELXaPVjb39zUMlfrhrm1aSXeXL
	RIExypx68h8TUc8s6nA0sVsETTtaZpXxYNfOYQ/UW+dn8zRM5hxA2lMVRqM2vcJk=
X-Gm-Gg: ASbGncviGje8aIrI/gyak2/fTw+4GwuUl7/qldJKozuUmpJtXWNWznNobyFD3WO1cW1
	1xLs8ChNOHJLQG9mzTClJzyLRP0CDwiI7GAOuCiugMJJ5jeajubs2Y9xycRbAAYSn3hQHjaGEiD
	+vLR0WJ5YcHsmr4+4XnPyMnZwBFPhZ05/j/BEBlQhA2Y7GhtHlzjOyy3VJ3rN7ppVG93Tm/TG4T
	k2cHCvWfvu9t3lGbbO5xGIFfBqnfy1O9ExVqUdqeXBfV3jnJuAuS5wVJkeuD0u1tPyPuq+ykYzC
	XqhlMJr/Gspcr7mO6tDFTCeSc9gn2EvZVZt3h5Pea1mGFw3ltqFcQIxnDjbcmJ7cHMGg7CY=
X-Received: by 2002:a05:6a20:1193:b0:243:78a:82d0 with SMTP id adf61e73a8af0-25d0a7d6262mr2250234637.29.1757588964135;
        Thu, 11 Sep 2025 04:09:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1OoF2jiSdzRZIu/K+5m049r0DLrJJHS9wh1TM6nPLGURZqakjy3iuXPRDHHmzHThvM4b8Mw==
X-Received: by 2002:a05:6a20:1193:b0:243:78a:82d0 with SMTP id adf61e73a8af0-25d0a7d6262mr2250216637.29.1757588963693;
        Thu, 11 Sep 2025 04:09:23 -0700 (PDT)
Received: from [192.168.29.198] ([49.37.133.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b1917dsm1770172b3a.52.2025.09.11.04.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 04:09:23 -0700 (PDT)
Message-ID: <84345fe1-4a85-423f-b461-5e8637705f4c@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 16:39:18 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: camcc-sdm845: Specify Titan GDSC power
 domain as a parent to other
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-4-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c2ade5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=l0trHdaATao+Pp179813Xw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=N_-oEbGzrVbpv_w9NrMA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bDl2gh7CD4YY3YFIUtb9ZnRubTAEfhW-
X-Proofpoint-GUID: bDl2gh7CD4YY3YFIUtb9ZnRubTAEfhW-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX0JxBvPFbfXOt
 Dfu1p7uVmnsmGJ6F4Y0HF5i33TU7cHwARxq2UUQtSqf2Z2VmULB9pD6KAHVAk8UpTeSVXaztWEs
 10JJOgafGv5HXR6PzvLqG5gi5G67barCG7k3LHoNlvEGGlAbBvMaJElxu7/6A7dl6DkOMNiY1kb
 E7iPxP2nyZClg6hysYdwlVDfRCbLU8RRbzm0GB93eSxAiQYEDHsq9R6OgdwOX8BHVyp81dOOyF4
 JY6fyhi6hMTb4/a20ApeMIjRlvTr8M0Ijo9vWgdqkusRj5n6ATN3r4kN/5CWQM8FipHQ0yxbTaE
 E9P3JBCUUuxljQr6YxZ7rKUbNCzaPnZzxbKI+TrcEADK2gz/SgpcHA+FiXDOXijovKYUS0k9HUN
 8QDTbwtA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094



On 9/11/2025 6:42 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SDM845 camera clock controller, and it should include
> IPE0/1 and BPS ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sdm845.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
