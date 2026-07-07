Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025BF3451D9
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 04:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400210; cv=none; b=KMxtQLzF2nQeicC0iVOywb/DNxROcLCrEYzolIgYs0GySK3k8o8GSRPSyq3ANmexXxqDLFcU7gNLZ9FdpFYG3jxDOnGvN4I5Ir+ysYXSiSc8cyljoquNJIh2gO2BmQZUU/FErbBD4gaADfLeGZqSef0ipqbjgFIJ+FEegYGh4Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400210; c=relaxed/simple;
	bh=vXz54n66/TEAdayCSDoHBwW3Q45l8xugwYa2FOxX2QM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ATpdzKiyroICq9AhtK2ioRubrT2zeWaqAETIax3qMgc1V9CDD2+bCodhY5tETeuHzMsEqJPova3nwOVj5t9VFbTkfx1D9ea6R1D+rbUHPXBkLnQwtm73oXpgUkiDDJ+seOPf/1jJv8M3dg19qBy2twYApqkXyWNkVomMJmDAZKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ezh0nooI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MqOfvGE+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ezh0nooI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MqOfvGE+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748hnx2514399
	for <linux-clk@vger.kernel.org>; Tue, 7 Jul 2026 04:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+d+gXhoD6C59d9ofbkaw9OT3pWH4Qy/IVK3mTBR0HI=; b=ezh0nooIK/ACSQ6L
	Tmsys7GiwEYTUB8Lvjr6c1O+HQAwy2xon+esbIBRn1No1wvzN7CuJJlgSjlNDyWn
	vVQS4ZxzIzoZwv7jlT+Z4QKfFzpgjh0eHiUxknXBOKf++3DcWHkj0skonrp56hB/
	RNKbqHfHEzJ0MEj/5OhypGysfJ2e664JN1Oi3+MVKxMzhmHwsMSjWTW8Utj5jfHw
	L5q0mVC4qSUbQVvKbhMq3UIiWaSrjgM+rM9X+2Kaq3DudgCUdLHevx9WqCgAmwh3
	yEYo4akDrvDtjziQv5kVOondJxciyEgWdD7ryfgaEYieY/AMoUpHsicthaYR3DmX
	t6yBrQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8g7ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 04:56:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so35696185ad.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 21:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783400207; x=1784005007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4+d+gXhoD6C59d9ofbkaw9OT3pWH4Qy/IVK3mTBR0HI=;
        b=MqOfvGE+3z2POHOM5jlJTIXTt+BFgVkcs1K9YDTxiKZxRLEBs0iSym7/n+nAb6KM29
         HVXACncXx8wVg1IeNM8dWc5HTsyRWBKETaU81atFT+5WtPjKNIW6JqbSBS7blLo9lfwU
         70rTotxWZC0K7D3CRwuTH2DI/PQ7JuoiwFRtnF6sedMhU+itlAOEg4iBCUBsCNP9/uKz
         sw7Hc14+8nSgBNPHCtfIH36uf1Yb4fN2D0D2p++DOoZNHLguWPxkDB16pi0JS0w2F2JC
         K7BzfKK6mq7QbjS38i3cjRC4nlM/VdSXyYazVkDDeYOt8oesNyoP95viA9h3HdD8TeNu
         E6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400207; x=1784005007;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4+d+gXhoD6C59d9ofbkaw9OT3pWH4Qy/IVK3mTBR0HI=;
        b=dVujRdNzSOvvSj/5zXLKVwDCYMEGM8dcs5+m1gUuhxaH+KCdPQyGb1WnBIbZCbrkqv
         CxX/JlkeTvnRhz0sKIiYLKmd7L877DTKfXWtgIi0NiHOh0C09do3o19SeU39RLG4/e+S
         w85eyyuNp+5JbqH6mTo4hn1xJ/NmrKFZbep07EFMgyZmQJjqbhdRXVmTdBYL1qjnUOwg
         tL8gjUeHch0A2dyA9u3kUhAeRDWvE/7DB5k2MhRkoxpvKV15pAEv2t3iHQ//7JWD2UOv
         k6dsrh2jrQBmSPRjTi2/FXeKJSGLcLPzUhQ4ZtW/FRyLD3cip+hUdIxQKCPaUjOMNICK
         7BtA==
X-Forwarded-Encrypted: i=1; AHgh+Rpo+yhA9jqpgvpiR5i2RQal8EQrOL7Pu23Fa6aEs40Yd/ZSd48IUwIqK+69P/BA72cikR+NmWuzKCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxqHzS6P3+Kw0Wi1RPLp67FtId0HfRkz1geoKPhnsCnTHSkqri
	r/ePyZs/1r+ffUsyV5lpt8/8DK1a9rbSKheN767jKW+gAY7Nu87x+iItfRGudUZQQrb0YWghgnd
	dzOPMabLWyv6GUHaVQcGOkItRzSze+Y9SSjBh6EkK/DKmmQCyWJP2XkPFIuA/FLY=
X-Gm-Gg: AfdE7cn0sMK+Te6KgTqyxedWZvncT/rFkqCxtZuWU8cGSJ87W+l2ocnoRDwJEwOdx2k
	15zZMVK65/i9rguqYb1+3WgYJC4UGa0Tty7ohPgNNLwEqLioRK9cwphb9kMyBwK3rU3uLOyss5E
	MLdWoNagNGC+MlCoo1YlCRkdKdmmRNsXyqOXH8LZvUKHE1WVkPE6NKSkhs6fCyHddxsb4htm5P6
	ZqaWUd5OI5z9VQePe9CQcpGu3K7T6/9V/7TnctyoCoVqe40k9LeqN6g6/ceCLIh3YgtiCiHNQjb
	zItHFHrL9Z7V3xjQT8GV+bc2mZQ2njC/q/pysiQCjOXTBpcB/X/MCZB7DyihE0w78qFmr2XRTSD
	pG6zc9fZeGuBnjwIBU/ngiSy48DQ446sNErPt8wU=
X-Received: by 2002:a17:903:388d:b0:2c2:be43:39bc with SMTP id d9443c01a7336-2ccbf041c76mr36039865ad.22.1783400207530;
        Mon, 06 Jul 2026 21:56:47 -0700 (PDT)
X-Received: by 2002:a17:903:388d:b0:2c2:be43:39bc with SMTP id d9443c01a7336-2ccbf041c76mr36039655ad.22.1783400207101;
        Mon, 06 Jul 2026 21:56:47 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdddsm4515115ad.77.2026.07.06.21.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 21:56:46 -0700 (PDT)
Message-ID: <47c19ac0-888a-4488-af82-70668fc78041@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:26:32 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: clock: qcom: Document Nord display clock
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-3-860c84539804@oss.qualcomm.com>
 <20260624-logical-walrus-of-enthusiasm-adfeb6@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260624-logical-walrus-of-enthusiasm-adfeb6@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0MyBTYWx0ZWRfX+zPSeO1qbrvK
 j/hizsNwqaXYMrDia2a4v+VX522kwzi+UMwY3+HRVPbws9YEnOB3ZuhBrg+0ZuQeeBGoa5BEEC+
 c8hsyJoikdi7xhgxN6c+0JgrYGov0e/cR6SDPNyZZxEWf9z9of5hWK4jQlppjXg5rCGAgaBOLC0
 9Nm/C4pznVX9h48tr8w50I3pHp6eek3WXkNAfHCBdAVU9nW/qHuamHIPhVROC1b9fL1qzX7qL+u
 RxvqmhnlhHVRpZ59RDN7BIchgeSotPQdRLhN/QsNynNpced79kipG2VXzegC3iaQh4LdWI3cI9G
 Uzrbe4OM7dBPzggQz7Kf2oYGnDucV7A3dJSi5DLzi81tHFuZ5VIuBvGYSM4lYiO9Ubr4bi5zveP
 aRrqHyXbOwTEf+ZBNmhY1aMRwWhKwRt6lBtQUcgRK6dOJyDyny0q8cnYCdPs6kAMUkbBqkITRAb
 d+7AP0/Dqxz81FHH1Ug==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0MyBTYWx0ZWRfXxphjCFbAqCIi
 2CFMTTASFHcgIsxU2GFdICDCiR/vFI4sxr8O63pEa22DcjTaYOYFOmdJfq8AoTIHurgFwOikdnd
 d8r8Ebb/ZefzSjKKaxeFPiWd7pF3iNE=
X-Proofpoint-GUID: S61yq0YCP575KjA31fjkScumU7yVDlfa
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4c8710 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=-EAjTSGrLCXS6oqRX1UA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: S61yq0YCP575KjA31fjkScumU7yVDlfa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070043



On 6/24/2026 1:23 PM, Krzysztof Kozlowski wrote:
>> +
>> +#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_NORD_H
>> +#define _DT_BINDINGS_CLK_QCOM_DISP_CC_NORD_H
>> +
>> +/* DISP_CC_0 clocks */
> Where are clocks/resets/power domains for DISP_CC_1?

Both have the same resets, will update the comment to capture both
DISP_CC0/1.

-- 
Thanks,
Taniya Das

