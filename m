Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5829D3D7D75
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 06:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781590759; cv=none; b=YN/oj2bNxbc4s8UhlqM/FLQTvdZMkRDFueGacwt6cPP3WsXy/dq5v1lnXkS7MpL7zHF9XV2OCc3zmGbIqYXeANI3+giqtLzFNPe+AFwGDs80JTImhsnqZwc6CYSOvQNeP8z3kd+Rd+NmgtYK8XlXvBYfBpy+mu8JjR0fCzX86Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781590759; c=relaxed/simple;
	bh=HySDzHfG5PXiuMyvybA0VhJPAM36NZzNkcvZL+8XOeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uSsgWrly9kg+s+Hvwqns6VcuIyzyftXa5ssbG2SVamRVKJLb4WQQH3y2dw3FvZC0igow0K84yl1sgJNpqdpsXJhX88yD+mDmxVyA7EeivP8ICNj57ZNy03HKNqU42PBVqQkz0QJeEzWyGdcHbugRBUWrb7+yJthTgG+R1Vs/6Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8oixFR0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/CD7hba; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8oixFR0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q/CD7hba"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G65GKs2849793
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 06:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KKQ+LOoANdSaA7LHIt4MW8IbeREl0D+4fa8Zcz6c5uI=; b=I8oixFR09bldnOjt
	4euoRF/q0kDmI6mTv/GJphoomU1Qndvb/0ysGYqEJ1a9H15TKdzt7xV7D9B2vKQM
	ka25efwQ+6oxLFPyoaDPPc3Rotfz6ObgF3BAwYLTBUJXgkW1ukMmxcJbU192BbJS
	lWzw+WTxEqLtfDGJMbSWAOU0nhsZoKPMkS+odltNpergTgbTizH46+AW5ZL0OeoH
	wIappONLaHVIdvO0SA34XYBbLHyqJJw9O+Pdi1cwiwDww33Sj/l6oJvYFyJR3Snj
	Y2tdStQ0xOvyTNPWNFCgUYz4wnzuALjpGvnWPFjxDIBbNDxW7i7Vu8qxnPhfbDtq
	LOmeiw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09g88h0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 06:19:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84238e83851so2782133b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 23:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781590756; x=1782195556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KKQ+LOoANdSaA7LHIt4MW8IbeREl0D+4fa8Zcz6c5uI=;
        b=Q/CD7hbaRqZuMkn6dmZgS7iKPPXPaVOas62ib5fWALCLYW/uAWNdCLkIB/4Vt6hCsb
         W0JDQBFGexxasS+KglYFs0JV5t1yposcAKxr2eJQU+2ZMRAOSyovhDYtpJDvxevJ7M+B
         pQggoClZBkElcBR062Zy7/qWyRQTaXhC/0E7KTuZLNsS0sdQYWF+bKtdfiNh87l7WsRv
         Smwv47HeThi5O/b/WlZ/juQKhJbvarUsC330PmNekn6u3QFtVEPNepFHJ1+6kiby0gac
         mM023WBe/zPY/ONZGT6GLOsXAeE1QpVPdrEvDw+R+Z0lYdRGaBLqWNy4mTabdVSzaFo+
         yC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781590756; x=1782195556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKQ+LOoANdSaA7LHIt4MW8IbeREl0D+4fa8Zcz6c5uI=;
        b=GHq14ysRtat0uk/eKIEsSt2V0NDbc/JdOV2D8UGlbD920McvwpZtJ0YSMwYEoyWrtp
         i707jv8Ivaw5F/89bSptY/o/eTsvBdq9DIaN8MPCiwDKH6abHEe+F9Av9C7tJgO/fIdi
         kHSEFfPzqKhMHDD3PhV0UV5R1uQfXknTuPn67LiRmcBhFDOMeoNnjfnLXsC3Bs/lM8j5
         tqPiLmDHiJRCxkUfDnGBjlsnfj03ZPJMetDT6jZMv66EfV0sORa5ezmB6jsA9Dz5jbel
         6dx8jhzUcMqvR+2XOqHATZ05NwUlPHpZhIrAZ6nOUucRqvRY0pBd/0Dovh56Kw9wYZvc
         W4hA==
X-Forwarded-Encrypted: i=1; AFNElJ+YNBYQNL7kg4yoi5rT5CfIF0j91wqjU8fcNs/S2oETHA330cImJgx9gqPHQM1Pv3wU7YJFCD97FqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcBFk/EoOssj1lXtlIZ5avx9poAQcKs+AzFLK9j92pMrxhwpbr
	+xBQ7xtUGdK9GOk1f+hUkFewhO53IUdV39TSsb7jc4o7mgo1okvHBpdp9EOA4u06M989pbJHIBM
	XZjv0xSk6vAptguPypwi68usIdnpns+NVX1wiaLZPgyItpRYYCkQjYSYQxhUSut0=
X-Gm-Gg: Acq92OH5lyI7mQzaMMuCSq9+uFooClMv7W6DP9jsto4hc8B5mSRfP24HpWK8Ska4/Kk
	3xFir1n8X2mrJD3M6mqTYa45o+D5OkOAJKTMPDv/ggF7DcBdEri6LdLdbx+B8bs6Q8tN7+ds46k
	7Y4vS+MWxaSmxPtsHGVb3LSV0c8stELm/9uhd/NZiXEOULscL8lXaYFTRI160Arys+JNDGnt347
	QzMFL+1OrrfOkYg01X6QeufXzLzOl34GtiZbCyUC0+HYeteCSr7Ps444TPhZjl7AE2Uj//ILa/I
	jJNf0Q+PFvNjqb1oKhc8BVxCnuxDhsN7z7sUCSGw3zMt2ZgawpvSMVh7Y8Qp7bg7JyCmQkU/fnC
	JSLY36oknYJvrJ2WDO3IdpqI6uEPfQyfU1QoghbWQUKXKg8LRXQ==
X-Received: by 2002:a05:6a00:2991:b0:842:5a8d:3036 with SMTP id d2e1a72fcca58-844e1a7970cmr15081634b3a.35.1781590756331;
        Mon, 15 Jun 2026 23:19:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:2991:b0:842:5a8d:3036 with SMTP id d2e1a72fcca58-844e1a7970cmr15081615b3a.35.1781590755919;
        Mon, 15 Jun 2026 23:19:15 -0700 (PDT)
Received: from [10.217.216.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acca7ecsm12187454b3a.13.2026.06.15.23.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 23:19:15 -0700 (PDT)
Message-ID: <9b04b4a2-f3e1-407b-9458-1d6c061429ba@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 11:49:09 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-1-b61c7755c403@oss.qualcomm.com>
 <dyukhyihftgrm53tdiugcfx36tfngelm3hi2otpxy4pzdiwlsm@ixh6amjmeglm>
 <51c4edd9-ab60-4621-b7cc-af32729e3dc1@oss.qualcomm.com>
 <61353034-51a8-4be9-8f7f-b15f5d60fcb3@oss.qualcomm.com>
 <5d3cb141-bd88-440a-adc1-e4d722bbc3cd@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <5d3cb141-bd88-440a-adc1-e4d722bbc3cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA1OSBTYWx0ZWRfXwuf8HBVhhDwY
 b0QZudiIvZblI6ezKcWr+EPP0XhR2KzW7s+BPaEtLzzNJUmg57NnUdLY4Yc/fZlJ6AOWZW3zkV/
 MEZsXi2Rd5YzjpCyvIo0ZavCYKf1PcQX/gpm8Ph9GU/v1F5irYJO+zeun0FqV5hTphTdNgeyjxq
 WV9uhWwH6t2YkKoqU4W0Pjf73Xu1frNc6Hd2X33AIPM3zn6X/8QITalUCKEt2g0ygKK1fsV9cb9
 IHzN6dzw+/PjDPigk55m8orGaNKT14l7sFVtR+OLsN/u3awMTSY4BsrttVtEAuKWOK4ErkLp8Q+
 pv7KaZp1U5pqDo2KSH6kcvsjULjhfKAZ6nUbcxgsWOQTWOyb7tCgntkkCGeIcQTPAFxmjWSFtju
 bX+3uFdL3CZemOvVASnVfSEyE2+6/hUoiJkGo4+dO5VVVcIUetMtDhx2locsLwJxgn0N8vYpdJK
 TBxYRtHctATrkfELv1Q==
X-Proofpoint-ORIG-GUID: gIBpORT8kIRIHElrpA5O5pkxGvB6Stij
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA1OSBTYWx0ZWRfX0sxDRuUh9TEk
 cQgD0z/bYlXhofTPW8oG2w/R7YE5LF+LAh2Lir63PI1mY5C5U+lhyP1Ftuq8s/w2DjtPPE40N39
 xQ+zSrAo6O+AJZOGp6e9sDuFtnvmVNo=
X-Authority-Analysis: v=2.4 cv=DLa/JSNb c=1 sm=1 tr=0 ts=6a30eae5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Qv26el8sPAtkdzQ7tU4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: gIBpORT8kIRIHElrpA5O5pkxGvB6Stij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160059



On 6/11/2026 5:31 PM, Konrad Dybcio wrote:
>>> If registered as normal branch clocks, they may be gated, which
>>> breaks access to the EVA clock controller during clock controller probe.
>> At least for the gcc_eva_ahb_clk I'd expect platforms actually reference that clock (as well as they do for GCC_VIDEO_AHB_CLK). For the XO clk it's fine as it follows other XO clocks, but please add it to the commit message.
> +1
> 


I will update in the next patch.

-- 
Thanks,
Taniya Das

