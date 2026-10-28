Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192737;
	b=R3rppMnFcTXo7xZjghwklkNuAfOL4S2bnOJSibTvRzTQNxtdfExzxt16rCIbgVd8Rtit
	 aOwpobvSl4ZtCeZouQ0/uPD3hFdqPQFfUjzd7HXj8BLuCNdrShmrQif9kay6u7P897CN9
	 aaqsyrpqr1OR9DV6NNsPhfKeWwetxA44BaYJyV18nwYdhjNVNbKPenaAYt9/V1XCor/3j
	 9ZDh8lC3fqLY6N26z09j3VbnV4UljPAV9sAyw+rF/ShAZBybg5x68+lAY6S9X4kpZ8HVC
	 3V8K4fAU5DV59TaV8CHQF3iYSrz6odudnyzHQbOjnB2fSQ6nngqlLO9cpHJ4N0AxErA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DqO/Jzm+FddunCZO8r9oEWKbz1HwGRnAs133LwKnia4=;
	b=P5TIFvYUC+lut2TMgVMDpnO3Z69qdZ6e/FqxOqDAD7uNGxLfVGjuhS/DcIPv6MPWutSb
	 Gr7+aNj8/2V/cT2R/+pFkthixZVPBBIRZXrdHbeqWBeYPBx+pANX3k1FZyKn+A2Zg/bd6
	 UEbIQNZsSOPTy4319Euyg6nup84etdV3wJeQrBKFMBjgOpE7StTIpy90TqQScC4XcG2/2
	 Pznd6gHzV0OqnQlaabBL5iocjZMf2vBZgDV5+V0V5ZMUhmjEu+EV83iG9IwHHzEQRTliu
	 N5xFSSJU3o2z3kfvhcI+dtIXsaminCQsPrQVKnjSVhX+ixx+DEMNSqiILpOnavNUzXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o2nizMZ5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WL0Dz8Wc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BD7606A321
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 13:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5BD7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o2nizMZ5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WL0Dz8Wc
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdwNE1011839
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 13:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DqO/Jzm+FddunCZO8r9oEWKbz1HwGRnAs133LwKnia4=; b=o2nizMZ5eU4sccxm
	69Zzcq77ESHaWV2GKCTtroabump9QnRbs4TD3zNMeRCvTmiVPPbZMeVmgzyvHOxS
	rLJ16Yq1gxlEs9H2t/7W8WmtsrC1EzYPH1IQJvJce90i+b0XvBFYELU0yZW61lSA
	qUNWoQUjeAC1q6HQtAsgS3JAdQgEKuMLa+BaKYoplaNAErH0Doh7UdV0Ks9471UL
	GWmd8MF0mc0vauz9s/M6JCBqr30zyFXrO5bCD4YHmtGsX4kb8fE8EiYs9TnXQ2i7
	V4XjQoFYhRglHLZEmYBkitbfYSdpqTPoXTJ0OM2bxTLpGPd5QAREzbct9XYC8+DX
	58+GVQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehgh7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 13:05:34 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eabddbb650so34044e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 06:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793192734; x=1793797534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DqO/Jzm+FddunCZO8r9oEWKbz1HwGRnAs133LwKnia4=;
        b=WL0Dz8WcjyVRcZD75T58BfWqCOvMQ31JdAJO36QGp6utB8pzTtsXhXqIU2F+7wUoii
         CT2Y6Hi9YAe4jVfASOWxOG43xWlX2FJYD3ijEVD6Q6KeszLsxLfmLT/yR1jCvjjtgagK
         65o7xk6Wy8/gdHj2FBVrN+FSHjnksXYudNECm3sR3B5pxXdDbknSh0plYXgnYpI6+h8S
         F3+MjobShvwvUBVOMYLVGSmIM0UguwbEspPpAuJINxARERt6Dy5KuYuohGGrVtzMAIOE
         HUQYQkj8abeczFpOLgcZhPLbrdfre7/ME5Cp8ZUvbhd6wG4SNQKIRsKzkhUm10OOL3NV
         3dIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192734; x=1793797534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DqO/Jzm+FddunCZO8r9oEWKbz1HwGRnAs133LwKnia4=;
        b=YD9bQSjT2lC/7OIgAVtJw3ToCFYwdpsZdkA4QLs73AYMpuclEt5lXUug1jcD7XHNB1
         4z1fHLhD9NTPWGOQ4FNCwfDOf9kUVoTekq9R1sJSLVjXg66zT30mUaF2rO66Mty8XVh3
         WPMrtgTRh1X5D2KLRlnvovqTd9E+qhRrENDSHGbzEdrutN8Ri9LsIzZHcAydivb/RZjE
         ROlTVFqRUV/eTQ66a5enxx/wGAc6Z58WCXGqQEt1sTd/tHJxlQdFe8Cz05E0eUxs7gJd
         Cvu4EoGliVI9g61N74CsYFC2YI+qcHzk+CZAyYAoKdSrligvHxDsjhdh0NJaVsmYE24R
         3/jw==
X-Forwarded-Encrypted: i=1; AKwUvBx6iyYYa9krFFzBUZV+hV4kkXQjwCH9BImwwhm0+UcZo+8zeP18jAhOntZVuFW9S+Rbzw1r3nQbrnI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKhUrr/oja6X9fsN6/Zh3tL/A/ON16Y4Qdu3DZA9JQABh9XUYB
	apkljuOaQ6KfXwAEEij+OSJLJfTfP//XJ5w8RWALtNPWs8iTm/di3pIsepAep38tLq3y0VPYt3O
	Sjgag9h/YzZW1RSlCBPnJmAwRTo9wGJs5CsbCUjQkFCF+WfcrRzgM5DX9m++kcmA=
X-Gm-Gg: AYBFou38uIqozEqMhBQK5jit86jm3fBGCoHoGP+w0639WudJoluyrliGBC3CC6ZWdPL
	ts0nqbv1JDG//KSlQ1coyEVcy8yOsr0EmLWwkwLX4RBPrGJ9lagSnay0hFD5a6r62jw9/NDQMfT
	vOQ8PnQ1AsSGKF+yQaYtINWrN81/fzwccCxf4Q6MnJ+E6c7SJABsSqjLb7YzD1vwLrqe8vwXESq
	IYfidx/M2g975QxbqrJD82Yu3qHNWAybl+l9Vozzm4p/W1fAjzUkXTPoVlf3MX9wTfulkysbTIu
	YCjyETyAi2MbAkOg3CWQwn13uaYdPwAwV+2afyRWqgDHDjkWZ7yfPIdLuQTsNrwekqX5CxOTAXS
	8SB6FrKocIglZtWvYLN4NiYAVyaLnHBSWShfk/s2SmB/+SLbzFjInHbM0DdDFrSSXn9MVZgI=
X-Received: by 2002:a05:6122:698:b0:5ea:cc1d:173e with SMTP id 71dfb90a1353d-5ec4caa5fd2mr814517e0c.1.1793192734192;
        Wed, 28 Oct 2026 06:05:34 -0700 (PDT)
X-Received: by 2002:a05:6122:698:b0:5ea:cc1d:173e with SMTP id 71dfb90a1353d-5ec4caa5fd2mr814465e0c.1.1793192733616;
        Wed, 28 Oct 2026 06:05:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f465sm596617966b.8.2026.10.28.06.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:05:32 -0700 (PDT)
Message-ID: <8156127f-a20f-4152-8b3c-cada25a21dd7@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:05:29 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
 <20261027-nords_dprx-v3-4-5d98b2c6c263@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-nords_dprx-v3-4-5d98b2c6c263@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX7tJn/6dBAw8S
 AhdpsX/frSMHFeroq/4q2RyPyOBdsYoGmPoKoDV8+U18jfN7l5t/Wg9CF6xJmHXs+XMA3HGsw9+
 emLQ3QQBWloknn92edmYJGsmyInYvhxGYSZ6lS8c/wF49IjFMCbzwocgWty6fp3wOPBm0fAQufD
 46pCnU6Q6aPxjRgUj6dBnyH2HP8N5xd5rg3eoDxcWUDwOoOZ/JVRxacZGDYO2eYdRVjqHie2UcG
 A2dPaFAZk27wAN3i4weXvGKBfUn0HViDfZcrekQ/L1OVizUVHJlnO3s87auG1GNbNTGxt5BRGVO
 Bve4DmKQHEWeE5YgNIP6wqVAk9txQiWWhXFaZP5WsSiPm8dS+JDFo9eUB04K8RXqXlgXgxb0K/I
 9ZYJ/QhNxlxMHLyPb4OvqE72ZdzYBz0O+u34U9V6V3l2apnXvtuX/Gqaxch34eGJVCExFacPmJj
 LA6fByq0UbKQUio5IVA==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae1f31e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zpnWK4eklKcjKML8EKEA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: 5gN98GdWs7xQwSXdCLkOCw9NEoWDuCMs
X-Proofpoint-GUID: 5gN98GdWs7xQwSXdCLkOCw9NEoWDuCMs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX9K+S//GMETNP
 GGa1YjQXbk1eUHWQe3rn7t4INjpwU2JWLsnllE0KYrvqptPB1Ogs56A7+iSVEEQBZ2WtA6MjvRp
 nDTLMOf6ZRld3NNlH8BXsMEBAYL53L8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280052

On 10/27/26 7:08 PM, Taniya Das wrote:
> Add support for the DisplayPort Receiver (DPRX) clock controllers on
> Nord devices. There are two identical DPRX clock controller
> instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
> audio, AHB and video memory paths, along with core PLLs.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
