Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445244;
	b=yZj7c50kP58N72FMCh+zL2l9HrsEb3xEiUtAgVVfRZQZDXrN4oDIazBIkrvG0uefrGtZ
	 WRPFE254AZMFu73I7zSFKff5TbzdcMfAoqU9Zu86S9Pg++XC0DrEmgmNYGeIbCYg/zhb2
	 C/QwbzWO3eo2iZ/maToCxh0kHwkU4bKaXG4ozpDEdPfLTa6OMkVoMjD56llQdPo0Cvzpb
	 xw0Mv3E6HRDlmpDGSVNk0tEgPQ7lP+PAe//LMqkxRJlp06e6DWHvX73JPKAkvQHIhVhdv
	 NeXZbFKwcyN5BnYuCC9wl1q3AQQfwKe6/ruTrMNC8USrMFJA2HtWfs3vkUjIbnGvs6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5fRZZavcrvy85m+UEWFX2bfIbRJSvrdSh2BlLbhKEeQ=;
	b=NH1Q9d2nWXQs2hKmXpISxdK/81WhCrUbG+1jVi+qcW4NAHTEitW6/8erdlFLqc/PAHkv
	 N4i6p5TIXGUjnjoQkL1eLJlPn7xhns4qqYUQfJtznW1wkrC6jaYvHaXcuDu/MqPctgqR+
	 DBhhfUG6FOjN1ki3cI1mTGJ3oaMvZkXcjhcwGYRYU1084DgoG22/YQC4DVjDflYsCBuYV
	 rIqpHtoUk117AnNpMT/MAQrW/ayWA35DJ3t/lfnHZGNelgUUUHLrkLTAnJUfEVJPA5YPp
	 EGzF2kmjUilVOMm+Gi+ydvOvgxAE8gZlVacDsN3uqyoTCU2wLh5P/nAndmS2UvKE/XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d13NCqSK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JabvF8eQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276CB606A321
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 14:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 276CB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d13NCqSK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JabvF8eQ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLGN31461376
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 14:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5fRZZavcrvy85m+UEWFX2bfIbRJSvrdSh2BlLbhKEeQ=; b=d13NCqSKip9QLy2d
	TvC6LMT9vDpvGSj0hJS+ij1V7P9LSb9MuRKe6nC4tN0UbeEtHTu3FvYmDgwHJZ2A
	X0woSLyifN4rzjFlMeIlLP1VVCCKehBoi3iZaD07JRSYmIXX9k02GPDeIgpt2kuq
	5bLe5Su/P9GVnbW0iBPT5vvaFnwNURUHpQTiEXaAn1K7dIVIRhpl8meNBZDU0Rlr
	Am2DpbG2EXI6vzUriz+dPxfQU0eDb+adMQej5XdJ+Ibhv7CYYg8jkf99WSaUR5/G
	QyN5M6UY0DuBdSP8/BcPK0QEgDmrP/2Ie2jLS+dC533NNgNvYxYcyOk86j35rCqI
	w02zCA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a1tyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 14:47:22 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ee433ab272so89919e0c.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 06:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795445241; x=1796050041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5fRZZavcrvy85m+UEWFX2bfIbRJSvrdSh2BlLbhKEeQ=;
        b=JabvF8eQeUVblzFKTHxAIgSiG6SnLlJDdygb+NVjTwwgyRz9oNO6X8MMKyjCXc2h0G
         HrlWayKTUsRUMETTo/9XAgW54e/qcZtleU7ZIzFYUiAW7TKqbbqgdXKzekntWKIKpVQn
         9JLygSgPzcrJ2s0xC/Ii2dzg5y/yt55Y71UAUlB291Glp8/8YOQYbUWJ3aVdqXC1QkOI
         rwapRmu0ovb319B9NSyyR/zMslFtD1jb2RMTVnbMkdKkzIFxPJOv6O1qJeZgi4rpJEWw
         3FKLrIDa+cW0VeoIQUu87j6YIUBdXmbuEgGfm4QOrgof47MVHQ7ZKOs9SSb36kJt3ISz
         +nxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445241; x=1796050041;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5fRZZavcrvy85m+UEWFX2bfIbRJSvrdSh2BlLbhKEeQ=;
        b=zBwTig7AJnZwPrjdaDLHm+jHxDTf50AtVPDJMuqVZFCTpDAGAMpbMsdMSBQ+Vpb6w8
         69B4KtYFYGsWLJ0ZR2cHGwqEzPwjpck1tEbHP2CVf20xBKtBexVSsWUuGALQG9ShaoWF
         bFhDfp8mYqo+N/lF7ffu/F+Xl6cy9eQdEMnTxloQbFQ/MbKdmqHPO+pnGByGt6ix1Cm2
         0yZ6Jg9+y0l+ZZQJCXMOFCLq3VcagiuHEwC3yr5VAScpXHRNCIa1BP3SL36CCwq380XQ
         DAMgwu0blLRwplQ3/IDzRnB3K5w1Rl9DPqvvE99AQkvPT/OixgDWTEiuJlfsYcyGdCH6
         pC4A==
X-Forwarded-Encrypted: i=1; AL+hErGt2P4KVkvy1WYy7OiNdqsdQEfZHl6kvyri3MlO942IOtLZhJkKkVliS1rVxWEALRqFEeApdXHafh0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8favun2r8pj3P9kn0Ae48LmMzsF8qUTnhhkGKcMgl3Yc1yVTuz
	5AWHCs3smL5tm6gk/dRwKx5p/tTuJfypDMM6ImpQ4sIvO7CypjvIR0CJAR8sFa+FlB/rzg3GQOb
	QEFcbM8HXBQ+z5utpno8XUw2M08tColfa7u5nnFQomQDOaqfzeOtXlk4GYtPDxmDFB5bKdWQ=
X-Gm-Gg: AZFdTZf3t4kyk96QtCNo6TLdU+I1j8PVuTIvyinoGRQZ6denkWpnOqzpVNw97QqqG7Q
	GxdB8kIeTNlFPT4foAHBoQsn4toOkkiUf0OKUrLGrh/Zuk14Nx0lohVeTI/NDIIpYJjAZ4JCCkg
	RQe0jgzT+YgwRuEolVfszTXGndbOZkvIhAmE84x3tv/qj51kU+OIfLDW/u0ADjaTqqMckfK1ZNz
	S3DznaJPFiwOrjjZf7KCGLtJry3P3fVrUTiVx7L6/o0ycqA/2u1mwqlgxt/vJz1VBwI6Rheg6Oo
	TUi4cjRHj1eGFLHngHWdMzuxB+qNV59sLJGfTw52L773zKIaZsxRhmPJSY6qCpvm9wtT+JqNj1E
	ghdc2BH8b4p90D6WrVTRmpMo83Psrx05oYACwVeZ5G5jR6Ul+RkZKGCQC234TTqxuQpNWZH8=
X-Received: by 2002:a05:6123:59c:10b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ee8b009d61mr5961099e0c.5.1795445241386;
        Mon, 23 Nov 2026 06:47:21 -0800 (PST)
X-Received: by 2002:a05:6123:59c:10b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ee8b009d61mr5961052e0c.5.1795445240923;
        Mon, 23 Nov 2026 06:47:20 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8db37sm419262366b.35.2026.11.23.06.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:47:20 -0800 (PST)
Message-ID: <f66ed61b-b62e-406e-b21d-2f3a90c90040@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 15:47:18 +0100
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
Subject: Re: [PATCH v2 2/4] clk: qcom: Consistently enable MSM8939, MDM9615,
 SAR2130P and SDX65
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
 <20261123-qcom-kconfig-unify-v2-2-fe56c8fd15bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-qcom-kconfig-unify-v2-2-fe56c8fd15bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX9kXNcLjkF0sb
 TSFqO9eUkZQKPjXLFRg5spNtJLVkMhRmwO/iBEupCP/tTp4SQ1/Axf0een6aT4DCJVnLxVtfT9O
 xPyulIVKf5Nc0DzoFOO/cTGgsFz3pYw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfXzyZF03tBBZF2
 Aoo5T83vfwhHE0yOMxVF5c/pSJfXFA9JGwlf9x27qfB/bNnh0ohCB+ndLaMos08Pg36z3GcdNOR
 vF04kvFTilxGlLk5IcDhZymiYmO+SPWne3AoFXJtQbssxKXPWAwOC6We1wPdn2p1aWeflwUx6Mn
 yqJ0vDnUgJWlETzZccelSl46DOga4ctBR0QC7mSqju5eymeZ52oyj6yBgQChtUitpBwGUJRZC+R
 A84L70xRQug8jx/3TC4HLC+UKPI2Is5pAfhJ2QhMBDE31XdxJz/iJCq8P6dC2hNCcqvaEIfxgFT
 JNQjtn1dgrF7k5vqcdR7V7GPkOjwMN41o84hvSd0dDVISr50LNjLI+ycqLuZsHZqS09k78a8eEP
 5q3iGBad+euAisDMP+Wd6VqjXiIGOqC+tFu3C0Y5d8NZB3rPJUwoTQ84/pgIGWcteba43PjOkzg
 CT2DKk6kX+7PDry1gPw==
X-Proofpoint-ORIG-GUID: qAfCt2Lqbf7-OsqQOf0KpwEL0vLs_JIu
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b0451fa cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XmsLJy_gl5TqPVFdfuEA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: qAfCt2Lqbf7-OsqQOf0KpwEL0vLs_JIu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230058

On 11/23/26 8:38 AM, Krzysztof Kozlowski wrote:
> Critical drivers for MSM8939, MDM9615, SAR2130P and SDX65, like pin
> controller and interconnect, are already enabled by default, so should
> be the clock controller drivers as well.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
