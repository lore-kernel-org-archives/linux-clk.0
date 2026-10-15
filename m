Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDA34FECE2
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 14:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074074; cv=none; b=uQn14z2Q4Mj/VPx6YhgYtOH+GmGxbEFba3HYBIjSjfG6VjkXLR7Rdw1L9ZUZPT8XLDDFtDxyJwGrDlPBCPmBv0+X4Tp/my0knzNOi2c3ZwoxV3WxHW9QU5W5Z+AlYbMjGa/u2BBP4c1qpt+bhWWuYiyQbTnaUjMeIv95PfD02/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074074; c=relaxed/simple;
	bh=ncDYfni7DHLhnhuLavWrwx4tMg5ek5DmP4StCsrX1mE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yd/t8+oHvPFTql+qmHrihiMyzS3EnOB4XI8g6dyqpgSZbwgl5lp97FPAg8x82LTkc0GlQVrpOR2gJHwb9vPUE0rQTc39NnQwQbbvWvl4B1DF/0LnYJWd3/lxCNHsUsCFqAU3i46N3VUq6TuzotsNPIQZiKpi2cAEAx4YBE22qE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i5lgK+Md; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OkXhqb1J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5lgK+Md";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OkXhqb1J"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTGX2809323
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 14:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wx21E7trA4uc9e24uzq3Is8WazplAsmPmxUJydtCCrk=; b=i5lgK+Mdhr2noejV
	lbup9Ruf9vecslKnIR9ccO/RcsFDmlHCt+gy93g7gRw3NxdsrUQTXw9zbHyVyEmF
	MbRkrXogAAEW4NI4dQInEECYglLaSQw8+08y+/KndmN/jt9aphEIWMcHrifDAO7d
	+9yLdyDIhKUJSEiApIZUFU5BaRWd9GSwHfEx86d19iDsxtxzAwY56mEDteiv7FiT
	h+Eiv/L/t43JvFY7OhTVXcadure7zwN61lKlMwVi9vyzUxYI4pzhaN2un/VRtMcj
	Wk5QB/rkkelkh2t8A9Jg6CyCS7vQxGR1ILZF7WoLAi0LN0G565U18Vw3r9CBRzo2
	NlMmoQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54u0vt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 14:21:10 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc081f3066so24806137.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792074070; x=1792678870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wx21E7trA4uc9e24uzq3Is8WazplAsmPmxUJydtCCrk=;
        b=OkXhqb1JL6ct8cyRGApA5MPuar/TG+aBWM/h9aL84pyxW1/2wV7Ssasjft02jWjWLs
         Hw94nW6u67i2Wn2sJLNo9V14RAaN2f33FGiFk9rhJ891pSdLNnCev+sLf0mk+Yg+L60q
         iBKuQvn0AbO7evkQnnRVNPIUtQWraiWEaHjpaQbRwA/8A888Z024UF43Ut0GmJpx6DhG
         l0FhBzvoWFMBylex7IW479ywZFe/bZbD26XToxOwXr0jesJUawHXoKy989QpK+hRJvB0
         +WpZHaKBELkwPGGZdARA6FEojHN15jQGMTnuC3cEiOSxu3jzyVU4CpzRl76XS3s5I/dF
         LHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074070; x=1792678870;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wx21E7trA4uc9e24uzq3Is8WazplAsmPmxUJydtCCrk=;
        b=I/JiSi4uogcGvL5zuEenofBzlUVVEwKEDQweGyB2WxDyqpA6p63TWzpLjIrTw0jwdb
         +Piz/KSJEsFLBHu0bnnQMf4XbdXpb+KZ/AE/jm0TpdpF1bw087uz+lue4fivA3LAlEr5
         zuZ2zT80Sa4njUDDkY2uv0BduYZkMa8mpDXpomk33GEYePQPZcb4L5NuXDRbEof9haZw
         aGpLFD+cRGI6hHgRs+eWi613kXtCm4q/0HPoJzseafXzNhI5xlujoGUdLrsr2SKiBPz3
         XtPoVQl3kSJ1IXUm/QwDrhngXwtAsmQ5HQD66i7zS7QKHlmyiXDtVXe/mFdtY3gIwrwe
         NU9g==
X-Forwarded-Encrypted: i=1; AKwUvBwVltVmgqCMjRFIK8/c3tvsjBLVkGDuSXF0J4+Q1StUALgoAmrrq+OGZVJcw4J1FkIFYDxUmzDgapg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ56PLIS2+pOwV1On4Nkq/scXH17wiwe4dVQN0U1O9gx9gTiTEF
	keC81StRF3XWclnDSonxyPnGiaQ5hipnVbO70pjvPJxRFZ+e+ueODjxKd205JN4DTkocm7dQFSj
	7T9giW57tQCoHfk48lU2E3yTWrTqnGJIQC/NNjalgEJ1FFjLzrJHGBKp/EJLxf90=
X-Gm-Gg: AYBFou1e3695zYmkWkauHnysFOxNzxA03fHvGc2d3YCO/1qsMtYllLaOOakAlq8uz0+
	v+m8bZHeQaiUE+jYHLq9d0m8Yiq0p0eFixjvoQSqoy4REwB+Rwd9iJk4JL7h+EEZ73rDJGJqDZl
	5nY7vH8G4zEr29hWSnr5k6p2ND6DdnJWkHBhLesp8fELpuwALwZaRgvG6PkpBhM09J687jHbIUc
	qBECPpYY9fhnmSAGoJ1TVGyKldfxGGhMWJgU8LcL5FgIrcf00H8M14baW0erbRXUYYc63971Rcp
	cuzO2BLlgizyD3/e7/M3wVkjmh1FHd/hDLEYR24bpxPljZ1l5USxlXJka0CITJn362/Vy7Y7dlh
	fuiNC+zngLKMMlXyHpe07VA==
X-Received: by 2002:a05:6122:650b:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5e91f576816mr4067405e0c.4.1792074070255;
        Thu, 15 Oct 2026 07:21:10 -0700 (PDT)
X-Received: by 2002:a05:6122:650b:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5e91f576816mr4067389e0c.4.1792074069533;
        Thu, 15 Oct 2026 07:21:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6bea942sm131088866b.11.2026.10.15.07.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:21:08 -0700 (PDT)
Message-ID: <7a6ef006-cb76-4e4b-bd31-886af708b375@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:21:04 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-3-fa4364e087ef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-nords_dprx-v2-3-fa4364e087ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0e156 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2d2XUzBh9Lae0zXQoI4A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXyBapo9wcYcc4
 +MlNVxkjoffx28cee4xaOXnVQCAvlKcvYELnOeUWVzkXFGsYfptpbascGH4eFC/MiN/Awb1IrWP
 Xu2+sSzWGFDdauxMHqTn70E5AY/HakCMqXptO/FXxQEZKNUYSuWUBFQHZp1yUVBZjkgu0qdlRV1
 d0klChP4VR4RRsZeCqFiPyHCGFUqr16qoaUkJOVTWBe8xHnOi42orfQKKlHkOZyyLBSQkKh67HI
 fkazLQTzJm0WgcE4BRA3n0fm+bjIvNkrqDSBpo0c9dQt8kI6tCUNZPq9ACd1fsig9PsurEua+51
 SevHf++sg1N+Q/W9Jp7LE/AFHVqc79SB3iLszlz3RdzRCz+vDc0Ro561XIRd0kj4RKWo0Dq14Xn
 idEQn9q3Fj1GOScwD5Zx1jifgKkLIGYrH5ER1zCcyap3Y6vehGIM1y+SvUc0ksiv4NZRMbopBxp
 WAzgA80c0tWVi6HJckw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX/Wm6gmYEdahE
 Jot8Xn/lN7ILgWovwpUKEkLzpAq2pHtQwnA4NrVhF3Ta3eVKacgNIkb+4CRqfNnN1vIhgXUYuW8
 gSKe23j4s4Cp3GarR305sm6OqbbOg/g=
X-Proofpoint-GUID: l7kt-scmbxBVOFFwr9_FgUG1s0ptByhn
X-Proofpoint-ORIG-GUID: l7kt-scmbxBVOFFwr9_FgUG1s0ptByhn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150057

On 9/23/26 9:21 PM, Taniya Das wrote:
> Add support for the DisplayPort Receiver (DPRX) clock controllers on
> Nord devices. There are two identical DPRX clock controller
> instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
> audio, AHB and video memory paths, along with core PLLs.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +	/*
> +	 * Configure cdiv 20 for core aud and 11 for core ahb clks of DPRX CC
> +	 */

Nit: this fits in a /* single-line comment */

> +	regmap_write(regmap, dprx_1_dprx_cc_core_aud_div_clk_src.reg, 0x13);
> +	regmap_write(regmap, dprx_1_dprx_cc_core_ahb_div_clk_src.reg, 0x0A);

Hex should be lowercase, but preferably please define some sort of a bitfield
that this value is written into and run regmap_update_bits()

You should also set `.use_rpm = true`

Konrad
