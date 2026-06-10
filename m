Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB512403AF6
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099418; cv=none; b=mf1KAPDTp3BvMm/dpVDF8KrS4vHtOf0kf3ub0jQYy47ImCSTZxrDQKFcYAFZDDBmicLi7q+sxwMEQCuJZoe4qxihZB0xHIph3n4tb3S4KYArTkU1EjBbiQ52iXO5t0Eo+9HGmVFvFGrm+4K5iG9rOFOpWYDqdUzN5JKehoynTz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099418; c=relaxed/simple;
	bh=m1tGw26woFdfkPZTDBW7hW0NfQPofXVFfIcHxqyVtMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQCOUYgRy8eACSloj726DDlX9zZVQrabgAgQ5R10tRcQt7TlBF+hkgM0wOCT3cwDGAvZqy/wZ3/0lnqnOxrR8SCnKkv50/jaYg9DKE/rqOfmmE9FYTwDPKrtbSl8t6KmQYrPpAh+DcBlKJ1WfY4Gd+euRGTAedm/dbZlhCMhf78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+vkeQnV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frQrIuke; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+vkeQnV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frQrIuke"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBjI61169451
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O9+j/9QqiibbtkTIvcjHm7NyyCtGmfMJomJooe7wuxU=; b=G+vkeQnVe72weTGC
	g7FgPBXZmLHvDIHws+NRZL1bMFAxxNJx6hnT80CtXCqVoXm/mtgLCLOzBojyBKZ5
	PANR7VltJ3lV8Z3VuB3IFWP8Ultnm3YueekmfkZ4Yhy49tdOIAR/48kEqnDlXjry
	+Cb0uMDy5AEDvCi6aEow9zUlKlEHEEB5P0iiG89yPCEEBUz5ARLOrEOi9SVazPzA
	S9xHLwPLlX6H02ggqgnEBh2nXUPy+k+EG0RcCB/OMVCEyKVykfr27IsbC31p8hfX
	W18Ig7oucRR9KKfgQdmCmLJdiNULD/QoafouERXUIUJ2eZNSGKi0IQhjVShKr2W6
	uUL/dQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1s2ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:50:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517796be724so13736471cf.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 06:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099416; x=1781704216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O9+j/9QqiibbtkTIvcjHm7NyyCtGmfMJomJooe7wuxU=;
        b=frQrIukeYuNpY5SHEL0zo5WG+T4+zo28s7wNY5ZIWVL5o3+U6tXwFQEfMvMSgGjNQC
         sHuf8wAMV6FAWatrLTb1u8Z0cFDqR5c0vAVJQC7GntmIO7ZJ/WZJoPznCn4RVfajXsQx
         iUvkhh0riBYFaXIxH0oYv6tzJq2xerEeTdXgvQGQ9p5XhUHV9a1Ghfv4CvA03TSUo5RC
         imNL49moBUuTLXHEs9IobBxQd8fw0VPaumVnjIYteecRvRZlJoQVKdRfiFPbIWlYFHVn
         FQ/aflQxOpHa2+3Dpmqpm4jCrwRMeX8iusMsr3AOIJQuw6FnpGKAySbiNrIlshu2Kthg
         Lsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099416; x=1781704216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9+j/9QqiibbtkTIvcjHm7NyyCtGmfMJomJooe7wuxU=;
        b=mpPFS487ZKKSUeHSR05VSElvZWkaBcgfdikRWqMCXGaCMmOyGIbxYkd9y1xzfiB33a
         fYYyRxGTQsgAjPSjy3wpYygAbwYiqM2PZpCdDkyFL24TbQhCzL2HEOxH6kHtffYkr+N3
         QFEqaY1NKX/IssJaXuikccDwF12JzdDA/6yKiYGaZHD7Y6R+bhJudOdKjXrj+7pnM8cV
         A9cCYxeOBPY78xGSzR2pCjqH9h0T3Jp50IrONmVwGW41RX2gxNJLbpdUio8Ee49GQWRu
         MbT7F2cERFN9d31zH4eJmp8FaakMRGtTDX+TBuSXEowTkbcg1WKgfB0+1+3oBK0v2A7i
         yNRQ==
X-Forwarded-Encrypted: i=1; AFNElJ9E7wzSgm3yACmBeAAbMIfIgL7tvT8yGFoOJ1SNkMFyI3nCNS00Z+T+e5ax1grpQTs458+oEVlicIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFq5+CkKA6zpy/o9/Py2XvsZx6yg+UqjPvDohMn2H4fo2FjbAA
	HbWnB3q9UdgFyzNVSswu+DaLBaEw2JyvuAG6H7fsjCEFuYrBIoGnKHGI/4h+rlCTweiAo4F9ZXD
	swZ2Tg7Did/6UwdLHEbAQtozEFVYtZS2af7GRWNMHN18whNdSqcdviOjXoQG/P+k=
X-Gm-Gg: Acq92OFL2N2F277rcgtktOxrNdA4RTNxs8aCT95RHp9ETErdfTAEOqdVy7CvdygPQQe
	P4NWrY199tI9766NUlYeWd0JCz4fv5C+VKqkVsUtSzm87h3c4h4LPkkUMsXhjQw+rGmJ55+oYvA
	x44N4DCUckFjUsn6HNCKrjOaUPwvFXDkUgLMQzYNORXL/RnwbxRUoOrm+KJuNF3fFyvRpniXXV3
	a6ysf+gQUhUbbAGvtv+hkTI62u6aii8VsJSZKzmHbfa0UhCl0VzhuZhaL2V37EEAbD39J5eAo+U
	9S/E3+QTLl0lGCWBZd7bc72Hz6sDajPLsaFJ0+n6yCpwCnhpzWqTLPSc7ndosIBNu4+gjTN9iQj
	1yeobnS73RrfrsKNbbeshwq6EcyiucjFLGDU2ViSYeNmexSd4GvMtYZqJ
X-Received: by 2002:ac8:5f50:0:b0:50b:5286:f757 with SMTP id d75a77b69052e-51795c1b7ffmr228447651cf.4.1781099415783;
        Wed, 10 Jun 2026 06:50:15 -0700 (PDT)
X-Received: by 2002:ac8:5f50:0:b0:50b:5286:f757 with SMTP id d75a77b69052e-51795c1b7ffmr228447151cf.4.1781099415315;
        Wed, 10 Jun 2026 06:50:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055303fc6sm1205291566b.42.2026.06.10.06.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:50:14 -0700 (PDT)
Message-ID: <f55526ad-ecd2-47b2-8b8f-5aec429bc1c0@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:50:11 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] clk: qcom: gcc-mdm9607: Drop incorrect
 apss_tcu_clk_src
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-7-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-7-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: voJh0c_3yRkOc-0x4b9kPtEFg_XJdzFD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMiBTYWx0ZWRfX3MGbWB2JMrH1
 AZEyiiFM50ie8PxCsV+8nyfltvQAREVYSMbzAcPl3Cz5h8Xi7u0q630+zqBPL26GnIBv/pEFg6t
 +WfmZP81oH1itCJjDayNvks0TZgGQJX2jh7vRTGagfaBv7vQhjaZMlredgT+YhPS/8AFIBvpGrM
 gPrM56WIJF/Q99uWgUhx6cJ//lNyoirI5QSKn23s4379CsBjqACy9YpLeJLxS3PmqPzTuWd67tD
 PY/RR8WMIBFfyRNHPl0q2bf6bjYBuUpRts5pRMVIuIWSn6DgK7CAwwDqsXlvC5+oAChlGdVPNap
 cQxtLCekldccXqqnxKJtj06+sG29MglKhbHTCzoc6u1SW5HY5x9OQs+PyHJmWkBFEB5Xn3lSi/a
 feyJKgq99xM9JL8lL0NeQaWsiI7uP+Nt7azW7Lmc7fyqOWeHTEuQvKH8o00h/h2dA9UmAORx5oj
 3TUcvdviFRKd2azOQOw==
X-Proofpoint-GUID: voJh0c_3yRkOc-0x4b9kPtEFg_XJdzFD
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a296b98 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=j8Cu_9a8AAAA:8 a=VwQbUJbxAAAA:8 a=Et88DFpTZsi3nXjlyzQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=A2jcf3dkIZPIRbEE90CI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100132

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> From: Stephan Gerhold <stephan@gerhold.net>
> 
> This clock does not seem to exist on MDM9607. Reading/writing the registers
> always results in 0 or crashes. The math in the frequency table is also
> broken. GPLL2 on MDM9607 runs at 480 MHz, so:
> 
>  - F(155000000, P_GPLL2, 6, 0, 0), // 480 MHz/6 = 80 MHz, not 155 MHz
>  - F(310000000, P_GPLL2, 3, 0, 0), // 480 MHz/3 = 160 MHz, not 310 MHz
> 
> Presumably, this definition was mistakenly copied as-is from gcc-msm8916
> (which uses 930 MHz for GPLL2). There are no branch consumers of this root
> clock inside gcc-mdm9607 (notably, gcc_apss_tcu_clk has bimc_ddr_clk_src as
> parent instead of this clock), so we can just drop it.
> 
> Cc: stable@vger.kernel.org
> Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---

It does, CMD_RCGR @ 0x37000

Interestingly, there's also an SMMU instance.. although downstream doesn't
seem bothered with it

Konrad
