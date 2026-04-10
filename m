Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5823C4559
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836711; cv=none; b=u7r5717OJ7e+k4E2I7daE8wWTMhnNK57MLjjBodspQu3du7yC6uTxrMid5xx2J72O5oLt38YuEv6pukQP/waI/1t/bKFmtVMTt4Ftd67+1g0GSeDnlXfGbR5XaD8hTTCvxbpRh0tZ1ayQMWh/2dyAnZO+32Q/YDn7iUt5Q/Cct4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836711; c=relaxed/simple;
	bh=DQ46fuCnOs30J1b7qv/oU645DN4nh4mU4NqMfGzaMuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nW/NxyGt3a4IJHvzi73x4RdNOxl1km9SzLt1/bf9TPNZ4wjuOYZCWLkrSs2WcnhOAVj+Ci/E4YfwJFSQES+dMy+QTjyvVQ5IOL2dOULkXjq7QRgmK3+yiwzt6yuLRYaFK5APDoor4LCrAhW3HfvqqSoWBQIh37ia2kMMI1wiLnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pp1x88sv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LC0phiKn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pp1x88sv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LC0phiKn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AA65Zt017527
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p4zsTn/f0tM4EO8VK74LGzJh
	aI0WnVomtNRaWeIJTJs=; b=pp1x88svEbJ0TOhbHdiJItKYYZRcw4PDOigGuufT
	RZ5Tqz1AiUwEtit496o+ztMuY9IUAUl6qE3WLr4WRNuZFQDCEMrej8I+qFxvVEzi
	vnvVXNXKyNyJKbuqcD7iueQO1RVD018T7x57aa2fOGrCqlX5mjZicfanmV9pb/PU
	C/ITsx1nszlkOGlAJRsrypl0Gs05fMBAODHOgzjExTaZTPoiTrTNIlYR4IlbyV53
	oPjvZwsUNEWBhyrqCqWqRqphbn70ybVZZrS0k5rnFtnjz6+d1nRFCmvwsrmhsTnD
	SZvNupyVEWaoNa28IObgKjEAtv/jPo0rn6N1ghodo++ERg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey5j13ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 15:58:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2d4032ba014so2105758eec.0
        for <linux-clk@vger.kernel.org>; Fri, 10 Apr 2026 08:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775836707; x=1776441507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p4zsTn/f0tM4EO8VK74LGzJhaI0WnVomtNRaWeIJTJs=;
        b=LC0phiKnAtSGqgrvxesO/xJ3bfK1QLrmig0J5gahvXjzwP7j3NRtz6IjL1uxXch6qs
         0iqci4tk+VMs4VhLyQ73ibEWD76S8q1VlFsOQX1GI8Ca8i9E7gsejmWb8QJSlIyIRNXb
         VtZ7tnbzKK/6OJMnQtu8Xr0/tMIYyltrnbPMs3YcSVCvHla9T6cFjREyDc01NZyc1tEr
         21H6aqEUNu1fOp3F8AQo5EjqciAb/cYUckWZ42ffpL467dV0bVL2mlquqD6sNdBmLfOT
         fvsmQykFnXwcL+pMWGiFes8Sm6kARuPLJDDur0M+xwARqHOynwDGMr9tc6mTLNOBbcFA
         /tAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836707; x=1776441507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4zsTn/f0tM4EO8VK74LGzJhaI0WnVomtNRaWeIJTJs=;
        b=dV0wEwvQd8w4LLWgVSo5x8jYDHSTU33SZFfAsroN4NpO4DUyO7xjVp+/Vl8S3/rpjc
         EaHgLJeo/0R8tfsc2tO8SSSabWob+u255+XvTdLXJ5Rsd3J4mj6QO5AWvOjoZbqz+mms
         LpSNfiZxZvzFptLby0OpFC+C/Ti4QVJG/aNZHrTBpAtpH70bQdZTGczy+cD31To+yZ78
         LoAmrKWL6hAuGLf4lq5VQUqLbH15rzzUJwRym+AGOyey5pw4LbwWOHwXt4PR2UCr4iJm
         xY/D3fL7bq+asGAvm1wfwL+FFBPa3hgcHs4aJbTGzIECx4PphiDqzUhWF+NKbAnEMor9
         jdiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjb0JuXAG82lgBwe7BK7ptoCUoaMyqNVl8jGCHLo/42fad9x/XkRpCu0yca5h0g3xxwk0IU2cus6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD1Sy3s6qoLClDmLkUAv3LaL6uMF4lNWZXvQ7MmaRrgU5Z8rxn
	qIwqGFEAENvHhheixki1q48MzW3r9eUgzCwL4zZhO5aQwTZP05rF/0L4iK09IVvubZOCeBK5Yr2
	FcWmisKSsJ5vygtUfmlAc52Kw99D8317dY4ul3kxQbDUi8vrPWaRUU7EsPm5hqZs=
X-Gm-Gg: AeBDiesP5x1tId96FQDlmETvK355NQONarhv2VUCf7EkJFP/zmNmqFgzWtAJPe5TQBB
	K3lOkUTi+JQNyixacmxGdTNHRnDdXFesxJXc7cKCLgaKsr1zA1013DJm0k2HGfIKo19x9qpPafY
	b3uEPQkcXj/0J6Bnu4spLEgJwbSA9YetI2of5PccntOYaWyZs+yQGGOLOscfMnWgg5M4LwbmUPM
	0s5zSZS5O309TQfye8GrJvE0b0MI1UOYkugSYjNJNM/Iqvpe/oUQcibxYueANb66Jd3wPhWk1cY
	Gouk/sIwwFQuKTzFbbHkiy3gSxDSLPEqZScmjhMz85ugeggQ3U5qVlwS4Vyi2IVwIxQ5VcnViQ/
	MNNj+UJUL47Y/BpZ9XIDxl5Cj7EAVBpkD7o2jZ/OZhT60ogmTL7b1ihRuIzBm1FTQYXF6HNkgpI
	Y=
X-Received: by 2002:a05:693c:2c0a:b0:2c9:ee15:a0e2 with SMTP id 5a478bee46e88-2d586991ab2mr2320126eec.8.1775836707523;
        Fri, 10 Apr 2026 08:58:27 -0700 (PDT)
X-Received: by 2002:a05:693c:2c0a:b0:2c9:ee15:a0e2 with SMTP id 5a478bee46e88-2d586991ab2mr2320105eec.8.1775836707032;
        Fri, 10 Apr 2026 08:58:27 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5632a64easm5281349eec.31.2026.04.10.08.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:58:26 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:58:24 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/7] clk: qcom: Add support for global clock
 controller on Hawi
Message-ID: <adkeIEhSRERfEBRO@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-7-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-7-c7a185389d9a@oss.qualcomm.com>
X-Proofpoint-GUID: wCgohj799_ckdmQ7XKXltd4lCQ5N8SDr
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=69d91e24 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hcFGLVdanMBVBe-XHWYA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: wCgohj799_ckdmQ7XKXltd4lCQ5N8SDr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0OSBTYWx0ZWRfX4i2GmmKu3+Yr
 rAnnvBrKDkeT8245Ns9mRj7FdyNTOT7CSRM5evZXVCX7UetlUqlbkS+7txRH3gU9F5StU7K6TVl
 RRxCifIizaS7kutP8TE89Z5XjkBqXAMdNIAjFaYYAuylHr/Be6OKGtRjBgUFbvwzJweGk5DGG66
 PKOTbDKlXLTQC1B6K+LIhi9AcFbQigf2PLA+x2OU1GEwfcLcPlWPtnlQysWNSG10kwUqKjEnd3g
 9yBYTC9tef8GpWOTI/TRWtphTdXaX9pvQZCKX8VdHMibhjomq4G3MJfOx5T3zDWoe9hoTTHlzMQ
 EOa+ldE0Y5ogp8hxGZIJIywytURwLnILBleVakvaxwiJyWyEsG1OFFPQQVrquH8iIeRZdW09H58
 XfvQ5k4VJZugwUA7oWWxn6EzVwBgqolw5AwP7+NLFnHc6YNY8w3Gi+g2N0V3EIhaVAe9NKBWk4b
 5MrnG4USfpuVBjp3LCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100149

On Thu, Apr 09, 2026 at 01:51:41PM -0700, Vivek Aknurwar wrote:
> Add support for the global clock controller (GCC) on the
> Qualcomm Hawi SoC.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig    |    9 +
>  drivers/clk/qcom/Makefile   |    1 +
>  drivers/clk/qcom/gcc-hawi.c | 3657 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 3667 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike
