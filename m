Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579024;
	b=T+uN3yMuBw0MHfrU0PTyfKGcGgEFixst95v1H4p4U6HKaJovBneweSMpAzUKjME1JAGt
	 Ig3yKHimrpP9/kRiy85UcKjqObhtNviMvB/TSyvtpd7zcstokqge6GSRecuaCWPoiwdtG
	 MoKlzkXpvwaTfIEav5O6JSDtbjx44qVZ3u9C6UeFybKWG3FhlqlyfwWRM2cwbEJ3t46fQ
	 1vkdCnLcK90ov911FzK8xQ14xaPysQ5duoxO3u0aXfNjTJAoimRgojQUUVVy1grpdwdIS
	 4nr6+cD4wUqTpWZ1+glK3D/gFRGOdnF2Y18jO1O63x1Avy/+0OfkWgWbEill7uD4Dkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579024;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BDJTCmz6NRGzzDUbjjpAqfjpVYc95zSzfV9UFDFGTpI=;
	b=wpCRRNGk0T0yUrahDw+18xzYzZUefCG9J0q8JLRwHgQ3tGVyOJfo84XGQbNU1OXqG71U
	 orWuAkfxnpsfHN3CRKLYqshn5qlJhmlQpS5EyQMYMnUxJsPcktiEoHkriTGoWA2VzDC07
	 2HDhydy7YRlXjqNrp83nRZ1/EJfBvOCJAhqQ1ZFjW1Xrz9x9JrY6IKPMtHGggVIlxxR8F
	 16PBait8bxe45uyVmFGmbpDsZ8PXLrwxx8eGXp+lDLfD/XBf15lwy0uh6n9sDv6SSqkUv
	 LcehzMeku9mta+EjvBRAAMHVUMxB61mcNfFzGy8qqjb75DrAgEgx4bkDTipjzFp9Dpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Vp4iHIH/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CYyl33Ca;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3A2606A320
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 10:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB3A2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vp4iHIH/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CYyl33Ca
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5eAr1356945
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 10:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BDJTCmz6NRGzzDUbjjpAqfjp
	VYc95zSzfV9UFDFGTpI=; b=Vp4iHIH/b9Q8rswfYPYJsKAo6rBa1Z4J48mcAa+Q
	7qjgUJF3HlevIxTNDJ6IzOuDTRRTW+HYytEVjAvPmGrA4QLm8/YxZygJNCoyURIr
	WdXV1Jajnj1hTDzjjZ6AR8Qz4KSPs7iOOVrJmOi+qkZ+4+IgryNPxvFAOYbSxzOK
	e8T6lXC4sa+xnzpXYbQUjAtgNsnCOG5ChtmkpTWNpxo8PCBFjkALaWrFQFhwje4E
	D2UQ8vXIsYHNvCqWwUQLQZ4nGK/sR513htDylgxhGCAuHCD1orw0nzZWOBYK/A7Y
	2gMDj6ZiKgnrkxY2JSCYeTNH61VBFTSQzRT00P3C8ejLqQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4ufma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 10:36:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso111458185a.3
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 03:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579017; x=1793183817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BDJTCmz6NRGzzDUbjjpAqfjpVYc95zSzfV9UFDFGTpI=;
        b=CYyl33Ca8WDKE51GLV/8NaGnmzXbXbbc65iseYZf94hhlDUEO1gD6zbllAHeMWHwcC
         /7by7whn3uTE6/r1le3wHIj3DgfUbwAppFQ8RTgvV0euDROxZ7aAc71VWobSLpePvIqU
         hi3kWGVBohXG0Uem7BN+Y3PtwDq4Ct/8L/56yrUS+gVmWwjTd6AmnK160A7B7RI6hy5u
         dgTTY3H253fu1ivRxy7PhlhXAWe0ER8qSpuiFOH63bWQjTXUXUhnigwoSjSyESOVh7ts
         y72yYpTwZ62NNwpOTf9W9XJJlW8Zj9ES7MO65izExkZJGTeOabLncY0S/pmkM7Rd/vQe
         Fo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579017; x=1793183817;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BDJTCmz6NRGzzDUbjjpAqfjpVYc95zSzfV9UFDFGTpI=;
        b=P4IliaExJF1GndSKM8aB8/pv+lEgoK/N0UtX/s0zbY/B2YGMIVwQUE2sZ0NU0SCWyi
         ituMNcvYJn0ZjMLn4CBOnmwmJBX9gN8B0y3BKwEScMASohOA7Czi0792RsoIS6Su9S+b
         FGU2acwCzFu5/94D0UM1N0NEobowmZ5RP6VhYZCdIeqdu2/lYS3L+Ud3noB+LS9xUdN1
         InZ4Y+0zP7LV2PBI3O13pn4crI3lrRevpQ8Nr1S3XwzHXTKfzfoupj7BdvjNZgoPcYdF
         b+dHwAI0ahtNUyGaCJB9J5uPcRgjWqEYyQWjjFI2kCc/Mwvvt+/zOC9Lhaaw+Me4otCR
         HQ5A==
X-Forwarded-Encrypted: i=1; AKwUvBy9uvI72zzqCj7bq5x7RG+rqbLf8aciHKTcRws12n1JittD3HNNdRTvUaS5EF6Ob/OjShrEa7Sg0hQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4jxKgzRxaeBTcASSxOcP58Q26IYeCx6J8ZZQK4BwmyzRI0lfN
	Bj3osrTD9/WJdG7ABJG9XldxehxwTYUWDunEgZk6wdHJRw4Z9pDi7rFkKRhkuuTaJirPHRLmjny
	vWW1EEntIrTq668nv/XOxXSxmGHUK8/NpiKDk8W/M/9ZtEazoi1bf+0W94MNvKe0=
X-Gm-Gg: AYBFou1O9DShbjiSFM43z+/coyrrisuwkvh2TqdYhA/ta+3Q1dyI4EvkHd8v7NFwtFg
	0T8lmgpcfcUujOWjnj1s/JDhRKUV2QZXh+jAotXeYe2TXReinAW7hpGjfIbDmsdPle3+TLLsbL5
	4297E3l+RaEvlMIU5g4ar4EfWa0NdnIOo1ivHkyEsOvAY2v7/CEcA7AKDUUjcn25kex64X7srt1
	pksnHQ4bouQiT6+yD1fJOsvhN8BJP/pIU/jV3E7z9vd41qI134IscpEn4TINlXwk6UkKEXHkKid
	wPvSei588uzgECoLsOfPbYeAGWX5DoQ+UcZp5d5TtbEjMwoIPfIKWEVJwxW9qyw3mn9dgouh3wg
	guX9r937cPtUwUWql
X-Received: by 2002:a05:620a:4452:b0:93e:f97f:f245 with SMTP id af79cd13be357-93f57f4ab04mr324735785a.30.1792579016812;
        Wed, 21 Oct 2026 03:36:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4452:b0:93e:f97f:f245 with SMTP id af79cd13be357-93f57f4ab04mr324733285a.30.1792579016246;
        Wed, 21 Oct 2026 03:36:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a20049941dsm20742025e9.11.2026.10.21.03.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:36:55 -0700 (PDT)
Date: Wed, 21 Oct 2026 13:36:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: fabricioakio@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: mmcc-sdm660: enable the parent when
 pclk0_clk_src changes rate
Message-ID: <mi4c3ld7yjptbubswccnzoq4xrlbj6yj55fkgwofnoaukzbmlc@l664p3rhjcmd>
References: <20261002-sdm660-pclk0-parent-enable-v1-1-d6ff889144e4@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-sdm660-pclk0-parent-enable-v1-1-d6ff889144e4@gmail.com>
X-Proofpoint-ORIG-GUID: W-XH0Wh7yDY06HaER00KNOwprF1YWLGf
X-Proofpoint-GUID: W-XH0Wh7yDY06HaER00KNOwprF1YWLGf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX7CcS+U7La/e3
 kG56rb6trEVBHsb//swYiRKijGSpYY9czV/nHkmYcjjyfxfBx11OJwmqH+Pjv89pFNh3YISROVE
 F+q7EEnXU4DJbFWVqC+fcbXZV6f3/8I=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad895c9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=NuZgWczD4kNqo5kl0xoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX0Gwr9Ki+/OkR
 8WpKPCt07pcHdw9glcgs0fqJyTdDMlDs6iKpNb8JucEZvzbyKNxYB02iVcmcI10S3b8TTLD+OMR
 RJ9KfOTb1zKLJBM9CwkjuNJq7xJnMXijrNNQg0rzVw2R+IShYupL7vUkYUx3TgYayMmDBYGR55L
 mmuSIwOVeNj7mvohHL7dYu8J9phMiP3YN75O5Mk8ammmRJwJPWrWpH0oX5GOX3aRd0PMyRcbznk
 oh6KB61AvK2TJjHAda9cASPeCcmBi+ng060y2xPP1GyIT98bgzpSpn4LRazsVhpHNsMUgR8/w+I
 gA9DxM7s4SYD1PSOtP+v3DmigETVxE9Gzi0Oe+p8lOxlcIQdfBWMPSXdWcy9j1Kl/zyAled6c6H
 VWOQLO/X2kFVUDoeGLO1Engf1rF9uq4bE7yyF4TbXQHD6DrvcYAk2p9e8iTDyaJhUT++B6HAO/A
 pVCeAfRflo/il8X6oqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210042

On 26-10-02 10:55:35, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> pclk0_clk_src is fed by the DSI PHY PLL, which
> dsi_pll_14nm_vco_set_rate() resets and only clk_prepare() restarts. The
> DSI host sets the link rates before it prepares the PLL, so the RCG is
> updated against a stopped source, and if it is enabled at that point
> the update times out:
> 
>   pclk0_clk_src: rcg didn't update its configuration.
> 
> Seen on a board whose simple-framebuffer node lists the pixel clock:
> the RCG then reads enabled at msm's first modeset.
> 
> Set CLK_OPS_PARENT_ENABLE so the core prepares the PLL around the rate
> change, as dispcc-sm8250 does for its pixel clock sources since
> commit acf7a91d0b0e ("clk: qcom: dispcc-sm8250: Enable parents for pixel
> clocks").
> 
> Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
