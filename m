Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EA437FF46
	for <linux-clk@vger.kernel.org>; Thu, 14 May 2026 10:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778755321; cv=none; b=KDuhDzz994lsuL+5ZywifLY70BfMypQ7Tp409nGGWpIOUzC4YcqbUgI+6eJI3lbPcDhIxvfW/kZE+kKvo5ZnS88y+N02EmhJGYrlTbq0QzjJI/uUo39osb64hyjlnGp3TF/S71bDVk3rVkfTits8qW8RMEyPMMcDQ1E11rdJm34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778755321; c=relaxed/simple;
	bh=44VD0T0bpMhW57Rqa1pjNU+Tx+b/FPZuIa/q0GXt/no=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JZuIt7JRUNMCJajM/SZE1Pz6FozyXu9dsjIyKgYEoJaPr4sC96S1XKitHonkRH13bl/gl1B8AVVtTjTwPTLR7tLQ229yHJQotAK2j83bbwC7S/PqCRCPeK0jHb53aJdD3mCllcCCQ9JRL223Mr+3GNyl5T1K2DYUUVNiQgklOko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pzTSOTQv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E8fMiGDT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pzTSOTQv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E8fMiGDT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9kMZX3702325
	for <linux-clk@vger.kernel.org>; Thu, 14 May 2026 10:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPKozL8Bn44pSJ9LJCFbqQRgLLCIqXXmM8frJNhG5ZQ=; b=pzTSOTQvm9eYi6Hh
	Sg4LiOWAdzFxxZPQZIcdOReqHklfHrQa1npxWi6468lTc+ScYA7hQ47SWrxpRfKC
	qOOrGyHf9Ej4UgIHAnXtVEM2sCDuKGKj3QQZmjJw8kDccD5ky1p+9yDernNzha20
	hjM+g8K0NMfKH7BvwmArmOl08pxmHGlNOQwytgj9aIhtUnlxkp0q35ZrxDxsvCZu
	UL7hrQG/ULKd0xkb6e/o9jtG0SBFkv+56KoWERP2iIYWRob/9MZ2TcHvaZhgT+kj
	8h5dIGqACrWEbm2yLuJDhqVEMXNkeUqaSE80W2PWgIhvKQG+hWJM1JSUFdzyBKsy
	goFgPA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57kss63q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 14 May 2026 10:41:59 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95cd22ec862so453365241.3
        for <linux-clk@vger.kernel.org>; Thu, 14 May 2026 03:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778755318; x=1779360118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iPKozL8Bn44pSJ9LJCFbqQRgLLCIqXXmM8frJNhG5ZQ=;
        b=E8fMiGDT4qGGEeiBxPWmnDQEK38boKudAId8zAR4fQ7zM+rjGru3J+klovGgdraXZ2
         QcRiCuGazEnGOx+4DdiNtpE8L649lKUIZ2idaIPn8gAUdm9boQr0rBSnyT41tH65Vt4G
         g6ZXz7alvSg1p6H7d2rX/ZTcjTAtDPnu/2W4kBInvTkpigofY72lasp1bz7d4F6gHV3a
         OgQ5T1SohxNKZpIjAlePMDwd76G9dljO3LtxzwCtxw4cZBP30Hih3MbcpXylvXjOmG3P
         fLNw35/26/B+KQPBV7S6jmy9LJtqdlod+RSySNCBxCaKeiIp0e0lb571Okkkas3lhHdh
         cOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778755318; x=1779360118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPKozL8Bn44pSJ9LJCFbqQRgLLCIqXXmM8frJNhG5ZQ=;
        b=V3ebs4n116dH13a1gxeyVMjIv2867RWf7FdjI+ZXW4yC2QSCDnHRlz6QzfcpKOQuy2
         G0Z08yXBSqLKo8q9xBzloCnZMY1KThBcf7OCoySQ9g+SdCtwrDN+zoNVgfb9FBLJWGvt
         DxERVGsVIE5mLzNxtbDGkVkoy+tDLVwVxA6upEG6xfCTHhNUWSk+HXAnX3O4CP7Ishfw
         lIb+GKKVT5HLXnlzE704VH7YIPuHimVywFoxdg7wb8E5KewPsbFrt/1yLiUR6UUI8ggI
         D6hl25/TAHpgmuT5PHvdolCp3W0o0H6Glpu9Bj0XmT3i/mxfki7mhXqje46TnPIaRbD0
         6kfw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZFLu22ZEQ6fAXIZMV9gP6LtDpyMnL/QJb5b82T/q9BkQ8R4v4TlWHuPN7GwPp3KeoR0eNDCBW3xY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcpqbpqq59hnIdg71H/Ehb+q4NT6PhJ7VaK1xuajKYZYzAQ0YU
	0yDvKdj0Waf/4gksLoT1Reg8x4f7l+MUJHP19i3ImNa6emY85i32szN+KxFeGxa630qq1ptCNZc
	o8GX3FOxyWW6QLk23gb+6juVsUkGAVPqFzUxDBloRHyDD4Bz26Jz8iiFkP3IzmeE=
X-Gm-Gg: Acq92OG+up18Z73M2QBVoDnTosx9tvGtxWstlj6r1SdvH4UDOm0gCjUjZ0QqVBwlz43
	Sjc5w+DPbh2Ey/aMVtXM4B+BbbWMK+VexI2fIZvm2ooDE0Xel9+ty0Ku7fYZ8hWkT5jEqeVAnj9
	JlGPY+MEO6b8qzCnDZyhdqp+xM0iOEvjM/7eXhgNtrqUCiP87KdSC+tIt1TAYzbNkX0Fza9fQlJ
	BOHXQT02Qm7FDtsKD8eqEmE8nE+aU2o5Um7DCaeHGmTWMycBfmL7yZAQDD09DY4iRF01Q0G/EUK
	wKiTbMWM9mMJxUHLQDF7/Mlrp0CI9rDEBqSJE2JTskObK6QbvICwi0tGheozbk/H+KFMUBsXUvC
	mXtPtU1YiNLSM5JTj9PdArmc7bfYCvLKkde3u9jC/h4TytLU4sztBL+HS4CxoY9f1Y4pbhU8h9S
	42RTG1azQEKaSP6Q==
X-Received: by 2002:a05:6102:2924:b0:60f:77ad:4bed with SMTP id ada2fe7eead31-637757febb2mr1344333137.7.1778755318333;
        Thu, 14 May 2026 03:41:58 -0700 (PDT)
X-Received: by 2002:a05:6102:2924:b0:60f:77ad:4bed with SMTP id ada2fe7eead31-637757febb2mr1344328137.7.1778755317984;
        Thu, 14 May 2026 03:41:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c3150dsm74825266b.24.2026.05.14.03.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 03:41:57 -0700 (PDT)
Message-ID: <38cf589d-002d-4e36-ab63-8f8366609e0c@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:41:54 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: ipq5210: Use icc-clk for enabling NoC
 related clocks
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
 <20260514-icc-ipq5210-v1-2-b5070dfbe460@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260514-icc-ipq5210-v1-2-b5070dfbe460@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WFdw3QInc6_xDG1cvss9VTsGzAx7GaAv
X-Authority-Analysis: v=2.4 cv=KZbidwYD c=1 sm=1 tr=0 ts=6a05a6f7 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8eC56JA1x6P3gbDAbPwA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwNiBTYWx0ZWRfXwEJL9k7mdppg
 XHAsqUgwPEmQnd/JeRy8lMlEk9NDZB+AeSoRsKn9ginl1qBCrX0l54qa3nTJ+Bzx0urSz5mK+9T
 o+cv/GOv4AJr6P8EBE3ncycOw3J9K2A83v+YEGp0MmYll4g1kOrGrY/B5AI7/gI4vEgn4jqnnxh
 keT3bqVFFFHS3ps29m8TOHWtmSTC3bpOJs6E6d2iAAPhP1d0AMtxCCgEk3iYjUhp9U34d4j1w6X
 3+SvRYvGKRlcScW1s1du6RhZ8VWNKpkaTEcivPcEnb7vwugWhB0pEwf71FYDckUXFxV1Ovoj1on
 N4ylSUkOcF6FwS8SaIIE5dYVTCLWbxG1yTwfFYsLvQgfDSXfGbnOVu5w6uSqZzrm9yrqPVNqQgu
 s7hiu+v7A+XZ7hIjIjCY863FKjP5++EUWcH7dA++ACwKlUlCx90W9UhiVPNAAC0YjGpMzPl0R/N
 zArFFnIwC8Z99VHkB0g==
X-Proofpoint-ORIG-GUID: WFdw3QInc6_xDG1cvss9VTsGzAx7GaAv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140106

On 5/14/26 6:05 AM, Varadarajan Narayanan wrote:
> Use the icc-clk framework to enable few clocks to be able to
> create paths and use the peripherals connected on those NoCs.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
