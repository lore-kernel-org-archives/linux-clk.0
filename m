Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4724D0A05
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 13:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157836; cv=none; b=LqO4tq6G0e4mt8pgWloMG/TOj+Ifb56OGgi/EhvsytQCTpeRGqu9LDzRYgb74b8P3dTTLAVG4vw0j7A+Dw9eALtGATk40jNRM4fEWwLmMexKye2M7bI2G/iOpvmpjA95JEtdlPhnHfTg9kmLrihcj6pAzILEylGdY9uF4SIu4UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157836; c=relaxed/simple;
	bh=gLufYT3FPW2NEJDqme0F2uoTEeuYJsbUQaqVrEZieuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EyWfYKgduTMpLRliSMvNVZQQkppx+RdAE/xD4k8Mll1F+ZEM/8Fu9gSbyVQrgrD696y16FNN+RO5Ia19UNDfDdlJsmsT+yJGcb/j28HsBcQOsiZbfrzbeGlgN2zzDV1sFk0+8CfTemUS0oNLybFaT6+BD91ENM9rdrsGkn5pp+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClItlAil; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jd37xcMY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClItlAil";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jd37xcMY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GBTwhh1277046
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 13:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vdzBxvayCpF4yq4HHRlx5KzhM9wzjUt8kSXAllcT6As=; b=ClItlAilPvUWymga
	4bPzxmJd0d5Wf2DHR2sA7qnd+kTqCwsYfAkfQ71INAWIYq6d4QGBAyrHp8DTxgLF
	8aYh/TOq+NY97z+YgapxkZZScsPtOBemN0ShZulD4ZTlgIpZ+dx+VLV0YwcgKJLi
	t9gBN9F+A29qG2qoZbjbdfGK8Rd3wHJ3LvEsVS15bKCcCT3TrGMqSH88AV7KHvEf
	1pUhJ0Ni9ElgSlAZ+wFwlKJM0smi8Wx2O5temgBDjNgXGJzXssWUsg3agG2nlPj9
	2qXgL/H4du2ys74yDDgYVsitTDAhj05DLP2qL44x2aTa4bQhCMLGIJbbzyjha/wd
	TY3OpA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbk3v0dp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 13:37:12 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5e705718bebso253142e0c.2
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 06:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792157832; x=1792762632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdzBxvayCpF4yq4HHRlx5KzhM9wzjUt8kSXAllcT6As=;
        b=Jd37xcMYMTm4Agr6fO/EeHIiYeoSOvzx7Fi1O0zd4xhnKJTXDD2BFnWKzwyanyWoI4
         tfb5KA+zHJNwnLNLT6bY/9B3e44eg4C6Afel6EOJAjhI1b0uX4NbUYHVDskeVzlQ8X4y
         r1zykntSV3cVQ9uB7JAdH10q1ZGy04d/jtwVeKgz4VS2rmENw84BOfIYKqEkYRgwa8fM
         +XgFzGzLPCwVM7Y8RxTw1Yi5429+UH0OHF+RlZnUK14muukjmUDL5Kale/+gJSpu/VOX
         r+WOAaNTzvRHnM6tiP3Db3ugQZyDwv0orxeWlQvLr+E8zyFDwdVWUoFdqdnfto9TEQAQ
         NHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157832; x=1792762632;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdzBxvayCpF4yq4HHRlx5KzhM9wzjUt8kSXAllcT6As=;
        b=uhgDvLWSfae7/ojbhm3Sv+AEUiav+6z855QjPH3yyG2+8vzxlg0BPwLOoHh04BmjOd
         4N6kg7bsXIey6qZ6z+QsJkERvbkV7gP/m+u3Ab3YoL17z+VwLDLiCt4wOSm5f6FdfTYI
         Km9DDnWiM9ZgDQKbpFMlqKnM0L9IaSqHiX6X0uAehWxWckuIxvKWqg3fD84D/mT4Pcyc
         VBcchD2+dJYuM0LTc1xtNMzM1ef5jkog9Cl2BdXMmdtshNkPMIT7jXVXo5N7CHagXXvO
         OxImfpz4GN1pVzDctdOgpoxaPl0ssr7q+BZAr3KcNmEHMFvtclJev0iCs/G3b7iV3rJL
         kYLw==
X-Forwarded-Encrypted: i=1; AKwUvBx1KTRyBzoBLdR+PdgZjmmJxr54YWc+5Zf/uku3eTjwGJLB4u6+2U1QWyef9JUyPYDs7GVXnvuN8bU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUgfUBpzAUlELbIk5jTvvUIp6PrimsV8Z0fVM1X2KUJUxV7vI7
	zg4ltQGnfJTGEM3EF2o+7e9WAr0sNb2eGP6kDE4ph17s0saYuZRBLk6RrW+Hc/UYxhK5jWZkgga
	mbREfu6L8mZWB6H4VcN5I5XOprSUmdjoPLv8H9ZGOS+peNoNxGAqQzHJ8mOC3YXs=
X-Gm-Gg: AYBFou1qc6EMdqnrdT9CAN+r+U+R69cs7Nn21efXw0UyfiED10ORn+0cvB7KUdnIImh
	DuqXGJ/KHnmeGQLgZBseWMgsl1JZ/zLHiOIRrRXUNJYzyFXQaTaUizsr3SCNQtcAvHYjLBrM3z9
	hGCdfZPcF8PcpRxw5kOCKvdLPoX8vJ+IlM2dIBb5O69ixtH94EyEVLyAVwHq0mC4qFM7NO3W/U9
	dINU9oMvp/hGcWMbRVtYjAJn2pndKBx3N135HTSuzSzc+jc9IA0xjc2HYJS6QlNkbtJkVbH9TR7
	l4b6kbf6YpZCp+hxHYrOw24mVTf6qzGfHpRgsCIprbIxfGjoT455Wj2FUjPhmP9hBOawgJO2fgx
	IrqzeYEtPdtRnKN24n5Es+w==
X-Received: by 2002:ac5:cd35:0:b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5eaaa0c8e21mr7159e0c.1.1792157831787;
        Fri, 16 Oct 2026 06:37:11 -0700 (PDT)
X-Received: by 2002:ac5:cd35:0:b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5eaaa0c8e21mr7133e0c.1.1792157831205;
        Fri, 16 Oct 2026 06:37:11 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c409239b3acsm73490166b.86.2026.10.16.06.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:37:10 -0700 (PDT)
Message-ID: <4994fbd6-9001-452c-9bdf-da5953a50a1b@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:37:07 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Add support for AV1E clock
 controller
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
 <20261015-glymur-av1ecc-v1-4-448a476d54af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-glymur-av1ecc-v1-4-448a476d54af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IbPPm7yXYbpsYuwO1DM0b_AM0I6GyFrt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfX4E08AQMh80Jx
 Z27qjchNp2ZLXcRrtXA5J03Z8BC8LG9BBXoA8YYA+WwXk3dnDh6AtOHOhMCaH4SK6k4qtSfUT2S
 DP1yeeYl4YnhP9dKb7CoJ8yQdgR7hHE=
X-Authority-Analysis: v=2.4 cv=BZdNQbt2 c=1 sm=1 tr=0 ts=6ad22888 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IDncKmX6BrmM4lnx9oAA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfX131ZE3oLFBwb
 au+CmKtJ+HVKjz2LdjXV65A4d0VWLa4TbmcEt+QH4xlM5miI4TiWnzz6eQzeJM6ULn9ryZwT0Lm
 ZgqxDI0PkVDhV4s0ib1gnIMPkFbrPOX1o/+ld5llVCFBZR7xNH5+j0Y/mMktXY8fZKG+sEgAMIK
 +DxYeDZxEBMxw1pvbUF8pl+F1cHa439eIDLFkV3m5W+GnYl8GaPgYNq26z0lD4O1x7lXgeKKi5L
 3skcWbCyknam4QOZhHMWdJQVGIdnm9kG3/LnxzJ9pry5iqhL2AyRbCyg7hIzB3yxeUi4WeJkEMm
 mLH5dRKIADfWu4ilPAG09OdBUgNsVTl/HvZAakqCxzHRYtcwaEVwOBqDkUmc/ZjZHgEmKf8QiT8
 +BtWL8zeHIYJPO6DV/3tn5KFOGZGy+5MWkTXej42VvUOQPwJSRQ8/bG2YhspxCUR/xLna1RguUf
 igObLflSg2MJ2JmYp/g==
X-Proofpoint-ORIG-GUID: IbPPm7yXYbpsYuwO1DM0b_AM0I6GyFrt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160054

On 10/15/26 3:35 PM, Jagadeesh Kona wrote:
> Add support for AV1 encoder clock controller (AV1ECC) node on
> Qualcomm Glymur platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
