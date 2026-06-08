Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20333D3D15
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 17:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938802; cv=none; b=rWONX5WiuKzinGT8+D2CsNMRKrQqx5DREMghXmtdKWn05073YMUH96uX8j3uzpqSiOoY7TV6EfWeMMsAPHcCmr3zzqEZvQXTuEu1LtN2efRuCnAAfPxFr0grUnhBEU+TlmyL7SVQoukO14UsBEs47VomZj9ThrUrOpB1KXAJiVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938802; c=relaxed/simple;
	bh=w9UPeMCzmKP4cwJBV6uY79TkRH4e1LLUkbhEgEb565E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PT7zZ7iF7vVe6rGhmxfeD/Y44Bc2fcy/F9gEV+9eQPXSSxn2ipubKUEkwvK5P1KzsDeMlmFNo/hHVb092Yso4lS+I+AMiLp5yp3jg+cIPRg5tA6uHqLm1/J0rluBhSnT317q3kxZCctkWg9g+LmIccJi1gCLeKUDAKssYGQPNAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSWRzWv5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GHQofpty; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSWRzWv5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GHQofpty"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFh2J3593094
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 17:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6sR6VFzoNr94h9hx4YsrKB9qsr3ZjM5UBWPXF5PAwIA=; b=NSWRzWv5MxkOuENJ
	7GKDq9ZjFYsprTHdOqaLNkJbaMXBgAhHhPhqGpSS+O0sNG9ZP0WJ/nuSZcz5/ylH
	ESd4k6edwWVfwwm0FBxN5fWHy+/RgtshG25YDpIhdQh+hPMArieiazVTZGyXW+Rw
	AIgq86A80JMyfc9cKpLgM7z+WHipIw3Y+SsXuY9Rq17HkqO/ULK09GdIq5mnYrJg
	H3rSZbA4sYuBkU/sDL7v3keb5hDa1HScKcpqzJh3IbDEZa/LFyTRs25xoPvtm4JT
	aNkWg63HwXwEinCY+H93FbsC3dXL0mamqziz7eGSY6ZFs2BU319ImmEizQe3tAyX
	0b120w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m1jvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 17:13:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85dcdbe502so3052029a12.2
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 10:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780938800; x=1781543600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6sR6VFzoNr94h9hx4YsrKB9qsr3ZjM5UBWPXF5PAwIA=;
        b=GHQofptyCT3r3QI2knkXrJXJkyyFWSr3NJi3o7Is7OHt6I8KwRgqphiK7LHsbjvUlz
         RIUNM7kNRGJovOzbZgGvvXnl5URSltisawSqoGSx4fz3AJaiJtfcZBd2bYjGxPr+krNr
         lwh05Hbf+WOMWtO8IW2u5sNQPINuSbD19EootQiGb8KL0Y2IJKqMdpUwirUisv5RQaUG
         Tad6BYY6nu5VQtRjkUZGqbJ4ych84amOrBq/ww4KX9n0ebEEdzznWPzUVjN9m6UZZOck
         culKzlr1jLgj8W0eTyPOTX+Pg5+QupJcfp5EQEAoYvK3R4NwJX6+FO8WMU40kx46fhb3
         zigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780938800; x=1781543600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sR6VFzoNr94h9hx4YsrKB9qsr3ZjM5UBWPXF5PAwIA=;
        b=nibWx2h0gmLX8IX+UCvWRDEsGW3UEe9W5SxH3c7ruPTlDCG13/zfvSIivf+P/new9J
         c9Du+whpLl0epM8Z523cJOE9KlPsQDufoPYkoZfZ9/xIa15j4+/TECDkyQKWM9a+aO3C
         3P8YRWpe/2o7vyXoBYbQLUc00/obasv5o2IKcJF5S7Hpsr/9UL9GW0I09XbZCrio1JoG
         13xF77PhW/hvJrWANRGmkoFvBkHmjVZ6SmXPlzlX/YPgMrk6e5Wtafu6yElBtyWVqKgG
         TdBPOpDcfn4bzIDAt2ERrFby761GU2caFuTgGrdCrgh6kCVW+ZkjvqQSbXj03vpdMfGT
         b6tQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dfpgNQCYisi7EmkqSjjuQSblLMKVSvNtXJnLU0DPJ2Bg3oQDaAUY+4nQTWaZZqMVqy3HRpXlvVWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBl8FMI5SKdkrqtqieVn9mNiQX64Dmr+wY+6XrQJOzPoQN6SHG
	Bj9ia4WUoIrT/LsYjMxzpDmD61+tKBJx/BTlbsZl1BzRT3lAjdb0IJhWhQsiJ2Qs3OSd3ymM5I/
	aJm2ADfObUhvDJjZgiJ/qAZgk77s6AIjYtZ6a8eHb/bmyS5KRJNETVTLsvsZ0YoM=
X-Gm-Gg: Acq92OFA+rUiiiOfhblyDFuZsqbaUPm2NzTW7jGaVTn6cEnBFjCbDwGK6a/9uyGv/t9
	kwu4Q/KetmNMsRm+Pfn0sPL2x3NcT4RxHdbO8tigwk0fwvXw1Z+VmzjzS2aleJv9jK5XOH3e9sQ
	e//DeMEYnQGirVclAMFogZDq4PyO6REaSFLww9f0JrmuOhd1viylQ/QAVBUDSd+0uV9LbOJLdW8
	d7Gm6yBPrxt15wwbpKae4JU4Oo67hzqW73o9lhwQR/YS4c7yj/KbZaz7Q2lRvN6qdVamZ+w0iG9
	kf313urXXAdB48k/wo9q0uLlVbO8GBqeuW0Wt8dixLQNbNiN4/OOT3CG39Zz0XPJ05IFzmJiE67
	M1qR3sZrVp9ON8mI9S3g3k3aDwjuX0GIqZfYRLkCWOVbQoH0CLYZ9dHWAxLo=
X-Received: by 2002:a05:6a00:2d85:b0:842:74e3:48a5 with SMTP id d2e1a72fcca58-842b0f8febamr16529201b3a.16.1780938800171;
        Mon, 08 Jun 2026 10:13:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d85:b0:842:74e3:48a5 with SMTP id d2e1a72fcca58-842b0f8febamr16529154b3a.16.1780938799688;
        Mon, 08 Jun 2026 10:13:19 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.26.61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828daf76sm19056739b3a.42.2026.06.08.10.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 10:13:19 -0700 (PDT)
Message-ID: <13855a40-0159-4fe7-a886-a8d18c081e12@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 22:43:11 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2
 clocks support on Agatti
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
 <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2MyBTYWx0ZWRfXz4uvVtzCnx+J
 46dmqHcCIQLO3jfaCc/IbaWxju3e0w0m9uL97jMl7LxVU3RVBcMrT4H5A4OlTUWsCMTvuBdKR2v
 +BsK0b4RAxS0TUdkS+NHI21s/7uARA5DIO/ZqCSvj7PBX8dDlLPymsQqp9/lRKAM+OZwRxzVJo1
 mCEybC+cDF9Bu6Twfkj+YggMTjUpDDOBMWaYhgWwWF7T6Uj8YpZD9E7CPxvvHNiYUSOkUY2KiR6
 BJUC0hwpsvCw9mrTtwYqhO9aoYQbJMBIdOefhr+x2RuFxzPmsLsrYYrwW2Dv0O5MUS+V7ApNxOV
 efZU/PhWt0s++6dK4ClOyULdOX3dpUM82sYLBgXXzG1r0+UKizQ4u6mSqlLnZ+UCBR/Q5OUXQpc
 k8nhqa8wd5LOA7eTuo9rVgIZvqcZ1Al0g+bti7wmn4fWFqR7+7AtDYCslGQpgUbWKmg0YdXw3nS
 EmGQn0eH7hmPX7oXVyQ==
X-Proofpoint-ORIG-GUID: fIkYAz1cY0F3PCa18LbHJg5w6SgJ3wKn
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a26f830 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fk8PawD9j+7+MWV0iRjLZQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-eDLaE2-C-4KfPfq9Y8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: fIkYAz1cY0F3PCa18LbHJg5w6SgJ3wKn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080163



On 6/8/2026 5:51 PM, Imran Shaik wrote:
>  
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk2, 5, 38400000);
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk3, 6, 38400000);
>  
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(cxo_d0, 1, 19200000);
> @@ -1262,6 +1263,10 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
>  	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
>  	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
>  	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
> +	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
> +	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
> +	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_38m4_rf_clk2,
> +	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_38m4_rf_clk2_a,
>  	[RPM_SMD_RF_CLK3] = &clk_smd_rpm_38m4_rf_clk3,

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

