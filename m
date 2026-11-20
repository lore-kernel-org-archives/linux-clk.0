Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169278;
	b=xZgtnYmGOQQ071g61NFwVMal0XdtvjbE/ayuvdIGAQHlLVwcAAPgEa3yTill7EXqduno
	 iMQz1lBEDFUVt+GbqtRPHoU6tKpiewfO4arZD8nOBLhXYDb1cbPIVWMoHfnWyjxYn0aT+
	 cT4un+Powwkxe1kswpWf0F7c+j46iQoYynl/+g4IqPJDK7AwCXGJQScGnzEmqd5G88yLH
	 XVu2xBy8eZ0PkE6FDh4tkEtmMyG9Nc7xOJle7Q8U/XaLp5reIccuG2km7B/H6ciCWZaHZ
	 LriqRAFm4oYGT2vlhcCbxpliVKFZZpwG7Xc1W1ktMJjCeNohsYjZmD51I6vyf0hgb3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mG/rT4UghNUXT3K+3KmB2T5hQ5j4h+o5zz/Q6dODnAc=;
	b=Gy/2Qn0jzF0TAQVb5EgwDePuNFhjFx+u/7SYcNVFucHMsFatT0/wPuFzNI+vLoTWH/5Q
	 BVikoOoVwsaO6VhMZr2dV8JCysRTZws8MxvRTQEf4AW80CUEELUV0Q4IqjwBm4n5q68pi
	 5sIxc6XyxODBi5QJjfyOL653t0D3EpuoXPrxr0LNY9m2egYJ/+CJ3YMlh2m5uGgqsJ91u
	 VdABwTBUUmggsH4j1yEcQrTHoYQ57mesfep11Xp2y9vBPvM6no8J8DpQ8DuSuxPBczc5/
	 XgtdosI9ccqt5edaXb2V1HnRR31Ocq9IEXIMmmt5m2IhO4bNYje1N4KTrfjUmnR2jZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MqHRQxxi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gR/nZ5lW";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35C5606A332
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E35C5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MqHRQxxi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gR/nZ5lW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7estK1048783
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mG/rT4UghNUXT3K+3KmB2T5h
	Q5j4h+o5zz/Q6dODnAc=; b=MqHRQxxiczegEAQZBfwxNU22C/SoRCgiQ0fJlCqv
	/czQxgk9Dt6LpUggnt5Eok/C0MnS3wuU01IFVPJSnQUJ8fLmi9gy1cQBnNGLF0PE
	1exYOLwsDYM1VmVyAHfEoF5b/dCiXq5ULZPb7FrzG2sWwsJk4EC7+wCvAZPvj6Ij
	tkJrZSBk+4X3/JDGM4LDTyzF/PsK4Z1Dc17+AXr/sCi+VnQaLD2Nja+qpUnVkNsx
	DbOZZiPjmFXpUaDdB5AddWMI8UI1zOxNwiOcZB/zxq7Ccl0pO9xvoRyBKPtHLiQ3
	c2cdxHU/B3rpF2ArVOJMXHBA7+xNE3DExLwrbJ5Ta6XYsg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guagxq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:07:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9210bbc04abso14867676d6.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 02:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795169275; x=1795774075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mG/rT4UghNUXT3K+3KmB2T5hQ5j4h+o5zz/Q6dODnAc=;
        b=gR/nZ5lWSjrcMVuk7HciyFObAo/bq4uwaY0xR+5vFDlj88VX2vqb8CELmVMI+E6DbL
         M1yTLdwwCtisZ28m+jrobnLwAATeXa4g5nWL4a9ssDir5yhPmI/vEDU7VDlcBbH0CW9c
         2vXSpkqo8Vt3LZ11jSTOfIX5OB3TES8emh42t1B1ASUy4UU75tOQjlc1B9xAwrZnueJ6
         5EoKyFT1cmug5yW/TWFSu5v13z6mMz2hwahxAJSp08uxizNfXehGrgiaQv8hDqnG3CNt
         x3esoPtff44qxh79jt3AXMaeFfGTTL1ONZDWbCBsl3urtfer267CZ6qU+HbuNpPmR74X
         x0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169275; x=1795774075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mG/rT4UghNUXT3K+3KmB2T5hQ5j4h+o5zz/Q6dODnAc=;
        b=NQMRg0G/1b32XhDWcQduqGpEnwzmpGPrcIh5CohoSkpHFalvMNHQEy4oVZRHSyqw59
         n3GOKXM7Jhl4d9mkJqIsjrQgXQMWMAeq7d7ITO0BHrzDTioPMMoyQtoQv2K6NQtDpyUT
         EA0tY9oUk+KZj+fa0CpIy05/WKXRPSBiOg07GcO4R2ZFMyYNzM4X9q+xje04E+IVvPWv
         fDIJ+KshyJqzz3tAU9OY5igxdGAlgBKxMsFphEcDLlq7ZC4pV70nX2DqrUW+gATP/u3k
         RVNoatidWIku14EQtVDytOEd+6w4hFvtCv0QmcW0LYI3lVpCm6RmK8fWm8WglpToRPpS
         cNDA==
X-Forwarded-Encrypted: i=1; AL+hErEquf7jo8JE/LJMad6TmvCkO0+FP/bINP1WmkHvA0LO+4SOINe8z1M/IdZiRtHl6mz7ajB4NGNY488=@vger.kernel.org
X-Gm-Message-State: APuU4Z+y6QD6l9z9oDqNkAtY/i2YQHuMcUzONi9vfMwaRXDjBF0Q46Le
	qAFJ8VHwubNJDyaZ6PT6wC9cMCX6vGYQrV4Lzgi89frcbvCgtDItqhtZl054HlqNsNZTIpI81JT
	VFN4r+t1mqzcwGRdH/qFcgd+nVgRorb3umdW7jJA/2LD/WHSK9a1nZSfN3ESMmfM=
X-Gm-Gg: AYBFou180Y/sbzwRNyCIfG1trxsP3Hhgknw/2tlYOsFGTR7xsmbvsdnDOLWNNhbJpF2
	7ZLlC7YJUIDk4si/0CeC3jUUuSnOPYsNURbism5wTUIijh/hHRW5DbtAvKLV/sTXtoiI87c96hh
	SwCHNTBWVvgMWPeol4mZrTpv/re2HLYscprlZZ9Kw89gK2tf+WjRTrh+Lv0hXNLhgO/0vTuJI39
	4JlLQLMamq0QBRy0iwxv4tp5KF4OAZ05FuoCMaGozRvEAHYLAJLjCKYXg2sPaveqegmTR7kUIe/
	cBQlamoYraeWKuuyE1t8ozS2AoBkTSJP6rxuyI57UJq7ycYU5OKUeZJYu0EK9n3Jd6Mv8AQi+UB
	1fZkyM2MPc4hyueDhWwTmDMNhnGEVR9fhDe5oXxsJ1eQ9LS+nji0qafhwusVkZuXC
X-Received: by 2002:a05:620a:f11:b0:93e:5016:e3a6 with SMTP id af79cd13be357-949ba9c6e0bmr449683385a.26.1795169275043;
        Fri, 20 Nov 2026 02:07:55 -0800 (PST)
X-Received: by 2002:a05:620a:f11:b0:93e:5016:e3a6 with SMTP id af79cd13be357-949ba9c6e0bmr449678985a.26.1795169274365;
        Fri, 20 Nov 2026 02:07:54 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f1b2sm4306233f8f.25.2026.11.20.02.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:07:53 -0800 (PST)
Date: Fri, 20 Nov 2026 12:07:52 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock
 support
Message-ID: <6r52ghmfpdspeeh5ucxbcbcoir2fti4j2pyptdomgwouudpo7e@qsspx4h6hjmc>
References: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
 <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
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
In-Reply-To: <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfXzxNxj4q8FaAR
 6TSMHTkZnVKw6yAjWrsnZSDEqJh+wEfxLRk45DdM7KCj3R1bwIOH/rJGNG9N8pLNlmM/EmmK9et
 fcqV51JFO19J8oT7qG2pTCxTwGRYuWl+d2IIQ0BpOIYjU3NHdWi9lgs8P3fN/ToQG8AzXVMxTiG
 NYYQWooaZ2z6JECoE/Uk6HdnfFX4o6twOowaB5FrRU7mHNIkJDctTzqcyVOl+bS6uPUSDDysZ8v
 3KHn92iD7SK1XMwda4+iTpbw2mGrctE5oLoyUV2itkgFYxxSNwbR+TAiTx/Cen5VTKWhXrMaLiO
 KfN9O1ljC/aknUz4Cp8vpC/6JE4eJXkJiOMKjXrM/dVQgJhfng1iPyDxJsPT7q5hG4ZHyMTlT6C
 aZoUCfy1FPG4YHQrRpTj29+PeUSRdfEjqhT13NHLRvr4XK3NS7Tb4TPTE3dRLtEZtL9SEUlGQ//
 vuSGYBrM0JbtbuIPB+g==
X-Proofpoint-ORIG-GUID: ozim3ths2L82f31KvRIy7LSW_HvHjuRz
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b001bfd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-HzP2oy_C0ZWqF548KoA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: ozim3ths2L82f31KvRIy7LSW_HvHjuRz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX1Uq7ahVge6Yr
 feFmSEx7DwK16Tx5+cn/3fgz7MVy4gMcQLr3dgqZ6zSPjamWU0a6n5jC56Qxh0i08phL6SR3dkJ
 mwfc8T1ahaJWNwfRFs9H0fTWO+Jy4OY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200040

On 26-11-19 22:34:21, Taniya Das wrote:
> Describe the I2C slave and TSC subsystem clocks, reset lines, and
> parent PLL needed by the Nord SE GCC. This permits consumers to enable
> and reset the hardware through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
