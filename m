Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619F142CAF2
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 11:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239081; cv=none; b=Dp9LNGDoFfojkd7KchB+Twh+wWWNaIEqFcQlZAz07DJ/2vRedb04vE8e/ngokisnvlSnjIfvFY/ytELe/bc2LQtH9ldx2HWPJKulLIyk2FWUrzJrSXHWqODwEdcRWw9sCnoHI8u4y6j3MIvX9Hef1OBeWt9fagr1IerZ5Q/BMVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239081; c=relaxed/simple;
	bh=c6Vqvc3Mc6dUZEOCGASd7IPojd6XeY3sxjbT0ZKnDR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MDADfuagAeT5KPd+WqtO1ruLIpepI69amqrgS7lWAx9XYmx1JjI7LEuIIBuS55Td1sNKhBNUiiNC0Ql/KWoVpd2vTmpvv7pHFCwS/9k9SUO5GZ8vFBt3SbdqQ60CEGaWsiAC8pWdeSjWBEZtL9nkXGrS1bfBVZPycflYiRNv7ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XoKn5Nq2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eiFi84+E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XoKn5Nq2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eiFi84+E"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHFAb3751335
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 11:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lmb7mLT6I+wUdBFIYH/lJzFOn0vXeKtWULk2K7WDTjQ=; b=XoKn5Nq2UwFWmGvi
	1+fg/dE/t/nkXYXNR7Nc+yVnIKhyQmQ/NM6M7SNdltr7/bRVF2/2cMU9VgDPEQs/
	NZyiN8t64y2I4IHcQVTnB3v92LlByKkOYptyp84DZoCgKBkZO6DJIRm14O0dEFwG
	3CYow3eQyXguL2Ilvh0+xN1tHdKZmwF7iybuYcgKxsWsYWdIy5GoS2FODBGMcCOt
	A3u7ckTbz0OCrHEx1MP6ncn0951yJgH7ApIbpykXkKU4G1iU/z3p/8KqH7sLRwDb
	B3y7b2gmRvQByixGMZZXJ+jZ5tkEzF9tRdSZ+tYa6be8i+k/XTBXiunBQ5cLMKSn
	5L8CkA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp5m39s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 11:44:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1eb52e1fso69759971cf.0
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 04:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785239079; x=1785843879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lmb7mLT6I+wUdBFIYH/lJzFOn0vXeKtWULk2K7WDTjQ=;
        b=eiFi84+Eo1PyOWIDuvWGC5pbj5Y9qOmZ+kZEVpoBDssGNDCf0NV2wfA0DVhgZjHETz
         vxLfnatU2XxV60YicZGbCF1O43OldypLtLOYsuQBs2bvd4/GBza6FJkoUhw8zZI30Y3j
         ggbJ+fqZ1AOaZ9GkUB/txwbkfRU9zqy1Ify/YCqG7mPwik32EbJaBoJLT+QumFes82L2
         /y9GuvGJc5wiuL4Zzwe/z5hBVHDPRgGha3rFVVo+9+BW8nblYd8nSZGQVJI7zTgCMUJ/
         yKd/r47Rfo6R7RwvdIUAVDE0OQsMYx7pzFf1NT1ke2OmQJPgfMfaYz9t2HdbOJ/ynKBS
         nihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785239079; x=1785843879;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lmb7mLT6I+wUdBFIYH/lJzFOn0vXeKtWULk2K7WDTjQ=;
        b=s9Q5Lj4CxeBG6/m45kHqxxAoyrLsATWOeG8yUwi842t6CHDGm1IpS+8vR6jWzzGdUG
         R842l2ssg/oCk5DpBo407O22oGkNK0iQfUaH895ZvCYp5kQmedqL+Ovgfqd+EgZCLXWU
         bMghOizzzsBcVFx0jKM9MDN3idIYTj4WclUrOwM1IkIijNVuPQGQ88UoC8qMHnq5/Sym
         6zpj8LyTg0wvVAjDNywFh/5zSf7IAC+JuyGmcIB2sFJJRN8mLf/A5QPR519cn7QFKz5N
         wi5IHNOZvl45Zp5u73Xynk2YScvXF0MyV+WS2OTXl3xwGB+yvg9b1ZrPB/od4PhcK60J
         +V6g==
X-Gm-Message-State: AOJu0YzXbd7WcomZUUSHGILmq5Hl74KIqm5OXRBjIRmyPfWpP6j0uug2
	XKafrPnFzksnX7nmkKIl8wfFhtG3QUQycTg6/6eHQXj4EGscZWXCwncESbu9VOLuFmaug+TS2hk
	DReUcNubQ1T69Z0oyTM2nhbfexhFuxIYxe7Rwxsg488PE2YUbE+AmBI+uwl2CVeA=
X-Gm-Gg: AR+sD13l1EgU7BjPnPA1HgXmGPYrJTTtCm474Kwor06Dhn9M3vENaTqJJ7/2n9Sjquw
	GrccJzrrzc3YynQL/t+aZUmRghycadBOIPb//5t5CkW4JR20EHgQUfNj3gYIe0SUuu+P828XqlI
	TbAwVMRXV9ak/BzOSRWVlPP89nEcOBlVGT9klbwwd+dgNzSqI8OsKpqt+fdEtHZH4RpDwUM7xKO
	lAckcDGLjZM6h3JZL+XZpIm5CR3KAe5HZT4bkQz891YdW+G6qIrRGJiqSGvjSpUsbKReBT/zx36
	OPvRA3ZrEjP/4e1x6cMbH0GpW9urXsS5d9w01B/7rKnpwNOtsb5vQtNDBg8lp15TkFPodfRC34V
	th4l/mJ5AWbXwL79bNld7u7GlhB4=
X-Received: by 2002:ac8:5dc7:0:b0:527:2b06:2bcd with SMTP id d75a77b69052e-529d7182312mr16401071cf.79.1785239078570;
        Tue, 28 Jul 2026 04:44:38 -0700 (PDT)
X-Received: by 2002:ac8:5dc7:0:b0:527:2b06:2bcd with SMTP id d75a77b69052e-529d7182312mr16400061cf.79.1785239077097;
        Tue, 28 Jul 2026 04:44:37 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c46160dfsm68407265e9.10.2026.07.28.04.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:44:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] clk: imx: Add audio PLL debugfs for K-divider control
Date: Tue, 28 Jul 2026 14:44:11 +0300
Message-ID: <178523892596.3206426.181670345541616200.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
References: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwMyBTYWx0ZWRfXw2nHs3lyoZHK
 gLeGWupHBw8S3YrBTJWVRMIJZFOG33JQK1S3F8suHe8YiJcl7lc8KFPMCx5V3HGZYvnmMe47KqZ
 VoIzt0n0nTvXFrYMeiDGXW40qn3oJco=
X-Authority-Analysis: v=2.4 cv=XuDK/1F9 c=1 sm=1 tr=0 ts=6a689627 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1NP200KD9VQfxfjUtC4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwMyBTYWx0ZWRfXwfRvoRd/Mbxa
 nQdDjfI7L7FWAhoCUW1iGK/adElYCy1vFAWBrwVA76/2Iy93/EivMMQypQYCmcRPR8vASLk6V7u
 +LX07PrXndttmpjL1Wl9kRHTw5Y8kpaapE196MAQwR/TH1WbcF4sLuKvy+cZYuiBfAnmAQ/tS7g
 btSVs9RWVaQQuZRmQt5weX+gBaq+F5xUAA7hxwwtHBOYtFJhbxNoYGa51iH4bY6hgBrYvaDtedt
 KGDOZpq+yqG1zoI7peLpz7jkQnRbuGvt2wJ0Qnr9Aht+U6VXilHNBy/dz2VKrvuMoX15Nzb6DUr
 oICNH6ReHnq06gluHT5rkvA1hGFvWwG6qATw13WXbYEvnK3tOfR7WodClW63lIroJZTrgpAqLIo
 otP7YGYi1shQjY5/RulXCilHo5W0WGN8nUoR69kXIbqO92FnZPKVcl30cAJwqT2ybxw9nEKhpzH
 oMWCKc+s9YAZ61jXAAg==
X-Proofpoint-ORIG-GUID: VOOTH1K5jst5HRxh0CwqQYi4Qy4Uzn4v
X-Proofpoint-GUID: VOOTH1K5jst5HRxh0CwqQYi4Qy4Uzn4v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280103


On Thu, 04 Jun 2026 21:48:01 +0800, Jacky Bai wrote:
> Add debugfs support for runtime tuning of the audio PLL K divider,
> which enables fine-grained frequency adjustments for audio PLL.
> This is used for:
>   - Audio clock calibration and testing
>   - Debugging audio synchronization issues
> 
> Two debug interfaces are exported to userspace:
>   - delta_k: It is used to adjust the K divider in PLL based on small
>     steps
>   - pll_parameter: It is used for get PLL's current M-divider,
>     P-divider, S-divider & K-divider setting in PLL register
> 
> [...]

Applied, thanks!

[1/1] clk: imx: Add audio PLL debugfs for K-divider control
      commit: 468238ced6c39dd4927392f16cedcde5f27cd0ef

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
