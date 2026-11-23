Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461666;
	b=ac6bJuHwSjBmpOFh9E9AtwkXE3Ln7u32di6Qkn2485EYjFEku+SOaDPXnGUCMmLMQ5nY
	 8d1AJOcTEYJ6jrHCC5GrE0LsCknI2XlYMhgJfXyn1JRrCnnZlQaHrk3VYP4I2Ujd/Uq4D
	 VwW146n0Ab3aBqkLd/28mFM9dpLwZnaiDx53+mn+vbjqJWxrDP8bagRcFnySl0DJOtkc+
	 +PPbi79VM5I3zPxk6yvxUt2m6pPBBwvz3QusL35qCtBEM7w7N1AiZ4ksqVi8nKphXp+Tk
	 KPc+2QNcMB8HG3JKHKOxjD86u+6lRw2chOVyxaybQagsKlY2OfaDoOve9qUhYgdSPeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b7Z+rgnjh6aqXXsMxABYjG6lnOAyHAQOqRDLzFPl3JU=;
	b=5l8uXbn0kmGQjtN1+xNdxFRSBm3vPVg3VI5ZSb6guB5ycviAS89PYFGhQ8AwJ35KI8EZ
	 Q4+Hbe3h+FjaBzSDEQvin/csbiOwWOIZ16VCrw18rtFekk+6U4mw1cG/d5HtCDtrccGXi
	 ADDUYTwPintMxwwhulI4Uj2vzCQ7nSNlWgYGtyGaPMiDDouNPYNjfhn2B6k+r7Y4Mh91d
	 TT9JKYuYtf+fsLKGLlQ43iEDcJ6upNerSrzOVZ/jUwytObvsFD45vOYMUqwPoCeBRI0KJ
	 N5czpXU5HlEokNeHZxWy+Mdpmp4nIyZW14fT5k2r3eZYwEaFVN+epTIcTBfvcfeX7hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hwJWs/cD";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AmHn+eDx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ADE606A31E
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7ADE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hwJWs/cD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AmHn+eDx
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGI2RQ236262
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b7Z+rgnjh6aqXXsMxABYjG6l
	nOAyHAQOqRDLzFPl3JU=; b=hwJWs/cD9Yf34FOb7BaA+BCeWtYdD/oWhHWqGgYb
	dnH404x4OVO25K+YsSi7OPC9k1owvMQdZ/K6sK3mmLYOqM0NXu++AmaGhzV0e+b+
	y6HvHXTK0NoRFhlGpktw1N6ybKL0IzJ5NLe4EH2DzXUjbW2eatSAlxl90VnquyWK
	qrnkTZEfBRNOQ1Xz22qxmpTiHhEUx/HtIZXiT2MOfWLGOc7ZB94bhNTz+0L8Ypnh
	ckTzNxKTgDOX4MXuaQmx2oUjYvZOMxoe6C9kBLPfut6J3OaQrhhKY1Dve1vMlQhF
	ZnPjv85aqb3pqneZTCYaHjg5b1RuuyDh3jPC5jkmq6xsMg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsk9jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:21:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92111028a03so72709206d6.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461663; x=1796066463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b7Z+rgnjh6aqXXsMxABYjG6lnOAyHAQOqRDLzFPl3JU=;
        b=AmHn+eDxvpcKroikjoi2Gd5ah9ZF72fLv6g7Qtetj6JoG1OIzty9+inxJigyOKuQVp
         Ev/qcPHcXcCLLVqiTguAsW8kKbYQx/4UwVGfrMT5+lpQKncGju5BfwActJGZyMfUu28M
         pSrwPpxchDgCcN5PduGEfm1R765kqXqWKSNchOJINwkgbwJhTENoNiyxL1LHa5/OM2Oa
         M58nSctBmP+EmRmAKLnDMWeD0DFdR/t7/qpj+wf8SFr/1WA6IiOYZ3hS+1rJjXfvgMpC
         G0p9Wv4TNLL5aERDooCKndnciPu5YbbBBWHFfzI4EKPoe8kXKP6bSYoJ17qaXPIen4Js
         BrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461663; x=1796066463;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b7Z+rgnjh6aqXXsMxABYjG6lnOAyHAQOqRDLzFPl3JU=;
        b=gsG/gqXmQglPgpMPT0zZJrdzGNEN3Y0vtPxiFUmBqN1BynAKKBzL1JQJoedpy5KgHZ
         6Bl8XipHYmL4g7DXvHX5h3lVwjpXTn5Tu8MufV/HUL6mmqAj5BneXIE+tzv8l6lZMQuf
         25ihX/HldZSKInWbEH83iiOV/anHVXKga8QpbqTRkCuvi2BWoDLi1RFgcaL104haO9r8
         uvI6DcHyRLeajOMhGutxdCTims8MZtSvKby7sAH4paNYNgEtO/ikHeaOFH6wVm6e6fj9
         XXK/5MQg7TZaaRZHCxOu5c8yt6q7tVh/8yW1AcIOUu7epyBx8GSbJaZ2dCzOi1xPBGor
         vgyA==
X-Forwarded-Encrypted: i=1; AL+hErEfBTmtag35Cs0UQgsQhhP+ZQwdXa5PBoahF0sOFyqejTIss5HdpU4uOIBMZcOaGLSxAqZETRk4iwo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8X6U487f5tXVZcwWhd3AP8niOgYeawDyL36em2H9XzlfO7bV3/
	OfgDs4xsQamiMc3Cu1cIKOfD+qLffHuQt4/3vd7I2XmoktEnUxkagXa2xqO+OrZigQUtSESeAz+
	7Peee1SwxTXC8yH3KNQY18PIS4B+b0zkMwB4h9Y/TxXMYzKl3vgaskxl6R56updGeB834p1Q=
X-Gm-Gg: AZFdTZeag82urSjhCgw8J6QrARup315ukNwdX5eEL+rEQitDT1z9rA8ke+NhMAVdzts
	XNla3PjlsmvUT47d4SfiWsO9hge+/7mcG5j/pOcOcYFQIyTAf8zzFfPGDEOUgTqlbkFPTIE0Hdl
	yF+uqi0vCw4ZZOqs0hd5/xPy8IhO735oEz0YmPP/BtlEcUP++tPXsF1m7441ECHTyR1a5ZLXDXk
	eycxeLG4BeIXX2GD/+FPFHtFovra+NHYzKFi1C0vRni3+28qIPkq8byPgHgmDyDl3zTVkjMeO4Q
	fNhygrqVHx8xSGjVdYlb2mTqI6wfqrMZLxSX4T4Zaft0W/NIoAqoPBsauJj39dBi4GiGp4Jfo+j
	Zu7sqPRYmvcowhthCny5A39IlBTAYDe0Vo9FzBDjH6VurTQ77we8X94F3Pi4XipMV
X-Received: by 2002:a05:620a:130d:b0:949:5e26:e929 with SMTP id af79cd13be357-949ba99cd71mr2170105285a.33.1795461663478;
        Mon, 23 Nov 2026 11:21:03 -0800 (PST)
X-Received: by 2002:a05:620a:130d:b0:949:5e26:e929 with SMTP id af79cd13be357-949ba99cd71mr2170098285a.33.1795461662838;
        Mon, 23 Nov 2026 11:21:02 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm581572375e9.14.2026.11.23.11.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:21:02 -0800 (PST)
Date: Mon, 23 Nov 2026 21:21:01 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/4] clk: qcom: Enable MSM8917 GCC by default
Message-ID: <dou5fbqvtfze5rrnnr3sxphwo7llxzzgftswaluoubhasunkvi@3bjieh24ex4v>
References: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
 <20261123-qcom-kconfig-unify-v2-1-fe56c8fd15bf@oss.qualcomm.com>
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
In-Reply-To: <20261123-qcom-kconfig-unify-v2-1-fe56c8fd15bf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b049220 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=i7WGr1rN72OSpxvVzh8A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: VdaYP6VIYQ_QPOW768ejYLoBfsPLPCdN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX3hPQJBS7pBSa
 nr1EyyniDrCg9SZZgxW72poSWDXYsBY2JA81vyWSYfkUYVw3jHwacWvBxCzl2/LzaR3K0JBETU0
 FWJABvWuOz9JTQwIwzKtBidlLyac/cDDHwe0MBV1uP/5bdkwGTmL2DnCQG8ZqQ3ItgAkE6ZUcos
 lv5Xi+Q6bGFK/V48ELaTVuOO10xADSTgBX7aNayKrrB92nEJI3jkMZOGm5UvA3+KS4xrw77KNNm
 p3wn8oy8+FNmDKLpWXXAbL/XRcpeXCSmICM3xxvpAeqCJnycBBGmPvwt+0afxRNkityRt41ctbm
 tglVxPGXSNlJSZzDCB/6y6de81vdDM3i1bBYpWsHFp0ldBKv/0RGpuaUAQaxF40lLIM8Pug/8Ed
 I6H+2KS4VplvdXXlxwhtXzTdJSQ5Q+RB1IYNXUYDKerfBGy/3FsKEenImePD3RNCWAN6febncwH
 HOtrcTjpDsb7ROA2MUw==
X-Proofpoint-GUID: VdaYP6VIYQ_QPOW768ejYLoBfsPLPCdN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX7RDrdgNaTFZj
 7ljlRPaJz2vnMO4qnYo/6AZsFTQ3oznWZMqeU4FxYR+64RbT/ptVr5opW4vWZ5DmBG8ROAR3Rw0
 sySn/j25vXjiNoQYcLFsgJWJZzxW+wA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230077

On 26-11-23 08:38:11, Krzysztof Kozlowski wrote:
> MSM8917 is an in-tree supported SoC, so its critical clock controller
> driver should be enabled by default.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
