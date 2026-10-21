Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576982;
	b=btRI7so1a/UO2ooIryJlhWsA/DrnwjHuCcNOcIpZ7ELmO9VPEGt6Euk5d4l3jdG0DYNa
	 I/D6oV91W76Zk9eYSqvwq0dmhiJk/woC0+54Mc+z9mKZKr5iDpItqxfDVXT1YFvlefEVs
	 cz/OO+163fwW7beSQ++FSUTuiI3e13SIM23xiFJC6DkRAEFZy3+fQHei7zHjSqjalnHAu
	 7KjrC9r1sDKmvjqba5xS0SAAqRmUBiRaTVB7nNiOvnnDYe36PjbOdo375E8x3RqZM/qlO
	 QJR6f7+tpGnAWRtjzeGrcCq5SHYmhu7VE8yV8hmrOkulS8IbfGKV3+gQU53yT3gShtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576982;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=icN0Hj4ZHyJdsIbO5eUJgi5yjxGEVaxSWAWOw0WoRGA=;
	b=mqV798NOTKAVvX29g0f998/PmmE16pZSVP6nUWAiwfzASq6lZ6tdnpeJqrCBAxmy6XPL
	 oEWHemzl9Cef0tdG3JJkSsAMPDiAMryrXORbOsKa4sVubDNNdm11VXt86KmJNGXiTaiDZ
	 X5DL3fgS+zfd2FniyXufQ7FTV5W01Td9F1EXhJgzdzLaU9EDjRmS8IGBu888GTTWPE/8T
	 xLC4tCGNBv0pdqRkk0NfeVccaKvoruL77rUYpmxUlLIFLCBMT75zWmJ6gm6dmEg2e3iKy
	 KgSlf7NV/oRxUMMHt0aQUD8u6eHEjz/taU7HKFBN25XN98IlLfHju7Gr9Kor/aGf2mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WvU7kcap;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h5ILwTqz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC29606A31F
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 10:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FC29606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WvU7kcap;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h5ILwTqz
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L94uh53484746
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 10:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	icN0Hj4ZHyJdsIbO5eUJgi5yjxGEVaxSWAWOw0WoRGA=; b=WvU7kcap9XqJMtST
	USaqpwLUys0DdKOCxbZP88ZmtcjdHlcEpZdmefik4Ek1zq3Thp0cKKuOUhNfvMO4
	vlp33xGWhiQhcwYStNLzhN9pa7I9dT/ze9ArceRHOpcjAvqGtSoFUD+hvVxfIjA8
	pzXWTWZwDjoqF46bMnCDbfjoId/GEvNkMrBmTAcAdtEaG7hsXSOY9x12zgjiA5ln
	8353l454XfmLqbm/DR282rMpDOJ5ymJJLSdTEhceAGA21waUms/7IcdfV1tdFDC4
	glO8HzBCwTXTj4bZektUdKwwfMGn3MVJpc46ipUrh4sXXvOOF8iy5GKy60IqQp95
	ryEswQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd3she-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 10:03:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac5877bso17283585a.1
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 03:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792576980; x=1793181780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=icN0Hj4ZHyJdsIbO5eUJgi5yjxGEVaxSWAWOw0WoRGA=;
        b=h5ILwTqzvKWBy3uFMSdyFHEbq0I7ec0UXAS6ECZ08urWd3x+VUhYcQB2pVwofDKIxd
         8V9BHFWy6YzHblJ2I6bVDaWMsavpUZxWmUtc4iYNkZ6OzCyzh3RK8PnDxfm/B9jIbDKV
         ACOs69hzj/wcWrShAz579nObwUaiY9f7Q7/tJ+hPPimb0vBZpWHSollJsnmtd/FM6MFA
         K8/cbGgI1dcH/Os4wMb+DdHiiP4bEM1IjGkzZCXiQGvsRV5jjPWjHInuW7t74c3IXkwj
         0mXLCsPndmjq5ArCc46mbZZnX6GSZHWZLGX0fCsq01wYYpAgOWUO+d6fTBIamRnaLg0Q
         3U+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576980; x=1793181780;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icN0Hj4ZHyJdsIbO5eUJgi5yjxGEVaxSWAWOw0WoRGA=;
        b=QoqsUuPbcfsgAamRbCEXG3K1KrGcl8rc431fqoiLyI54/X0qLYyg2n7w3Hh1sZcgrR
         WiuD0tFPF/cjKwxmkSNzVm1FAXIFTYE5nXL/5atZKTVOPptnDmLxToSGNnS+8RYj8fKi
         ZkKX1v7Bc1TI0xxgTvX5fVVyUee0G3qdJo7bSXCeqMHU0QMZy30bYbQXnrwWFUFjlfD4
         DLdLtgwK70AuJ0vl4jwZJtVEQI8t48odChfx0mDxe/GyOSPTIwuHWIFcnb1WK69BAwzq
         Mc4GEP8rvl/mvh/TZMaxtS7SM5dSC+MECl+E2nCfRMuczTJc1LOBpM5CBPMNwQNU9YCc
         zoow==
X-Forwarded-Encrypted: i=1; AKwUvBwoysyknH+j1/omUWHLqxj6Kq6PrAhl6n9xcq8cv7tDv2AfVG+vcXNFQhzI93EWzqp7E10viDrNXcU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKOjKoQnNLgczI6uLgjIJsZpy1SDXpxnu2V+lwECyORKgszpK7
	gCizKV3ObA9i9lkl4meFmM5x7MpHSkxTkKOD70sMex3KUMLSvNKtk6aGQpI6UfiP83ReCLuVBSm
	j/E9ah2f5gLOQIr7EpHQCkOH+bEuUFWin+GB/9rjiLXwzfT2AxokXVSn33R4KC2U=
X-Gm-Gg: AYBFou37h24pJ7TXX/8Np4FqmWco5TpLsDHooJoueF45EEXbbCKJR2CyIo7sovksatz
	6SJZPybeJdk6KRnUxv5RtrnUSKEIS448q+JNXF5USX2QGY1I4i4ezpwFO+2ypv11ZqaG47fg7dC
	3O/uMFZNECfe1rxGhk1o+iGiZEnfDUMNhF+KdsplV+ZqBXskQ/7bd1oAekawUAdfqLFDhrSyg6W
	QPjXajE1n8qTcOpJcA4U/yjeatXFCRHh+jrqUtxbsAkcFRWYwTI03mvtZBSUoDd23uY6dI30RRc
	SrrAaQC0aMD88RLIuv+UYnJQIOW1OAZ7akQReFY9wPFsrf9bdIQeBC0IfTRL5Sl/q7s4+C8YlU+
	k6xe0b3ZtkR/dhD6IbY9R+g==
X-Received: by 2002:a05:620a:6ccd:b0:93f:1eb0:88bc with SMTP id af79cd13be357-93f57eba7c8mr374434985a.1.1792576979699;
        Wed, 21 Oct 2026 03:02:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6ccd:b0:93f:1eb0:88bc with SMTP id af79cd13be357-93f57eba7c8mr374430785a.1.1792576979215;
        Wed, 21 Oct 2026 03:02:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679ba8687sm59684266b.11.2026.10.21.03.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:02:58 -0700 (PDT)
Message-ID: <a3293a8a-ee94-4cb9-8cc4-03ce64c1cbff@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:02:56 +0200
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
Subject: Re: [PATCH] clk: qcom: mmcc-sdm660: enable the parent when
 pclk0_clk_src changes rate
To: fabricioakio@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261002-sdm660-pclk0-parent-enable-v1-1-d6ff889144e4@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002-sdm660-pclk0-parent-enable-v1-1-d6ff889144e4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX7uYHmBwaV4UH
 Y9VW6kKVso5Mtk5tU8yEX7p0gRATbRZo1DgL+uqJlDwWYH2lBS/gTpb9Jd3onw6doqdlYVmKmNy
 5JIQ1FW7dXFjq6Ct3eLys7IXXyiNX4Is8WeSwrl28lqcuGqQWqYHD3b7m6zi/HJWyCBfVRSG32K
 nop+zipIbe0JOnj+IUOV5wPeAa64+rIOQekEAn5Tfj7NJQXWBJYNry8SQaPuDR9ucOdqQzxvGTD
 2gR5xGDcOl7L3pnKBBDnNw4yt0JQ+qYajbI1fUkbZIosz20ALC7q/yt9bYt0Yhey1OZ8PMU6jgK
 IpMlyQ7oPOdeCWkY2eZRHhFuVdoAlQSK8cDGRQBBMx6sdTNEXV5UrsrfP9fe+zaLY/CYrRHHnpj
 qcQhHehTRHBeDR4U955PaOc8zaO6XIadwB3bNqQEiZX4gvX9AHXYlXAC6IqxherE/atRRv4iKmy
 WfRUkL5mcXFaYPtRhwg==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad88dd4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=BbLh709dquJP9IyRttkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: WOHf3OQrOcAKN1VJ3bGLzBNRKFgjnl1W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfXw50vSdfLARI1
 G0dagYz+qYHbaU0W1aOYT/yjI7veP5LMfsM7xKJTuo5WSMi4IqPsmNnIff06ovGet4VlFcDQ23g
 49R98L8spe8jCa82j8sBAyai5l9sNRs=
X-Proofpoint-GUID: WOHf3OQrOcAKN1VJ3bGLzBNRKFgjnl1W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210039

On 10/2/26 3:55 PM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> pclk0_clk_src is fed by the DSI PHY PLL, which
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
> Set CLK_OPS_PARENT_ENABLE so the core prepares the PLL around the rate
> change, as dispcc-sm8250 does for its pixel clock sources since
> commit acf7a91d0b0e ("clk: qcom: dispcc-sm8250: Enable parents for pixel
> clocks").
> 
> Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
