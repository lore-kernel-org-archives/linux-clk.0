Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96483F54A0
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 10:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888191; cv=none; b=HZ/E66Pw3XAKIAWTzpf2uvhnEmhjp+Jn3GsttMBzAafiitu5B0TG8fZbmIgjePtDbmyHvxqO+gWDrNZ2QuV1G+i5XASY0uF+TU+S6XtGbGVbpLsYL5oeoyxY6A/QXzKz0IGHrbgfLy34T+DtA59dk6uqsKWukVx8crcRgDhvG+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888191; c=relaxed/simple;
	bh=np6bjerOYn1Zyw8+TrjpZHV++1EzsIEKSOeSr92z3XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BfIIUSjkoV9Azf5U3W70qOTAKASnxFC47fLI8jme2JOdBkUyHlf7eKuHyy/1ZVKFk9cAAaowkJcCxiVBh0khe3fHEvfvKrTGmGqREdDy9ZuBzOL1KbBgyZDOkkqgq5EYEbuVIJu8pQ6sCuF0/8BPduij2//JngYu6EN/REWIUvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O7On7kp2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VeuPKZzs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7On7kp2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VeuPKZzs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8RZpU3907366
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 10:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MXZwRO4BDFJqGb2cbS7wiYcy
	bGxVIUNkZePoqU20lgw=; b=O7On7kp2ZExeU1gfqcV1UOmjCub8po7o0HkFjvcD
	OPA2R1jbOvAdyzk3FbyeY7XGG1Ot8Ra/eKn+cwRwKb+cNd+ScwQhpoUQ/x57gbzP
	M8MVi8NG0Bc7NsEZcXP+VPnsTCbNjFGraKWOy0MsQQJ4Ad3ASPuLmnc/4dRru/eN
	nq1i38D8oNQ1i4l7BtYBbqeIqxv+i/8VeH88Jn/O+Xy0t5NpFIFjT2aioDVfg3Lb
	xqFTBgjuKVhd0JRemyD2MWi+PiD3mgwzw3YGRsPIPvxREw4LO3MT1xE88CATApMk
	mpiMr5lY+THIWYw19GEWosyOTgvsQDR969C8xY9GBMHbqA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqu44b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 10:43:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b8306ba68so39425106d6.2
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 03:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791888188; x=1792492988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MXZwRO4BDFJqGb2cbS7wiYcybGxVIUNkZePoqU20lgw=;
        b=VeuPKZzsu+dV65n5YQr9XtKp7Iu1wArQY9aHTX5ZwTowIAu8rSStoZLr9/bGhghVWh
         lQpCdTKiR4s19Ge7NOg3i2ryyYaJbpsEQOCS6jpOBOtfz9n6XilqyBAwQD3XfbLLtwCH
         rcBRrSLLmmPKDq0disHSUzzxQI9oYo5Uxfea54BUzCu0ckAkGBneSBe7oewRd4Z2SdyS
         RvjGFm82c4n872QLjD+oyd5+Z8a355AmOtlhCEnbLoI82wi2AfgpZewzQsE9DTPBJqnh
         8Uly16KkrrNGP4hC4ogMpgiF1AGXco3a12rzHWd4pZNICo6JUyvdAwNBuCiyAwBy5SMW
         ZKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888188; x=1792492988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXZwRO4BDFJqGb2cbS7wiYcybGxVIUNkZePoqU20lgw=;
        b=CULoUbpIajEqoXIXGhKL3Zlzo8p8fnMt7HEl2k6s1PaYr7+ZL3zX9kNoONZrNGeHiG
         X0EtLal+SkPhePw4N0Hj7k8qOmjyO0CYXc2eJahYdcJNOjqTH3gLgUJu//sfpzGXBTdE
         spie5qBgE+qEQojSRW8alQt2LQUoWlJ9VLiaP8HUEtC/S9p5Zl/c+K0vufrj+BElMdbK
         muXi346ws8Pg+kyES2cd9BmYrt+MmC+2kr9TeEEtWuECyxrYboXKs+Dhf3NlaPhTCpmJ
         EHRaznRLAWTiIpGJi5JbOBEf0hxPDvkOdLNj8PIL4XqKZMYaKwe2d+OUru9LRmsR3JaK
         pyBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVAaWrxu3VSoGYiD+P487csTLIfBsVYt78MY6bJAiakQgQnA7bxTMaZygfr/Vsl22i8wPGa6984/0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoLGYx2u8kwLuThgeHe0oCWq0AMf3jaLdNC41puO8px3uvQb9r
	dzTluO50S4+mT8YmOYMpXfjNPQn/QBGbmoJxaw1hVY981aXrzmoNneJ+tSnbajYYtxoJJ0kY4Q/
	6Lw3XcEFcGWC2k8Vi0BRwiOXm9CNTUcAo3kAA8DpnQJSAVkpHkRCix/agqvzLitrqBkB5E50=
X-Gm-Gg: AYBFou04jOlyV/YGeko3+Yh9XRptFbsM88QA2Fq96fhMhFVqegCn9ORuVqxcHbVffw1
	LnUTWNxv0tGZO3JBuP7z61XUYiiSadQVafFZFD6TIVEhmyWcFoz9eO7TuXeZaIozK2Sx9aNhhK+
	HBunoFcRhfiloBSl8TkCQWwIucMRDwcuZ8TQjJqPTGEYOoUWsAf6YDlig55YcC/D4X5x1YErSOz
	1M/xFTRN5zaquUnu0AMQNRf8b7sU4uN/J40Nl4NfeYSLs8OAHleMIABYUQJGnpIP4b8BvaQ6ENh
	ITL78AllCdrOwWY2pcge4eErYLlyecgjP8LdoLTokG7q0duxlGtvuPFT4IZIlFKapTXAqMbWLlR
	EaybqSJnQwWppgQRMV99mCZ61zPspdoWdqJa7qHrOt1sx+l4uk05vfhmfARY46sfLtl7mdpnzD1
	pH7rdi/A6mKQB0
X-Received: by 2002:a05:620a:1b9a:b0:93c:7582:14e4 with SMTP id af79cd13be357-93ebd2085ccmr1853088785a.40.1791888187868;
        Tue, 13 Oct 2026 03:43:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9a:b0:93c:7582:14e4 with SMTP id af79cd13be357-93ebd2085ccmr1853085785a.40.1791888187320;
        Tue, 13 Oct 2026 03:43:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3befebcsm37453901fa.1.2026.10.13.03.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:43:06 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:43:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/6] clk: qcom: Add Nord display clock controller
 support
Message-ID: <ijqjle2jpl7ycdecndlx7qlj4qfm3s5zuxbsecnmhz5cnuomis@nnnxqbubt45z>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
 <20260724-nords_mm_v1-v3-4-32b45232217f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-nords_mm_v1-v3-4-32b45232217f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX+XvxNiuYd1YH
 Jf5Qi/emSBLUCsD25GWRU2LnrlIIriqeRTD1J6OqXCXkTZxZ3YQ8M5HACqd59qDsgt3WTQGcIh5
 cthD+kPyteQuvOT25V9JDIrWOTlTwD8Nh8SO3seJK9KQ7Uy14fcqCmnv6p8qh4yNqFcUWtjeDSU
 p5dc2WrcoBZP0IOmdUZU76FaRpksWOr1w6VtSunFGJ5kKdz5wjdkhfANpNoC9EpbQr2m6iwzaE8
 0Wh2X8WashjYKAcsexRiZc9hqYYW261knF/MTty7aWdx9Og0lBi95qxfQX4gVyG13I+sLe6l870
 XcQ2RtLRutIehkqcbGOOI2u33JhHHPI1Y8gwlYg595WLChMb9w2QR3rILCqlhmOkYlKdHnLce5p
 esTH15Lb9QHkN/OB/F3uTpOrRqvl5pgtL1ApuBRo3faXkocfY9osIa8xk6rsMqhHbbCFUM0J0u9
 hAFGrYerCBjbqqTBVRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX7dja+6Ymh6Fp
 4u3/kx9HJ5GbX3kUZsSmdFg8EE30hIvFeQfyGp7yYkjQT0qupz/TfC3uF5gR8Zrf5dVNRWwcFQ8
 eXYVOcJFEwtu0Xncke3rwngA+E7FmwI=
X-Proofpoint-ORIG-GUID: xu2D8DQ0IPNJgCLM1ttyHPiwstDTM0Zs
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace0b3c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mHeL4lCu1BsMOEic-KwA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: xu2D8DQ0IPNJgCLM1ttyHPiwstDTM0Zs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130042

On Fri, Jul 24, 2026 at 04:25:08PM +0530, Taniya Das wrote:
> Add support for the display clock controllers (DISPCC) on the
> Qualcomm Nord platform.
> 
> The platform includes two display clock controller instances,
> display0 and display1. Register support for both controllers.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |   11 +
>  drivers/clk/qcom/Makefile       |    1 +
>  drivers/clk/qcom/dispcc0-nord.c | 2004 +++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/dispcc1-nord.c | 2004 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 4020 insertions(+)
> 
> +
> +static struct clk_rcg2 mdss_0_disp_cc_mdss_mdp_clk_src = {
> +	.cmd_rcgr = 0x810c,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = disp_cc_0_parent_map_8,
> +	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_mdp_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "mdss_0_disp_cc_mdss_mdp_clk_src",
> +		.parent_data = disp_cc_0_parent_data_8,
> +		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_8),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,

clk_rcg2_shared_no_init_park_ops

> +	},
> +};
> +
> +static struct clk_rcg2 mdss_0_disp_cc_mdss_pclk0_clk_src = {
> +	.cmd_rcgr = 0x80c4,
> +	.mnd_width = 8,
> +	.hid_width = 5,
> +	.parent_map = disp_cc_0_parent_map_2,
> +	.freq_tbl = ftbl_mdss_0_disp_cc_mdss_byte0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "mdss_0_disp_cc_mdss_pclk0_clk_src",
> +		.parent_data = disp_cc_0_parent_data_2,
> +		.num_parents = ARRAY_SIZE(disp_cc_0_parent_data_2),
> +		.flags = CLK_SET_RATE_PARENT,

Here and in several similar places: No CLK_OPS_PARENT_ENABLE?

> +		.ops = &clk_pixel_ops,
> +	},
> +};
> +

-- 
With best wishes
Dmitry
