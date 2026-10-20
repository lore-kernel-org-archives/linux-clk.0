Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479470;
	b=FHYNNYvcx5YBKgQsc+iCcqVgB5XNRKmngp5yjiWWYMNOt2+SHw1NWLBmm+bspFLCPfjh
	 thLDU6wlzUEe2Wq3KvZ1chUnYR3Js8Qb/Q/Cao4kHCyOTSIJI66qru6629tiHfnMg3KCe
	 KHytrLzKZflMhpiSimiSRdgieNG7GG2cyz/YgdFrqUjPCaH25RwBOxaTsZLa1D7lq6KHF
	 mkO7+PUcUgUhJmro8/4ohp9vZqO+MEbx43kF7DmS1uwfkpXQRvmc+HCSihMUUg8cqsTCE
	 biWJPdiL+MjZg1BMmi1yJRs7fxOQiN8nSfMKsre6IA7OSqu8cldD2wG8iRkPTnhlBBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479470;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OtJqhIVzyYbiPCDKFzmgjolR1igdute387IZrN4FPCI=;
	b=00b7Jm/TQLpstVquPVqZ33XX4uvIlvbd1VsvQipZI/iY34AuKreuANgfN5bcC4h9Ea4R
	 5AMS7aGvqCgM/Wj2tzjo9kSsUmdxTN1zTlXtQ62kHHc2bUrqTFlRgojF1TM5/B4xXp2LL
	 0+ZGs6xx+HVvQ1nwKQ/5Ms/sQcQrKpCDdx5H9nSYUp6Wi0Ntidp8qq5b5pKOeAWhjCVJY
	 zdM4tBXfGORonQ09b8B5ragKDa1CyOnwZMX6ohze9e9PX7ZLLG4JFJBggu7P/qBh637Q3
	 SIveIVsquiXA5mQLJ7JtnF0RP5PI3rShm4jKljz1B8033MZ16U/f+7HfZvqFgzT/NsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TsMk+zH2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Z/dBO5I+";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C85960A260D
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C85960A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TsMk+zH2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z/dBO5I+
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tMp21211267
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OtJqhIVzyYbiPCDKFzmgjolR1igdute387IZrN4FPCI=; b=TsMk+zH28Jf1GdAt
	qoT/9lY3gFvz5TLeqhj1zhjWRu8+FqDdFNWulTwLsbYzVQfTU6IDshTW+IeTyGJ+
	kGSkRSxfp9vdnpQfA6lqD7pcxLR68OI70Mt9465AN5Y4h+WHqk31V/iCoHYhjYPe
	eCAqYmFn0QatzSGuVb+N7sL2joz37VzaG9jN73cTO2yhVnPnwDLHfYnAcUWsGj8H
	oHsjd1ZKOlveUSCrwbVhWnGMpzM0gETFBOeSfWHbnwjx/FM9Lt3ep9tXd8VN+iCW
	V+KQjGhQGEdjHvwomdCdKqM16NSmWCMWbPXigbxkYa77AvqIE6TzC90koYj9YjEN
	1Zix4w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1989-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:57:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536708d1a3eso4938291cf.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 23:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792479469; x=1793084269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtJqhIVzyYbiPCDKFzmgjolR1igdute387IZrN4FPCI=;
        b=Z/dBO5I+dtbYNTgmYzziHAI8BMH1JX0OrFqcV96d/B1CRKjF+cR9VIdJGPYUCBg2Ee
         NUkRp1QCzFpAdSPXPuPZXXpqgszMIXFsy8+QhRD9HQwgPyD3PJmbIRGaThnG0xJLgyY6
         H7uf+gbrFexPSvORE2cJJ2cmCFCaR9PC5xKvkvhDps6zmbNo9PNcdwMXWhK8T6EMq4dm
         y17E6nBcfeh8bFIHwOntr0ueRPXxf/r9Kfl7SygQoBurdiITbjGWWswaVucls0QoV38u
         JlW9AUX5UItVg2AVqeNgtu3XRhNu307ViotZ8EpGh8BRif1TOy6ehgV2DdMmDXkpJFcB
         otfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479469; x=1793084269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtJqhIVzyYbiPCDKFzmgjolR1igdute387IZrN4FPCI=;
        b=RnYaPHfetQKLFWtypVzsUPcuXlti+BFpPLi+s9LmsW43GobsCxsQDwlo5zA9d40P8V
         wCJ6WMxTazDqzkHMEQZXNfU+E78Lb1LydUoj8PJFxiDdO2Z8dRdTO0KOlMYLJWVo3fWZ
         BnLobH4A5npQWyT/GGgCjDprrYeK31ToXj3JGEnKFAtj7IGJd+K6wIw9vjcgze89smb0
         nVDCNPZDB7MmIqskF05CT9Ptsue58+fZmuJHrR11pKom37tOtS4IS1BcyqvaXUYLWxqn
         menG/vBqhYoPPuxYGZJ/zfSOQ+l+BA3ch2x0waMxh8z6FMD0A2qLXCaIoEIAoj+FvI/E
         Y6BQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcvT0KvKuvOSFMfAa8KSJs7UWcNiOMzw9NEASWeasgs+jbfKPV+fnnD3w3xStb2Lyw3A02Vfd3FqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYISG74fQpFAiQ6yHPC03Sbr7pMCMh4Pg6oRtKEMVbFLG6hDiSTy
	GvjjSSeHcBnD7z+z6h+IUdQizV2+jME8lkN9dU3VmlgKpAIYB/yACu1/3qRfyP8hvWSUwbYAO4q
	7tq/KvoR8lDdgjQcCbegwP07+5BvyEan78VYyi1VrrKTMq7GPW4b+t5k5gMas058=
X-Gm-Gg: AYBFou3G0yTNVKHALbWQelPQZkmxNzHUZ2Te04DUaddAigMH0mPX1DQy5JIZZsy6AyN
	+evFfafG6ruM7SBV1yxCSfoJWeeWlUSI9rRzWwMZCfyJxDKcExuQqvpaKd3e7B18hV1nxG504fH
	/fqi2wkbz5k8BQ2nzk6TrH9vqUa0pnjh4tIpS3+tDSYwBLt9vvf2JiIi7KpEXEdYwyE/zR1LQCm
	QoaBSKT5qjZN3SCFMa4tYGUcwTDxvX2W+tfWdVGVUcmIBO7oHroG0sj9nuX6rMQ+nmEX+8k8wEy
	HArgCIz/oTgTTuOaVzBmuHXAW00JAb0SaaQOlntAuu2MmPDOGcTrf9hpRXDM0lrFUjlT+3zgXPL
	wEa9H8E+OsRSFeqnzdJ6gyw==
X-Received: by 2002:ac8:5701:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-536461cc281mr179117411cf.5.1792479468631;
        Mon, 19 Oct 2026 23:57:48 -0700 (PDT)
X-Received: by 2002:ac8:5701:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-536461cc281mr179117151cf.5.1792479468091;
        Mon, 19 Oct 2026 23:57:48 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd10d4sm453415966b.27.2026.10.19.23.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:57:47 -0700 (PDT)
Message-ID: <45b92e2c-a310-4bb0-ad8e-2fb5b162fbe1@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:57:43 +0200
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
Subject: Re: [PATCH 07/10] clk: qcom: cbf-msm8996: program the MSM8996 Pro
 post-divider
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-7-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-7-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z-By70_ri3wd4SBGfoEJZIrqeTKbwd5G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX/k+jiSRPQA2x
 6dh9vrwc+64ROa4mS0HOHqdSmlg1LUaMfeSgFYOur3THQ+XHZ+U8BTwl22Jn3DnuRUZZz6pTcNc
 BlKqlTnNM75pk5HW28RoRLJSs1mVdH0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX2yXq4HaBw6pZ
 u7nKw5NTmknxKTfdYvqQ4uQG2X/MWhld8wi1oZ62xflO4fyEQhcjqpIFvST6RzNgmAKU9fN6IXa
 dgYaJ9FUeSxv/M7kxixkV+QAto3KXd0JFUoVx4k0HmFa6O2IB5SzUzrio4aRdj6PHk7wjn1+1WU
 gzpXjrLoysyKj20+Nl8tvVVnt9/jCkwqhW7KggbAGj1PyFdRk5YJ9wTTcOOvwyBwLrAIHL5jvsF
 Py6wW8quiHM2YFtMIgLopfzPFouMEhO964veIaTPRNn98u5gWfQYJx61r8zalE6GJ+zY8raFilU
 8Rfpspkk15dmCPsziQitqx9xWv8tJiZjbOM5Xp+ROGi5R/thiSjj4IJUo3/Kq7rr845cEI2CFWL
 11AGXwNBK+4UPJXOckS6A4AKT4ztYykhZEth3dXYjKQYxoUk5/rEzBYNkDEjMWyKNxOntm4CgsK
 YQQG9WkleZH+gflpZAg==
X-Proofpoint-GUID: z-By70_ri3wd4SBGfoEJZIrqeTKbwd5G
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad710ed cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RnTLsUR5sZSAZyuXL5kA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200027

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> On MSM8996 Pro the CBF runs at twice the requested rate below 600 MHz,
> at the voltage of the requested rate, and the SoC hangs once the fabric
> is allowed to scale down. The Pro post-divider of 4 is only set in the
> PLL configuration after clk_alpha_pll_configure() has already
> programmed the hardware, so the PLL keeps dividing by 2 while the clock
> tree divides its rate by 4.
> 
> Set up the Pro post-divider before the PLL is configured.
> 
> Fixes: bc48641a68dc ("clk: qcom: cbf-msm8996: Add support for MSM8996 Pro")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
