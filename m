Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E35C3F4DCE
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 09:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998700; cv=none; b=tOWJ4kMKJtmwIgl7VuluEx1fQB2b4hA9g13DLBs+gNH1k8i1BT/4BpHxhNNgOEPEtSZ1/3uYZtVp4iJ8hvYlnoz5qaDa3OkYYmn++b+ByVT9k1pChi53/+guioZ0PWLuZETsuxLzdaAuKcq2PYfjwH08HRL0mdXHd3+UuXz1OqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998700; c=relaxed/simple;
	bh=b5VhZRQ1H4enimio9Hvo/aY7mF3WXu++dkABtvifNiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hqk/o0e8imFAtnfluOMsJlEbx/tyr0VEP0oYd1M7aTsnSDyU5OiRQSlxb3r27dHCBgD1xFMZr3vqvlQRGU16ibHPhkFmHS5dkKJeYlMSNi54RYgdhzS3HndYfrRZvycapbPEmccoa157PvB5G6faPxzApEmqxDERnqX7X0uC/WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VM8EQ3op; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KdVwK2Qu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VM8EQ3op";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KdVwK2Qu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rfjv1958687
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 09:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/5igrIchRaX2k+2S5t3W5WH9OMGQcxOjMYuGe0pBpM=; b=VM8EQ3op3pxApUG6
	wAMAB64562Of2VAQXPl68sw19gvk4b+7z0KA2Je5YXo8u6xwQ95dmAApvDRTT9kp
	Dxl+sEinzYz7asITH9/KVJlzcRkmUbW7nTnAGzuIal+PGYa05VonWI6rfLq40xg2
	6VyroGw4Rq9k7uU4RJt0X65tmhebRXaDOvspUZsXUMFRNAnWm+llyj+uI4Viu76O
	uVB3FOB8xFSPukohQRO+NmgiDpFcOJdk2LH7v03IhAxIPy3baCSsMbJBZL7Bm66w
	yVjYcjurKhEk6cjAfmJi3wCVviIMpTBW1NL4V7+WtSMBH+in3HwdBSBL4GVBLKsW
	xA786w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds8w3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 09:51:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517647fbff1so18006231cf.2
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 02:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780998697; x=1781603497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/5igrIchRaX2k+2S5t3W5WH9OMGQcxOjMYuGe0pBpM=;
        b=KdVwK2Qu/kEjvP+YZry3vTO4Ew9h+wpMa5tgjYx2+8nPhwolFxZooCrCTnamOFEuCK
         7qjwj8ah89//LtHuYgPRrXuczFd/y5O8LD3gEpbJ4nQqnD5whKExcsSi1C+Dm3TRBKQl
         j44ihNyUE2je1keS4H+avM1eYDSEQ9DJkKsMFEWCQmgpm+Tv3lkk+dBIQCR8Xs7uk++6
         YTEGrUsdbXPWidz5HbhXlHO1r9eOaYA7QbbUsraRA/Fld0h1HFQiqvbiFInAnK4YJ6ua
         tv72NqbzTkwlhch/x8j1Qc+YnxVrsOrLcuNxPTjnJRAc1VNTVyyjqTIQLbqLFACMmVel
         bqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998697; x=1781603497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/5igrIchRaX2k+2S5t3W5WH9OMGQcxOjMYuGe0pBpM=;
        b=n6ErkbVNyqnAheUh9Fwi90g18xjCaHCxIE2RlSikrVTBCJDz5OkJCnjW9g/SeK0dwh
         bKMhx6uPnuG/7Xk93jRRLTXX0WxlYPIfKEFIGto0JMkPa3jkuv2u2QBUgbi4Zd5Ib8Tn
         NH/ko6F80QbhPJqJ9AIvu6vsi18Pu312hhvQxE8GFPmzmNRheEnezk4yDOE2AnYM09eI
         FMjDRB0+hsg0usb8QghVq2SaavP1gTxLER19942YXF+/SOHtNN8lc1rCJMq0M8p+GcB/
         8yh66zmfyTEFxgdKS7BLMcZStvokrM71TVVgz2LrgdwgIvYv8b00oWXucVYC3z0Dpjhe
         KtSg==
X-Forwarded-Encrypted: i=1; AFNElJ8NhE8d6pTcRClR6EI+kfFhJOuMUW2SaR7f0l3B0Bu5BUjkbzMoTd8AiJ6vKtGcoLVL13ixIihvobA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPO0QNnujf5gcIiR/j4X97NTkRpI9GiLOxdWefRte1zyrpsydx
	Vp8UyntBVuol28SaPQefTAr50M/gue3TO+UQj+GqsHdOm7MyLszQcZKs1BPezTh74dlY2vsO2sF
	qbwsRd5V0gHtWPATznp1xtm6Q0gU6uxMrrCiE+Kq8J7pw/ii3cw0hfc5jtnfyUmE=
X-Gm-Gg: Acq92OE7iVGvWY8sUd5NerZ2qYpTW9kLX9UNZ+zVhzhLAZao/WAfOJ0rRIS4/uarQNK
	p4Ij2LkzEIws51PrCNbYXnH/zdBgZXuGKmJa4snA/EbjLGXBeE2hwCabjPy4YAtG3W5G9sexpWO
	yMsrBDlSxJ/lAnsQ4vpS2Jl9eVjmVzNwCdnb9w8aZoatAxqDeGhGs1Xte9UC2IQ7Pgg01OL4pMS
	uNG7Rw9a+anvPEYp6s9RYWrL61g4TIIvNBX7Ls3W30Gn5Q692sulT843Jj5JApXW5F+OvoKKLF4
	uTpFTjvyIuWm+Z3b6LNhHoko2I6UizoqQ83puDuTGSDIWemlRtrTXtDrtRW/CjfLrvNgtjTvZ5K
	XIrREiKxaFXFt124HyJGpDrbaGYVQWM1Gt5cJyMmJWs0SnKfpfjoEQnfR
X-Received: by 2002:a05:622a:4c06:b0:517:5af6:77f9 with SMTP id d75a77b69052e-51795b3af28mr168054031cf.3.1780998697204;
        Tue, 09 Jun 2026 02:51:37 -0700 (PDT)
X-Received: by 2002:a05:622a:4c06:b0:517:5af6:77f9 with SMTP id d75a77b69052e-51795b3af28mr168053881cf.3.1780998696650;
        Tue, 09 Jun 2026 02:51:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f35c2sm1023106466b.61.2026.06.09.02.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:51:35 -0700 (PDT)
Message-ID: <1d26aa46-fa37-4969-aca4-aadde6ad9303@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:51:33 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: clk-pll: reject vote enable on orphan parent
To: Herman van Hazendonk <github.com@herrie.org>, sboyd@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602062927.467249-1-github.com@herrie.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602062927.467249-1-github.com@herrie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: in8f4NdvoD4URK11GBiWcolbXG4lsLSS
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27e229 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Yo3Wi9bsOxpmy9sskUYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: in8f4NdvoD4URK11GBiWcolbXG4lsLSS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MSBTYWx0ZWRfXww/WS3L/dLqQ
 BUBUTf/BjFR3JEqbk1ZV1+qBxVLGBd2yB1MNnLtc4spFnDEUcA7dpBJqD15dskl7JAWqC/rDQ6B
 wR2q83o9BkTYlZnzSJhL3q/X4DlLETRdyXby1qG5uUOLWlipy6fhe4SZRngtDWsO9lEUwn1w9Jo
 CEZ1EeMrzBAHrDC/H5M3XiLgF2jl4XHtDQHrdCJ3QPTM2lPODp8Mnl6zz0cH+MPUb9My9hQSNgH
 rYwBdiZhYtB7k+42hqr5ic9nXftFFvPaHZBrxh1H1pICJJprIQGlW1gAXjWyrXOrLzgLU/vFDe5
 UYvjIMQpVsVeYQ3fHlfNdrh55J8x7u/TJSSAjouch6wcrMXhfmm7aa6Xux7s6JiiF2Yrpm2oXTJ
 qOo3hb6hOpQOZZKk7TIj2F0To9IUjEdQzjMaW1Rggd3zHVXiKHV3AhflP1A/PvKyYZrh6QXNn90
 U1VZ0g0NBmCNE7uVWaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090091

On 6/2/26 8:29 AM, Herman van Hazendonk wrote:
> clk_pll_vote_enable() unconditionally feeds the result of
> clk_hw_get_parent(hw) through to_clk_pll() and on to wait_for_pll().
> The common clock framework permits clk_enable() on an orphan clock
> (supplier not bound yet), in which case clk_hw_get_parent() returns
> NULL. to_clk_pll(NULL) then yields container_of(NULL, struct clk_pll,
> clkr) -- a non-NULL bogus pointer pointing into the negative offset
> of struct clk_pll.
> 
> wait_for_pll() reaches for the parent's name via
> clk_hw_get_name(&pll->clkr.hw). Because clkr sits at a fixed offset
> inside struct clk_pll, &pll->clkr.hw cancels the to_clk_pll offset
> exactly back to NULL and clk_hw_get_name() then dereferences
> core->name on a NULL clk_hw, panicking the kernel.
> 
> This is reachable today: gcc-msm8960.c and gcc-apq8064.c register a
> pll4_vote whose parent (pll4) lives in lcc-msm8960.c, and the future
> gcc-msm8660 pll4_vote does the same. If anything calls clk_enable()
> on pll4_vote between gcc probe and the LCC clock controller binding,
> the system panics. The exposure widens as more SoCs adopt the same
> cross-controller voter pattern.

Hm, I think this is a side-effect of the olden global clock by-name
lookup (i.e. parent_data.name). Nowadays this shouldn't be much of
an issue because of fw_devlink ensuring correct ordering.

There is already a reference in the dts, since about 2022:

80787e417f30 ("ARM: dts: qcom: msm8960: add clocks to the GCC device node")

Are there any other cross-dependencies between GCC and LCC?

Anyway, for this patch:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
