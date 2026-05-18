Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F743E4C6B
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 09:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779096135; cv=none; b=SdyZ133l8EaJj5974Ll3lHBSSOPrypAOSHcEOKFmqo4KBEMJXfqSSJbtTKKIOEZLqZmHONdLvAPSEdvuO23HnXczPM+c1A/iGG9cPFxryJ4qo3ASFu05hgNwRRDu8cqqR8qrOj2XBqUijvrQn6582U5gfePlKgrE96o5vteZn9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779096135; c=relaxed/simple;
	bh=iFSI8icvpylz1bxvTMkewtKF+ZSbVOV5fY6cH4IU0Xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=possCyX9rxfxbnJcNdnYS1xPKiy+RFOKs2VirSnfJJNNdHtCmB2nc9PeVD4Y+G+/cgGtgrzxTxaGtOjlhPYVYbu58AkCpttGi3STU7xU5HZiRhxKGHk0Se9GhL3o6msGgTEqIwyY293k9zTrUnTS8gHd4GPhKEPf38exGuPeBLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OAshXtPK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YD9K/O7u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OAshXtPK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YD9K/O7u"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I8bS5Y2260316
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 09:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iFSI8icvpylz1bxvTMkewtKF+ZSbVOV5fY6cH4IU0Xg=; b=OAshXtPKSwEhF78G
	kKJB8grFb3ryLy2oMV+FrTX2j8u6jc8/t+h1WY2QxGcKsWrZzKqW0V7J3DkiqwEm
	dWU0KIbsk+Ed6lTSUgVC4hFmnKx7Grvz5uYHgge6GcU0L8eFyjviVwqsnUI5pB1Z
	bWCAZxQXt9h+oAn0mj/vlU5itqDdLZ8GPoT2WBPZV1auwArMH3gEIIM0BGUJRmjj
	eKKIY1Elva6EjWPzUhduaRd/zydiC1T/QNv5aFAG6BKQC3VEUzk79d3q8RlVFiUP
	YmAh3ioZjKAsG4f2yqXBQf18ozX3OIAetyasU/KwO9Z+vbvVhVvxS0lEPLak939R
	MkgS4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqwrc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 09:22:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb98b09d3so7566481cf.2
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 02:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779096130; x=1779700930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iFSI8icvpylz1bxvTMkewtKF+ZSbVOV5fY6cH4IU0Xg=;
        b=YD9K/O7u3wRhA8FrP0PPoKqCnrKXaeHi1HY8LcyX2Ci+qHyzlQoR4WJ29nASRE/Dc8
         FrnvpDOfCmpxq4u2XXXoXLwguQUZumhlimzGcSetl83lnNvlQ290ybsbFA932PR7jlox
         w+YAJzpHvgtHobxKK6b+79Vc/kWypvYoxmmqK80JBciUu2i0zsTXbSCI93M3AVXglnEw
         iYxErAGomK7lhru3iLsP8zcUpe7nsT5KuzF4htXOqogGg+jGP0/31eJDP+8DFnXcyaA5
         oGxKBa8YOFElypqdRyv7DBuOCE9sknOJlLcqACbQZifD6o7DsGhNDBVXCGz9vR6Xi25a
         hV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779096130; x=1779700930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFSI8icvpylz1bxvTMkewtKF+ZSbVOV5fY6cH4IU0Xg=;
        b=ZiAoz10OQ9/TNatIofRgfkHZfBnzWRI8ekLkI1ofLbh9Z6RMZYiSPgRaO9uV/iVfpa
         2/O4XSpit1L5+I4FbeVgmgZW5qk0eYb2StRUrCrsEo/zKOC530gHmmuZ1XXfAlTYAwoh
         EkQlmk1UNWbWMnGTqKm8/R0rfAQQ/Th09nqEnZECtz1Hll5Q8GBlnHbke6+ZUaBhFY8B
         3KTxMiMBZcp+yZ7VNo6iFcyDDdHNwPP9/l9Y3EC911hjg9TDHdKjY0U+JZgfc2E7lYo7
         voFyGGF51lzdIYz5gY5HvKXI4HDyvtO/SnO118th+m0YYsgoniPBLP7Ko1mTwcob6AB4
         DdOw==
X-Forwarded-Encrypted: i=1; AFNElJ8UXtSg4jUWPNxQCRORq2up67QfWZ95yPQadGbHcQpzzosQMq9th4aUt9TS5ChkKVLpuCCbl2e9sPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUD7N7XqsLLoLc3pPHT0MGbLVirFbOp1RXI1FPXhhTihr5aowm
	6gpXi2ceakttekFmZ44knsEotuuB5C7p4La9JsI8rQDC1bOy+1qms3NKef2BTJ52iJRFEbVQa0j
	qHv22fNopB+btqgwJT4rxfYenodEw+54NhP7XriBq5v6dDhnMiuxYn1A9BWfX1g8=
X-Gm-Gg: Acq92OGsUUCw2qs7Cg1nnzJJPu89aJwM5MjIl+0gyq3YKDyUJs02Wzr4gdcucRWb1Af
	RKzAOrz4Zz39CpHTaspCDaqrz+gICN7s0v/JXglOtkq/g1Zqo3q5Iybeb2fx0jtTATvMCrEKurn
	UitMMiycyQv9X6pkDBhQomBDBuMI/ErOaBjo2oYDGSOf/D+LFUWlbuVA7mSzfdVdmZFgrE+uyc3
	SnmN6xZcu2csZ9awSRO00A7+PvrZI47btw3e8ZKhT9RI4jlYS6yq2UPHh8o/Bq/IXOp5sh0AtEP
	+xV6PVHWIkyof2QVoDC8EUvrGaLdRn8zWl2sLTYOzp1f9OUPHgUt5TvEAD1Khc3pFc8S68akmXb
	wDCpSPAPL8d18xiQGD6OPkdKo7DoreXz9Vb2lwN/hGuFWgmxSwUB4yJWHY3q9hG0WijmztEFgUd
	YY9dg=
X-Received: by 2002:ac8:5945:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-5165a003534mr148722801cf.2.1779096130027;
        Mon, 18 May 2026 02:22:10 -0700 (PDT)
X-Received: by 2002:ac8:5945:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-5165a003534mr148722631cf.2.1779096129568;
        Mon, 18 May 2026 02:22:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e5089fsm543797466b.49.2026.05.18.02.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 02:22:08 -0700 (PDT)
Message-ID: <cbf66c6f-9418-41bc-9d0b-f1af0fe89485@oss.qualcomm.com>
Date: Mon, 18 May 2026 11:22:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: stop enforcing INTERCONNECT_CLK dependency for
 everybody
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260517-qcom-clk-icc-v1-1-1dc6ea8bdcd0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260517-qcom-clk-icc-v1-1-1dc6ea8bdcd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YjATl21uXmSIJG-8iR2cegV7OPK3hiMW
X-Proofpoint-ORIG-GUID: YjATl21uXmSIJG-8iR2cegV7OPK3hiMW
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a0ada42 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ktYNcK5Kl5BpbLUalNMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5MCBTYWx0ZWRfX1DZCbllWMOHy
 JPVtmOC4s15XQL56eKodowbWFT/uPmf1QW1GUlkT5Bs3n9qKucp7FnDjkNunrItPqElq5N0bb5/
 3htEQwAzSEMR9p9zrpPoBbFonfpfcTMixWYFLILpATTwAr5ty/4ZUeOyHiyjk2HM+f40+7oNUlf
 2Lg/lCzQfQ2ETxsTJry0OYgUnRwalhhjKh7go0U+8lRzkcQ0F27sKiv/v6Vl1DuFFkLgCJGtAVQ
 4iq2g5+Y5tVgdW5isoPwkg9vIRh2MnNg4nir5X+iu8ozDgB9jKIeQtrLMLYiJIge7aYnZ9zF35Q
 ny9jPiamDiyLNHENn3JwICX/uS8j83STE2+8JPwW4yDzDm8VR6yd0W9XAktCjk5yTV8a0PYkpyG
 oR5KgQiXqr39D1NulG6HsTi2cypu1Gh1o7d0Rs7jpNbeZVE8hND3bzTzPge0dDDhKdnZcDIUjQG
 L/u40CI4wPIhitcldJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180090

On 5/17/26 8:51 PM, Dmitry Baryshkov wrote:
> Only several (typically IPQ) platforms use INTERCONNECT_CLK to turn
> clocks into the interconnect providers. Stop inferring this dependency
> on everybody and set it only when required. As a safety measure, make
> sure that the coresponding clock description fields are not available if
> corresponding Kconfig option isn't enabled.

I think this should be a 'depends on' instead, if you like having
PCIe/USB

Konrad
