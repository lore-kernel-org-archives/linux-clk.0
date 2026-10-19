Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F93B504594
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420416; cv=none; b=fW4zR7wHD/CyiNBAHAy/ty89A8hNd54zSyOy8bCTEuhK14Pg7500An0E+VaI+NF8O4565lLJlJVHtGtSJhSND6y/9M++3yAUQC1P5Floyr16K3KV7CH9xifAGJ1l/EEqNETZLC4Yr0JL9+cG/GhnXXZMt1TbtCBgxQmM+IUwaoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420416; c=relaxed/simple;
	bh=vOR23NOgkIyph8PSVCEojvzTKea/l7YYWzBnH1JHOrw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QS3UY7dpy+NiGi4CeHJqpydE4WAgjWY4tqyRzWDKQfkvOEAgdsXiTvCfQAPSSs238MOYOBj7TMXWm3Au5aNX4ggzrZwhuqMlt63SyQUGelvgZPBk0Lab77isu4KQKUoDH19GgRPrDYs6EWQvwetTNZUWM10NqhvCxhzMm7luyFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EHbYAZJC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQHAD8eX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EHbYAZJC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQHAD8eX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE06x43485302
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 14:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQzFpTG8PW7XDUO7ySPH2DY8SEuHykZsaeu/U0Y+X6g=; b=EHbYAZJCV2IJNaWl
	Ff7lXgpRzzicxJ1z/lnpLVXMxnQvwP2BzjWRJvIF0OxBZjz2IVs35lIsWy5Ov7q0
	48OtJ7ESJneiv0CSL1VHtfhgYHP9ej1RrdohczYDBpx8qeeJWd6uonLIaPuQ87Ow
	BJq49+m5iVEs0aXwv9J2+GGQYrr/527slE4Ys8s80i6WZrcFY/jOHhimTCYwScwr
	a6HZ0uKbcQ23zU6O0k1jDy2J/rWw0mAE6YQOw33Mh8Esn2xrJ/Cx+isdjQ/BUswB
	p4l0P1ez+ImW8d6Vd+Q5LuGftXa/PpWU4KCvlHPYljsKNE699TTOvUPlcgRMwOUs
	0dodhQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48hmty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 14:33:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939c30aa9a0so240081285a.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 07:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792420413; x=1793025213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQzFpTG8PW7XDUO7ySPH2DY8SEuHykZsaeu/U0Y+X6g=;
        b=BQHAD8eXFpidHMnR1tUtOhG5DXIn3Xn89jzzUPyq36Ef9ZZDMoJerRtrBrXTCVjXg1
         Lr1cUyVVvbLX2K6wf2p8WS7t1jMIAdmeS1TEkyDJcNkcVs6hxPWcHO2OCea7/ZyZ+N6L
         b8o96VpT5kXJe0WwXAmxMB/8wEmXsiMB8/RKMUcNPscwqbsaLhTGh3RDkXi+FgWwg6Du
         rAZZZyWDnnPBmqdq2AikQJ/B/vPRMvbr1WZnMT6tQ20fdxY1CJeg4IXOm/lX/Z2wIU1K
         Zj25QZZk5eD3tirNeLMJv/BaizlgGrwzrJQttZyYKSW+/dW3GzDIqnku3eACXNgjfTwJ
         SpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420413; x=1793025213;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQzFpTG8PW7XDUO7ySPH2DY8SEuHykZsaeu/U0Y+X6g=;
        b=MIQwVPH17K90/wsNjG/JetRAqv8GPT21/QBGJXXkxsP9spmmR8wzd2kI6TWDccXNIs
         p2dUUNdP/paQoYTF+VcGK9SX4lch6WR9YO1gWQW0zXHyeqSC3AXdqWLisqyt6jh7DyZQ
         zPcqLcrWSQYD17IAB/F9cV4DirKE7IizYNfJi8LHQMB//QXXon5tdn0Pz5Azavnfpws+
         CkyCGag0dIDAU4NosZKqh4rJBHLUPaOMeUS80eQH0Fm1pgykrtje9iwhj14x7r+QQjGL
         FCiukoKC/FnbC/zk+IYA/CsMxZYQx+tURPl45ySquA8lTCusMGd5WC0FDm/oMNQoOEFM
         WzDw==
X-Forwarded-Encrypted: i=1; AKwUvBzdwRGxKZz/nrMCL1TouUrjQyluQzuH6ycRoh86jTlDKfbN1DLQ7agwAY4yzbsMMlkFDpix5xrIfIQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkTe42UuxVS7gPqGT5E552iRczjq+DKrgPVOhOmZtSsKVq6gKs
	so/qIDaiyDvvGmi7wUviEsl1+9dn5kxeXHvVO8pgrGQkxgj7/wpto8OpGftEm991B7DCbyA1js/
	cuL9/Z2zvCDejKnF1kbjkoJHL0fLWyrnvmUEFFYFzjsslXNz8pKo1b/wM7qC3T/g=
X-Gm-Gg: AYBFou07hlghL3yo5+oIUioGIsFGMW+Vp53vY4SeZk/riIdx+ojzfA6Q1zBye+jPk9h
	vgYrn9m8893yloZpNMZKLgYedrVMF3q7T4iNCtJrO48SsVsoTql/ipE2W5o2O2qz544XJIES9n1
	XzYWLmlbv3WXX+pq6FU+JU1szdgrsPe9oKpM6pbe5MsxZE1tSWu8AP60alLoyIAgKtJiiRN9BdE
	Xj/kl0ayc8Cenolg5qC8HlaMsg4iS2oiBppQlfPogzYs2hmjixgP6ZYLUrWYpUmweBxePycHUU1
	s+yyOnWvdgUtUpdsyARJ20h3TfLcPSXPcuXSIA0xlBht1g4C59CkcD+gWhUpvIxFk8ttLlXBkwo
	xwyHRhE+MyK/GZUVOS20=
X-Received: by 2002:a05:620a:40c3:b0:93e:7ddb:5098 with SMTP id af79cd13be357-93f29cc68a1mr1285816385a.25.1792420413028;
        Mon, 19 Oct 2026 07:33:33 -0700 (PDT)
X-Received: by 2002:a05:620a:40c3:b0:93e:7ddb:5098 with SMTP id af79cd13be357-93f29cc68a1mr1285806485a.25.1792420412309;
        Mon, 19 Oct 2026 07:33:32 -0700 (PDT)
Received: from [10.40.99.41] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c409239c154sm376055666b.87.2026.10.19.07.33.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:33:31 -0700 (PDT)
Message-ID: <48e3f967-be0c-4bd0-9e6a-a804ab2e053e@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:33:28 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH 04/10] clk: qcom: clk-rcg2: forward the gfx3d rate request
 to the parent
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
Content-Language: en-US, nl
In-Reply-To: <20261019-msm8998-fix-clocks-v1-4-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NyBTYWx0ZWRfX/cZdwyWxpUcl
 HqpbWYFCSum6MMYhFytf1Qlal9Ttlj26DYZvVw7WOFKannZ/EbmqMeVFI9bFNwcq8q0u8ep2dY/
 1d7+MylSxAbCZq3wAZXWRtEfeSENnBOq1Jp9N0x/PPdPKpoMJlTW8yx0UegfyDhSuc2yFi+fuQO
 h2AixWszSUWK57TfblGBFIF1FRGFg8gwg51QEWSmVa3KE1zcCvhMcIgNq0S8IJ1Iq9N3W5/EEva
 pp/B7Shfi68yR0FlOJQPjKWqT9NGL59/NWnzOPbTCwASGS/yyiEthnv4CO5IvjYCEdw2RivTLWY
 EtRxRx9SEUQQrq84mKktfFRsbO6KX55myYhR63Lpr8HO6crsaUMqHq6xUQj+YTcPNbq8QOJX9pB
 Q/lCq+Bo8CwVJAMtTM1ARZDDznC9XNTQ4FjkN9iZwVZ+RTs9Uy3KNtiNZk7Fonxppz/96zOEbAv
 m2eC0mrgGDiYnzS19rQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NyBTYWx0ZWRfX08hBEgG5p7+W
 c55YErrzPLOXcRn5V+TAskLYLYJdYXQ4/g5fDUvwjSfu6zf21kyQYcG2UhTD0B2B049GarX15XT
 3E1xXkq6wDyZmFYc2Q+atAP/zgzxC2Y=
X-Proofpoint-ORIG-GUID: wuLCgX6wcoSMYWRghLGgqwqWzui667F-
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad62a3e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=eOnteo6YT6IUeBgu2X4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: wuLCgX6wcoSMYWRghLGgqwqWzui667F-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190057

Hi,

On 19-Oct-26 3:41 PM, Dmitry Baryshkov wrote:
> GPU DVFS on SDM660 never changed the GFX3D rate. clk_gfx3d_determine_rate()
> builds the parent request by hand and leaves best_parent_rate at zero, so
> the PLL is asked to determine a rate for a zero parent rate and the new
> rate is dropped on the floor.
> 
> Use clk_hw_forward_rate_request(), which fills in the parent's limits and
> rate the way the core expects them.
> 
> Fixes: af1e62f2ffe2 ("clk: qcom: clk-rcg2: Take clock boundaries into consideration for gfx3d")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rcg2.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index c44c51d860e1..9e3d7e5c81e5 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -1207,10 +1207,10 @@ EXPORT_SYMBOL_GPL(clk_pixel_ops);
>  static int clk_gfx3d_determine_rate(struct clk_hw *hw,
>  				    struct clk_rate_request *req)
>  {
> -	struct clk_rate_request parent_req = { .min_rate = 0, .max_rate = ULONG_MAX };
> +	struct clk_rate_request parent_req;

Just a random drive-by comment: You are now leaving parent_req entirely uninitialized
filling it with whatever is on the stack. Where as before all values except for
max_rate would be filled with 0.

Are you sure this is what you want ? Maybe:

	struct clk_rate_request parent_req = {};

?

Regards,

Hans




>  	struct clk_rcg2_gfx3d *cgfx = to_clk_rcg2_gfx3d(hw);
>  	struct clk_hw *xo, *p0, *p1, *p2;
> -	unsigned long p0_rate;
> +	unsigned long p0_rate, parent_rate;
>  	u8 mux_div = cgfx->div;
>  	int ret;
>  
> @@ -1234,12 +1234,12 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
>  	if (mux_div == 0)
>  		mux_div = 1;
>  
> -	parent_req.rate = req->rate * mux_div;
> +	parent_rate = req->rate * mux_div;
>  
>  	/* This has to be a fixed rate PLL */
>  	p0_rate = clk_hw_get_rate(p0);
>  
> -	if (parent_req.rate == p0_rate) {
> +	if (parent_rate == p0_rate) {
>  		req->rate = req->best_parent_rate = p0_rate;
>  		req->best_parent_hw = p0;
>  		return 0;
> @@ -1247,7 +1247,7 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
>  
>  	if (req->best_parent_hw == p0) {
>  		/* Are we going back to a previously used rate? */
> -		if (clk_hw_get_rate(p2) == parent_req.rate)
> +		if (clk_hw_get_rate(p2) == parent_rate)
>  			req->best_parent_hw = p2;
>  		else
>  			req->best_parent_hw = p1;
> @@ -1257,16 +1257,9 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
>  		req->best_parent_hw = p2;
>  	}
>  
> -	clk_hw_get_rate_range(req->best_parent_hw,
> -			      &parent_req.min_rate, &parent_req.max_rate);
> +	clk_hw_forward_rate_request(hw, req, req->best_parent_hw, &parent_req,
> +				    parent_rate);
>  
> -	if (req->min_rate > parent_req.min_rate)
> -		parent_req.min_rate = req->min_rate;
> -
> -	if (req->max_rate < parent_req.max_rate)
> -		parent_req.max_rate = req->max_rate;
> -
> -	parent_req.best_parent_hw = req->best_parent_hw;
>  	ret = __clk_determine_rate(req->best_parent_hw, &parent_req);
>  	if (ret)
>  		return ret;
> 

