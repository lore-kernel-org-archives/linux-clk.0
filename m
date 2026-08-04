Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F7B474249
	for <linux-clk@vger.kernel.org>; Tue,  4 Aug 2026 17:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785866202; cv=none; b=tWtI92vSofb8rGEGDxTjTHUd7O2EFK/OLX2lphFRYg78lnEA+maoQIwfbeZqapGUkdmi2wJ3vgQp8oZp9F+66kMJI1xx3BZzWoQjQ62TRbQXtitJ1j2663FVk4dvkmXeedj4bEv+DNP28k+3fjBH3jLtLAbp+lE8dzKs0ei8YMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785866202; c=relaxed/simple;
	bh=OuX/C1TtvHCOGmrVIm3mqzAHLgbvc4K8VI0cI+MqO1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TSxREUn+KMbw8/wqD3ki3N6IJZMoo/txlVCkdJLFpMNhT5hb71P6s7JsJeXOcctM8Ny6kbclyKdjxP43kYOXoeo41aTXB+rm7hX2XHnkq2tclj4nvG20NcIdZ3Jjn6I0QMS5/iLorwR15gDYo8/eh8X8YqKfeM48iyUMp2OI50s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enbAM0/+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SvB3h3Ff; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enbAM0/+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SvB3h3Ff"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674H4lqg065680
	for <linux-clk@vger.kernel.org>; Tue, 4 Aug 2026 17:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEllbW2amjEC6Fq2iKDcJ/pEbGG9Dwld0bfe6YT1m6Q=; b=enbAM0/+7KAK62OZ
	GdHZhcpSH+V2gELpiyIYQPBNgso4TYVpWNST7F9GpVdmT4YTLPHXmbOwCaLd6+D5
	cObDTUMxCeqHSFTfQpyEBy3jrYEh0OU4Of0TZvPv/Im/53fENkOa/x2U5+r1j+Xi
	izc6FCltOUY0mzWuS5drVnmgQ7RnWGq2g4lNXNTqS/OV1rs1jz3KdSjLytTI8NaQ
	8/PCGCaJUsMJGdifOxLwOVpQzCDD/IOSYq4M7lGVl6gX4rRS1VmF7g20xVho3YVx
	TymT/LTvNS3DO2vGLmiRDfutwBMTLRDhDpVNyJ6WCD4vYi/5jfFpYprAX1Z6kJ7s
	Pr6Ssw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum568a9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 17:56:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb835525b10so35037a12.2
        for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 10:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785866194; x=1786470994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEllbW2amjEC6Fq2iKDcJ/pEbGG9Dwld0bfe6YT1m6Q=;
        b=SvB3h3FftsJbWOditUEM4TRb49DIp+Monb7c7O37/GuDV7TaPP2FTY5NDcDgFEFeb3
         lS7onigr+3pi2lys5McgyPS7fHRs0/UlEADHBbNTwLKhaq7DGqapz03OdZyMoNywK4B+
         DbTj6xI4/c1bTWOGC7gHs543Qn7Zv/7HQ93weWphj5wjZ7RSVY3ML96lPeuvaMUesbVD
         kPTmmOzqJN/7uROtpz0HY1ouJ5pmoGUc0ULGg7HUHvEDxsmYuBihyA/XvD2FXnUiddIY
         1LMDAenpYmwAYwYRTevvk26hCr6EjgqayDxzRpVRh+MxfpQt9RjO1ewWVB9hSsMzI4L+
         9A2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785866194; x=1786470994;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEllbW2amjEC6Fq2iKDcJ/pEbGG9Dwld0bfe6YT1m6Q=;
        b=Ngtiqq4A8fDfzVbS8vy5SIlMzbtoB3+q1SbYEo7yHJCuRiAl05z4Ms+g+16V8VflgM
         6um891QoaxBcMLfc9qohPwGM0jL2q7UywX2HYeIshFU24C2NX2Pha7yIKE/CHOMMo8F7
         u4e8twOCaaHR4nj8hH43K1mXmIP3TzksM8/JruQdd6ebLjWQMQ1CkCJrekdpQaQrvXDK
         0HNxxl+E/d/TUvVrGA+pMw3IqBMw2NlLj2lkom0ueW3RgkqHoisXK/Cifw5PoaZM6bP7
         zOOv5Vb0+iOrq6PU1e1qCSAFEMiMkiSew6AWaUb5QAchcuo/QXFJH9/k/L0qH8HGKegL
         SiCA==
X-Forwarded-Encrypted: i=1; AHgh+RofoTXQp6y8kXuAQTohykh3/i6RrmWJkr3tyBxKx4u2DJo8YznUga1fTFz/VCADPCGfd+01UIEk1MQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0/EV471BbPkR7mFUP0W/bmonM2q5xhe1Y9AWoKArGH2AbvZCO
	SqLMBc/ZOyBlCba+3xVHmS2guZAyKgjt5MW/8f7rGRDThhUQSBgumLBHG30/61h83/mD6o2ImxG
	o3J9wqboyINT1ShmVIg6djBQIWiNwRPrpckubK2w3riTQGDI1OVvGxOGJZymeYsk=
X-Gm-Gg: AR+sD13pCtm4hCoEM1dePmfJiAGYXks6FywDB3XH1bThjw+JNLEGi4oihD8A7FZE665
	EnrAJzfyvtqJinbPrQCI/vhHIkFaYLOeyYONvi9LdkWR+BQW+V2S6A7Hp+4CwiBR0ncfQoYRwXr
	jAxtNdBvsF7t3tMbckXzV1rzAxVcRpO02m/Hukc4jhgy6NJlEpNW4QHN+klNpUp39JdwQZkTJvQ
	+iqnrhZmAaAjlmJeGJAYpw/Suyfc4Q2CbWRxuVyqmGABwFU1OdlBSLDJ/ibzCviDXX4EbXBpnbs
	NqpiRCG7lWr8SswMO47R6B9HdoGAS7CWzBq0qKWTPCBu/+5RXGBkHTSpixWl+FAr8PkMEP6hmFf
	pBS+vuoeXwQRhwKSaDgjaxxzpLA==
X-Received: by 2002:a05:6a21:a38c:b0:3bf:a681:a262 with SMTP id adf61e73a8af0-3cb8603af5dmr461187637.38.1785866194512;
        Tue, 04 Aug 2026 10:56:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:a38c:b0:3bf:a681:a262 with SMTP id adf61e73a8af0-3cb8603af5dmr461155637.38.1785866194119;
        Tue, 04 Aug 2026 10:56:34 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.27.1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673be99sm12915825eec.15.2026.08.04.10.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 10:56:33 -0700 (PDT)
Message-ID: <89e7b084-2afa-4841-85ec-51707a6defc8@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 23:26:26 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add Graphics clock controller support on
 Qualcomm Maili SoC
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260801-maili_gpucc-v1-0-9d8c37bded69@oss.qualcomm.com>
 <20260801-maili_gpucc-v1-2-9d8c37bded69@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260801-maili_gpucc-v1-2-9d8c37bded69@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NSBTYWx0ZWRfX2cLMZrMjQ0Oc
 tc/Wc+xh9UUYRByxPzyA7kWKYPl1VOVZm3jVNu1uXVNsII4lfWLwSFVvlX/kUMqzho3/1fB++VT
 yQ9zNFn5rOsBUo6MoJPT/7IyjMZY/O6op144fNn0Irq4K/q2w9JFFy16Chdy+tXSeyq+FekNG6V
 urj/2G+82HXNCuABPdrYJa83eDXc2Sh1BnyuLqlCjtkn3tRppPpdRya/Vkb2GGFOMf6EgNCgJOh
 njKToyH2ShhlMweDPACcO9yTi6tQwMgwPvoo425EEgk49iNLZKUa0M+4q42jnvnpV89ZLBuh4fY
 Z/3PXGFf4tn7cYdCmK9RezxUuyM77NqrHo8lWOXiV/7in3bTdFlqyiWZaH04SurrhK7KwPtKzOd
 bEuxdyqnE6ZaOemYkHc9dPOMFMkRvDF43UhW1sF/fLtHfBkSRZci50W5/+trTJsD+7xZvXuZU72
 iipfgSVLBHtax6oiuxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NSBTYWx0ZWRfX8Yait+sNotXW
 Mpf+0acQr+kesoZWbiYBQZrN5IW9C7seEcPSTzVz/weLJuslEwFGgEqYdWTPNEap1XQLNE+59p4
 LPlccD2EzWzpiWxtCdXIfXkOmVmsnbo=
X-Proofpoint-GUID: gWWt4A-3L7gPyXINVxt0qB5ISU5fXGCE
X-Proofpoint-ORIG-GUID: gWWt4A-3L7gPyXINVxt0qB5ISU5fXGCE
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a7227d3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=oJgQA1a84MxBYcMfCYBOLQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fCNx6FN-KcjCUQZW59UA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040145



On 8/1/2026 12:42 AM, Jagadeesh Kona wrote:
> Maili gpucc is a derivative of Hawi gpucc with pll0 configuration change.
> Hence, reuse the Hawi graphics clock controller and extend it for Qualcomm
> Maili SoC.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-hawi.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

