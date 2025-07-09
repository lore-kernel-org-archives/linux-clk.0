Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AEE28C849
	for <linux-clk@vger.kernel.org>; Wed,  9 Jul 2025 10:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752056670; cv=none; b=UOwT088TMFpe3EMhkUlVDwo5NGiZcuf7ocPxDp963D2Ol8MVpxaQRSB1zvqBL2Jhj+OBNVA6AYUMgaZjYC0aSN8FoBJNmOx9QeI4QbF+fI3yhufcgOG8yYM1kKbTWOshVgYx0FNrKZc1Flz91r8dLcXP5Y2EWYEeQqIppom6Ztg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752056670; c=relaxed/simple;
	bh=iVry2JyCcu7AKZu9v6f1maMzGydag0Qd+QdMuPJxkYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOkOfoHDy7z50aDaegT97ds/ubNvZvDuFapT4bKp1cNkbUdg/C1mK8u+RGhWTZW/DO3fjmCFPp8+67JfmnXG04U623tri4+L44jRBBHJ5nfuUhmF2cu48r0RIS4Iiq0wQeyseB9BO2vWiu41JP4+kKJjn0GmS8zTaDN8Ch1F/hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YPoi1nFI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YPoi1nFI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5699tVGs025804
	for <linux-clk@vger.kernel.org>; Wed, 9 Jul 2025 10:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lNUtv6pJqxHYa2M0wcQ+2mlhPMafKCL2RFFU3mc+cMI=; b=YPoi1nFIbFqIu8JK
	fZdB2dgP6zTl5p0Dcl94+SdTyeTH/IJvPubDgnJx/fJ1Sxd9krpI7V1ajGC3Fmn3
	pVUxHfGcZxsD7KKIr7WvDb4Z+SEsr/8bKzzkx1IDjMCHnqJT2MP0f4ZkPm3zC2ud
	3JwZNUbowNkHTDQDnxN652RlIViHCHvapnB0XeFmxjKL1quxt1fgiUMJ9NICBRbu
	IMkE/EgAEGNX79h6s5XOBvFfhXITYpZEB02yBbDqpjt0TIVVnb836pV3AGYZzQ/o
	VK7QudGzBF11exzHlc/3IZ2m7esRdOOl3pksFFy7lHAz3BaEkx7MXaa0GNGHZl/A
	UmM7Bw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvefkxvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 09 Jul 2025 10:24:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a9bcdc73c0so7477591cf.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Jul 2025 03:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752056667; x=1752661467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lNUtv6pJqxHYa2M0wcQ+2mlhPMafKCL2RFFU3mc+cMI=;
        b=cesxYKXJwNX2Cx5j6sbCEkY4JU+fonXnBYbNWi2JtPEvdZnFSTtdsP82L9Yajg/LYH
         Qa/CV6dz0KPn12bMFyBf/g8aOC5FbTwtnzCwOfpiNcfjlNF8Yy9+qGTD6eytUONmpA3T
         vwlMehlBUMDxuv+AGesZOQSPo7WA+Q7I0zlm1FebPvmDODZoPt21aWHVkDWzKVW1S7H4
         AZAbCRisBXvHV9gv8RH3bWLsE67p3uBSB6lH02aLxLWM2uK9BNxRvWMkNHnJ/vaHi0ID
         oU1vjbZpUiqiK0PxhpnFtBS/zEuxC9H2Uo/E91zkah7B8SYaJtdLsvbglqbXcb8UVpQV
         6KMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1U487kXG0sllsQ34pFm4boyo2W6l3cjUxntcTaQX0ts38RaNzRGxK/GOfH5kn2ZKOuUyaqnS3Pzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBLnwObAUMcDLM6603l1yDPIBxnEnNFRoGrbhJUYZYtRkDVG2X
	TCVMwhjbBrRc84f3nLpoepQJ49X+DOrYetZKnZJtmni56HcpHIOQuy7htIkulWFpEjFikrOZf7E
	uKmFrRw/po/Dk039Nb3T2rIicWzaRl2xcUZ9uS/SH8peh/AFFLkoGH9hEJ9Mk73Y=
X-Gm-Gg: ASbGncswTy0twUxBSCUPWydabptkx4kNGjTg/b4pfWoSEui1tgvrRjGPghcclpGwjxU
	FeT7cmdcHRU2AsjAUpj7KmTCGbRh8zxgdCL4VFF9evl6+4T4e63Pfg/WJ5NcWf8cOwWRh3+XxMo
	bX1zcYfYimfZSXtWdmPK756Qeccuo9CF2NS55Qu78fZ2FugiTQeo+GJfAcPznsGPJBn6uKwtMKn
	GPrcvod+4WWYml5CYWWHTx1x/KEe9d0zd+SrTN34hPwhFxu0JfA72Rw4ycPMhVcYvWB3uR7TC61
	xL/dZk7AA76GsCgULNQrl6NhBdWGM4aRdkUBLD9rp688x+8bTBJdZWaGi5V6oaUG1g04jLyTFN3
	54Eg=
X-Received: by 2002:a05:620a:2b8a:b0:7d3:e9b7:7121 with SMTP id af79cd13be357-7db7db75713mr93682785a.12.1752056667163;
        Wed, 09 Jul 2025 03:24:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEREjGHO7hyySUVs4E462k9QGMOzS+RTEfsdDUihtz+3BINf+Xle9j6Glc7VDw6cWwpuUeoBQ==
X-Received: by 2002:a05:620a:2b8a:b0:7d3:e9b7:7121 with SMTP id af79cd13be357-7db7db75713mr93680185a.12.1752056666658;
        Wed, 09 Jul 2025 03:24:26 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca6976f6sm8712648a12.20.2025.07.09.03.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 03:24:25 -0700 (PDT)
Message-ID: <950b2bf1-9d6f-4b96-8879-fd693ee68965@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 12:24:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: x1e80100: Add videocc
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
 <20250709-x1e-videocc-v2-6-ad1acf5674b4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-x1e-videocc-v2-6-ad1acf5674b4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA5MyBTYWx0ZWRfX142mjdPzBZuk
 u7DH5FIv76ZPQl5yL51t2OMedPFgemWxCagmf7QRW38vMGBGZD+mHL+qSwEHV+c0Id9NEjI3l7q
 JsIc5TT25ynUCdj2G2JVt3PsDBFAqPY55Rn04VNWOomIzFxBlcEwEEFBn9w9yDquOtiy7fZ173t
 h5VJfoJBxHdYz6xIY+edCouYoBi6UXbDh3BonmHvgx/ki5G3CUAuFwb+szSuHZ/SZSn4CECr4g/
 X0BQ1GYeFWpdTm+YDEdSU1lmybSmoVAYAL/fihAclYddOx7ipLV/L81Y90rfuWRxVvzISakGZFV
 pM715MRTkpj1M3kkf8OI2Z+0458Twgn9GzSNLa0p7UNtQ0o+Y3VaQkESbhBrPcHrZgverZyQfOD
 dGPZq26kiJFW4ilfPUkq6pyI1uzHcDTuGL9UNrXLyAkm+BlywRdg5H84uoijpc+Atniqho7O
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686e435c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=VobtZvVdalDbsM2SP8wA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: hRpCeuzTfn55HUZLrPa1rFtYRFZWQ_q1
X-Proofpoint-ORIG-GUID: hRpCeuzTfn55HUZLrPa1rFtYRFZWQ_q1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=755 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090093

On 7/9/25 12:08 PM, Stephan Gerhold wrote:
> Add the video clock controller for X1E80100, similar to sm8550.dtsi. It
> provides the needed clocks/power domains for the iris video codec.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
