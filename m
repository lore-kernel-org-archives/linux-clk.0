Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454733;
	b=Yo60RllPDO2QtqTYGtTBE29zjYkbBqzjv9brfXUeWC/y6jfbQ3XPOnMta/GkV6xGKZrp
	 CIOrlIAQoBDYaDwq3pNnlLjaSjJz/cJKf8KfjXBZqasQJCf0ihLBS2BPSgEMQnvS5Q7wr
	 fabfMa1Ev4MNjuqo3/qiXadbO12xJkLnvgXvHzq9NLkEMUpnccU54e2wy7Hj2bSHql92k
	 0DDu8WAkRM3QtbklT0p1AFFJTU0vjZgDWC5amDBIVPJV/oX+YUUEX7tg7CmbVKlz70p9R
	 Qd8aLtUaZHbURVbIkJMWxkCiZLZVGEYXV4V9DoNSSVcS1d7jm/KCrVpNuXA7H7PemjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454733;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lfhg2+/rNBhkH2W0arnD3tR/lai12P2aVjqQX7vl+Hc=;
	b=Gbu09EbSQXt/Ob2bXlFwglOyPFNOXMGgHcO1kyTprEExMZoxgqe4t/XdJnstVvq6cBgj
	 tDRdFOQuYchgHV7iAMwRS0h6oVInNzhtQ+dm0sK1MSLWmGVdqnspXlwRo9cwbkPA33jFK
	 6/J2xqVwLdfYrQIQYzffN/W+bNIim/kFqEXtWeasaIpGg4j01XxK5y6OpAk+G9DUVw6V1
	 zYWJXK+k1WbKUVPnq4LsQr/+l/mjihGw2fh+P4IaOkO/e3athM6v9N0NR/psdqD4Eg801
	 H96M2MiRxOBNqTTsnWItjzk2UEkCh3W2+W+WMULMVdZNyIU7lUgR659mZQhVFh/3/KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ES/btqeW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IRw1kSt7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CA7606A31A
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 17:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2CA7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ES/btqeW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IRw1kSt7
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGt9t2340269
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 17:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lfhg2+/rNBhkH2W0arnD3tR/lai12P2aVjqQX7vl+Hc=; b=ES/btqeWk9Ry0Y4v
	sPoVsd4C6na0WcfUDwzbpyMtnHs5bhkYPybKr0Ecn5CNPpAnGtJ2KRoTSefgpWvb
	WhW4cG3J1iecCApouM0FOxcwsEPDtC/Dz+JZXNw+eJ+pABSjSMhYtz59XtGFdTeD
	d0fR+0wd+MQXKA//TVuDVjOYxcoUdchjCyvRjRsu/RcjF2KOoLQgHzN/jOWEUilb
	cY4R496mMi+8iksuU59eHyMhnG4+gSRDuR2YiBV6/Pwqa9Kqzw2Fp8Cfgk//Kqx8
	UH5imSinHWeiwAFLJ2drOD3iW/aTwHN3iVnrpD8swI+eDjvTGggOp7mbUBRauXCC
	Vue6Iw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx2spa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 17:25:31 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99af36c8b98so40412241.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 09:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454731; x=1796059531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfhg2+/rNBhkH2W0arnD3tR/lai12P2aVjqQX7vl+Hc=;
        b=IRw1kSt73pjEXYwJdclzKQgGlvG7nnxBJ/HytOijac9G7jNTPElk53F3x9kII9r1Yn
         CO1pum/eIjjS4OM+EZL2yMK5oXbpn/4qlTZcXRRc0Yl+oxI0h9qHAC5jdlUficg9L+qp
         LPyPVTBqvLJHbTt6VsipJ7gVzRfzq7deJC9QNLCfoC1HZHGBn46a4FwYH58yCrBFsn8Q
         9Zhm/+KWB1fy9sZTGLtklj/ImEvRizE5gMORGcpkuPZJRHNu4AgKNHaAJAauO4MO34WM
         WoyDW7p8Y3U3tMEmDrf4nemtv99eNd5Ban3wGfyGPenvxjjcRlVHHMS6lbB2WpON+9i2
         73Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454731; x=1796059531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfhg2+/rNBhkH2W0arnD3tR/lai12P2aVjqQX7vl+Hc=;
        b=QsRG7LIQkhEY3HvX8Nl1VrqvBflky9Q6NFa12/bYY3QwipHDxHz4t2fKpBpyfdbhdx
         sJLIdhLdLYCWZ8J69iOE5vFSFkqG8LqIyF6DwYkuJUTiM1csbRyJchgWTo6qVDbxJQtI
         Ibo/sIpeQJlQ5y+9A6yr6IaHg+/FDr8t2/iZTt8fia/FQoc5mOZVp9LBE7mj3B2Uaj7n
         OVJAmBnm4fm79BM22n4O/DXCzGj163pwuMOAcLlKJctcQm7Z3nfv26ZfEYhT9uR4G5fR
         9MGtDWJRu5W47yur3tV4H59WdnostqsR0YYeo0LAPLgs2bHpWC1aTj7Qd7s6/0eHyEZB
         Pa6A==
X-Forwarded-Encrypted: i=1; AL+hErEl6XKexZuapjM4QBSHELsdx2+vUROkUzpdHdP7THFafNKLg7G6gJs7q61zHEGhcoP8pWme9aq4qW4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K52fy5H/IQ5/vP59cnXXZ78N818fTLiSGkbXoRB9a3Pf6TFPr
	fH45OAgK/m84MtLB8lDHoAOUeU3ydv3vM03p/KsdSPnw311ffw9MxEa9Tmtn/1G2Sa3Y+9Mudl5
	ZMKfr1ijKrcwH1DbzR6Y+xhTtvbWNbcYOeJUaBEpmPyonjEu2BxmB7AHHs7JVFtY=
X-Gm-Gg: AZFdTZc2XiYG3fhiR2OmZ2Sfin//kxuFu8zLw++BmEykUQSmAD4Gju/943zXCB3QxKu
	9czcw84Gk1ZylCL+eomo4tMqAC0U3Ds3lXfm2R+WxC9u5tSNRrtpIQgULs4Z1TPL8mMjE61AdRy
	fxNVjCIu7n9GVWMf7KYM1OouDLOhkmqkov8/TJElTHe7BZVZYux6HKDOTA8FkVtrazvfKSaIWJQ
	OyIls/47FWiLZ9lIDyfh3XpAxhDfcZagcHdok0kAWgOcvvNFzfbqL/eGF/mN0ve5yuXvYZUPlT1
	q+Isax91dzom6FzaBQLtc/rLp54GgdnbhsCm7G2vt0w51cfFoyO1uJGYK1bKDfMDze0PBo1s4l4
	HpxEt9M6YN+sXDtQ8bY7xeTHn8JjrEh+GPbAr+jqjwm0ldkHplqhDHNnVSlQ9I094SlaNYj8=
X-Received: by 2002:ac5:c00a:0:20b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ee8af8d7bfmr7450525e0c.5.1795454731017;
        Mon, 23 Nov 2026 09:25:31 -0800 (PST)
X-Received: by 2002:ac5:c00a:0:20b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ee8af8d7bfmr7450472e0c.5.1795454730544;
        Mon, 23 Nov 2026 09:25:30 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm432664066b.63.2026.11.23.09.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 09:25:29 -0800 (PST)
Message-ID: <97ccd0d2-6410-40f4-9c0f-c08931dbeb10@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 18:25:27 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
To: Hikmah Gumelar <hikmahgumelar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-3-hikmahgumelar@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123152722.168879-3-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04770c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=2S1_hLxhzeHvXZh1LqAA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: ggPT4Du3kXGE0voRPxsSY7XHYgiOVZE_
X-Proofpoint-GUID: ggPT4Du3kXGE0voRPxsSY7XHYgiOVZE_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OSBTYWx0ZWRfXxKu2ofY7Si9K
 DUgMVTiMgwL1vCeMS2vUPwdbPNrCHAkOKw++3xSKrmOGac/4NLig9tK/gQ+5I3TnaTlZgQ+tbaZ
 q7FK8e6jnmfQN0WJTtI4Sfwfp+x41zI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OSBTYWx0ZWRfX5NhUdJu24mov
 RhziQAUB4e8kYoOISCvkCAnmHpjP3uKwYcbFZrtFbjmIEETO00rMYnWBxdqZq1JG+D961l1ocAP
 Lte5YmkvZyBazd07XcRWTcJUkxkmfb0HK+WXfUEZVg2f8cC7C2AUsEgc+VeOzdwN97D9/mv7W/y
 vqhuyO261/Q7kih59+2/5uFuqM2TLgvA9Dn2RzV2iXX0nj0g2EFPjCITSa/7TBvZfuH+6+jWnBg
 6tLcI9KEwL3nsAaJ5njREwufDb+xoPRTmHPQW76febe+djCgy2CmPuF5CsltyRJcmSscUBWWXRq
 wGjR5EvPId/cH3NqX/qd5y16ewBQzZnjjRJrPr+myQZt7mLwLbRVkijwkXKYqwTSyyU3+ahTpgw
 cSZLwBmuJYmAM7ZMUeGWGUI+5Zc8URwSusBRtLtVCGQbKsvRJQ45dI8zQNETRM1flCIM7xiiHMa
 y7nP1mKxR3S+TEp/+Bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230069

On 11/23/26 4:27 PM, Hikmah Gumelar wrote:
> Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel MIPI CSI-2 CMOS image sensor.

Please wrap the commit messages at 72 chars

Konrad

