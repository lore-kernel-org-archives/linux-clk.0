Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F0245BD57
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 12:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847144; cv=none; b=jjx+pmXoHZpT1omB7ACQeX2SFHIzjVWon1m4uOnjkVXg3/DAYKAIMtySV6kXYsO+AktWrXCxD4davL7PPZ839xJwWEuMGOEmDXfPJlS7IpNK608KMFSNKwKHY9EelV/mVSX0hWNgV4xKh7s8NSGc6ftdawObuhNRumpjSWb0Sjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847144; c=relaxed/simple;
	bh=Ka3qm8iBE8n8zjZnG+YFbup1oVW5hThp/IzT8vNc3vc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fVkUs/Fhga9EjYD4QHkjWDa98xgo2OticdEgAsG+P4++P7oKUmR+FaAr/r4SbaDcNkNbXmDaBCrC8sH3ybupWpGR3abQmQtxkxODWVYcyzxzHN292eNmn9ykubtRGLX6jJwHRLxgWqQwfLTz06rtmBTX43rMwaZDPbRsg7rLiKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B3e5JxII; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eaypbQj3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B3e5JxII";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eaypbQj3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBUDCt3795545
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 12:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sUlqYvl38wfA6UHhPWcG67kFeqamI6p0XEhh5Bosy2U=; b=B3e5JxII3qlc+mbV
	iDmDtSmXezgny0Jg3dyc74B6ICWqVk0iyyOTha7tl+tWOj2dvZLFlVPXcrxl/E5y
	N+UlCwhmOqJOJMtu9238g8MTuPA7KjW+Kr154C6rTJdFQK2g5zxonNXH14d+eGVy
	LBimhj9sZkfm9NXndRTQTDgO+/MNMRldPXfkhNmQiBlL29lDK+DFEYzIalspp/41
	0P0H2T/A3i/6vnyt+pYDApQV0xXbJyKaBnZBH5QGeF+IHOXGynuZe8RhXFhKethg
	l+PX7jn2nZpeUEech5ow8rx8b4uelrbUeGebGe2ONr+l71wtrpraSAAMQjygcnN0
	AnMyRQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su48j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 12:12:22 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f6e373ba0so690137e0c.2
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 05:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847141; x=1779451941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUlqYvl38wfA6UHhPWcG67kFeqamI6p0XEhh5Bosy2U=;
        b=eaypbQj3nFCQNOl9bY+gXDCyu1Lb+ZF9dpsGEYAug9g6MUvOEXMHddVN84ejgWikHX
         XHTQ9U9/gRm1AGBef3pMZe5qKAIXvl203bVwcGvWH4vC0NBBsxzfq9nB7x43XyXFj9Dp
         Gs633Qj//HHKwJ6ftYLBL6QFp4rjBDAs6pD6OcHQelHToSqODAvZXa/tE9lmGG1bSKQ2
         WTViyiCpOg4hVxJC3Qcr6emKAFiSz5DBCmUc9nuc2YENMJsNkeWQXn6rPVt+gK1aWqxw
         ltcsIciQfGGoWu3XaFBTsbx1Ja4R0nlkc9ehSo0QZJi4eHQzZnmp4Uj3yyGLsBawaojF
         kuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847141; x=1779451941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUlqYvl38wfA6UHhPWcG67kFeqamI6p0XEhh5Bosy2U=;
        b=Wuppp1hjnLKXKx9+onTzRzLRdJtBq/Y5/Uuy9pIkGq9fpBdXxdQ656k0hOh4SlNWsK
         i9QVUX5Cd280tqiouId1eUFlL7JG2DwJbKz74UDGYWdZrAyXdpkdNpm046YGF1Z3gMug
         DtG2nv5Eire4SlVJa3XD7tnYE0RBg8oz0tIkZLz3CRU+mPLxy0tFeF1M8+4+dScPvyUX
         Q/I9VyUtwKsNDjScOETk/L0znQCzpPfp5a8TRoOfLhXIL8zXMIfDElneR6+eDGNIELgi
         T5LuxqPf+hUtAu2jE9V+q7q2SLGEauqU1xGFw4NAq4HOkt+ANUZBHmpz95Lsf1WzV33q
         wuIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/MOBKyOjM+fcAI63YwDT2LXUkjjVZi6Sx11dKuTOl1P2oqIwHs5ZaMtkoStcor6idf2eFLX66nt/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwERMi555gOnUsPi9QUuWgCQPCgtFOjpxziQq1MScXc9eNMnjBa
	f69LlWrlRs/XpRzZIXRMFt8UEVpkw5CLQkRO8f1qHiLw79+CjGWYyavUhEAC/I/2xYEl4KgmDBJ
	9G/U6MFFEOkNCty6a4/RJTsZGuV05CZDrgsKU0GAJkzn/KoI66JGW2sSwjSlbGKA=
X-Gm-Gg: Acq92OGoH91UNLXCe36Kf0+RHA1kxxkSU50t+1H42XWm1fsJ+m0qqIPxYLmQhDJ9Cly
	HDlUTO/FSJY5ogIo44+era6XmFRFyzbtTEoREGdX8OjfStt+xlNxgETtUy+6tytvlBCYYwv+gVU
	Sv5V8K/67EvFOBFzvOV0kCTPqLia3n19AT+OQXz1Z3BDlR4yh7XOVpOXbOY/nD1Oz2qbWqMMoCG
	sosutHT0lLZEyymwXoQknPELWmQI7d+EXPs9DBYbEW36iWUslc6M3euCV7+1vabFpajcwkBq+1t
	viCFagr+0W4DDKGovrOdBA7Cq4wHEsDUti2Fu+eiclSsq3+wbGvEThiJRqxCOTIioHM1WKiYVmE
	w+N1WcxwW2LXpdW4zk8stKgmmcNEalsgahIwgXyRRRGIKG/5Zs0sx6cTW9cXKFfwMVCLOsVXK5U
	WoNF0=
X-Received: by 2002:a05:6122:6117:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5760bc49d2emr582274e0c.0.1778847141533;
        Fri, 15 May 2026 05:12:21 -0700 (PDT)
X-Received: by 2002:a05:6122:6117:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5760bc49d2emr582252e0c.0.1778847141135;
        Fri, 15 May 2026 05:12:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c631e2sm214670766b.28.2026.05.15.05.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 05:12:20 -0700 (PDT)
Message-ID: <34f80a3a-1b8c-4c2e-8773-c0169518df60@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:12:17 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for
 video GDSC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
 <20260515-iris-sm6115-v2-1-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-1-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMyBTYWx0ZWRfX0Z1a+aUdpdPv
 5M5czbPQa/C//361zYhBVD3Sjlb49xFJxRGJpwZjuhbdecE2GtNrufUhdbwrDqtDyRc5ZN/QW3Z
 8wm0DIpkczEWIeSs4TpVMrenYjfiUpXKbFzbCD6/OejR1bWrpfoLf1R96jYCALQlit1uPPcxOXb
 rp1bFf7rjMIN55sbitnDxgwZD7F4dw7MxqOfemcMg9/7K5FFjcx9KJ6uzFA0wQeLwi5tVycp2ms
 AWdNQIiAFJA7hOxcIcyB2RFpQf/rDdKqbwuKjfxHFdbd/GSczrvnVZ6ActLVj6bTRF+IkSfKK8M
 qZmAualhCZulxvLkcE9L64/c2yvqZGYDRxOMLecu6SC15YAfyuZbWOrDeDVvHcl4I6TuDlOdtz7
 6LWglnnGCjH1RiVTTu+B4tFYGdCSYYm3GBHhOYvQ0EtzlQaeIFi0uNrK6C/fqhZPU+fVhVEoQJR
 R+GUnMKREnVGHBRPnwQ==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a070da6 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=V4j3QN97b3vMt8JjJHsA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: 5TuVT-7sC1CpTpMMvX3ENaPS5ST8STnJ
X-Proofpoint-ORIG-GUID: 5TuVT-7sC1CpTpMMvX3ENaPS5ST8STnJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150123

On 5/15/26 1:59 PM, Dmitry Baryshkov wrote:
> The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
> the video GDSC to HW and SW control modes at runtime. This requires domain
> to have the HW_CTRL_TRIGGER flag.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
