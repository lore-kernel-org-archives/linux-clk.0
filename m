Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFD23B6356
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 08:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786956125; cv=none; b=pMeKVPQ4Zw4wJC8niLbjNsm25rUjgO4JXQ6MbmtIVHRk9kGYB/xPwr/IcUNzUCcvCWM53z5EJwHf7kQi7aW1CPZubCKeFl87vbXu/hMqbKldgY2uEjusXR9ctknBhdQVHylw9/zNssooCYi0Rfsud1DO10eYQt3qlO4VLx+dI/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786956125; c=relaxed/simple;
	bh=J4yphZldgZo/38ruJpoBGKz9KTb82Aym0Z3MCsbuOSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IfKNMQ6hHCqhoZFnK5/oMZnQXkLFrUc2Y9L100ANFvIGgkveOGzHtZ/Z7jI4+4cOt6I3q/ZzfUakxzKaF+oZXh7Ap40SaowRPt6FTeghleR53xc9Up8GuzcRDLYPTFbUMwVlCI8KXZBvExklvLUmqh8vCoCqzq50VJepVjlMhYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xa7K/CIm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M72Nw/Bv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xa7K/CIm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M72Nw/Bv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H7snn41297210
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 08:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ebzg2U5D7wsaB7Ye3B3vmB+6OwLjgSGUlCyhzYTVsx4=; b=Xa7K/CImaCmltH2p
	/O1trS07rbjjoj6IteYCiKYRakm/aLMokcTrkhrJt058Ebl3e5AQWyo0cYavyKLs
	oJND4CXbbxN6CW74gw/hxdJvgQYJPTGXMvbwX54Nkdmc8aVy8UFVAdfbEL1nZ4t/
	P/j/yEMSr26PeYGQFva3dNENncE/qOZxCAQNLwxilUAEApE0K1dAJ9o9jFF3is5l
	q1is5p/ll5Pfo+W9mXG9gke73+CsUk6ZQ7DTma8Dh9hnncvKSDyXPQz/5ZtxO7HT
	3P7Ed/niTpRmlKO5XEXLn/mBo5T9Z/By+azzIXlz8Whjp96GC8IS91DBFRdN+zhd
	i0HvSA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xb1g5en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 08:42:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1e777a15so8832651cf.2
        for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 01:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786956119; x=1787560919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ebzg2U5D7wsaB7Ye3B3vmB+6OwLjgSGUlCyhzYTVsx4=;
        b=M72Nw/Bv4CZi2vaSRbVKVvlJ8sn4d+GzV/ut9JFjqiZzwHKCVnxeF2IaM+ET55fOlG
         j8zL3rp/HbVS8KTozR9MX5kKbhsTQ9aTPdeZWT+aX/w13DGXRSvwaltrHOxEbulwpe1D
         7DR/nyXwNj5lcXVTsIJWphGPMkVnAHDPvuGgMfhskLXGwQW/arBZorCzOHAcZSk8LsS2
         4Y5vCC4/Ga+0e13rLKz/Htl+pZVpyY74vD18UVCNUHXDRaSY0M9Fy90EsjP/1GxzPNmc
         KY3BdY4Vs0AaDP7TQVqAHJkLpR7MoUZvIT5jnbvsPjsDQ5k9Gw0LH5ylnK+rTqgo4DAN
         vmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786956119; x=1787560919;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ebzg2U5D7wsaB7Ye3B3vmB+6OwLjgSGUlCyhzYTVsx4=;
        b=SHZlwfbeI31nPSab2U6qDqlC0nBKHbNNeaGYCXkWTKeojRAotfH9bec4EgP5e0NczS
         X1zuq6IxPoRiO8wqk6oThI8fMTCd8F6s9+erKBs6okJQ52bPMFMkHCy9eDeg4Hwjupae
         1gdH2clQd5HaYvXHBpeUvuZmEQgPOGDnbCmThPW5SyOroQQngWDP2rlgD7+u+gcr7sKi
         Bs8SLWiFmnwLV695QMf8JR80nWN1z11IyivyoHYLXm44pd1iIJXjtkWg3Rk0dKXXj8WZ
         tPAdTOdTq7J8melSV2dVHswjMnfZOoB634rRNoIJHppddl79sn3svplGXKAMB4Yff+zf
         KpPA==
X-Forwarded-Encrypted: i=1; AHgh+RpoY5ZbtHxqDrbRCH8lxOOwzE/pBWT0vHvHCCNeOM+73Y01mn51xP4psj5jN8QSH1Ei//CGkbdLPUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrbbrCMd1B9hTVbPcDtV/BtqNHE3bDY2c8Yh43fSLI8EqWwUKH
	KBqlt0roxlppD9BQoxYZmUpU8iOqYGuxnUP2yCqZgmDeRo+yIQlVpXg3zdpL0s/uTwW+6oJ0o3W
	iyFL7IBeMhJ67693vq20l4cbgDLk0nNvDmIpo2Jsvz5fLG5mwhNe5lSGU+Z62h3M=
X-Gm-Gg: AR+sD13IXCBODViecEtBCNutEwH4/t0QBjdAV33BxecrOyN+f7O9mMyF8p5CqFmcmv1
	25la3xk/SpzHhr6xb77Cr+IouN9Nt43D1vDeJFSOECYbnQt6oSGzMZGKA9NL0jOs6Ve9ZwhH7sd
	x8hXxGnea5dQp8sAjZVvDM7CDYMscPZPRSvhs6Jv5aUcx47JDmtsnFAda23F3JfXPLY5u83a94+
	PT7ahAvs+gpWk7Yg/QUkTBkXa2hEgAEkjBgaj7xzv4ZDpRe30OXIhalLzHbpZhs3ZSFV5LOUNn2
	ITyE5waBsNpdKLcp0p9rRXdjAcF4pqz25amp61CfeRWBBrK7sCHx9dGgOlS5oRfE0JGURw8J7mN
	kkyF1Ka0midAFhc9iW/8D5unu
X-Received: by 2002:a05:622a:c2:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-52d852f49f4mr184346661cf.2.1786956119012;
        Mon, 17 Aug 2026 01:41:59 -0700 (PDT)
X-Received: by 2002:a05:622a:c2:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-52d852f49f4mr184346491cf.2.1786956118454;
        Mon, 17 Aug 2026 01:41:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8588499sm346934a12.14.2026.08.17.01.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:41:57 -0700 (PDT)
Message-ID: <f964074d-d926-48de-951f-7f34c5646f63@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 10:41:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: qcom: msm8974: add MDSS reset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260810-msm8974-mmcc-fix-v2-1-5c787d79c0fa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-mmcc-fix-v2-1-5c787d79c0fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ua9hjqSN c=1 sm=1 tr=0 ts=6a82c958 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=RxubUlsj00UXaNeQfKcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: aGqVZOt5lvru5PWtAtY0xS49usEf-BV-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA2NCBTYWx0ZWRfX2Afpk5PHv97L
 Le5pXY5MzWkYvhTyemiHXz9rn1FJLcdPupS3d3dc99EaXrREhdbgmTno84zRduj5xo1F0fRMmZt
 dfanMdm/00xWl9auK0C5kPDDRcrsrwn43atFu2yaThBzgO0jMqROfM54LDFdNqMzXH/10PLC80o
 5ZTP4rbnFvjkPYz87Re2yDsZ5k4nt+mIWZxEzIwPIYp3XIbsmTaL6c6tsHeXJR9UZ8NAh7NxJAA
 a5PyqY7nko/yu5cfFoXmfb224Oi+/KQy00F3KXSJibQCx6LulC46d0O7ZH+WBkwtb5dIbxRSiyp
 pEtU01SQBZOsCvvDr2DOOq8VaPqqt3S9YNgHpSR955iZk5CTRTsE7Jwj3wQQINCPoO1IdN9yX2K
 0I8wiMO8TaJBA7uYB+mk2BXyE79QA47APbHRYx5QOn8FK5p4q+rU54r5Hfsx4iSXWCFP3+u6iZ2
 ofN6S0y/y9I4DVqWtJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA2NCBTYWx0ZWRfX9M9tlqC7HhbA
 cqmxy7CiH1UGXKyU/wYU9JVLlFaLBY4u8ZoBojge7Sx2y3m3XpQRGWRQ2uc2ZSoJ67Na6wyvxBu
 m34OX9ek46U/7qqbg43Sm31bxSMzcbg=
X-Proofpoint-ORIG-GUID: aGqVZOt5lvru5PWtAtY0xS49usEf-BV-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170064

On 8/10/26 11:01 AM, Dmitry Baryshkov wrote:
> Commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until
> late_initcall_sync") kept power-domains on longer during boot which is
> causing DSI clock to get stuck and fail to acquire its configuration on
> DSI bringup. Follow the example of other platforms and add MDSS reset to
> the display subsystem node, fixing DSI issues.
> 
> Fixes: 5a9fc531f6ec ("ARM: dts: msm8974: add display support")
> Suggested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
