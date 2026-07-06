Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E79389115
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 05:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783315734; cv=none; b=Xy5TumksxsaWg+JH8JjoLubXWQgOD2VnrEdhaoLZyXiAxVIHpunKv5mk/AobtUwzOJVabiX9NhpxgZ+vIkyca+hcnM7C0TnYd61JTmanaIxKDzZXjpQ/GgHJDmnNFEatr+KKMvDqJI76UTcrj55YaXbZijhFMCnGniBmJpNbD2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783315734; c=relaxed/simple;
	bh=kTpordRqqKUl8WzwLQ+oGN1UCo8FnhtoeNRWYUBKhgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UNK/Vq3wxv+JNIwEB3Pla5HBVpStNUmo3H8N0kcA9W9zwpSWAVBP2hLONYKJgBK2qK1M7HzmczcJAjvjoNfp0N9PbEUnR7tltyQazEvb8zhYW5a+f1mNYI/Tm8dblrMsOoMDz7NSGWWPqfXJ/yat5ZTPDgRIEDkmkK56xztKoDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTCjD9Pg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lp2Dzwbi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTCjD9Pg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lp2Dzwbi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641UXQ3585408
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 05:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pAV+cDxNEbBgATm6StzQPek5m2H7diNkW5DFl0AvbJY=; b=KTCjD9PgjuqwdhZ2
	6dKSeiGSFQc61DcwHTYZuiPE3Nzt6bkRKmB7JAP8kqILuOjsKUx7MF0CpIPeFVYD
	RUCipmYE7vOki3GEj3C7lv3maOv+cKsubyRLeUSpKniySdE1bexIaKJqFrrc8brS
	EYxHmUm96SPfBzgOF7MTx1BMp3B7GbQ31CJYYApMm0dK1ebt+XiZ00Pfe5aplC/Y
	77bW6JHPQDoCwyfLQ5s1pxhDw+Sjixbg7CeRV/WE+Fo4BcRHQ+jOTV4HVkRSi2Yv
	71reF6u7d+jJhq/Cmin2Xq+gh+IiWjTMD8IeOHsjYw4gZBx6jlCPQdKF8wJwZjH/
	khhobw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8umgcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 05:28:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c916d17dd43so4183727a12.3
        for <linux-clk@vger.kernel.org>; Sun, 05 Jul 2026 22:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783315731; x=1783920531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pAV+cDxNEbBgATm6StzQPek5m2H7diNkW5DFl0AvbJY=;
        b=Lp2DzwbiIlRR85ZXn1AUzmG/yZM8HsKeWjDet5BXYEmsio4PuiQ5awemPKcVqJ8zE0
         SWgN5eVXfo+1ael/G7LR7m7EOIJVU3+oIP/cc150WBStFMjYRcCasCzjLVhzjuIhJfN8
         Wpb/Zaph3YhIuDH1PWpwIn10oYhPcSXA5NeCIcy+2ZAnjRXRuEOkkO53GSG/yGLO/Rej
         iUOQfl2mpC2vdjeRsNAXS7AiLEDEJZ7NwAVFKlr0lbSVmJn8xN2ht/gA4vru/oZXitET
         qP6NjdW1jgKDkT0MSQ4KyxqSAkfbUarWzZ0NkXuOy/Xl2buaq+mvlzWpsVjfSoY1PlTa
         wOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783315731; x=1783920531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAV+cDxNEbBgATm6StzQPek5m2H7diNkW5DFl0AvbJY=;
        b=qWQC5g5u6cywsHbhf0XHsXFtPzJZ5rKt3lK+dnmIYVhS9pn9K2Qrcxeg7whJTGimFY
         1zpJoptRiJ0ohMKFJHmRtTXLCZMogxEHIw4/hrugSC8NPj3+Z58zjOkQlMH/BBDKYhTf
         QskI5j+muhsFrdkRXFjZ9qOGmFaMQABK/FqKxmqWR+FnGhYwpRt+wL/u8IHdwdCtmyEg
         YMlHmcI/XEgIpvQObMZ/zIv0dRORJRC5AqIrdKIX+IVVAfkCQxxyuKmJLyRKbxYh9qom
         8GDjZs5F3TooeOCDyrdppT5wjr0iXMahP8JJdYZPhJ5D9arhBbKrAeFt9IAgQwl8c+HP
         l9tg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+ZRBfzhQCl0nFrwhlFZIlSNamqKU5cyD1GAEYudk7tyWTGoFcb4zvGBCsyEtEYBllP9drQVrhpT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YynWBcvRa32NiPXU04ChgCJmFYkNGS9sH2t+SbBstzv4ZieD+kh
	I9zfOdzS++hUVFfSVx9hax+vN/fbL7G/Riff3ecqikx1xr3VhwL9jAa/Kf5J2MmheCubyvGmG8a
	89phnDzW7/AkK0LJ7FdyQ5JIL9YHAPcnujW5MZ0HpLIc+r6kNFD4h7/C4zn7UH3w=
X-Gm-Gg: AfdE7cla5TgyNKh07IdHsnUPD3UXD44Jt7G2qwNr8aiOGB00JaiYXGT5uYtmaJ1V21R
	uQDccJNH3djiuDk2bxqxE3UZaD7gbDB4wIbf1HtaXLv9ssfBGqf4e/m6i7coSbXSKA1p6U/b9yj
	XfLoyUZH0c6k5wISmsDbOsN1D3klaI1Tk4ZqdiW/PGijwj9W5iIPbIYSepAF1Xp0LJqHaAS78DE
	+GAMcTmZaYW7xsE9qYCJHArYZRT3HtTa9yMvwjUyT+wQLyFNWDq7Kh7taSA3uUhQbNCxP79SNcv
	uXt/9YZJ53uor99BMSQZKgHm/c74Zz7xYYMX5MBxeprnL6DFQ30x0+16I7zsua1+ILE41vwc7nD
	zBjNss0jqx/va98qg/rRxqObAlTMkwhYCTfg4p3M=
X-Received: by 2002:a05:6a21:7a91:b0:3b3:bf95:f7e3 with SMTP id adf61e73a8af0-3c03e5469bbmr8361328637.43.1783315730993;
        Sun, 05 Jul 2026 22:28:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a91:b0:3b3:bf95:f7e3 with SMTP id adf61e73a8af0-3c03e5469bbmr8361303637.43.1783315730566;
        Sun, 05 Jul 2026 22:28:50 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0ef50sm5875489a12.6.2026.07.05.22.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 22:28:50 -0700 (PDT)
Message-ID: <7eaa8b9a-ba8b-4d07-92c4-3a965ad58708@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:58:42 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
 <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
 <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MzTH1d7-OHW_DthxbidWKuzvCWoT5Tq4
X-Proofpoint-GUID: MzTH1d7-OHW_DthxbidWKuzvCWoT5Tq4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA1MiBTYWx0ZWRfX7f1c7RMOoD8+
 arE4++pwPpEwqS4f0frfsViQKOgGJ9oTH3/n0KB37NGGI55X9u+y4ZcvuyC+qNaz4Whpe+PgJzm
 JY84+3ReEIfQkyiCH50hObnM/47yqXg=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4b3d13 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=dZunwGW3stLU1k_RaHIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA1MiBTYWx0ZWRfX5G+uf+WWoJkF
 S7GHiEhY3zavVW3YQXxcVd2iK/sUHi25TzY68Fsu5BTC7/MFRiiDo4Nc7KkaEiBlyNWs14trtDS
 5pTlWRBtB+0coF1lI8hf1DQ3mcBcSWbmu0JQ0s9/I+pegwnWFXMOL9EQW5QOj0ceWoclDK7EXf3
 qimHDc/+uZk9g7db+VvBTrgGZBd7ldIqqyuU/w6V74E1yI/i3i7IXEgdkyMb6U1V9W/9D1eHs7o
 Kkbr/wHElRWE125uFamMKdK1/NaanM2bNbpvCE8j+wtMPhzkHnduCUUyiWmR3XSLmxZtQudx26U
 rtsR04W46lEMSDApDm3X+pB8KjYA/ox+Oel7XqbjDBfHxVTreo7olzsq1q7WFE2ZJ29jCsb04o+
 iKn/9cZbxx52VyPK3PTRNTGrPiMVLuH4JFCG75ZwRsBvNGHCj6hB8F8hf5pY2ZEhZGA+eMYeZJQ
 76tA4MSQKnOE5FBVm7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060052



On 6/30/2026 7:39 PM, Konrad Dybcio wrote:
> On 6/9/26 5:02 PM, Taniya Das wrote:
>> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
>> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> Almost all of these nodes lack power-domains, meaning the
> aggregated performance state requests will not be translated
> into RPMH requests
> 

Konrad, all the clock controllers are on CX, similar to Milos and does
not have any special voltage requirement for the clock controller.
It is okay to not map the power domains here.

-- 
Thanks,
Taniya Das

