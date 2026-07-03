Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3183B5305
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 10:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783074307; cv=none; b=nj4FaYDOC9GS2TLjn7wZ1wpqY1+UC8ZELRCynvHHIiCXM7DyiUz78F2CqpWvsSEeo3E2h5Y/roUn6zfkc2f9toTmu/MzL6c/KjFJnQubOn1vvuACrUOplEOaCOZB9iVjitiqgnnTvg8brGP2TKOAhI/9PFoHgUe4tDONgh8MWaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783074307; c=relaxed/simple;
	bh=qFvZLNREbSpOF+NiMhblUAB7z7xJQekjfCTZF0fdOsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WIArun2O+akQU9NDlrNoe0VcrZ9YvmLohY45EVxqNv+OYpQw/K8VD61VvrLH/S5gD5YlzDDGfcNtJ7B/A3+d4h3UoCEEXcf/buNhGp0CULt7+N+SYPkuqhulSzIWT24O7U0qDKu6vIa6HRZyl1SMvHrJFbmYheqHnbfviFGG/O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJxAZ0lR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J4lVQUQO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iJxAZ0lR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J4lVQUQO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663A2uSH3772703
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 10:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wLeD0IRUCCbH+NWwe2cAI6SCf7hCyLNverNen8uXb/U=; b=iJxAZ0lRy9VMvl08
	AswHq8gG8SVa2G21u2tYKvVg9RmRMC68nB0h4aZiGIs8q5x7RLADvxk/1BTMAjni
	jU+M3P9rB5BsZ/wOiKw8HBPZpm3lTWVqxY1LrwcZSNaw+43m3FNQOrf5GXa8R6BB
	kQfK4Ga6v7Bem/tCLOqOiAfOHCJLwWFw95bUhaHzJclBkWs/nygbRj3COWB1aet8
	NdbXdVU5CfQYp2flEkVGYD/NWyGYP4hayuLopwG+XHMJ2WtXtwC1T3k4mlMZzy6y
	u4AWbpcMYHNEFfR78OmHrYkC3RDoe1Nla9na3y6xI/y/Twi8jTG5Qt3+Rl4E4cyZ
	55WlKQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b0382kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 10:25:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21be5bb4so2942171cf.0
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 03:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783074305; x=1783679105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLeD0IRUCCbH+NWwe2cAI6SCf7hCyLNverNen8uXb/U=;
        b=J4lVQUQOilE3Wo6Vr70MEfE2yidNDubtA3uzAF6jZX2s+quVXBZsh6F2SPGhE5SWiK
         qBh2Y5X8Dvu6O/dgLrN6bHZVucPmp9myVvrMSqWY16tAjrlabCXuhzClAmaNQCmAggfv
         aArMaSlZkpnskNdJ/xv+Bn0nuZrUng5XvIH1eYP4vW7HoSY2bgmqwiEXkmcDjwkmNlks
         o3D+BnNhzAi9L+hyUE8hSQZh6TouWxyC4YZf6mtZgFcC3d9js6e3xFV3Yl9bpXofKtDf
         bMawitLkzS6o6qbewXrUtqUNy7hUKo9jffukrdABXUVr9U8GwbzmLXmKQMuE9Ye686GP
         lbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783074305; x=1783679105;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLeD0IRUCCbH+NWwe2cAI6SCf7hCyLNverNen8uXb/U=;
        b=nMc5Jj0McS70qcvPoVSzOwmoIh0H9BELx2HrwusmLbnQwEW/SAoSnxVVzux0AwsDL4
         1IbWG5KZJTegtvWQozk+5LAdGlKO/rVDU+tJgP45QZ/IPNXYNJAm5my+DXw3tHiDmvbr
         lNZuAG9LGUiOYqTVXhOdmKpboTvipj5Iqq81u9fkXOgxkuLbDGVWB00gPW9N09vvrIH0
         Qvpea3PJfn9rqeNnUwl0kLg6LXfptO13WfL77503a+5vm8CDruRk8tDjWFHOaIjAWypA
         Ccil30ouNDrBBbudMA2l/5UPC2+f3mPvtotPaBsu8xgP74oPJgiArDYPvQd9J5NTYf3q
         FX7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9aE49w7rYdIzQwK+e1SEdnfW18de9OEY2vPU7bmT+llAwzl+908z7CYpQh/Yv8HEeTGte0EySif/A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk+K2VcIh1u8m9BNSkRfs3OWgUkXx/0wYjWHERZ7lWs/HIOp8J
	QfJls4EZlxn0koDr1OvoJ484k7CxsPlG3VXLPjkGlFxPxkIIZeNYaGST1uwDhdPjwyiIQEgZAMm
	GfkkKAAf8cH8slATHk5BDk8WMBs7iOjVjIkRwIGtdlObaoTrDwZnxfEQ5PYvGNPg=
X-Gm-Gg: AfdE7cmY/WRgLQ22cy6a2huP8nDRSZAJfpYpWeERrsquJbUPrEMXfVvxR7HYPXRdgvY
	H09tLMrr2ULacxIAMn1rye1G3Xh9UBlJf7lzbUS9eUEaQz7AzWRM5eUQJ4xwq/EZY060iNAVekd
	X9I7Kco6N93S/E1N/8ujxlHV2WkCsCKnKSNQ6ZQA0t/Tt9+0Tkknro5ICs+LsPwERgy/JwJ9xJi
	eGrMQzhXznW6Vs9uEQ8pPGMTMbL7xPbPwfIfWlDTXrikOLk2hNQDbtfF3Wk3oAi2lvIH3e9okJK
	Ei4qIbI7mt6ObMgs1sqea3yQNrcYzMgSaNPVa7F5dvEotFvMoLOzR1k4M8DgqbAMxT8SMG5U7Qo
	GuSI8Ro5jhURB2sJydRNqQUpKN52s3FWm0ag=
X-Received: by 2002:a05:622a:118e:b0:51c:2324:666 with SMTP id d75a77b69052e-51c26a6b823mr79308831cf.3.1783074304696;
        Fri, 03 Jul 2026 03:25:04 -0700 (PDT)
X-Received: by 2002:a05:622a:118e:b0:51c:2324:666 with SMTP id d75a77b69052e-51c26a6b823mr79308631cf.3.1783074304270;
        Fri, 03 Jul 2026 03:25:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4a72sm262349166b.43.2026.07.03.03.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:25:03 -0700 (PDT)
Message-ID: <424aa2d2-aad3-480c-b63e-bc557839971d@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:25:01 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] clk: qcom: Make important ARM32 drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
 <20260703-clk-qcom-defaults-v3-4-78894525e54a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-4-78894525e54a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwMCBTYWx0ZWRfX4EyNh5dOWl4I
 62dIbylSzW1oFpBkdEcKLtcoNClWy7Y8Da/lyZS3B/73CuRSCzjwN20E3k0Nj5ys7nqSs1QzO8J
 MZ5eBQQzMer+CtvsDL459Wa10eBNbtg=
X-Proofpoint-GUID: VO-6Le9u60bH_Q9AXgt3G3V1jmH37Ron
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a478e01 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=YbJbqLu5s_8SUIbSLSYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwMCBTYWx0ZWRfX+SiqXpq9Uriu
 xqrg36+sLc2BzfAb8VpeB0jgca7FQy2Uuta2HJ/fztVayGh/IMy2eeSmzqhg96rv2+wImiBWL+2
 /X5MzVLy1U6LE0yT0loVuIQVnH+hjprURsgWZdk7b8kOXw2dHIPQ0ktBa1rDZpdUewLAHA/LtSw
 ab4Mx3h0UB0Z3AzjwSbHkkiHa/n46T2YBUBllx21NoPwYCWCI9s6St+xOi3RJfE73X6uo07dPVE
 uzXo1CFwZF6mv3OwHp0/Xdm51LkRX+XeKiNwCSoAHYipIxMsElodapeFOr0PZfliOuZ4GaOuKqq
 cRMMklczdtxEgd6fgF58h/oeOaEQ7UWLwrfbqwKABGioMXI2v42eYH6zs0vyYLugIMNqM3JMSUd
 uw8Icreyx2JKXjBvj3H1sIwq59udd1xslA38Lwz7CNJ7X6ihPDTvJ/sb5wpoppaRa9pnEzagvyA
 qxtHU2PZ15JG1sFVJzw==
X-Proofpoint-ORIG-GUID: VO-6Le9u60bH_Q9AXgt3G3V1jmH37Ron
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030100

On 7/3/26 12:04 PM, Krzysztof Kozlowski wrote:
> Clock controller drivers are essential for booting up SoCs and are not
> really optional for a given platform.  Kernel should not ask users
> choice of drivers when that choice is obvious and known to the
> developers that answer should be 'yes' or 'module'.
> 
> Switch all Qualcomm clock controller drivers which are chosen in
> ARM 32-bit qcom defconfig to a default 'yes'.
> 
> This has no impact on ARM32 qcom defconfig and ARM64 defconfig
> include/generated/autoconf.h, however enables a few drivers for ARM32
> multi_v7 defconfig: IPQ_GCC_4019, QCOM_CLK_APCS_SDX55, MSM_LCC_8960,
> SDX_GCC_55, QCOM_CLK_RPMH as module, IPQ_GCC_806X, IPQ_LCC_806X and
> QCOM_A7PLL.  Enabling these on multi_v7 is expected to properly boot
> these SoCs with defconfig.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
