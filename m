Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AA247F77C
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060117; cv=none; b=spPlqQX1URCV6v0y32LRyvFlGmm3XltgT1kHXJYaVXu8/a+316iVyqWTb/rz24jst9A/GcwbsJeM6GmgQR1JYFUiY8O0SnzisEvPlOQa3DezYkr9MojYsWPEcrtOQ7DXEMobnzE+0yNIsc0Qn+PVjsfDkwXAY0x982/aiug8pXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060117; c=relaxed/simple;
	bh=klD+1bPn20FdCCR9QyFVYkMKWskBuEhyCL4qVmKbDxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DWPzViVIRoInpl3FHHsFDvzvj3aZYyJOwmF62qX2mrlfpAfTitXHhL1a5igAIQEUz+ZrjvxXvIy67QoHypM9M75BRVcItabZIobf4p6r/cta/LzRDRDaZgWh0rHtx4mrayhfyk6DgaFNuqcmZ4sreY9fQG1ykcYslAeJwCJX+NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YySU0glg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBfcQfe7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YySU0glg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BBfcQfe7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jYZg2966401
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 10:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KB6+lnNaJsEI2ADF2CB3BJtwA+u6Lxdf78IIw1N1pAo=; b=YySU0glgRC8JsDv1
	ObjaIUGQzJmCNQ0xXHn8KEaWKbePL9VJqztNgKFyByDdqaO4majLo9MIALAWcGle
	ow+FykKhNmyiPMK+WHz/ed4/XQuYgWlM7Zk7HkSQiCQlux5vD+k/jFVAmKGZ0btq
	p/aB7Rh2HaFARg+wzp8DAlcqsFHaa4KVp0TMC9DBGMqBwOSjNaD1/debgm4oYF36
	tp8Zq0UlmRNke8BA+Z9fhTJmyXhwQytexA22/otoSO9PQD63FmFdoFgDLP0FDjSh
	llCgEYwfF2nStJ1/vgHAr8q2zjbufaxmszVvOzpQbpOpImk7mKht4RHJ0Yhhr0q1
	X9AiLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wujj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 10:28:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so99030385a.0
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 03:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792060114; x=1792664914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KB6+lnNaJsEI2ADF2CB3BJtwA+u6Lxdf78IIw1N1pAo=;
        b=BBfcQfe7u9xWmkFl8ArrK2UWFgesUYrcQvadBD8EiempiOVq7ouaKh86bIfUg1bHBR
         CVYBVKxSkBaqDqj8yP4Ey4toQhgPcBkrd7JnjEt1/6FGOn0Wuw1JZqFISFwnwlH1NlRw
         PjlUbVbct9Cz3ALUdNKzF2kEql5ubYczqDC96u8RieCe3m/tMkCC9Q2qClUuQ8lgcANT
         t08DmpNnTX7el+EUMIUgzWfoGn5+k7LX5G+/uGSYfhAHm9Dt2SvmwcPgNrpox0UJ6pt7
         FC79mqBWGFnk2+ZPe7G67FiK9AjvaSx7w4oKEanN7Nvr5rXEtzJM+td/xYbCrFRc+zKM
         1LyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792060114; x=1792664914;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KB6+lnNaJsEI2ADF2CB3BJtwA+u6Lxdf78IIw1N1pAo=;
        b=Pn3gwholUSvHJmlsReXxMy86+DN7Mx9ntPiVSdUWNc54jfSCSFQxP/y42rH5n6JOu4
         Z2z2/yLJkEQCw9DY3PX/H1DDfSvUsXgMRpjNku9EmxCnF7fhgIJwhhfmxOWsA1ZiKGGZ
         9kMiY0TikWpcQ7GiPHxXlZT65KPpCBVTh2h7LHq6kpSBz/KBLHWTK6T9KYqVnpLbWdlq
         Ho6F4VHG3eYUn+4NX9M1sJDSDJ35CdOgeyRXsoNDnife9sBDUWZG3KObVYBsCruBn2fH
         jmi+QowAxm+V5yJq2fHruZtQ57hgtNszoVfOih9JMmQBJWjmb8XCXoIQn4XIO2X4r8Ve
         yENQ==
X-Forwarded-Encrypted: i=1; AKwUvByrUnrbU/JcyNpZ+pdMmfJgoyLh5b3M/nVTlcFASOx624qgbOzhIP9cRAfYxRvpA408YrRANJW26rg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4Dd0MN37fZanL4WXisukZ7+vmGS8MGUUEJ70nrTen4OErpkQt
	U7s50/5b8cfEFI48WWBj3jMzA7PMRJuChC/jV5YPyAy16GOnZnS1LPpY/kRt+tayz/vT8PTDcBq
	GWY1HvIS3CHhazTUy/KeA+U/wQ6hAIKEaGcMLyba1sXCgHLFbyei0c7XZrVJVxV0=
X-Gm-Gg: AYBFou1BFASQzNuDso0vzSkcFShyJiSqhboidH7YhwPbokORKYoJy78D9RvrWt/iHL4
	FjWDqLmCk7ay/Wt9oRFeYB9h9ZO4sH1V7OXEqC8QhcLaxgs/EtpDpkUnCUfrLxR4petAYW6vs5a
	9kH9B8ps0TbnSfalM4T4Y1jsTjO7si0NilfFCPehc5w9G0m69x2UYzOqJ2JiHH8Bb1gQWVDmRVV
	kcJ8+2GZxAc+7/NQgy7K7SEYsxfUlTmVCjZ9gZVaW4POcHndb4pH4pBFsmXLh6U6mxlCIHC5pGu
	XVfPqZJ8+jKXmjtGcPP41CrNXeJCC6rsZX35hk/ixgU+Sxtu4lXuUK19O+0gmhdKmi1Bupy/N2k
	Pt/0LpKEFru3qduiqVNHKGg==
X-Received: by 2002:a05:620a:1a17:b0:93e:70cd:e420 with SMTP id af79cd13be357-93ebd2605bdmr3512979785a.5.1792060114451;
        Thu, 15 Oct 2026 03:28:34 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:93e:70cd:e420 with SMTP id af79cd13be357-93ebd2605bdmr3512975285a.5.1792060113895;
        Thu, 15 Oct 2026 03:28:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203762b6fsm2277016a12.5.2026.10.15.03.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:28:32 -0700 (PDT)
Message-ID: <a87613ea-5f6c-4697-af4d-1110c12f799d@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:28:29 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,sm8450-videocc: Fix clock
 inputs for Glymur
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-2-shengchao.guo@oss.qualcomm.com>
 <20260929-visionary-hospitable-beaver-e2c1a5@quoll>
 <arvGQKBY9DZlS2EJ@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <arvGQKBY9DZlS2EJ@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX5FhCywpEOHB2
 eGq1c6i4AZtKhPi58DRi9QvdmVLG+IEWq20wAgECtMrF/pEYRQF7g11p43pHUpr0bdF/VHJmgwC
 UBMCVQZuP2YXFynCbDe7R27zoLC/ulk=
X-Proofpoint-ORIG-GUID: CuYuBBniv1brX_f7YciI3InM_Af7VoLe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX27S9dtHVSvBi
 WdZ5Eh9Z/Lv/xtQE2R/Ui8wuHAdGbirdCVZl0zK6oxWL42DtsbppeSdZ9QqVD5LqDfiSfDW4rVo
 UKIict66tQWUImNIQt5t1xN08MVBsZkfnhohFt5wecBHarJFZlPYhmEyZV4AlDiQk85pkB1Y14a
 qAFEQuTeF0x4Q8wAn9ceFU3ZARqhD08Ax523wtvAV3/Q0Qy8tQPJ0rAMk4tAyF3EU4gMHk3en27
 9L+AgBnxhs5La0QjvmwKJ1GVuvgyTq5Pi0sz1P/KhAeCvIM7o9yYCnwDuNeYshZPqXqPPON/nSg
 zzAx7wOGBZ4wdrFOEkqxXw0MVAYWJoeeWUyOX6m7/+QH3zepTJZeDz+4pRvTuO3NGM3rKN0ctDf
 /jEaaOghOQdN5KYtEJV34vzidaOQ0Z6hIEQ25SfHPeKsmp7ISEQjCqGMhBtp8pyHQwvONirDSaS
 o5vYhHJnlJxt5IJR1Wg==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0aad3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=AByBbePJZrCWKXECz8gA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: CuYuBBniv1brX_f7YciI3InM_Af7VoLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150041

On 9/29/26 4:08 PM, Shawn Guo wrote:
> On Tue, Sep 29, 2026 at 09:57:40AM +0200, Krzysztof Kozlowski wrote:
>> On Fri, Sep 25, 2026 at 12:11:50AM +0800, Shawn Guo wrote:
>>> The schema describes exactly two clock inputs for every compatible it
>>> covers, a board XO and a video AHB clock from GCC. That is only true
>>> for part of the drivers bound to these compatibles. videocc-glymur.c,
>>> which handles qcom,glymur-videocc and qcom,nord-videocc, and
>>> videocc-sm8750.c both declare their DT inputs as DT_BI_TCXO,
>>> DT_BI_TCXO_AO and DT_SLEEP_CLK, and parent video_cc_sleep_clk_src on
>>> DT_SLEEP_CLK.
>>
>> I don't understand what you are saying here. You are mixing drivers and
>> compatibles.
> 
> You are right! The argument was the wrong way round. What I should have
> written for a schema is the hardware, not the Linux driver.  Sorry about
> that.
> 
> Per the hardware documentation, the video clock controller on Glymur,
> Nord and SM8750 has three clock inputs: the board XO, the always-on board
> XO that feeds its PLL reference, and the 32 kHz chip sleep clock that
> sources its sleep clock generator. There is no AHB clock input
> on the block; the AHB clock the controller uses for itself is generated
> internally from the XO input.

I'm staring at the document and my interpretation of it is that the
AHB clock provides bus access to the controller (via the AHB2AHB
bridge).

Konrad
