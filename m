Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F59274B46
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 04:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773806739; cv=none; b=OV5DftiJVlBy25+65aDHpgKmvA1S/ITvwoK7PXSqiD8/4JdTsJ60X//glzq5pyipNhiCGHUy9P+pTokp3/b0SiV2AjS6jx/Jn0RRwLTSrK7tDo7sehyD0GSYOFtp9dFD+67lPNlpsviJZ1VxC6ptJlo5vpMfaQDuVWpry3X8zeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773806739; c=relaxed/simple;
	bh=zcoHfvFyrYvSLr2kOf8XVi0qZBsPT566O6cVYgZlUTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YrhpubE1yRIEcldfphAOSUeBD3teXNqXxqcjWtATN5hZ+tXsOUjW/QbYg5fogiXrAM5aW17Cxiuh6I43xOPRm6FqxD1G+myVKtBb9o2fQ/5rh3/w+VhOpaAJidinVbkNLxPzQhURz3nqPx7NMYwN+PuXr97Qjl/P9JGBmfbd5I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=paLwn93Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wivhz/8U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="paLwn93Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wivhz/8U"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I3IrNS2730235
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 04:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3SrK9mYgwI7NSVaaqY/fNysgz1UJQZeGTR0XtUZbr+4=; b=paLwn93Q9wUIJo9A
	uMy54svfYhUIYKfb3g/sXTTrC2Xwt0Nm6yt6XCxfVN8yxFPA3ODllqZ5NijpDEO8
	+sAKEb+LUN5PUn3L6WBiWihJXF2oweNePPa9Hq2aWZs2ffTUrtoTEZH6vtxelED+
	fYTUyCHX/U8wEbHChH9RK6sNwRPj6ZcdfF73N1cEzVal18bYDjiVE/17ZLZ1WSvQ
	yUp/CknpE248w8M88YA6q8E4/d7L5XJC5QsJvkQZlgjEOguJ5Lk8IyslfD3H2df8
	h0SP7nxQ4P4aZ7ADBwHJCE9lToZtX9q6yWtOOPjTjnrMPGs82Of1OkQyBSJ78URA
	fyHkXA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjtxta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 04:05:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aec784479cso392092425ad.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 21:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773806736; x=1774411536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3SrK9mYgwI7NSVaaqY/fNysgz1UJQZeGTR0XtUZbr+4=;
        b=Wivhz/8UN13TqXnjvuSPVmQ/FeTBH2ACppM1F9OeNKvTVWkVXAO6cP95mHjvvLxEh0
         iFNfAUPNkvxXweMtOWfxG9jSOJIy6iZUVGxVLB2i6BPfdWqkP6ad1V2MxXzAr14yG0QP
         bntlECSoqfGLyC1/2U2eUtnn7pMsPACWN+rV6GYeMqlNhl3mwiHH4tx1NMA94NvC037z
         IweFnYjMgYJ8ktc6A5U1MYyWIfZCkWacQd2DM52J4T3vlkmGUdVa1hF8rxuqROhQEdqa
         t+tzWv2Mk0B+YnhuzCjQNINHmEjcsctRjnDlqd/96VwKBKJXpKGUs9cqmixjsHNfVZwA
         jqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773806736; x=1774411536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SrK9mYgwI7NSVaaqY/fNysgz1UJQZeGTR0XtUZbr+4=;
        b=BGzyuIvmvzOwVeldRaNf8HbvyqLBVvtgS7hTDZ9agjKv0oxy0Aorouvd6kUmFxCy2J
         JAtoOwHYybrrbnSwLz4Gn8OrkXCckEwrUdvkMCje3D/xRqcNv0tKKJAudQZysA10JAZm
         CUnK5RrOkZqdgJ5iSX3IsxGneMOdrFKfGlFDQ9EPI9BJwjA+U5PilHlaK7PvsewEXLpb
         ryJ0o1dtJ0vLcKCxIIq4t8Q7M0Uo8Ivel8xOimffPItk2dw/aEdicwQe/CubLkCVLuNQ
         MIuv92RoLcb5N5SxnvFFUiDpFvnwPVmdshYHIQnlkPUWGcaCSWybd3NPeE1a8kJEmjqh
         UIQA==
X-Forwarded-Encrypted: i=1; AJvYcCUIMSeR3eGlb9ctymKQGz9V1yyF+4FqbbAc+Mkz4Ou1MfWlvusnmzOeBdSD2p3YZMSgJVo0TrA8mUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTlOL0Yg3Vo6kORjiK4+bXBOr6GiQhTduEdewTtcCxBEdRzpV3
	sJ3+1dvmcE2rFD5/GyWINkRxacD8B4S/Gvn9+3FecLqPlHjPTldKTplYFQUremMWV0VNDzmZrpL
	sJvOuGUiYbTg9FB7JCJ9fTJ6PABudc0eaSJb+qWo3leKnf6kj5JwIuY8kDLLw5kI=
X-Gm-Gg: ATEYQzwHFfo0W/GGhnPZ4SLtTEKDElstdZ98RSPEQJtXqMnU8d6YfaVJc3+NfNzVUXf
	TmMMT5EC/5QZgL7l3/Cd1Ll4D61unrMFq8bArDugZTWNy694KUb9esxadcO7l9nR5tIsH69sprH
	cEa+TwiH9LCVW76g7u92JACYG/250VbsQG0GktuKP1vNqvGXb6aJdacaCIlOAtNzSX+O/uADJsq
	etyte2LA2Frp3cY+QrVc7M8ecwX7sQY5Oob3aaRXlga1w0lFfaZUE5ZdpwuysoOGHD1OrO7y85Z
	AZPU4MXX+nkboWTnuTwGuZNZDrUUuESyDvyaptpf4i1+ZtjVv1IskU+V4q0KDp6vfq3yF7Mhkth
	mr+RsusWNTlgmWErFGq74lUhlS+ZXBUFdYAKChBm6/sOovTs59A==
X-Received: by 2002:a17:902:cf4c:b0:2ae:ac0c:5a29 with SMTP id d9443c01a7336-2b06e323431mr19012085ad.10.1773806735685;
        Tue, 17 Mar 2026 21:05:35 -0700 (PDT)
X-Received: by 2002:a17:902:cf4c:b0:2ae:ac0c:5a29 with SMTP id d9443c01a7336-2b06e323431mr19011755ad.10.1773806735209;
        Tue, 17 Mar 2026 21:05:35 -0700 (PDT)
Received: from [10.217.217.233] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e62fd3asm10424855ad.78.2026.03.17.21.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 21:05:34 -0700 (PDT)
Message-ID: <797d1615-860c-4829-a8f3-ee33ebeefad6@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 09:35:28 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <253ee25d-3096-407d-8d2e-3c9d1072b2ae@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <253ee25d-3096-407d-8d2e-3c9d1072b2ae@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAzMiBTYWx0ZWRfXw2dNzkeBBydi
 G0Ssp28qdJjj8FbxhoGrADgKdlMzN2vOBrq6JP/LEGQQifRDiIo6Ck0z9KboerFTggCpAvc8PEh
 Eh2C/O/m0GbZEVql5dlZattT1/lQIeqtMCjZ3ieX6lGCxHHDflo3q4UKPW+lCGxFHjJW7I7v+HV
 KK1BQ1Af1fhMp2nI85NP5Iw0Sj/b5lYzAmUDoc5slAbGIrAWCpaGJc6x65gA3ESM/H2OCDRu06N
 XsUIfTjGajNyt5UHNGmTxT1ogx6sICs2mI8M/C9wU+OLFcJSRBNIBZN52K52sHWDy+Rge5s7XAo
 yUaGgJ4iPPsa9UjQUzOEG0mRRADRqcMwy0torE/GmkdltZYZIAsV7l7KswYBkOfuUQ+SvVMwiHO
 h1fu9EmWqRTuXXiqM/PZlP5KSxt8Bx7BF+ZjC3UQIlUmqupEquCRPoZn8+NMCAiN+T/usErkCSR
 IAyft3GQ+bhZTVUdEzg==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69ba2490 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=k92yKOBYwQCJlanLp_wA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: x9i6WKTJPiA4ZXBGVXmZPlcF9tb_o8Ru
X-Proofpoint-GUID: x9i6WKTJPiA4ZXBGVXmZPlcF9tb_o8Ru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180032



On 3/17/2026 10:53 PM, Krzysztof Kozlowski wrote:
> On 17/03/2026 18:14, Taniya Das wrote:
>> Add driver for Eliza SoC camera, graphics and Video clock controllers.
>> The camera clock controller supports the cambist clock controller and
>> the regular camera clock controller.
>>
>> Dependency:
>> https://lore.kernel.org/lkml/20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com/
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>> Taniya Das (7):
>>       dt-bindings: clock: qcom: Add video clock controller on Eliza SoC
>>       dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
>>       dt-bindings: clock: qcom: Add support for CAMCC for Eliza
>>       clk: qcom: videocc: Add video clock controller driver for Eliza
>>       clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
>>       clk: qcom: camcc: Add support for camera clock controller for Eliza
>>       arm64: defconfig: Enable clock controllers on Qualcomm Eliza SoC
> 
> On which device did you test it? Considering that you told me you did
> not hear about integration branch with patches before, I have doubts you
> could ever actually test it without our changes.
> 

This is SoC which is already tested with our internal mobile platforms.
The SoC w.r.t clocks remains same and has been verified and work well.

> But regardless - on which hardware exactly?

These are our mobile Eliza MTP platform.

> 
> Best regards,
> Krzysztof

-- 
Thanks,
Taniya Das

