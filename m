Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955E8273817
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 17:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753723808; cv=none; b=qUxnf5fLqlazuimnKAI2Y3/V21bGC9yFQK2SdEJ5gJwregmy1WHKrffmFDWZ3LaftYhA+15t+I06ceGmN8rCQpVprQCbVYU0yxar1AWeKTLuPmBE1nUxHjojLKSLmY9PWP+mh4cZCmLpzfub/R239JNskGBLeOQuSpIlThmvF8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753723808; c=relaxed/simple;
	bh=ap3iX8dO9NwUbqcsYbNIAHLFNJiaq1UkawSUvmYP/N4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cSjJk1uzG2LlU8XFOZW4a8aZVR+FejP3QFw8AkIKAldkNztBVvf+Z84+zgePH3v5dBR3ve1ONtDOrIC34/6G2h4sSPDRBN9u+0LLMp5nKgjYzDOKyPGAiqNRS1yFYWvypJrW/XFZUS5Qp/qhH6bXMbsWzfn9WOAhKTzvPO0qOLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UZASoHc+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UZASoHc+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlIQR012394
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 17:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V8baPmk3whsruPHJmlCGf4Ss9uEKzwpKHVAYUt8BpbQ=; b=UZASoHc+SxkRRfo6
	SKKnmKU9pJ6aDRSWmpmvwpPI8ca9lBgz3kd9g8gTvRnCedNho/yWlLxfhXPjdBT5
	Igaxj12C5jKaUAz+HVZZhqrb1m1RSo3G/xzVD3a0m1/c4xlbA/wmf5jSbI70PSfZ
	9kqaUPHbNe+yNLq/frlSUgQsyxbwiM4j/x+9VNPgfETUJvyibfMkwG1H0VxdXn17
	Ob66nB87QLCawt4zMdmxK/u22+G4uwkImp/B6xJ9KnafGsk8nGpcn27aCKcmQWv0
	k6AgUQKZlEeSkSg+sx/J4Qpihf0zJG76E/f+WsCy36BKeiyyVIiIZJOY+P8dk5B6
	OadqmQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qd9wbh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 17:30:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-756a4884dfcso4614224b3a.3
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 10:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753723805; x=1754328605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V8baPmk3whsruPHJmlCGf4Ss9uEKzwpKHVAYUt8BpbQ=;
        b=n+2dphQJeOYhz3cs6P157ZYL6zHK4RHO3cTEwVUxtqIIhRIU1mQq+2ZIjRoGAJa4Io
         3IgzckHelQCBD9caQ6RfKa8CAJZXdoY+qsMTAPE9vnPKGv9he0YjTm0MZIeo06dl50wJ
         eVPMnC1eGsU03LlLYAIG5GqgYzDbpsddrln/Y+ckUrRT2/66Zsct1v359qWRhc5mSGuq
         KtA26fSAEfWF2eGidPckphzXTr/cCvzFaq2w+lvUXVBO32NbMiT+B8XK9kXX5FZaGcjS
         Tt5pp2OOu5KOV7Gz+odPlO7k4ZJD10GSGUKaXheUI0yCZCEMPGXcEnNP06u497rnNYvt
         DzFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWblxbD5oxwlovu0NKygy7nfqcZ/5fLY1a3gWvi0zzdvTYxnilj+b7ypJsNGoF2pLobd4u5E6yyWfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaXvBGvpAfOqLCQvROV4SMZBhDUM/j2RX+mLBPJcolET/1mk1F
	CasjAz74nw9vWNGqd+tEwxS6vrs5FqDxUEKPCQTMxrXCvAQiaK/Q8qZxpKcKwhTFaMQxWnImjw8
	l5Y8R8AfdCsYOGo/BCN8R/FZhLaJDQGjt2DWL5dy+J1PqTtgTGUWYVX2G6wXpZ4E=
X-Gm-Gg: ASbGncsrcHXmPAz5S/fi2k6Caop/IiyQYdbXBHTXuiimzcikRp15MmCG9h7KbyIDlFL
	rUq04ejYn0okxLw1Cpv9xyH4TG8YhRTtxsnPM3cOR7Xc6Qud14epBMOOdYHVf+6cPMUoWl32A3s
	Koel0OWILENepb2mqSRG0Wqz7NExenUQSiaHpFcBItTRJqu8YQZTij7hZGxLo6SqNm7MUVV9ik5
	lG7u71pVLwmdDX6sVmLSUUclvDU6urOW5zVkGSwVq6ZevzOZPE2O32A7f2hUnXtziyB9E14WhpW
	gCFhvfh+may2zyLOqhz2AQk4NCxaQ9fk7ZPYEU8TeiTRJEH6warV0Y8V1pXlYScUwik=
X-Received: by 2002:a05:6a00:234b:b0:748:f854:b765 with SMTP id d2e1a72fcca58-76332282dc2mr19231302b3a.4.1753723804946;
        Mon, 28 Jul 2025 10:30:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE398ctDgkA+lnTPomWvP9p7KjWKywgEOmGumttdGwmmzLB7ZrDMrPxOZ4t5fZII29RkFNGnw==
X-Received: by 2002:a05:6a00:234b:b0:748:f854:b765 with SMTP id d2e1a72fcca58-76332282dc2mr19231256b3a.4.1753723804457;
        Mon, 28 Jul 2025 10:30:04 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.31.18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76419d84234sm5910216b3a.57.2025.07.28.10.30.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 10:30:03 -0700 (PDT)
Message-ID: <0e160d91-3768-4fd7-b9d9-3c12af329fdf@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 22:59:58 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] dt-bindings: clock: qcom: document the Glymur
 Global Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com>
 <20250724-glymur_clock_controllers-v2-6-ab95c07002b4@oss.qualcomm.com>
 <20250725-incredible-nippy-sloth-67a31e@kuoka>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250725-incredible-nippy-sloth-67a31e@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4jViEXpTN_-2mp85DTWXFIOVzdsK7UaC
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=6887b39e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=6kochd2Oe038OFj2Hkel3A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=DXtIfFKq8Z6Mi1RCEtQA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 4jViEXpTN_-2mp85DTWXFIOVzdsK7UaC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEyNyBTYWx0ZWRfX6v9kZ6gHXs92
 JJUqrzJkqKOucpBelhjlddPuSI4R+UmqE1EYbkhhzKekm+ssuCElimYpq2lXIiIjZP2q435jLjm
 2ei4n8rKVYlKjnKn29rRTKt7s5Bg/psTOJmznRT5T0lKNJFXyqzaYEg7bYFmzjoCUQiTnOvOZ78
 c0uEgtZUviwUE+PtV4rmhT4i0d7TxyfjQ5adjQsh3tH4mLbDDFNjLvRdko87ry5YbrBuT9e1ESb
 UYFEd/5fke9evtCNDhb+wV7kdsTNKh24hw2S+1Q574OYORy6TGpFOliEwj//hB450HE/zbiab/F
 Kows/+yqd93+fjplzE9Rc+uQQTwSmy+OpA3Z55k4uwUZ4WxlOEzx7Qs0azkXqKDt0RfwrE5h4TW
 SInYA7eKSlNzZ13MvoZeSs12p9Zn24QZYSL6fj2fpzK1bAmfNUU1AFongFmhIYwS8N3lasvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=970 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280127



On 7/25/2025 1:15 PM, Krzysztof Kozlowski wrote:
> On Thu, Jul 24, 2025 at 02:59:14PM +0530, Taniya Das wrote:
>> Add device tree bindings for the Glymur Global Clock Controller to provide
>> a standardized way of describing the clock controller's properties and
>> behavior.
> 
> That's not a correct reason to add bindings. Why would we care about
> standardized way of describing clock controller properties for Glymur?
> 
> No, explain what is the hardware you are here documenting.

Yes, will fix in the next patch.

-- 
Thanks,
Taniya Das

