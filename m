Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC20E3AE71E
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 12:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781698301; cv=none; b=gFzuOjfqOh/0MEJYAmEX+9aOyzSTvAigX8xS6jKRSIPKsHQpOOpicTNlWA4KrOPtBMP3Q+rFuVyJQ3IZYRF/nPP6IKf2mcV1vEGz82WRw3vrxtzs9lRN4rwes8q7uxrM0A5atazg+8ZFv2NTYbgQbLyCgDqCA0flysailAgWrUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781698301; c=relaxed/simple;
	bh=U065ANd9oOx4xWRmwPkvwRyxcFd99MH11yA+2AkkyQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PfLh24b5oRvUDp5OCw+QlLD5aVYD5M4NbL8C+DoI7PskIuf14014F//irA9ttSaDvmtFpNJJjxCRv0o92nxIzFiW9s1pYOGH11mDXn0p5BM0BowT+0SHnAEBymubFsC2sxDf9qYoIaIJ7JPRGMRt75xxQkUClAgUc+l7600AKlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l7DFG+4g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b2e/PgHs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l7DFG+4g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b2e/PgHs"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8VCDK2291489
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 12:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RvYjcqqwjarNDsMWrLD79SnsXgpWqHBe8tU1zyG2q0A=; b=l7DFG+4gfMlKacwE
	AnEXuhB5QIYwdpfRSS2uRr5gcaA4076kQgncB78jOKYnvoQBa4l0ajdMRBtXr3FQ
	mwqK7A3KFAIFPYe3QMv/LHu4EKD8VzXo+a8zlLNbn1Sr41yfbNMz8qdv4EsKx39g
	erM5gYTyrdrKM4rRoo3w8UXq0v4c2v8HFoYtpbCE6d8Qmmnv+OXSlxNHQmm/lLns
	JReE59GIZLK3izAPhYcMYG3Y5OYxbgz8Odkw6S+usDD/wpDC9ykqpG0A+jfoqwRb
	L4AAACcu5xrUwlYtwZtqy0QYMlsWy3PxbtNeFF26Yn72EppPp4gbpr2jlsR8rHYh
	XwyfGw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevk3a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 12:11:38 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c6d4a825d5so248361137.1
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 05:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781698298; x=1782303098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RvYjcqqwjarNDsMWrLD79SnsXgpWqHBe8tU1zyG2q0A=;
        b=b2e/PgHsc1fcEvzpBUHHRcH76TzNSsrUfnCB95p2Wnre7zx7tR22kFa4PWZFm8aItG
         VPRY6PanFvIG1GITcr/IBVik3M7hJL3Jn5biuY0prhYrMQDtZUzV8g0AFSjzyB+lKHEU
         MbocZJ4MQqbsoCgjOnVD7xbRWVjv4H3GfH3AqNyYftKa8FUV5Wxt6nPdPgyVtsZIlwcg
         XgA0X6q/EPhExZHBhem/QE1Zn5xJD05zM72ehiFZDolBOS2U4VjLNR7SIJC5npv17yUX
         MCqb78MV01UNqeyhCpiQT6zMJiEI9J+TE7Jbjf2pFfCYBjJBJRWZfT2JH942vfcZovJf
         rtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781698298; x=1782303098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvYjcqqwjarNDsMWrLD79SnsXgpWqHBe8tU1zyG2q0A=;
        b=ByqbSjVClfmFKeJQ2MQ3JrAI0ZVepTuaV4jAYrmTubuzv7hCBtXZd4rILTYVoM5CuW
         EuiHE+FyPEF+9VdDAXROencLCFx5CnquaoyrZ0fIvxnI9XIzWUKYLM0eKhVSac0yK96A
         TvBxw6za8T1laFlXUy2SpY5a5i2BNNZShkKXHtHvkaqw1UdttVJZX35k7OMNvGGzun6a
         lingyliEpGpWIDbMvFdBFMUW9rluaPIDXycr2LzYDOI7eEFimzyi3KZ7+cvm4KXMItcM
         V8Mf8ekUURH0FPj4KYETK5o1k3GBw2BEzkO4ja96Gml91xelk7Ky+U15mzunmmxYQ0+L
         K/XA==
X-Forwarded-Encrypted: i=1; AFNElJ89CeSKpm3klg+9hras21oz4I2XSYyBP3opFZ6yHtgCJxcRFkD7EWMuVJq5WeSyLtGwihbODUDY6ak=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfs4MrTElJyHl8VeGESvKmSt5zq9YqjZm/GMw3RBSO+gIYmzgi
	Ws7fnZXjmYFRBDvlmtLNeaxhd3phNFEnOSvQ5jMQ71Ao3p/USANj5U6nnE7ZM1SrbQFjoiDfU3y
	PLstKWpXak1o6I3KgwXXFH1s62KsAW18a+YHV27LP4uMrDQ/ksI57lVXNlPZ8d2Q=
X-Gm-Gg: AfdE7ckqpdcS1U4PZjWkg8ov8DzBEXzsIrqQ706T5jbHE3W9KMxxcSOPfJqyuZ36+XR
	IEygvC8hIvSiSy6HH10U3eb71kwKiDyCajXogwa7PEDj2BZ9TuZkbZNxostf27pu3qwpLCirCIk
	wMU3fTtwTTuxK0NXwsO9VYWU1HFZkiFoN+IS597WLcHT+xKkXADbVnaGUDgRhoP4enbkXw/hxAO
	SEcj7TEPKBCkMExpR73Znc82crK110KKhnvNHt+LZnPYF88ZwCmR7hrVsIIwDEH2TLSt56ymOGZ
	OZir2Xyw1tYYHbM45v5yaP2bSq/RfHfv9zssjE0kl7cFQ45Xyw8NdDX66RntcNeF4TjNqJnCRhs
	40WC98aOM9Iqn7+3pT1g803zhWKLrLsRLqKE=
X-Received: by 2002:a05:6102:8499:10b0:726:e608:6651 with SMTP id ada2fe7eead31-726e617ab08mr45109137.2.1781698298053;
        Wed, 17 Jun 2026 05:11:38 -0700 (PDT)
X-Received: by 2002:a05:6102:8499:10b0:726:e608:6651 with SMTP id ada2fe7eead31-726e617ab08mr45100137.2.1781698297638;
        Wed, 17 Jun 2026 05:11:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb531896dsm781731566b.27.2026.06.17.05.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:11:36 -0700 (PDT)
Message-ID: <a956a733-7bb0-46f3-bf21-142d5cb8fc3e@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:11:33 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: mahua: Switch pcie5_phy ref
 clock to RPMH_CXO_CLK
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-7-ded83866c9d9@oss.qualcomm.com>
 <db074223-ac01-4ffe-ae82-187ef0cb2cbb@oss.qualcomm.com>
 <ai+9CYntPuyEEcLX@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ai+9CYntPuyEEcLX@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExNSBTYWx0ZWRfX5vlePPQSg9I/
 eJXdb9mwUrR3wKBojLd1c0BMTN4U3GIuiDoriO1dlhsyohCdMolpe9PMTZ2v/X9nyEAkcIrA1IZ
 0qBFuJrCOp32BGJB15UzPsc6TtOkkLCdtfMmhiHxYBTcrT0oFXctgIaRz/VWtFTobwU3BWe4VJq
 8PCbAxbx3Hvf4P0Kb3Eg+bmaDZ0fQRkiV82j7WNo4JjXi/eXym0T3gkf5g+HgcEQRV6xHXQ+dhE
 q5e7XZTDf4NTDVkg5cq5+p7mic+cF4Zw77nI0lplJCQl29Dp8qPlEMr1CfeJAwHporD8Skmo3gm
 uQn0EQ+rm2ud9jUB+Ju/bmI3rHqf0RCiM8F1gj03Udn9WUeqqkEKKRu+Wp92XC/8cWRl1M4JrR4
 mzXHqcGtU1PAeRr5upP2jVE49nGcOB0UfSDqlfnBhP5VpIBmJZjA2PZOXnwfubaeuHVB5Rbnww/
 2kjAB5oeqKdtOTNiLPQ==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a328efa cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=kmjxFz_dt4H88yzuuMsA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: ZfykeNfzseanghLq67zgGJJ75XP84Fe9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExNSBTYWx0ZWRfX5sd3o6Ue8xL/
 Ofg5sHofwnthA8t8YB66ewTSa3y67xwjMQ3OBcbh70jhy4VVUf7fDKU1vWVRoVIjT9Pj09TZyAa
 /ZyPaNivBJSt6VrPEKTVgOCfi3WytD8=
X-Proofpoint-ORIG-GUID: ZfykeNfzseanghLq67zgGJJ75XP84Fe9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170115

On 6/15/26 10:51 AM, Qiang Yu wrote:
> On Tue, Jun 09, 2026 at 03:06:02PM +0200, Konrad Dybcio wrote:
>> On 5/28/26 4:29 AM, Qiang Yu wrote:
>>> PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
>>> clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
>>> directly instead.
>>
>> This is the last piece of the puzzle that this series is missing.
>> There's no QREF clkref_en, but there is a refgen that needs to be
>> powered. For PCIe5 on Mahua this would be L2F_E0 (0p9) and L4H_E0
>> (1p2).
>>
>> I think the easiest (laziest?) solution would be to add dummy clocks
>> in the clkref driver and only toggle the required regulators. Another
>> option is to defer back to individual drivers (such as PCIe QMPPHY).
>>
>> I kinda like the "one central node to drive power" approach, but I'm
>> not sure others agree, since it stretches truth just a tiny bit
>> (although not as much as one would think since there are *some*
>> controls for the transparent-to-the-OS hw pieces in these paths still
>> in TCSR).. Dmitry, Krzysztof, would you object to that?
>>
> 
> PCIe5 PHY on Mahua does not use QREF at all, so there is no refgen for
> QREF either. The refgen supplies you mentioned are for the PCIe5 PHY
> itself, not for QREF. For other PHYs that do use QREF, there are two
> refgens: one for QREF (voted here in the TCSR clkref driver) and one for
> the PHY (which should be voted in the PHY driver).

Okay, so in this case we have the refgen regulator hardwired into the
PHY block and we just consume it from the PHY node&driver, am I following
correctly?

Konrad
