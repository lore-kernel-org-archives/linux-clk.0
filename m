Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D00D40DB3D
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 09:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231146; cv=none; b=SyRQZUUIRaEDF6eqvhZPowbwKVXC/AD6aA3ShvA7q17f+ntmUE8X4Kert9uMgQ1OUDzPow/KkQlwUnBjmMrPCNOx8tRkIgoIw+ssbsTZbS3iiLkT03lwsmAE5oB7sU/H8gvrnA91qb8n475RKF76h6ittu0PxxzPLW0ypbCm+hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231146; c=relaxed/simple;
	bh=U76fj7KOyjCv+TI0P1EkomwWv2FVIj0e58YuahYfQ1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2+MVVakNu+5pM4riW56WQLtrEJpipNB9aNyqD9tfYj9r52q68/jPNM4mGkfIjTvH+lbwpeN4usELdIlb2gv7sRA5FtZitBePz7+CP7fQtcH9nuwjUyhQBa23Tat+1mGfb9/gC846HFUh5ovZVW2kpD06jpQ4ADGxk5XHnUtyws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FwGEsm9L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqe/zWcU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FwGEsm9L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqe/zWcU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82Eho2026962
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 09:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U76fj7KOyjCv+TI0P1EkomwWv2FVIj0e58YuahYfQ1A=; b=FwGEsm9L14tIqU34
	8JT86Xw9NsHPUDED6BSAzbeV77w0HJQTPPIc/fXecEUHiYR1IuaDMAMIXeWeUxi/
	feZNTCesIvr98vPyp8uHXeGAQfR3uotybbL3LnR3tmdW9p0FC9IF+Bl5NwYL3GEc
	8910FyR1+lxHED9MG2NHYh1HNTxVjaKO5E9ZDGKQcSP3nYNYtNHfUul9RDmkAPKv
	2tBpQMopzrmtd1IRDACOwVIw70+A2gWlKKUbvuA4WC0IAvwWak8jyoyJVW16LAUn
	dY3gSig19aIsvSj1LqADyMIWnyd14qT/K5HmAuTZB0fPu0yd1vjpac5kcpQ17Ryi
	8WxIZQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpq9hgq07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 09:32:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfd1772d8so6805451cf.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 02:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785231143; x=1785835943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U76fj7KOyjCv+TI0P1EkomwWv2FVIj0e58YuahYfQ1A=;
        b=fqe/zWcUinBO6JNzpSdTRXKvR4AOxnGKvK0jAuZ0/UGM3vpUuIs0rzf4hn0ivmYhNr
         0lkUKI8wnGg5oo8k6dusOfke6mAxgHEWFl2jwxs3zMZyyJipkH3fq7WpBFje9x4iWei4
         qhtrwQxz5BzmO5O2gQn1ZMD1L/1WUhdwiyocxVyU7WKfXbuiqSOZXs9KG2yQRfPL/n6s
         CEIQsgWZVyNsqPIU58VgScDxEn+V7bgemYWIXPvlTHJAs9p4wgDtWvk76aV1VMOYQbZo
         Dzb11sBznGbchpGqWqoArqWOD3vjnOAr6oCTSVg6wUt1U6NpHugd8q1SHFXVfnlhzj/c
         pIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231143; x=1785835943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U76fj7KOyjCv+TI0P1EkomwWv2FVIj0e58YuahYfQ1A=;
        b=l6nvAbPlVzKcaAzWVRmpCREN1FLzgEsg/vZeu5m2NdNF7pgSkPVlFM3rRMF7nV6x7s
         poizAFcXYr16IWj4LH9Mdi9LLB/Hie4zGK0poIBYjNi5Pd/AJaOiM0twNsFdzck0JSJE
         EtXiR2gQ3ll5N+N63KLE7H2hTn1NCaYobE6DlBx87heeibgrZZHhlZUUwHzgrhWD+J39
         o3DMgoTKXUVsHkfeVgEGSwZn28oGa1H8etHGnEKZlQoXCVBsxzAxSQZVOSf4jrxn5MlL
         Tgh0TfLftOpVDh/nEoCM/URWvrtT8ZRsDTR+mUGIUNLFXFgYVZRAus+YmA+2p6tXY1I7
         Hy9A==
X-Forwarded-Encrypted: i=1; AHgh+Rpy1yIPFAhOnqeNGS9Pqkx35t6nv9GGovJ7W/Kx8zfMVoqYbl2RnbPQqUiZQ1lzo0B0Va7ZS2Ns7J0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxhp1OYowGiQBAVnKAEgb2p63LpKjfPDx3PSoyf4E9qhwLvxeK
	EBTHlg6wx/SDep3jle5dFLiP2Iv3XNalcEt4cZzxfp/GvqQ6FzgTZw6n4IsG4fhaMBZr5T/WkNY
	GXG5pRWiD3nPP0NDvYbnErmgX2gSi4qkPRqLhFkM0xlx+RIh1m529nMVM3NeXPnM=
X-Gm-Gg: AR+sD135ZCcplPig/cq7uReHDy4sNOVhv1yjcZ+KHWR1U9HfBzShBqm01A/qknT4fQE
	mt7T81RW2/kQybk3Q/ddEpq3dfCIVH+Zj3W17WYdSY7o2aULO7Ns9CXqVqPgiyCwzC5l+hQZkv3
	V+sFYESz+4PAr/yUPXqEoSwGRyzLFF5VWMsI0z8TAsGa9zxQEM7auHy63ZHQ7sLOnpjVoy8FdiU
	gn58GSNgTLnFMXIMzgOQwKzbBsBlzmGqKVqM7UZEpCGii0R9gYsPEPaCa6zxRapXM4LMv2yRT+O
	km6RdA50TCiGS2iwNdsnvRh/OHAg6Ri+eXD8NGg9YPPgjuY5PNiD1+rSkWFl9ZysWhq8siHqZRS
	mwQSojl3fM6cNI4SpHGIaYO3H
X-Received: by 2002:ac8:5e54:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-529d708f340mr9811271cf.1.1785231143465;
        Tue, 28 Jul 2026 02:32:23 -0700 (PDT)
X-Received: by 2002:ac8:5e54:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-529d708f340mr9811021cf.1.1785231143029;
        Tue, 28 Jul 2026 02:32:23 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb59468dbsm3835627a12.28.2026.07.28.02.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 02:32:22 -0700 (PDT)
Message-ID: <c08192fb-7d5a-43b5-93ce-f17c5a0b3cb1@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:32:18 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] clk: qcom: ipq-cmn-pll: Add clock gate support for
 fixed clocks
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-9-a8b8679d215f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-9-a8b8679d215f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX/6f9oebBfKE3
 xBW5ONquIcLjy0IRGfGR5GFfwGOGHIBFyKepE+0u33YGzGqa0J29AiB0Lcm7Ao1/u6GzAwegg8O
 zzaykzbakovg8zaOA/mpWIjbmivJsQY=
X-Proofpoint-GUID: 9H2V3JAaAWRF9jF37W8wJoicsSqu8PyP
X-Proofpoint-ORIG-GUID: 9H2V3JAaAWRF9jF37W8wJoicsSqu8PyP
X-Authority-Analysis: v=2.4 cv=Aa6B2XXG c=1 sm=1 tr=0 ts=6a687728 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=XRWevJX1GK7jOFrGjf0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX2htUQjimNQVa
 rdPgn7waBKegGAQBGxO793Hdx353yQkP+VbSMKqw8gAu+I5PiNiMWyKFmhf0hJm3ljL+F2Y0KOk
 j9rHlprnBh0pyl+/V4ArnSuiCdi/rNgehVBw+AA/lYQNXT09Q3ahE5LSCtq9SIg/Cfcf5/80Am/
 Dg8KCAhDt4Oc/xk0//ryScCjTcDuNRJhDyulYFKVW+Z8phDaju7mAkPD9OrzSO6K6S4VfNgJJVt
 JKzbSaGnF2ZwQ66ZrEre4t6qZWnZJLE/My1aOz6yPH6Fb3KS903pgKQ5jZP30PFSCnYphnkcI+m
 s16BANYSlKBygBXUEOtlzefl5FAKcbuBWmpWajr+XGlF5qwa5l+qf7n88SgCrXlQm/yf6ooHQdV
 kJGzM7sFPZtjLUHzCRg5GRtAy3p+iFWO0aj8OACX0L8XVo/J6SSEyX1yMMjnfnlpY2gu4MYc5ge
 F6FYvZ5KVD0lHDBvn1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280082

On 7/24/26 5:00 PM, Luo Jie wrote:
> Some CMN PLL output clocks require a hardware gate in addition to a
> fixed rate. The gate control bits reside in the register
> CMN_PLL_OUTPUT_RELATED_1 (0x79c). Each such clock is registered as a
> composite clock combining a clk_fixed_rate provider with a clk_gate.

Would toggling this register in .enable/.disable not be good enough?
Do we need to register a separate gate?

Konrad
