Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604762;
	b=PIkTALvEVKOVNcKOLdXI2V9WZR+gx9MR/PtjrvIFI+6hFCCs13hOCBb0dmrNnSaSmGUm
	 jumOwGy7cpJV4nkd2euPGwEtFL96g8JMsvSy4PY6VXRzUFFOqCZDeyDdFby+OEk7IupH5
	 EdXnAFuzajuANXqvLuWjitG/tpjwvXga3JUt3SADtFmvdHoGrofMJgS7OLVgVK4TvfX2+
	 MtU04oolk0x/mdz7og3iddtwzo8B7hSVHtIIcGCx8Ysvb8F5C6OfBnuoRIdJm/eYYQZTl
	 yXJMOob8f7XTBiEq+PUkohvMehQ2o4i7TQBz5HdP/LPrll043v/sTiM0R777HdPycJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604762;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hDG5/daHdq5Qtkg2Awsfb6nndUgxxHZKbiFNsjxgBrI=;
	b=lf23phS1k2mkb6FH376drYHvnewzCEttoBp7ttyNF75WbT1qntuSxVuXzdSSlh5v5goi
	 naMg5eT7mfyXMqdwNfpqu/GOBPpfAT06kRr9cQ/tpsaYOiPZugcwJbPGn8M3r6T89zRks
	 cHPJfCpHQS0WrFFAS4tptQSIXdmFUmhC2/c4upz/0jYMQVqD90e9nW6e55LmwmQgzQGC4
	 WQ9B7Lo78SiWYQjC8mQ/tUr45epc+1DmfKbg6SSm1sjUlZkKh/G8N4eaAWiX9QRIHl991
	 uq26ykb4q1PicflX0L18rNaqXuHAkDWLyJ/UIWt0Izfw+IR+dLWX71rYJYdGdvNQCzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ekeko/cj";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHA22Edu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2547C606A32D
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 11:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2547C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ekeko/cj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHA22Edu
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mN8v555519
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 11:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDG5/daHdq5Qtkg2Awsfb6nndUgxxHZKbiFNsjxgBrI=; b=ekeko/cjanjWY19a
	XvNMHTsNGqGf995L7X604mFLYvlVA/6sOhOJ6mCN2wRzqwx8e+z5aIvZ3LopHqKR
	9+uzmpWVrYG7k/EccXbHcTzm2LMNNggptlCn2Xo0ldbAyHLfJhL2UIYPY0kBjrqz
	HkuENHlhAmEtmb0Qb/x8bHwFzOb7CRqnoj0WFuBdbCXby4ZQpPazRrA2fNl5H4V3
	0A/UZmAQI6NV22TvqyHbupTPu5Cnx0fPEN08wvL/AyzDb2cEsRtdhxA90yzA7nVw
	IoAoPCqrSwpOEXT5h5rwgYCWFEJKn9rhfdiXbLDzg+5bUeJP91WBV9RVZnNdA345
	sdJuMQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnrft2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 11:06:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94961ed97d6so976338085a.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 03:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795604760; x=1796209560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hDG5/daHdq5Qtkg2Awsfb6nndUgxxHZKbiFNsjxgBrI=;
        b=QHA22EdulviFb3Tnn6AKaTFLWIhSQhxhgaRmYTBygRolOpjZ7bkjOyvsQFbPSxRGae
         CB6/LT1u1OaX0xymbTYLCRtXkj63Ey0jvaYB5ryrju0vEVm0hub8mKOV/4iMEaSYgqY7
         VYJGi9fnQzzxV6AZ83rXBjM+1RhdSgpTqPRgvAMeFQE1anguB/pc0sMW6C7mKTgEMsRY
         O6ajmHa52LtQyvqcW5R3a1i8g0PytGaI+qb1lOgdQ5eR/MF9+hJnYCmUfmRH6gojYJ1H
         bcdgQmuq5n3gm0plvbfzyT7BMNKqS0UpT5/PkSJr/bWTMqtoYiVv2QwUvFLjN3LGGhr0
         4gsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604760; x=1796209560;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDG5/daHdq5Qtkg2Awsfb6nndUgxxHZKbiFNsjxgBrI=;
        b=gJjcWKS/DprQ/e+4nFEz4e1+W+Ej780vagcxR0Dic1+6s9LFjhHlMwGMnIkG0PoX/B
         9wWrxjTPgSb2nSXAWzeaW2uuly5zL1rcQ7GEWfYJz6OAK1SQqDMIn80m01yd+l/388aw
         cEYbozxtWE3FQQnqZo7by+eEsHXz63W69lEWQ0VlSHSnn2SHHKF4PCBSjgRs85GPjbVq
         lCoCGKZ+RVNYjnh7VD+/iIjDMtlJsaH65vcv5iL/5B7IdDwcrZ5YQPKuXyuETSIQ1jxQ
         UeAJL0SOrQpu7G9uSp7CQ+1L9xg7z3M80pghKglXnnh0QrZCIhlsL9RmHFREFAMcD/Ml
         GyLA==
X-Forwarded-Encrypted: i=1; AL+hErEqyIpI8/vuvCqWU85XHAChg+2gF3vOoedFdWLj/njII3ZwybqEnmiJ26zxXnABMfFNtsUIqTQfNDw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fnJfEyHaDudY0J2VjQsY6tgPFVPX/8XFi9escPQ9TzPEV26fN
	ATgkljB9FHsCsCAMiJ0nTH6gjSjbBeRkVn0AQUSN0WohIK07hbQcsZnq97d1LcTB6OzAPnxkAab
	7TV8qC1hv/4im2jCOPlVibId8O3yoo6ClAZfw6rdflj9O4+CITrw2wO5BIE1z1Mw=
X-Gm-Gg: AZFdTZdepdgdkBIOeg/qFkb1g5SwfSCOqvLut4XryudUT+ltPz7O7aQlzYegL4oFfkm
	/d4T0vtPhcoA/y74RjzvQUCC4nE0azwGuWHVpzGZyvSe+OwKC1bzXMD3rnqbVk7nW+aSLX7OUze
	TPM78yqagVU9kStoeuTTS6zLVvMP9lFkaNP9aIxdEV0NY08MgYFS/gEjGtj3/ZSOlA7LOeH5f6F
	hJES2SVTuDazBPncQwMDe+NTD6kt90PiHrCIk3zsfkfmEspPrwNhOL1Q0qj3EmBdFENKQ/hTGp0
	rY+oIp/xDM4JBkLXwCmEbb0sF0ucsFMkxzYFM6+ffrCgmopUntP4gd6d2P528wmeh3npJCAFw+y
	RMZx4T3Y4jUVorp9eyBjh7n/K3cRWErsGrwT0x99edJSLk81xSmv4FdLzIYCRBPeg2bhlVOnzgx
	V00Xe7ziYdBUC1xNRV4spl7OJ5s1qWhFdpRvsXRaU=
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3260297385a.36.1795604760290;
        Wed, 25 Nov 2026 03:06:00 -0800 (PST)
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3260293185a.36.1795604759812;
        Wed, 25 Nov 2026 03:05:59 -0800 (PST)
Received: from [192.168.1.27] (83.31.98.241.ipv4.supernova.orange.pl. [83.31.98.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm273412905e9.3.2026.11.25.03.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:05:58 -0800 (PST)
Message-ID: <4276402c-9fa4-4bcb-99a2-4556ec59f3d2@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:05:55 +0100
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
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
 <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
 <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
 <c8e53787-adee-4fe6-8a8c-66fab28bbedc@oss.qualcomm.com>
 <403d0d8d-85f0-405a-a26a-54040272aeba@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <403d0d8d-85f0-405a-a26a-54040272aeba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX9QqO1ENWP3vk
 Na0XnVtEtp/AIEKcIY1LL4UsVGJPtxoIAz/ynzojeKz++ihDDI+Izb0OcF4p/rxA/KsFyhZ/Vph
 bzxLm8zNW5z202+3ETDzG7XlabCrXTdWAniSNy/zu+qUXuOco42Vmd7Z/QMouYHybBtzbQVrkil
 BxRepKgUvjYEGF/lEIkeh3vCHcWKHaFJEy0S/z1UFPQOiNOToPLbqXauyhoQ4NUNTbUxMzqoXkZ
 DoJGcdXPv9XiYbrW0Rglp2e1RVPyHRGlpxERkC4+qcTwx0Y4zRVQtSEkYblTI27AIo6knZucWxC
 oPglYbtanJl+SRPQ0sxmao3HobnIUv3OBnNaRfXLK+n2PcNFav1lZDTGiZ0A+8lNLYtKHJ8NA63
 8EnWgYPBnRp444NWQFgXgQDTu13SZhB69sx31/b2+UcxCgSZ6ijlEzoqi1o7kpoIZaA1VZjkeQY
 gg2Cn9FkoixBrBOoveA==
X-Proofpoint-ORIG-GUID: awaf2_jM88BEaoSP2Lo7OTTce11SrDie
X-Proofpoint-GUID: awaf2_jM88BEaoSP2Lo7OTTce11SrDie
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX6OzpAxvSlLAO
 y5hpGvERP6+hezPvnlxI65iKJhEdU7+RnGqaRrR/jnlTIkBheVxHRvy5cMH5IyEhrIFFLxo3PSy
 Ip6Veq6FnVuuC+StSSgHFX+p0bbUs44=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06c118 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ivW4MigAevuCEqTxTIunpQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KmKYLJ3ZcJ8E6AZ2J58A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250044

On 25/11/2026 12:03, Konrad Dybcio wrote:
>>
>> True, not ABI in meaning something agreed between DTS and driver, but
>> the values are used by bootloader, DTS and the driver, so I would just
>> leave them as is. I rather care about not growing this for newer platforms.
> 
> Right, but they are compared against a hardware readout of a
> well-defined value, not against made-up indices (i.e. these are
> not bindings). I really don't like this ending up with 2 files
> doing the same thing.

Not two files doing the same, but one for legacy and one for new.

OK, let's drop the bindings, but then what do you put into the drivers?
Hard-coded values duplicating another hard-coded values from DTS header?

Best regards,
Krzysztof
