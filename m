Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CE259609C
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 14:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420492; cv=none; b=tWxjhAy85xiR2d3WpCndU/7H0zaNOUnDnt9JvEJ5RcEUY9IyReVCz7wDS4xGqLrxrXFU+B17U6owBx/4j2vbRggBLXyQsHIDPxiikWzKaXYon79fft0aPp15PKH4PhIsCj07IjgSYDlqFX+/zs4S4Y2zkgI+cPhTidvu0I6XoR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420492; c=relaxed/simple;
	bh=lp1JyycCdV2ZmeGBq4PgoImfxZ8qGWnBeGq9kSLFnTU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=sZ6WM9tE2OkI7wJLmpFKhLJ5riQD29XwaYTjLzbyen1Ru5wVARHcnbnh1KmJSEGeOyaTHT64ARXcUzRl/Okdybq0AUAmgyMXQzuO+88Xk/2IEYsd4qXo7IvWCWoIgKONYNXqTCWj//7J5rpRkLRO0t8++qC/n4ZOGOKan/dXyJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZyBuy9rS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bkxIsBZN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZyBuy9rS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bkxIsBZN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0CWK3990516
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 14:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abpPTIirDtpnjsaB5gQbH5iRbGQJxshyVDnxXDr+ldU=; b=ZyBuy9rSykFXvxNB
	0yQzCxX9BWfg4c18AZzqyLEXQHpK2Z3gDrrpOw6FFqRTH5mm3SqGMVjNTfcGJdaF
	bTUq7HarruPmomFZYxpu+wgzg0lrnNfzDIK/haq5tzSn8/RCeP/YU5SO+PibuoC+
	wHNS3+2EE5x5SZGfP/aYO/Uot6GoA0UAZPJ1poK/v3psFp8QPmQap68kA45LZYs6
	ftBXooHQdDwtX+8bOc9/EyIdG89bA9y4z82kOyF/eO8P2zt0LDAO6NOtDekSnBY9
	c8nziJ+SWDGUXVwQRW8k4Yxuvq9JuExdFH99hFC8pDnNvdTzCX69q0C6nRWEwDGD
	zbv8Yg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f9ne7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 14:34:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ae8e7e546so479410585a.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 07:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792420489; x=1793025289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=abpPTIirDtpnjsaB5gQbH5iRbGQJxshyVDnxXDr+ldU=;
        b=bkxIsBZN0ZtssmD6L4gc2bG/vrjnznTdjixdl4FKv+Qn/x/S8HfxTN/1LKD2rQG/hB
         mo91Wyc3xlIgYYKziCeKOobZZMISjZWq51RnoRfXZbLCDXDEwaEruyGR3XffnhR/qxj3
         ZzL4OopTKF2c4DvnGLRGToXS93N+Zfv3T4DqzlY2jmpr6rzOIxMd0MKryAQmjDyFNvRP
         R5+jO1NqtkchqJNyjo0li9lo+vRm2js/i1qwLCiR81Q7+ozoeqyRDFJhMKPsvGJYe/4u
         kgh/aAu15cloYC1eO8LKbD6A8XAYHg9sjio0cFj19hDuB/XaORhuHVcDZDFv7Da1hKBt
         oEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420489; x=1793025289;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abpPTIirDtpnjsaB5gQbH5iRbGQJxshyVDnxXDr+ldU=;
        b=KHVFCntWC4JWnrtLJ4wo4Ml3Tuwj6FHq+wHDJ1AfTppMCoZQTkbb1kq75MAHgXkYJF
         Ciab/q9GaSooPlaKn9abiQVz1qpTNGs9QdCI2TY18rqAfotMzqla1Wv6lkYYFnx+h9Zk
         aqaxcVs9jfVccYi2XdorMUzmq+HZUMpWe7gBynQgG2wUghxoC2fytZ4ukOPGGx8a/SRq
         Y+WjocfXWMQbib8Qs8TNmq9Glp/dH0lhrZXbCFNdbWvykXulyHn7fA/kPOyllkahVVVJ
         Uxq/rt4323sKrhSVwl2x/cqEmfPJ18R0W6VMWzPJ7oBd3wTbyfq2P7xYSIjg1FJt7OaO
         814g==
X-Forwarded-Encrypted: i=1; AKwUvBxj++fd8OSXNypyRQ7gkP0EzU02K9/Ep/U6/N31Q/R654Ho8KiYySDV518JtDAwEJqBe4ieAnSv1vg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIr5pWDoKNWGGmtTskq2Y6TvGOm7YiEKOMAWrbIu1uYvdBYlBO6
	TXmWsaAsv/fn4P3hvatN+oC8KpdjECfwvuJsNOyI4Qx1Dm725SGV3AYlT7H7P0xRvg2g4dis841
	KPsvXERduusykOazZP300TxdwFrJOeuTgveXKgeHcyWIqHE7xyGdFmsZ/Diy4yl8=
X-Gm-Gg: AYBFou2G3hhr5pETz5dBVWCscK4VPMRxMSR/sMVp6RzlR90NslFsEn6qUCz+ieVhlRM
	AInqzyuLgA5Z10pe5CVyBrIOatCm3HegVWHNkoPUzLxNTEAWs6EYwdaYHfSqYhvbfUiPEhDBgze
	TQkAt5tFydd1A1uwOyQBxtdPxrrry/OVwfkQTjFGvyYAsgjU0jU2WmPZ0w4FmvvkCMwUwVf7qfg
	pNPqMF5/QPCc0VUiTqYDrPoyHdUGdgc3+OY6JdL23LualPr72x0yjf0H25wGvl9Ab7q5+qc8O6I
	M/zRZhofHhPTT93dt2ta1zKlDQXVZrWv3YoEIah5UGa4RwyHMr5RxotJF9tyhOtss+kBnZAc89e
	5jJeoR2g/s49QI/5IUkE=
X-Received: by 2002:a05:620a:c51:b0:93e:94f2:ada5 with SMTP id af79cd13be357-93f29cc7da1mr1315666385a.25.1792420488447;
        Mon, 19 Oct 2026 07:34:48 -0700 (PDT)
X-Received: by 2002:a05:620a:c51:b0:93e:94f2:ada5 with SMTP id af79cd13be357-93f29cc7da1mr1315661185a.25.1792420487951;
        Mon, 19 Oct 2026 07:34:47 -0700 (PDT)
Received: from [10.40.99.41] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b14besm3872956a12.6.2026.10.19.07.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:34:47 -0700 (PDT)
Message-ID: <95f882c5-f683-4186-9235-ccce557efa4d@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:34:45 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] clk: qcom: clk-rcg2: forward the gfx3d rate request
 to the parent
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-4-370949e4d8a0@oss.qualcomm.com>
 <48e3f967-be0c-4bd0-9e6a-a804ab2e053e@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <48e3f967-be0c-4bd0-9e6a-a804ab2e053e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gF23GWdOPVaWDRWX0chdaxEd9cNl1q3H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfXwlvxRYY6XJQ8
 aCLSz8uCgvqKoM2oItEsRg0iEptiU/zvw+xLIqN25M6ELQZtnKV8euC8EYQwmkbdTn/BB85OHrM
 pEenRfaFOIXOTHRmDjLoXuhHcwHhE40cQCIhhAVdOXFJub5bM2VbPrlrq2SkEa+BTJs3w0zV3Uw
 HyH497ZjxdkU6Q0z6YmvDGkyo2+7Ykmu91LGGgr4K296BEoeNZoz92/hPhWCwyqQ1GhuD7fN7Mc
 HSnL/526vrD2d9ZVBoDG0KFYWW2wL++GE7vZmA+VdlU1DMhlKe3ClrdAy+1Y1fkK4pJjU0bvgRf
 /HKoFV+vx5oMvgO7VeM20kFv3pP4Cj3BoC6cEgk/pe1Dlhq/3PjjkqiCfBShL074KFQlwynVV/t
 RlgjOdKcJUg11mn5CwTeHio+8GfUMDJo8jdvLFNLrPqu5F1kmNwj2SqMD//vUy7PmZ2CjJbwVMJ
 g4PVzkXb26yqvVDeWfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX5L/HsONrJKUa
 sXmFcH0FNXmdUQaV1hyRseXBbOc4ECGP9VwDNgzNmH33s/EdD2fTdvjscKLbfAEgYMqxOgGBpn5
 rjmrylhvy4RsnH2DT8y85k8CfyFEMKg=
X-Proofpoint-GUID: gF23GWdOPVaWDRWX0chdaxEd9cNl1q3H
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad62a89 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Z2py1QuwkTp0KbrVXjIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190058

Hi Again :)

On 19-Oct-26 4:33 PM, johannes.goede@oss.qualcomm.com wrote:
> Hi,
> 
> On 19-Oct-26 3:41 PM, Dmitry Baryshkov wrote:
>> GPU DVFS on SDM660 never changed the GFX3D rate. clk_gfx3d_determine_rate()
>> builds the parent request by hand and leaves best_parent_rate at zero, so
>> the PLL is asked to determine a rate for a zero parent rate and the new
>> rate is dropped on the floor.
>>
>> Use clk_hw_forward_rate_request(), which fills in the parent's limits and
>> rate the way the core expects them.
>>
>> Fixes: af1e62f2ffe2 ("clk: qcom: clk-rcg2: Take clock boundaries into consideration for gfx3d")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/clk-rcg2.c | 21 +++++++--------------
>>  1 file changed, 7 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
>> index c44c51d860e1..9e3d7e5c81e5 100644
>> --- a/drivers/clk/qcom/clk-rcg2.c
>> +++ b/drivers/clk/qcom/clk-rcg2.c
>> @@ -1207,10 +1207,10 @@ EXPORT_SYMBOL_GPL(clk_pixel_ops);
>>  static int clk_gfx3d_determine_rate(struct clk_hw *hw,
>>  				    struct clk_rate_request *req)
>>  {
>> -	struct clk_rate_request parent_req = { .min_rate = 0, .max_rate = ULONG_MAX };
>> +	struct clk_rate_request parent_req;
> 
> Just a random drive-by comment: You are now leaving parent_req entirely uninitialized
> filling it with whatever is on the stack. Where as before all values except for
> max_rate would be filled with 0.
> 
> Are you sure this is what you want ? Maybe:
> 
> 	struct clk_rate_request parent_req = {};
> 
> ?

Hmm, I guess that clk_hw_forward_rate_request() now fully fills in the passed
in parent_req, so this change is ok.

Regards,
 
Hans




> 
> 
> 
> 
>>  	struct clk_rcg2_gfx3d *cgfx = to_clk_rcg2_gfx3d(hw);
>>  	struct clk_hw *xo, *p0, *p1, *p2;
>> -	unsigned long p0_rate;
>> +	unsigned long p0_rate, parent_rate;
>>  	u8 mux_div = cgfx->div;
>>  	int ret;
>>  
>> @@ -1234,12 +1234,12 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
>>  	if (mux_div == 0)
>>  		mux_div = 1;
>>  
>> -	parent_req.rate = req->rate * mux_div;
>> +	parent_rate = req->rate * mux_div;
>>  
>>  	/* This has to be a fixed rate PLL */
>>  	p0_rate = clk_hw_get_rate(p0);
>>  
>> -	if (parent_req.rate == p0_rate) {
>> +	if (parent_rate == p0_rate) {
>>  		req->rate = req->best_parent_rate = p0_rate;
>>  		req->best_parent_hw = p0;
>>  		return 0;
>> @@ -1247,7 +1247,7 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
>>  
>>  	if (req->best_parent_hw == p0) {
>>  		/* Are we going back to a previously used rate? */
>> -		if (clk_hw_get_rate(p2) == parent_req.rate)
>> +		if (clk_hw_get_rate(p2) == parent_rate)
>>  			req->best_parent_hw = p2;
>>  		else
>>  			req->best_parent_hw = p1;
>> @@ -1257,16 +1257,9 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
>>  		req->best_parent_hw = p2;
>>  	}
>>  
>> -	clk_hw_get_rate_range(req->best_parent_hw,
>> -			      &parent_req.min_rate, &parent_req.max_rate);
>> +	clk_hw_forward_rate_request(hw, req, req->best_parent_hw, &parent_req,
>> +				    parent_rate);
>>  
>> -	if (req->min_rate > parent_req.min_rate)
>> -		parent_req.min_rate = req->min_rate;
>> -
>> -	if (req->max_rate < parent_req.max_rate)
>> -		parent_req.max_rate = req->max_rate;
>> -
>> -	parent_req.best_parent_hw = req->best_parent_hw;
>>  	ret = __clk_determine_rate(req->best_parent_hw, &parent_req);
>>  	if (ret)
>>  		return ret;
>>
> 

