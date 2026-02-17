Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A9B335091
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 11:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329129; cv=none; b=eGjPKLsu/4AP5lHDGrn9OwJziQwKFaKNHSc5dribwoj8jTGKNimKBD1D9snEF6dzRuRwN8fZJxoDZEpVbNKO6nfoJ3dvh6OI58pD/nqgR5db83cJI7yeO6mgRxohLCAHCTzmAdgmEKfW8xxMwuO9jMGcbcylrF+wCoL6MrDwgYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329129; c=relaxed/simple;
	bh=CHwdSnZ7RMsGtK6/bHh47EixF7iyfUrxD//xKjebtIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YK9hGYvEd6YNqdHPSJhrgdP2vCqH6hZxlkHfgP/cYbvT6CQrsjB/XjzHn2mOhbHWcTFagiqViUCCuzY7rSXkiJQdTLVWlnest+nmm+FiMCKuL6uYsRwphiNj4oDF+upylc7wJZ6DWk7Frhc+UtnC6YGWMqTIb+4OOLlY05uk6wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FXlUXnqP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3MfS76l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FXlUXnqP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3MfS76l"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H9v2HY597257
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 11:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=34WROTQoUvMm26bjgI0nJI9N
	/HKw0990gCo/hRRoZeg=; b=FXlUXnqPq6a8xzJgwm6KMP/ssc5rJ/83tmLczq8z
	zbtp1OifKTvtz+QpK0docdjkU5H6uC5CjbHAZHtFpeMfWblVsgWvyFtyB97GaoO+
	VqLvSZMh+WblOk/DHkpwXhY182BL/JLG4FYl7fz4hrsVDg7AKSgqyGEJIqpM6Dy9
	6j6l7sjcV0YTxOpBaN8Q6MUcP8C3Mf/0LXmmeLPzfIjx3Dx8Z52OP3fHjr5WfTim
	Da6sHymwhfF8AFAwHnL0Jr2pJIhX31iUjEcs89q/ochRExcJhh4JUs0Jb0gj2oB7
	1xXubqOCdSjvEDzuOyJBM22SlRfp+LIeIwNWe5RmcW4/+Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cca361nu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 11:52:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb52a9c0eeso3364591485a.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 03:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329127; x=1771933927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=34WROTQoUvMm26bjgI0nJI9N/HKw0990gCo/hRRoZeg=;
        b=V3MfS76ltICt9ZxKzqAORabn8OZgJQE+YZ5yuqwhkJv+2ZVO3iUEZbc5J75jgp5PT3
         1BSIDUGawpdU1sQZWw7tnUvQV20nbK3R6S8rUxe0jrkdxMb91HlFgWpAOhXAKlnf6ef/
         rwMxMDKDyJIRh9IOdaXj3l/fFQXCxaPksfd7iCWxb+6JbS3fgpw5IPiqyccusbFkxx/e
         rzA16UwI3Po5TRTOflUD+/wpxaYfCsI5J2n24Vs3VDy9SUusHIMkl6p8zfMndB72ln9J
         8VVl4ObUFYxQLKGzvx12Yjl1GCpDHCiKL8r4UIKv6TFMMPAtfPfEo5s/5HKSGyK1qR/J
         KGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329127; x=1771933927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34WROTQoUvMm26bjgI0nJI9N/HKw0990gCo/hRRoZeg=;
        b=f2u1jxN1zqzruEjCsewI5tn21k0HuOIs5uaZ8YC5JqvWlAMf8KQ6dxACjS2htDgyha
         faF1ZipojAO4pWLjKi7u4P1smOHAWwe8yK+rT5qSz1amKkoxHf5o9ypYyYXifnRNfpGC
         pzXih3PmTjq2E084pCShO5v/UQzsv1u6ZD6vojwW+FefZ5h9oYELe55wcNZKpPs8ROjJ
         A9Y2jRIYCIPb/ttggJ7LBrtWTb74SUTR1oIWufAs3XxMphlnOYg7WSI06UgXLrTPTfYZ
         2C2sYTCaTFScxv1fMmgfazNBTDkstR1zFghXcqFthUdKUuU7+EnhyyMFyQkwIVNOMvCK
         HzzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6W+skTMM6Tn2pIVKsY7k5JH1S339tM8jxW9moNV+DGbJLZWA29x/WHw8NgLtwyeFBqJx+tNqyFt4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQC04lkD1LsCsanFuPOFKB7bAJSgBLVkVXjCoQp+9I77a1fj/d
	fu1q0SG0w3jgKqVcMgI6GjsaFqY+3Hlo7/nZX8LCGMwcNLrsK9xgw1GYpk28ReIpCHCiqmAwYa7
	qL/paM2vDW9+0L1POPEM3f3oBzQWNdQhr5QgfStli2VyTqXxzlHn6ppXbfh69h5A=
X-Gm-Gg: AZuq6aL0RzEhcX/CuaphCiTSaY/gOeQ/3x4PV4Oqwp1Fq4BjGvsVzM80fwM0Y9z2jb7
	nT53ugKz6ILM/sZziOUtBdOS5fQQ4LlwRLuDwcQGN6Zs75Nu7ry7uzoYClltgf/Sae2p6lWbciX
	PGo82F+HnzE5RLbhOImtcvAXIX5RQu9G098UveHbOUWM8TC50RsW3jDqCxz0RM/LVyAabAE7HGE
	txyns5itMLQBjpyeDJ9qLi5xtLM60yweFLTAz2Vri2pyAopdtAh86D7FwmRRg9timqw5E8hgbB+
	4nlZpTnyf+teFQBTsD7WPHohWqvexO4E4yh7nl2+jSMTzQPLpbBXvoGMktW0SQyt03Jsc/7xpKi
	OKIbOU0RSLtv87q/DxfekPdjJIJ7gcCB0L/Ih
X-Received: by 2002:a05:620a:28d4:b0:8ca:1c0:95c7 with SMTP id af79cd13be357-8cb4c0186b1mr1176217285a.80.1771329127216;
        Tue, 17 Feb 2026 03:52:07 -0800 (PST)
X-Received: by 2002:a05:620a:28d4:b0:8ca:1c0:95c7 with SMTP id af79cd13be357-8cb4c0186b1mr1176213385a.80.1771329126675;
        Tue, 17 Feb 2026 03:52:06 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483719b8e71sm321398715e9.2.2026.02.17.03.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:52:06 -0800 (PST)
Date: Tue, 17 Feb 2026 13:52:04 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        stable+noautosel@kernel.org
Subject: Re: [PATCH RFC 5/8] arm64: dts: qcom: Remove inexistent TCSR_CC
Message-ID: <wzfbhktucu6ix4p2wxqkpzt2vb4d4eksx42angzc7xm6t42nny@q7jzffazzuyt>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202-topic-8750_tcsr-v1-5-cd7e6648c64f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-topic-8750_tcsr-v1-5-cd7e6648c64f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OCBTYWx0ZWRfX3ld4u8G0GRhf
 Ir0RbJycvVFvLm/0zqJzyjq+v6hU4U2YM7gPvYBsbqLZU2DQ70ELsjwy2O0winf9CzKEXoyxdxJ
 tj4+Aa7vZgh0zWGkXx4xsn3gixxqzh/NSBF2cCwJ/+jn9nHRl+JV644oh8fv93blngQFMbse3Bk
 HvHGysLx/a+VnKnB4DIWircaWIwS/VJoyMhk+UHm+f6aT9e2DbV4RNtEgVIUu1O2yU4vv09vHj8
 4cdhJjuo9dHrnzJvMUcXNFGzQGnZKJ+dUDl13gIQhdabiQH9NrrFBdVl4w6Z7pWA304dMo72XXG
 BCrUAIjCkuQge0DtT6tmzuQaq0mQC95gIL6Tqq2hob1pQ9SQKTPsVHGdRheLSxHd43w+l4NHWAs
 BoDoFFidusM9JWJ1XGPn43YAbU9pPhnl6eaMDmhAz347Dlvmq/L7hZ6FP94LHwdf+9q9oKoKisQ
 tzhXcHfme/J9jvSVNug==
X-Authority-Analysis: v=2.4 cv=b+G/I9Gx c=1 sm=1 tr=0 ts=69945668 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=PbzX3SXDXahS2tYZ-sMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: JRYSCeAfqJFg-7w7fQ0huebmOCOUj2YX
X-Proofpoint-ORIG-GUID: JRYSCeAfqJFg-7w7fQ0huebmOCOUj2YX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170098

On 26-02-02 15:57:37, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> On SM8750 specifically, the block which provides various reference
> clocks does *NOT* live inside TCSR, but rather TLMM.
> 
> With the former now being able to properly expose them, switch over to
> the proper source.
> 
> Now, the TCSR still exists as a block for various tunables and
> switches, however the prior misuse resulted in its 8750-specifc
> compatible being already in use. With it freed up, it is now free again
> to be described properly.
> 
> Fixes: 068c3d3c83be ("arm64: dts: qcom: Add base SM8750 dtsi")
> Cc: <stable+noautosel@kernel.org> # complex dependencies, no immediate gain
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
