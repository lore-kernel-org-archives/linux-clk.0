Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2373C769F
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782207765; cv=none; b=FH3e8WChImImm4BTJwPr1s+DA3PcvmBedKpf49Y58e75iAbqHs617wbbQES7LIVFop9p6/DwQZ+iarrAxdSdSGKTmfL08ZJ3J8De+pj+kZ3J7/HYEsCSEupeXxfGhPOoRQ9Rwb4a+3nh1WlD8ffBgbl9ovFAQptUSQoDY5f7P94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782207765; c=relaxed/simple;
	bh=2zt4mDfQLCcN7VZdwKtxZoDHgil7aJyHwJKdbeBKs4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uo/6dBP2xthUR2BVQM0TomWmWeLApca7nDvVpGp+ZQG9yaeCgGu1CnCqG+IM7mWFSs3Y0n2GqbF6vlf5+HkTiGxE4wHx9CiwfImYzUmSUu85C+xSV20EF0Btd6UvsrLP+qpqJKs7hkfhBa7CYlwu0/TuT77ElyT3S3PbyNJ0s9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YB/8UGmo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DchT3qzt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YB/8UGmo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DchT3qzt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N8Uumq3243384
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 09:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gso4/eCWqTGK9+zw2V2gKqpch+D4ZfB1l0eAVrB6LD8=; b=YB/8UGmo765MuLo0
	dXdHA69ayE7MXPDuMXJO5te4qaOteA0rpPktiMkss4WuOYCOqi2vivLey+r3TRaf
	2jQVDKIeOZxKis0Z1Lm8QyUyb2j4zRT/fZF/8fX4Yvb+vJsGDtwjmsk/94nqqPuA
	RkmrafsyDgYqPaiFZLco1hdHb6ac6cjZ6CON6aO2OcrrHaKAsGWr7rzdp/wlGlxY
	ZkRRJCAKnzu0GMf+NQ+8WpAy0ezSv40+rCA7wrD+CQLpyCa7/pfGWpAeXCuhB4/w
	HoK8j24/Dg7iZn9ddvMBgHF2CxJGQnxmfguyb6lBLHtblo6MPf9V/TM1N8nWCOhi
	QqXxQA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppygabw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 09:42:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c2c98c1be2so46195095ad.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 02:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782207763; x=1782812563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gso4/eCWqTGK9+zw2V2gKqpch+D4ZfB1l0eAVrB6LD8=;
        b=DchT3qztJF+AEjzIeTnmKTMvlbgQoQakpBFToLIWgTegvCzSKPD6DHpN3oQfaDXA+b
         kMGnbvF7rOIVvNbTCD2JAPi7aN/nBfX4LoDx9tHgDI0q+zraLv1E7EtKMcx+4ogWZXHy
         uigm7lQqVRZ8FJEpY4AuboNza2NuZxVpKGFqpLRAGzx1yVe2oaqCofJk2o3RlIFV5eo0
         GgsYg8jQfdizqNT7kukHixE/aoxIarQJbnCdfe69ZKQY0mvPfmv2ikR+wiH0UwvIvGSp
         dBm5GIgr39iYu9czOpdFF34iVtPk6Bvq/QhQynnxzz0xzGHsF53wS/rSEovNaqP1W1Ok
         awjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207763; x=1782812563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gso4/eCWqTGK9+zw2V2gKqpch+D4ZfB1l0eAVrB6LD8=;
        b=dpVzsrFCScyyLr1nzaWdwL10DKo+mE67UE4AEgXRALpUkmYcD7E+vI4Y57fuSleCho
         Y3JRuAWgraBAIcmDx03dcckl8XQBrKpbJaopirK6Sd8mb2GFRdnIeraUAg4yf0h/0rI1
         fZvsXg8Jdzm8qoav0deG4eS9MT1T2+VDKcl+tm6Rxb6mplX/t2tGO0oL+qiTls4Rr2Kv
         TpHnhbjzOPA0ucZgNTbGrqr/O1evK+pVfZuZ7clfAOUOZegt4vqVOdR3n7VKfr1tk9BK
         yX51aOQvnOgSOZ04eO3GmhafnAqBlbKhdeug+wGpWZGw5l2GgM42y7mY7OIUhrEP0b9l
         ntUw==
X-Forwarded-Encrypted: i=1; AHgh+RoYd6lmzhDOq6iokkB9n3FyA3TxJTEqyHSQsmVRHjH4meTxlziEiTCAglc7RHxHG6z0rBNL+RpohL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK40iFbo9Bt+rJHI9cja+X17ndborOX9Z0LJNcjDUSFeUl9hNX
	xoHkOXqV0Xq1iotPc+qG+gooHF6WEiFidlINYThRFCLKmRfH56AI4tr10/74gH1jZmk3Nc2j83L
	8c3Rdv89VbjALUH2StmzVrm0fKx7UaY20HMHzgYbd9vflv9PeL3z1+wzmYtLTNkQ=
X-Gm-Gg: AfdE7clkxwlUWMjMkfa2Ex3XWIrce+NAlgGNNx0egJ3ogtsIl3cZ0T8CIeHeKcVNFzt
	vO6jbZBIqQaU3zfi9qwn9u6zvMz2mLfMp1K2kaX32oxIq/6Kq+TBnyBsV2EtuXhtswY7rZPZqyK
	0rkQpSAUtd/3Y9PPGRl/0qF536YQWZ1gcbvnoe0wZ7gx/BxmdlnXATLuxALGJM3WeHUGAJqqZ/V
	QiOOu4iPL87r+kJbT3HAWY98EeMsOhJV/6sgqNz7eVjBQnhlMnwy+fxEb5bb9V5uOXUp9pac4g4
	+61Tj9/ambjmodvVPgvBSFYWg9PTSw73k3MOL9/zc+aKXYa1rEF8J1Rs+eYlpupPhuoRXO/NS/d
	KzKSA1aCiBe20r6Fb8XVWewPcqaq8CcssfNKiwwq1vkNDXLsBIcR0pLuJlsOw/Q0ywLtqE+0uVr
	pu
X-Received: by 2002:a17:903:2ec7:b0:2c0:3400:5c34 with SMTP id d9443c01a7336-2c718c879fbmr191508095ad.3.1782207762721;
        Tue, 23 Jun 2026 02:42:42 -0700 (PDT)
X-Received: by 2002:a17:903:2ec7:b0:2c0:3400:5c34 with SMTP id d9443c01a7336-2c718c879fbmr191507745ad.3.1782207762274;
        Tue, 23 Jun 2026 02:42:42 -0700 (PDT)
Received: from [10.133.33.169] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfe8aasm97603725ad.68.2026.06.23.02.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:42:41 -0700 (PDT)
Message-ID: <8b0560ae-af5c-4d54-be02-d186be1d799c@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:42:34 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ethernet: qualcomm: ppe: Demote from supported
 and fix maintainer addresses
To: Andrew Lunn <andrew@lunn.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org
References: <20260623073307.36483-2-krzysztof.kozlowski@oss.qualcomm.com>
 <0247dfba-1c14-4fea-aab3-5489a36f35f6@lunn.ch>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <0247dfba-1c14-4fea-aab3-5489a36f35f6@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3OCBTYWx0ZWRfX4N+2EM8N4wXE
 f20YkjPkes+GeBOuB6/e+mB5WTT8UbNW/HOv3r4iA+I/sxeRNfdiItwokxEBSGhtCAWRaamGCBj
 btjIXZg2Da3VP6OG5Q92cHv4bgsXPw68qwYaEL79YKk5gxfWbUrmBBh6SMI58k5ciSZGFfa63lY
 heX8yz370rJOo8rgT+GlzmZg0QY0LUOc6iIqIXFw4Fa5LSqPjYAN7Gdzh3XMAr0jnTtiMNX4j/x
 FLdWnO5Fce7ePTXq0048sL6HkrmL3cI6fR4He6VqFJBPDgAo2d2pv91QbzLb3Q8HRT8rBTpnobn
 RKQUdoNxld1rCU7IlezFu9PY/5yJv4ukFCeGuQBiRjb3ufKZt0DFy6Ffowoh2NOeLse/A9zAajA
 2EQj2IbByAZjyVzsL6LIfD+B5QEXGKYCZM26R6PplNE3aF4R2HuCuMaIWH+muQxMem+QliQeNlG
 9zTBm7CDh1AmMIMTQew==
X-Proofpoint-GUID: 5AJoSHHVui2C_vyt4brrD69zdMyzjW2v
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a5513 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=HzQU9uYTMzTt3pVePtwA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3OCBTYWx0ZWRfX4odgSEYz5EI9
 T8GcOeRFBFbAoWs95CsxqBKZl0hkRvN8lBoy95u+iCTIUw9fn1q0w+XzBuTrIQ5LFzKGWEZ0U17
 0DFdUW3ism7K/lxeWzYh5nd8R47vVvY=
X-Proofpoint-ORIG-GUID: 5AJoSHHVui2C_vyt4brrD69zdMyzjW2v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230078



On 6/23/2026 4:10 PM, Andrew Lunn wrote:
>> Driver is not supported - in terms of how netdev understands supported
>> commitment - if maintainer does not care to receive the patches for its
>> code, so demote it to "maintained" to reflect true status.
> 
> Maybe "Orphan" would be better, if the listed Maintainer is not doing
> any Maintainer work?
> 
> 	   Andrew	   

Hello Andrew, Krzysztof,
I will continue to maintain the listed drivers, so their status can
remain Supported.
