Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477881;
	b=JrdVkHduSdkTl+Dt5hktzw4Z9519mrNys4Js7M3QQF/uepE0Um7DaC9RoXOVyeQUPCjJ
	 hqu8pS5esh/5xsRtzAd0t4XG4VREF4zuNvIZ+BXVPUDw1kdGHWe99m4SX7y7pMiPucyfI
	 YPNnVJzoBEs3YvFZj2XZ+quqMI0pVW//W+YxDAfdbCuCm6BmMoyNuXaHDIDSUY/rLKLQa
	 EVvZdF5AAnRdH9ApcPGp0qU1oB7tf5eFW7Fz3Cq1vinLfXGkMT0qnY3M/FTQ6DmGaHeaq
	 vUy3fcieIKiJMAZpuk5/MqZciXgUHWvLOWpukTKOJXAcyTSUeqMPiFdTPmUkOl0ZPiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5qeBktWCqD8WCi35BHFWCxm3SbhsTKYAFb872H55WAE=;
	b=08Si/rsguPc7yR89bUwm4V3XFSYZQM6kQzFIddqRQSIDg6CqzIldhjIQgg0gC7UckOce
	 L25tGvEVkIF3SDd+Gpco1U6Kk6zQM9cGOCcdavL1UaEy7f7QYmiGfNMJoAvS5NHVHE0HO
	 wCwpl4ZgGH1mdkyWMPiHRlP7jLw1dXofdkH6zezW4ms3Gak9GMamP/EFDs5CW9b5lxBCW
	 FHvGxNKBnEIM9JcqFqzcfXeAfh/Um57M3ZlSpupEBXfM/gqbPC3Ccxx2wEbMAYL/JFkmB
	 AKOos9bNF6YXi1vjd2RgRuDvosANT4TI670li47+1yqhfEY7741dbS60yerVaZoAHeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZfoH7RQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KWjDz2O8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F511606A327
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F511606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZfoH7RQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KWjDz2O8
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tIXg3305673
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5qeBktWCqD8WCi35BHFWCxm3SbhsTKYAFb872H55WAE=; b=CZfoH7RQmv8/vtfE
	gNKgogaPsrwkO7jBSRgkoIZ1WgWVsfNwRrHe/vbbHApbFlHyp6jqOtDU1hcbJ7FM
	Lh9iQFSavTU52kutaAeP8QPhQZL5aX03wau9GBdndavqtstEZ/Dvnaf41kXOSaOQ
	Uo0YYVjmexQU6r6jjUyDtoWg8Hgxl2X9cPjEImE+Jt/aeVX92aHWetM27rgoaMrv
	is6Wnrki+WKvhOPa6l+osIkfNMbz3XWYbqk71qnqWDc6CB6lN8lv1ohBFkbL0j2c
	KSy9zX4eP/epdIU1Sw7bUG97RgRRo+U1QBzF8W863ygpl7AT4cO9o77uCtEgAopu
	ppppng==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ss583-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:31:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5356c6d98cbso10403461cf.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 23:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477879; x=1793082679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5qeBktWCqD8WCi35BHFWCxm3SbhsTKYAFb872H55WAE=;
        b=KWjDz2O8HU4SbDGylmcQeUUPmj1Qjp/+45EeNyzqA/GY4mq9BXXuf1pcFOphyThsny
         HvA6iOpDbixaGpWOrdrLEoB4YmjwaRlZA5Y0Wxa7IjZGleXEjUnUCQBqnSIroLyYfJCP
         NDRn1GTHuKmjoPjYJYRAJ82xA1vNnTdpfWkkYOSlDpPioFaseYqyzgOFMItJWJ4eqZ/j
         /8k76A8npyCNl2M+WaI3UK7jD+xGQ5i8tz1iy9wmrF1QqRGGkaaYfIDsv5ZkMmtWe/MV
         6vqgVYw/j+N1qRQn4dHYxVybR68Qg7XYRdHQ9l58gcUdnN98b860W+rHWA5U2bZ+UACT
         lDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477879; x=1793082679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qeBktWCqD8WCi35BHFWCxm3SbhsTKYAFb872H55WAE=;
        b=1Y9U8boy0waXFv52zf2itPKNQa2hCzkgzikeVm6cPPVp99pB9z0sJoHRShMqiKvXAq
         LwNTAM6Ikqe2eY3I6xrrRlWAKXqYLfau8a7utQFOtVvnB2Dk4e3Sq4JFApEFZXHsCnoq
         7Ll4BtD6q5MMe0hEGdzn8l1FSLLqlvd/k+JL1Nncp9I22DGybktrrxHbRjeVHwQokwlz
         YslAz1OdsJt+nv3bj2dgrEiH5xHnpz5z0JkNzQJfVNadc1Qw4URjDYKyFg7tlP4AOqgs
         QFrk7aXzKo8PY2VYmwJYpAum7axKvGiTBn96UYLwpsMeNx39+XdS05GS0anUVPeWRZ/G
         LFyw==
X-Forwarded-Encrypted: i=1; AKwUvBwQwybYN94NZnNmcSuiFYlZBo5HLoTyqhNB61UbSQ5I3wOcNuDCYcPvYMVKRtZhhyU5KzjQ8Ei+7R8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKr4JOYKgmySsn0zbDHRK/yK7T2Q/RmGJJmzdJLOK9wDmuzcgCB
	9aYCmQZhQkEwZmpUI8AHyCG9K1A08ibPfT1ZaoIPzRx5KXr73+kt/3LuiyVzR2uhbpxlOuhy9Fk
	bGAytGl1ty9bzQI32nI3z/j7XTZZTISDkH9knB5P1AZ0Hv33vru9oDZfGuRhy7Qg=
X-Gm-Gg: AYBFou1Jdhyzg0Np+/9seIV+gZGmYtUp4BhAkCZe1OXrFEofATqjp0AKFM3LW/wXCVC
	TnX+Yond7BRHa2rM+0/gcB2JgiuPJNTNumXymnHE711eWWwbQzPK7JF5nyVEiRsfFyAKyIXTUSr
	0A6LS4db6xtRc9paHSCB9iUcyjXLcQmRejq6HMBzR6iXiE4/ng51fZqgcBwwMqfS7OvcEJVcx64
	WujMj7ssiWdHujQ3/UsYQbKtrKNbaqxc/qy9cUxDHNR7iMsl6jPsPS3dv64uh9PrT2+GdgZpn6n
	e5iQvafxRcN+h4PQAPEzTXWNXROcrgXBAPkP3sEuyqUM0hDr/YiOiJpXSVioD50/3Ag2HGEBf2R
	ZFOgeJTWlej0ccL2AxykqkA==
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr169134561cf.3.1792477878566;
        Mon, 19 Oct 2026 23:31:18 -0700 (PDT)
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr169134161cf.3.1792477878105;
        Mon, 19 Oct 2026 23:31:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bc742sm447200266b.54.2026.10.19.23.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:31:16 -0700 (PDT)
Message-ID: <d1070a58-98aa-4a98-b0a1-96e974be5abb@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:31:13 +0200
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
Subject: Re: [PATCH 02/10] clk: qcom: gcc-msm8998: leave the MMSS QM clocks on
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
 <20261019-msm8998-fix-clocks-v1-2-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-2-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX+a29gj8KiXeW
 WJ6BXOT7sk550dIwtM+IecuScVDVbmt0MQ+Nt9KE948Xuwu7ZlbSHmVBqGDLJmqTGEK6+dPLqWK
 q3YZuuWoaC3i8idK7BX79/TDuBCx9Nt9ZfdPDLQ5PQTkd0xQTO/T5bLnmmnVrRAvcf51CmNNijm
 CdY+TNvfDUby9FeNylZjbOkaofQqYIKy8myCebpcSbmgWdRczALUNTVP8XNddgku00s3DxBt7Wq
 KXaB4NAoyQ0l/7USybXaNnF8LzdJjO1lgyK8wRUr0gOSo/f8hZDX930ggx68dxWsbshxdQb74Nk
 fE2uOL6ipxM8lh/EnHXyPMJ76e1/o2U4P6GHc3q6U5FggxoyS4nysLLFhHZajHqxTHTUzZllA7i
 2EbMKJdBmylzEfiAF4rr/Iuh6vyvC+E/BbHszJm2JUwqYrx6pOPUvA0i7GldOV3eScV4YvWaYRn
 xrVf2OUCxmj2/WIkJ6w==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad70ab7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ldyKz4HnRpUghmHhsoIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: e0LB6ghaIR87hkrHJ9U1uPbPgWO9prc1
X-Proofpoint-ORIG-GUID: e0LB6ghaIR87hkrHJ9U1uPbPgWO9prc1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX16IqUJPcYB/d
 k+2ScarPpXYmHjN6JqsMbbcVpjr4R+khAoV65/8RonycvgRdDru46PbOnx94XAtA5JNtCi3Z08c
 p5bOA0crlC+rNrLNIgymg7IZiwDHqRk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200025

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> Booting MSM8998 without clk_ignore_unused, the SoC resets while the
> modem is being started: restarting it in a loop takes the board down
> within a few dozen cycles. Nothing references gcc_mmss_qm_core_clk, so
> it gets gated, and keeping just that clock on is enough to survive.
> 
> Downstream never registered gcc_mmss_qm_core_clk, and dropped
> gcc_mmss_qm_ahb_clk because XBL controls it ("clk: msm: clock: Remove
> support for the gcc_mmss_qm_ahb_clk clock"). Treat both like the GPU
> BIMC source and SNOC DVM clocks: stop registering them and enable them
> at probe.

[...]

>  static const u32 gcc_msm8998_critical_cbcrs[] = {
>  	0x7100c, /* GCC_GPU_BIMC_GFX_SRC_CLK */
>  	0x71018, /* GCC_GPU_SNOC_DVM_GFX_CLK */
> +	0x9030, /* GCC_MMSS_QM_AHB_CLK */
> +	0x900c, /* GCC_MMSS_QM_CORE_CLK */
>  };

ideally this list could be sorted

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
