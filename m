Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F300427A93D
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752163754; cv=none; b=LvVVPM/mte7qSKhYDeT+/1yayGfu47YNsdAsdCPLMqIHChM+Im1uqG2fLAfzGzk1/uzeyzxtjuczqKWjB8Sg1IPJRjYbeGn8WLEwpmbmaIVAFa0LdBahZKQ0p5A+m12oJClHYYJsfLR085XOsP9tecgCP1PEh7i74PhUkr7O6lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752163754; c=relaxed/simple;
	bh=N/aXBvT4CRm/+YYruIbNGAgz2RyYehB6jiUrVJyElIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rW2wvwu2MqH01LspD+82c2cp0ZyIS1gSoYWAvP4yey3qYw8Vl+SDFjDw0hjqgwZonLrJN7breWowygTt/1ICYttrTqxraokUPo5WrPwYhbAptp1zLGWM2Sb+egX+b9Qk6oPigjcWuWCrS5eKSAuRid4SujF/kf5L1ryx9/jstWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmTGLJWI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmTGLJWI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A95YC8016649
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vQ+6ordS2MREHUlH+sOv1F4IpVKnvygDpjQPI9SC08=; b=CmTGLJWINImAHKoL
	C3DmEyyOHxwXFEHYDYwh9nNs9+qHt9oDnwlEHteC1OnCI6yisLYB4/ucmnYvvLrj
	9Gnq6RF4WjuDnhLew1VVzZh/snqX6sLbsFTDtDT88C0KSOr4Jr9wcZPL9Eg85AL0
	Kx45dAtjgRyOnaoGdJSd7P5kZQCjABqt56jZujpaGtfIVeGs0RuMBAUfcJSAXwyS
	vz75sSrZHISd4DCZLQUP/EVxIiXZYB3tRoFHAQTFkBZMnonxyXEwXKUUMo0Yke+A
	gy9X7lG2p3TUYGL40TOiN0KoHtT2U+B6nJ8XwMK+HwSgGGmHgEC7eAMpNCw7vVSq
	VAOVAA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap5k6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:09:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3eeb07a05so12278985a.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 09:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163751; x=1752768551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vQ+6ordS2MREHUlH+sOv1F4IpVKnvygDpjQPI9SC08=;
        b=FXNytkl/EIJRAfzETbYnyQmNipdFb1W+PGpcg7nNKSW/bfZEidfdxIpfKrdkJcnUuN
         vucpSnnbaezXDOS56lGYbbEhoDjnWLeBOFTGiv5BgxWH8bygpmLfLY5qFD4mZO3JWsZV
         pzWfYUfjk2+0DZ/k3PIOY+md2ezfd7LcYw1n9uSXjBbDXpA2yyfHSzvK+OEg4jRoK1qB
         bbGCezz55MRr0ljaTcituXLEeFzxUvp9hF2hEjtM03mNDdWCvYe2Map1I8Af5BN6VlqF
         YQxX3BhL3A5P56YHIC/5kbEfmb4BKzc8Au059rpMOp2Td8wzpTvtnXfypQyQTmbTZIaW
         Dgcg==
X-Forwarded-Encrypted: i=1; AJvYcCVtaykSNYInZkZrxnd51UuhOdSmASNlu8KM3kirmub03n7eqxXr+HAzDD/XN5pvTX772IX027gZQYM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2oacYrYpLFaPg5KWT0xDirNFotQShDP/ygdgjgW/EyCGtwPbT
	SsG6OTaZ+qEWLsH7VYu4vdqcdIhqPRhGPnXMDfvfqcKVkW3oBoUVhZZm/HPVwzLo6gLaXvHNDly
	MFtI9zRfLlFWQ7BbtDP3Cf9VDun2ulU8eZcTtkNIFS4v2SPGhioW2PT6agNP8Yzs=
X-Gm-Gg: ASbGncvixZrYW1k9Y6N5Hcl+yrau+4fy3uSGXlMnt4y+QfxX8r/NGXhvcBoBjDcUmCy
	o6BfCLdqn8Z+UFomUqNLVfeaHj6s2FsLmCBc0o5RYZ4Kht6Pt5aucqWN+VNHs1K7bHpwk1xLFeX
	qFOk9lABIEn9vLErWMJn1MXrKy3EgehMeXkK0jKQzAql0TS2ZbG6tudc8eAyoCZcPNt2CrlO9S7
	XX4xeqVvV7/mQN1K34rm5wGrXfB09xm4jiOaM9tDcWEFk7OcaXqu3UwFaQEhTvPB0d8aDDR+Go2
	f/L+3aYVmB5DhMCDW5R/jfZ9v0BxAtqi2TOn35E/aBszjzhzcYi4HKVc26M3A/CfPWrF0up2+oi
	7Uos=
X-Received: by 2002:a05:620a:4726:b0:7d9:d722:7678 with SMTP id af79cd13be357-7dde82dd8e5mr7282185a.0.1752163750868;
        Thu, 10 Jul 2025 09:09:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAeeRzlvLfbUeyU2SSOBFEfwuLO+KS9f2E54G98Fl8PmYU4woiYSJtTIHX8QfSQxlGnb4YxQ==
X-Received: by 2002:a05:620a:4726:b0:7d9:d722:7678 with SMTP id af79cd13be357-7dde82dd8e5mr7279685a.0.1752163750275;
        Thu, 10 Jul 2025 09:09:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91d10sm153830666b.5.2025.07.10.09.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 09:09:09 -0700 (PDT)
Message-ID: <c321ed9f-7906-4a92-9202-efb46343ee91@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 18:09:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert
 from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
 <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=686fe5a7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=RGHBBWgGYxkf0F71jXEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: MieddHDpAZZDaX_tUsgL6QLp9kbdH6fx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEzNyBTYWx0ZWRfX6LZbE9Li+lla
 kUUSgXRpWcMifzQza/EC6lgaR2N0pKbBkHzEfvnWRBbdDdcJv2E2+PpvsZYXTiVT3F/GnzwJRvi
 bGwOovQWliT/8S/fL+o0LEQMz+1EshEKTNlhl/ZLxZa4wtMOPqWBMVHJMe9w4rpqFpMKcua5WoS
 w/3H88PyIZDTtsjE8l4jqeIvPiNGopkXnSDvQlzJPs3vCxkaqbTrneyVsllZIiUVN9AvArNlhwS
 80DbfN47OI1qgwyMiT1BurTwtJ8gR9HoZ7mSPi+2OagYkJ7cSkn36b/y91nvI8Qq89yn3H6rIZo
 yP4eie3BBLL8vzUTv8XCbqGD6V632v9cRVsKp+wF62wYpe77hxRdj4Sy37g4Kc62oTlwtzp9MGj
 oa1Ql5K0Y59N59tDOazZtqUW2XZcbhTJjnQrmV3YgztqdoI/uPotLihDkwpOVowycDshxE+R
X-Proofpoint-GUID: MieddHDpAZZDaX_tUsgL6QLp9kbdH6fx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=840 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100137

On 7/10/25 5:51 PM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

come to think of it, there are a lot of drivers that can not
do any rate rounding - perhaps we could introduce a NOP implementation
in the clk core that we could reference, instead of copypasting
int foo(...) { "return 0" }?

Konrad
