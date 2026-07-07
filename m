Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D33346E56
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 04:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400183; cv=none; b=mJcAtOAx9dGVdfOV9tnmhTLgjat83IlIOSju/BVB4FjOMOZMUaZiuprUKAyx7j+BpNE5/A3mKgAa+qkd1uK+ZhBxMcC0QUDUsgMfJnu8uyhdH6mDvOcTZUabr2lTaKCtJlbuqdx7OHl5t8XkxSsvMBlfYTpAXjU/d1VLlbK/88s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400183; c=relaxed/simple;
	bh=AJ53eWkj8JoeZLOZEeHTwTI/FEoqLL+HtmJAUY5Ecfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t0MwzEcpHZxkJV0xg5gVVqlVWIYvl0XJF2uwiYNaKQczd7tK7wb2yrvRn+oMIFJ5GISjZ5TrrydfGpowztlyvhaIcrCiYvbViQQaRC9lsGneYckCfnlrZkrpqcc9o0L01fX1xietCRYx3UJ3n2Jnkba7DFFlTOF1XhTdNU+sIpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qewgf9s4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+QOqDHW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qewgf9s4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+QOqDHW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66749LuX2645673
	for <linux-clk@vger.kernel.org>; Tue, 7 Jul 2026 04:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vFkX7LQlNsLH1cm6XsRmdX4en8xgjchX4ne5F1lnKis=; b=Qewgf9s4jd2wuv4N
	TzmobBV5k1e9udwUBzL6rJlrUGLTMewp7aXAmkzkzTVpgyOipzqBIMJLASrAjfQo
	/uwUR3nRvZ3PeSJvn7Sd+dxEjOVrF61G+xD0AzjogMPFdnihrDFjBxB7Vi9HN0pb
	enHSZ1UyZmX17BAF0HR6z0uoKZxCgMO8oyxxqvLhcZH58r5mw9MlB/6qGlpS2QbQ
	ENg2nohR0P38cbBBg5yX1qmeszF/EMjHkNZ3mZa6NVbVL6c8Qz5HaiTGjd3G/QtF
	hV38EHpd7QHWwM4mo/LR0uTfnTH6IYiUNEzpFX7KpcjlTaF4dtrj+F21V7LQOswc
	4jlrcA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9cmpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 04:56:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8479c6c6cbeso3555079b3a.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 21:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783400180; x=1784004980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vFkX7LQlNsLH1cm6XsRmdX4en8xgjchX4ne5F1lnKis=;
        b=a+QOqDHW1dZbuzH1ihv0oNU5X+ccX+CG7oVEmF9nj1sZUxAkjhi/R2XXh4+4O2k0Me
         biQh528+RAHED36vzWyPqzrw3VklqQ1Qxfh2wS/WBzIaYo8NUtiaSAzUBws0+bqvdaDa
         gJxlGzv7Y0BEmFq2xfIAPRzUE3K/y14E2pMBRiTVL1XTCgcOiFUcUe0TRp9eMoR8NuQK
         iLMVLmB0K5V4boIiWKdDgP/RQTO1p1O4HUU3UcXUCuETkJyGAiAg67m991Fvi5fXFOtj
         Ok9ConYDHzYjqkB5mu6lCi79siHEAT8P3ZUVUnJhrt7pRsBcrV5SAJx6EI4nx62IFOuh
         CwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400180; x=1784004980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFkX7LQlNsLH1cm6XsRmdX4en8xgjchX4ne5F1lnKis=;
        b=F9fPU+voIUhmhIPy6OwhE8TpjAaCnq48FqTuoyaxXAgoU63w2ttA5UnA3CbxJz7aqh
         /QIOC/o68ozsigMqm54eBYh+202IAEyMm3vaYxswcQuUctmqX7kPuLUtRYOLWVYoO3NL
         A46nncTw2gv1dYTSGwTeOsCsPipwDeFW5ttGlXwTzGxY7ALByLUMQ3jTXCk5YKBYDNCF
         WfYq2zq7Mgqff2Z95sltss30zeaOHxuX+fVk3/u/FPABshQiXgR9ZnhGBWhPbzYj96o3
         pmzz/AxGDy4uxcchfBgJP2ZqaNunm3N8vUqRJHLuImjeFhJlEO2dDP0fkep9EuNMCOfS
         5lSA==
X-Forwarded-Encrypted: i=1; AHgh+RozWjdKjM3YLtZahymJcFgfNyei0bZMCcwJnSEx6b2a/XSirz2/STiqncKrTiruXe17KQwerVYOdeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaV7tJl9EpgmqfvrSHZaF0183OfN2hIbZduVj4Di2LIKJBkHKj
	yMEvEMJU+35I5CbzNPsT/MRW8+kZPwEWmx+XAvwIkYCvy/wzHAu+titdmQPvxOlswvmBvVTdHuG
	Yl3JjwMHHV8YFuE0jHJDCa55Sy20Au3YjdBtizDBuqPRigTzsSF4Tpiah3tXgjIQ=
X-Gm-Gg: AfdE7ckeAq67wzvVIZUJY49aO/LvvEO4Vu9/bS6giesg6+wPs1ek89YzVuzL/UYFqgS
	+1onezwVuFN6WoGgC801r4ryRUg1axc3OGRCHpycQ0sZ85MP1ls92Z8ajRQkQf4AaLEL9YPw3MS
	q+H7wCgwAPVg7MRmBu2O2qw9PNIflLCN72oZ2BPTdyzEMf5N6H4Mi8OBV9ZFjdzA85xkgJHRJwg
	V4ONuNb7/SiKP3L+FykCCJ5lwJPrGQY5p24HbX0MmIK6aZ5XMu7DKIYapXpov3/WxBaCSx6eWAZ
	WEdxRBr0b1q2hiJhtGuNX3Ly6EFqCaXzVD3KLqanP+arYuVaufXaZlTxjF+bjtMwd6BJHOdatHc
	lPaDjNBHNQtiN3Do6oqY//R2mK5QbNlh75fyvomk=
X-Received: by 2002:a05:6a00:8d5:b0:845:eb88:3d74 with SMTP id d2e1a72fcca58-84826df139cmr3337856b3a.29.1783400180277;
        Mon, 06 Jul 2026 21:56:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d5:b0:845:eb88:3d74 with SMTP id d2e1a72fcca58-84826df139cmr3337828b3a.29.1783400179800;
        Mon, 06 Jul 2026 21:56:19 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8482b333d4fsm614686b3a.54.2026.07.06.21.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 21:56:19 -0700 (PDT)
Message-ID: <7333fb05-2a9d-44cb-a548-c8d2c26c1a3a@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:26:11 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: Add Nord display clock controller support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-4-860c84539804@oss.qualcomm.com>
 <4c8d6b13-6cab-4731-b3af-bb83de9d159f@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <4c8d6b13-6cab-4731-b3af-bb83de9d159f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: grrNI82VRifpfKD1P9hLOoMJfCqnu2vR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0MyBTYWx0ZWRfX/5iU0yfsDHf5
 7Xpt7+0IYlE83BXU+ezOA/uW4G1SqDjavULu9xOs5EFbgpvRNAotPl+OIyJQdVbUtvNwJjVrufP
 d4XDliWqD0qam3bGVfzigzmPZLcyPWU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0MyBTYWx0ZWRfX/OWJt0Mqiy8L
 2KcoABoyCVz9BNBZzxp9RNMEzi0IrvDy9fY+Gxvte1qq9EUSsnCAM9jRPZV5J0OXofPri/bAX2a
 vyyoXQndvKGnSj5/kxh4y5Ev7g1D1gsQdjG2RnkFALag0thejfGseHuYafBVh4M/oqzN+OzWDRL
 b4dWbgoE2NldsJR8tQLYXEHz6FgaBvnv1kbR74gcCOrRllO4rRBPFPei/KHkaMMmpPrpK6HhPyN
 iu7MBiXNmBPDrDTBT8DvETAtNzpgeRUpeEzWMgmsz/U1jM6sTLpsL8S1NgOzkWj1cCZK4ILhhQS
 TA1jCwxOJUo7DHWUZGKV4IUKWbuDtMriZBnDLCyJClmpiGW/MwLbo0py7wQGEHt+T7XkaMNMgIi
 clDhn+jM/ToRnGOutkJ5/4P89h/kApvQPuuIL7a+5hFEBudhvo0yBwLcSMZjT2faH5s3/1UIFt4
 etQPGSD1410DzKcoXxQ==
X-Proofpoint-GUID: grrNI82VRifpfKD1P9hLOoMJfCqnu2vR
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4c86f5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=_JUvI7eCtL_LupWHxwgA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070043



On 6/25/2026 5:36 PM, Konrad Dybcio wrote:
>> +	DT_BI_TCXO_AO,
> This one can probably be removed, both files


I was reusing the bindings of SM8550 and thus kept it to align.

-- 
Thanks,
Taniya Das

