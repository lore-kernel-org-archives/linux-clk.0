Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625212;
	b=BaO2vN8oFIscwlCeg8AMUW3eWO+CmKLQYg9RAMzqumIwhSqBdBTi/iNSo/nXt1CsttJi
	 U/T6oaYJTk8ZTJ8JatnX2cF/gajUXXBqKfyjy23kd9rya42FR+9eUJPmZo18Hdc6R6EkC
	 vSL4xaevZPIKwWgXIN6xkQJCbze9nIBGUvINrBgo6XpYAxlN5RGOJlkMlT5HnGnCgIGT/
	 qO3vl0AZlJfMi1d2BjI5nZXzWKepeA7/XpbEmJS7ACRcpHEgCa0LaZp75YdF+1G2wpCTM
	 Pmw7YCo/pYVrWqK0Hg+T0LXyoUYOos9tfBJ0hjtUcsxUlGRPNNXh/ox8TZHpn/sZTQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625212;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wp+lhaUnMTSGPW1szcEhAQq0bMP12m/9abUxOwHRyG4=;
	b=FwXER+/h6uaRXG4ehnKuXg+jexO0kQcPoTVe/rmJ6gFU6P2GNKrbOxrEySoQI6GT+37G
	 VhbrgH6WYriB0Vt0pBAHcZWYwfgI0JalEiSj6pLBQE8P6mMGEmiuxfkBSqzjJFVqP8/Xa
	 sM1/EHB2TeNOZrEEelf2PTpWPt4xwckSV5Nswz4gRZXXbmLsiTx7Eer3zYXha82VzzR3I
	 gxIermIpdJEmd6m/XViYV5T6HifyX0H2t27ythaIVDc+3+j3pvR2cp/X2P0RHMBxSrf9W
	 trT5MfAnOERZWj9/HX7+zh2slfLksOFMJ2x7A9+A/VAovdwC8jVxuoDTxIGduvdP+WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I3RD+cyc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4oz5r7H;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5A1606A327
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 13:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC5A1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I3RD+cyc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4oz5r7H
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAYxV3974072
	for <linux-clk@vger.kernel.org>; Mon, 2 Nov 2026 13:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wp+lhaUnMTSGPW1szcEhAQq0
	bMP12m/9abUxOwHRyG4=; b=I3RD+cycL3qy/LFE+BsqgbT71D/EuBIQn1kBU/nM
	X5Tk5DvC98AtPQckTevOlH8myLqVvwrzyhOkF7CYj+tVGct3U21o4QDsZjDrLiu0
	CU5mwSjfHwPgs8VndJZHVfJAhbK4f8L9Xntv6oN3l93WuXXYer66qJDZs2K5uSS0
	IaQ8BlrYKXHhOCzQ8OLIVMbl3f9/Brsp+FYnkgUQaFz3m5IldySuJcugIICeR2aT
	ysT13DZDdhxyWOvDt6vd6gR14ye1ptZsTf67VM7S+tWCqEY7hg6O8c8hiDX3KmMg
	VD+Zen/BnI8yqqWecEochHcNucnKjDYTe0MkDFqCY/Utlw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmesdsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 13:13:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c10b8abe29so2438054137.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 05:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625209; x=1794230009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wp+lhaUnMTSGPW1szcEhAQq0bMP12m/9abUxOwHRyG4=;
        b=D4oz5r7H1iEBqmXjwmB83YBWfm6dl/7ovO7D7BUGZUSxA5jwmVDEtjNESZheUwL7cM
         mY33xsUyGkm/2ohlkxsaiboBYBkJQba6rsMJ2I8lmiBDWrZk0dPCm28Esq28RNjpew37
         vVoFKhnDKGgJtw7gqbB3pCNpFB8FbCmpffE9WSGiJGiGRVqPIxTvHXNJNA8XGtq/eB0q
         BI3IxsCdRbeM9GgcrYrS3liu8ag/XfQ9TsqF5AR0mpEwPAw5KMw3LIBmhW+W0bHwvuHu
         BSeGtBHaXLj+vjSFpsMYnOWv4JoHgUlHC3aw4ZkB9Xi77j47ulWXu6j7pQfJnJPPS/Tz
         rgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625209; x=1794230009;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wp+lhaUnMTSGPW1szcEhAQq0bMP12m/9abUxOwHRyG4=;
        b=YDQfTPRgqiyrmnYPBrFN4Lydd+emDKDvrvwa+GK2hL3ieBbBcSSQXrwckRNGZzrhDD
         QfadulFwYo0ZWmSJpCpr+7DQ0m0zhcVoZ404Rqsc9+hU2jTwJv8vVlbTFohKwkWHn8am
         H+OOD2u31hIDeqPnILblN2IU1ijF2Qgi2tJDOEuTwC3ssd3+4tAN/zC0H7NXzhApxeqZ
         15DpjY1B/b/JRxmAUEBwwVPXjezQR0BYKWpv+KAtVoAUZlkXY8uVXpz+qQcW6Bx2gGGY
         F+0LU7AubXfSus4C6frtfeWRIhD20U2SowPXfn6W/uY21VzBQF8C6oFArg2XR4w5Z//r
         Ecbg==
X-Forwarded-Encrypted: i=1; AKwUvBzpZwhA8ACMcR0NREfgLXG6sQNKZSkXCUJy4QYkGt981EQyBzmzRykUQwbnbHeD5GIqS63CY4GLXKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YslYgkJLx9fxlbxMXjZqry5bpd/fSK61Xry+0sqkZRxIJUulY
	ItRGrodPEzmpqvvEqzZzh/q1iE21Zc2N6reZwlXQ0y7cIwR78+u3WpUtPMVFGMtA6WkvVhnNK3L
	LYdS5kYQqIZ5K6PFLLuIF0gX3qhMrBnWhWuteQskM9UnpGZi+5cEX5X92Wase0skzcGDb+Xxa5w
	==
X-Gm-Gg: AYBFou3VkQYlKa72Oms6OcPfuGXHCHMlZ/wxHO946CInXniJWuJHD80FeGbf3CeE5ca
	H89yGTO7DLsExLBWuwE7i8L2s0vwJPg0WrWMEAj/o+sz/lEj8Mdi028pZdPe1GDhVdF7M9XEfnc
	DRkuSnixOx+WHQOwabYPQg5dtmwrufhfVtpwGMgCpf3iXixo+mrRkLa8xj9j56xrK1hNy8dgX42
	kxRYozDrKrHmbIZRxXHNf8cPKRQSez+hwufXVDLBXe4i/lTiFEWGjfUXcgSrYay1hfyJDh+orrX
	esRt4SvCWOxhe7UHQ+iprZo65MKN7s9zW83n49AvqkI4IVb4p0pXohW6QQU0zRLJi4SbcaDJRIw
	Pl2BpKpwpefq0jBx8s9fN+bsPCBwJihS1PP0tYzmNv15nrh3l
X-Received: by 2002:a05:6102:e10:b0:7cc:26e4:193e with SMTP id ada2fe7eead31-7d07274b90amr4160971137.29.1793625208758;
        Mon, 02 Nov 2026 05:13:28 -0800 (PST)
X-Received: by 2002:a05:6102:e10:b0:7cc:26e4:193e with SMTP id ada2fe7eead31-7d07274b90amr4160950137.29.1793625208162;
        Mon, 02 Nov 2026 05:13:28 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a6bsm19665390f8f.27.2026.11.02.05.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:13:27 -0800 (PST)
Date: Mon, 2 Nov 2026 15:13:25 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-glymur: Use PWRSTS_RET_ON flag for USB
 GDSCs
Message-ID: <udepf5n4d4by4b7nqlbvybmyszyoks2xeppgx4xlfbkpclifoy@xocxifqsthfp>
References: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
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
In-Reply-To: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae88c79 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8GfOtjjHQN1rPwiWMjMA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX5VaSMpTCZ8Rc
 I2T6RYDm21JOUxNSYV2ULZrRCbG+ypyJFvgIBZ/p9UxI0g94XhUkJfqPgTR5MHyvNPtqGjxQKCf
 eJNC9Yi+JZVDtQrMejxALh0cHlo7QJI5F4LWBSTIXCczRbboPPF79mvwtFcBo2sRKQof24UAN5Q
 iTP13uox444llzR7DbmmSew5Ws2P3fDmYTYfzGdJjOJ5Sjlr9bw9SKze4sdmgr6qHSzc8yZRKsI
 GWMVEyNfROyXIjLFdFr/AeOl8O9nZLfIxJJsV8i+4SAjs57kPtlWCz0WXwAwgqI416/23dw6G6V
 v7QTIisUGLDfw1xR4VDyqS2xmgF370iBSgQTYX8qaUIo+Qsx8nOCEI9A/pT7VmyPQwjlPN/H3Vx
 O9Bj+tD/V69Gp4BVSne2mvJW+2iavuXC3Fuv78F9DgyZl40tzNjDOo00reuRTEYV9tukixCrrQA
 7DPlY/DvixMh7KR9oIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX7qw9SfGoNBjT
 Uvhh/I/3zXVf/BnTUHnRNeqtOMcGo8ZjkxjkfdPrYl7YKkzzxZ88S5PxeM5Nn5f4MalP1gPNVQs
 oniFypOIW/RQHGfjEN0JZW5lTm40FQs=
X-Proofpoint-ORIG-GUID: TbEpnqIxkaHV9PFzX-1Mnrerqk_io7f1
X-Proofpoint-GUID: TbEpnqIxkaHV9PFzX-1Mnrerqk_io7f1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020052

On 26-10-16 11:58:44, Jagadeesh Kona wrote:
> The USB GDSCs on Glymur are currently configured with PWRSTS_OFF_ON,
> which allows the GDSC framework to fully collapse these power domains
> during gdsc_disable(). When these GDSCs collapse, the corresponding USB
> configurations are not retained in USB host mode use-cases and this breaks
> the resume of USB controller from suspend.
> 
> To avoid this, configure the USB GDSC power states to PWRSTS_RET_ON. This
> prevents the GDSC from powering off during gdsc_disable(), and allows
> hardware to retain the USB configurations across USB host mode use-cases.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
