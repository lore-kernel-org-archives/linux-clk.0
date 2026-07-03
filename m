Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2A833ADAF
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 07:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783062964; cv=none; b=LO69WYBQpcA5smo4tat4TS+kPcVl4F7I2XConYBL86YQZAEDwG9uJLdHUKf/J3LW1GKLPgSKk3BvCxHCRvXzYjcc3y9kI3VJUXjWsFRGBRBqncG6a0/hhRLzEMHxjh0rAsXWS7bI9qnczzCaHssTsXavbFqvx5hPOUQABwOLQBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783062964; c=relaxed/simple;
	bh=cwuDX5efvdB0tlIIfChAEj2/O8HQE8H7ErhTTNT2C08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ylr49EN6tMgKplxdC5u84mdjLBb40MahFzRnvY6mL/NCME08AI3EpXb+IMMWWMCHhSsxeiQvtgFEUiYvzKHcR6ti6k2C96HaMhki5thzTvrj9LdEKbrY5Oyi7dTEfb66rCa3TPknfaWr59jPMw+IbWtDtQiYzMatiu7PTfCpSJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Spmt+m5k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b6O0Bg7V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Spmt+m5k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b6O0Bg7V"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66368B1q3053832
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 07:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cwuDX5efvdB0tlIIfChAEj2/O8HQE8H7ErhTTNT2C08=; b=Spmt+m5ktSNHvBKI
	eJ0P4rvCFfucl6MpwY/vWvwUaREHxZhLd7UCu7We24vFtAfIdiZIthIKB04oHAAN
	EsNHTlqrRTXOMsx7WiYTzJ6dDrjx7wnOImXJd3x0JiGkIi5FwtHXtJs8hhWDiolt
	NCSsSlMq7BxlK+zga+pgTXOnlhcln/Klx5EfW52Jjq3fqqkvkNThWif8MEAeXTVL
	KyKoCasRF0KKCCqZdpR7GQ8z5Z63mLB6zLmIGOD0x9TboJhXkcCMOVLmMIVEmL2f
	KpZeoUnk/TV2EzIcK0hWH5l61EKjPObnRUZppIIKMkqvMx7BDbIJ8f/6o+pRa/0u
	ZSseYQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j008hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 07:16:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6a7d3645so4708085a.0
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 00:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783062959; x=1783667759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cwuDX5efvdB0tlIIfChAEj2/O8HQE8H7ErhTTNT2C08=;
        b=b6O0Bg7VatTNQnCWxGKNd+Lp2atwYEeE4Md+x6Bvab8jr2ZX8xukbm1dxem/ocgYOn
         PJ4HP6fx7QwFxZJSse81KLHe5jitbMxCK0giVt8KY+haRuPkDIk+PRQsUKGWfxyOotah
         pZv1AKMjpaZA4ju9lPPTiz+2KV9iOL9dG43rrdaidiAkXkpCo8UVa9Y3V2Lrmz2YSJQy
         5gXSg948GdPlvn3B/bQO6s1853jDeZzc6b+GsiJx5MFQtUExG2DSU/pEGuhlEfnYBWz9
         2TdfMnWjtS39Dcd++L18obpyF0pJ16KbKgJv/wanuV5Y9zz+dDiLy0OLdKikCCjPD+x5
         Jsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062959; x=1783667759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwuDX5efvdB0tlIIfChAEj2/O8HQE8H7ErhTTNT2C08=;
        b=gdJ3KUOYn5x7HRLTV5+yIM4szYjFB3b69VEUCdwxv71fz9HDKareXKP+8JyBqEsorx
         WX9AtPW8i/fFdJDT6W3nUlNNAV7Upg4ZN8VL5oUHMLFncNBB4kcS/0PDFAmkFGuZbRWr
         Kj2L+7fs5SqCswcgdJJoz4yKXqffq3bSk55FwLgkYfDxeuxINazpbPTUhIoOZasmWvBV
         YrpXZvn3TWpIrAaHlZWv/wyyg/LAAMiu4r9XxmpHg15UpCnl4Ogx5wzEIK/lZbeIp4GH
         +N6IUFlHtJTQxuSfmuaz/lC7IvsoHTxIAdlAKFbur06OfPMXHMnbro7S/fauML1/hXto
         hseA==
X-Forwarded-Encrypted: i=1; AFNElJ94D7CqPBLS7k2rMgPbfM6monXSxojpEJXxwBdcu4Rn+X4jSFeZrOw3KV6eC+DtCLhaVev+J66ytoo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3IFfOqd732zKXj4le2EHWbDdUsFoEXw4XcBHVW8xvWVevSfse
	Goe/iTiGL5nPZQzhBGpksNNx7LwoYOlWsrctlMw+AIEdbyu2hukgDMRj0GUwXNboJu2t/RNV26t
	jBWuIEvHHTQ2+0gqdnjfUbjtEPjKdtYUNpkZPLbr9nWtHCOI2NPnRXz9abiGy/qE=
X-Gm-Gg: AfdE7clvs95yYSsAqBPFchz3eKGIacHTI6rueJBrTDkOjIr9hUXt/KoOAOl5l005CeZ
	u+X5JYhgRO9xuJ+6xOKTbejcTlJueZHpsiE1g+RnyODw//UKE+TLvcIHvYnofpt4kZ+iCiMcWtx
	JbkfgRUzfzkvvl+8XgfTmzh0/gnZrMLL5GVflQC8pu8XtvX9yuNTHKTRApwd/GtHH+itwvAePgQ
	VQLK9pxSSiTHw1zBDYxFPEh2JzAmuUUGt6rVKcv+fTlqM4xTogTh3HUgkZJtMDgR+LZ51xQr/3r
	2vur6vXExRacUu0gTi9njNsvzeLXT1+7MlAOECBV9Pqdw1re2HQy7HRBy5o6LBMBNBwErEosvfO
	K+T262Lk5A+VVia6XehoAkyvrszPSfevfjhU=
X-Received: by 2002:a05:620a:4724:b0:92e:7662:8f19 with SMTP id af79cd13be357-92e784f3766mr810629985a.5.1783062959480;
        Fri, 03 Jul 2026 00:15:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4724:b0:92e:7662:8f19 with SMTP id af79cd13be357-92e784f3766mr810627685a.5.1783062959105;
        Fri, 03 Jul 2026 00:15:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60550desm244113466b.7.2026.07.03.00.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:15:58 -0700 (PDT)
Message-ID: <f76c745d-9bc8-4850-8776-45e8b04710f3@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:15:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/19] clk: qcom: dispcc-qcm2290: Switch to DT index
 based clk lookup
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-7-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-7-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ox6sdF1R5auGrwUw_2ZDcEhcMXLAwbjY
X-Proofpoint-ORIG-GUID: Ox6sdF1R5auGrwUw_2ZDcEhcMXLAwbjY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2NyBTYWx0ZWRfX6CoZvb3Gqd2x
 cqJvID0jHJN0VkdIJ3ZmF0bA4fJaHYA0j3C7hu/WmYo2rK9bQjb7hkifxrKDx5RpeNUbEYwUSIg
 iAXmQwfzQptq1eEt2B1LFmJGD2NYRaI=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a4761b0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=IhUa5yoPuCKIE7YosB0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2NyBTYWx0ZWRfX6HgpQDcJiqys
 ttjEd1M3DTsmsu+8juJsHX2RNKV/JS8RmmS+ZFgyEQmzby3CQfxHw0g0JEoQcrwqQlCVlYyf4vo
 KGN5PhNvnwJ/g/bWS0Lyptgcq51WTkH027SHzSS3ZxEjnigC00in44Bvra1SMIRHDLsrEtPUkoo
 VrP0HpdHxSiRLvxr7OGJ92d4i2YQ+XFJRWEEnEi+hW2iENDDEx4193BTgdsibT+M1yn3jeKJ1GL
 K7Rmrsm1WsOzT4hHZA24isgWf851KW9YST6LPnLJl2JvPQ6PCFEHeShGWKIoQ+LAZgxKusAHsFy
 2RyEfqqt4TmB61JSS0phj50zRCWZTln1a41pRA6ssJ4l29nQPHUCthcDRdhZacE0N36KrRK+NkY
 6jgKKMrtL7v0RIMiIwTDdvGzkhXwK9/ooU8ShHhbCpT4nEiRXoAdObVb2XdBmz89GDPt6tTQ/nY
 PUYA3PF/jhG4agex4KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030067

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Update the QCM2290 DISPCC driver to use the DT index based parent clock
> lookup to align with the latest convention. While updating the parent data,
> fix the MDSS MDP clock source parent to use gcc_disp_gpll0_div_clk_src
> instead of gcc_disp_gpll0_clk_src. This parent is currently unused by the
> frequency tables, but should be corrected to match the hardware clock plan.

That change is invalid according to the agatti clock docs -
DISP_CC_MDSS_MDP_CLK_SRC RCG leg 4 takes GPLL0_OUT_MAIN as
an input

Konrad
