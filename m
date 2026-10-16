Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC5E322A2E
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141439; cv=none; b=QdpULKVq0OT53c8GuK5zjUn/wkq0Yvmw9ntVeKDcRHTSoGjl2aHrbT+yFz98aInioeLxbnq/BhjP58fONqqlMn0h3za6K3ol81AtQYnkuVuWTItUXoiJZval6VqK6ommyznet6VyfYSpiseNcCQdiVTwR4hvoc/QYtMCl/Pq8hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141439; c=relaxed/simple;
	bh=RA/3AdwxcJOu5RTjRAAO+2c4HRixWYGDaWsAdaQGN2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aP37O6hR4ot9wacEC2Mgv+MU7B8VrpFx2EB4eY9UTboReo++djrDRCWOKETAjZsExD/16JYSLB9bHHFXQe/TlkZd9Atf9lmLFsIkaPB2DIPkL791HjrKMrdQJfG1HqMzDvWiPkHBHQdI5sku1XlzDOuVAWef4JP6NaEj/RYUcMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeXcz5qn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RlcBR9Vn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeXcz5qn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RlcBR9Vn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8l70E1761196
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 09:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WpFwNiJHRmYDM5aNeWpbEdOd4xda8tZFmeBFHKELgqI=; b=WeXcz5qnlo2eFrba
	pPcVHRVB30iAochrNpnsvUWMMRlgTm4hNfcmxjBpTCyN3SPomXZAvt325+834exu
	ScgsEuTt08fklCif7sZDUyGY3X1mT7I1NM6smE/tfsaCgoUU6MYYK1J8kNkJKZ+f
	qhDkBeBpDsi2b75/aP+2l5fFpKMM1ERucPBuzxP1pkwcYj8kEr2VhcCgGyhy2n7Z
	/5bvkzPnSQPH8Lp4oFU4dzLpDae8sWRp8+g/Cq66FEal7rpQqY9W7WbMcYN0ZHzw
	AmifXbUGJpZCqCfAe/nfQvZkwV0SKnQxPLlttZ3Ukl6WbXV8iJUfCAvMsKqhTX77
	PMSErg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5yr6qr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 09:03:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-915e9e1a5f1so14207456d6.3
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 02:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141433; x=1792746233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpFwNiJHRmYDM5aNeWpbEdOd4xda8tZFmeBFHKELgqI=;
        b=RlcBR9VnrHDjNzfrY8pUd/k+fX7R1PYhG7H8EUY1p/qXx+ph+P/BfuIXvDo3F67FJd
         rj79kRI4iMWeFsnrRGg5nZWTVgQFAfP3ZfcO7q84eb4MFrXN4d1hbBYZMYvxjDKpL5hO
         ZTx3r0Sb/gsjoXITv7eOtxrPrmTICKMj0cMa/gFWX85aBlytxDV4KO8Em4V0z4YqtpYy
         V4IjfX8GpGqnVlGRskttMGnViiHYhZqGaosewfTGHX7SihFHQW6fQ/YUioZWJKW31OdK
         h///3E4FRx/e4i4e5OnFddTZR/UdqO7TXWSPTGkL/zfLJpP7SSWZzo13cvv02LzmdJDq
         gB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141433; x=1792746233;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpFwNiJHRmYDM5aNeWpbEdOd4xda8tZFmeBFHKELgqI=;
        b=bpm7rmA2jyad8C9HDwjjPA9N0pojXZcrsUf05j5gymOLExekX27Px52pf5Uh2zeesc
         4H3kDA0LS1MOYfZhvCaLAbR6ERuLugfZE8DfJSadR4qoHnO3mAKxkCtIrqzi6NvUb63X
         OaSMOCB8AV+vU08Cx3/fv/Z8CSiyYYPPLFpFp2uCJnxFUSC81eUB7Xjr3csMW2kCV1te
         aN1PygBdDD1Pa8HA6nMl7Q1yyvYaf4Q7znCO4U+aAW1vx8aRD68NP8n1DlXaYxhY1Dxh
         0fuDngQYbCJgz38rj6uWy2fUgSH8SgeF4NRqU12p7qc2W5It7bWkt2i/jfrTRpJlWrld
         VJ4A==
X-Forwarded-Encrypted: i=1; AKwUvBw7Wt0+yiCcEd/GlQSmnN8IFyt1or7No0OQYFT0W0rbdvkIpTEKjt3nmL6mrPkmLiLKMLAkGTSWdko=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2rX7STY1Wf/Gnn10T6RgixFbL3+ojAdNPQfN+ADZrN06rJrWs
	pdEhHyTeSs0uVdmSqYrCBJiEy7x8o5ermBJwfip68/JsUCCY7jkaB9SF7BmH+0cusQuBLc8wpvb
	YlZY2TK9uMLkyVLeW9nW1eM8zEsajviU2tyLi0U6lc6V5UXLzITTL45AORhICpWI=
X-Gm-Gg: AYBFou2Aus9dhQOofRoI/vs4DglxpZw5bvRVAAx0JARblreMB++GQhkicPOdBaqxGjD
	ocV+qtR4wq4JJ7/aqTwKJ5vS0H21jmNNKY1nDen5e2z0HgOPHpEijmlpiQVqWbr6fN0c3JqDpPd
	5L0vf9AvNH1YGXeQH/rXPnBQCCJYpzCn+E43snI8FunimJvklzjVPZ9nmDjHfrAm4RngpZAyQyM
	SiBewQjEGoVPuokQw9+wHFxsye4woOud4ZVwvILWiIXfVrQqyHdS0/rf6VgXIjKTtK0yL3oRg7Y
	eBGcn35ueZupb8nz+4ymWdmZgtK71h0axLSn16idn2GITRf1xI11n2tABH4AQiizJFYfebW+2yX
	T8++KrXl6x+Aqsp+t6rkFiw==
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr3845640185a.6.1792141433005;
        Fri, 16 Oct 2026 02:03:53 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr3845634485a.6.1792141432515;
        Fri, 16 Oct 2026 02:03:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a0bd8eesm692473a12.0.2026.10.16.02.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:03:50 -0700 (PDT)
Message-ID: <939e324c-846a-487a-8fcd-5236898fe9a9@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:03:48 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-ipq5018: drop CLK_SET_RATE_PARENT from
 ubi0_axi_clk_src
To: Andrei-Alexandru Bleortu <me@andrei-z.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261002121920.994608-1-me@andrei-z.com>
 <20261002121920.994608-2-me@andrei-z.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002121920.994608-2-me@andrei-z.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LIg1ppA3MeMrMTP-QTQhSjqbHiQ5BruO
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad1e87c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=J72pobsmAAAA:8 a=EUspDBNiAAAA:8 a=t9TsTAkN07mTYsVvT6IA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=CEj32ImPKXYnrW9rpEIO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX9tt6Au9RrZK9
 gGdjpCUuad0eD67c1fvlerdFRvWrpCdlPaMwpZxfeXm5qkg0tX/nWZBCLC8uGVvM0+3SUF3Alam
 pL768MdYOJCVPqH2WcLy7p3hQ6VYt7A=
X-Proofpoint-GUID: LIg1ppA3MeMrMTP-QTQhSjqbHiQ5BruO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX2EK1HcjKnLEy
 QlCoYGcH5MthZwraCHNvmZ3kOD1fwkPi4M4CmIb5gW5gIOF1v/abjL83OqU2BTOE2avqcbhm/kl
 3095WvUPPWcj1mbTpXxPvBANvQ01IKofV4uSCyPWRtZBGUOXWrTIFjeKP8BN2pZXIC3XP6Y5m/R
 0kv4CTL4i6IX/g8RL7o+4iOOzfhvqtO+ZkZuqhxdv5vTXPfnuC1UFB31azdR2Ot+lgoSDuqcGCO
 paND1VaW7zDndMKZVVZhySzVHHOJBg5U/yZAN/jjGhDGScnCiPUqPTbKHNAahQxAq8d6/2aXa9P
 BsrzgZu4TtE5PeMaIegHiWgk8rV+UeweDhiQ5X2B2lNUZlS8HLfN38jW76ZRn2LmBkJXcWuAcVy
 2moWd9rodZ3Nzs59HsY2Aa0DQQZmNyayHzJu+cRDooPPXg/jz7KxtYpqtYduvjQJGbyV0T+uePg
 ABo6tVF+tvQVNvX8AwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160035

On 10/2/26 2:19 PM, Andrei-Alexandru Bleortu wrote:
> ubi0_axi_clk_src has CLK_SET_RATE_PARENT, but its parents are XO and
> the read-only GPLL0 and GPLL2 post-dividers, so propagating a rate
> request can never change their rate.
> 
> It does make the clock core treat any rounding gap as a GPLL0 rate
> change. Requesting 400 MHz (GPLL0 / 2) while GPLL0 reads back as
> 799999998 Hz makes GPLL0 the top of the change, and clk_change_rate()
> then re-runs set_rate on every GPLL0 consumer. That includes the live
> NoC clocks and sdcc1_apps_clk_src, which is gated at that moment and
> fails with "rcg didn't update its configuration", leaving the eMMC
> controller and the board hung.
> 
> Drop the flag so that a rate request on ubi0_axi_clk_src stays local to
> it. gcc_ubi0_axi_clk keeps its flag and still forwards requests to this
> clock.
> 
> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
> 
> Assisted-by: LLM
> Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
