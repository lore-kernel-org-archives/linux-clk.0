Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49050380FC4
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 05:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710906; cv=none; b=XWnyXx4xU5ScDzCjhqb5yLEN5j90mLP+ZdMi/b9I4ui8N/GHJ9EAgoW/F6X00a97EgTC8d6XwrBq4JS5ictWT2dgcErh6viFqkJUU/iOiSaGrkLas5pj/81wiqkCicuoFKd++MkB5Em3VmVEqPsFCB+Zl4rS0+A3DTwcr3Fbfno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710906; c=relaxed/simple;
	bh=22pHOjPwfpkrnRKqKZ6kJygTzZPaqHLMrL9gtFugfPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YaK1d7WZPAyAe3JBRcTVp3VUhQqPKzv50yGkIAyKPPt73sNoqu0aTYBEepgwlJp/6bsxhWKFUvtSryAwkNjmjFciJaY+QdwB5Ue7tS2M7OEdYPK0xVvKphQImtdpJSEMgN3iUwzTCxHxe/kVAjI2Mm6ReVRmQaIfT2tXUKkfoP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QIfMRKQu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=exLMq1dO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QIfMRKQu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="exLMq1dO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NX1N1730203
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 05:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUWOqqFdnUngv7b0SfgrBihQZEhkV7SqU9Rp01Frz64=; b=QIfMRKQuRXO++8PG
	fWWNjMJkIasrGRUI2xv+JMX3OA+bu2Avcvdr8DoXHXC5ErrhN+TIwReXHoYlCbgb
	O1jPlWRgUjBpEbUGo6wyKehII7anlO+ouqWJC/t0mSSHPVWv+FpLk/ZypEA1UWZ5
	gc+Aqmb+g2gllGjdqXRiGBYsWP7LEelcym92dEOJOSHjo/PUYI36ueHlmK7YDCKl
	9jV1kSK2ZHDad8MbF1iKeBBvNWUfb1lbzdQ5dbVN0n2duHXucAvcEIiFw5jW8ARe
	OQ5lsVljeUjX4rZi2i8wElBHlvH+P1P9soHW5TOs9/SwWmvjMN9eliGZelx4jFVa
	XdxwwQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7vgvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 05:28:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30cb5001ed8so2570105eec.1
        for <linux-clk@vger.kernel.org>; Sun, 28 Jun 2026 22:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710904; x=1783315704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TUWOqqFdnUngv7b0SfgrBihQZEhkV7SqU9Rp01Frz64=;
        b=exLMq1dOMxKmhmG8s4lwsjK1AZkWp2vM5hrtLJ/hxdzsQXB+osikRQUnGKl6xyOPA6
         4A+UpgiE4v1D77jp8YloQ/3sSh2dH1uI4E8Rj3njcxbzN1upeKHbKwx+JPZO9Nygeegu
         MJFXs7bq8W7XuKQxX2pBoXZIZpZlunyaht/hy4o3oll+gDA4xj+rL4d2+yKKplb7CHal
         PbbrKLm11G40T2cmNP5OHZbSVbAxtNHjpVxjfEpbDJMQBx6gJbH/DT/XxC22isSDwY27
         P4MS98c5sG4hQZJZU8Z+5e6BgJPZIrncwn9hIR1cFuKFZk1NTqUhTRs9Q8ye/OYzAJM/
         GEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710904; x=1783315704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUWOqqFdnUngv7b0SfgrBihQZEhkV7SqU9Rp01Frz64=;
        b=bGzBQ4mNsNRYxVNZ4kUEEd+/e85YDQxULSVsMN9aFvtNQfvwas3rgyLAePX0jiLGYe
         P/fGYURv62n1KGjm0vcAb+gDFo2i5WjughK3/lDC/ZepmHr7gNrphLuDZ00lw0DQ847Z
         53q4lst535llmvk/EerN1Fa0FJ8qVUq9zCFRsA1XLX0xhkyt8JQ9Lf3aEyjjg0HQLjnp
         Yp1Hprp9qSCBEIA4hiVdPQ6AVBOErUDR9e5q4sOwruIm7uDwzVZY+bEs9heIBWrGqkKS
         5sIWzeUHGqcB0kJRTVgIE5wqS4xhn7MGdGSfAtLLiV+VcXEZ+ztCt0qC/XnyHxSDL6lq
         GHXw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4c4CQpJPiupUD++5L8ddGpXtKyUNjUEWUUVYyVpTi+CK/B1P//kF0QDpndLjjExaN7uMUUnytxF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoyIsYyY3nD4muTp6/wi80M+pmw9AIbEeOOQqoVBljj4VmsubR
	vpyl9+l5Nh0fyi38p8vAw77I1gMur/k7/7g5u7LOWGuKVT9m7LVjgNBRhhlhP18hBXNBto7QTH2
	kxfM1bR8APEKAv5TRQxubEaBzjcBBZqSyHtDLhBUQcOTxeNASHIGWudMTSVVLe/U=
X-Gm-Gg: AfdE7cn2KMngzy/aWDMohIka2q89PYTgGMWO2ArvMzJz2dqSCk1zjwri2McUV81Ibvi
	bN+OLQUjgf3Bq1GNUxoqMSMbDic+e8O+ZrrY5aqpF0cQcDQb10LlTtGJVhy952wrEhkjBrm4qYX
	LiF0+ZG/1KcKgethMZxc146muOESr31yQqsdjwK36qEvEOZd4Ef2bU9aRsAiNEv4sBkhzmP0yg9
	Qk0ZFXeMDS/hgALBNZXqodxb5CabDVsVm6XxTXXwZga/wwDqsrEe2jX/itHo/ZUSLui3yPOoErp
	AwasQdDZbey6ETMi+/PALG710TbgLuFj53dTmYyvuLAdFLFohne8CLxgr1Ru+nP2RHl+qMof4lw
	ZvX2i4ffS32UIyd4zvDyK70kL/IhxOEt3/7COqQ==
X-Received: by 2002:a05:7301:607:b0:30d:d98d:e44e with SMTP id 5a478bee46e88-30dd99d33a1mr5658760eec.6.1782710903814;
        Sun, 28 Jun 2026 22:28:23 -0700 (PDT)
X-Received: by 2002:a05:7301:607:b0:30d:d98d:e44e with SMTP id 5a478bee46e88-30dd99d33a1mr5658728eec.6.1782710903291;
        Sun, 28 Jun 2026 22:28:23 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ec79d4746sm9558432eec.13.2026.06.28.22.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:28:22 -0700 (PDT)
Message-ID: <411ed306-e267-4a01-8b30-a1a51333f7c1@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:58:16 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra Audio
 Core Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
 <20260605-shikra-audiocorecc-v1-2-7ee6b5f2d928@oss.qualcomm.com>
 <20260608-snobbish-kakapo-of-dignity-f7bbff@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260608-snobbish-kakapo-of-dignity-f7bbff@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfX78BedqwqRarH
 /uVQl8X5TbxolcNWWRk9pWMm8g0XlQbEZ2HurniaLRGOoxk1IglCgYTuTTF/ki9E+uYlu5vot/A
 5j2q11XBmWkmR4lOFYrs+ybSBHMw+T4pTkXnJ1zjxu7wAWk0W8mf04yvlxVlaUIP5mSpepO9sxO
 ckbKEfEnuUTCnQLpfEt9Fiu7aCi+xSG4bCVXsGNfH48RTUPR7JlTgUnU40yuUlOCvXmL+pNgUS+
 2Lu3u+xSUYaFOTCU4unrKCLBEaJodWKyDA7IkzZCS3o2MXPXbu0KiMEleM0NahX5eagXg4+oSsY
 PmsvPWyRnWCaFqGmKu8slVGKXKnYC4LiLRdI0Npsh0XOPexGb/Fk+LhTx8gGTPuf/FnnnyUfQY0
 SR8lPsGjh50Q/X7ApjRJGeUTgLsH0NezW+JIQYjlqDpHxDCyogSJ0OkkaNUHxUXDJiu8B0DlzoP
 2pBo3OR+95+KgPdMn0g==
X-Proofpoint-GUID: yVuARZ15nLvv6LHXvb2Ewk33YRo2SbbF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0NCBTYWx0ZWRfX9wdA9gAnDhqZ
 2RZxQci2F/5Fu0OjPRHTlxrLOgK56RS3IKVoa2Rr0ZEvBEg+Dflv4OzDW+d59//HWy+lBxqanK3
 0ujUxxAhBQyW8xtsYDNfM1Kc5ML22LA=
X-Proofpoint-ORIG-GUID: yVuARZ15nLvv6LHXvb2Ewk33YRo2SbbF
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a420278 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=X1Vx4ul0hvcZdVy6zTYA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290044



On 08-06-2026 04:19 pm, Krzysztof Kozlowski wrote:
> On Fri, Jun 05, 2026 at 04:56:31PM +0530, Imran Shaik wrote:
>> Add device tree bindings for the Audio Core Clock Controller (AUDIOCORECC)
>> on Qualcomm Shikra SoC. The AUDIOCORECC clocks and resets support differs
>> across variants based on Audio subsystem enablement as follows:
>>
>> CQM (qcom,shikra-cqm-audiocorecc): need clocks and resets; audio on APPS
>> CQS (qcom,shikra-cqs-audiocorecc): need resets only; audio on Modem
>> IQS: no clocks/resets needed; no SoundWire codecs
>>
>> To handle these requirements, variant-specific compatibles are introduced.
> 
> No. These are the same devices. You do not get different compatibles.
> 

As Konrad suggested in DT patch, I will split the audiocorecc and 
audiocorecc_csr nodes separately as the clocks and resets reside in two 
different register spaces. This will help to handle the CQM/CQS variants 
requirements without the variant specific compatibles.

> 
> Best regards,
> Krzysztof
> 

