Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DABB2DCF75
	for <linux-clk@vger.kernel.org>; Tue,  8 Jul 2025 13:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751980123; cv=none; b=LnaTJ9OmYZobJOTmyPj7O4zxCCCvSbWJkt82bLTNReZiw0nEKSuxTV3ooH7SYWt9Nrra1qQZBt4fwtM3PNpR6Dcyv0BtN7GIK89GNLP7Jn3aG0ljqmYQej/PqsTh7zC1fs/aHMO5AGh1WYzOVNUUPAdrNU2unRRsjbwcG9cw6SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751980123; c=relaxed/simple;
	bh=WzAnNBoWqDOEgWIAvOrUUm+cPnnAQsDqlITlF4IdpJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tmiwhb9BOy/tqh/ukmWsBMFJ5VRLzmGOpfQI3+2Jz52bUw97NHiO0GbH2hqYzF7CwK5Ao6jwoZ3NY3WiQ7dTtfn7Sfh9dU7K3JCW4pdSU+6mc4fTG81vOoHz1u2Tzl1YXISbwsUFtyCM13hpJzovGOrypO9qyVv8BjTNmxV/N1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJkmmfuH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJkmmfuH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAWVT025574
	for <linux-clk@vger.kernel.org>; Tue, 8 Jul 2025 13:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=; b=UJkmmfuHN0Jr6kLA
	ld5/JgheNu5sbMNgZkiwYUgO4GjvZ0BhglW00c59meaADsYhrZJWYQqmA1gc/OUc
	DUrnK/NvCvH5C3ONM0GjvGKFSW0GsKNdezqCPza8ZE4tevjkJ9e1npZeNjJmh0a+
	INZ4fgtIBBYO0j6f6etpT389hYl24vuIu2PlUOUPRwGL81B4dcop5sZWnBHRiFtS
	shOo7dNQC/vBBtAFgTDT/48Rt3FZKyaSlMLbcUDvTnThA0dRBC3CHwWIE5u6O4Qv
	lz8B4EKeQFe+0hY6nqY73fapqXHeHNzj+ARgwUPzAaWQ1qY+sXoEn7n7SuSC6Xxx
	t7bbIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0wdcxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 08 Jul 2025 13:08:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0979c176eso42181685a.1
        for <linux-clk@vger.kernel.org>; Tue, 08 Jul 2025 06:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751980120; x=1752584920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=;
        b=f+lfehMbQFjz0p98WtPWmrDKHGHPparCW0elAHngEdWzLY1zNUFo1d4Kfk9j6ep8fc
         jiYGivN1t7Df4/g9qILl8raQjsCBQ+RWxu1gUqm8+YaDnE2Ak1X4nzlPKOF4LdEozzQO
         9zmBtOCdpnz+N51LVvHMq/qKXv7Ibbp0fOeS0E2fmhVoRRNa13Mf964OHPKtKCz6xgZH
         fExWy9HxLFNXtA+eFrtOY/Gglg7IC26YVVL1r2kXK+3mbCa00reX5+EsnhUy8dqczpwZ
         1hoRxA/UY2pmbgu3DUkF88RSScLrIG/lnk1niKVP/je86yp1GprVj3vsDtYovRA8WEjT
         /IeQ==
X-Gm-Message-State: AOJu0Yx8l8TCKHo2OWi7NubJh3Wlt7/03qjQLy5AM2ioNOfzX3VxAASz
	sNHBDSYNoD8eZpiluEHYzM0hp0A/b9BuikbTNcAZ2tJ8OSe3Tu3JN4g05Kw0WPU8V3qgg93ln+h
	4ZKGGuU0WfJkEXq9D7NXRbm3p2+D9IE3DFFAIEOBcklL4dqt2DgBpUAdbjvldbQ4=
X-Gm-Gg: ASbGncvIAqUe8Mr8PaB4XUZAr86XY5YiKUlvVKZ6dQrAas57JlJ5zvxO4dCpLRMtEzV
	ZIXB5D/op8aD+YvXkxNYa9RulAM5JnQaPsRUzc2ciCWvF9bdE7DmLLJr/EPZBsOFdms9lSKhl0L
	Rdu8lGDcBSQvfVrjrFCHzg9Jc4ZnClwTBYPBzNZ/OAzBrf463bK/KQqCrgafmbvvZdBtXHiwY7p
	dHdLf18QylP2Bc92vtuiC6riWBvT7HcVklm3zMEQdMuJzTdZ1u/6wgA6DxOkR7H4rAQOQPMi1vh
	5lQHCMDdBhRnXdLp+gpw+0jL+zMKWS19RxT3Qud3XcdX7H6uzyVgboRP3dJMBY1Djoft/6iDdzd
	vep0=
X-Received: by 2002:a05:620a:4148:b0:7d5:c1d9:939a with SMTP id af79cd13be357-7d5ddc689bfmr784813585a.9.1751980119791;
        Tue, 08 Jul 2025 06:08:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjMkzcx+Tq4TsX9kndjZh7wHfMuEQIojKWDO/yYN17QbawLmZlZmFuRE1iLw+w/7zUU6OuFw==
X-Received: by 2002:a05:620a:4148:b0:7d5:c1d9:939a with SMTP id af79cd13be357-7d5ddc689bfmr784811485a.9.1751980119240;
        Tue, 08 Jul 2025 06:08:39 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1edfsm883127366b.180.2025.07.08.06.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:08:38 -0700 (PDT)
Message-ID: <fd367b55-fd20-4601-ab03-b398dcb326e7@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:08:34 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] clk: qcom: rpm: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
 <20250703-clk-cocci-drop-round-rate-v1-3-3a8da898367e@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-3-3a8da898367e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YHPt-li61ZbO9MZY6djqH-GIk03Bk3-z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEwOCBTYWx0ZWRfX2HvPE5nZNm1T
 zqXzZnAkxpd17KhuUQciMjCzv49tGlN91sHO+Vn8WK9rRt1iNkDAJvMOn2H7uvGtuZJXL1fx8Do
 48tusGg8nycxLJ/tNsSnfZPFzoZqTRnp6cC0F2xoWRQsZyWW2CcaCEdWDlhF0+UUwOcMqJaUvHm
 N6zWfVs5S8BEQJ6KykHZMBVyXHZ+eScnl9e8bed2Aj87RyVXk0qAmyZ753rGaAzbfxrWpsC/3rg
 TMblPARUT07Q3tdxNuSseXvXTpttTABzHd6T1YzXxjSHcaVP7aJFM8P+Ebgk6kVc70pR0NVFo3d
 L0Adl0R6TYEFaM6Cy3LLzqKHyuLDSq7YKaD8Zjs94JAnO0SFD/iWaYVZ/gy/e9lh+ZQgAZRIt/9
 3fDKAQefXqMvwnhomWx+kr7N/8qglK6JRaOvJz25D1Tao5/cUwVLZ/xf1HQhQ/eFLUK7anre
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686d1859 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=oBXrOfH6mq4iYN50PBoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: YHPt-li61ZbO9MZY6djqH-GIk03Bk3-z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=798 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080108

On 7/4/25 1:22 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
