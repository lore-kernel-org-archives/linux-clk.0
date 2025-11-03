Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C734F2D8DB8
	for <linux-clk@vger.kernel.org>; Mon,  3 Nov 2025 13:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762176773; cv=none; b=jbDFOHtJtBEvFu5/l8pwBMZUMuOQ6JaV85ptxrVxR6aETFc4R9mEQxs3k46x7/4sVWYIpyMMeSJozi3h7RTp49V2UeIvfe2oixfjCw/hsqtPwrg7eTgVY2lw895wAIPdpkZjS/hRuT++KhoYGFrxWKonc+zRFaYZEmFmkN4ZgR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762176773; c=relaxed/simple;
	bh=mg7SByJm97xZE/wXkQ1rmnqhs3PTduSImrl8NpJB8ZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X6Gj/Ms5oZy74HuFoFmHVVLmn+bmXs1kzg9+PHaq9neC9DQsZIzBkY+z0bl6UNNYVUQ0Um26Z2wKed+4Do0lWnqzVEBP+0/XSLsVhmp4FtglF8b9e6q6h+JlP8hXy8a4tDN+g38Tag/2ar3ZOLHq7VfVKyX+dUypXLGzn+2bDUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2fp99AM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EBywEpP+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2fp99AM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBywEpP+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A39AHpX1507187
	for <linux-clk@vger.kernel.org>; Mon, 3 Nov 2025 13:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIyw5i9qviVdqzlYyIMTMo7lUxL9keKbptlFRLiNMjc=; b=i2fp99AM+6Tv0AMj
	9kTFkiC49jvRKpQLndVLSSTAItiAxHYIBtFc1OyyKD77BlccMOsOZwMgtw+IfVik
	j1KVqdOfMCyyEmu7/YT8WMSm/qnPOre+EDJSBXvfFeiugAHF07MiLAVpiWLzqlOI
	DwuDvaUHP8qKv+ozrlt9TFKkuJSBCMZMBIMpqnn9kzrBWX3cUHTthtI7iaMBAwpW
	Uke5LKlZQ0EwYtVNUCzbFuHk/QKjRRE/G5nTyPUBUiJmwFm+J1Qzxs+Mh8IOJ7un
	Bc+nPJxjFActRowTFdjY7EC4ahzVDBJ4EqPv9WqrW2R/U7++WEHMZmri+BRdaOxk
	XlyYUw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ak8mr8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 03 Nov 2025 13:32:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ecf8fad13dso7887711cf.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Nov 2025 05:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762176770; x=1762781570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BIyw5i9qviVdqzlYyIMTMo7lUxL9keKbptlFRLiNMjc=;
        b=EBywEpP+t1samnaBDKfT46dVU4IhGDURs0lLdSp0x8N54sIhMxufNmZ6jW4dF/RF2x
         edLfYC+nmIg3GiTN7VVEr0DCO9W85HxV7S06xtuIyBgT6rPxdUxvEwVLVWjTeOe4loOp
         SFShenVncKdWjiEggP1thrF22V1cRII2uWDAN948W0YFpchNyuQtBR4o4ZpxpX5/9ebb
         rxqSqazDNB5qxsghlEdQUzvIVA9tDX9FSSOBndrORYCEdWh+ALmb53oeEBqtWeYvpUwS
         TH5uyBPCXY78IJrHmM6YfQJqDS2FAQWYoQSYF+fRd+Jy3fMKGB8JB9RNLKVVNxm+AfMK
         iIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762176770; x=1762781570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BIyw5i9qviVdqzlYyIMTMo7lUxL9keKbptlFRLiNMjc=;
        b=CpJ2EZHQgUorq6Sw4qTm4ogmEZxZA1okj60+44V+60g1IUoTi0WiN5r5vH4eG1Nask
         ajHNBEe+MOP0e5DGAvmVrEQ11lvAxKE6UAgTrCKcgHOg6wwLvw/xBARl/wpbiDZ1JTTS
         VQlUf+T6DCzTikQwldFTu76uMQ+oJB/N3tAecsle+BOtqPyMhtV6MI0IxKbv1LMrgC6K
         4+FgOrXYJd65QO/q2gBrTZaF94tCY47wdt5RQNpnZ0+8bvilD7w1l+OZjyQWUnchYsbM
         b1aF4g3xqNZ1GsI1vmv7A9suIQUFRkM2b3Hju92jitA7XViIhOm5R2z03LXU04o8WzAi
         XUPw==
X-Forwarded-Encrypted: i=1; AJvYcCVs2nO+/VJVZ1uVs58geyl45273wxKT1orMyCvJTenE+59Oywz62HTY45bCDEfVkGO6igC6I2/ykUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwx6DIoH8mlI3I7mDKzCRnaKhhG6GP6rRNlPFAgqWeWG4/jRGU
	DN0ysegjRI9KMCovNmF1iMDyN0+P4JP8EYn6rxMj4wl2Pxgqbnssro/5cwo/OCGyNUaGnwQxg52
	HsT+WQ8Xkkj47hvT7D8Z8DERdm0t0TfJLRUBh3ezX8rBNFmJVWTvZ/q4CTejn5zw=
X-Gm-Gg: ASbGnctVmrbCTDMkZqSrPRcmz7g+oV08QUYmpdbCkG8fvhkmd/ULMf6c7ccs+0S8OEj
	t/maYrVvstE3rb3l94ksUiSGw8AvPXx7F8e/UFxO+P6HY3zRpUUz5OqJ0pT3w3vD8voXnT3sYiv
	kp7Ctrk+nJ3AGSySP8wqfvkE1GU9iLPZ5ksrovjrqbG2+xlAK3ZAuoPeJjTs1gZefCj8m15R2XJ
	84+mfpS/P1arwAN5ZQezhDeq0g7UU2fPi8hI+MT2OxvVGxfrq+1oaP/Omznt4ZxD5RR4EU+COKA
	ZZ32As9gsbwQ40dRrmfIO1WBysXSsxOZIWLCXQiPXDfNJgeR0kqEJJc/6ZfkAq6YkelzKHq3GjQ
	tV+qGqYfBkLVWTxhajUKC98FmI1dF+hJwJ2kVX5+sWSurmYJ1AA88sfnl
X-Received: by 2002:a05:622a:1649:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4ed30f7af4cmr106303221cf.9.1762176770041;
        Mon, 03 Nov 2025 05:32:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEARl4356Q+2Zi/1x+agQ2KP3My3PdqzDEFeuGS3FcOWXSR2Dn/DSniysgJ/5j+YoE1zUxc+A==
X-Received: by 2002:a05:622a:1649:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4ed30f7af4cmr106302941cf.9.1762176769506;
        Mon, 03 Nov 2025 05:32:49 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70abbb6106sm537864066b.67.2025.11.03.05.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 05:32:48 -0800 (PST)
Message-ID: <0c409660-dd67-48e3-961f-6eeeec11074f@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 14:32:46 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] clk: qcom: Add support for Global clock controller
 on Kaanapali
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
 <20251030-gcc_kaanapali-v2-v2-6-a774a587af6f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251030-gcc_kaanapali-v2-v2-6-a774a587af6f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kKI8DLrv-HKkOguK3ePTKxUWCLboKTSD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEyMyBTYWx0ZWRfX9gbuUkd6BK2L
 QSWPpOLnxOk0rpi+qM4OOF8MVQDop91FoBgX2MXssZ4Dpi1VwKKGMt9g46xzA/2yiBtfaR+bMrb
 uPIYYwDFQjlCDK58GZA/C4Js+2fgw9Q+tQOF4oi6y2GiFw7f+J4na9XJFVnY6caeHlJKM0u+gMV
 v3ITtfuAYomB0IJbaLAH+teyG2a9fgwRc31i6lBWcvyMsjMYqp3kdQTBAnhn1WMp0eOvzMg9u0f
 7+HSL0yJy/tns4Q/xf2zLO01ft7NlSQEEzjlCr9VA+TFa61BoKSXttKD+gdocxdvPE8ntU73R1V
 VCZ/aW8RraxWkmX07knXnfnZXZlwGq/01fJ7rBv5JqOCqtsRql+24bM5/IR8wOe3l16g0HEO6a+
 fIjuXVrZ4HJXIHJEbMO/9E5HemcqRQ==
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=6908af02 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JX4wz1K3SFr7njo99sgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: kKI8DLrv-HKkOguK3ePTKxUWCLboKTSD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030123

On 10/30/25 12:09 PM, Taniya Das wrote:
> Add support for Global clock controller for Kaanapali Qualcomm SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
