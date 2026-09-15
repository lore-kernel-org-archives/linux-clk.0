Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CC94BD782
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 11:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473032; cv=none; b=cxml11a662KvOy0ZnuoVA+CnlAm1H+ohj8YAh75veZHbela5cST4dqnoreTOP2NEUEg1Tbvq0w8kxQX57mv8uisoHJVO4RYn+CoM6hbU0tGeyIy2LvDRtWs5eUDf4GhdRca/WiejzWDUHwVieWN9VTfztulJUBwDGhJc9x4+7WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473032; c=relaxed/simple;
	bh=d8eY+N67prVKWYXmMJH5sh95clXQWjAYYw4e1bbTxVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p//vb/14a3fY1sZFNyAS25eYoL/hElL0Y7kkzUE9wI2eZH17NcQ2WHll7lzaObrXnwsrO49Q5mfCI/d7fvw6SWTypl0SpPEJQovCQeS0Vpop+db2k07TbjyBdE/LilXPoVqRCY+14EAvuRPusyRm0m57YkixciOOkiV3BmnXsY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Clx0qpw3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eh2RG6v+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Clx0qpw3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eh2RG6v+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hPv63742113
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 11:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vAnE0uUAXuxlA2XcXnWd/0pxMeNaHZsw6FNuM2AnKN4=; b=Clx0qpw3J6vrNonh
	hpv8evw1N1I392+IdDs60nMfRYSw2Z9w+udKqycwb6Jfad1LNbmm4cHY0bJL3TOU
	Uj0HAV8N802PRy/R6KEA0fkKEmALYCKj9uFBH5+XiQn/hJUwWkA7FgH6v4tbRQ4s
	oSMrGT/vcUqF0eEa6h1I6FmAkRhc3PyHKLJgTuGDoxOo+tWJwv0FLL/CYoFYgnOc
	ZVUnLf4Zgwf2V8wC2WGtWKZJTkHAmVwmj3yNZFBk/BLFn/eDcvU30F0t/02HEdhl
	lMLibdWoXikWTwc46tGNBZOaGTQkBZkOEjN+dVMeKKHpTIg0aRkAH2J8njyICx9Q
	R7EClQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux1jm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 11:50:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8688139460bso4265973b3a.0
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 04:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789473023; x=1790077823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vAnE0uUAXuxlA2XcXnWd/0pxMeNaHZsw6FNuM2AnKN4=;
        b=Eh2RG6v+QtMdj+iczzWwwxdl8RlJacYAeCrdhgI13f/0SKdDQgRry4uRWtpCS2LvlC
         7PmnQdtWUydsk1RcxLAcJZrTMNptJ10ZgYMUsWH+j8pM/fvcpy2/YPmkTlYlCMs2i4ZF
         LPQ8FeqoCJyVEvjfdg85R5b0qTnVsg/V8b8A5dG1YzYnjnucJ08bnZM7dReOYzn1Kc1K
         P/g4O/fELcxsiDaw/fflYQWPw6zBZhk6EfzkkJJH8ofcNN44nygcaFCyQkm22v3X9K9X
         jxkbLDSLZanzaQTfzASiG/wsDmgRQ//UOq09P5vOdnChwMLQNG8dUt45knYskzV94I6I
         buIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473023; x=1790077823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vAnE0uUAXuxlA2XcXnWd/0pxMeNaHZsw6FNuM2AnKN4=;
        b=Wuyu7gaMSwqi8Q4UbmdsWtZpPC8oy1L6KO29YT5qULpTD7iCPMdZGc5Hf/NNuqB56J
         RASMhTDYfL+eXcr5SEd1SjWl93UIFG1N6BMqVobqeO8fSLOPNR3/zm536os+6F2RNHX/
         BP4AAMJ4QDjKZVM7qq9GxKI67/W3VbX9IzsPP2cLd6J3mZdAydq9+pJ4wX3mxSOhIvYm
         nZU35VqYLzEg9V7Y3RovyX23U9FsIgSPWj5KhLKI5eaFB0+DOYhvgK5q2jJyjvWWqJXp
         ZLnFUTucOSUfXJVW6yjFLhY2tgcZa7ziOIz630vvvmUbD45sclzvJKCTazrzyZuc75I4
         iXzQ==
X-Forwarded-Encrypted: i=1; AKwUvByQV1bNcC35aXWbSYw/N4rxgN/d+JTIHGinekmNOv6TVoiCmgZgBgxglvr4kXN7MPwNKtWYrf0rUYs=@vger.kernel.org
X-Gm-Message-State: AFuF++kRjJLRbFisIvr/mwIx/offXcSBAHdtMrRD3xYLA/ihmGwl/z9H
	6hl3qe31VwcttFtK7hkd7d8H58psVXYWNWcIo6Y5P1VtfnbMd4Uo0vp9U7ut/C3ZqAe3ZVejc10
	SBlkzroF4AvE2GjrF+bBJPWVlOK4DhYYSH2qMpeS1Zcvrt9rWFVkhWK2koi2FHlA=
X-Gm-Gg: AYBFou0l/U6USCdS5cFHBj38QVVqptDbo4+KpN6g+YvIQIvqTE6j+jLY9oqpyhZ+7wq
	5WFDcWOzQglunBYYNTog84KPytaOKvS0l88K05iF9mXpK2Ou+dTlx82+N8ojvXCkkjs5g/jzAEQ
	DykVzzd9WiFLEcm17Faxwh3mDEK+itcITsHYwWvkafcL1nXgwvw0ClI1CuhKgqvgNEQFihsTr18
	9OGUkLdjJxVWvj7EOIVIdfncXNgpX28Xl7jn6lszWYGvcQW3nYnmXQqgzn4KDITAYHoM74EjaNY
	pXc7pYaRzZOQgs9DO+u+WWKRc+jvKFww4WY19rqrurqsO4vz3+LC1WFL/vYa2TT7033B5gHBg1P
	5eL9TRv+fZHMXchjThFNkUgR/24txibEe
X-Received: by 2002:a05:6a00:1828:b0:851:8394:1696 with SMTP id d2e1a72fcca58-86f8481eb00mr13328393b3a.12.1789473023530;
        Tue, 15 Sep 2026 04:50:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:1828:b0:851:8394:1696 with SMTP id d2e1a72fcca58-86f8481eb00mr13328323b3a.12.1789473022970;
        Tue, 15 Sep 2026 04:50:22 -0700 (PDT)
Received: from [10.249.97.198] ([27.59.63.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b5674bc2dsm6188135b3a.59.2026.09.15.04.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 04:50:22 -0700 (PDT)
Message-ID: <37ce680d-42b1-420f-b42c-1ea4aca424db@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:20:14 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: gcc-glymur: use shared ops for GCC UFS
 RCGs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-4-cdff2c67a8c2@oss.qualcomm.com>
 <46c248d9-fc74-4f3c-85b7-8b678ae3c723@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <46c248d9-fc74-4f3c-85b7-8b678ae3c723@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3MSBTYWx0ZWRfX0zYRxXry7/H0
 cx4551JhzTx5P/Whrvqp4NPyHegKKXvA2YhziiUK9+vYNPBSe955s73Gkll0rkwq+B7e0w7nCh/
 MLKrhNPbqqqmzp6j/pY3tI8IE2UPi2awXb3Ss57PjC4jtgTyoXN+87gkz2A8QIPJC6UN4LiZrsj
 psq/0/g4/FtmPe/71w5OB1WkYb8dIMqKpjFV5rSYgaWp6NdJ3mMviC24HLa9z1Cfq8v42/171el
 7gmn8qkLEARGZ8j8sr8qWJfRMbEz8xGEuQRLRJgMLUVteQfy4eHDNONolmAfMnElS9QLwtoasjY
 vXnUto7Wx0Go+wAIjQi7l7pF367mnevCDQXqKwEuL+CooAhV23xZIHN+iO7KgW+jvYAw/d3/GsN
 FmV4KiCgxayJKb7DBrj1N2r77G10ERWfemhtZ2oaJl4u4LYo50vAYd9NsVvPEe7nQ8OqWYBptzs
 +41npVg8/CZEbNs3pww==
X-Proofpoint-ORIG-GUID: BBhVZMxD17O0I83WcWmtm0dWG8w7AcQC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3MSBTYWx0ZWRfX0ddnNTIkZ9D+
 Lk3t5AHxwVYp4dgP1z7iXj+nWOjlr78mh1fqBuBjzQHeQ6ktLyQUZZl2BAHeUikp3gazE/pKEb5
 zK8+ThtODyWM+5OU/7jw7tOSyELTj20=
X-Proofpoint-GUID: BBhVZMxD17O0I83WcWmtm0dWG8w7AcQC
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa93105 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=blbtgvcJIiEadBFJWCYS5g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ZpEcStechgvjzwklZV0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150171



On 9/7/2026 1:32 PM, Konrad Dybcio wrote:
> On 9/4/26 8:50 PM, Jagadeesh Kona wrote:
>> Switch GCC UFS RCGs to shared ops so that they are safely parked at XO
>> during clk registration.
>>
>> This ensures the RCGs are connected to a valid running source clk before
>> the UFS GDSC is enabled, which is a requirement for the UFS GDSC power-on
>> sequence.
>>
>> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
> 
> Is the no_init_park variant an actual problem here? When reading back
> _CFG, is the parent preset to the UFS clock (which isn't running)?
> 
Sorry, it is not the problem, these RCGs don't have UFS clock as parent.
I have retested and realized this patch is not really required. Will drop
it in next version.

Thanks,
Jagadeesh
