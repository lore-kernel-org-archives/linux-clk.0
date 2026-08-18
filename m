Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CF63A75B8
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 11:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787053111; cv=none; b=AMSHj+9yUap1q8y7e6aWzqBxmZkBfU8jjXXdM5I6SqCH9EqPxaB3LckEkhFb7+NMxlT4tCKDTLAF+J37mEXkXmCWE8qwtlbcCCosbVucPG4z4pCd0iCo2aP+AWaF8pE34okAQfhV+CZZOgU87u2OR+x24VYr078zFYfRXK65Jdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787053111; c=relaxed/simple;
	bh=q1CGJCRAI/H/kngkPmKzYnqyLDmlvmjfGxSF2tr6aTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4A3RDqjqT6KHqEcL607emcrE+YTBD0CJpNVAaCMMsQtXFXgHsqv6r8VQPiNqyd/sEr1oRS4E85Qo4MrPc3Gu8n11TN5jaZFyBWDyC5VGYXePjpZW5ZOjODBeQfOgzqFV7Al6oFNNQDGiDY+MuRRqoHijo4Vk7mCSJhuR48tBRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lk+NAF0L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tek0FcKj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lk+NAF0L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tek0FcKj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABgOv820143
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 11:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ncYNu2KRJ/Tha91GQijJqGFI
	1sxsOUm6AvNieIht+IA=; b=lk+NAF0Lw5QWjWuij4iejIkPF2SY4V2TZnM2QcVP
	mUIH22UwZozyzLs6rtxPZIYSvWZFyjDw0xOrrCd3nv79rMQ8b1tu54jEwDuyhxNe
	yrwRZ69XwCKRuhrN7LVOQV0geCg5a4tXUDr9Deszx7/QE2ZpwOi8ko+rxeIu8i9B
	2VN0iXzFSdTZ7W+2/kJxCw0WfvYZwE2kjGEri7mdbqIeHQsQkENzdSnr/MgvHJQR
	zSbv5epVl8GeWGVRI7iIBDJjuqHgzbD5AzbfDQUtjCDJRcSsilHHhKnVLKtDR48w
	EW6Yz/0pO9RInCgjipw1ord9nOzi5ybMbUy2UBWnYlQ/Zw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p1sqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 11:38:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934979ee9f1so588236185a.2
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 04:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787053108; x=1787657908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ncYNu2KRJ/Tha91GQijJqGFI1sxsOUm6AvNieIht+IA=;
        b=Tek0FcKjy7CLeU5jNNDwzTkDlieBYyAjsDqqZn4aQTSkjTAo6QlJpjTxozj8gt/3Il
         vAQuFuJwk6LfokJu2Z0WxJtC1YnhUU9gtID99sU5kOelvKbI1XoaMLgdxCaymcyKJ9tY
         hBrrkwQ4BKLUG3iYSJWOJZLg42crT5UGVUFgej9S994UneKY4TXbxI+Gth9IBSO0uu9c
         XHbpmzqi5dz6q+4ZQYuRRg6r4FdjuBFTeYBaHY15DUQT+bTGcnMikMQxvxcQLLdiy9we
         mmyV7Xu1PT+H6y8c57tIdx8M+Qx5zFPa1wkflj81G8CiE7H0OEs726ugyQqkanGF5Fzf
         bgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787053108; x=1787657908;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncYNu2KRJ/Tha91GQijJqGFI1sxsOUm6AvNieIht+IA=;
        b=tZJk7D0fspnVdz2Au8QfYxHx1ASlKOEAZtXk5Bu8bXV2Mq6ZmhdgZI+2M71lDKDYPh
         f1tqYvoZf4GV18t3LHLkeUBWu/v0yh/vRagVAfySZrVOE7Y6Us9bvezZ0Mu6XPpZKKcy
         o9XPTuC7ipWciiK1bg2Y3cyZi6JwQcA13IbAvn5gSBjnMamZvHRJy3yqUlr5Daot+Z1C
         1X+a7ivFlLMczjGxGhwoGe8W4g3oysxNxyAdLyUZzyiJRXhrFLDuPztAbJTxLAWDMufW
         5jVAxFq8s6yXUH/8kQJzZAjz0eIOEloyrJcFLxDl9uUSyvHwIa9kVuFo/ffd5+jIkTzc
         UvOA==
X-Forwarded-Encrypted: i=1; AHgh+RqYLQZyXREQnx/BeEbW1QFMKsWa33j9K64kHD0aK6G3RnHfOnAZy0VSM0V9uVaRpExuGQSGT3oFTyI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn1OWw7JnDQYBA+WEE4odh9ya9D8uF0laFa53wWaqTMvqrJ3i1
	/Pu4AnKoK/TjEplLfbB/nSQAi7DGzZUho7Zb4jvjeHeNb0np3gpjAUESiekALu/rX3b2OhwHdEQ
	u9XDpJfWHlhY3bpSlblCgb875KnT/JRz31In+5EkxmSv9j7j44Sb8+G6QXwfPO6s=
X-Gm-Gg: AR+sD12xRA/w7jRDfYvsZ1/Wed7LYzuzBlBMkJL9+krX+HI4gVCZ4NOfkw2gmfcOoWJ
	8VQvqpVCDFgPkI/DM5eI9251zZVQMP0+UpcoQd5OfnC70+mnpy9qsK/PgcHAe0XsWOXuZ1W2TdH
	KUZis0teHWI1DWeUvFTvC/D6CXZst6A8K0NZ7+XN30MK8AAAjJm2HNDKyeyMvTK/evay9sw5074
	8YkCeB3nO5DGYiVcXkmsc2p98rcnktvTY7ZOGBn3I4w42t3K9F0tOnrq/NC5vfYUP+evJT4zB7x
	QIzxt6xexloKwNXKlqaZuy6W/GhdlJLtNm75c4Awwug8FgNbVMYFHEffEOO1N81lkz7kg0jX2kS
	sNGT3avKi+m1NAyE=
X-Received: by 2002:a05:620a:a41c:10b0:912:bd42:b46d with SMTP id af79cd13be357-936d22e4635mr2503446385a.25.1787053107806;
        Tue, 18 Aug 2026 04:38:27 -0700 (PDT)
X-Received: by 2002:a05:620a:a41c:10b0:912:bd42:b46d with SMTP id af79cd13be357-936d22e4635mr2503445885a.25.1787053107231;
        Tue, 18 Aug 2026 04:38:27 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996188217sm541292715e9.13.2026.08.18.04.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 04:38:26 -0700 (PDT)
Date: Tue, 18 Aug 2026 14:38:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_tdas@quicinc.com, bmasney@redhat.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: rpmh: Add SM7250 rpmh clocks
Message-ID: <7mh5tesovuk5qo6ebxhz4k74zwg3nx5ab2zibtqf6o52ybdxq3@v7urixq67lsb>
References: <20260816131646.10551-1-sreeshankar0910@gmail.com>
 <20260816131646.10551-2-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816131646.10551-2-sreeshankar0910@gmail.com>
X-Proofpoint-GUID: czoSyHCwNLyQySZn75n7IEHJwvzdE9WK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4NSBTYWx0ZWRfX+yu7dtZQ+7xM
 c2Jr2QT52bxw0HHI4JJY+y9JQ0qYEhi94IUGYiqHsoHJonLxwAPZH9yLfPqLm547sAyOy4lr4DM
 EwfHESnpJWzc/xKnANyEiFiTpgF9Wl4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4NSBTYWx0ZWRfX+qOUOosjlKeM
 YKayVl6fsQq5NiViRpBr9+vADVYzQTO9BoJ/G+obleCt5breX09c8kC6YELIt3itTjk++AkvgdO
 mF+qmV0EBEeO4I5Z9hmnx1sNuqSQhTfptBtP1sgdXIVxY5UKy+6Ucju8i39eIZMMhM/IoHGGXUQ
 z1H1jaoYojLLBonFiVhB8EYOGnuQQnTLX65od3IuTdm7qpL4xhfVUkEc40uHGbiAft/cQNUJBEF
 zqxIXay/4bFMzWlDjXTtgkVzoXjjBdyOQLqs1LFJ1RLwMszwsJ09i/DkD9CxzqgX+R3q5mtqu2u
 5bjIMivvpszENTuIxmSziSqv4lJlF3DZZU13moGC68wpEbM+wxKERRetXpeNBJ6V3RLr+9k0GJr
 bnhzlGCsKxssrRm8n74lehYINhcwTke4tUqwkv/RGtCWG4k3yVS+rQpJ3scxdzjSHyRBvu4DBqa
 iAbGyXmTGeawSuvmscw==
X-Proofpoint-ORIG-GUID: czoSyHCwNLyQySZn75n7IEHJwvzdE9WK
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a844434 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=e_63XvbMukAsnnsCD6UA:9 a=CjuIK1q_8ugA:10
 a=Z0LeWUw4VpMA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180085

On 26-08-16 13:16:44, Sreeshankar K wrote:
> Add the RPMH clocks present in SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
