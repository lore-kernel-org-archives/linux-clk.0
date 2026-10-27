Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094577;
	b=tY49Mc5SQrQk4jUknf/k72TX7/kisCuc0D9ANk9bTV9oi+6oJYweKjQ5eSzvYgwOYDFw
	 E9/4ls+192Z2RGHTXwQ7JnLIS5bLTQnRbDl4qXwg79YbNVBKdgP0sJMZwx68qD+YsNZSb
	 oZM1xgRMKggcBE9rn77HjbH+xuop5W3BE6fPPRt10YQ74wS71OJOOy3TKyEvexk02GNr2
	 Su5O5HKYxI1iOzBp3NOXOUYAKGqgVsFMbH4g407heItuVDQXspiTKkU75h/mPhuOqbBFH
	 0RGIPsA/zxYWjmdKZTit4m74lDc9QgNy95T2mXICZA3uVjJ4b890TPh+/9r0ypYJ81g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094577;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jt/QmsAqJV1uP8PozVMgbYsAMzltv04Ri/WJZgPNi+4=;
	b=Ww1e5b5+rOXtuLmVtwdgy6LGRcXx9qw49yaCD4ooYOyexxQY70pl36N9UoAv2ZlP3uml
	 05igtHRnkoP9H26hZzHqfx58CQToUus7l4BCSTpiR1rbynKaHb/KpAakFmT/zdfG10LrT
	 sXWbnZ/VZyry/NRNV4KleiNV0D87BId9u7BjBtgT3ak4IhU6Lf4aPXJiLKQ0hY5RPbj/r
	 6MfBvrc6+jj+vBGQ8pv/RasaF5FEEGybIKXVl2GGxGYYPzIuVvv2Oi/xpNDaLyzVL34Sj
	 hKFwFlEoEOr/5S33gqIObbb+5gGpxlUKZvU6hLINyce2kVf3EPBkWgHKQzLRWK8RRAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FP0sJ7tE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hl6NNdQy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDD1606A31E
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 09:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DDD1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FP0sJ7tE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hl6NNdQy
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8gR2R168794
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 09:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jt/QmsAqJV1uP8PozVMgbYsAMzltv04Ri/WJZgPNi+4=; b=FP0sJ7tE4x9HyrGl
	jFkxQXdqYiFLQzzSGStG49wobrGZ7NF1p3Aba6esfC4PTOoKrQSeksTrz8pogcUc
	MToInCj7y3yt7Xe8gYyPSBJKbII2eGYiaG69direbwkZWcdtSJvXYsRvw6J1Intd
	87Buv7yDvfQnwlU6zi1sEo56b918cTiEvsRu5fI5p8/w2J3OV8Bqa8miV/LQWYad
	LyuLM+zow5AupnviLSNuBIBLHv5IVh+7YamG0+d3wai3hpZbWCCcyMAP/LLkHDpJ
	HLXwMcfsoFBUv5KZMZFNEgCNdJgRTq/lxY+kaeKXDkZCrME9qWfcF8R+gj3MRhGl
	rOWZGA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54k5sa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 09:49:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a5971cf7ceso2400533b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 02:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793094575; x=1793699375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jt/QmsAqJV1uP8PozVMgbYsAMzltv04Ri/WJZgPNi+4=;
        b=Hl6NNdQyuH31wKXzChGGoe4LJOAFWnl88VpMkQE6yB1fNU+UZk+choE7EhbjIL3VO2
         cwRI2gE354XDtJBbspbOdbe+xZ/Lox/8Dxwg/kOhvoNnxcW+KqS/pr1OZZN1xHXDDuZr
         YJgZpGMM8Fc+5OoRGfWuISeX3DsqHTJi2XdM8nCJV7lpjyPibXrKLCmg1ZBQfdkujO2P
         mXof4GFBMYTLwb7jyJuGSsgkuTxf1MkQP3kI4iiu4DKhq88D5RGyKttsjMTZoh0j4f5h
         I86rTFbqfwNreZWFUT/kDcQ9rRpyAiFmntZNOZMa/PuK8DtmxO7NrYU+oedckilAo8I8
         vHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094575; x=1793699375;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jt/QmsAqJV1uP8PozVMgbYsAMzltv04Ri/WJZgPNi+4=;
        b=iPCBDpggNZKfejO7ZkXmGz5+givnjfhX2Aoszk14Mxu6CrZRjG6Ix9dcHTa6op+oSK
         6x8awzQdpgBR/PXngmNsiSgFXjFODpLKHXwNGeWAcAJQh++infmN/pUR9TggdZPZNA+w
         7ZI0OfeAZs8FrOwArImze8IwUkUNOY+FWjZoSS9s0uu8SznhUG3nMwE/bHqiNxf88rHO
         fG+GtdcW9d8dWeK4X9p2WLl9MM7kI5Xuk/LhrrF2IDoIL7b9+PAmeYOU9xxcHKJe5drd
         TvpM1uQoTKcvCC6Fdvp6rLqCP97uvinsmoRzQq/f5wbEPV5KGqtGRzbTMk58ITjXG+PT
         aJLw==
X-Forwarded-Encrypted: i=1; AKwUvBy3LFNHLWHN4XPmBzJgz6D5/DEDZif6jzj5xUnceC1iRu9MHDBS3iWwmrAqbGfUw1M28V9me6INN4o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxLFpjAObrx3jTXSAY0K0GHMKlp0prO+bT5dpqdfYQBVOesn1o
	Jrazr4FwfwCTrXFw7G45Eh82XwqXUpO9CoMtL0A8v0+DmO12eLA/GUW8FM7ypu0A26ZKYpIyaAQ
	QWvavSOyqE4GKNSGbxZJvvcbxd2w/eunSNQ/JqqGcWn9TSzjTxiv7UeaLpCZGd/o=
X-Gm-Gg: AYBFou1dsSjTvTAUXl2x0l7CiPzI6Rey6XhaNZ9ivPAzzcaDlrx8n5+eBjDGZ60zxdB
	ghI47GnnrwkaRlUpZzF6Q4GCQdiJv5KZ3GaB9YL4eWy2Drc7cq996Ay8agTyUb5lNEzJ9+wxVe4
	kPKbi8ctH93dFpzgctGO9OTjzjhjM0IkvX9jWwK213lpjwZAy6HpZy1gZqwshUUUr/8Cl+yqRBm
	gn09dLoPuvQNBBfNYgM0qq5iMPQ6vdak6nGgKiPwi5q2F4C/RjaNC5im0JK66QIvL5KQH9x8oGN
	7dsmenL3jg7+OJH1UhhC8uCyDozwWb1ScbqeFkPRDZl7moesrBIY60vN3Cwh6pLkc3iivv5wMY+
	C/lpH+0etFobfnk5bzmy7VFSGNg==
X-Received: by 2002:a05:6a00:1382:b0:870:c2db:da2c with SMTP id d2e1a72fcca58-8a366f6724bmr7261018b3a.25.1793094575105;
        Tue, 27 Oct 2026 02:49:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:1382:b0:870:c2db:da2c with SMTP id d2e1a72fcca58-8a366f6724bmr7261001b3a.25.1793094574626;
        Tue, 27 Oct 2026 02:49:34 -0700 (PDT)
Received: from [10.217.216.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c0fdfefsm2076232b3a.50.2026.10.27.02.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:49:34 -0700 (PDT)
Message-ID: <b63a7285-88cd-431c-9d66-98abd3ecad3c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:19:26 +0530
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
Subject: Re: [PATCH v2 3/3] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-3-fa4364e087ef@oss.qualcomm.com>
 <7a6ef006-cb76-4e4b-bd31-886af708b375@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <7a6ef006-cb76-4e4b-bd31-886af708b375@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfX1I4GeJyx+voP
 PZiNMJbyankNiA7UbfdxI6OPA/o8qvatHIGg5j5FyX6wY9Zo0TrZsB2bs3Pwx6O07AUE2hSGZ7H
 aLql3v8bsiZrCxgCus2RcZX/6ns8I6U=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae073af cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=EDPTx0FvkmN4Oe4_Fv4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Z9OE4kvmKrsyxt9I6u8Gjw5DCumBmI9x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfX7Q6IZvLPTHZs
 T8lu7bKce1e5+L4cO2Ns2sPp+8u0L0lWMI1iWILjgI2F34Nv4JD+Aszja4CaYbagjZpfoLi8PN3
 ftoA2fwtXfxKZr3VbAVq9akQycTYWG45h6QFKC/2Yzghv3udPsOnWbW+ebohS5Y61qrMrNQ0CYR
 Svkv5yZ47MXEfr0H7eJpZbywtObk3g4llr+VKSYn0PwoNbieYFJIsvz8XYJJJvpJfjyhxNUsSQ9
 +EVxO4mHKAl/a17vuiAyooRc1ct4qmOU5IvTHcZpow5OCotSUMjjnQTlaUryIDCo6OrIS3B1IDI
 ojxXJDSs+YS37QxoOD7wGPGRN0bS7KVeqUWX96aaBNEtpvXZ4IAqGOcpLGrLFgRJhNHz7ezjSkn
 PAQSsL5stI5bZI3CMMikLMtqZrDHdmjWENN83HXZ53hEYUURO6/llSBojqizAKcDMdO7tdZoFl0
 Sf3xwwnxNtsllUcxprA==
X-Proofpoint-GUID: Z9OE4kvmKrsyxt9I6u8Gjw5DCumBmI9x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270038



On 10/15/2026 7:51 PM, Konrad Dybcio wrote:
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> [...]
> 
>> +	/*
>> +	 * Configure cdiv 20 for core aud and 11 for core ahb clks of DPRX CC
>> +	 */
> Nit: this fits in a /* single-line comment */
> 
>> +	regmap_write(regmap, dprx_1_dprx_cc_core_aud_div_clk_src.reg, 0x13);
>> +	regmap_write(regmap, dprx_1_dprx_cc_core_ahb_div_clk_src.reg, 0x0A);
> Hex should be lowercase, but preferably please define some sort of a bitfield
> that this value is written into and run regmap_update_bits()
> 
> You should also set `.use_rpm = true`

Will fix in the next patch.

-- 
Thanks,
Taniya Das

