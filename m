Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531794;
	b=GVhuA4Rbix5pwS75ELeDez6qPjmR1R91DcDElWrpGsI61YI0tKPzxvRrc63AgB4FKZcS
	 RbZmDkHCumFENbi8RtOYLNoc0K7wmf9xp4pI/OSkP6H3ZimIDpif4CIy6qNJkJMobW7D4
	 FSTLlkzRW8lJpHqA97jg2phSYjYexsLDNHS3zN6C3aJQbMJLJUZohV8EkAWJLHbG0Z4sw
	 wAYyLMUJVraHy22lNExDA/gx/qHHWGzF1QaSa4v7uFLaNchGLFyJj1NazTSGkryvxcu3t
	 m1msWZT5EAO84WXdUE0iA/MkE8qYuOi8tHgTeyT1FFRP1fjWPKcqiT4Dk6cvHJzxy0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PGrzHmWAgrXCB3C620jp6z1AC30bEbgyxfWHGuCVEtU=;
	b=KOF/Q9b1vUfEf9zIV7ii4FjR+0v7SMAhtI+gTlIrtDe1OoeEyi87tOSaUjrOzVqgeTgZ
	 s5FekpEs0MjrNxRs24TWGN6aUPa091inGtLe7lskFrsvz+R+9BUpAFbJwL9PZOWF7gTXq
	 t7xwuvXT9KSj+xkB9D4TbJ6UsUkIisODMbc7eCrlPsBx4IsmO9YfOMtZ8LtIeTTzKtSGu
	 NUVSWeQWpN2YRWyCtieNqcyrok9nN1E+zf9UoQLhe+omjESUWas5B1DfYejY3IUWKDDPx
	 5IhgYJpZ03Ce09GW0y/TfOw+pGG46t/9npvbttnPmdb9OcBhJO4h4F5sqxqOrr7Y9+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aYlU1j1z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XILWpK0p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30905606A326
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 14:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30905606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aYlU1j1z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XILWpK0p
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOEbsgI4027656
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 14:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PGrzHmWAgrXCB3C620jp6z1A
	C30bEbgyxfWHGuCVEtU=; b=aYlU1j1zcGa2EtTfI7LsJbCJrrS3ZN4Ee+kMv8zR
	h/Ig1saVVm33mw8dLJ+cLCHBUQxC93D80Zy17XXvv9O0fsF6XcRr8gc+my5FFGux
	6sP2oRKkJ6Ny9HN/t5d/v4BfBjHqZ3FN5/YmjT/vmhWRXR/0S8feEKI/zuXoQvf6
	Mc8BBK/QdEZ0E9dQSng8jAj41s3f3bKA+wn+GISylalh7oYbnUHIVQUkOnznZrm0
	F0iK7A4F8+mETVQ2C3GKGmF2ww0wUyRa+71gaS2apvHBSCz6AUTVxwKltiMDy8Is
	vzVgDnGpHr4HYbSfQhulH/7T9RZlS1zYlDjzJG9i2TLpFQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rha9nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 14:49:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so828376885a.0
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 06:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795531792; x=1796136592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PGrzHmWAgrXCB3C620jp6z1AC30bEbgyxfWHGuCVEtU=;
        b=XILWpK0pU2tbsp6oHgGUMXLhtjb5vGSgtN2w7GuEXSRJrkfi73xN+NjMwhuggnA+tL
         sOcLIQegMjaivw9vWCsHsGZ7zmufoBi9rQgiFQobPSaEUHi8AM0/pkGdYO+HfLT0Ck5K
         m9ezrxinRf5yE8Tz0KGjOfcAQRPz7ON/ytA6adND735QPvmf8DZUJfZ2C3n9WjlvS5jP
         0DCD6Duwp9znS1tFGm9neHBqqAnvTePuPP5G1DETmJAIlBJTdnpFwiKhmV7hlp8zyOV6
         iPmRnmwqcT983TL/SK/tiDH0rR3Rarq8+qCQsyOy+S+IEeJLYXxxqDKEWPFjtOBCXSc8
         8JKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795531792; x=1796136592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGrzHmWAgrXCB3C620jp6z1AC30bEbgyxfWHGuCVEtU=;
        b=G7e6dGuKZGhTGNsSnFErTyV7Ma1q1j0wET547H8+fPdDBuzRuK1g+/hcI3JkaS29TE
         azDpvScwMQyHnL+ktG0jHxH4LjUrpAdtuUfiEnrIcAs79BthOgytjbI6ZFHNM+wka3Kl
         v3m/8BL74HDZet6wATTUup7YQNuvDtomvTnNCQSIEonVPR7rk2jUqOLLJ5o7isdXRAnX
         eo+1QWqYFtAxeY3yCxaSeU1PbaEQOW4eg4v96EREQQucRys/nUoF4lH85EZmHz+6Md4j
         +pKLTQXxIfUu1PC0EoLzH3Q+3/pJy03kiKHTknbg83gLGdcK1hjAA2+M2X1M4MXvrsxf
         YeEw==
X-Forwarded-Encrypted: i=1; AL+hErGRDKGR8phRE0a35YHYvyCxio7UCq1lJ11prsD5kklJhsJj/Czmoy6/JmEzfMECxh1gBniKE1sNf8M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9veo0SajWarE2DS/yLLYgfy7OPkQ3hBBfjMd/MrVWnbP8UarjB
	YCV0CA5A8Wq8adeJekSFE/q7/mnSaKzU5ewt3DJHl4ZpRl6hU9zcPpWw4RiGUVPL5HwD31q+APk
	/OpGtfPCnN2TMFp5iIeqXisTxN21AlFpQdsVMg6eOlxwjrmaQWQTACgwn6i08RYA=
X-Gm-Gg: AZFdTZeIw2qo8vVyfl2c2FlsYXXt0S72YQbY3kah5gcvou5zoQu1DoPwoZFU5vuQGSh
	oMS7YCI95wx0c1YKdRrv08gjReLsRij/4znC92x00/XCsMc+q1SE27yax8JSNMxKFYLc1zV4ZCV
	qwLuLnkqBtEtzbce6K2Phq5lNreeFTY/TENH0vqZ1ArhqcKJ3H7nUYTqaeF+rwF/ffsVMKcqLPH
	VXnTxOR3bnuxzbOJzwcLXwG8GC/eys5EOGPll/9xu1TEYrcJrkKi8otmdg0wbbl4b4HZW2ICd0W
	z9vcZxjeLvpgQPbQGPaF3GUcwk38Kh7kwe0NR9Pnx3NwxFHHplLn7X7np+CbJ5ghH99EkI7Tvsx
	PJmHWCkHMbw3xJBizvWTeanm9RCYNaFtCsZNcjiOoZG6abN09a0hxElz5IXjSJ4Mj
X-Received: by 2002:a05:620a:130d:b0:93f:231:9ff with SMTP id af79cd13be357-949b35ff0c0mr2637255685a.27.1795531792176;
        Tue, 24 Nov 2026 06:49:52 -0800 (PST)
X-Received: by 2002:a05:620a:130d:b0:93f:231:9ff with SMTP id af79cd13be357-949b35ff0c0mr2637248885a.27.1795531791484;
        Tue, 24 Nov 2026 06:49:51 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm228040425e9.0.2026.11.24.06.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:49:50 -0800 (PST)
Date: Tue, 24 Nov 2026 16:49:48 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: qcom: gcc-sc8280xp: Keep USB4 uC memory powered
Message-ID: <l4wgcaciznjow767rluh43dvinr66xgouc6kzbs6rvqu2nzeqr@qoebva5eeudy>
References: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
 <20261124-topic-8280_usb4_clks-v1-3-be083a711eb4@oss.qualcomm.com>
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
In-Reply-To: <20261124-topic-8280_usb4_clks-v1-3-be083a711eb4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b05a411 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Qx1CT2emN0pV8My1H3wA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NyBTYWx0ZWRfX7Ru+RmymivZh
 IHWXooYVQd6DSN+ry3BmaUWMoKNJkV/abjjdXMATQf4+GRzTIstVcpdyrzgc+tCbszdZYItufL1
 j3TOUxugk2ATrgoclaT+7LyBKKbOJnM=
X-Proofpoint-GUID: ZHtdff1SwBZT1w0xbShOSvSGDytRpLRF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NyBTYWx0ZWRfXwpWKg86t9LfC
 ZcioB7BlPcIPu0e93LfXAOpme7LsIwMrPh1I5yWANNcLy1SCyfDHwzJmncWBnj59JBT7wX6HX/p
 gEZnNNm3di1obWgJeiBn9xsIFbGLz39DEmNk7fCsIhEuoVLBRLxSyACRMc6MrdkPGkT2CpWX8vc
 3wnKRdU2owCUvoFs1uyPHONm5leharQasQpkcECIhNf1OXKwxSUk+BT61RICXQroMx/NaEMAOX8
 O/KIETDguB6tJFJsJIAdKQZ8AXwd5pM+PMu7h7lIZKLAH54OnStxUUOksqqz1oF8R2gehhXyg2T
 YpAupdfofrvyLR/Yw1XAqi7mkPmHdw2OCFN2OkdpjBa3mkgJF05VtoN4Sf0L40yXntrkR+8rbim
 WsEwDahAvV6KSKFnNsi66+OwX1guvKDNzi7hhh59wMQHQ8168Y+hi6Y0m/jYhf7yquWD0l97Pwd
 QGrZgR3S5GT6pk0zF/Q==
X-Proofpoint-ORIG-GUID: ZHtdff1SwBZT1w0xbShOSvSGDytRpLRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240057

On 26-11-24 14:30:18, Konrad Dybcio wrote:
> On SC8280XP, the USB4 uC's RAM contents may not be retained correctly
> by default. Set the corresponding signals to force it.
> 
> Fixes: d65d005f9a6c ("clk: qcom: add sc8280xp GCC driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
