Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0697E37F310
	for <linux-clk@vger.kernel.org>; Mon,  5 Oct 2026 07:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791186453; cv=none; b=bX5A86Cp+za/9Tkxb5PRL2gdgoKfhPe+OmMHRKEG6ZzyhX4h7O4a2L6SKDcoSkrKi84AfmX8T6NL5b5MRbin1ew0pQlm+sal5iCUMZuTdshglipp5qZyipRA2muXtj9R+8TEJ3PCKeX7F7rgr6foF/leCa0nwKO73PH3yE3mBNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791186453; c=relaxed/simple;
	bh=TqM8zbKN8T61p5b/PN1xTYoB386eN8l+jAQ/Coow/NQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=evuG0pwOdu77wTPBOS519ByPGK2BXXEESPO29NBsfs31jUKUVET0mLdZFMuXh88X2l4CnfvGW86Po/AC5LG6mlzhnIru2lU/Wmldvl6d73BUYfaquhP/B/IHS0f/k+UJE4yvfnHXqhYAt1lPS6EZcRMfteOC8bVy93FWL+GdYEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oWlztjsy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OD+sZ70V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oWlztjsy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OD+sZ70V"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510YTZ093943
	for <linux-clk@vger.kernel.org>; Mon, 5 Oct 2026 07:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a9Q2PJEzfcPJVGlDIk+ValG1ScMx1NsHq3SmgOoVq+U=; b=oWlztjsywJRAJj/L
	uUf4Olh1d06x8cVE/2OfxO5PywMEcVdfTmMNBGMmUSVpzPoaNb5S8q8PCW4qdTwd
	W8vwMEqOhK1ZUb+qPeBzsjO+ClLVRRNpOj3OR0SyOq6S9LJIjh/F4R1vD8diHwyv
	VPT7vd/hV0QLEmzLuSC/nswPPjbuZfkJVUQVZV6NKzg4xhwWF61ceBRSZ1RYBRaw
	l0A/mbmDNRBBwKPpWvSPNDzBDvIBotNh6m4Co3XuW/t70Gl6zLLSJ/iJ1PIu+pmj
	CBt+tnAxFRgacvIL/yJiKnKqGXRj7zHktvQ3o6beFRM/8oeltnHTavLLfzaoE0Ic
	GRhfVg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssu4x49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 05 Oct 2026 07:47:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e2e064b7a6so14054795ad.0
        for <linux-clk@vger.kernel.org>; Mon, 05 Oct 2026 00:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791186449; x=1791791249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a9Q2PJEzfcPJVGlDIk+ValG1ScMx1NsHq3SmgOoVq+U=;
        b=OD+sZ70V1L1hJOwn7e86RD2YkhAVzYeMg16cmQGPDjawHo7b3hX1NLAjtB+DDxCkNP
         leTL99Dg64oVhcmyBgOz7m/NKZU2cYcltN1rqnZ7n4QdZR1+UyjWyC+qrAg2wpLYQLiO
         tzAnRxz7cMDm09LurRTu8+Nc8P+44R8XptbqtkRtTzINLEG9gkmxWu4QxfNF0F2TjL2Z
         M2+xah6/RuarfIdpFyUuwAnywyEFOxNXblaQaBgJdPsj3BwDts/cRxyYJ29chdYwSWSe
         0c2RcE2S22vedRx7dmB/1cWKmetO3AVnElUbj16lF5LydmwxZ6GFcXLC5svtWrO8ZbXW
         DADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791186449; x=1791791249;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9Q2PJEzfcPJVGlDIk+ValG1ScMx1NsHq3SmgOoVq+U=;
        b=wHXOHdpuUtMiAKWTgEqJEiL+ohS+8R5J5x1c9EVwfvaf3NcRk4crLig8xP75zktS1b
         Qet/9OTdRB8C6z3/9Pxu64mKzS0OusfsrdbTUyxqihlOmudAvGXJEeC/yTGzVbZbgkc0
         YN7TDmUNiyeQjjLroxdIpphS8t4Ws/g8/8R8Nffmb/StnCuL+97SHJX9MmVBQrggcRKU
         Mireq+ZvmH0caj4ekwRCd7IaCFnQ7dasOBSAbGcqNjgHIUh+jkyma4adRQeAMc5e47EX
         NYVEdMDYJonj6au/SzLdGpOSeEsTD3gmaRQSoE7vJobEHC6RKJgLA5pwaC85K9W5N/Ir
         szeQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1if/r2acDy+PIQefRkCGP8CR8v6RTAkFTeejrLbl1lLUCSbXCiaypW75WfbZNpAoRNGLTcD87f1w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaQYYJX3R6rpZM+//p+Gm3G6Odl1skv4YFF2CMgGbnIATf1u7A
	oVF4JhBT1IVQvsq4Jim4fqpki+H2EF+BT07Ua0ksyha/JODPiL0HpMzcwFRLPOI/yaEATe+hJHd
	zXLIS3gsDj7BcbnJ04zufA60Oxt9N/iYhlbM2euOLA2cQ5rr07zRZqlHmm6eh9lBo5YsY5p8=
X-Gm-Gg: AYBFou0eteW5wZRvF7JN3aBje+O2a9niaFXlrLAPJbjEvHvkI9fBA8FEYNJkLk8djvK
	HxQao8ns9mLrjdokB7qRF5nBXH31eCxJiqNzkg3Ju4WBKiEI8mBXnkUkTuesD2QVLWPErITuhgz
	IYN16IMYstdEoGp8jXphpQDlU8aqgCjyYrbF2WzoUpPfgCru2/6Qa1d3N5Uo5Q/6RJHTBl6GLJE
	6M/RLWe4sLeePF7/LNzhsKRcfIE0I8nB3ta/j22BjX/jF2SMZHcQE+fv63vFA2FP+o4Se0Pyvsj
	THwdp7nlEl1pSwlP5dqftDuAvHFvIcRdpP5l5SAtbSwyMMIMWR6WND2khWQ6hGloFRK5He6gfyC
	nyuwfJ/lQhFUrOza+Hte7K/PjYGs=
X-Received: by 2002:a17:903:fa6:b0:2e5:334f:f47e with SMTP id d9443c01a7336-2e5334ff6aamr58115175ad.21.1791186448782;
        Mon, 05 Oct 2026 00:47:28 -0700 (PDT)
X-Received: by 2002:a17:903:fa6:b0:2e5:334f:f47e with SMTP id d9443c01a7336-2e5334ff6aamr58114905ad.21.1791186448296;
        Mon, 05 Oct 2026 00:47:28 -0700 (PDT)
Received: from [10.217.217.179] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5cae50fsm3608305ad.25.2026.10.05.00.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 00:47:27 -0700 (PDT)
Message-ID: <92f75bff-47aa-401f-b232-edaba8fa2061@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 13:17:22 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: mmcc-sdm660: enable the parents of the
 pixel clock sources
To: fabricioakio@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261002-sdm660-pclk0-parent-enable-v2-1-b07f6c33e96f@gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261002-sdm660-pclk0-parent-enable-v2-1-b07f6c33e96f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzMCBTYWx0ZWRfX7kKQzIpjTJIZ
 14UYRaZkiWZHhkAPnjXxUi7qQ9jbaXOLvTM1vxr9NrGEpAWmglIoivZbp2tu3XpHyMORNlVs/qH
 2NOhKip+Mc48hfB1UM0ffpB0UeDHGyXetRcTJNhXzqzE7Weom2yojru1rII+T/Z4I+DKrDLyK4a
 ytSOL7S2cGe8m72Xk89PSHNtZBJO+bDdJtj4kOhRH1+h2T436424ojLdxHbfpT85oYYBW1WvhkO
 bQ8/4XhVlQuqSubvJaHQ2hcoi4c9d2Ts3fpvoUpkoNrcRP6F1ME0uskEMc4d1Ud6BRN95PB+hOl
 1JsWgNCBwyZWN8C5OTtmA0Vz5nW8p2q3iMDAD8Sp6wNBwsjjM6Jc8l5Dr03P5RvVk2FkC8OZjQ1
 nehm91/EhVAm3kHSSoueSGvbQQN2kFnJYnWPTKDfdNU5+qlPv56wKP9GkLZBJEcFYp0H8fRY6XK
 Vu7YB/kJpgcqmr3WEkg==
X-Proofpoint-ORIG-GUID: ysFljZHrbQ3ORlc1SjEsBukU0PcVIVco
X-Proofpoint-GUID: ysFljZHrbQ3ORlc1SjEsBukU0PcVIVco
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzMCBTYWx0ZWRfX6dICJarH1W39
 gLh7mleHTHbBQxhBcDTrsQ7P1cQWZrijSrQr1pyECD3hmFul1t/Pe9LL4gIQxZxXn9GPEXC7bBU
 J9D/0edSx5Z/iF5mAbCjTnSpO0OnU/Y=
X-Authority-Analysis: v=2.4 cv=XPSl2ghE c=1 sm=1 tr=0 ts=6ac35611 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=V8gMRo3A-47TgN-c6xAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050030



On 10/2/2026 10:16 PM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> pclk0_clk_src and pclk1_clk_src are fed by the DSI PHY PLLs, which
> dsi_pll_14nm_vco_set_rate() resets and only clk_prepare() restarts. The
> DSI host sets the link rates before it prepares the PLL, so the RCG is
> updated against a stopped source, and if it is enabled at that point
> the update times out:
> 
>   pclk0_clk_src: rcg didn't update its configuration.
> 
> Seen on a board whose simple-framebuffer node lists the pixel clock:
> the RCG then reads enabled at msm's first modeset.
> 
> Set CLK_OPS_PARENT_ENABLE on both so the core prepares the PLL around
> the rate change, as dispcc-sm8250 does for its pixel clock sources since
> commit acf7a91d0b0e ("clk: qcom: dispcc-sm8250: Enable parents for pixel
> clocks").
> 
> Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

