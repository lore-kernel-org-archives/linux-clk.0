Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258753;
	b=laIgI2yD2mjFXOe+ZQI/2GQhXGSlVNdLG7MlstMO7Nd0AKCBtFDo4U4tY+BclutrfNlr
	 J1ApnVGU0cnFwkM8JxCrrCZuE9mbeHuvxE7EPA+Gim/54U2XChNk1ndqlPS9sSuBTt8Hm
	 UrFWeewD+mCcgEyYQQqgSQhQ9+FNLFxf1FaJdnhjtGq/gCtcIkxCoLvGHeIB9giUzv/sY
	 G5ckVkrOIwI4CySbS3wz5DdiMArxBJA7hTAGQtTthiTv/JuwmJL4CXCvAWU/H8woGgK45
	 Bwgf6zk3SYgpjhB3IZB4z8CwITIQ1VO7wroThlmDpHJFv1G4PO4Jk/8zWf/pZd+bw3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258753;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DPr/ruBMl/5HBXMrl9bzUyjfwBosBgVuKL0NnKrAD/w=;
	b=ZwHOUvpXbRyCzK1xMjRFT32KIa7xOphxUZKJ99uqBJIlWuRCeaQ7MYmiPUn4NLxJs1JJ
	 UYv4fCiiYU/MZetqKMspRZu+JpP3hclcNwKBEyheaiEYGgBjPy5wnj9jY6ce5JWlOVWH6
	 6GQiI3dI/hJeTKiLAy1q4RxF9ClCpJPj9GRjMS5ANGO8KVBJvAnnl6hfwvcfHuVD7jbC8
	 S4UuWZjmqFCyBhAQyQ1Mts25BGQbRADViltPztLIvs8wx+a0qrboNk2a/84YJIFW/lPAc
	 WlUqpc2m2UnupH9APLNlq9j1tjXfnD6Hu5g7gSsBsIqvM+QEXh8j3gMbkwA8hhzUhqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WMbDXrgb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdIHVoeK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96E7606A323
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 07:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A96E7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WMbDXrgb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdIHVoeK
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H6UE2974863
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 07:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DPr/ruBMl/5HBXMrl9bzUyjfwBosBgVuKL0NnKrAD/w=; b=WMbDXrgb+uS8dEwt
	DjFQF79dR1ep6mfPqr4H1gwzFJ35mCShmfFtfCshkwKxnGD56fDCx74h8e2wh97W
	rUa4FlmajEarcIuR6Q+OO3UwbWTaBG9M7G6tyL1Hyk0eqXgQTmA2AN3GWQuKVLx2
	uuPrEMpRfmX4m6Tr6WGDjLPQ1x7AQUvqmUY4SG0SYM/XI/0BffHG5nfx7ysB/YC8
	bO4pu3ADHcqcAyqK71NzhqAo9uuMSs0oPGhhQQ+pSC9SbPPYP44ClEvwwflZF42E
	2sLRkxybcB5FYvZukMxQsiqAG6/QtMMz+nOS7WMD8yljtdKfQFO44Qp1vuXCS/jl
	NHaCnw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkpapgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 07:25:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-943e8ff02d0so173635785a.2
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 00:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793258750; x=1793863550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPr/ruBMl/5HBXMrl9bzUyjfwBosBgVuKL0NnKrAD/w=;
        b=gdIHVoeKna41szv8b6gp1libGUqEyqW3ALWQ4rVtsZQIBV93glOGbrGQ6SMqamphub
         WjaNDUtmE599S+X2SUdAZjaKP4wuWfMQA0ZD5mzpnYYNB1CZtnXYm9XWOO+GhbHNGeAf
         Z0Zk8HtjfO0GF/G1/w37i5j4QVxnBiTUpB20xFXxnK4ZnF1tiF2weP8YfMS6lm7L+xyn
         XYa/DNQ9xCf5uICua8u+hBiu3a5kErkUjDRdsWoB2vLdOO9K2qtJVp0GiEXQ6EfocPOo
         fA+nTMEYZnDNyvIKTI9xel0ZPoV9eiqg4LBU+XXKjTD3YNvbZNrvatNe660uGETAXmrs
         wPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793258750; x=1793863550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPr/ruBMl/5HBXMrl9bzUyjfwBosBgVuKL0NnKrAD/w=;
        b=d+bikOQIFpAr6xU/qoXl07ONLGswmgGOnX9dij+W+1VKwAlTcEKZSOj8xBv/qH3kGp
         +FxqxeWpOrAKsYAdowaO/FQ7e3QJZq6pRHw31btlKybMmjSNYbdidvCSMEx7qmv7hKwq
         Srhp3XrHHpOnySytXzTWng/96uQ1ilXsSV+OSBXbXEs4Yvry+G7/UwFdaYameQ4I2yNX
         5w+VvvhCZNE1eZ/TzTNRpA6enlReOAMPEpR7eArctG87TC0p+TIIrGZbfgMBbYIF+8+R
         J0VRbiTLP4yBMscUxIfwcRYM57LNdbSklqnZyYu41Bqf6/ElFe64TCrO1F3h2gr0kOdx
         Y7EQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFdvvu4WueJSszoIZ7FULRWO48XvwVZ4Q5mtxf10gFKQp9kWh0MISrlxl+3Zv79+WpbHNHA9scYxE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDyf6sqEtoASY18wmykA2n9DfxUT+dBOJdXG038ua4fYEgjteg
	liA2PTfuntVN9RXEgwZ3RVLZB+z4FbAZ2HPr8ipyR5GFHFeIZd043EoJ4xjzyGEHr7QyiX3V92T
	IWGNHIN2/nvhjK8hVDZN5ecKsJxTPE3ScHIvXcWoWxUIF8VHT4L7xoUYW4kQkAXE=
X-Gm-Gg: AYBFou3kmpVtdlnm+AX9QJGUCi177A3F9DTJDHpKKYeb3B8Pz48hPRjaT1mkPNm46cQ
	0ULpsBHG1WFyab+iI3trnc/BnT+7904AB7BTBKDfGWJ5y5Vji0XeChYY8/ybiB811yrwE7Lb5L9
	r7FGSEvzlefax2kSI7jMy5EZao8jIbzgeGuHMMPPFB2LsUedmDaj1o7GeQEgdKtJeeVfr43Wwop
	i+uxTr1IRXaQQ5V8RN5Jf2PMNiRMLNbzTnBJ/qdfiBaGy5SbCWCaoZrPcBdqYH/sdEGl+zc0HPp
	ohSzGb/vE6P1fFRX8n6GReddjB41+a860aAPreh6yVodRDoJ0lYmVqyEG0MsxCFsfZixYzuWgGd
	QySbmjaYyxlTNwKygIbZB+tpmwJbUifzJ46SJjmnVL7ey846tneS8yGsDG5ve2kHJHycbe8J3lx
	KW1FowZacWjgt+SQ==
X-Received: by 2002:a05:620a:284a:b0:944:6c7:c88 with SMTP id af79cd13be357-94408ce4acdmr614855985a.54.1793258750391;
        Thu, 29 Oct 2026 00:25:50 -0700 (PDT)
X-Received: by 2002:a05:620a:284a:b0:944:6c7:c88 with SMTP id af79cd13be357-94408ce4acdmr614853885a.54.1793258749900;
        Thu, 29 Oct 2026 00:25:49 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e542ed998sm18038106f8f.13.2026.10.29.00.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 00:25:49 -0700 (PDT)
Message-ID: <d59a7591-b4ca-48fe-9f23-335e3bc21d81@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:25:46 +0200
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
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom,camcc-sm8250: add
 interconnect provider
To: Bryan O'Donoghue <bod@kernel.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-2-atanas.filipov@oss.qualcomm.com>
 <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
 <7ca815b3-4712-42e4-996d-4a1e53cad492@oss.qualcomm.com>
 <Sm-FvdxaOiXpzzGo30wECHdQF_-LtUaJCO3mGpBUxXfnVCYjOLE5DhNWdNmOMhYdkR1RMXhPzWuHhsZJkJ_Vzw==@protonmail.internalid>
 <20261028181040.3515955-1-atanas.filipov@oss.qualcomm.com>
 <f0618a27-cee2-4f39-a578-fcbf3c51607a@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <f0618a27-cee2-4f39-a578-fcbf3c51607a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae2f4ff cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bB782UoiXxmDKwpK7Y8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: IfXaqAsPpsFOGdjD4a6CzaSaMcQH2zvL
X-Proofpoint-GUID: IfXaqAsPpsFOGdjD4a6CzaSaMcQH2zvL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyOCBTYWx0ZWRfX1TG36dmPbb1J
 PfMXHU6UNTY9/qY6Dx707fhPWNcv+ajEdzJjGiUDTQnL1S/HcAi6an6vUvwhf66COvqf9G3WiMY
 Dlmna+7MX6ASi3G4oRz78vaGrRfB/6g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyOCBTYWx0ZWRfXwjHgxrfpjkcu
 HY8gbJki4UcQrvHsazdwGJcGHlQaWp3W8+yxH53i4auU9DCkpsKfqEfWqHy6NNa0Hw+VYEz+C7Q
 /28wvPE0mgWyjN2zFABMROh/DEn5/W9MOwO1N/tyeI9B0rQJqMhbfVV/zion3JkHbOXPTnURiMJ
 VOOpOMoD7sgm9z5CZARkTCww8+FbkZl3fjM0d3OmTa7khzVptuoMnmIjKlOsHb2qcvEQ22NGUZz
 A7RrQYV8CZecf8txSZ17ISggCr4NYxBtSfAYxrXmi6iD7q3UNuykF2MoBfP2VvWYyPkrhrxP0Pb
 pAa4iIv3WOoNH1w8VhFYMttyGVZn/rKQ31Qdw1I3B6WW67xGi8zTB3AT5QgjL7cZ7itrEPfu5J7
 JmjNwcEQFMyznoteDi3E3J5xqlLpD/ABggWC26EzkxiuydaHVeeCH+T6rnaQY7hvgpHdBrHHMss
 Cy5wibsm1xXEMYgJp1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290028



On 10/29/2026 12:00 AM, Bryan O'Donoghue wrote:
> On 28/10/2026 19:10, Atanas Filipov wrote:
>> What clock votes cannot express is why I think the camera NoC is an
>> interconnect:
>>
>>   - The camera NoC is a bus with several independent masters: the VFE
>>     write ports, JPEG and OPE. They share it on the way to the MMSS NoC,
>>     and the camnoc AXI clock sets its throughput.
> 
> I've always conceptually viewed the CamNoc as just another NoC that 
> happens to live inside of the TITAN_TOP_GDSC power-island.
> 
> I think the trouble here is the CAMNOC_AXI_CLK is just one clock, it's 
> not interconnecting any two things at all.
> 
> Noc entries in DT usually look like
> 
> interconnects = <&gem_noc MASTER_AMPSS_M0 0
> 		 &config_noc SLAVE_VENUS_CFG 0>,
> 		<&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI_CH0 0>;
> 		interconnect-names = "cpu-cfg", "video-mem";
> 
> In the second case we're connecting an MMSS port to a DRAM port i.e. two 
> completely separate producers/consumers and we have specific ports that 
> RPM/RPMh is involved in managing.
> 
> Which is not the case for CamNoc - here really we have some shared 
> clocks which we need to calculate across components within the Camera 
> power-island.
> 
> In downstream the CPAs code does that.
> 
> - icc-clk would I think over-provision clocks
> - CCF would as you've observed under-provision
> 
> - But a CPA's analog in upstream which components set/consume ?
> 
> That would work.
> 
> After all what we are doing here _is_ specific to how camera works. We 
> don't really have many - any ? other examples in Qcom SoCs where we lump 
> a number of different semi-independent components into one area - ICP, 
> CDM, VFE, JPEG and ask them to share aggregated clocks - in a way that 
> is specific to - guessing but - specific to how these components get 
> modeled in silicon test benches.
> 
> My vote is to replicate CPAs in upstream with a CPA's icc provider driver.
> 
> The bandwidth calculations are already proven out in downstream and if 
> we get it right - potentially its something downstream could switch to.
> 
> We could even use the interconnect API inside of the CPA's driver but, I 
> think just doing votes via interconnect and icc_set_bw() into icc-clk in 
> the drivers directly won't produce the same bandwidth calculations we 
> have in downstream - which you may loathe downstream code but the clock 
> calculations we'd assume are ~ a pretty good starting point.
> 
> So; make the CPAs driver an icc provider.
> 
> cpas_icc_set() could/should absorb the downstream cam_cpas_hw.c 
> heuristic for calculating the aggregate clocks.
> 
> Its not represented in generic icc-clk right now and as we add in more 
> clocks/SoCs this disparity will grow.

Just to add, there is a CAMNOC interconnect within the camera subsystem
that handles arbitration between the online and offline engines and routes
the data to MMNOC.

It also provides QoS settings, which are currently configured by the VFE driver
as part of set_qos(). Therefore, I agree with Bryan that, if implemented properly,
the downstream driver could switch to this approach in the future.

This raises the question: should we update CAMSS to use the CAMNOC provider and stop
voting directly on MMNOC? CAMNOC could then vote on MNOC based on the aggregated bandwidth
requests from the individual engines.

Regards,
~Gjorgji

> 
> ---
> bod

