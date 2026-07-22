Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35B42EEE62
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 02:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784687859; cv=none; b=JJoBQr/XN3aVn1zT0dZ+AvPR0KWi3yQj0lV5N91o65tv58lAYat1jLHKdotQOIiuDhIZ/RZnfiXcWyjDHGHF+PqBSSyimXEjSwiYfXpyzaMJLwMP3TJ/uMrpgK0ZkT2r14tIuFFYDV3EZdQ49IPMwYXNUMtCpzVBpkTmzhXP4+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784687859; c=relaxed/simple;
	bh=I72I6aBNbNx5LLSbB2IurvJXHEQjlREB5X6pHjEvasQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjwzdY4I6c8isslV2Q8nGBwL/nCEkUhId+RETVZsxd7I4MKG15nqBR7xhKYqpAeD164iS6iDpr/C85PQWOpmFLXdpN9EakMApN+VXDZT5csBLMKiBio4HuxS4W37PzGg7XEuZKaiDZcUqJ8HOLVPwJcsjEXxe1EXv8kP7XajVMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IkGDu+HJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kKN9s1gR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IkGDu+HJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kKN9s1gR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1CdBo3150840
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 02:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IVQKsYN3qgUZiEdfZG6Dl2bU
	NyFkjoaZvW8jdv3e/ow=; b=IkGDu+HJk64knardp5jZcVuTTVp4WaJDOIBrRgzj
	wBiyAscWR7qEjCOWxsCgvv53ClTgBGdx3uwBdQmloijHIdKbkVKo6YGYme7rNlyN
	LmInbmnb1n1usUPXHB3U6b8s37Sj/dVx+NOw7E8prcc83HzCmT04vJTZxHcdcZmK
	xlwPTc7rtzUXW4D0PzJm0bMKfefI88KtlxlqT+RWvJWBY94nOqgP9aFowpGDCDhw
	U1akqMrLwIhmdRciOcaE9+0yVvbrgmKcOn9Mgm3T/kU/jBN6BNWjrvb6mKBxNCdb
	p1pBUsE01PFCCmhuYfI5JXwxVEog7IRR1g+oMY0p0uDmcQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e1sqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 02:37:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso3026355a12.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 19:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784687857; x=1785292657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IVQKsYN3qgUZiEdfZG6Dl2bUNyFkjoaZvW8jdv3e/ow=;
        b=kKN9s1gRAVoqvm1GvZGlPvcUj4yhDoEYkvOyVBfjDT44lRe7QeI+0mrzi4ZiM5gC+S
         76puWnBERmDZjSn0o2dOavQo+RjY0amDEVJVlIpfJPgEC87sKW11luwpYft63Lbv9D19
         kqPReX9GmHJh9yHLJab0so9l/d1A2vg7a9L13PEFHYLkxpJ6eMh8WWKazcGW7IbZ60JO
         7Gaafnb9rKj9Pw6vjp1uf4KkU2BO+D2gsAkXl8yCnKscXwBl893AL7XeD0psOE9IZfpS
         ZlOn531FXplWMZzLZyTRIJR0wM9vvzB4NPYSzmlSRnu5DPfASci9QoPGfEHUVo0k3f0A
         YhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784687857; x=1785292657;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVQKsYN3qgUZiEdfZG6Dl2bUNyFkjoaZvW8jdv3e/ow=;
        b=Pgruv0O448QicE9na+0PGWnjiPWFeoPUmApCpXzm9OfY3TAjZZxJLRANnbSfcz9C6d
         x89IPh0CF05z1OjUn5+bG0hNwTUimv2xYcRAw2Qp7oVXfl1z2sSWnzhZmedMfJ2B4Cjy
         HkimCWxsnyxZuxb+JyoFRFpQljfZ5XChNKMX63X+W9Vb8s/Nsjn88o4mFMEWWgYnxPXX
         JVmWJmlylxY30X5g9UMzSgNV3JpBVCviY46t6QO6cMjrVazpjxITG0ChxJ9uGWKoRsdO
         yDiftUUpzyv2gKKghFY2pBqJ2XkiuaWu1r6HOMSqVn+h5o7TzmFynLC9ATFJxKNOj06j
         knhw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6k8qnnyv9p0OshqgOHsK41I745LyKQrIMP/CarIfzEahaP0HcOeXe+r2dpF1fG3oEiOETXohy8n0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGbP+3KD/Sm8BSGHiY9SNL+JTKp+OTNkvxUflE+sZKdm79lfmN
	T/Zi2stvTZL3wMXLYvaDo7VkpqF0e3jGzFrGCeIHGUUiG00YeZCUluyy6Qmtck3Hu/0yp6g1EQB
	Q1fwlf/vFkLLIbShqJfDFCO0VcYsJxyuPB1jleBlRBcuMDn3/4lnpbRjWEZ6pTSc=
X-Gm-Gg: AR+sD10/hK+1CBZ8EreD+E6yKjlhqwGpZ4u8yvi0ZD+DUca9yx3pgkhvgCIvkcyZj1H
	HcPVqQpQWQo39QHAP/d8PWq7oQr5Y2Gk7V1jW0g/4wvntSdNom2gJqTx3lEvpwFCI6kUcpykSGT
	1XF24LgWurWg2gETDams1V2gJyAWMI9MzNsBOKZtWZQjGUr6jNsBfa+6AnTJr4b8rVGrstczgPO
	KJOBWrZlB0G7qdZlTWEJ2Eh1f6pLLd9C0Be0IKsz/Ek63v99X7xxmBeqgTSQXy77+fD8IDxnvWL
	Jc+3pQUkUMmMVdrtm5G3mG/gfsahMGNenAo8TPByiAMtDR3z6VOpHLODBdXwAQy77MnPVVC+c+9
	mDKYctZROSW351Grkyk4vNytEf/4+KIuZ2jfwcL4onnk=
X-Received: by 2002:a05:6300:2285:b0:3c3:6c90:65b3 with SMTP id adf61e73a8af0-3c3adb086f8mr22467251637.65.1784687856652;
        Tue, 21 Jul 2026 19:37:36 -0700 (PDT)
X-Received: by 2002:a05:6300:2285:b0:3c3:6c90:65b3 with SMTP id adf61e73a8af0-3c3adb086f8mr22467214637.65.1784687856177;
        Tue, 21 Jul 2026 19:37:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm1768920c88.2.2026.07.21.19.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 19:37:35 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:37:29 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/6] dt-bindings: clock: qcom: Document Nord GPU clock
 controllers
Message-ID: <amAs6TieGdZwtxyN@QCOM-aGQu4IUr3Y>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-5-17e5a445a512@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-nords_mm_v1-v2-5-17e5a445a512@oss.qualcomm.com>
X-Proofpoint-GUID: 1Io3oOKRisaAJE-lEza6k67sVJNZLEQr
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a602cf1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FJTKRu6q7fTA15dSFXUA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 1Io3oOKRisaAJE-lEza6k67sVJNZLEQr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAyMSBTYWx0ZWRfXw+90BQi77o0+
 HyOxNVcac79c3yq4KcePGd3iJ0fNc+gNHyXLT2DkBMYxtvgmZ9m+mNlRtaJj9aAe+K05nKsN8HB
 L5v2KA6/vhawFPi9/xEbkkKaMKTd2XBuzA4afYBvQvQMqc0Xo6lYnhreE8vq2jeDTHOFDicxXOM
 axq29+0GW3WbT3NLqDI2Y1tJOCmQxuxoZpBOtxgjwAtdSSRH1yso2aszZTZWzt9X5tKjKNQ9TSK
 DIJqLWq+y/2lFzJuxm9A6dJM2loSRI/susgGBnQxpdu3fKeGIO3BKUnOdcFT/bwsur6BXRPRz/X
 jXjZ3r6eN/X5UW5E0WNwzTdQbMLoWErC/SF+4UijvIfU/vwqOZD/uY1Y92cpJsSslpwr5iVwJXK
 35dCMG+EELQmmMmRJEFuIqA73noqGAbqDieoQeWKQCpru2YVaIVYpMuwV8q+gOgHae8lPq/d/w+
 1noY5EB+0WcW4wKOoiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAyMSBTYWx0ZWRfXy/2y9fAL/TXP
 AMTT3aJTRfUyaQSrFzW5FQA2Av89zSNwS4NIjh+nNBuIrASUYaOfVOlx0OuJDCFJ2Jr+LXJmnTl
 jILT/YS+8tiM/rLd05iw8FZPmq4U2+c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220021

On Tue, Jul 21, 2026 at 12:37:20PM +0530, Taniya Das wrote:
> Add Device Tree binding documentation for the GPU clock controllers
> on the Qualcomm Nord platform.
> 
> The platform includes two GPU clock controller instances, GPUCC and
> GPUCC2. Document the compatible strings for both controllers.

Nit: s/GPUCC2/GPU2CC to be consistent with code?

Other than that,

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

