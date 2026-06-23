Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DBE3D5237
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 11:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215168; cv=none; b=XpEs8qlbVWTXs8iA0ItL8ys8Yaf3z7eDqN58Gjc9MyiUlrC89rmFTZGA2HIlfC15+gaCmA88qBaXS4/GK6xhgSc/RKvOoYfQzmxPwjqcnY74uB0PmskjRra4IBIfMAXYEtZrhHbkJdLH3qjxv9BPJVaRpsG9V+psFWc+cxaOufg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215168; c=relaxed/simple;
	bh=Hso0a6UrliQE5puSOMxPFIsfnb5JdMwIZP9scKQqL2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gPAw4z3DfF9m9zQg+xFBe4RRyypDWwEWafW+S6ST2FUpeRkWlJ7535MdvRpAOFgsI/jDhpH1jZf3oAGFDG5+vhPLzAyvfpPOljnUcxSlAQeZ41sXZprod5U8MR4RSqAiAjxesGU/+kG37U4M348lzCHcfHNqQ5/f75POSKaeR44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=exUMlBsl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BvcnztHI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="exUMlBsl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BvcnztHI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXnZ53668829
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 11:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m5U5jjEW9F6IsBKiOyKcfNkewQXQpsrvSh1PrEY+JBU=; b=exUMlBslb0malfKz
	wCVTsgbL6sHO2bs58FC2dSO2vcOdObXhisMaudGZqA+tvxqLVcxYMqo53yM5ZR3k
	XgaFyf1xh5KgV/PPy3y70NVXa1uNxhmxw94+fRE5kzc861jjNTEkp8qJDvUWoR6K
	rDO5jMbVYXVvf1I3jovyjDvZPXW+MH4biNZK3cbEceK9vZN4EZC304yp8g+n68sx
	TbW5Sgatnbk8GjPZq4FkVYvsrOiIeJJyG9AyJpWJkmjeU+4evg7ol9N4Qb8sRU6Y
	oR5lhUn7boKNCCKY7S/c+dL5/L+QKMpvL32nAU1kri1Ox2Sulta97j8lScjbM9h8
	9+z2Gg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppygtbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 11:46:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915c364ae3bso1105831685a.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 04:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782215164; x=1782819964; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m5U5jjEW9F6IsBKiOyKcfNkewQXQpsrvSh1PrEY+JBU=;
        b=BvcnztHIDBzosmQ82QmQ2MMbQuqs6E3OokPRoy5EOrmxzSa87gk6eE4UTvN4yFO+3n
         WEStobcZSvMpZLHUzGu7V5CUuRzkqLXyFWP4NBa3+eR0vY+OnXxzZXOzHLZqERqB8tex
         H19TVV+Moc/Kb30M44bJz9D/sLWaRL2lTX+benm6riMk/8nfe/dSCv1qcFy5OwNyaIGm
         SIjKQyVbdNyvNgorDMWffcZd68ipVw8DQ4GDm8XAzVxQu1sAI94/Iv7VVrK9fxlqqW9h
         Uwwp8oN2PjKjsaLp271UfkYJbLJiHCci+1IXVkiRRJSqqchatwBJXtoIzSnkbaoDlX7O
         +qwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215164; x=1782819964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5U5jjEW9F6IsBKiOyKcfNkewQXQpsrvSh1PrEY+JBU=;
        b=Ej8I5jtgVfh+7bQ2F+dnz/fGZo3F01HXJp5jGrR++WmmGpF0ULMFbWAbAfKNsG7f+1
         PfVpEOXrEGV+lKfVZUftQBwZ3dI3g21lDRsX30YMeicH+TtaNQKxgyBIaYMImPshhFh6
         FeF4uR5kcmq8l01FxgFqNhQGVkdLxg0igCfbRs02h8XCswr19QIunDQcPauXh0nQ0cjt
         oLUJerpbl1nZgj+frDj9c8b/rmk1TmfX7QtRipdVqK16HfKswFS8QS7J4XhWYyQPU7ho
         EIfrTcwA9nFGezn5Fvd5mhheYtTCb03WKLudT2r9+BAkCze8jbLvaUoMyXUNqwk8sW2l
         ZTgA==
X-Forwarded-Encrypted: i=1; AFNElJ/qGqkwPZonAJiNyuOysiXuRy8hMAMRAxK+u0BvdPJ55TbxUOLtr6Aa6U6hSWkk5vRqTOAAj8VUk5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgCcUSd+8Rz6KDiZghd86l0++C5J5YqVZy95ud1aGhCAKWrPo9
	iEn+TMC74q8Tqjds5rzP0ulFR39CeBqFoCJG9CgvaVh8rm49Pntf58AsKbj4wDu9R1ZL/v73De4
	maJcqk16TK7uhZFG+dpI1uZ37VoEN/JyBESAcU3pv3+nkciXCUoGyyn81WHnz+Ww=
X-Gm-Gg: AfdE7cmu+WhZ/mW4+Qs1VFUA5jqj78CC+xDHKunrddBFOz0VRkXLRHfrX+Mqd/6WWKv
	7hhx0NAYlaq2hj504yhNgKbwDBYHhQv411hHZ+OH8ilCOOEZfFu+rDqTIO1fKaP+XmmwM343cq9
	Ga0Z7v/am4ZJ4FNRSpDkzQkrK2RWxEOawLpFPUvaVWN7UXmUJOboFdEQ9p8qNfD8zUP/8LeqJmS
	E7MJrepuOTEZNxN7X2VnKlDw7tpVmqThWYfSsQ2f2p2reNz5V46oEG/U8Ljfu3qnUV5gco5FwqU
	HFSeJnxFfsFI+2y1rTapzpic70F60mzzhUZGQsEiFwfO9+K3Bic6op43i63p3SIyGABEQfDd/5H
	iEsuYZFmrcKvj0NVysuQJeyF4GS5L5/ukQgQEyGhTzFuJdFLmVdBraB04ZRrQnCBLn7ZxU4DiUQ
	==
X-Received: by 2002:a05:620a:4625:b0:915:d322:c47b with SMTP id af79cd13be357-92645aa5b4dmr405206685a.13.1782215163860;
        Tue, 23 Jun 2026 04:46:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4625:b0:915:d322:c47b with SMTP id af79cd13be357-92645aa5b4dmr405194985a.13.1782215163149;
        Tue, 23 Jun 2026 04:46:03 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:21db:9254:19d9:645e? ([2a05:6e02:1041:c10:21db:9254:19d9:645e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7ba08sm370702135e9.11.2026.06.23.04.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:46:02 -0700 (PDT)
Message-ID: <b35abbd7-f06e-4794-91a1-bdaccd63af50@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:45:59 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: Drop incorrect usage of double '::'
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Andi Shyti
 <andi.shyti@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Peter Rosin <peda@lysator.liu.se>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Linus Walleij
 <linusw@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Jonathan Marek <jonathan@marek.ca>, Taniya Das <quic_tdas@quicinc.com>,
        Robert Marko <robimarko@gmail.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Anusha Rao <quic_anusha@quicinc.com>, Luo Jie <quic_luoj@quicinc.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanho Park
 <chanho61.park@samsung.com>,
        Sunyeal Hong <sunyeal.hong@samsung.com>,
        Shin Son <shin.son@samsung.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alina Yu
 <alina_yu@richtek.com>, Andy Gross <agross@kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260622101606.485961-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NiBTYWx0ZWRfX7OgErdSdTU4L
 N1gwtENVgQ4YO+/zIEWxcNNtH/Nl8LpgsUjDVqkCJDW+z1U/yS5J2ABeH9PCXg1Xu0y/pvXyTIu
 E81e02ggJrJ0HPwrd0iT4Xr2scip60DsfeCa0Cqm/5Dhb3aJjAxwM84MadMs5XjItLauOHV/DHl
 c7w1rf5iOY+bAhfOuyLtQ7crt+g+C740sqgi439mk7hQYCmNa9YrpwsmVSxV3xT+VO1OtlCN79j
 ktNT3IB2SVrmSssl/AZKmWOF5ZjwCHi97RJfW99u5PQjR/v33y54kEbQ1tyjNRpzdoVjALtTqgT
 J3ofjY4G6iDvt6qZZHJzanEcYi5j9O72oYXsaL8MX9JLiLnDJFQaz6BsmT30N7GA0DXOwo/0/qe
 JC0XsfYzsjMrz6cwpmUHU0Ig/drRIvcNSYd9Mzt13vnePGEV/sLulJUdUDjIJ8p/ePVVnnd/sl2
 vp1Efhe/UhLmWrwRUbA==
X-Proofpoint-GUID: dC8Ex1HLPCpnIpC-rf0T1xc7GUXQ1HKl
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a71fd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=fqWYVyBuAAAA:8
 a=EUspDBNiAAAA:8 a=p1VIHm5NO6eVjb5xVX8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=3EkFFxAVN7Xjp7FSp-fE:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NiBTYWx0ZWRfX3I+AmW6f9XAi
 7B+C+0yEtk0j4VnAl6thU5pfzS+Tx/hF+H+2yG+e3nzCYYnEtuvYqQ3fgL6YMq8QGv2LZAx4i/e
 WxtbbM/lzHzUPgvkclbFvzJZgKzfMw8=
X-Proofpoint-ORIG-GUID: dC8Ex1HLPCpnIpC-rf0T1xc7GUXQ1HKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230096

On 6/22/26 12:16, Krzysztof Kozlowski wrote:
> There is no use of double colon '::' in YAML. OTOH, the literal style
> block, e.g. using '|' treats all characters as content [1] therefore
> single use of ':' in descriptions is perfectly fine, whenever '|' is
> used.
> 
> Cleanup existing code, so the confusing style won't be re-used in new
> contributions.
> 
> Link: https://yaml.org/spec/1.2.2/#literal-style [1]
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Intention for this patch is to go via Rob's tree.
> ---
>   .../devicetree/bindings/arm/qcom-soc.yaml     |  4 ++--
>   .../devicetree/bindings/arm/qcom.yaml         |  4 ++--
>   .../bindings/arm/samsung/samsung-soc.yaml     |  4 ++--
>   .../display/msm/dsi-controller-main.yaml      | 20 +++++++++----------
>   .../display/samsung/samsung,fimd.yaml         |  4 ++--
>   .../bindings/i2c/samsung,s3c2410-i2c.yaml     |  2 +-
>   .../interconnect/qcom,msm8998-bwmon.yaml      |  2 +-
>   .../interconnect/samsung,exynos-bus.yaml      | 14 ++++++-------
>   .../bindings/leds/qcom,pm8058-led.yaml        |  4 ++--
>   .../bindings/leds/skyworks,aat1290.yaml       |  6 +++---
>   .../bindings/media/cec/cec-gpio.yaml          |  2 +-
>   .../bindings/mmc/samsung,exynos-dw-mshc.yaml  |  2 +-
>   .../devicetree/bindings/mux/mux-consumer.yaml |  4 ++--
>   .../bindings/phy/samsung,mipi-video-phy.yaml  |  4 ++--
>   .../bindings/phy/samsung,usb2-phy.yaml        |  2 +-
>   .../bindings/phy/samsung,usb3-drd-phy.yaml    |  2 +-
>   .../bindings/pinctrl/samsung,pinctrl.yaml     |  2 +-
>   .../bindings/power/renesas,rcar-sysc.yaml     |  2 +-
>   .../bindings/power/reset/restart-handler.yaml |  8 ++++----
>   .../bindings/regulator/maxim,max77802.yaml    |  4 ++--
>   .../bindings/regulator/richtek,rtq2208.yaml   |  2 +-
>   .../bindings/serial/qcom,msm-uartdm.yaml      |  2 +-
>   .../devicetree/bindings/slimbus/slimbus.yaml  |  4 ++--
>   .../bindings/soc/qcom/qcom,apr-services.yaml  |  2 +-
>   .../bindings/soc/qcom/qcom,rpmh-rsc.yaml      |  8 ++++----
>   .../bindings/soc/qcom/qcom,wcnss.yaml         |  2 +-
>   .../bindings/soc/renesas/renesas-soc.yaml     |  4 ++--
>   .../bindings/sound/qcom,q6asm-dais.yaml       |  2 +-
>   .../thermal/samsung,exynos-thermal.yaml       |  4 ++--

Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com> # thermal

