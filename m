Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86642773F0
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 14:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634411; cv=none; b=OjDBzheMna5lrqna3NoRfnKsGWliQD4MjuivIxlKazlW/z9HKCmJ2weVjGz+H8HdCSOcSfVPIAeYjg9CMNLCtIgkAbkzDADm+GnobHCMrM4DETEMWsyUazgv6S2yE45yHt4WVOwtZibuuL6zfkH7pieAWBcvVz2yP1tHcKwmtFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634411; c=relaxed/simple;
	bh=To2wc+0/A42ocK8hpbfhR0x15kOpCy/gPUDRdGPgZLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwyEJHbi73sDCeby3/srpyk0oxh0P5jKXbJCrZnhAjQU9kLaA3mhE8G+trxjwaBdBdntOaLozOYNdzi0TLOtQKzCMpiLwOwt7YNBVg6A1PhXODnGkR/jPe8nFK7+BMr99DHPJSq6NDwTqL0QSTzLop5RKib/VajuVH9egZqLNXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBrizdpC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PA+/Z9p/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBrizdpC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PA+/Z9p/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624ChJao2861376
	for <linux-clk@vger.kernel.org>; Wed, 4 Mar 2026 14:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+M1phruyaNQyYOXJJUwrTZI1CDqhXvJ81qaPlJepRk=; b=IBrizdpCzskltSf1
	6ItCT7/yxMTYSD1Hyr4eD4nWBnOHAYjvmj26RoCL8hfhok89Iz9sUHxWSLGO+65r
	NEWiRi+vX0TP0Ys3wV+9Yc5Nolk3wE2Rb52Kmcja2LBHOD8g8cVGOQMs+/Ek+82v
	nyXsBALz5823fBz1875rSGVhbuJjSN6Vz/pC0nZZ8I71MhnIpBHIKhwBOJsZYpal
	Y7IqVOQQow0unuFh0LpcJklv7IQEPK2QOP7tGzeqWxAqzxr+SVaflDHTo8qIzh0A
	+IO6BPOer1BUiUkVkq1yagHeRWhX/cUdg4Z6UkVFeAOqq/3IL80RTk3nSJmnNT39
	VAdIag==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9m6bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 14:26:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70e610242so1090062485a.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 06:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772634407; x=1773239207; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g+M1phruyaNQyYOXJJUwrTZI1CDqhXvJ81qaPlJepRk=;
        b=PA+/Z9p/DSdYePTPryB/Vw18Hv/+XhQXMq7anE2f+/0onT5/r7DD4IceLox6J4yVqo
         HqIwyed+mq5r4A6Ctx/FrhDHq9gxb8VIuktw3onndv/iH/ihjTsy89b/OSxDNDY2TWZB
         oX3ZiwNFJZZFX96ZoLrPzIymFiQ6KPqzW6SFg+fEENX05E0q1JnFr61M5W2zzxMnqgbp
         SUHLKhWCd4Izy+pl//8aPdDd9Xh7WtxZgXEpNPoySzX4BBZEeyfW0lwCd9c3I5lXYT4H
         8rXCdJh+a1W4cb7IqXsVb5/Ma0I6mHhyB+xjU2ohRkxHctYtIY6wAXMu7R0WnqO5VdJt
         Y/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772634407; x=1773239207;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+M1phruyaNQyYOXJJUwrTZI1CDqhXvJ81qaPlJepRk=;
        b=D3+bm9QRy+JjrhhlLEjRqqfF8P2ZroedTIa5aQ5EhnwtPP+ye6j56uppPoTw5HW4Q/
         6Ta9NlcdIyBgvcE+VhZ94sL9ElwJfSKNRdCa16qRfxpVvGVGdGBF8kWdSXHfhj/TZ4tD
         IHswDW07IPmDnf7pY+cyaajoxAw+GlJmw2AGWMZAdahKMMEKoX3mVxxVO2ZX2bFzZCjY
         sgjscBx/BUVrKZoKjwAs0NmgSCowp51GV3WS0NVeyxBb+yx+OKDb+SCSlcAj2HDigr42
         BMdN8iDeR46/jdNotIVEBGupE81nnb/r7zf+aIOItEGx1LtFBATJgXc7Im/5imIbSHlL
         VlZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKOHyNfEu+C9/3glNWwQMR6mEtfRCYw3f963KwqvPVJJvj3+Zr97TI+4TZbIJIDJpTJ5iyvNgN2kw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRedxPdvOHRfwCtl021lZyz3G6+c9HJJBDOlFGV/GSfSZO1WDG
	gxQpeEwlCEH7ccf8DQ5w7FwERUwzj70Skxg/u1IqIlekkI4sGcmVkMq2hmZ9of7YiCo7QHRztU8
	NGx+a8L3q+tITdP3SLQ9puxdEJSHF7q/gc3glllegv8eIeJN/+BiwquI9Ia2lQVUMHdblTOs=
X-Gm-Gg: ATEYQzykRVIRwjcVAMCOWpNx52Dv/HEu1BYpUrfCe6s/bUqkfhtt4uCkCBgdmnNcrUE
	/+gwf61H3JxwjC8meko4U8olWPZX/LXGO3rpWLDEblmCdCuHoSRt5LN5pClbvahJQXvVhK4gKli
	S63uBkidNkYR9ML9Bceg/ZvfyQ5Z1vZBVML9MizE/91rrR+eX5gw8eJZU4UbZ/y2IQl2RA2EzjL
	eu+7gATWSZYXc7NZ/r812gHxu3RzkWZ8LMhP6oA4dV/6yw6IlXjhkoCrg9tTinC/g5PY8hBNxuC
	TcYgLRTY1dCLj66UKWGJ6MZuP8cdYLXXqLE0T3/kxLPnx//r1M3i8fgIxYPtanCSSyQJRaAKRHn
	mAsLr4CxkyF0T213hBXN8NAQJ0F5OZcmLwxrwaJI2h95qYdVAAyCBESaEIr0utDlachDoe8wdRG
	txGRgvicUxeEuydxPANVlipM4r3u4JywW0I2s=
X-Received: by 2002:a05:620a:4156:b0:8c6:a213:8fe0 with SMTP id af79cd13be357-8cd5af0bf8cmr260541085a.23.1772634407515;
        Wed, 04 Mar 2026 06:26:47 -0800 (PST)
X-Received: by 2002:a05:620a:4156:b0:8c6:a213:8fe0 with SMTP id af79cd13be357-8cd5af0bf8cmr260534785a.23.1772634406944;
        Wed, 04 Mar 2026 06:26:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f3021eebsm36368621fa.39.2026.03.04.06.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:26:46 -0800 (PST)
Date: Wed, 4 Mar 2026 16:26:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/5] clk: qcom: dispcc-glymur: Fix DSI byte clock rate
 setting
Message-ID: <okmaag5algd7v3i2qsei6zkezb2bx5aogrngtcw5564aajtj5g@thpxcx2fjuyk>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
 <20260304-topic-dsi_byte_fixup-v1-1-b79b29f83176@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-1-b79b29f83176@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExNiBTYWx0ZWRfXzuix46yPx7pW
 3XDaPiF9yceRS6hYIWgy61HRZlU/mbV1c85MfF+glcIL9LBzsiGSlZdT7BiX7xsZbVuDTtzF2MH
 vqwJNQHK5OZdOLNcZE1M6hL7DS2l+gaceiAZgFHKXsus73MHLVPUzV/BSctlpxlFv8DKeiB5VGN
 ml4maoLzOUEpfVVJkEAiSEoyo3/KBZse1uYexA/joJ2l3tER5YwWbP3Y40MahXd8FtWjYi+06Kb
 ITvas0L1tj2i14SSTn+CjfLkS4FQT4KDXKVTvSZPumi2ti+MgM3V9WkmjPb2hDaBvt9qZuCacyJ
 JLcH92+UdyreAItd5P/VC6b2UeW4dJalhUFZwkDyOarI/6MJtvEXoDdm1QYBwaV3LvEPI5yVWBc
 TrEnh123WlD729SUTgYes2uPrnEfp7bS55zllkvNsaSFA5MWPoMvAOkXjUe2QU1R/u9B98xse79
 BBI8Vf0d5XPqJt7jhiQ==
X-Proofpoint-ORIG-GUID: iq4afJ3qT_7YZ5EJh1xIm3JhwhnQCg9O
X-Proofpoint-GUID: iq4afJ3qT_7YZ5EJh1xIm3JhwhnQCg9O
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a84128 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=P6JgDz5pW-ke-mV79CEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040116

On Wed, Mar 04, 2026 at 02:48:27PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The clock tree for byte_clk_src is as follows:
> 
>    ┌──────byte0_clk_src─────┐
>    │                        │
> byte0_clk            byte0_div_clk_src
>                             │
>                      byte0_intf_clk
> 
> If both of its direct children have CLK_SET_RATE_PARENT with different
> requests, byte0_clk_src (and its parent) will be reconfigured. In this
> case, byte0_intf should strictly follow the rate of byte0_clk (with
> some adjustments based on PHY mode).
> 
> Remove CLK_SET_RATE_PARENT from byte0_div_clk_src to avoid this issue.
> 
> Fixes: b4d15211c408 ("clk: qcom: dispcc-glymur: Add support for Display Clock Controller")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-glymur.c | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
