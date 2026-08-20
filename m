Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B9C415B64
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221809; cv=none; b=BZg2zZtd5dNATXA2Ll1WX8s9A1RiG+vewgQ4eQORl9tsw4V0qIA8UauKtHicr5iGlznJ5OcAEBXbWMPI1KtkFhmqAziJr7dxw3cV2cLglTA7YcfiGpWQ8KMROxCq7toVr6+ooJf1XFgG0JWzmRm90LpzpZ+PT2+qXWtSmJoZntc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221809; c=relaxed/simple;
	bh=HPv9hQ1X4Qdl0VjYTO2v3OjAX3zC8AUQvrpeQ27AzV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i3U/x7gJQTuLL5wjvssRBv7I0e5YS7Lg6baHaNw3YbtZ5Kcvc3LDHjdclNisE5TU4tPykKKSOaqq35H65yliUFkv8O2r5wG0N6+FppWqv4i0wx1+ZlQhgdnmgw6hzsW8AT0vzBQIiaEBxg7Gyqas99/0UDQMav+ks3/zx19cq1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjrgZFi4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QhSNAIra; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjrgZFi4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QhSNAIra"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8jfJi2529525
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=; b=hjrgZFi4/5qLwcbs
	D6O9i8Sq2uczkmXcdgXawPVqbN0C1T/xdpH41ADHqZtuAuZnxRhdRZvbe3FUs+QF
	/bU7DGp7Cx7D/m4vHIzzteNSOp6t+T3O53nPK3ixicPioENvVGayqmU6272rsJGu
	khEOVBQXq+Ks4ciUSuz0hmvafAxJFF0rezpHeHY/lpzSQvvKj2pQtSAd65Bx02xb
	gQOyWMiUkr3wVqEQqdjFpiCjeD8PbktYq+jxP486eu0IMLxqxGyG1rhYXwPFd547
	Z4o48D1iNCCw3QVZrHqKO8lzWa+0b+aNXCs3snVaF1zC7dpUAwhXGksyyQwRcx0t
	B6hCxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xbv8dcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:30:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso6511085a.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 03:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221805; x=1787826605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=QhSNAIraNCJWSBIim4EpQbd6bervgZa2lxx0iMkoWgZigrjwbLDfbOmZsq/5gML88K
         GdJQaKqD4gLMjAA5VUTGmY00x56P7bftYKNBbtD5sisuYmIjR3ZD94sjH+KBd+4eksJL
         ZGxU96Q8PYui0JZWPoOLaVynorP/XYsQdCqwjHYFct8ssNVhVaN03Uyd/iohCMUojtpq
         oEmt2w/LoAlrIZGXqE3uQBfF45OpWJeLhPzYy1FsNFgkNGp3EIf0zNQxMSH2fzmduqpS
         FYJ14eI3QaWF2AWREaiCA/cqJxKLUwUTLAgpy6qO6+BhXoHe6SY8fuamTN+xN7FgQOJN
         xRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221805; x=1787826605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=AT5QuNmh/yzXbENLH1hzDNKY2kUMArXcA8t640fU0E7T2hQegUq6h4KeVy4WjutVjI
         V+jMB1aqnibAqZhX/phTeHy8dLHDdfp+qcL8igsne7iZswLQaVQwuNhtYod7wf0tcy8J
         G3F5TBMJ3BoiiyS0kpuFlQ4Lu3d2mRYzgsDJYrDAnni3wC1LhqPyb7Hwj/V1lD1+5Eh9
         eXvml4TJHLPn09REO6GMiswDAjtNQODvMANUx7tcMqoyKNQVHpQZ2jQFZuc6KaX6JDvx
         FLtotUkdNbT90dikJN8Bpu7WvGeq6AHFmHLClx67obqIRZyYTjti4SZ2pIJYCD0N78tF
         7i5g==
X-Forwarded-Encrypted: i=1; AHgh+Rq3YOKUrgSRXWNBsyzDxPLeH+mfoUPUfKSYKbh9tdYvaJy6GQ0e4vNlgfat0qBqHDzxJa1qqeNdyh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbeucTQoanu5ClN5u37n0hCxnMRYSGzBV14FH7bOW3ExiNm1Cq
	oIuyYvfYq9ctooJzkUiLOwJgGcT3WC3mLPvCa5GeUATJKOBN82Aw/hGLAIijaQwHlFALF0AAvff
	wU8w36QkKAuF1q4Ibxvfv62H0v1qB66ap2BHgmvwaXSFjN0tGy0Pcqr6u6EeVCYk=
X-Gm-Gg: AR+sD1157F07yHauBG6+qLZS8SjAt9DGHL6UCx3TAezJTgJZn13a2iDw3fulcUIbTwT
	GMp/+zXUxLF8jfLVJBvdtkiUvUQNrqZgamOk1SvAkLykKaCHK/21LRLEBkh2+WTlQcGzojBPVvc
	oabiPB03nGoZVXHWJa9UOQiNHoQ4xJrU68tALIGLqSTdrKVbFGUrkf6QsZW+Cg/yxufMYBPoreo
	3Sn07cfz6kt6+TxvJLvucXEWkWyyLzD+Foti9wovqkmTAty78szC7EO/65dwEwKtyS7rPVD850P
	fvuUcNw0JQUWgfxXYFw0CJ5Qe9iVi9lLAfdorx95dRKqrdkEqMCzmBm0jpY9U+9CgxKtETO04ca
	bRZjI5UdVoejMTSuvVP2V2gV5
X-Received: by 2002:a05:620a:1728:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9371e1af3d1mr771157585a.0.1787221805163;
        Thu, 20 Aug 2026 03:30:05 -0700 (PDT)
X-Received: by 2002:a05:620a:1728:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9371e1af3d1mr771155085a.0.1787221804799;
        Thu, 20 Aug 2026 03:30:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e224dsm52452666b.2.2026.08.20.03.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:30:03 -0700 (PDT)
Message-ID: <86062063-4909-47a5-9279-e1b9ca8892eb@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:30:01 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/16] clk: qcom: gcc-sm8650: Tie the CX power domain
 to controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-5-e67ea30d8b7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-5-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AMKAkK6n c=1 sm=1 tr=0 ts=6a86d72d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=8AEooqP_IvclZvvwVwIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX0NWDGSEVASkz
 +4Hvra48PS4i+8APgBKE3YAI+ova0RAaqg5C1mGQgVeJsb2TRC1NGHiw1bLI6rWbfQ913r6UVod
 T+7Pz53wWgBB5ABz3kvZz4v5VzhS2CF4ytKfLaIEKyeLh3Eq6IFbQm5x9bq+JQ8uEEPtBNZIiV7
 bXr1eT1KYIYJXkSiGZ/b8pD7QWboKdlyenp3PSbHmriU1tNoVqNOAV0T9HHj3myBXVrppD5dlIl
 spAOYtpuCPhEPPNiV5rix3O4QkmZcl4O3N64CBk6Q3LpCVUgNox+P7qbyYVIlXJu4wlAU4Wck/d
 kwNRJLlj9juBagOWTrmFSPvLupu0+mx+P5w3FoTs3ZP+9dnIEZDCVzlD+Li1RoOKxo+8KPNYzun
 7CKzl4eIBmcJf8nF0xECReBNeZO//ooACEmqqSk2fhPdpWgZxqcOzDudKxo+eVzdiTM92WQlftm
 GFG+L6JSmj1gs7zrm4Q==
X-Proofpoint-GUID: jIHvTjmiDW74FRbhPws8pTMw9eHUiMH3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX5+P0MbzsRY5r
 7PTaSTNMhZnUmFSY3AZsP6OcJS9zcBExiHolZqTucbW/6od8XExYzwM+nHUxOBVIfRXEzoa9D/s
 4QVj6BZcgv6XPZHXYoYXFBvBLdTum/Y=
X-Proofpoint-ORIG-GUID: jIHvTjmiDW74FRbhPws8pTMw9eHUiMH3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200077

On 8/20/26 12:07 PM, Abel Vesa wrote:
> Enable runtime PM for the controller, allowing CX to be powered down
> once all GCC consumers have released their clocks and GDSCs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
