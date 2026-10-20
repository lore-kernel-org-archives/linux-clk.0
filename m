Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485343;
	b=zceNxKLM4UlYAM/L9pYKQV+V0Oi47vU/Z48AK2WGlAYaWxG6+EHCfU6OAX4P/a2sUVXA
	 vcdfWfZzhVelzk+SwQX5zfCX3bVk4z1KfSeMYuOyQpAZxOW0rgvSifWwfeu2wGWttLYNu
	 6IScShD2OhHrAB1D6D3myF7321AngEPFL6djoHkB7WpD4VgDEKk4AS1BKfXVsHuqen3Lr
	 mswcUBaJUN+nsCQQrmWRkNQUkFypWIkFzmrRX4CXH/lPuvo3pHDuBaZDaGg+QU42L8q6L
	 fn964qunGtWvSOoWGBSdShOZQYgTJ+7vzZA2WCHH+YZfZnpP1o4i9Nddenmj7lO/hBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=66+gStrT+StV7zXT9UJMTjajLq3qUZbhGhADbacL9UA=;
	b=vtKXiD4WXPxHGBZNPunp7Yud1XDwK4WKXzHKg7hipRNlFnVCu8PNwdyaMd/vOgyfmloL
	 7VQKDaikC/wKer2QwLTckvhPopG4WBfp9i/b094sOLvgd3G6ZwY6jnk3Pupj2i0ycyViC
	 X4nZs6ILdK0STAgk0UuSeaxBhGZinE2II/zthXkodmYPgCqfcvwLUqGZWIIMI900tXYEp
	 HD6f6d55TJvppDVVLNDvsMPJ8aAGAckqt6FGawzce8PPwKSL1cJcGIaaGkNmo4ZO4PO8J
	 GTfUSLjZ1sMhXxt5GIOkVwA4ppGh8/eIuz4m5TPbCpo5BYLnoXaSDsEBz5pgQfTgmBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="g7h/aEHm";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V3HmpHLl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE30606A31E
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 08:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CE30606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7h/aEHm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V3HmpHLl
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8P3OB1253880
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 08:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66+gStrT+StV7zXT9UJMTjajLq3qUZbhGhADbacL9UA=; b=g7h/aEHman4Gol6E
	CvpiHjeAH/SLbNfmctNUpdPbVFcEqKeaYquVqQ7tvJ81dTk9UuUWq3OwUZCfzwum
	Yr56PXCEuHp8SXPchbM7VjBTAtXEi8M8hNPRWkiIe/xjKdEZ7edA9nXHcuYO2leP
	26Ij0z4Iv4fFvJeoQ1WGP6iKglkKcBHQmVYCedulvTjgWQXw7gKFzYAx7HLGT5Cc
	B9EFiqbZ1jZnxpVloiLaBFX5geIjp/AKdS9d+IhbLr3H7kyTUibSpdXtvx/hQrMe
	WK+jv7Y4+nhN7d1Wdhtf+kEoH7zDz0CGAF0GYWDpzwg/b9KZZgUEbZUK164/+Wu1
	PyAdug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n9mpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 08:35:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2bdebfc5so98625785a.1
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 01:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485341; x=1793090141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66+gStrT+StV7zXT9UJMTjajLq3qUZbhGhADbacL9UA=;
        b=V3HmpHLlMCSE85ynyodSY8ojHW8pgPYitAF/AjbfLAlasNx5wWzQ8K8UQl3bVkWr9o
         wjymIZL/VAtPmnIHTORcdMcfDPRTV8EQodYGwsRMWtx0MrAqeaR1UnOGI5fwkIEaDcrO
         QHkxMjbDvnror7yRU0X/iAArXnZMytcWfrp0uXChFKzDt7eM+9YAtJlditoZGiCvPLoc
         Ow8paiNXlVgf71zRQTc9oWKUgIEtDzOB88kS1gJNjSGeMlHtqMHubJEPu5yP9a88512q
         6YcCsKeztv1iiKIj6oMTPxRdfZxgi5T4eI1P0eYPu+xFVUWXqwzrBdoWSz20uDqRxFsF
         qRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485341; x=1793090141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=66+gStrT+StV7zXT9UJMTjajLq3qUZbhGhADbacL9UA=;
        b=GzIs07smpcLNxSI1FXZppb8P9e0f0OKXX8WspSHEf4+88eVBNrP/oE/Pf5cuH5Fywc
         faIW0Jr6YRLdakT0W086fwZ4WtcnwhPFjlFUsmqeBTGjn94O+7dfe7SxRd9PRKkBRXAA
         ZOO4lSS5+rRqh2VohJXazHpl0ZLF1m2FYuXOmEAPb1eGrkjCIxW7xOl0s/3pn8AjqDox
         Q4YreTJfncP32AfLT3tXLyNVDL9wz211DqeY7HOBkMF1Rn0K0LVS9+iz4xTJBfiFf5S7
         VpBofDkc9ADzE0MPcR/DqrJhLvOlSAAp3jxB1k03VB7kSOrkPAuqDl+A8ZUvtLy6LBZz
         xTaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxy54EtMY9m8w+v2ohCd7mrCnkgiJnmP8JiVccUw/txfhy6U5HTaNQVLxu5TC5n3Jb8C2QV2OO7vcg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLl/IlWRcQNonv4giOqWzwm3/nwa9Huk1ppXMUD4QG0DcbLUEt2
	Bo9jTvn1Q7cbsNbnt7BwgjJNHWmf0LhTMCQK0AatpuBme5IhmX+U6lO+fYoUEAn8RvLi6w70GA7
	NwJDK1izPj7l1V/tszt4zxr2dDyHi7yIvGBQBQ/v2C56K3pAgnBjm0t3MffyoVNU=
X-Gm-Gg: AYBFou0U5L8kfXXtb8X6X/YERGLLYX4G1AmrQ8x7GoNvYuFvw77n3i10isB+ppKV23i
	nHA9k6pT7ROAKNUpg3VkAB6IamCSx1JCdrJ6flmLGpqryNLME2um/B5OCRprvxt6miMVl/w8bp6
	Ic8pzCun4rI/xjIwYWuFr+G7B9FtYsi54K7lefAvmh3uf37jVUjmb8DOXB/VvQ6yrUshX1E5O5f
	kHUolhb4t8yCJphidigUY6i6/uob0MkZ1jeorfbEBXsMS24SH/j2GQmZVd2xRTtzfxhJZBQHDgf
	Oinagb9gnqeBHWUnLUUjWPuiGi9T7cFlZiRO6XkSX3TE7eoMckOM83qLryACKceVAOHRkLDvlMV
	2bUsN9ukT4150Nh4Z+tF2Dw==
X-Received: by 2002:a05:620a:2948:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f29dcb869mr1945706585a.6.1792485341381;
        Tue, 20 Oct 2026 01:35:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f29dcb869mr1945701585a.6.1792485340917;
        Tue, 20 Oct 2026 01:35:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d5262sm5053676a12.22.2026.10.20.01.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:35:39 -0700 (PDT)
Message-ID: <3de40458-7d7e-4cd8-a200-746e4c2adb13@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:35:36 +0200
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
Subject: Re: [PATCH 06/10] clk: qcom: mmcc-msm8996: keep mmss_mmagic_maxi_clk
 always enabled
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
 <20261019-msm8998-fix-clocks-v1-6-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-6-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: g8Zx1TSlO8Qe-yo1mwLCbo7lRxOhLROX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfXw9gQyQpHMqpw
 V4Pfx0hwKz94QTwJQyFEIc/tAW1V1g0e4d0lMsmPLIOR9RWYQTpUesXooTUcgusf2pc8qtMk/ml
 cxdq3EMsofWtNl2PzEfvehOEHm1Qdg2or4qtqhDaUMzsU1I0oDn22K4dmZM2v07bnVaonnsxrFn
 xrf9i49UG+3KLDKkSR1vDIVk8pWnP9Jnsg27u0NPoRrbn/0A43whJTJ5kJbKXyP9C/lkrCrZyCk
 H6uxrEvmFRK6CwOqoAdvVuPv0eonIvOKM1xhvHG0LMzZxqlBB7w1/zSmTss/ClN00DQAIcDTWLF
 TeFKcpcc1I45s8yp8kHE0ypg43X1JTd1Ic3hYGIffsSxjQY/3H222ThaWvsRfGc5rWQnsmNKfHL
 kFjAbaPHDMovD1hokXc5O5sIBz591VgLc5ZwtFXpHHyn3dsqIFCx2CmZ3u2kSHW1IvuDlCeGHOd
 nB56ME+S9zoE1t3MfcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX99kV7ut7OgwG
 wDPEgKf+HUO39C/4It/ulnxt56akb8aCK8r5Aq9ZpAUUIFAqqRW2JW/Ip6YqFzCbOA4J/T2B73l
 BmNnhWF0T4oClOPkNz2Pw8AnCYwAPmw=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad727de cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KiQJPOv1UjsmjKsQXtkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: g8Zx1TSlO8Qe-yo1mwLCbo7lRxOhLROX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200034

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> Enabling vmem_maxi_clk fails with -EBUSY, the branch never leaving halt
> ("vmem_maxi_clk status stuck at 'off'"), which makes the VMEM block
> unusable. The MAXI branches sit behind the MMAGIC aggregator, so they
> cannot leave halt unless mmss_mmagic_maxi_clk is running.
> 
> Commit 7705bb7176b9 ("clk: qcom: mmcc-msm8996: leave all mmagic gdscs
> and clocks always enabled") marked the MMAGIC clocks CLK_IS_CRITICAL
> because there is no bus driver to manage them, but missed this one: its
> siblings mmss_mmagic_ahb_clk, mmagic_video_axi_clk and
> mmagic_video_noc_cfg_ahb_clk all carry the flag while
> mmss_mmagic_maxi_clk does not.
> 
> Mark it CLK_IS_CRITICAL as well.
> 
> Note that the halt bit is truthful here and must not be papered over
> with BRANCH_HALT_SKIP: touching the block while its AXI clock is off
> silently resets the SoC.

Will the right fix forward be to grab a handle to all of mmagic
for MNoC and activate them as needed? CLK_IS_CRITICAL is obviously
a workaround

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
