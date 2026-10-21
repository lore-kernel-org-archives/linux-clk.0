Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599221;
	b=l3bxd9HoVVxhW0ikNcAkIhAoMzbR4pKENGTNeoTbkaYyVL99ZRneXKTmdiucJ4Eh1VnV
	 SzqUa3tmusNnooPGcaV0QTZ+Qdam2GftmVZivxWpw9VI520B0q0MBml2RGg8P+MlH/yWN
	 uF4VmQKgi4RaHR+1gOkdnfnMhBIrdi5t8q9TKDaEI3rC6az7sa1ybh3krkhYvWnXWS/oN
	 r/btWdf3EwslMRRXS0nRWdtnW+9c0EPe/vYtFV2PEFOzyy+aNLM6j4fNQW7wUhcbUA7xI
	 bk5UXAztGoqMZVb+95nmbkJWch3W6gAUq1/GdF3eKV9IeFyqnlueTxgSzcWKQ+ihsQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599221;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MSdcI0cnwQnio07RIHd1iocjpv0ki/XQsjKsPjSVD6Q=;
	b=TsMjy1FXy2X/dMUOfC19tb99fL9NmZqQ0nM0ivw7liYBYPtPQf8gsNCN9/YfdszPLUvt
	 fGsOaUGkjldFj9Y/UwHHXy+dSbyhGLBgUnzQaW/DQ8xmYxUPQUpUrgPSLrrM8vmMvvSVu
	 fRg0esbjjkSToRyEmUDHOzrtzg8JM1l7RzBG/CyAsKNhj+nDZE4qlAGcUziW2cwmekG1S
	 Tvtw/nXvZjWfkldaufwQzkmsjDyBjSZsO/qq4IdfuqPcHAyG2IifBIb0D7SY+dGvr8GI9
	 1CEpI33jQRO/QgRkfb3y5xNX3VRRboaogWk5HsOPY678FC3b7hGCPNVxcvgTWMQJi2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X49dvhdm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dr1KX5/r";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65614607D90B
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 16:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65614607D90B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X49dvhdm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dr1KX5/r
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU11E1481121
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 16:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSdcI0cnwQnio07RIHd1iocjpv0ki/XQsjKsPjSVD6Q=; b=X49dvhdm1Xdk9Meg
	9iHEBDxw43T+t+syX6G+w9CK0ke9rlD2iuQJ7VKforUmMpp+3PKkuPZDHmRAdyxh
	G9YlvJy7Y8ouNQNSCYgJoBhc+QGKs4AaNZxMky2BvaZkfN5lh6UAc716uTroUOc6
	G6jnrHZlJMo0AeAJt1AVsgoC8jZvOTc7AYYfD0gAG/V8fCxEray2rbWCZvYlhBmv
	QgbM3ymx1r1yW43oNKf5TY6tiUQYzQiGEgvbeJO+GG4UOMfP9gRHPeCXJ/G9KCxe
	DTUAhyjp2tvAoqYDps53mEraBd17e7MTDhkNVbbECCwqOIeAYEsXLQO5+A/5S06A
	0RFFCg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs044jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 16:13:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a06da65d92so645375b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 09:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792599219; x=1793204019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSdcI0cnwQnio07RIHd1iocjpv0ki/XQsjKsPjSVD6Q=;
        b=dr1KX5/rRpnzD0AiYJyQtFsFn40szGv3RgP12tlvt+6y/gRTKkjavOiOsKf8l7QlKw
         Wea+NFd9zdOGVrtWxXqAv+MBlA1u9yxYTAqEnKfADg0OtUl49xDsviOnU4/LlGrm4jnG
         RUKNONj5SOBqVdb9CJn2VHbzrtbpLPR9806cXZLjTm3FrelNfMlwp1VkIy6wQYSoRFT1
         d6Vpg+nJ7Tlg/bwsv8wb5SyN1KCczGKV9Ta50TicPxkw/UdR+ltCkYRdelEqtqYGCamN
         frYpty3ezp8aZBM9I6j7wIXYGqvfvDZzg3Lt7EvKMxtp+gAYNX0htyKeGw74um9qmk54
         +58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599219; x=1793204019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSdcI0cnwQnio07RIHd1iocjpv0ki/XQsjKsPjSVD6Q=;
        b=pGXMbeC9abXQifoeUAGK3QMvTo0f/yydI1gkL/mu48+snYci8dfB21vuK7QgRG/3yP
         yLs7hIdwEQ5vTqzNXyrpsbqXqpaPzLUgatVPtUqkiesIH/v4ekJq16z8nOHVZfzTRJo2
         NlCWRevWG9IZzLXFAuUD4e3mp89qT2nOrThvaMBCK8zd6h7lOV4K3YqG2lfcv/xGhqRl
         a5tBaKBPh37p82nieZJOnt6WqaXQ3UF2SzQk/alSpfMJFCcdk8STrYAlDrSbIXx+yJGD
         NxI3U0m70EHj2eKewjk8DALrYxBJ8AN92DWpQnIaQNvf9p/cP0KBKcKifX2rzJiELdNC
         +8dw==
X-Forwarded-Encrypted: i=1; AKwUvBwk815/0eEwqdte8WTiyyss9S16II0oP41rq5YH5FflhEEm2gF80j1+Htyaq6LHHMSnOpTDbSyhViE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUHXT9pa8q1Oo7kF+ZnYECmnhNzWPbzvgGdmJ7dsTBc7HkU+UX
	+Vh3KzRjhKJBE1kwjfB43ybJgylOLAOlaB5bZyedqzNrbakZrClP6vdlPRr+skHs4/AjlOZgv9Y
	X/4IzcvasWplxVaE8xvsV1F8bgd+DccHQgg6GQG8beNcvXpQpxYGdIP667Cl7OpA=
X-Gm-Gg: AYBFou33fmRTitbONtzh1278978PKP0zvaO766pEsHPWk+40Y7vxL8Bs78LqI5l7jwp
	efQJvyqoxeqMhzOSxz0gXX872raAu8jRIYI0otVKIsBKAg6p9+QWbK5GHJIDWGLPqc0vjZFkQ8z
	je24Pg80R8AZ6vYs+QW3I/y3QzHV0bikLkmh/RCEvobiUuzf7KLwFOECnk0mxn1vwSOVBrVLxTY
	I/D0JAGlWJiQv6wq6CJQzWCyXK3tJJfQvSyk9EXQFIr7FE2I02cB24nebej7+pYv+Mm+8XU5Gji
	Xkv85x0M8HiexLtCHhZquAGCNwggdPlznJzGXMxcd4oZPwlB1jtiwmgdyFzkv5dL8Aydyvo487a
	hWvD4gCPkHiKjGShFA2S3cgkzPezRP1/i9PGW91kF3CQr
X-Received: by 2002:a05:6a20:9150:b0:3e2:1a24:fb7e with SMTP id adf61e73a8af0-3e287e21a6bmr2249891637.40.1792599219130;
        Wed, 21 Oct 2026 09:13:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:9150:b0:3e2:1a24:fb7e with SMTP id adf61e73a8af0-3e287e21a6bmr2249869637.40.1792599218635;
        Wed, 21 Oct 2026 09:13:38 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.81.208])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm1131642b3a.41.2026.10.21.09.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:13:37 -0700 (PDT)
Message-ID: <4dff1a97-8c44-449c-86a5-5eac047ab909@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:43:30 +0530
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
Subject: Re: [PATCH 1/4] interconnect: icc-clk: support N:1 master-to-slave
 topology
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-1-fd4c2b3cbdea@oss.qualcomm.com>
 <21a95133-eba9-4655-95b4-9aa947c081f9@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <21a95133-eba9-4655-95b4-9aa947c081f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8e4b4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=rZLzW5DhxuwyX7/NBrPT8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=L14mbm2-ywthVrTR10cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfX4zQ3tJKozxjT
 J5SkzEIc3mXa/gi2zi9IHeLH7+7jPPou8frcDUarKmx4rC4WABpFxJSM0bH2ckN65WRgP4MW2oq
 J1pxYDH21JUbQt1vGahSNxoItZVWy3aA4lm6jQfr+0O2EKRUHa6ZTv6TedZNRXzmaxugNe+szVN
 Ijm/KGZsEjPnhFvZ90owl1vYuUCf1GtblcM6sOHCfQ00RPqighZl0sPyCyN0SpjhDEXC6e3tGBl
 133R8gbQgvbv+K5m34QuXD3pxCV15TJddrNe8TTiUQIUwwDh5PcD7NK9n8u272rWUETb6vV3MIG
 VbI9vSAIb2g7XC2ZWFmitwKZHKVcpfBJCxAEygNQ04v+8TNiRIxljV3CJmvhUHmRGku31zq4Diu
 uTw+pfl6BXGwjD6WHJASUKNa3AE/r9uPuJpxVJYST9jcGSQZ4KAfpQ/x3SqHIr13h1l5EpHu+4D
 TYDPSs+2ADFDige2TnA==
X-Proofpoint-ORIG-GUID: 73o6WWLPNBQcb6ioXqzAFoCqsJnVHE8e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfX80SQnRhM3X9O
 DLdut6nq8vwimcneF/AAXfXR4rrxEx/Goq9VX9oPzhz9jFzGbTZQWgrN08pM+lN2Bx/NiuFzTkl
 LTouPozFPIaaM0/o7NWndijtjdcTS38=
X-Proofpoint-GUID: 73o6WWLPNBQcb6ioXqzAFoCqsJnVHE8e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210064


On 10/16/2026 7:42 PM, Konrad Dybcio wrote:
> On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
>> icc_clk_register() assumes each icc_clk_data entry describes a unique
>> master/slave pair and creates both nodes for every entry. When several
>> masters share the same slave_id, the shared slave node is created and
>> added again on each later entry. icc_node_create() returns the existing
>> node, so icc_node_add() hits WARN_ON(node->provider):
> [...]
>
>> -	return clk_set_rate(qn->clk, icc_units_to_bps(src->peak_bw));
>> +	/*
>> +	 * Multiple master nodes can share the same underlying clock (N:1
>> +	 * topology, e.g. several CPU clusters voting on one L3 clock).
>> +	 * Aggregate the peak bandwidth across all of them before setting
>> +	 * the rate, otherwise the last caller wins and can undervote what
>> +	 * another master already asked for.
>> +	 */
>> +	list_for_each_entry(node, &provider->nodes, node_list) {
>> +		struct icc_clk_node *n = node->data;
>> +
>> +		if (n && clk_is_match(n->clk, qn->clk))
>> +			rate = max(rate, icc_units_to_bps(node->peak_bw));
>> +	}
> GPT has the following concern:
>
> [P2] Recompute the shared clock rate when a master drops its vote
> drivers/interconnect/icc-clk.c:36-42
>
> The zero-bandwidth path returns before the new shared-clock aggregation.
> If one master had set the shared clock to a high rate and then drops its
> vote while another master still votes, the clock remains at the old,
> higher rate: the remaining master’s icc_clk_set() is not necessarily
> called. Recompute the maximum vote from all nodes sharing the clock on
> this path, and apply that rate when other masters still have votes.

Let me review this and get back.

>
> Konrad
