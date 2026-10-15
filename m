Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256464AA1F2
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 07:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048559; cv=none; b=T5CDshjQ4Uz3iVWAHTtayqL4EOm7h9PcqfRvNHVdY158vqkYEe0ORgpVFZApEJ36sx57t20Gt6i5a/PNCZn2U/n2n3HG0VJcsh74N9BJKQcseMZ9ojWTlvfr5Edu7MotPw/HpOlC936SkJSqds+2BpsYnUjUAPzxVZZ9Zml8gn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048559; c=relaxed/simple;
	bh=vjC+BasSM2A5pqOKU4kst3CVWxdJ8H9DWDf0gHYFgJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cNgteiUO8R2y1Iz5mqi/aoLYQmerpnGKT8tkyjE/dOoNhjgOvaUlh0eR/VgGhhBSGdhs8sGWWcmSZFwtx/DkYdXxG2w7msM43YPRUJ5cAhJ2/+nuerbsUqpXh5QaqtAOKBeqgDFXDDx8tQDgEEYMgeju9YV0QaxjLtweQCb4zGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xs0WUlmO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNkXXPOg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xs0WUlmO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNkXXPOg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F1OhjD1707333
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 07:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YcL9Tn0lD7wDtND94KTiC4YZKyvPoN5Qhi+HsYjbYmQ=; b=Xs0WUlmOsjvUIFWm
	VGjcxKvZv+I1DWj4+mZpbWUfagOhDigL5ylhevrFn31lYSj0HV9NGxg+gKJF0gAi
	Pn6kCSzrDslJzpMItz2hxi3qXfs20wR7NT9YhjFv6mzs3oOvaY+eBKiU2iMH4RNx
	oZ5nBU+cWITt8NPaN0ciPBWmP9GeFz25yHRZWA7CMJWkhTO72W9cMCZvxzsq8Ut8
	ORjV7FXDdQpFHIOoQaP7YmFLYX4bLnPNV/pjLaKoE1464TPWqFLXVOso3NOnlLWq
	jsmpKzBfHpCGm51RAHfx8rO9U8D+/a2izpAtnyDNEAVyymmLQRtVHkXAyHPEIahg
	INctFw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54s6nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 07:15:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso3299623a91.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 00:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048545; x=1792653345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YcL9Tn0lD7wDtND94KTiC4YZKyvPoN5Qhi+HsYjbYmQ=;
        b=BNkXXPOglAfyklEJ2e6wsNmS7BUMz9YvX6dHeXgs+s9yhNWojRP1SlsFzseuaqhJB3
         jm/C4uBFhiIHTiLCC14IZ96CdZ5MP69H9XnFkZ1XpnbTSAzkr5Ol3pCMWkfvMzXAQx07
         N4IlYj2r9+dsw/H2XhxohW1cwKsI72li0uM48YQxbvlpQGOUlySmK2OcVR9pXNMuyV+E
         xi/xlvWX443kkjlq+KGiHqC6no3cuMbBO18Ovo9xImm9joXKb+5PF+II19/eYJbOlYQn
         cYWz2bHnvtv5koXvvK4Cs5hdOprzTAIulhaGVkJBHFaQKTUtIUJRiJmZ9+DJUkm1wadg
         2WFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048545; x=1792653345;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcL9Tn0lD7wDtND94KTiC4YZKyvPoN5Qhi+HsYjbYmQ=;
        b=NcJC981+oTTrL1H2PHBjrSOTLRTj6HmIpbH6dggunPWOfKDeJ2tySxeeIEEYmxnY0I
         0wI2FdG3Jtaf0i/+/rBW/2H/X8JHGuZBFMpnoEsNekQvQLhPXi5WJw5b7zx7q00UHFbo
         CkoEA2h5NU513Br9vYqGexn2rzn6jgLftcA5ERHXDoAY7GsUCwfHOu/dkcY1tGm1q5nh
         cZYdHP/nD4l3ZGq6pIyIVgCagh1kpOGfcZdd1cByGWBwSI3c4K708kMaoczYFELEYhaz
         o2GDilieevCMX5DnPi0z7I86LwPEM7LjGSAgqYWgbJqvfZ90AV5j+ULoU7z9UrtPOMD+
         vMow==
X-Forwarded-Encrypted: i=1; AKwUvBw/FH5vfF1nooZfCglLYCUIuWCz/B5l+i5wMa1YowSQD0rKl3RB4Dr5qoQbASutqXG1F2xq70XspgU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7Wvp1sXrB7rLp/ciYAIUXkrt3nUDeAHY9vV+UYbEbw/9S6UkY
	3VWnZ7Pa8ntb6Q17Bvkt6xBs4tVLXKGwWspDmiatqE06E/yvBipjrsOYELwxyeDxeFsc4Izt05Q
	i0mPLnyCmRfWiFBnfooH4ZzcNGf9ookTazBDTB4a+moZOtjeqyhnqc4d7LdfYiIY=
X-Gm-Gg: AYBFou3PouSwBwHkDQ3D74bcMKu64HhJydmX9zHInZ1vrXvqX3naCn3UJCXPIz3q8A1
	R2yR+Cgav/KIApyAKl03dr8yyFI7H1FweFTHGnGjpYbpHhEVn+zcL/AV8geP8ErPtwy94kaS2ZE
	Kxw0x6XLl0RHa8fd6113FQLMNjUOb88NjF1NwCBD4x4DDTVGviN6Ek2WgMv3VYVvneu0QR+ss1z
	A+DrVHdQmWykiHBD+Z7Zh4QjGOr2kmKJsyap+ExxEhaVfKydyFctprpO+xkrkJWJsQKI1sFFtwb
	visF6HBzu4jdVIOllvQFiif4htGN1Pf5nTTFEn4TXsOVEBeD2OiJnRVRd6zdrF6trywwH7q26aS
	A7+920rhwa+hrsCDRkCK7OVCioA8=
X-Received: by 2002:a17:90b:1d52:b0:3aa:fc22:8ab1 with SMTP id 98e67ed59e1d1-3ab3a8a1ad5mr16246311a91.35.1792048544805;
        Thu, 15 Oct 2026 00:15:44 -0700 (PDT)
X-Received: by 2002:a17:90b:1d52:b0:3aa:fc22:8ab1 with SMTP id 98e67ed59e1d1-3ab3a8a1ad5mr16246267a91.35.1792048543623;
        Thu, 15 Oct 2026 00:15:43 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a43d98sm1617534a91.0.2026.10.15.00.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:15:43 -0700 (PDT)
Message-ID: <0691ab2d-1ca5-4140-af77-05bbf718d205@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:45:37 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: Add a driver for PDM GP_MN fractional
 clock divider
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-2-1522662b6c53@oss.qualcomm.com>
 <h7ai3qajk4yq2jgvy6etqpchxuxo56sxtvcgvh7xhodw6jkias@ayn2thdck4ct>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <h7ai3qajk4yq2jgvy6etqpchxuxo56sxtvcgvh7xhodw6jkias@ayn2thdck4ct>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad07da1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=a29RP2Si9AT6pp-L1QcA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfXzNk0ApjlgOL+
 9dz3yIdNgBw8epN6dq7VxzLDnwoVgzV3/gR9M9dJVC5WSuz5PrmxHona3Ygt6q0PzBxW4aBXKBB
 nyiiZtnBCUBRfj/dbgmXI8MdDlRLmTQVCy/RLUn+P4L48BFZKoCuOdlcC9BiMXeHlhJMRUmbOBD
 KNKJEx369Q556iblEewCyrX1cGH0KBC5QQv5svEhJGSt3yaogLRCO2FuS++PidJdG3TAp6CFuxF
 nGqQd59d7/aClw3utPajocoBfh6TjAn75EonxHABM0Ib00zfQ0SfIu1LDe2NeIxvQhygsISmoog
 HBjXXdTNrSY4S+7hXbO1vcRaqeNcoeSkmNl31KrIrriM8jQpERO/lDoreCUiwQvYNTItZEm9hXl
 4WAEcLymSWe2E0WGiMhZKNU3ZdpbEezK0SODnkGIfWPHc/wkKxuj/waw4ncj4+qhl28Erp4NFnV
 lYgIKhSNDl0j4ClEoDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfXwyQlzGyzb3ZG
 HX3+wwiZuTPJvFCh38EkuKpQDfu/AF10+XrgJ+7CbVnQsj+oU1uxFex3JqsVjrPdEZ3uALh/Hu7
 E1fEDWv2OHHuW+wUBfdt8hMfCIpg2co=
X-Proofpoint-GUID: 1kMfcMwj0cJpNO0LOVySRvgAcsLCkgf5
X-Proofpoint-ORIG-GUID: 1kMfcMwj0cJpNO0LOVySRvgAcsLCkgf5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028



On 6/8/2026 9:01 AM, Dmitry Baryshkov wrote:
>> +static int gp_mnd_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>> +		unsigned long parent_rate)
>> +{
>> +	struct clk_gp_mnd *gp = to_clk_gp_mnd(hw);
>> +	unsigned long m = 0, n = 0;
>> +	unsigned int d_val, n_val;
>> +	int ret;
>> +
>> +	rational_best_approximation(rate, parent_rate,
>> +				    (unsigned long)GP_MND_MAX_M,
>> +				    (unsigned long)GP_MND_MAX_N,
>> +				    &m, &n);
>> +
>> +	if (!m || !n)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * When N = 2M + 1 the valid D range [M+1, M] is empty; no duty
>> +	 * cycle can satisfy M < D < (N - M).  Reject before touching hw.
>> +	 */
>> +	if (n == 2 * m + 1)
>> +		return -EINVAL;
>> +
>> +	ret = clk_prepare_enable(gp->pdm_ahb_clk);
> Can we use CLK_OPS_PARENT_ENABLE or pm_clk instead? Having to manually
> toggle the clock looks like a coomplete overkill.
> 

Sorry for the delayed response. Yes, I will model it as pm_clk.


>> +	if (ret)
>> +		return ret;
>> +
>> +
>> +	ret = of_property_read_string_index(dev->of_node,
>> +					    "clock-output-names", 0,
>> +					    &init.name);
> Do we need it? Can we generate the name instead?

Yes, I will generate the name.

> 
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "missing clock-output-names\n");
>> +
>> +	gp->hw.init = &init;
>> +
>> +	pin = devm_pinctrl_get(dev);
>> +	if (IS_ERR(pin))
>> +		return dev_err_probe(dev, PTR_ERR(pin), "missing pinctrl device\n");
>> +
>> +	pin_default_state = pinctrl_lookup_state(pin, "active");
>> +	if (IS_ERR(pin_default_state))
>> +		return dev_err_probe(dev, PTR_ERR(pin_default_state),
>> +				     "missing pinctrl default state\n");
> Isn't it done by default for you?
> 

Yeah, I will move it to default.

>> +
>> +	ret = pinctrl_select_state(pin, pin_default_state);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "failed to select pinctrl default state\n");
>> +
>> +	ret = devm_clk_hw_register(dev, &gp->hw);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "failed to register gp_mnd clock\n");
>> +
>> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &gp->hw);
>> +}
>> +
>> +static const struct of_device_id clk_gp_mnd_match_table[] = {
>> +	{ .compatible = "qcom,clk-gp-mnd" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, clk_gp_mnd_match_table);
>> +
>> +static struct platform_driver clk_gp_mnd_driver = {
>> +	.probe  = clk_gp_mnd_probe,
>> +	.driver = {
>> +		.name		= "qcom-clk-gp-mnd",
>> +		.of_match_table	= clk_gp_mnd_match_table,
>> +	},
>> +};
>> +module_platform_driver(clk_gp_mnd_driver);
>> +
>> +MODULE_DESCRIPTION("Qualcomm PDM GP_MND clock divider driver");
>> +MODULE_LICENSE("GPL");

-- 
Thanks,
Taniya Das

