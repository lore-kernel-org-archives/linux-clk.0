Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170013;
	b=BWKOTVBlpNkLl1++iup+q6NhQj9p43TMmgMXDIN/ZJYuXAZVeGS79jnPDNPqDqGC0dAr
	 rQFxXFEcSAaBdRV+OCBZs8A1A7zaz0CcGsueirm0gwww8CsqwcIKNa68nL+XYBw8R50DC
	 A8EKUlsO142TKJq++OXdoASXc6ASz0wtp4+kPrbQgOHvRFFuczPMnUpgERw16yDpQLJSt
	 Ycls7bYPEhFpnr5C2tLGcTbilqogvaXmlJpl8J67q9p411IFsFCOpSGZdCerRzxXl6Sh/
	 UEmuL4bo02RPE1wbfx0c0xtcwIHKyIJDajOe20JLIIo217u262Tx9+Q+DIx1rWzMJbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170013;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v1AfoyViWtDD/4lI7K4bWRLDy0Fh89oWvLdt+QyBGH4=;
	b=3qJZOPTIGEciCh/RNeXe7mcDWQ973fO+AXHLl79b9GGSqPPrr6c3r64ZtSVu9VrODv7D
	 uJD1b+/jUId0caQzt/WOLQzpbvWVOZ2FqWSUG84roXCN/FscpKMEU+UL/XD0H1aKfTd/j
	 PVUEH+l3O6j5NwTFlqxmdn+HtArikW8sOlmdfcZu+UbquCck78YLOr1jazbjC5Dtqopca
	 duKN8Zlu3Azs8rVAawAwqEw/qxAn2ga5waRtodSKlGXTK8QDDsW2ZDJyFu+XXojfkIVIk
	 zLKpA/QVmERVhFHwzeJD6Poz/jQQNxjtBTa6u2WsdHu40goSmII0BjB6dESrymkMLPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqfW3Qxo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T0FuPONZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829B8606A32A
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 829B8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqfW3Qxo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T0FuPONZ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fqNX2695555
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v1AfoyViWtDD/4lI7K4bWRLD
	y0Fh89oWvLdt+QyBGH4=; b=ZqfW3Qxow/MIYLFjJEslozb1q8p2G63CkuN/GhXH
	Gv+PQKzhpZrRadF7sS8OwDEBkEO2xWl3qJ5A3KLoeq3DOPgxRED/xcDFImuk2ZNp
	xE0z8AAsGpoVjqeL8csE3lxl+jAtvSRWeRBwuXraM8VBaSXVFtHIEom47Dmaq7cN
	jHQLSVS9J5GOTPTxn6khc0SBLYmtfha/bQaWP4l6CuJG9s5QB8tVkyM8oG37BfEw
	FouUvGbdbI65ET1wLaRCHt+PBxoy/0iktzL3Ix1AltI4+ljhH9RhDSdpCXmxg+tB
	pnZrDEP9zGEksOVzrhyn44EOGUsTZWjXEYcpM7xBubePVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au36g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:20:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so168500385a.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 02:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170011; x=1795774811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1AfoyViWtDD/4lI7K4bWRLDy0Fh89oWvLdt+QyBGH4=;
        b=T0FuPONZToqEj5O20Qq/MoJzLpVUdBeuR5+b7XRLxTuzQ4lBFi2KR1gRHOSiN4M+EC
         iZ94N99wdmrDEPgI0b7xXW38cv6Xgk/gmmhLxK+GNlsHK3VgTYSm9VX4+VtetrZqr9VH
         NlZu3ntk9IIIVbbCgehTav3nJnqbafYtUMU+3djXAJfuKFz9OoWqo/n5P6dd7xxFv69O
         CmQKtgwh+oeu7TTttaUdtRMA5z5wz5+1wu31jGrOzmz0EvhCL2nJU0HM5xmtRehK53eu
         AZyPXoLwXPxaT35j7zC8eeNjc3ZXAFahMQyFiYtJVB9hLmNNZRO2OKyHPilQDqHlk5kr
         eFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170011; x=1795774811;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1AfoyViWtDD/4lI7K4bWRLDy0Fh89oWvLdt+QyBGH4=;
        b=Rk2KmS4GaDprojIMSGcW69X8j7Mce6LuMfTMFyiSsm8i6NB3eLD3sxu+u2NLjYTqS9
         eMFCq0q9tVXE1briw7rNzeVLCCkZ8iSULmW4B7Be8QkTaeJQZdHzLmHNl3UZZ8M7qyx9
         y+8T9GKfsPyWc6+HEHm/kPkCGGvL5plBm4+FQ7hAdWhuXODeUV5pX0wDUoddZJIvERUa
         encrVA/MESX7FF39h7v0sR9OvOSaHcxVC+ytxqmYGrifBO3JnQfIdf6Nnqg1t+KXvWYH
         mP0ZQuNprsh/APXazzdsvQeZBXiOAMPxVpdh1duzuoSKlkjHJQloKAMBNoRlfhwG6Q1P
         Kf+A==
X-Forwarded-Encrypted: i=1; AL+hErHuDGftc9uq3easVSHX4OEU3BzfrHyQypIqchOBXN77hZOr54gkrYIqWkO7LqJ1arRbRlZ3vwyspaI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AipPrRY3KPsjD22QkwLCUtI3lHMbiuotaqOuGOAYTlIlt4SIx
	rBmPsKTPR8ErRd1PBtiFBzxlTZ/AgECWQhOnmhxGbFhWgmeAnOhwnfMFHHhZxWUl2pKlzmPzvbb
	Q3JxSWgJisQN64dzBHIU8w/ZptDRF9TsAvIbFd+UV96ajIXvOuvUpzIYvlwdtwQ0=
X-Gm-Gg: AYBFou2cOyJZa1Zmqx7C4JUmX2m+F2Iv3SIEAmP2E2V3txH2Cfydaeg1DIhWZYFy0A1
	NfVF+6GYYC9q07EMHrR6WZ3DEEsHJpXf6zjbIJZY/4Fe2TUFr9otOI5QindfyeaJm+0dijTik6f
	zqXjdKL2VfqKRPCNSQNqbw4I4zDVOtdwZRQde6bnYUxYG5S6uzsxaSdfCBkWc1T0lhxTH/Mxav+
	Qx2qjB95WCjFJGbyQGhjyFiykDfXgqFWNKppduBZmsjTDoVctzbJ5Dy5HlMtnUnqTmdB2C0dI/L
	KYzacKYlFPJgdOAJsV47FiJEZtEeAJSx94Sfycr6iN9fbkrhFdF7yQHVyjEQJAPRHyeU3b7ggQk
	TXHQJL0ppktcDzf9nQExP4JnyWmyEJzKVgLsZ1rFLbpVFS0JNi5IryLirkkaLV5oZ
X-Received: by 2002:a05:620a:271d:b0:949:67ff:56c8 with SMTP id af79cd13be357-949bab651b2mr325636285a.80.1795170010501;
        Fri, 20 Nov 2026 02:20:10 -0800 (PST)
X-Received: by 2002:a05:620a:271d:b0:949:67ff:56c8 with SMTP id af79cd13be357-949bab651b2mr325631085a.80.1795170009727;
        Fri, 20 Nov 2026 02:20:09 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm4998086f8f.36.2026.11.20.02.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:20:09 -0800 (PST)
Date: Fri, 20 Nov 2026 12:20:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] clk: qcom: common: Register clk_ref clocks from
 qcom_cc_desc
Message-ID: <g7i6j3xieuevlouthjr45gsczzq5nppqvwskap7ngxqq2ch3zj@7cc4i75xz4d5>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
 <20261116-halliday-clk-v2-4-28208928da36@gmail.com>
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
In-Reply-To: <20261116-halliday-clk-v2-4-28208928da36@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX8Rjh8RucHTVs
 aKK1UhB+rFyMzpBC8sUKfuZV+hbEJT1rfoLhm4pM1+c48uQoCPCCMsF3K0AoFNVsBJPqOSsvdp3
 L3ivL+GtG5ohrYFYFbyNhAJGIpUIyLwleLsQOFJInL5Vpvon8JWmH4v3zJubF5vI/GUPFSRrHyh
 ILAsakxtPkfQTKCo6GggdLCbx5LAIMbdr8wnjeoHNVCLrm80h0gznXzjYn0DHNrEz634gGHRfmC
 oeMGzl1q1xnl3IUEx5N3nTJha04MbaVMTsY+VkkGIlhmolGajJC01slOyDjOdGbDfJ7UuFqxAHO
 8iWKXAxDKvUS4fxEf0pgkat1UwuBByz+S0e0q585mcw1fQ0VL1bTGmc7hgabQALD3ER7iIaiP20
 X+qfCsUH1wc2ZGBGFi+7Ejn8FzSI9FXC5QegBKNoy/zvOpX3DgxQQbZupY912iGpfrrMr4t2gLU
 pkdxohpEWwzT9Y+0Dng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX8+YNyEBhVKZK
 wx5ZXfsIp8LtE8I0Hd0N2f1mLSucZEi0C0v9gTlB0NhCb5dubSAe7lU9KO0VL7+igdsBjd8IPkp
 BDXqXSbgAlboD/72dRH7/Zf3gsrDaFM=
X-Proofpoint-ORIG-GUID: jf8CctlFS9oGJSW0twq1JVXvSWdSeSSN
X-Proofpoint-GUID: jf8CctlFS9oGJSW0twq1JVXvSWdSeSSN
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b001edb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=wqR6ls3WrVHNmmoEC9UA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200040

On 26-11-16 21:24:22, Stanislav Aleksandrov wrote:
> The clk_ref clocks model a clkref_en gate together with the supplies of
> the QREF block that feeds it. So far they can only be registered as a
> standalone clock provider with qcom_clk_ref_probe(), as on the TCSR of
> X1E80100 and Glymur.
> 
> On Halliday the clkref_en registers are part of GCC, and the QREF
> supplies are shared with the UFS PHY: when UFS runtime suspend turns
> them off, the USB HS PHY loses its reference clock. The GCC driver
> needs to provide its clkrefs as clk_ref clocks next to its other
> clocks, so that their users keep the supplies on.
> 
> Let a qcom_cc_desc carry clk_ref descriptions, indexed by clock ID like
> its other clocks. qcom_clk_ref_register() now registers a single clock,
> so qcom_cc_really_probe() allocates and registers only the populated
> entries, and qcom_cc_clk_hw_get() returns them for their indices. As
> with the other clocks, entries listed in protected-clocks are skipped.
> A clock ID used by both a clk_ref and a regmap clock fails the probe.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
