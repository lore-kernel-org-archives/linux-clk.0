Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA7D49550B
	for <linux-clk@vger.kernel.org>; Thu,  1 Oct 2026 08:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842572; cv=none; b=mlAvQKve3PV9oQtFOvVZHH0TGFhuLmqQnQQV8DuDKqRlpqVVV4OEVx1nUxgvjSOdt4pAiCkpVF6e3l/TcMp4sj/gJXikONl0KXEd0HKxrN9o4Q9Ns4KwQpiKkkwBD1XD1/DFsB3TRzmyEmIZGj1qChY6oKQso6hbnk0MRR6drqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842572; c=relaxed/simple;
	bh=/1DwrtXLUl/SM+2pkFpXTJgQKtSS4VCZ1/ENKW4q3t0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bwUOtSa/bpSckvCjLFBEIUIhmTRLOIjAXbazzeHcP+1KY4XLLk8JwE1tnTIF+8Z6S8CrUyXMpvtn4w7Ootn+v+wRRVtky4MTTDI3BH39WZgkoSnpmIxI+RcyyGeXAg9dOGMJKJZtRXuMIAOWREg8klaOwAcvu88f70fP+IJOsRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UdllZzkY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+yzmMSz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UdllZzkY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+yzmMSz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xlbp1661059
	for <linux-clk@vger.kernel.org>; Thu, 1 Oct 2026 08:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UbwMEoyhtt/fORRnWenyyzMm1ZZmj7FoSP4RFKxRtPg=; b=UdllZzkYWDkK7/KK
	xaoDcsiMXKjfj6cDd8ySh7ZrkKLDSOYOgkPMaFYADhkSj8V7O9K+VM9AZfIV2YYD
	zxTAULs8+UKfxPmEdni2F4gDIvp1nZq1dwQW6t95TZrIzainWB4mScRNEMl87ngq
	eSng2HiZxC8jQN3SxqFX7SerJ5OQq8vXY61Ta0wa4HuIuyumx/VFPpVWRiJowV6R
	CM6KUU4Iazw75qwl9aaVZyZu41Puk+tr6i5MXrsQQ7o50n9vG75kndNjSuCmB3rL
	jEepRG7wt7DguimbJVFK7ql/cDxPrswL3ogMCUW4xeAsXtr7VcEgdZXSrvA6ATUx
	tMg34Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pk7bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 01 Oct 2026 08:16:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c9a1cec69so39775985a.1
        for <linux-clk@vger.kernel.org>; Thu, 01 Oct 2026 01:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790842564; x=1791447364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UbwMEoyhtt/fORRnWenyyzMm1ZZmj7FoSP4RFKxRtPg=;
        b=d+yzmMSzl3XLCWtrCRGbOiNaIVplCTlbWuWPrPoTxr9jAONOGRbgmY6nakg6TH93a6
         O9FXDe8cgX+oSdwsoib/+0lXpRYeFgwiVddFsmpJT+Sd76NkfgyzSrjuBtbZdeqrBcrD
         6mGZNI7wIr/uobQMQ3uFkZ6pgFHRnpwlKyBwVaQKONGFRmcTjAsChDJyOMrwt1cFzjYK
         iKqmtOIgm/fFhC/1IKNiGyQmEZUU36bsSgEuKhnC+I0r9aHmTsZGmziK/Xy1XviBLwT9
         6fiNGiDJtKr6PEKADlv45X7zgSpMmPLEtoqzQwV4IJt0bGJxEH2hhtEqQSg+yaPwzjqd
         3tYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790842564; x=1791447364;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UbwMEoyhtt/fORRnWenyyzMm1ZZmj7FoSP4RFKxRtPg=;
        b=uNe0Po1P3m+4ItixOPkH4MO+Tl+5jLyNPbgAd1lGOPqzPij4icb0H7vDaZl5jy3TfJ
         23ddSqmPyyQeaxdohloxBN/27caGOCKNdlqbELmafvFl5xpvUG94VDU7/XKSlFA7DhCR
         s6Uv2KASf3lBCxTjLZzQgeGN2O/Z0hUvr+QpbWlwofiz0rbkMmg7ZjeOCcMAA177NXno
         lv7oliRRgWYGvejzf0MR+YAOp01CFyG4qJoGXVo19DslPatE2iFxyrBr/wZzFPpYGpuc
         UlIDOaRNMEVbrVvIXd00a3mamCPPidSjRw8FB/zN6pIML+tULDWY8VZYHel+1D0K8Llw
         6x5A==
X-Forwarded-Encrypted: i=1; AKwUvBzmx0ibk85fvb3oZem3GBE33iCsiPDVHf+UEzYgTXgOZ1RP+DGRHuBpSKZ6GGryoRQowejZU8E/Dqc=@vger.kernel.org
X-Gm-Message-State: AFuF++n6oW3qc6SA7ZgVarMgnxXH57DkgGKmZP5SKRxtbs035lSoN6m/
	3pkxEr111CBEuROcRPYxqUKFGoLf+3RVrkt/8zD5ynhlG9gLGRClEKhqoxkjL79dxAN4YPzL+qG
	Fjqwxk1SrmJUnNc3gbRiPh7xmk4VKMCnz1vD+5midp9raLNP6o5fjBaMxatmkcYA=
X-Gm-Gg: AYBFou1pFMyfZzPPKNOC82J0Qdfey/s1Aec67wAsDc9Z1h/nJX8FmpqBePUyriKzcd5
	LPozivH64NZRdD4Wmj/gRBxQ8WjcYw2yL/wKS4zNit6f8+P4Ajoatj+n7vG7j6hNv31cI9hD3zY
	rGp1yP7SV2ilsgOr1cGj6nmhSJupKKEPB+hFeo5ncxb3zxoLIljsf8EH+2UAwg2CNvzwI2cNA4H
	e7yNP6o6012AgxF53Yk5QsMJcqD2DPk3EW4OikfIQ9eOxmXngHKSXglUj75qfGWW5IWFsxI/AI8
	gO1uT3hsEkR3cIP/1bnV1OjWbYub6z319aTuRHB2u0JKpLe3mfaoW5Bg7fbCw6JDbGW5uRfmoc/
	C5SChdt8bjYJB7+CCUTg4KQ==
X-Received: by 2002:a05:620a:1a23:b0:939:9205:4d78 with SMTP id af79cd13be357-93ca9704feemr635879785a.3.1790842563969;
        Thu, 01 Oct 2026 01:16:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1a23:b0:939:9205:4d78 with SMTP id af79cd13be357-93ca9704feemr635876385a.3.1790842563375;
        Thu, 01 Oct 2026 01:16:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d86372sm106000166b.56.2026.10.01.01.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:16:02 -0700 (PDT)
Message-ID: <67eb0b53-6c05-418a-b1c7-6e7264bf794e@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:16:00 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: gcc-sm6375: Use common clock controller
 probe data
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260930-clk-qcom-gcc-sm6375-rework-always-on-clocks-v2-1-eaa893a6103e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260930-clk-qcom-gcc-sm6375-rework-always-on-clocks-v2-1-eaa893a6103e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tGtqkgHq7ZoVqZfJFK8qve5RDDwpnQ8B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMiBTYWx0ZWRfX6uqBW+BEXgW6
 M70BjRxx4WC1kfY3LotWmpzWbKSw4cy6bjzgnnIZ8GXMeHimej7IdIjnosWIDXFQI2aQEYiI2kK
 QuPD5zgEXnOeh31MVoz/HvKUYDNw3Mc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMiBTYWx0ZWRfX28R1637D3ep+
 XWwwNWCDVV/Cr6z9UvhT1h5gMeuZQN+1SKOmPMgR0H0AeezZ8yvGpoeaF8nMBQWlPn8+pcLwOcf
 KntxvFwSx73mCFRgpv07RnDo+Ry6esJWJ+pM3SORs9L6e2gYgQByzaQ4/o9G/eCVFmXS7URkP5h
 Ekf7YVyRnP0sL9S4fulPg1bDQ3RtH4H7z5ATbkm9vI7UvD7TtxdY06iFfRmjTKrqnZiGCZ6Zq6s
 W7HkAkIduz0tLU2+C0JxRQ3z+MHtY952QJixh5K3LepK/2w0r+mR9OqnFtExfeJ9NCz+3rOfX43
 bUPM3uT9VU0yPBesL+p1daOa/cC3u+VQHVshrVyv84jPgH6B/SZdFxQi3L/jLpKCiPAVy+pRZTl
 PMwgYzUKpJhqqryU63ATF/G27K8bixAUtasX/06UFstmu52AvTWyjf1eQnYknX27WOKwC+o+VgW
 aw6TksZkDt1E4TragmQ==
X-Proofpoint-GUID: tGtqkgHq7ZoVqZfJFK8qve5RDDwpnQ8B
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abe16c4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=n0B6JTkGe8lfbm6N72oA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010032

On 9/30/26 3:53 PM, Abel Vesa wrote:
> Move the always-on branch register offsets into a critical_cbcrs array
> and describe the DFS RCGs through qcom_cc_driver_data.
> 
> Associate GPLL10, GPLL11, GPLL8 and GPLL9 with their existing configuration
> data and list them in alpha_plls. The common PLL helper selects the Lucid
> and Zonda configuration routines from their register layouts. This uses
> the common initialization order, configuring the PLLs before enabling
> the always-on branches, instead of the previous CBCR-before-PLL order.
> 
> Use qcom_cc_probe() to perform the common initialization instead of
> open-coding it in the driver's probe.
> 
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

You may want to adjust your system/project-wide prompt to not
be so noisy in the commit messages

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
