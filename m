Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A935ABF4C
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 14:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421460; cv=none; b=et8mRgY493y93RlGAyK+Qd+LwBiVCN++xxd0U+KTsfmoQeoOThhX3mN97T2Jc1h2tWPxEmz7BxuBelaRJw/wvpcvX0FPMEYfejoQOLEBR1Dd8FM7OVJQM1PcHVJR9cIvw70rIEI2rDKSgDbjacRnF1DR51AOjxq0SW1jvMjMzHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421460; c=relaxed/simple;
	bh=b1+JvOKFur6JYDex/9XHOzlFZjLyOieoNE0wIik5Vag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HvtGoGEWz16mwRcp60COnm9n/Iugr/jylBdMmybUEkXfdPRMl7EL/ZmQPb4PNDarjeNhsmyIdw8KnH5iVfLyLd3WgKiPKeasnswAY0YFTlNfm+d7mzWu4spTQRK9ccZTpJDkWt6/1s1+yXezKiWfRgDD9dcfpdaEOGDuQFiBRcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHPR9BiV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LDl+2orT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHPR9BiV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LDl+2orT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0Ra22925906
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 14:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GXN0spHEq1C0VgRVmQrse2LW
	1BQTtrwLR6Yclzmletg=; b=RHPR9BiV+Pp46tCGRgWnCm6kVOm7I/lyfYhFO8HP
	1PQjpgQwl4BH0mRWqlrqXh9L7o4SpPrBpsvGK4Ebhm9It1tdihoVzl9LigmzXNT0
	Q0jMYOLXCnMcK2397V19FF532TP+pZk8FXPRp+GSkHDo6jFsM8b/wTSBqIpBJnsv
	8fdDfS/EsC7SHqnIZ5t2hR42GMlOO9mBZu+XCBHZ7ySVwmXgqY3FuIc5cevHYlg0
	2svh8F2wZFAMcwIcRsOCDl/UsQ3XzuCSjonJABKlBOLOpU08IEw7fK7MyO7OHOeE
	Y6b5CaZOeux7LlW5/XanjzUrrcX6+FbIecl85RCOE9VWJQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w1bb4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 14:50:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2005ce21so387489685a.3
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 07:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421457; x=1793026257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GXN0spHEq1C0VgRVmQrse2LW1BQTtrwLR6Yclzmletg=;
        b=LDl+2orTrwB2oHE3cOUURKPzVMW1ry6iRZf6URlLwCB5fsJhiPSBYtB31JxQ5WQ8Ca
         z4000GpZJHGAtrpIjDFUqtHDLkesrhAcZ4vR6s42mua9YCUsCZqpt8xr+TJdhgGgSEAo
         MRJPYq6b4B45MZAREXD4Kdsp9edTkbiDdKQzO2NTvrPXtdrzpFpcnfRFeq0kfaQTFD6k
         LD34a44pGeWLm3hCSfUyomFcAw7sYrnQySZGerwMMsk8XgKnHdNP5RqgwCUWrf4B7qLW
         1qzHpCmehvvoo0PKFONnXsdJEMiWcxcw1QuY4/R78ZraIxY+QQrdeAGxaH6I4m2kvrvb
         Nygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421457; x=1793026257;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXN0spHEq1C0VgRVmQrse2LW1BQTtrwLR6Yclzmletg=;
        b=jH1mHL7XD21hkjK2ryO+yth3/RaI0WyErfhPdymElGTpqMyOIYY+Nt3ZQ9kVBDyXqO
         uOVppM+PeLyoY8ew1vbEVJi5CwjjdSOq7MMmn17JSQDtTQc6KC9Q4Btq/dObfDNnD2TC
         KV+EnWsNAPMMd6EH8MXsBQNsgKpULOBx0dNamZqEaDwsc78N7I2y8I5YLNGsPv4smh1P
         5U9f4Zr9TnL3IzdlFIoQ8+Y70sH7GcbBiUCVLWvMqavi83xRQEfKTicwxTbIOSdZoWLF
         wRtX5RcIi27A+VTRfzT1QwGoBM4cuvZBuRbF2LWAJu4RRE8rGPbSOlOxjV/KYdT3Xp/f
         0d3Q==
X-Forwarded-Encrypted: i=1; AKwUvBy9sqSuQic7rr24hSZ83OewNrUw0eIjHdjWmoQe5gctTBWenV9ey/hhBTw6KI9s763wQB6uoDuK/Ng=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6x16xbu64Ee31IHlrx/oQNEEtPi/b8laf0OqfHzGa3joxo46D
	fv6CnLUGaj6IebSb9+T8ETXXwPvdjxnISImF4dnlzR0nYwNxrNdsxwMaKMypwEmsAtmQ8DNyh+8
	OmOINxMjgZ7NkGsO463Vza0tA+6AajIGRUNaWhkY6uwz5tPmR2+jqPmgn5hB0NRU=
X-Gm-Gg: AYBFou3s8mDhO2ew2DgJwLdXow5ihou7bUDPNbY6TCMKYXrGqgJlszGeEaoXYKijXyH
	BUQLoazL8NYsjnbQgJAjWbaRXpaBQwEy9lRuAgqJIVnNNud92XpipYEPF6xL9UKljcSw+kzXQo3
	9sqi0rWJpxP6bfjriLXyt08nH1w65phLgQHfwc9nr08PXGHx/6CZsqd1L94junNgtXO4EIvG6hh
	B4pnfdA76qPObRgxpjsBBkpDy850lX6pgoJUjg9FCw6W6GYkhrLNZ0pFJZqEPTJ7UsY7OkpStci
	tUQsOOMqPh/gQ5f9Jx5/O55B65JHKUy+iNE5SvGs/S/An0Q754N99h9upagRrAc3DeaWD5Mhh0c
	KHP2VMkqVaoXKCjMCxJnxzoR6Zxb4RQ4RQkJd7rEQlk8BGFoekIdNncIdjFUYeTqCdFdHoONWT2
	qPFlkCZnyFckbh
X-Received: by 2002:a05:620a:3715:b0:93e:c12c:9dd3 with SMTP id af79cd13be357-93f29e0afd2mr1290429585a.83.1792421456896;
        Mon, 19 Oct 2026 07:50:56 -0700 (PDT)
X-Received: by 2002:a05:620a:3715:b0:93e:c12c:9dd3 with SMTP id af79cd13be357-93f29e0afd2mr1290423885a.83.1792421456391;
        Mon, 19 Oct 2026 07:50:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a434ea1sm2164210e87.41.2026.10.19.07.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:50:53 -0700 (PDT)
Date: Mon, 19 Oct 2026 17:50:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8250: add camcc interconnect
 cells
Message-ID: <usade5zkrncpry4ufbdtaahoa2zyd5hx7tjgfvzfte2aqbkgs7@t3mej4maj6za>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-4-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016170701.1504338-4-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXwl5ejfqV+7mr
 tbyO4CGxIugZl+p8tpCGSG93KE7iSZwhPXNa7QTM1arj3/HgFETyx3z+0OOGJfFmMExMmrjlZAe
 hFTv70GVUm9a1EDTLX8lb83SdTzXcqc=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad62e51 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=k6MwsNlTf8-CDefABFAA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXwkIXmPYdpleI
 fMyxob3a+UUfx3Eh/8crY/uL8H/G9IaiOVq3/a+hqvKmBIteLLDhdthJZurSI2KVPzwu76YNiNG
 gfJsLDA0nwDZLyFFHZRLVTMAuZcAnplj+vA1b2GJq7ULQ8PYT3FdeES95OIeM7eAEHmSnZQWVmr
 wYnctsxQAu0UkxmBbPSbaFOfgnxZyDoOrNWwitVp+lJworEYaWA+n6msnbpd3UfLUyGYnniJtPI
 VoEvB1woLNn0VncB5XVJRlFG7fInRerpyHYMMublSA8Oln/aKbkzSKrDZykSjFM0HvypEX8L2/T
 sM7eHOb6Rb1f3+CYUCBw9j8aG+o6tMe7N1j0bzE9Rm9csSdzrYMQ1wJNWdbxyOvsUDqEd27yOEO
 APrPBJqv+2sJ13HrAfR1AVveYMDAmT9Qh2ubBQOJlf0ll3XUhoThVFW5R80I28FlyzCWOKXSW22
 efbGn7ZhX1vqHpYhdlw==
X-Proofpoint-ORIG-GUID: VTxgyZ5p7DZ_zYrVpXgta-GAlLJpnhy8
X-Proofpoint-GUID: VTxgyZ5p7DZ_zYrVpXgta-GAlLJpnhy8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On Fri, Oct 16, 2026 at 08:07:01PM +0300, Atanas Filipov wrote:
> Add #interconnect-cells to the camera clock controller so camera
> consumers can request camera NoC AXI bandwidth through the
> interconnect framework.

I guess currently we have only one consumer, camss. Could you please
include patches converting it to the bus voting? Be sure to retain
compatibility with older DTs, which don't have ICC provided by the camcc
node.

> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index f975c2183269a..e923c74dc1435 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4675,6 +4675,7 @@ camcc: clock-controller@ad00000 {
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
> +			#interconnect-cells = <1>;
>  		};
>  
>  		mdss: display-subsystem@ae00000 {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
