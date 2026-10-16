Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDFC4A5C42
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 14:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159983; cv=none; b=Ka8Ce3L/2LVn7WlmX2GM9is5EdFBqnsVlXnkqXuFB/o+egCzDqSecHiGLhKcyXKRCATXw5sd4wHgynqVxtTqfHB5ZLIMCB6ThxdmMqq/lJfg6ftIEsBrww6ee8XMA+3vyBeeJjX+N1JI7RdHmpYRGBE8ZYYiY6DwofYsu3Wy/5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159983; c=relaxed/simple;
	bh=Lj9okW55cq/izswbCWi5maI/hYgwlh2oddbUEhyXCU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HPlGzGaTVNIxhnvp6llrnvVk3uFvnskId9UYlEoxWQ9f2y/aRMJRw7bFWd9OADBxOEOHbovAF0qdGwx1fpWO8lzX7W3mBIa9lh6rJUlEADgpcp5Gpfzi/EIyWCww/iPwzvhmWD+G3HB9DeuXBW7IYfGzEBU70vd75Iv4G7wGvY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RIpDKy9K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WRR8akGO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RIpDKy9K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WRR8akGO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5hve3506081
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 14:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hi1p+Zr/AI/+p7WdYUaf3hbMm1zS/1PGSTeC4ULoTkg=; b=RIpDKy9KhJbvrrzr
	EgJTfCljkxaFQ+bmMM7o5slaDQonwaCkewjQrKjWU/xSa+SKu0HV9O13dRN0ij/8
	onGC+AVVVNZrIcu3Fuf+RK+6QlLAH+OFbvFtdrwUd67gs9kt7lq0WmFEgqow0gEb
	b8E7FN2+fqFGNTqWTlKxlmC+f+DtLC/eNYTmTV9ItrASTpngMV7/WZ8PtKR+JiaR
	skEM9A617L3FV0q89i05cuWk0F9NtrUcpGDQed14k1dP3Hr/fzj92v+VC/TExild
	BFUhnvXNhouW49jAR6pH5lyNpZmZcHI8sEf9f7wwVyax85v4h7doMo8E12dLmPMz
	X+GWtw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r12wwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 14:12:59 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc081f3066so85290137.1
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2026 07:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792159978; x=1792764778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hi1p+Zr/AI/+p7WdYUaf3hbMm1zS/1PGSTeC4ULoTkg=;
        b=WRR8akGOAqJEasR1xj/nafdVwrugruY6GaiSSeqeoY0+2099M+EFRCLGlNwWoUUk82
         a7lD21UbLiQ8ee6RjFmiR6NVk5sHbwYx+MBbXLEoPh4HPNcoHq0LRHQUUIBXnfzDgLY6
         0vCmuTXdmcPcCQY8C8sHXYdP2IUNh/MNU8M1y61IbiTNt8JuNt9HkfCdOJkLismJA0eM
         0pchP+dNh2qyVp3tvMwSnPEgWGq1NSoMhtQ0oCumZXFGvtuSQ5mp+5XlXXNuMWn1+IbF
         WIfglUfkhtrdGzhfkzZAbtNr8KMrryXWDzpiWFIWu207L1ZkRqT4xhNGXBB26dUeUYYP
         pB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159978; x=1792764778;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hi1p+Zr/AI/+p7WdYUaf3hbMm1zS/1PGSTeC4ULoTkg=;
        b=oV8qNngR4z8/dtQKG6hFlBqHRo5sv43m0W58RpYu2osa8OBVfw2Byg8ci/e7wofeui
         tdPjGXaOuETJR8ezrDDHjVqMAwdrbPWbs4P21oiDWn3suFnXKAhdVaMj0F7LRfpDzKfb
         Rlk/YtpSI35Mugw6VKVwP43n/6aODnfUVLZqvU8R9ceX4hvM8v8/0v0luQsKkWz+M+sM
         qTtlGPazooMzvP8C0PMYacSy2fcEpPy9rp9Dp1i6UIr3VOUDHrcu0/7++9A1o9S+ZBtL
         a86loEqJcjQCx8oELcVMemn5rJzRh2a6amuYecJCh0JxR7GMkYTwcHhKoW4cmqRtueeB
         av5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxPPROReN8Pq7dISoAaMHl0WxwH8ViIAef7KDOvxv0+jc2zn2XcOB5owiTt5NBncbSnqz0ESc1aYV0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiY2H+WbD6RBPD0GMjW+R6oq0qCu5cbj6hoV9nk5BX3Y7fmn8C
	e2KpeTQ2JFFRjQWqlTp4hRr3brGjMTT1on1VFF6gVa4c7g4VHEcUCmijeNZVG7EuJNH0hkj1JAt
	P/oOPbybkkM+M1s0xqH5PQCYULYOtM9aIIF5iUT0JoJMZ+zF2bCTmAIRD4VWH7/8=
X-Gm-Gg: AYBFou29l6KTGiOBpfTPLauIFPRzR3FHGIIyOGKOBat1Un4Eu3IWGkVMcgk9kG1iCD3
	ZUMVW283d2u14gFQkHYdxyHyLrXthvI+Al1eS7xOdJ28YGGAxBPjk4dME2Pr5N31VxoCYQv8lD0
	bmhsO4phEMIadJx21yBAaAGDGugs6b180kPRUHkERNVKwJiCtRKX4WZuzr86uGsp+moUUTq1ZLu
	3v2R2ADCd/Sbrfy7kmZNv+oqRJYeIPDoVioyTLBnA4mSMHfubBiWqnvHZIcoPN87W1g7jReCm6G
	MmsweupWRpcqfvUIhJ/H3OHGXym9zmM0+mvjbCKzEmeZtk+RdnKWaXs9icOhrmC2uDX9759i1Pi
	gvSg6VpLf6fGvX+pLg8faxg==
X-Received: by 2002:a05:6123:553:10b0:5c9:6766:5353 with SMTP id 71dfb90a1353d-5eaaa404abbmr55042e0c.3.1792159978400;
        Fri, 16 Oct 2026 07:12:58 -0700 (PDT)
X-Received: by 2002:a05:6123:553:10b0:5c9:6766:5353 with SMTP id 71dfb90a1353d-5eaaa404abbmr55033e0c.3.1792159977897;
        Fri, 16 Oct 2026 07:12:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb256csm74841166b.78.2026.10.16.07.12.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 07:12:57 -0700 (PDT)
Message-ID: <21a95133-eba9-4655-95b4-9aa947c081f9@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:12:54 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] interconnect: icc-clk: support N:1 master-to-slave
 topology
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261007-ipq9650_apss_clk-v1-1-fd4c2b3cbdea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qzUtXM49C6YjesrviM-igBnxAIf1L1v2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX56gSpJmDQELs
 pcShfb5i4a5V1NrH7aRB6ynga/LE0hvuzzs7oowvkOpM90uN2eAUIjDQeIEq+xLvJ+aEIY+LaeF
 797VKsjfIf5F4Zaf11loMTiD05Ue2oY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX/9fj//CYhxZP
 uWebcSqFiY1tORMKrBiWE1ucRcblHgSRogOzdPyqhbPrWQ7NxCi4nsKUbjayz5TwgpnKLq+hUqo
 HYzC8kpI8NFxwxVqwCAV52LND2lL+U9okMu7ATb7f9vdSeGUr05J2a0LTJHBOh6SnH6l0O0YkuX
 k98dgVSnTHBZYLvgVxA0kX90RIrgrdnj7hb7U1JdhV7DZxvMJMcXdCGd+gW8mfvHG1I1vWAX6qm
 +5c2jcs50CBki4bAKzGizkg1P50/ughG6jpcz95LRoopOBta4hn1C0nIjquN/l1uS6/cgLLNy5G
 g0N3uzqCOcoinI8PbYrc+Hj6tXG0ZFuc2vTP4I1pZOV4W6fsd26EEh9XvHXlwkM2gtqOcKnnddk
 uoZ0CIuJrWyAyAbguFyvBY9A6zio8NxJHCq4LhE7AIXmxOVQsXCaWQNv5W8mACZ7rVbJCmOehel
 yUNhSpkomjf6nKYdXAg==
X-Proofpoint-GUID: qzUtXM49C6YjesrviM-igBnxAIf1L1v2
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad230eb cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=DPFxZCFM3FP1ELaAjbQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
> icc_clk_register() assumes each icc_clk_data entry describes a unique
> master/slave pair and creates both nodes for every entry. When several
> masters share the same slave_id, the shared slave node is created and
> added again on each later entry. icc_node_create() returns the existing
> node, so icc_node_add() hits WARN_ON(node->provider):

[...]

> -	return clk_set_rate(qn->clk, icc_units_to_bps(src->peak_bw));
> +	/*
> +	 * Multiple master nodes can share the same underlying clock (N:1
> +	 * topology, e.g. several CPU clusters voting on one L3 clock).
> +	 * Aggregate the peak bandwidth across all of them before setting
> +	 * the rate, otherwise the last caller wins and can undervote what
> +	 * another master already asked for.
> +	 */
> +	list_for_each_entry(node, &provider->nodes, node_list) {
> +		struct icc_clk_node *n = node->data;
> +
> +		if (n && clk_is_match(n->clk, qn->clk))
> +			rate = max(rate, icc_units_to_bps(node->peak_bw));
> +	}

GPT has the following concern:

[P2] Recompute the shared clock rate when a master drops its vote  
drivers/interconnect/icc-clk.c:36-42

The zero-bandwidth path returns before the new shared-clock aggregation.
If one master had set the shared clock to a high rate and then drops its
vote while another master still votes, the clock remains at the old,
higher rate: the remaining master’s icc_clk_set() is not necessarily
called. Recompute the maximum vote from all nodes sharing the clock on
this path, and apply that rate when other masters still have votes.

Konrad
