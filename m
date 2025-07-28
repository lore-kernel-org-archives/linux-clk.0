Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7719D275B1E
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 17:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753723779; cv=none; b=MyfLiNTZJFmwVmFvUJ03acnzjg48CQ06xGzlpXOiw/+zEf2vbZ6h2unfZbMfFihs74WlxZcpnNRo5DXxrnX1TsadF+UM4N8yr2WoRv0UsJqKlfHAtBFucWymLyujN1aPwhpp2Bd/5bDxIQXqUuoTiNNYIeeuW22v9nO/NIk/dmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753723779; c=relaxed/simple;
	bh=28otr1PWkOxwqfxwLLylhjzkns3AMN2v2kaXHqkXC2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TVQ5y6hfZWZbLoiL+FP8qpRo96MCj9IMGw9/gbw2BohJkGmr/rQc//4hrw3iSxJTjIGAQmNtWRtCx3ryoypPdJL5llWrCZ8VLgFjaaxIGBsWOEwtzIvOrd01nBMdX4YchItkzSkKt6fvtDCCXb+nZ6OlfhBX8+cQW/E1KMwQiNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ndKoGrrT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ndKoGrrT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlNcj023477
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 17:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	psaO0fhsKdZfRWyiSo8tAjmdJAZtx/Aq71yeJdW+1SU=; b=ndKoGrrTK4M7C3OK
	pJsr0X1o6iGXLpLdHSJMYA3nNmPMVy8YnfWcKsI0V24n8mRJ30912LCJ68cySYTA
	hfPm65aTNTTuYz4nCCQxJOMPy0k4FFTnNO6HsayVQT0wM8jz3cNItEyY5QZXP9Aq
	m6RXERo6e5UHBvGsmQcXeDtYn9NPlo+9anT9DJ5jzbKHnkoKJEQ8f2NPA/8BQR2f
	xAQDzWymlbnEoh7tvRyoLvSiUxLZx502nms9tzSHpOCnNN01lPqwdcpUFp0HtBmv
	n0dYC7pn2qe+tMIEQFxq1nMPi8UWO7Gv61+tIiWsbqKTGaKtDGdPjeLbUWZlKkZl
	5krA8g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qnam4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 17:29:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3132c1942a1so7045479a91.2
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 10:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753723771; x=1754328571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=psaO0fhsKdZfRWyiSo8tAjmdJAZtx/Aq71yeJdW+1SU=;
        b=Fl/pUCAt1QgVbkB8gfOlPfUcVq2357q8Y44nuJJAYMTykvlxakc1idrsr5Crrd8cmf
         CdvZKM9fyDvP9Y6LUpySM9boVRE7d1htUNlpMBkbgEgfA/4uu61y0S1hduSH8CXN0tUh
         B7zwbFRIB3ZewGXYMBu9OXeeNTSKt8FHZJ7EUYrfk+UCWlhz77bJLT/8jHSD6jz8XOPW
         caZr1zo7jdjrd1+q7uW/Yyg8xJXEcCn/xT0ceGNuaqIzVqDAKUtCaJvkwOODcTWgcFkS
         RgfD984xf6pjcLtjlrq31TuRrJUOZACdvl21QV0p3P1JeRh6QReVjXopiR5zbgo3rBj3
         1VtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL5LbMuE5VKEI1xn4Q0I/F0M316J38C7b7bYhIlu53FxmFXUievhqTcPXKmevQNX7ILwaHx2QghX0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb36dx2nrWBeXXclpAW9YIkg8Qr7NtN52GoS0TxopF91ZuaAv5
	rliz7htlEgQOAakKDr4+Oyd/2mwb0xq1i4O9kVyGNzdp20vDQ3frcbauy8gBW3rfcS4gGtoSxkG
	UP9XgeyyvSHUj+J48A3rv4TBqImW2NPzBq9Inv6hqdxuFSor1KOWmpJjI2UMDzSc=
X-Gm-Gg: ASbGncuiHcUt4l3czbrloFZ+Jm9YpiRfGhRntcwn11dPgDWOBl9gy4vcBDmZSMmHIy8
	tZbZRqvWtZ+k4OKcHZ0di+sZVS/0zqAr+kNOaD74Hru6MARqwixJ2VDdUfdRD7xyJCPlLwbTfk6
	UDgsSuYU9rG24ILfB9empsovQTypk3iWNqEkXsmsgfh1lPFdsFUEkNyI9FHYuERPq4YrbNAehEl
	S8fXMlrFK5PC8Gt2f2/l5ZJRt/sJ8krr95jQP6PM05HyR5Zr44b8nl2M3gIbf4rdM3uf8QlWyhr
	/J4DAqhUx6EyCV8PnWSXbP3ZD5F9bgP9f382XfEl8RNlSUPgNa42GfCDEQf5l8yJBXY=
X-Received: by 2002:a17:90b:5830:b0:312:e731:5a66 with SMTP id 98e67ed59e1d1-31e77a09df5mr14812100a91.3.1753723771407;
        Mon, 28 Jul 2025 10:29:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2TlcuOoZ/w9fSJKReXr19wg4i7BNBJ46J1r389MBi3VQRREXKv6EbL1QihQHnNxN6OtEqmw==
X-Received: by 2002:a17:90b:5830:b0:312:e731:5a66 with SMTP id 98e67ed59e1d1-31e77a09df5mr14812056a91.3.1753723770840;
        Mon, 28 Jul 2025 10:29:30 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.31.18])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e663a71fbsm10033869a91.35.2025.07.28.10.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 10:29:30 -0700 (PDT)
Message-ID: <713d1c82-6c48-484a-9995-2d7311cbf2fb@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 22:59:24 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: qcom: Document the Glymur TCSR
 Clock Controller
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
 <20250724-glymur_clock_controllers-v2-2-ab95c07002b4@oss.qualcomm.com>
 <20250725-chubby-spiked-tanuki-eefcd9@kuoka>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250725-chubby-spiked-tanuki-eefcd9@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEyNyBTYWx0ZWRfX9v8unhPqbupd
 HsTKlukeTdktHtOFFkBgwmvxF8MBmU4iFt9SDfRAFj1w+EIzTemak9AJECvUlt5zMOuBhnYLpLF
 J6oQA+7nyKMsTNasMjsokaCqeFYaXDTkSzX6vuJ6AzYi71U56NSFtR7RafY0FHODX3WKBmCkIq7
 qGV6o1+d4not2zPSYo9W8lzixoMV2U3teCVchu+vT0o2i6PoRqbBnv932IQByTgZAPdK4WTqxsp
 WCUxw8hTlR7cL7bnWI7g1PvTWC8tfS3Ih5pROgIW8jTCkFKpfNcNs9LmxVFtDk849V70edyMhLr
 HpwekFuOX+y8YM4w/QLDijT3+q1crQQDZ9t5tOvGKDUmFYj67+5TSsrKmELQmnUSiLrX8KxxvqP
 cXMxzW4PRAA4s61iVEh65WljgqYkhE6T3tZRvEN6VE+UCrRdidzRmMhshnid03j3A4GkKb1h
X-Proofpoint-ORIG-GUID: YiqnJLQjBgEexrW3-RT_dZNI3Ub16TE_
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=6887b37c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6kochd2Oe038OFj2Hkel3A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=_CRzW6w8_PcMKYmKewAA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: YiqnJLQjBgEexrW3-RT_dZNI3Ub16TE_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=979 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280127



On 7/25/2025 1:19 PM, Krzysztof Kozlowski wrote:
> On Thu, Jul 24, 2025 at 02:59:10PM +0530, Taniya Das wrote:
>> Add documentation to support the Glymur Clock Controller, which is
> 
> What is "Glymur Clock Controller"? GCC? But this is TCSR? Please write
> accurate commit messages.
> 
>> necessary to provide a complete description of the clock control module.
> 
> That's redundant, just describe the hardware.
> 
Sure, will fix in the next patch.

-- 
Thanks,
Taniya Das

