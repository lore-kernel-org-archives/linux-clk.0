Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418123ACA4B
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 14:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809146; cv=none; b=cOkj46HYiXDWDbL8eyJq6hSNxk2PuSxUyjlPUF91ZIghrynmNZIqLCHbBDJNvfCN7FCt+o7BLiP3vAIatUAOOcCc4a36moO1u8JqmlQ6TrClOmkExAWfZPL0OCu62ufPsGsX8/oJGCghwrTLPh/LCnPopX72xuBFacDsnAj7kAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809146; c=relaxed/simple;
	bh=zDU3nG+muSIOzIj9gCz/o3LKbW2qRCNwREdAhhe58Kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MbzRA8xa/FfKNlbY+Q9oK5s8n/PGMXdk/ZoAx8vmHsZtS/QFJitqnxWv3YfNoQ5whxlOCCtV604DeQchtDWKMALp+V09HU4r+8NiMH1rYfa7CdwKFwcBJXim8XaaprqyxWBNbZ6u9cGjGJJyIF7Fpe4UMTnsg6s5+vFVZdG7ovE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JqRY06qI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fEbQTNpq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JqRY06qI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fEbQTNpq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Bb2kx037379
	for <linux-clk@vger.kernel.org>; Fri, 6 Mar 2026 14:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SicqCEC+Cf3RXmELrJU9hVUSf0lNhpUobm3pP+KlJ8s=; b=JqRY06qIGWeVfffZ
	cyrzfrcCGyGI4SbcJvcw9tyEpnVBkRm0Wdb1HToapDV+xuOToEyfJ+q5ao5mwYI4
	iFz8P4JNVKjrP3NjTWXuzmCdEXtwxaCZ5iZ2wHXmHmVUkQg/uk3nDeWQxBTnuLiL
	LQ/Ley9oBv9R1+9wssYd2ytX/gjS/Qbe+h54lxV6+5EtdKDFX/0xzPY/rZ+77Ce5
	2EbufuGgsOs5OEAC9UW9LFpfikjT/4XzZIj85z+cHbvViyZ6dJ/epgcHE6tRyY2X
	d8sJekXhTYpW6AXEHlWtxYGxNRQBb7/KpL02ZNoLmbU53Y00dC/n0IqJOioKTx8N
	JVM1Og==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqpxdt5uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 14:59:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae47b3adacso56208305ad.3
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 06:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772809144; x=1773413944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SicqCEC+Cf3RXmELrJU9hVUSf0lNhpUobm3pP+KlJ8s=;
        b=fEbQTNpqjkFUIo4uyHkCTCBq5/xxH+QhEk4wwcFZ0MEjFlfYggiDWSHE/pedVV6cbw
         UHxizWa+ysdHpvoraWu4RG1fEfE3t7d7pPsSrFpQTFocV8AaD6YbGnkNsI2/9C0ss15K
         Bkmvn3QMIbM+ynAAn1D+n1autUyVq4yp9sDZa1HFIZggBK0iHnL/+tTMkHOUGCFi/23/
         LAYH0OG3NGwUBalR47hUh2zo77GwT3+itk21f5yxhagDl6OqTC1GbD87XvUrCfsKxeK6
         8m7a6qUk2+9ncwczVOSFUYebf5s2oL6uZOje7jPZD2gTK7qdTuxroeyZ3xBT97LP6KFy
         zMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809144; x=1773413944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SicqCEC+Cf3RXmELrJU9hVUSf0lNhpUobm3pP+KlJ8s=;
        b=lrL51bk5UAnUtd1QAhvTLWVJvz3PHRaLd4I5U44sdvgV6JWlGwOeMyZiNlCtwlUmGz
         HZ7NXXgpiuGglUYxZU6h24+MwB+59HW7xwAMGgFsB8A6z/NNXg2ZfpgBqEDwXhIJN5mi
         1NwZy253DqYE9OCv5h0N1meKDVvK9w3wY723J0EBMFVeKPPYu3/AaVeoaqNCZW7ynytH
         BFuXcpkEnaLxSQeP4nAqbpuG4trQQ35gFIfkZZGadJgt/lyctqqLeE2BUzNtZbrf+EXX
         7cAUs0Jo7x0q09RyZVR72VBzJ5vGgfcSgEenmdITLwdhEU0ncWqliTfD4XlifccbIB2i
         E5lg==
X-Forwarded-Encrypted: i=1; AJvYcCXz5Vjg6FTlIsOVvm31o/pBTKHPi1yl3XSmOUIaYxJIm3CZL+7dhn8baWyVr8opM7km+0T0KObrAqM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy1ZB1Me0s0D1UHBmJ6yzTq8u2UJmzdtMmocYQ+0asums2TAlB
	JOjgkAAs2M02Y7w8mPSs2YoXMLCoxH556snE9PnZm/QLFCQWhHyehdejK05spWUu5FyPBB3hknF
	Azs0lIbi25aahxnY9xIi+beJ/dMoZe2PzRLR1X5ke7MPBJ/YL/YSnhf/vrvNHifU=
X-Gm-Gg: ATEYQzzfprXmOHz141Em/EyMscojLr7vzPI6iopBqtSqWScC8aNx19bNm+l/o3bWTE+
	n8z+4PgHpazhHvfFg3xMdH/QZDSwSa1geONsRrj9OVmOm7CVxCfy54o84Jzewq1B59Ghc+O/grI
	2z8LRAAW+wGXgFeTIxTiZ1KLrPxtbikDqGW4b5CFXSRwnVDDMjmQeaiit+KY0XHynsTJZN/xaTy
	gfXRZRMIwWHTRb9fnwONdlGreNOdpgxfFIE7YQoqcxkrtLAdA+Gt6fKvpTJkJQQ+tQFtkLOlj4P
	JZnT+F8PNt/x585YrgWAHN9gRXhjsnIYHnBrMdjCA20SbdfITMhV+Und0Tg0InbKfUwCktNXxcJ
	rfC42LeK0TPwaEP9NVSQD2sIlPHSAaG2TVzUKN4QACJkLeRLlkXaEnmASVBjyMHPvYMS+91Ungi
	6t5Ry0jJUxiXM=
X-Received: by 2002:a17:902:d2d0:b0:2ab:3ac6:8d03 with SMTP id d9443c01a7336-2ae824f49abmr24686275ad.36.1772809143799;
        Fri, 06 Mar 2026 06:59:03 -0800 (PST)
X-Received: by 2002:a17:902:d2d0:b0:2ab:3ac6:8d03 with SMTP id d9443c01a7336-2ae824f49abmr24685995ad.36.1772809143233;
        Fri, 06 Mar 2026 06:59:03 -0800 (PST)
Received: from ?IPV6:2401:4900:88f5:81:e13b:ce78:7823:d9c3? ([2401:4900:88f5:81:e13b:ce78:7823:d9c3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f74280sm21622935ad.53.2026.03.06.06.58.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 06:59:02 -0800 (PST)
Message-ID: <5898e0da-ab69-43bc-a6e7-d492e409df91@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:28:54 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-6-dbbd2d258bd6@oss.qualcomm.com>
 <3f69539c-7383-4321-8cc6-1f5a8cc23822@kernel.org>
 <dd256b85-b88f-4163-a1e0-52c976089eae@kernel.org>
 <1a22f7e9-8a48-448c-a035-7c487e81a96e@linaro.org>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <1a22f7e9-8a48-448c-a035-7c487e81a96e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1WzTmQ2SHLeGf3bqNW5R_-fEosQiIoIl
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69aaebb8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=OE-71Kp-Uj3oNjI3yJUA:9
 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0MyBTYWx0ZWRfX+DF/FGOCpHkY
 8+M+zMzhxZkx1hFZj56ZMLYdJlCtdkiAcMYPL1x4zauA5X9tM5g4vWLqKYELojfprXX75UnvJP/
 oLbhKPQ/5VwjykMDYkQ8LdYC2f1RoBVWqPaE8lXM0NRwQwnoVxI4jUWw0g/iSOauChVA5Wynsqb
 oZUHbTyd58cez9ZhSr9VPB3XCu1EQF6vEbrWX8e/8yV1Y0k5q/n5FIuzCU1wkFtW/DPB/t5d6iC
 cynVwUraL+8zQNJBkqDE9OZEoKD2HuJZGW+1MduNg5pKz3DwxmTvPozTuDVBa1JWzyVIbl54WiV
 lpkoc3bJJKM6G9R5AXmGBxpzWAMd6MB/FYLOqWFgHupDrhurCs/wEk7DbJeYnDw4hftlg/IclJI
 B8knRsdfxBalPzBWA5934lqxHkZ19ZZccyv6UoSoO2LQcJ0NpU5W+/xsM3CrQYzGxI1QfLFSDh4
 u51nXOgmaw98LR+kfSA==
X-Proofpoint-GUID: 1WzTmQ2SHLeGf3bqNW5R_-fEosQiIoIl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060143



On 3/5/2026 6:41 PM, Bryan O'Donoghue wrote:
> On 05/03/2026 12:00, Krzysztof Kozlowski wrote:
>> Actually I checked now - all the people reviewed commit without fixes
>> tag and you just added.
> 
> Eh ...
> 
> Please don't do that with my SoB patch !
> 

Sorry, based on comments on v1, I squashed other Purwa DT patch to this
change and added fixes tag. I will drop the fixes tag in next series.

Thanks,
Jagadeesh

