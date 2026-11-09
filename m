Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214478;
	b=F4lbPWAzmP0DZ4xRUIWZ6vD7LcOwHCowK1n4q9pVCAIUucesL5/QPDCdGuflQ0ZNbhwN
	 DG0+sk5cUjbHGoSNeXTaXLWSfgjeUbFGBEKHrXyNfVu/ehJdHMB7zS/FPcNp2Vp3hdCqD
	 sgcQW2aLjrD95nUYmM6fJfWyH+/+RPU4WITVqEw93m++MU/tbygbSIk2sWB+0Hq1JRlnQ
	 IQW24HZg4nS80QXgdbaVjUZK77paPBJOSTJptYTuTGsgDNN143z3TIJcjTu5s+P8KEHCK
	 8ulPBOCccUihfL96izNlRnIwmLtRAI/ghocAv/bw4iizRTCYsWlAtH0Gbl4moNuN9og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iQf4RM779oS0Lz1Z3sQeMmPMDiOPPiuMG27R11kbwhw=;
	b=OzIVAcPXE9fy6OujZlFK2rA8odMz4d7uZbTWC8sGw26uD3EqGjpW8k9oZUD5B4Zn+0CZ
	 c7obX/7MvAc6XQfTlhrqslF9F6TFP/JVETH44HZNzGcAWQSiKD62uhwULcCfZru/EQVm1
	 xw9R+0TKqt34++9rKWxQEPhyI6aRdfDqZtlSyE6YB7D3LfTcGbWNulyHzmHdnKguwEzeV
	 0LYXznsw4To1F9Ymiy/uMKrGn0KNuZun0Jkh6eXIiO9sgtFznBvXQBqN28q8t6pb8m7Bt
	 Dw8wFEsa9LU0hloYpa3Sr7tzMKpXG/tnfUwic+ia34DSqCCRJl/XG5QbyI53oil6ndg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DdOJy33Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJeBRbTv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE1F606A337
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 08:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CE1F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DdOJy33Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJeBRbTv
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AYo1066308
	for <linux-clk@vger.kernel.org>; Mon, 9 Nov 2026 08:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iQf4RM779oS0Lz1Z3sQeMmPM
	DiOPPiuMG27R11kbwhw=; b=DdOJy33Zj+gGloeoGU0YcrU/rBuBrM8MfaDICyyX
	n2WzCtTAZ42ZIxsnzjTL9PhWCB1PMX5vHqJsEznDaayNSyOUnCL9YjlbB9DvYa7+
	SmId5DTFW9F43yVDih/KUy1TGn1gfva7yl7hZwG+46G1dqKyPJQb/E6bUllMjx5y
	QJpeYTh4xafgu8EEZI9syRbPEB3DpR70tP+h32QV5uTXiY6wicVDiJXXCRKyb6KN
	AJ/Qo6ZwOchptXmAv3MEiyh1YB/KKEx7no9iTetUiO+Bw8fGEUhlDI71D0vQV+TO
	O/RuR4wTDSHabp17rCz+bXLSu0/3vSM9hdeAFRkwBm4p/g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxdkh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 08:54:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e49a1d3b1so165123585a.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 00:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214476; x=1794819276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iQf4RM779oS0Lz1Z3sQeMmPMDiOPPiuMG27R11kbwhw=;
        b=HJeBRbTvguh39nPevmBYDDhEXLGfAjm5qqqy6nkorKRF5Sq7px4TC8xZxitDJwchhY
         X5BM+QekKNInY3VktuUgrLUIdudyDhYTs9fSxWeuevjBGBL1y5dSmhcOwi9ls1t3RfVA
         xxDYt/PkGUXfgbaDuX/o4I2U+P2DzqElckJfuke21ISxgIsiVzQvqDC3u9gI3FBgWJqs
         7i9Szs7r71Uc4yUPKfmRTOeB04K25lOcBnjfKPusrPVvcVnMbCqDAnSKG+6OMHaTewdH
         KOfpN6fFGkExoWC8gAMxgTkAoNjM0ObElz7bIJxJbeX1GoGzwK51m8sFikB8p0fbVu5o
         KHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214476; x=1794819276;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQf4RM779oS0Lz1Z3sQeMmPMDiOPPiuMG27R11kbwhw=;
        b=XamwutI4qtJx3BiQV8JESyurMYTvpxlnRuTUTf75dQYTGdwtzBOI3UGDkcExp1MXaB
         0lu45Elxc/jaiJzjUFUhiCufA3/YIA1nzZ/wZQj1pz9kFwJKwUp/MkUENRvINswW0nPI
         YTnnOyqDKSBJYMitawWmgmKIWwW5OtFB+CsDphqglJ1rpuDetcGLHOYCfUaDympOmORs
         eskQpf9JSaYZmtukqQeTk5ehtw4hpxB3K6LLuf8PnZBM5etl4pICGWtgziGFzXFpkgSp
         Xr2AnnR67Gs861JzqnXlhqPFsLdWBWbsjbAtTNDwnbq6glmXCbfN5aq0u99p3vUU6irO
         vtOw==
X-Forwarded-Encrypted: i=1; AL+hErF1cLh+gyDuNRdfFDxqSEMOwRPzZGcYxoCQ6bsQj8YhFt57qRvufizn13cdf6xQ3m0Q8DIy3sDuEFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/WrCVPyLkmCjNZh5mv1aNuwxwxFzpeLcIlyRoNhNYtvXIKJfu
	FIXAGWSk1rbZt3O5Nt5NEtWFLUK+2q0Q/z+Ty3MiDuXn5wFIfYMQPNJEGXzgnowJZ4e1Jkunuc/
	ltSfiutIWrUG+ggQKBDMpghnyUFQr+baXxZLway1jAwjzEQEoXGEKdS1nGRMSwRc=
X-Gm-Gg: AYBFou0JsrrZA19ke7KgSrRAqhLgN9m6j8Lh1kQwpaIBa4Zfe2J3TeBnJkd8thrncjU
	ox1V4n21eeFwu9gODnOjZrzKsXv31yu8HKhXzm/OHp+BqEeKRxovLM3Wph6F526v2n4qoDsISg7
	e/l5F8W0RIZgjryq4287WPujzUpzPxB/lYQr27cQwNZVpeFmcP2DLk80CFi2E84MPfQIpC5dvow
	Kd++/m4MsYvluYG7EemIvDqmqpHAa34a7wPK3PIxU/H/JrDcbZlPT8zLfNGdQX5/WPA1V4WPT3U
	KmsyNqR6OnsswdOQoYc68sOByol14PGOJ0SbbgMdYDVcGwHnEjuN6KumROtoi4knHEyp8h94KDF
	lT1PUp7Q/9AM5w90Zhrb1Vx0rTfaBMvg7r9QW/2xr6mxytkHU+Gnt1D38YOT4UOU=
X-Received: by 2002:a05:620a:2a10:b0:93f:707f:28d2 with SMTP id af79cd13be357-947841e916bmr544560985a.26.1794214476163;
        Mon, 09 Nov 2026 00:54:36 -0800 (PST)
X-Received: by 2002:a05:620a:2a10:b0:93f:707f:28d2 with SMTP id af79cd13be357-947841e916bmr544555285a.26.1794214473764;
        Mon, 09 Nov 2026 00:54:33 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795038782sm146282185e9.3.2026.11.09.00.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:54:32 -0800 (PST)
Date: Mon, 9 Nov 2026 10:54:31 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] clk: qcom: rpmh: Add support for RPMh clocks on
 Halliday
Message-ID: <x7eciplbxc744uqlbynakcr6ej2a3isj4j7vghgfocvvxldjqq@n3rrc537lgek>
References: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
 <20261109-halliday-clk-v1-2-20c3ba8be0bd@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-halliday-clk-v1-2-20c3ba8be0bd@gmail.com>
X-Proofpoint-GUID: g1ILf2N6ktx7WqKdVG83yLIT3lffhxWF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX+Lr2WwZewWbH
 e+YTlEyLCbqqXdl86heoJEfjc2yvW8dqk/u3eTsop45TjW3dPS2VBiiPAPQYWZ7yMpEXdhGMDon
 DmjhQdDXjw2LdtKug+bVtH6AVjVp/8uWM00erLQbXj+gk4HU2dRo7C121KQRE1SlRI+wyme/+F4
 wwBcS7G7DFd0SrZVMzqT1/UWc+QZRy66L2hr3OiC28zPymbN46ZXDICxERALiukti3Jp35NB89/
 oWrSgHsx3V3sAUvlHjj8OGYssUO4kl7q8vPNsInvq1aDePCZIWO+SYHV340bq0x6kS/jVk596km
 Z274Pn9cc4FRA2Nnucf1hIxWsOzuFV3oy5/f9+88oYYtRf5WM58dOIqOYw/KXPqZxp+8UE6zuPT
 0+hzFWN48ru7KRihnI9F2Gfqc3OM09QVBAiizK/lE8WiReJL4APJjF/OaGYljAxiQBUByNMs0od
 IUxS2DakzEI5sKH5f7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX+8xUvqfIEsse
 miiZNk79t3KOGqpncg6u4zW0f5rUwNanDEUjGqQKwX3zBy7qdMoCC7Qpgc24VzfHJ/QAIQTLAEm
 TKSAy7Tk/YHsMojyhqmIpJi2Ba//xZw=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af18a4c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=bJUmpo4LbrwfO9ae5mQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: g1ILf2N6ktx7WqKdVG83yLIT3lffhxWF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090035

On 26-11-09 00:29:11, Stanislav Aleksandrov wrote:
> Add the RPMh clocks on the Qualcomm Halliday SoC as Qualcomm's
> downstream clk-rpmh driver describes them: XO (divided by 4), RF_CLK1,
> IPA, and the clka7, clka8 and clka9 resources (downstream LN_BB_CLK7-9).
> As on the other SoCs with clkaN resources, clkaN is LN_BB_CLK(N - 5),
> so these are LN_BB_CLK2-4.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
